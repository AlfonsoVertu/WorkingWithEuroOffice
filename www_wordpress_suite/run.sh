#!/usr/bin/env bash
set -e

OPTIONS_FILE="/data/options.json"

json_get() {
    jq -r "$1" "$OPTIONS_FILE"
}

# Read options from HA config
USE_INTERNAL_DB=$(json_get '.use_internal_db')
DB_HOST=$(json_get '.db_host')
DB_NAME=$(json_get '.db_name')
DB_USER=$(json_get '.db_user')
DB_PASS=$(json_get '.db_pass')
WP_DOMAIN=$(json_get '.wp_domain')
WP_TITLE=$(json_get '.wp_site_title')
WP_ADMIN=$(json_get '.wp_admin_user')
WP_PASS=$(json_get '.wp_admin_password')
WP_EMAIL=$(json_get '.wp_admin_email')

WP_PATH="/var/www/html"

echo "Starting WWW WordPress Suite..."

# Handle Internal MariaDB
if [ "$USE_INTERNAL_DB" = "true" ]; then
    DB_HOST="127.0.0.1"
    MYSQL_DATA_DIR="/data/mysql"

    if [ ! -d "$MYSQL_DATA_DIR/mysql" ]; then
        echo "Initializing MariaDB in $MYSQL_DATA_DIR..."
        mysql_install_db --user=mysql --datadir="$MYSQL_DATA_DIR" > /dev/null
    fi

    echo "Preparing MariaDB socket directory..."
    mkdir -p /run/mysqld
    chown mysql:mysql /run/mysqld

    echo "Starting internal MariaDB server..."
    mariadbd --user=mysql --datadir="$MYSQL_DATA_DIR" --bind-address=127.0.0.1 --port=3306 --skip-networking=0 &
    MARIADB_PID=$!

    echo "Waiting for internal MariaDB to be ready..."
    until mysqladmin ping --silent; do
        sleep 2
    done

    # Provision DB and User
    echo "Provisioning internal database '$DB_NAME' and user '$DB_USER'..."
    mysql -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
    mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
    mysql -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';"
    mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'127.0.0.1' IDENTIFIED BY '$DB_PASS';"
    mysql -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'127.0.0.1';"
    mysql -e "FLUSH PRIVILEGES;"
fi

# Configure Apache for WordPress
echo "Configuring Apache for WordPress..."

# Redirect Apache logs to container stdout/stderr
mkdir -p /var/log/apache2
ln -sf /proc/1/fd/1 /var/log/apache2/access.log
ln -sf /proc/1/fd/2 /var/log/apache2/error.log

# Set DocumentRoot to WordPress path
sed -i "s|DocumentRoot \"/var/www/localhost/htdocs\"|DocumentRoot \"${WP_PATH}\"|g" /etc/apache2/httpd.conf
sed -i "s|<Directory \"/var/www/localhost/htdocs\">|<Directory \"${WP_PATH}\">|g" /etc/apache2/httpd.conf

# Enable .htaccess and index.php
sed -i "s|AllowOverride None|AllowOverride All|g" /etc/apache2/httpd.conf
sed -i "s|DirectoryIndex index.html|DirectoryIndex index.php index.html|g" /etc/apache2/httpd.conf

# Fix directory permissions: replace "Require all denied" with "Require all granted"
sed -i 's/Require all denied/Require all granted/g' /etc/apache2/httpd.conf

# Enable mod_rewrite
sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/' /etc/apache2/httpd.conf

# Ensure PHP module is loaded
if ! grep -q "LoadModule php_module" /etc/apache2/httpd.conf; then
    echo "LoadModule php_module modules/libphp.so" >> /etc/apache2/httpd.conf
    echo "AddHandler php-script .php" >> /etc/apache2/httpd.conf
fi

# Point ErrorLog and CustomLog to our symlinks
sed -i 's|ErrorLog logs/error.log|ErrorLog /var/log/apache2/error.log|' /etc/apache2/httpd.conf
sed -i 's|CustomLog logs/access.log|CustomLog /var/log/apache2/access.log|' /etc/apache2/httpd.conf

# Ensure ServerName is set to suppress warnings
echo "ServerName localhost" >> /etc/apache2/httpd.conf

echo "Apache configuration complete."

# Start Apache
echo "Starting Apache server..."
httpd -D FOREGROUND &
APACHE_PID=$!

# Wait for DB (If external, wait for it; if internal, we already waited)
if [ "$USE_INTERNAL_DB" != "true" ]; then
    echo "Waiting for external database at ${DB_HOST}..."
    until mysqladmin ping -h "${DB_HOST}" -u "${DB_USER}" -p"${DB_PASS}" --silent 2>/dev/null; do
        sleep 3
    done
fi

# Download WordPress core if not present
if [ ! -f "${WP_PATH}/wp-login.php" ]; then
    echo "Downloading WordPress core..."
    wp core download --path="${WP_PATH}" --allow-root --quiet

    echo "Configuring WordPress..."
    # Create wp-config.php with reverse proxy support
    wp config create \
        --path="${WP_PATH}" \
        --dbname="${DB_NAME}" \
        --dbuser="${DB_USER}" \
        --dbpass="${DB_PASS}" \
        --dbhost="${DB_HOST}" \
        --allow-root --quiet

    # Add reverse proxy and dynamic URL support to wp-config.php
    # Insert before the "That's all" line
    sed -i "/That's all, stop editing/i\\
/** Reverse proxy HTTPS detection */\\
if (isset(\\\$_SERVER['HTTP_X_FORWARDED_PROTO']) \&\& \\\$_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {\\
    \\\$_SERVER['HTTPS'] = 'on';\\
}\\
/** Dynamic site URL based on request */\\
define('WP_HOME', (isset(\\\$_SERVER['HTTPS']) \&\& \\\$_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://') . \\\$_SERVER['HTTP_HOST']);\\
define('WP_SITEURL', (isset(\\\$_SERVER['HTTPS']) \&\& \\\$_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://') . \\\$_SERVER['HTTP_HOST']);" "${WP_PATH}/wp-config.php"

    echo "Installing WordPress..."
    wp core install \
        --path="${WP_PATH}" \
        --url="https://${WP_DOMAIN}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN}" \
        --admin_password="${WP_PASS}" \
        --admin_email="${WP_EMAIL}" \
        --skip-email \
        --allow-root --quiet

    # Copy all preloaded plugins
    echo "Installing pre-loaded plugins..."
    if [ -d "/var/www/html/wp-content/plugins-preloaded" ]; then
        cp -rn /var/www/html/wp-content/plugins-preloaded/. "${WP_PATH}/wp-content/plugins/"
    fi

    echo "WordPress Suite ready. Plugins installed — activate from WP Admin."
else
    echo "WordPress already installed, ensuring wp-config.php has proxy support..."
    # On subsequent startups, ensure proxy support is present
    if ! grep -q "HTTP_X_FORWARDED_PROTO" "${WP_PATH}/wp-config.php"; then
        sed -i "/That's all, stop editing/i\\
/** Reverse proxy HTTPS detection */\\
if (isset(\\\$_SERVER['HTTP_X_FORWARDED_PROTO']) \&\& \\\$_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {\\
    \\\$_SERVER['HTTPS'] = 'on';\\
}\\
/** Dynamic site URL based on request */\\
define('WP_HOME', (isset(\\\$_SERVER['HTTPS']) \&\& \\\$_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://') . \\\$_SERVER['HTTP_HOST']);\\
define('WP_SITEURL', (isset(\\\$_SERVER['HTTPS']) \&\& \\\$_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://') . \\\$_SERVER['HTTP_HOST']);" "${WP_PATH}/wp-config.php"
    fi
fi

# Monitor processes
echo "Processes running. Monitoring..."
if [ -n "$MARIADB_PID" ]; then
    wait -n $MARIADB_PID $APACHE_PID
else
    wait $APACHE_PID
fi

#!/usr/bin/env bash
set -euo pipefail

OPTIONS_FILE="/data/options.json"
WP_PATH="/var/www/html"

if [[ ! -f "$OPTIONS_FILE" ]]; then
  echo "[VW Gateway] options.json non trovato in $OPTIONS_FILE"
  exit 1
fi

json_get() {
  jq -r "$1" "$OPTIONS_FILE"
}

escape_php_single() {
  printf "%s" "$1" | sed "s/'/'\\\\''/g"
}

DB_HOST="$(json_get '.db_host')"
DB_NAME="$(json_get '.db_name')"
DB_USER="$(json_get '.db_user')"
DB_PASS="$(json_get '.db_pass')"

WP_DOMAIN="$(json_get '.wp_domain')"

if [ "$WP_DOMAIN" = "localhost" ] || [ "$WP_DOMAIN" = "127.0.0.1" ]; then
    WP_HOME="http://${WP_DOMAIN}"
    WP_SITEURL="http://${WP_DOMAIN}"
else
    WP_HOME="https://${WP_DOMAIN}"
    WP_SITEURL="https://${WP_DOMAIN}"
fi

WP_SITE_TITLE="$(json_get '.wp_site_title')"
WP_ADMIN_USER="$(json_get '.wp_admin_user')"
WP_ADMIN_PASSWORD="$(json_get '.wp_admin_password')"
WP_ADMIN_EMAIL="$(json_get '.wp_admin_email')"

HA_AUTH_MODE="$(json_get '.ha_auth_mode')"
HA_URL="$(json_get '.ha_url')"
HA_LONG_LIVED_TOKEN="$(json_get '.ha_long_lived_token // ""')"
VWGK_API_KEY="$(json_get '.vwgk_api_key')"

mkdir -p "$WP_PATH"

if [[ ! -f "$WP_PATH/index.php" || ! -f "$WP_PATH/wp-includes/version.php" ]]; then
  echo "[VW Gateway] Copio i file core di WordPress..."
  tar -C /usr/src/wordpress -cf - . | tar -C "$WP_PATH" -xf -
fi

if [[ ! -f "$WP_PATH/wp-config.php" ]]; then
  echo "[VW Gateway] Genero wp-config.php..."
  AUTH_KEY="$(openssl rand -base64 48 | tr -d '\n')"
  SECURE_AUTH_KEY="$(openssl rand -base64 48 | tr -d '\n')"
  LOGGED_IN_KEY="$(openssl rand -base64 48 | tr -d '\n')"
  NONCE_KEY="$(openssl rand -base64 48 | tr -d '\n')"
  AUTH_SALT="$(openssl rand -base64 48 | tr -d '\n')"
  SECURE_AUTH_SALT="$(openssl rand -base64 48 | tr -d '\n')"
  LOGGED_IN_SALT="$(openssl rand -base64 48 | tr -d '\n')"
  NONCE_SALT="$(openssl rand -base64 48 | tr -d '\n')"

  DB_HOST_ESCAPED="$(escape_php_single "$DB_HOST")"
  DB_NAME_ESCAPED="$(escape_php_single "$DB_NAME")"
  DB_USER_ESCAPED="$(escape_php_single "$DB_USER")"
  DB_PASS_ESCAPED="$(escape_php_single "$DB_PASS")"
  WP_HOME_ESCAPED="$(escape_php_single "$WP_HOME")"
  WP_SITEURL_ESCAPED="$(escape_php_single "$WP_SITEURL")"

  cat > "$WP_PATH/wp-config.php" <<EOF
<?php
define('DB_NAME', '${DB_NAME_ESCAPED}');
define('DB_USER', '${DB_USER_ESCAPED}');
define('DB_PASSWORD', '${DB_PASS_ESCAPED}');
define('DB_HOST', '${DB_HOST_ESCAPED}');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

define('AUTH_KEY',         '${AUTH_KEY}');
define('SECURE_AUTH_KEY',  '${SECURE_AUTH_KEY}');
define('LOGGED_IN_KEY',    '${LOGGED_IN_KEY}');
define('NONCE_KEY',        '${NONCE_KEY}');
define('AUTH_SALT',        '${AUTH_SALT}');
define('SECURE_AUTH_SALT', '${SECURE_AUTH_SALT}');
define('LOGGED_IN_SALT',   '${LOGGED_IN_SALT}');
define('NONCE_SALT',       '${NONCE_SALT}');

\$table_prefix = 'wp_';

define('WP_HOME', '${WP_HOME_ESCAPED}');
define('WP_SITEURL', '${WP_SITEURL_ESCAPED}');
define('WP_DEBUG', false);
define('FORCE_SSL_ADMIN', false);
define('DISALLOW_FILE_EDIT', true);
define('WP_AUTO_UPDATE_CORE', false);

// SOLUZIONE FIX PROXY / NGINX
if (isset(\$_SERVER['HTTP_X_FORWARDED_PROTO']) && strpos(\$_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') !== false) {
    \$_SERVER['HTTPS'] = 'on';
}
if (isset(\$_SERVER['HTTP_X_FORWARDED_HOST']) && !empty(\$_SERVER['HTTP_X_FORWARDED_HOST'])) {
    \$_SERVER['HTTP_HOST'] = \$_SERVER['HTTP_X_FORWARDED_HOST'];
}

if (!defined('ABSPATH')) {
    define('ABSPATH', __DIR__ . '/');
}
require_once ABSPATH . 'wp-settings.php';
EOF

  chown www-data:www-data "$WP_PATH/wp-config.php"
fi

echo "[VW Gateway] Attendo il database MariaDB..."
until mysqladmin ping -h"$DB_HOST" --silent; do
  sleep 3
done

run_wp() {
  wp --path="$WP_PATH" --allow-root "$@"
}

if ! run_wp core is-installed >/dev/null 2>&1; then
  echo "[VW Gateway] Installo WordPress..."
  run_wp core install \
    --url="$WP_HOME" \
    --title="$WP_SITE_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email
fi

echo "[VW Gateway] Attivo i plugin..."
run_wp plugin activate virtual-world-gate-key || true
run_wp plugin activate wp-gpt-automation-free || true

echo "[VW Gateway] Sincronizzo opzioni VWGK..."
run_wp option update vwgk_ha_auth_mode "$HA_AUTH_MODE"
run_wp option update vwgk_ha_url "$HA_URL"
run_wp option update vwgk_ha_long_lived_token "$HA_LONG_LIVED_TOKEN"
run_wp option update vwgk_api_key "$VWGK_API_KEY"
if [ "$HA_AUTH_MODE" == "supervisor_proxy" ] && [ -n "${SUPERVISOR_TOKEN:-}" ]; then
    run_wp option update vwgk_supervisor_token "$SUPERVISOR_TOKEN"
fi

chown -R www-data:www-data "$WP_PATH"

echo "[VW Gateway] Avvio Apache..."
exec apache2-foreground

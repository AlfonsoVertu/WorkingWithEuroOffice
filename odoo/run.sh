#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

# --- HELPER: Parse JSON Options ---
get_option() {
    val=$(cat $CONFIG_PATH | jq -r ".$1 // empty")
    # If jq returns 'null' or empty string, we return nothing
    if [ "$val" = "null" ]; then
        echo ""
    else
        echo "$val"
    fi
}

MASTER_PASS=$(get_option "master_password")
DB_HOST=$(get_option "db_host")
DB_PORT=$(get_option "db_port")
DB_USER=$(get_option "db_user")
DB_PASS=$(get_option "db_password")
DB_NAME=$(get_option "db_name")
LIST_DB=$(get_option "list_db")
PROXY_MODE=$(get_option "proxy_mode")

echo "[Odoo] Configuring /etc/odoo/odoo.conf..."

cat <<EOF > /etc/odoo/odoo.conf
[options]
addons_path = /usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons
EOF

# Append options dynamically to avoid empty values crashing Odoo
[ -n "$MASTER_PASS" ] && echo "admin_passwd = $MASTER_PASS" >> /etc/odoo/odoo.conf
[ -n "$DB_HOST" ] && echo "db_host = $DB_HOST" >> /etc/odoo/odoo.conf
[ -n "$DB_PORT" ] && echo "db_port = $DB_PORT" >> /etc/odoo/odoo.conf
[ -n "$DB_USER" ] && echo "db_user = $DB_USER" >> /etc/odoo/odoo.conf
[ -n "$DB_PASS" ] && echo "db_password = $DB_PASS" >> /etc/odoo/odoo.conf
[ -n "$DB_NAME" ] && echo "db_name = $DB_NAME" >> /etc/odoo/odoo.conf
[ -n "$LIST_DB" ] && echo "list_db = $LIST_DB" >> /etc/odoo/odoo.conf
[ -n "$PROXY_MODE" ] && echo "proxy_mode = $PROXY_MODE" >> /etc/odoo/odoo.conf

chown odoo:odoo /etc/odoo/odoo.conf

echo "[Odoo] Configuration generated. Starting Odoo..."
exec gosu odoo odoo -c /etc/odoo/odoo.conf

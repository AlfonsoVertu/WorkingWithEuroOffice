#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

# --- HELPER: Parse JSON Options ---
get_option() {
    cat $CONFIG_PATH | jq -r ".$1"
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
admin_passwd = $MASTER_PASS
db_host = $DB_HOST
db_port = $DB_PORT
db_user = $DB_USER
db_password = $DB_PASS
db_name = $DB_NAME
list_db = $LIST_DB
proxy_mode = $PROXY_MODE
addons_path = /usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons
EOF

echo "[Odoo] Configuration generated. Starting Odoo..."
exec odoo -c /etc/odoo/odoo.conf

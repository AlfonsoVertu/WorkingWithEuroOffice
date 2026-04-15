#!/usr/bin/with-contenv bash
# ===========================================================
# ONLYOFFICE Integration Setup - run once after NC installs
# ===========================================================
set -e

CONFIG_PATH=/data/options.json
NEXTCLOUD_PATH="${NEXTCLOUD_PATH:-/data/config/www/nextcloud}"
OCC="php ${NEXTCLOUD_PATH}/occ"

OO_URL=$(jq -r '.onlyoffice_url // "http://eurooffice:8080/"' $CONFIG_PATH)
OO_JWT=$(jq -r '.onlyoffice_jwt // ""' $CONFIG_PATH)

echo "[99-onlyoffice-setup] Waiting for Nextcloud to be ready..."

WAIT_COUNT=0
until [ -f "${NEXTCLOUD_PATH}/config/config.php" ] || [ $WAIT_COUNT -ge 60 ]; do
  sleep 10
  WAIT_COUNT=$((WAIT_COUNT+1))
done

if [ ! -f "${NEXTCLOUD_PATH}/config/config.php" ]; then
  echo "[99-onlyoffice-setup] WARNING: Nextcloud config.php not found after 10 min. Skipping ONLYOFFICE setup."
  exit 0
fi

echo "[99-onlyoffice-setup] Nextcloud is ready. Installing ONLYOFFICE app..."

# Install the app if not already present
${OCC} app:install onlyoffice 2>/dev/null || ${OCC} app:enable onlyoffice || echo "[99-onlyoffice-setup] ONLYOFFICE already installed, enabling..."

echo "[99-onlyoffice-setup] Configuring ONLYOFFICE connector..."

# Set the Document Server URL
${OCC} config:app:set onlyoffice DocumentServerUrl --value="${OO_URL}"
echo "[99-onlyoffice-setup] DocumentServerUrl set to: ${OO_URL}"

# Set the JWT secret if provided
if [ -n "$OO_JWT" ]; then
  ${OCC} config:app:set onlyoffice jwt_secret --value="${OO_JWT}"
  ${OCC} config:app:set onlyoffice jwt_header --value="Authorization"
  ${OCC} config:app:set onlyoffice jwt_prefix --value="Bearer "
  echo "[99-onlyoffice-setup] JWT secret configured."
else
  ${OCC} config:app:set onlyoffice jwt_secret --value=""
  echo "[99-onlyoffice-setup] WARNING: No JWT secret provided; JWT disabled for ONLYOFFICE."
fi

echo "[99-onlyoffice-setup] ONLYOFFICE integration configured successfully!"

ARG BUILD_FROM
FROM $BUILD_FROM

LABEL io.hass.name="Nextcloud + ONLYOFFICE" \
      io.hass.description="Nextcloud with ONLYOFFICE integration pre-installed" \
      io.hass.type="addon"

# Install jq for options parsing in run script
RUN apk add --no-cache jq || (apt-get update && apt-get install -y jq && rm -rf /var/lib/apt/lists/*)

# Copy our custom ONLYOFFICE setup script
COPY rootfs /
RUN chmod a+x /etc/cont-init.d/99-onlyoffice-setup.sh

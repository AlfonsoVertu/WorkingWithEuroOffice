ARG BUILD_FROM
FROM $BUILD_FROM

LABEL \
    io.hass.name="EuroOffice Document Server" \
    io.hass.description="Collaborative document editing server for Home Assistant" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version="1.0.0"

# Install jq for options.json parsing in run.sh
RUN apt-get update && apt-get install -y jq python3 && rm -rf /var/lib/apt/lists/*

COPY run.sh /
RUN chmod a+x /run.sh

ENTRYPOINT ["/run.sh"]

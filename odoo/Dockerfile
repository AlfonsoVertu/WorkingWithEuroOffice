FROM odoo:16.0

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    jq \
    dos2unix \
    gosu \
    && rm -rf /var/lib/apt/lists/*

# Add entrypoint script
COPY run.sh /run.sh
RUN dos2unix /run.sh && chmod +x /run.sh

# Create custom addons directory
RUN mkdir -p /mnt/extra-addons && chown -R odoo:odoo /mnt/extra-addons

# Run as root so we can read /data/options.json, then switch to odoo user in run.sh
ENTRYPOINT ["/run.sh"]

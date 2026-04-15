# Odoo 16 for Home Assistant

Enterprise Resource Planning (ERP) and business applications suite inside Home Assistant.

## Features
- Fully functional Odoo 16.0 instance.
- Dedicated configuration for PostgreSQL connection.
- Persistent data storage.
- Multi-architecture support (amd64, aarch64).

## Configuration Options
- **Master Password**: Required to manage databases (create, backup, restore).
- **Database Settings**: Configure connection to your external PostgreSQL server (e.g., the Postgres 17 add-on).
- **Proxy Mode**: Enabled by default to allow access via Home Assistant's internal proxy and external Nginx Proxy Manager.

## What we added to the standard container:
- **HA Integration Script**: A `run.sh` entrypoint that automatically maps your Home Assistant add-on options to the `odoo.conf` file.
- **Rootless Operation**: Runs as the standard `odoo` user for improved security, with system updates handled during the build process.
- **Automated Deployment**: CI/CD pipeline integrated with GitHub Container Registry (GHCR).

## Credits
This project is maintained and optimized by **Alfonso Vertucci** of **Working With Web**.
Website: [workingwithweb.it/webagency](https://workingwithweb.it/webagency)

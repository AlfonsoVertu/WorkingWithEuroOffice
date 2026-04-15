# Branding & Credits
<div style=\"display: flex; align-items: center; justify-content: space-between; background: #f8f9fa; padding: 20px; border-radius: 10px; margin-bottom: 20px; border: 1px solid #dee2e6;\">
    <div style=\"display: flex; align-items: center;\">
        <img src=\"https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png\" width=\"60\" style=\"margin-right: 15px;\" />
        <img src=\"https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png\" width=\"60\" />
    </div>
    <div style=\"text-align: right;\">
        <strong>Alfonso Vertucci | Working With Web</strong><br />
        <a href=\"https://virtualgate.workingwithweb.eu/\">Virtual Gate Project</a> | 
        <a href=\"https://workingwithweb.it/webagency/gestisci-wordpress-da-chatgpt-wp-gpt-automation-pro/\">WP GPT Automation Pro</a>
    </div>
</div>


![VW Gateway Icon](./icon.png)

![Working With Web](https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png)

# Virtual World Dashboard (WordPress)

WordPress-based middleware gateway designed to bridge AI (GPTs) and Home Assistant.

## Features
- Dedicated WordPress instance inside Home Assistant.
- Acting as a secure REST Gateway.
- Pre-installed **Virtual World Gate Key** (VWGK) plugin.

## What we added to the standard container:
- **Automated Bootstrap**: A custom `run.sh` entrypoint that uses `wp-cli` to handle installation, hardening, and plugin activation automatically.
- **Zero-Touch Config**: Automatically reads database and HA settings from your add-on options.
- **Security Hardening**: Pre-configured with login-only mode and anti-indexing defaults.

## Configuration & Integration
1. **Database**: Requires a MariaDB instance (the official MariaDB add-on is recommended).
2. **HA Token**: Generate a Long Lived Access Token in your HA profile and paste it into the `ha_long_lived_token` field, or use `supervisor_proxy`.
3. **Gateway Key**: The `vwgk_api_key` is the secret you must provide in your GPT Actions headers as `x-api-key`.

## Troubleshooting
- **Database Connection Error**: Verify `db_host` (usually `core-mariadb`) and credentials. Ensure the MariaDB add-on is running.
- **WordPress Not Installing**: Check logs for WP-CLI errors. This usually happens if the database is unreachable or the provided domain is invalid.
- **API 401/403**: Verify the `vwgk_api_key` matches your request headers.

## Official Documentation
- [WordPress Documentation](https://wordpress.org/documentation/)
- [WP-CLI Command Reference](https://developer.wordpress.org/cli/commands/)

## Credits
This project is maintained and optimized by **Alfonso Vertucci** of **Working With Web**.
Website: [workingwithweb.it/webagency](https://workingwithweb.it/webagency)




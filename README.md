# Virtual World Gateway HA

Una suite di add-on per Home Assistant orientati all''automazione intelligente, alla produttività aziendale e alla protezione della rete. Pensati per integrarsi tra loro e con sistemi di AI come GPT.

---

## Add-on inclusi

### 🌐 Virtual World Dashboard
WordPress come middleware REST tra le tue GPT Actions e Home Assistant. Include il plugin **Virtual World Gate Key** pre-installato: salva il Long-Lived Access Token, espone le rotte sicure verso HA, genera shortcode e card per il tuo sito.

### 📄 EuroOffice (ONLYOFFICE Document Server)
Server di documenti collaborativo compatibile con formati Microsoft Office. Si integra nativamente con Nextcloud per la modifica in tempo reale.

### ☁️ Nextcloud + ONLYOFFICE
Piattaforma di storage e collaborazione cloud self-hosted. Questa versione include OCR e il connettore auto-configurato per EuroOffice.

### 💼 Odoo 16
Suite ERP completa: CRM, contabilità, vendite, inventario e molto altro. Si connette al database PostgreSQL esterno. Ideale per chi gestisce una piccola impresa dalla propria infrastruttura.

### 🔐 Nginx Proxy Manager
Gestione proxy inversi con supporto SSL automatico (Let''s Encrypt). Permette di esporre in modo sicuro i servizi della rete su un dominio pubblico senza configurare manualmente Nginx.

### 🛡️ AdGuard Home
DNS server con blocco di pubblicità, tracker e malware a livello di rete. Protegge tutti i dispositivi connessi senza installare nulla sui singoli device.

### 🔍 Elasticsearch
Motore di ricerca e analisi dati distribuito. Utile per indicizzare log, eventi e dati provenienti da Home Assistant o altri servizi della suite.

---

## Installazione

1. In Home Assistant, vai su **Impostazioni → Add-on → Store**.
2. Clicca sui tre puntini in alto a destra → **Repository**.
3. Incolla: `https://github.com/AlfonsoVertu/virtual_world_gateway_ha`
4. Aggiorna e cerca gli add-on da installare.

---

## Autori e attribuzioni

Questo repository è sviluppato e mantenuto da **Alfonso Vertucci** — [Working With Web](https://workingwithweb.it/webagency/).

I singoli add-on si basano su software open source mantenuti dai rispettivi autori originali (Nextcloud, Odoo S.A., Elastic, AdGuard Team, Frenck/hassio-addons). Ogni componente rispetta la propria licenza upstream.

- 🔗 [Virtual Gate Project](https://virtualgate.workingwithweb.eu/)
- 🔗 [WP GPT Automation Pro](https://workingwithweb.it/webagency/gestisci-wordpress-da-chatgpt-wp-gpt-automation-pro/)

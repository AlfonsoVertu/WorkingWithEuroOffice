# ☁️ Nextcloud + ONLYOFFICE

<div align="center">
    <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="100" style="margin-right: 20px;" />
    <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="100" />
    <h3>Suite sviluppata da Alfonso Vertucci | Working With Web</h3>
    <p>
        <a href="https://virtualgate.workingwithweb.eu/">Virtual Gate Project</a> | 
        <a href="https://workingwithweb.it/webagency/gestisci-wordpress-da-chatgpt-wp-gpt-automation-pro/">Ottieni WP GPT Automation Pro</a>
    </p>
</div>

---

## 📖 Introduzione
**Nextcloud** è la piattaforma di collaborazione sui contenuti leader nel settore. All''interno del repository **Virtual World Gateway**, questa versione include il setup automatico dell''app **ONLYOFFICE** e il supporto **OCR** per la scansione dei documenti.

---

## 🚀 Guida al Primo Avvio
1. **Login Iniziale**: Al primo accesso, crea un account utente amministratore.
2. **Setup ONLYOFFICE**: Grazie ai nostri script (`99-onlyoffice-setup.sh`), l''app connettore per ONLYOFFICE viene installata automaticamente al primo boot.
3. **Configurazione Server**: Vai in `Impostazioni Amministrazione > ONLYOFFICE` e inserisci l''URL dell''add-on EuroOffice e lo `jwt_secret` corrispondente.

---

## ⚙️ Funzionalità Speciali
- **OCR Integrato**: Estrai testo dalle immagini caricate su Nextcloud.
- **Auto-Configurazione**: Sincronizzazione automatica dei parametri con la suite Virtual World.

---

## 🛠️ Troubleshooting & Supporto
- **Lentezza estrema**: Nextcloud è esigente. Assicurati che il disco del tuo HA sia un SSD e che ci sia abbastanza RAM.
- **Errore Indirizzo IP**: Se usi Nextcloud dietro proxy, assicurati di configurare i `trusted_domains` nelle impostazioni avanzate.

---

## 💎 Crediti & Attribuzioni
- **Integrazione & Branding**: **Alfonso Vertucci** - Working With Web.
- **Software Core**: Nextcloud Hub.

© 2026 Working With Web - Tutti i diritti riservati.

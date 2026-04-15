# 📄 EuroOffice Document Server

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
**EuroOffice** è un server di documenti collaborativo basato su **ONLYOFFICE**. Ti permette di visualizzare, creare e modificare documenti di testo, fogli di calcolo e presentazioni in tempo reale direttamente dentro Home Assistant o Nextcloud.

Questa versione è ottimizzata con il **VWG-Shield**, garantendo sicurezza e privacy totali per i tuoi documenti.

---

## 🚀 Guida al Primo Avvio
1. **Configurazione JWT**: Per sicurezza, l''add-on richiede un `jwt_secret`. Usalo per collegare EuroOffice a Nextcloud o altre app.
2. **Accesso**: L''editor è disponibile internamente. Se abiliti l''esempio (`example: true`), puoi testarlo su `http://tuo-ip-ha:3000`.
3. **Integrazione Nextcloud**: Nelle impostazioni di Nextcloud, inserisci l''URL di questo add-on: `http://<IP-HA>:8080`.

---

## ⚙️ Configurazione
| Opzione | Descrizione | Default |
| :--- | :--- | :--- |
| `jwt_secret` | Chiave segreta per l''autenticazione delle richieste. | (Configurabile) |
| `example` | Abilita l''app di esempio (Node.js) per i test. | `false` |

---

## 🛠️ Troubleshooting & Supporto
- **Errore Security Token**: Assicurati che lo `jwt_secret` inserito qui corrisponda esattamente a quello configurato nell''app client (es. Nextcloud).
- **Documento non si carica**: Verifica che il firewall del router non stia bloccando la porta 8080 o 3000 se provi ad accedere dall''esterno.

---

## 💎 Crediti & Attribuzioni
- **Integrazione & Branding**: **Alfonso Vertucci** - Working With Web.
- **Software Core**: ONLYOFFICE Document Server (Open Source Edition).

© 2026 Working With Web - Tutti i diritti riservati.

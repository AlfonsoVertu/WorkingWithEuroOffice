# 🌐 Virtual World Dashboard (WordPress)

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
Il **Virtual World Dashboard** è il cuore pulsante dell''integrazione AI del tuo sistema. È un''istanza WordPress pre-configurata che funge da **rest-gateway sicuro** tra le GPT Actions (o altri client AI) e il tuo Home Assistant. 

Grazie al plugin **Virtual World Gate Key** pre-installato, puoi gestire entità, script e automazioni tramite linguaggio naturale con una sicurezza di livello enterprise.

---

## 🚀 Guida al Primo Avvio
1. **Database**: Questo add-on richiede un database MariaDB attivo (si consiglia l''add-on ufficiale MariaDB).
2. **Installazione Automatica**: Al riavvio dell''add-on, il sistema eseguirà il bootstrap automatico di WordPress.
3. **Accesso**: Una volta avviato, accedi a `http://tuo-ip-ha:8080`.
4. **Configurazione Token**: 
   - Vai in **VWGK Settings** nel menu WordPress.
   - Genera una **Long-Lived Access Token** nel tuo profilo Home Assistant e incollala nel campo dedicato (oppure usa la modalità `supervisor_proxy`).
   - Copia la **API Key** generata per usarla nelle tue GPT Actions.

---

## ⚙️ Parametri di Configurazione
| Opzione | Descrizione | Default |
| :--- | :--- | :--- |
| `db_host` | Host del database MariaDB. | `core-mariadb` |
| `db_user` | Nome utente del database. | `wordpress` |
| `vwgk_api_key` | Chiave segreta per le chiamate REST esterne. | (Auto-generata) |
| `ha_auth_mode` | Modalità di autenticazione (proxy o token). | `supervisor_proxy` |

---

## 🛠️ Troubleshooting & Supporto
- **Errore di connessione al DB**: Verifica che l''add-on MariaDB sia attivo e che le credenziali in `config.yaml` siano corrette.
- **REST API 401/403**: Verifica che l''header `x-api-key` della tua chiamata corrisponda a quella salvata nelle impostazioni del plugin.
- **Header X-Robots-Tag**: Per sicurezza, il gateway attiva automaticamente il `noindex` per impedire ai motori di ricerca di indicizzare la tua interfaccia privata.

---

## 💎 Crediti & Attribuzioni
- **Sviluppo & Ottimizzazione**: **Alfonso Vertucci** - Working With Web.
- **Landing Pro**: [WP GPT Automation Pro](https://workingwithweb.it/webagency/gestisci-wordpress-da-chatgpt-wp-gpt-automation-pro/)
- **Core**: WordPress.org (Open Source Edition).

© 2026 Working With Web - Tutti i diritti riservati.

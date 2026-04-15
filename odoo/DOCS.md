# 💼 Odoo 16 (Enterprise Ready)

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
**Odoo** è una suite completa di applicazioni aziendali open source che copre tutte le esigenze della tua compagnia: CRM, eCommerce, contabilità, inventario, punto vendita, gestione dei progetti, ecc.

L''integrazione in Home Assistant permette di collegare i dati della tua smart home direttamente ai tuoi flussi di lavoro aziendali.

---

## 🚀 Guida al Primo Avvio
1. **Connessione Database**: Odoo richiede PostgreSQL. Configura l''host e le credenziali del tuo database (es. IP `192.168.1.56`, utente `vash`).
2. **Master Password**: Al primo accesso su `http://tuo-ip-ha:8069`, verrai accolto dalla schermata di creazione database. Usa la **Master Password** definita in `config.yaml`.
3. **Moduli Extra**: Per questa versione sono stati rimossi i moduli extra per massimizzare la velocità e la compatibilità.

---

## ⚙️ Configurazione
| Opzione | Descrizione | Default |
| :--- | :--- | :--- |
| `master_password` | Password necessaria per creare/eliminare database. | `admin` |
| `db_host` | Indirizzo del server PostgreSQL. | (Configurabile) |
| `proxy_mode` | Da attivare se Odoo è dietro Nginx Proxy Manager. | `true` |

---

## 🛠️ Troubleshooting & Supporto
- **Internal Server Error (500)**: Solitamente dovuto a permessi mancanti nel database Postgres. Esegui `ALTER SCHEMA public OWNER TO vash;`.
- **Moduli che non si installano**: Verifica di avere abbastanza RAM (Odoo 16 richiede almeno 2GB).

---

## 💎 Crediti & Attribuzioni
- **Integrazione & Branding**: **Alfonso Vertucci** - Working With Web.
- **Software Core**: Odoo 16.0 Community Edition.

© 2026 Working With Web - Tutti i diritti riservati.

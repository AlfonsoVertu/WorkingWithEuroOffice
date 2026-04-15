# Odoo 16

<div align="center">
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="80" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="80" />
</div>

---

**Odoo 16 Community Edition** — suite ERP modulare open source. Include CRM, contabilità, vendite, gestione magazzino, e-commerce, HR e molto altro. Si connette a un database PostgreSQL esterno configurabile dall'interfaccia di Home Assistant.

---

## Configurazione dell'add-on

| Parametro | Descrizione |
|:---|:---|
| `master_password` | Password di amministrazione del database Odoo. Usata per creare, eliminare o ripristinare database dalla schermata iniziale. **Cambiala prima di avviare.** |
| `db_host` | IP o hostname del server PostgreSQL esterno. Esempio: `192.168.1.56`. |
| `db_port` | Porta PostgreSQL. Default: `5432`. |
| `db_user` | Utente del database con permessi completi sullo schema `public`. |
| `db_password` | Password dell'utente PostgreSQL. |
| `db_name` | Nome del database da utilizzare (o da creare al primo avvio). |
| `list_db` | Se `true`, mostra la pagina di selezione database all'accesso. Disabilita in produzione se usi un singolo database. |
| `proxy_mode` | Abilita la modalità proxy. Necessario se Odoo è esposto tramite Nginx Proxy Manager. |

**Porte esposte:**
| Porta | Utilizzo |
|:---|:---|
| `8069` | Interfaccia web Odoo |

---

## Primo avvio

1. Assicurati che il server PostgreSQL esterno sia raggiungibile dall'IP di Home Assistant.
2. L'utente del database deve avere permessi completi. Esegui su PostgreSQL:
   ```sql
   ALTER SCHEMA public OWNER TO <db_user>;
   GRANT ALL PRIVILEGES ON DATABASE <db_name> TO <db_user>;
   ```
3. Avvia l'add-on e accedi su `http://<ip-ha>:8069`.
4. Se `list_db: true`, vedrai la schermata di creazione database. Usa la `master_password` configurata.
5. Crea il primo database e attendi il completamento dell'installazione (può richiedere qualche minuto).

---

## Configurazione proxy (con Nginx Proxy Manager)

Se usi Nginx Proxy Manager per esporre Odoo su un dominio:
1. Imposta `proxy_mode: true` nell'add-on.
2. In NPM, crea un proxy host verso `http://<ip-ha>:8069`.
3. Abilita "Websockets Support" nel proxy host.
4. Imposta il dominio verificato nel file di configurazione di Odoo (gestito automaticamente da `run.sh`).

---

## Troubleshooting

**Internal Server Error (500) al primo avvio**
→ Errore tipico di permessi insufficienti sul database. Esegui i comandi SQL del paragrafo "Primo avvio".

**Odoo non raggiunge il database**
→ Verifica che `db_host` sia corretto e che PostgreSQL accetti connessioni da host remoti (`pg_hba.conf`).

**Pagina bianca o molto lenta**
→ Odoo richiede almeno 2 GB di RAM liberi. Controlla l'utilizzo della memoria del sistema.

**Master password non funziona**
→ È la password configurata nel parametro `master_password`, non quella dell'utente Odoo o del DB.

---

## Crediti

Integrazione sviluppata da [Alfonso Vertucci](https://workingwithweb.it/webagency/) — Working With Web.
Software core: **Odoo 16.0 Community Edition** — [odoo.com](https://www.odoo.com)
Documentazione ufficiale: [odoo.com/documentation/16.0](https://www.odoo.com/documentation/16.0/)

Progetto Virtual Gate: [virtualgate.workingwithweb.eu](https://virtualgate.workingwithweb.eu/)

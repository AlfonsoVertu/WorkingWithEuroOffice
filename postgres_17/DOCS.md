# Postgres 17 (con VectorChord)

<div align="center">
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="80" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="80" />
</div>

---

Database relazionale avanzato open-source (PostgreSQL 17.x). Questa versione include il supporto per VectorChord per gestire efficacemente embedding e vettorializzazioni, essenziale per applicazioni di Intelligenza Artificiale e integrazione con la suite **Virtual World Gateway**.

Ottimo compagno per **Odoo 16**, che richiede un server PostgreSQL affidabile.

---

## Configurazione dell'add-on

| Parametro | Descrizione |
|:---|:---|
| `POSTGRES_PASSWORD` | Password dell'utente "postgres" (amministratore di default). |
| `POSTGRES_USER` | (Opzionale) Cambia il nome dell'utente di default. La raccomandazione è creare altri utenti/credenziali post-installazione per maggiore sicurezza. |
| `POSTGRES_DB` | (Opzionale) Crea automaticamente un database con questo nome al primo boot. |
| `POSTGRES_INITDB_ARGS` | (Opzionale) Argomenti aggiuntivi per il comando `initdb`. |
| `env_vars` | Aggiungi variabili d'ambiente extra. |

**Porte esposte:**
| Porta | Utilizzo |
|:---|:---|
| `5432` | Connessione database Postgres |

---

## Primo avvio e connessione

1. Imposta la `POSTGRES_PASSWORD` con una stringa robusta.
2. Avvia l'add-on. Al primo avvio, il database viene inizializzato.
3. Puoi connetterti al database dalla tua rete locale o da altri add-on (es. Odoo 16) usando:
   - **Host**: IP del tuo Home Assistant (es. `192.168.1.56`) oppure, internamente a HA, `postgres_latest`
   - **Porta**: `5432`
   - **Utente**: `postgres`
   - **Password**: quella impostata in configurazione

---

## Integrazione con Odoo 16

Se stai usando il nostro add-on **Odoo 16**, configuralo come segue:
- `db_host`: `192.168.1.56` (l'IP locale del tuo dispositivo HA - sconsigliato l'alias localhost all'interno del docker per ragioni di routing).
- `db_port`: `5432`
- `db_user`: L'utente che hai creato in PostgreSQL per gestire i database Odoo, oppure usa `postgres` e assicurati di aver dato i privilegi massimi.

---

## Troubleshooting

**Connessione rifiutata da un altro PC/Add-on**
→ Verifica che il firewall di rete permetta il traffico sulla porta TCP 5432.
→ Assicurati che `POSTGRES_HOST_AUTH_METHOD` non sia settato a valori restrittivi in caso tu stia provando connessioni non-SSL (di default permette l'autenticazione con password).

---

## Crediti

Integrazione e branding: [Alfonso Vertucci](https://workingwithweb.it/webagency/) — Working With Web.
Basato sull'add-on originale `postgres` di [alexbelgium](https://github.com/alexbelgium/hassio-addons).
Software core: **PostgreSQL** — [postgresql.org](https://www.postgresql.org/)

Progetto Virtual Gate: [virtualgate.workingwithweb.eu](https://virtualgate.workingwithweb.eu/)

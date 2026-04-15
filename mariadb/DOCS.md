# MariaDB (Database Server)

<div align="center">
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="80" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="80" />
</div>

---

Add-on ufficiale di Home Assistant, ri-confezionato per la distribuzione tramite la repository **Virtual World Gateway HA**. Questo modulo espone il database **MariaDB**, un fork di MySQL, ideale come backend per la maggior parte dei servizi web e applicativi open-source (incluso **WordPress** della nostra Suite!).

Questo add-on sostituisce integralmente (con performance nettamente superiori) i backend SQLite locali integrati nativamente da Home Assistant stesso per il registro eventi e lo storico log.

---

## Configurazione dell'add-on

La configurazione iniziale ruota attorno all'elenco dei database e degli utenti autorizzati:

| Parametro | Descrizione |
|:---|:---|
| `databases` | Elenco di nomi dei database da creare all'avvio. Almeno uno (es. `homeassistant`). |
| `logins` | Elenco delle credenziali (`username` e `password`) per l'accesso ai DB. |
| `rights` | Connessione di attributi: mappa quale `username` ha diritti (es. tutti) in quale `database` specifico. |
| `mariadb_server_args` | Parametri opzionali da passare in flag per eseguire tuning sul demone SQL. |

**Porte esposte:**
| Porta | Utilizzo |
|:---|:---|
| `3306` | Connessioni Client TCP |

---

## Utilizzo come backend per WWW WordPress Suite

Vuoi lanciare il server **MariaDB** per la suite proprietaria Working With Web? Configuralo nella tendina in questo modo:

```yaml
databases:
  - homeassistant
  - www_suite
logins:
  - username: homeassistant
    password: TuaPassword_123!
  - username: wordpress
    password: SuperSecurePassword_WWW!
rights:
  - username: homeassistant
    database: homeassistant
  - username: wordpress
    database: www_suite
```

Dopo aver salvato e avviato l'add-on, imposta i parametri `wordpress` e `SuperSecurePassword_WWW!` assieme al database `www_suite` direttamente nella scheda di configurazione dell'add-on della WWW WordPress Suite. Sotto la voce Host DB, usa **`core-mariadb`** se gli applicativi risiedono sullo stesso supervisore di HA, altrimenti utilizza direttamente l'IP del dispositivo.

---

## Crediti

Integrazione e documentazione addizionale: [Alfonso Vertucci](https://workingwithweb.it/webagency/) — Working With Web.
Sviluppato originariamente da The Home Assistant Community e pacchettizzato dagli autori core uffciali ([repository upstream](https://github.com/home-assistant/addons/tree/master/mariadb)).

Progetto Virtual Gate: [virtualgate.workingwithweb.eu](https://virtualgate.workingwithweb.eu/)

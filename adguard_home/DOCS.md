# AdGuard Home

<div align="center">
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="80" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="80" />
</div>

---

Server DNS con blocco di pubblicità, tracker e malware a livello di rete. Protegge **tutti** i dispositivi della rete locale senza installare nulla sui singoli device. Integrato in Home Assistant tramite Ingress (accessibile direttamente dal pannello HA senza aprire porte aggiuntive).

Basato sull'add-on ufficiale mantenuto da [Frenck](https://github.com/frenck) per la community Home Assistant.

---

## Configurazione dell'add-on

| Parametro | Descrizione |
|:---|:---|
| `ssl` | Abilita HTTPS per l'interfaccia web. Se `true`, fornisci `certfile` e `keyfile`. |
| `certfile` | Nome del certificato SSL (es. `fullchain.pem`). Deve essere in `/ssl/`. |
| `keyfile` | Nome della chiave privata SSL (es. `privkey.pem`). Deve essere in `/ssl/`. |
| `leave_front_door_open` | Se `true`, disabilita l'autenticazione dell'interfaccia web. **Non usare in produzione.** |
| `log_level` | Livello di log: `trace`, `debug`, `info`, `notice`, `warning`, `error`, `fatal`. |

**Porte esposte:**
| Porta | Utilizzo |
|:---|:---|
| `53/udp` | Server DNS (necessario per il blocco di rete) |
| `80/tcp` | Interfaccia web (opzionale se usi Ingress) |

---

## Primo avvio

1. Avvia l'add-on.
2. Apri l'interfaccia tramite il **pulsante "Apri interfaccia web"** nella scheda dell'add-on (usa Ingress, senza configurare porte).
3. Segui il wizard di configurazione:
   - Seleziona l'interfaccia di ascolto DNS: usa `0.0.0.0:53`.
   - Crea username e password per il pannello.
4. **Configura i tuoi dispositivi o il router** per usare l'IP di Home Assistant come server DNS primario.

---

## Configurare il DNS sul router

Accedi alle impostazioni del router e imposta il **DNS primario** con l'IP del tuo Home Assistant. In questo modo, tutti i dispositivi della rete useranno AdGuard Home automaticamente senza configurazioni individuali.

---

## Aggiungere liste di blocco personalizzate

In AdGuard Home → **Filtri → Liste di blocco DNS**:
- **AdGuard DNS filter** (incluso di default)
- [EasyList](https://easylist.to/easylist/easylist.txt) — blocco pubblicità
- [Steven Black's Hosts](https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts) — malware e pubblicità
- [OISD](https://big.oisd.nl/domainswild) — lista combinata ad alto tasso di blocco

---

## Integrazione con Home Assistant

AdGuard Home si integra nativamente con HA tramite la discovery automatica. Una volta avviato, Home Assistant ti proporrà di aggiungere l'integrazione che espone sensori per:
- Query DNS totali
- Query bloccate
- Percentuale di blocco
- Status del servizio

---

## Troubleshooting

**DNS non funziona dopo la configurazione**
→ Verifica che la porta 53/UDP non sia già occupata da un altro resolver locale (systemd-resolved, pihole, etc.).

**Dispositivi non filtrati**
→ Il dispositivo deve usare l'IP HA come DNS. Verifica con `nslookup test.com <ip-ha>`.

**Pannello non raggiungibile**
→ Usa il pulsante Ingress dall'interfaccia HA. Se vuoi accedere dall'esterno, abilita la porta 80 nella configurazione.

---

## Crediti

Integrazione e branding: [Alfonso Vertucci](https://workingwithweb.it/webagency/) — Working With Web.
Add-on originale: [hassio-addons/app-adguard-home](https://github.com/hassio-addons/app-adguard-home) di [Frenck](https://github.com/frenck).
Software core: **AdGuard Home** — [adguard.com/adguard-home](https://adguard.com/adguard-home/overview.html)
Documentazione ufficiale: [github.com/AdguardTeam/AdGuardHome/wiki](https://github.com/AdguardTeam/AdGuardHome/wiki)

Progetto Virtual Gate: [virtualgate.workingwithweb.eu](https://virtualgate.workingwithweb.eu/)

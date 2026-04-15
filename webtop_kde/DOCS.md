# Webtop (KDE Desktop)

<div align="center">
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="80" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="80" />
</div>

---

Ambiente desktop Linux completo (Ubuntu con KDE Plasma) accessibile interamente tramite il browser! Permette di gestire il tuo server o svolgere operazioni grafiche complesse direttamente dentro Home Assistant, senza l'uso di client VNC o software aggiuntivi.

---

## Configurazione dell'add-on

L'integrazione base è molto semplice e in genere richiede solo l'avvio, ma supporta le seguenti variabili ambiente:

| Parametro | Descrizione |
|:---|:---|
| `DNS_server` | Server DNS interno all'ambiente (default: `8.8.8.8`). |
| `additional_apps` | Applicativi da installare al boot (es. `libreoffice,engrampa`). |
| `KEYBOARD` | Seleziona il layout della tastiera (es. `it-it-qwerty`). |
| `PUID` / `PGID` | ID utente e gruppo per gestire in sicurezza i permessi sui file di root in `data_location` (default 0). |
| `data_location` | Cartella di Home Assistant usata per la persistenza della home. |

**Porte esposte:**
| Porta | Utilizzo |
|:---|:---|
| `3000` | Interfaccia Web HTTP |
| `3001` | Interfaccia Web HTTPS |

---

## Accesso e Utilizzo

1. Dopo l'installazione, avvia l'add-on. Il download dell'ambiente desktop può richiedere diversi minuti viste le sue dimensioni.
2. Accedi cliccando sul pulsante **Apri l'interfaccia utente web** di Home Assistant (sfruttando Ingress) oppure visita l'IP di Home Assistant sulla porta 3000.
3. Se desideri accelerazione grafica o hardware transcoding sul browser, assicurati che i permessi di virtualizzazione/pass-through sui dispositivi DRM in `/dev/dri` siano configurati correttamente e che l'add-on sia stato riavviato.

---

## Crediti

Integrazione e branding: [Alfonso Vertucci](https://workingwithweb.it/webagency/) — Working With Web.
Basato sull'add-on originale `webtop` di [alexbelgium](https://github.com/alexbelgium/hassio-addons) e progetto linuxserver.io.

Progetto Virtual Gate: [virtualgate.workingwithweb.eu](https://virtualgate.workingwithweb.eu/)

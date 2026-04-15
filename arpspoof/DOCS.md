# Arpspoof

<div align="center">
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="80" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="80" />
</div>

---

Add-on per la simulazione e il test di attacchi **Arp Spoofing** o per tagliare l'accesso alla rete a specifici dispositivi nella tua rete locale. Un potente strumento di network management da affiancare ad **AdGuard Home** se vuoi assumere il pieno controllo del tuo perimetro di rete e limitare dispositivi non autorizzati.

## Configurazione dell'add-on

| Parametro | Descrizione |
|:---|:---|
| `ROUTER_IP` | (Obbligatorio) L'indirizzo IP del gateway principale (il router) per ingannare i target che tentano di collegarsi a internet. Esempio: `192.168.1.1`. |
| `INTERFACE_NAME` | (Opzionale) L'interfaccia di rete su cui operare (es. `eth0` o `wlan0`). Se omesso, cercherà di individuarla automaticamente. |

**Porte esposte:**
| Porta | Utilizzo |
|:---|:---|
| `7022` | Pannello Web UI |

---

## Primo avvio e utilizzo

1. Assicurati che `ROUTER_IP` corrisponda esattamente all'IP del tuo router o modem (la porta d'accesso primario per la rete).
2. L'add-on gira con privilegi massimi (modalità **host network** e `SYS_ADMIN`) quindi assicurati di usarlo con prudenza in reti di cui possiedi i diritti di amministrazione formali.
3. Avviato il servizio, apri la Web UI (tramite il pannello di controllo Ingress e/o sulla porta `7022`).
4. Sarai in grado di visionare tutti i client della rete e isolarli ("Kill") o tracciarne le richieste.

---

## Troubleshooting

**L'interfaccia non trova dispositivi o l'ARP spoof fallisce**
→ Specifica manualmente la `INTERFACE_NAME` se possiedi più schede di rete (ad es. per Home Assistant in macchine virtuali potresti usare una scheda dedicata o un bridge).

**Problemi sul Router**
→ Molti router moderni hanno protezioni Anti-Arp. Se quest'ultime sono attive, Arpspoof potrebbe causare instabilità prolungata sulla tua intera LAN oppure non funzionare del tutto. Controlla le impostazioni di sicurezza del tuo terminale di routing.

---

## Crediti

Integrazione e branding: [Alfonso Vertucci](https://workingwithweb.it/webagency/) — Working With Web.
Basato sull'add-on originale `arpspoof` di [alexbelgium](https://github.com/alexbelgium/hassio-addons).

> ⚠️ Attenzione: il tool è inteso solo per scopi amministrativi e di test di sicurezza su reti proprietarie.

Progetto Virtual Gate: [virtualgate.workingwithweb.eu](https://virtualgate.workingwithweb.eu/)

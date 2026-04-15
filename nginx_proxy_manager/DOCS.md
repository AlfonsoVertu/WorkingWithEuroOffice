# Nginx Proxy Manager

<div align="center">
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="80" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="80" />
</div>

---

Pannello web per la gestione di proxy inversi Nginx con supporto automatico ai certificati **SSL Let's Encrypt**. Permette di esporre servizi interni (Odoo, Nextcloud, WordPress) su un dominio pubblico con HTTPS senza configurare Nginx manualmente.

Basato sull'add-on ufficiale mantenuto da [Frenck](https://github.com/frenck) per la community Home Assistant.

---

## Porte esposte

| Porta | Utilizzo |
|:---|:---|
| `81` | Pannello di amministrazione web |
| `80` | Traffico HTTP (necessario per Let's Encrypt) |
| `443` | Traffico HTTPS |

---

## Primo avvio

1. Avvia l'add-on e apri il pannello su `http://<ip-ha>:81`.
2. **Credenziali predefinite:**
   - Email: `admin@example.com`
   - Password: `changeme`
3. Al primo login, il sistema chiede di cambiare email e password. Fallo subito.
4. Crea il primo **Proxy Host** dalla sezione omonima nel pannello.

---

## Creare un Proxy Host

1. Clicca su **Add Proxy Host**.
2. **Domain Names**: inserisci il tuo dominio (es. `odoo.tuodominio.com`).
3. **Scheme**: `http` · **Forward Hostname/IP**: IP del tuo servizio · **Forward Port**: porta del servizio.
4. Nella scheda **SSL**: seleziona "Request a new SSL Certificate" e abilita "Force SSL".
5. Salva. NPM richiesterà automaticamente il certificato Let's Encrypt.

> **Prerequisito SSL**: il tuo router deve inoltrare la porta `80` verso l'IP di Home Assistant per permettere la validazione Let's Encrypt.

---

## Esempi di proxy nella suite Virtual World Gateway

| Dominio | Forward Port | Note |
|:---|:---|:---|
| `odoo.tuodominio.com` | `8069` | Abilitare Websocket Support |
| `cloud.tuodominio.com` | `8099` | Nextcloud |
| `gateway.tuodominio.com` | `8081` | Virtual World Dashboard |

---

## Troubleshooting

**Porta 80 o 443 già in uso**
→ Verifica che nessun altro add-on (es. HA stessa) stia usando queste porte. Disabilita o sposta le porte in conflitto.

**Certificato SSL non viene emesso**
→ Assicurati che la porta 80 sia raggiungibile dall'esterno e che il DNS del dominio punti all'IP pubblico corretto.

**Pannello non raggiungibile dopo il riavvio**
→ Controlla che l'add-on sia impostato su avvio automatico (`boot: auto`).

---

## Crediti

Integrazione e branding: [Alfonso Vertucci](https://workingwithweb.it/webagency/) — Working With Web.
Add-on originale: [hassio-addons/addon-nginx-proxy-manager](https://github.com/hassio-addons/addon-nginx-proxy-manager) di [Frenck](https://github.com/frenck).
Software core: **JC21 Nginx Proxy Manager** — [nginxproxymanager.com](https://nginxproxymanager.com)

Progetto Virtual Gate: [virtualgate.workingwithweb.eu](https://virtualgate.workingwithweb.eu/)

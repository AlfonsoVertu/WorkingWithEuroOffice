# 🔐 Nginx Proxy Manager (Branded Edition)

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
**Nginx Proxy Manager** è la soluzione definitiva per esporre i tuoi servizi web in modo sicuro tramite Home Assistant. Gestisce automaticamente i certificati **Let''s Encrypt SSL** e ti permette di creare Proxy Inversi con pochi clic tramite una dashboard web intuitiva.

Questa versione è integrata nella suite **Virtual World Gateway** per garantire una gestione semplificata degli accessi ai tuoi gateway AI.

---

## 🚀 Guida al Primo Avvio
1. **Avvio**: Dopo l''installazione, avvia l''add-on e attendi qualche minuto per l''inizializzazione.
2. **Accesso UI**: Apri l''interfaccia web all''indirizzo `http://tuo-ip-ha:81`.
3. **Credenziali Predefinite**:
   - **Email**: `admin@example.com`
   - **Password**: `changeme`
   - *IMPORTANTE: Al primo accesso, il sistema ti chiederà di aggiornare email e password.*

---

## ⚙️ Porte e Rete
Questo add-on espone le seguenti porte standard:
- **81**: Pannello di amministrazione (HTTP).
- **80**: Traffico web standard (HTTP).
- **443**: Traffico web sicuro (HTTPS/SSL).

---

## 🛠️ Suggerimenti & Troubleshooting
- **Porte Occupate**: Se l''add-on non si avvia, verifica che le porte 80/443 non siano occupate da altri add-on o dal webserver di Home Assistant.
- **SSL Let''s Encrypt**: Assicurati che il tuo router inoltri correttamente le porte 80 e 443 verso l''IP del tuo Home Assistant per permettere il rinnovo automatico dei certificati.

---

## 💎 Crediti & Attribuzioni
- **Integrazione & Branding**: **Alfonso Vertucci** - Working With Web.
- **Autore Originale**: Basato sull''add-on ufficiale della **Home Assistant Community** mantenuto da [Frenck](https://github.com/frenck).
- **Software Core**: JC21 Nginx Proxy Manager.

© 2026 Working With Web - Tutti i diritti riservati.

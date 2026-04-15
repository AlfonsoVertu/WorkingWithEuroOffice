# 🛡️ AdGuard Home (Branded Edition)

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
**AdGuard Home** è il guardiano della tua privacy a livello di rete. Funge da server DNS che blocca pubblicità, malware e tracciamento per **tutti** i dispositivi connessi alla tua rete locale, senza dover installare alcun software sui singoli device.

È lo strumento perfetto per mantenere la rete del tuo ecosistema **Virtual World** pulita, veloce e sicura.

---

## 🚀 Guida al Primo Avvio
1. **Configurazione Iniziale**: Una volta avviato l''add-on, clicca su "Open Web UI".
2. **Setup Wizard**: Segui la procedura guidata. Quando ti viene chiesto di selezionare l''interfaccia per il DNS, assicurati che la porta sia la `53`. 
3. **Pannello di Amministrazione**: Ti consigliamo di impostare l''interfaccia web sulla porta `3000` (default per il setup) e successivamente gestirlo tramite la dashboard integrata.
4. **Configurazione Client**: Per attivare il blocco, imposta l''IP del tuo Home Assistant come **Server DNS primario** nelle impostazioni del tuo router o dei singoli dispositivi.

---

## ⚙️ Funzionalità Chiave
- **Blocco a livello DNS**: Risparmio di banda e maggiore privacy.
- **Controllo Genitori**: Blocca servizi specifici o siti non sicuri.
- **Statistiche in Tempo Reale**: Visualizza quali domini vengono bloccati maggiormente.

---

## 🛠️ Troubleshooting & Supporto
- **DNS non risolve**: Verifica che la porta `53` sia correttamente esposta e non occupata da altri server DNS (come Pi-hole).
- **Setup Wizard non visibile**: Se non riesci ad accedere alla pagina di setup iniziale, riavvia l''add-on e controlla i log.

---

## 💎 Crediti & Attribuzioni
- **Integrazione & Branding**: **Alfonso Vertucci** - Working With Web.
- **Autore Originale**: Basato sull''add-on ufficiale della **Home Assistant Community** mantenuto da [Frenck](https://github.com/frenck).
- **Software Core**: AdGuard Home (AdguardTeam).

© 2026 Working With Web - Tutti i diritti riservati.

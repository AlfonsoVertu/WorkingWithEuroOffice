# 🔍 Elasticsearch (Branded Edition)

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
**Elasticsearch** è il motore di ricerca e analisi distribuito, RESTful, basato su JSON e ultra-veloce. All''interno della suite **Virtual World Gateway**, Elasticsearch permette di collezionare ed analizzare grandi volumi di dati provenienti dai tuoi dispositivi Home Assistant o dalle interazioni AI.

---

## 🚀 Guida al Primo Avvio
1. **Requisiti di Memoria**: Elasticsearch è un componente pesante. Assicurati che il tuo sistema abbia almeno **4GB di RAM** liberi. Puoi regolare il parametro `heap_size` nelle opzioni dell''add-on (es. `1g`).
2. **Setup**: Al primo avvio, l''add-on scaricherà e configurerà i binari ufficiali di Elasticsearch 8.x. 
3. **Endpoint**: Il servizio sarà disponibile internamente all''indirizzo `http://172.30.33.x:9200` o esternamente sulla porta `9200`.

---

## ⚙️ Configurazione
| Opzione | Descrizione | Default |
| :--- | :--- | :--- |
| `heap_size` | Quantità di RAM dedicata alla JVM di Elasticsearch. | `1g` |
| Porta 9200 | Porta API REST. | `9200` |
| Porta 9300 | Porta di comunicazione tra nodi. | `9300` |

---

## 🛠️ Troubleshooting & Supporto
- **L''add-on si arresta improvvisamente**: Probabilmente il tuo sistema ha esaurito la RAM (Out Of Memory). Prova a ridurre lo `heap_size` o a chiudere altri add-on non necessari.
- **Accesso Negato**: Per impostazione predefinita, questa installazione è semplificata per uso interno. Se vuoi abilitare la sicurezza (username/password), dovrai mappare un volume di configurazione e modificare il file `elasticsearch.yml`.

---

## 💎 Crediti & Attribuzioni
- **Integrazione & Branding**: **Alfonso Vertucci** - Working With Web.
- **Software Core**: Elasticsearch 8.x di [Elastic](https://github.com/elastic).

© 2026 Working With Web - Tutti i diritti riservati.

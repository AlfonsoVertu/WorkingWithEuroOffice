# Elasticsearch

<div align="center">
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/vwg_logo.png" width="80" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/AlfonsoVertu/virtual_world_gateway_ha/master/www_logo.png" width="80" />
</div>

---

Motore di ricerca e analisi distribuito basato su Lucene. Permette di indicizzare, cercare e analizzare grandi volumi di dati in tempo reale. All'interno della suite Virtual World Gateway può essere usato per:
- Ricerca full-text su Nextcloud (tramite il campo `elasticsearch_server`)
- Raccolta e analisi di log e eventi da Home Assistant
- Backend di ricerca per applicazioni personalizzate

---

## Configurazione dell'add-on

| Parametro | Descrizione |
|:---|:---|
| `heap_size` | Quantità di RAM allocata alla JVM Elasticsearch. Formato: `512m`, `1g`, `2g`. Non superare metà della RAM totale del sistema. |

**Porte esposte:**
| Porta | Utilizzo |
|:---|:---|
| `9200` | API REST HTTP (ricerche, indici, health check) |
| `9300` | Comunicazione tra nodi (cluster) |

---

## Primo avvio

1. Avvia l'add-on. L'inizializzazione può richiedere 30-60 secondi.
2. Verifica che il servizio sia attivo:
   ```
   http://<ip-ha>:9200
   ```
   Dovresti ricevere un JSON con il nome del cluster e la versione di Elasticsearch.
3. Per connettere Nextcloud, inserisci `<ip-ha>:9200` nel campo `elasticsearch_server` della sua configurazione.

---

## Utilizzo con Nextcloud

Con Nextcloud:
1. Imposta `elasticsearch_server: <ip-ha>:9200` nella configurazione dell'add-on Nextcloud.
2. In Nextcloud → **App** → cerca e installa "Full text search" e "Full text search - Elasticsearch Platform".
3. In **Impostazioni Amministrazione → Full text search** configura l'indirizzo del server e avvia l'indicizzazione.

---

## Utilizzo con l'integrazione HA Elasticsearch

Per inviare eventi e stati di HA a Elasticsearch, installa l'integrazione [homeassistant-elasticsearch](https://github.com/legrego/homeassistant-elasticsearch) tramite HACS:
1. Installa via HACS → Integrazioni → "Elasticsearch".
2. Aggiungi l'integrazione in HA → **Impostazioni → Integrazioni**.
3. URL: `http://<ip-ha>:9200` (nessuna autenticazione richiesta in questa configurazione base).

---

## Requisiti di sistema

> ⚠️ Elasticsearch è un servizio pesante. Prima di avviarlo assicurati di avere:
> - **Almeno 2 GB di RAM liberi** (consigliati 4 GB per uso stabile)
> - **Disco SSD** per prestazioni accettabili sull'indicizzazione

Regola `heap_size` in base alla RAM disponibile: non allocare più della metà della RAM totale del sistema (es. con 8 GB di RAM, usa `heap_size: 4g` al massimo).

---

## Troubleshooting

**L'add-on si avvia e poi si chiude immediatamente**
→ Il sistema ha terminato la memoria (OOM Killer). Riduci `heap_size` (prova con `512m`) o libera RAM chiudendo altri add-on.

**Porta 9200 non risponde**
→ Attendere 60 secondi dall'avvio prima di testare. Se persiste, controlla i log per errori di bootstrap.

**Nextcloud non trova Elasticsearch**
→ Verifica che l'indirizzo nel campo `elasticsearch_server` sia `<ip-ha>:9200` senza `http://`. Testa la raggiungibilità con `curl http://<ip-ha>:9200`.

---

## Crediti

Integrazione e branding: [Alfonso Vertucci](https://workingwithweb.it/webagency/) — Working With Web.
Software core: **Elasticsearch 8.x** di [Elastic](https://github.com/elastic) — [elastic.co](https://www.elastic.co)
Documentazione ufficiale: [elastic.co/guide/en/elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html)

Progetto Virtual Gate: [virtualgate.workingwithweb.eu](https://virtualgate.workingwithweb.eu/)

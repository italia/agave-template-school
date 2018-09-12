# Agave template Scuola

Questo repository contiene un sito statico funzionante scritto con [Jekyll](https://jekyllrb.com)

## Utilizzo

Per il corretto utikizzo del template si consiglia di utilizzare RUBY 2.4.3 e NODE 8.9.4 tramite YARN.
Per prima cosa, occorre installare tutte le dipendenze del progetto lanciando:

```
bundle
yarn
```

Per avviare il sistema in modalita `development` (con live-reload), lanciare:

```
yarn start
```

Per costruire quindi il sistema e avviare il sito statico in `production` lanciare:

```
yarn build
```

L'output finale sara salvato all'interno della directory `build` sopra la radice del progetto corrente.
Questo per consentire il corretto funzionamento del sito statico all'interno di Agave.

## Variabili di sistema

Per l'ambiente di sviluppo occorre configurare due variabili d'ambiente all'interno di un file `.env`.
Le variabili sono

```
AGAVECMS_BASE_URL=http://agave.lvh.me:3000
AGAVE_API_TOKEN=AGAVE_API_KEY
```

### Test AGAVE API

Per effettuare un test verso il sistema di chiamate API di Agave, lanciare::

```
curl http://agave.lvh.me:3000/api/item-types -H "Authorization:Bearer AGAVE API KEY" -H "Accept:application/json"
```

E possibile visualizzare un output di test all'interno del file `curl_test.json`

### Altre informazioni

- ImageFlow: generatore di thumbnail e resize on-demand delle immagini [Link documentazione](/docs/ImageFlowGeneralDocumentation.md)
- Aggiungere una libreria (JS e SASS) tramite yarn [Link documentazione](/docs/CustomLibraryDocumentation.md)
- Generare una nuova pagina o collezione [Link documentazione](/docs/NewContentDocumentation.md)
- Aggiungere Privacy e Cookie Policy [Link documentazione](/docs/PrivacyPolicy.md)
- Inserire una Mappa [Link documentazione](/docs/MapsDocumentation.md)
- Inserire un form di contatti [Link documentazione](/docs/ContactDocumentation.md)

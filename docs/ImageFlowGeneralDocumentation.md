## Importare le immagini caricate

Il sistema prevede la possibilita di generare in maniera dinamica thumbnail o altre trasformazioni sulle immagini.

Per poter fare questo occorre specificare determinati parametri quando si richiede l'immagini all'interno del file di configurazione di Agave.
Di seguito un esmpio di codice per la generazione degli url delle immagini che poi saranno utilizzabili all'interno del template Jekyll:

``` ruby
{
  ...
  image: model_name.image.url(w: 700, h: 300, mode: "crop"),
  ...
}
```

Come si puo vedere dall'esempio occorre indicare il codice (API_KEY) del modello che si vuole utilizzare e il relativo campo field.
Per i tipi di campi IMMAGINE e FILE il sistema prevede un helper tramite il quale generare automaticamente l'url con i parametri in GET.

### Parametri disponibili

- `width | w` => imposta la larghezza massima dell'immagine
- `height | h` => imposta l'altezza massima dell'immagine
- `mode` => permette di impostare la modalita di resize dell'immagine; i valori accettatti sono:
  - `max` => l'immagine viene ridimensionata mantenendo le proporzioni fino alla larghezza o altezza massime impostate
  - `pad` => l'immagine viene ridimensionata ma se non rispetta le proporzioni impostate viene aggiunto un bordo bianco
  - `crop` => l'immagine viene ritagliata delle dimensioni esatte impostate
  - `stretch` => l'immagine viene ridimensionata senza mantenere le proporzioni fino alle misure impostate
- `format` => e possibile impostare un formato differente dall'immagine originale caricata; i formati supportati sono (jpg,png,gif)
- `bgcolor` => e possibile passare come parametro l'esadecimale del colore scelto
- `s.grayscale | s.sepia` => per impostare se si vuole l'immagine in scala di grigi o in seppia

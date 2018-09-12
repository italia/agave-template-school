## Come Impostare la privacy

Per inserire secondo i vigenti termini di legge tutte le direttive per essere GDPR occorre iscriversi al servizio IUBENDA.
Occorre iscriversi al servizio che comprende un'account gratuito senza la necessita di impostare nessuna carta di credito.

Una volta configurato l'account e i vari dati richiesti e sufficiente copiare lo script fornito da IUBENDA ed inserirlo all'intermno del layout di default.
Fare attenzione perche sono forniti due script differenti; il primo per l'intergazione della sola Privacy Policy mentre il secondo per la generazione automatica del banner di avviso dei cookie.
Di seguito un esempio di come inserire il tutto:

`src/_layouts/default.html`
```html
<script type="text/javascript">(function (w,d) {var loader = function () {var s = d.createElement("script"), tag = d.getElementsByTagName("script")[0]; s.src="https://cdn.iubenda.com/iubenda.js"; tag.parentNode.insertBefore(s,tag);}; if(w.addEventListener){w.addEventListener("load", loader, false);}else if(w.attachEvent){w.attachEvent("onload", loader);}else{w.onload = loader;}})(window, document);</script>
<script type="text/javascript"> var _iub = _iub || []; _iub.csConfiguration = {"lang":"it","siteId": SITE_ID,"cookiePolicyId": COOKIE_POLICY_ID}; </script><script type="text/javascript" src="//cdn.iubenda.com/cookie_solution/safemode/iubenda_cs.js" charset="UTF-8" async></script>
</body>
```

`src/_includes/footer.html`
```html
    <ul class="list-inline border-top">
      <li class="list-inline-item"><a href="/contatti" class="white-color" title="Contatti">Contatti</a></li>
      <li class="list-inline-item"><a href="https://www.iubenda.com/privacy-policy/IUBENDA_PRIVACY_ID" class="iubenda-nostyle no-brand iubenda-embed " title="Privacy Policy">Privacy Policy</a></li>
    </ul>
  </div>
</footer>
```

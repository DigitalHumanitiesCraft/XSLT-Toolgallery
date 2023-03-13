## Übung 2
### HTML Ansicht (mit Bootstrap) des Rezepts

1. Englischen Titel des Rezepts als HTML `<title>`
2. Englischen und Frühneuhochdeutschen Titel als Überschrift und Unterüberschrift auf der Website
3. Alle Zutaten sollten grün hinterlegt werden
4. Alle Tools sollen blau hinterlegt werden
5. Wir befüllen eine Bootstrap Card mit den Metadaten aus dem TEI Header aus `<creation>` und platzieren sie über unserem Rezept
6. Wir erstellen eine Bootstrap Card mit allen Zutaten und Tools aus dem Rezept und sortieren diese alphabetisch und platzieren diese unter der Metadaten
7. Ungefährer Output:

```html
<!DOCTYPE HTML>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Game meat, how to season</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   </head>
   <body class="container">
      <h1>Game meat, how to season</h1>
      <h2>Merkch an welch wilpreat man gwuercz in dem hafem tuen sol oder nicht</h2>
      <div class="card">
         <div class="card-body">
            <h5 class="card-title">Datierung:</h5>
            <p class="card-text">Teil I
               (Kochrezeptsammlung): Mitte 15. Jh.; Teil III: Mitte 14.
               Jh.</p>
            <h5 class="card-title">Herkunft:</h5>
            <p class="card-text">Evtl. Augustiner-Chorherrenstift St.
               Dorothea Wien</p>
         </div>
      </div>
      <div class="card">
         <div class="card-body">
            <h5 class="card-title">Zutaten:</h5>
            <ul class="card-text">
               <li>aycharnn</li>
               <li>gesalczen</li>
               <li>gwuercz</li>
               <li>gwurcz</li>
               <li>gwurcz</li>
               <li>gwurcz</li>
               <li>hasen</li>
               <li>hirsen</li>
               <li>pheffer</li>
               <li>rehen</li>
               <li>salczen</li>
               <li>vogeln</li>
               <li>wilpreat</li>
               <li>wilpreat</li>
               <li>wilpret</li>
               <li>wilpret</li>
            </ul>
            <h5 class="card-title">Tools:</h5>
            <ul class="card-text">
               <li>hafem</li>
               <li>hafen</li>
               <li>hafen</li>
               <li>schussel</li>
            </ul>
         </div>
      </div>
      Merkch an welch <span class="text-bg-success">wilpreat</span> man <span class="text-bg-success">gwuercz</span> in dem <span class="text-bg-primary">hafem</span> tuen sol oder nicht
      ZV allen <span class="text-bg-success">wilpret</span> sol man <span class="text-bg-success">gwurcz</span> machen vnd
      daran tuen in den <span class="text-bg-primary">hafen</span> zu einem gepraten <span class="text-bg-success">rehen</span> oder gesoten <span class="text-bg-success">hirsen</span>
      zu dem secz mans besunder gemacht in einer ander <span class="text-bg-primary">schussel</span> Aber
      zu <span class="text-bg-success">hasen</span> <span class="text-bg-success">aycharnn</span> vnd zu <span class="text-bg-success">vogeln</span> an dy alle geust man <span class="text-bg-success">gwurcz</span> in den <span class="text-bg-primary">hafen</span>
      nu merkch man sol kain <span class="text-bg-success">pheffer</span> noch <span class="text-bg-success">gwurcz</span> <span class="text-bg-success">salczen</span> dy man besunder zu dem <span class="text-bg-success">wilpreat</span> wil wenn das <span class="text-bg-success">wilpret</span> ist vor <span class="text-bg-success">gesalczen</span><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script></body>
</html>
```
8. Output im Ordner "Output" unter dem Dateinamen "output_uebung2.html" speichern

<details><summary><h2>Hints</h2></summary>
<p>

- Wir benötigen `<xsl:value-of>`, `<xsl:apply-templates>` und `<xsl:for-each>` mit `<xsl:sort>`
- Saxon erzeugt für uns schon ein `<meta>` Element, dass `<meta charset="utf-8">` aus der Bootstrap Vorlage überflüssig macht
- Standardmäßig sortiert `<xsl:sort>` alphabetisch
- Unter https://getbootstrap.com/docs/5.2/helpers/color-background/ bietet Bootstrap eine Klasse für Hintergrund und passende Textfarbe in einem!

</p>
</details>

<details><summary><h2>Solution</h2></summary>
<p>

```xslt
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all" version="2.0">

<xsl:output method="html"/>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <title><xsl:value-of select="//t:titleStmt/t:title[@xml:lang='en']"/></title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"/>
            </head>
            <body class="container">
                <h1><xsl:value-of select="//t:titleStmt/t:title[@xml:lang='en']"/></h1>
                <h2><xsl:value-of select="//t:titleStmt/t:title[@xml:lang='de-x-enh']"/></h2>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Datierung:</h5>
                        <p class="card-text"><xsl:value-of select="//t:origDate/t:date[@xml:lang='de']"/></p>
                        <h5 class="card-title">Herkunft:</h5>
                        <p class="card-text"><xsl:value-of select="//t:origPlace/t:placeName[@xml:lang='de']"/></p>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Zutaten:</h5>
                        <ul class="card-text">
                            <xsl:for-each select="//t:ingredient">
                                <xsl:sort/>
                                <li>
                                    <xsl:value-of select="."/>
                                </li>
                            </xsl:for-each>
                        </ul>
                        <h5 class="card-title">Tools:</h5>
                        <ul class="card-text">
                            <xsl:for-each select="//t:tool">
                                <xsl:sort/>
                                <li>
                                    <xsl:value-of select="."/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
                <xsl:apply-templates select="//t:body"/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="t:ingredient">
        <span class="text-bg-success"><xsl:value-of select="."/></span>
    </xsl:template>
    <xsl:template match="t:tool">
        <span class="text-bg-primary"><xsl:value-of select="."/></span>
    </xsl:template>

</xsl:stylesheet>
```
</p>
</details>

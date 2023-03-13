## Übung 4
### HTML Ansicht (mit Bootstrap) des Rezepts

1. Wenn das Attribut `ana="exclusion"` existiert färben wir die Zutat im Text rot ein und geben ihr den Tooltip "exkludierte Zutat"
2. Wenn das Attribut `ana="exclusion"` existiert färben wir die Zutat auch in der Liste rot ein und schreiben vor die Zutat "Exkludiert:"
3. Wir entfernen mehrfach vorhandene Zutaten und Tools in der Liste und erhalten die alphabetische Sortierung
4. Wenn eine Zutat in Englischen das Wort "meat" oder "squirrel" enthält, färben wir diese Zutaten in der Liste türkis und geben ihnen den Tooltip "meat or squirrel".
5. Unter dem Rezepttext frügen wir eine Zeile mit dem Link zur Manuskript Seite ein (`<bibl type="manuscript_page">`). Der Linktext soll sein: "W1_020r".
6. Ungefährer Output:

```html
<!DOCTYPE HTML><html lang="en">
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
               <li><span class="text-bg-info" title="meat or squirrel">game meat</span></li>
               <li><span class="text-bg-danger">Exkludiert: pepper</span></li>
               <li>poultry</li>
               <li>rabbit</li>
               <li><span class="text-bg-info" title="meat or squirrel">red squirrel</span></li>
               <li><span class="text-bg-info" title="meat or squirrel">roe-deer meat</span></li>
               <li>spice</li>
               <li><span class="text-bg-danger">Exkludiert: table salt</span></li>
               <li>venison</li>
            </ul>
            <h5 class="card-title">Tools:</h5>
            <ul class="card-text">
               <li>pot</li>
               <li>bowl</li>
            </ul>
         </div>
      </div>
      Merkch an welch <a href="https://www.wikidata.org/wiki/Q19862498"><span class="text-bg-success" title="Zutat">wilpreat</span></a> man <a href="https://www.wikidata.org/wiki/Q42527"><span class="text-bg-success" title="Zutat">gwuercz</span></a> in dem <a href="https://www.wikidata.org/wiki/Q15711817"><span class="text-bg-primary" title="Tool">hafem</span></a> tuen sol oder nicht
      ZV allen <a href="https://www.wikidata.org/wiki/Q19862498"><span class="text-bg-success" title="Zutat">wilpret</span></a> sol man <a href="https://www.wikidata.org/wiki/Q42527"><span class="text-bg-success" title="Zutat">gwurcz</span></a> machen vnd
      daran tuen in den <a href="https://www.wikidata.org/wiki/Q15711817"><span class="text-bg-primary" title="Tool">hafen</span></a> zu einem gepraten <a href="https://www.wikidata.org/wiki/Q65244403"><span class="text-bg-success" title="Zutat">rehen</span></a> oder gesoten <a href="https://www.wikidata.org/wiki/Q2296872"><span class="text-bg-success" title="Zutat">hirsen</span></a>
      zu dem secz mans besunder gemacht in einer ander <a href="https://www.wikidata.org/wiki/Q153988"><span class="text-bg-primary" title="Tool">schussel</span></a> Aber
      zu <a href="https://www.wikidata.org/wiki/Q3556748"><span class="text-bg-success" title="Zutat">hasen</span></a> <a href="https://www.wikidata.org/wiki/Q4388"><span class="text-bg-success" title="Zutat">aycharnn</span></a> vnd zu <a href="https://www.wikidata.org/wiki/Q178559"><span class="text-bg-success" title="Zutat">vogeln</span></a> an dy alle geust man <a href="https://www.wikidata.org/wiki/Q42527"><span class="text-bg-success" title="Zutat">gwurcz</span></a> in den <a href="https://www.wikidata.org/wiki/Q15711817"><span class="text-bg-primary" title="Tool">hafen</span></a>
      nu merkch man sol kain <a href="https://www.wikidata.org/wiki/Q3143131"><span class="text-bg-danger" title="exkludierte Zutat">pheffer</span></a> noch <a href="https://www.wikidata.org/wiki/Q42527"><span class="text-bg-danger" title="exkludierte Zutat">gwurcz</span></a> <a href="https://www.wikidata.org/wiki/Q11254"><span class="text-bg-danger" title="exkludierte Zutat">salczen</span></a> dy man besunder zu dem <a href="https://www.wikidata.org/wiki/Q19862498"><span class="text-bg-success" title="Zutat">wilpreat</span></a> wil wenn das <a href="https://www.wikidata.org/wiki/Q19862498"><span class="text-bg-success" title="Zutat">wilpret</span></a> ist vor <a href="https://www.wikidata.org/wiki/Q11254"><span class="text-bg-success" title="Zutat">gesalczen</span></a><div>Manuscript Seite: <a href="https://gams.uni-graz.at/o:corema.w1#W1_020r">W1_020r</a></div><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script></body>
</html>
```
8. Output im Ordner "Output" unter dem Dateinamen "output_uebung3.html" speichern

<details><summary><h2>Hints</h2></summary>
<p>

- Wir benötigen für die Conditional Statements (Wenn --> Dann) `<xsl:if>` und/oder `<xsl:choose>`. Diese können auch verschachtelt werden.
- Mit `<for-each-group>` lassen sich beliebige Gruppen zusammenfassen und somit distinkte Werte ausgeben.
- Mit der Xpath-Funktion `contains()` und den "boolean operators" OR und AND lassen sich Textfragmente abfragen.
- Die Funktion `substring-after()`wird in der Praxis sehr häufig im Zusammenhang mit Links oder Ankerpunkten oder anderen URIs verwendet

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
                            <xsl:for-each-group select="//t:ingredient" group-by="@en">
                                <xsl:sort select="current-grouping-key()"/>
                                   <xsl:choose>
                                       <xsl:when test="@ana='exclusion'">
                                           <li>
                                                <span class="text-bg-danger"><xsl:text>Exkludiert: </xsl:text><xsl:value-of select="current-grouping-key()"/></span>
                                           </li>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <li>
                                                <xsl:choose>
                                                    <xsl:when test="contains(current-grouping-key(),'meat') or contains(current-grouping-key(),'squirrel')">
                                                        <span class="text-bg-info" title="meat or squirrel"><xsl:value-of select="current-grouping-key()"/></span>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="current-grouping-key()"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </li>
                                        </xsl:otherwise>
                                   </xsl:choose>
                            </xsl:for-each-group>
                        </ul>
                        <h5 class="card-title">Tools:</h5>
                        <ul class="card-text">
                            <xsl:for-each-group select="//t:tool" group-by="@en">
                                <xsl:sort/>
                                <li>
                                    <xsl:value-of select="current-grouping-key()"/>
                                </li>
                            </xsl:for-each-group>
                        </ul>
                    </div>
                </div>
                <xsl:apply-templates select="//t:body"/>
                <div>
                    <xsl:variable name="ms_page_link" select="//t:bibl[@type='manuscript_page']/t:ref/@target"/>
                    <xsl:text>Manuscript Seite: </xsl:text><a href="{$ms_page_link}"><xsl:value-of select="substring-after($ms_page_link,'#')"/></a>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="t:instruction">
        <xsl:result-document href="instructions/{translate(substring(.,1,10),' ','')}.xml" method="xml">
            <instruction><xsl:value-of select="."/></instruction>
        </xsl:result-document>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="t:ingredient">
        <xsl:call-template name="commodity">
            <xsl:with-param name="type">
                <xsl:if test="@ana='exclusion'">
                    <xsl:text>exkludierte Zutat</xsl:text>
                </xsl:if>
                <xsl:if test="not(@ana='exclusion')">
                    <xsl:text>Zutat</xsl:text>
                </xsl:if>
            </xsl:with-param>
            <xsl:with-param name="color">
                <xsl:if test="@ana='exclusion'">
                    <xsl:text>danger</xsl:text>
                </xsl:if>
                <xsl:if test="not(@ana='exclusion')">
                    <xsl:text>success</xsl:text>
                </xsl:if>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="t:tool">
        <xsl:call-template name="commodity">
            <xsl:with-param name="type">Tool</xsl:with-param>
            <xsl:with-param name="color">primary</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="commodity">
        <xsl:param name="type"/>
        <xsl:param name="color"/>
        <xsl:variable name="wd" select="concat('https://www.wikidata.org/wiki/',@commodity)"/>
        <a href="{$wd}">
            <span class="text-bg-{$color}">
                <xsl:attribute name="title">
                    <xsl:value-of select="$type"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </span>
        </a>
    </xsl:template>

</xsl:stylesheet>
```
</p>
</details>

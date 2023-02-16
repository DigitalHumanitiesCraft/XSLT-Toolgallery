## Übung 1

1. Projekt in Oxygen anlegen
2. Transformationsszenario einrichten
3. Input: input.xml (Ein Kochrezept aus dem Projekt http://gams.uni-graz.at/corema )
4. Gewünschter Output (der exakte Inhalt inkl. aller Elemente von `<body>`, jedoch "formatiert"):

```xml
<?xml version="1.0" encoding="UTF-8"?>
<TEI xmlns="http://www.tei-c.org/ns/1.0">
   <recipe>
      <div n="173" type="kitchenTip" xml:id="w1.173" xml:lang="de-x-enh">
         <title key="Game meat, how to season">Merkch an welch <ingredient commodity="Q19862498" en="game meat">wilpreat</ingredient> man <ingredient commodity="Q42527" en="spice">gwuercz</ingredient> in dem <tool commodity="Q15711817" en="pot">hafem</tool> tuen sol oder nicht</title>
         <instruction>ZV allen <ingredient commodity="Q19862498" en="game meat">wilpret</ingredient> sol man <ingredient commodity="Q42527" en="spice">gwurcz</ingredient> machen</instruction> vnd
<instruction>daran tuen in den <tool commodity="Q15711817" en="pot">hafen</tool> zu einem <alternative reason="ingredient">gepraten <ingredient commodity="Q65244403" en="roe-deer meat">rehen</ingredient> oder gesoten <ingredient commodity="Q2296872" en="venison">hirsen</ingredient>
            </alternative>
         </instruction>
         <instruction>zu dem secz mans besunder gemacht in einer ander <tool commodity="Q153988" en="bowl">schussel</tool>
         </instruction> Aber
<instruction>
            <alternative reason="ingredient">zu <ingredient commodity="Q3556748" en="rabbit">hasen</ingredient>
               <ingredient commodity="Q4388" en="red squirrel">aycharnn</ingredient> vnd zu <ingredient commodity="Q178559" en="poultry">vogeln</ingredient>
            </alternative> an dy alle geust man <ingredient commodity="Q42527" en="spice">gwurcz</ingredient> in den <tool commodity="Q15711817" en="pot">hafen</tool>
         </instruction>
         <instruction>nu merkch man sol kain <ingredient ana="exclusion" commodity="Q3143131" en="pepper">pheffer</ingredient> noch <ingredient ana="exclusion" commodity="Q42527" en="spice">gwurcz</ingredient>
            <ingredient ana="exclusion" commodity="Q11254" en="table salt">salczen</ingredient> dy man besunder zu dem <ingredient commodity="Q19862498" en="game meat">wilpreat</ingredient> wil wenn das <ingredient commodity="Q19862498" en="game meat">wilpret</ingredient> ist vor <ingredient commodity="Q11254" en="table salt">gesalczen</ingredient>
         </instruction>
      </div>
   </recipe>
</TEI>

```
5. Output im Ordner "Output" unter dem Dateinamen "output_uebung1.xml" speichern

<details><summary><h2>Hints</h2></summary>
<p>

- Indent kann gesteuert werden über `<xsl:output>`
- Ganze Element-Strukturen können mit `<xsl:copy-of>` übernommen werden
- Output Files können unter einer normalen Pfadangabe im Transformations-Szenario "verschoben" werden

</p>
</details>

<details><summary><h2>Solution</h2></summary>
<p>

```xslt
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all" version="2.0">
    
    <xsl:output encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <recipe>
                <xsl:copy-of select="//t:body/t:div"/>
            </recipe>
        </TEI>
    </xsl:template>
</xsl:stylesheet>
```
</p>
</details>

## Zusatzübung (5)
### Wir Visualisieren Geburts- und Sterbeorte aus einem SPARQL XML Result

1. Gegeben ist ein SPARQL Result als XML wie es z.B. GraphDB generiert.
2. Wir wollen alle Geburtsorte (`bPlace_label|lat|long`) als `Point` visualisieren
3. Wir wollen alle Sterbeorte (`dPlace_label|lat|long`) als `Point` visualisieren
4. Wir wollen diese Punkte mit einer `LineString` verbinden
5. Output:

```json
{
    "type": "FeatureCollection",
    "features": [
        {
            "type": "Feature",
            "properties": {
                "name": "Geburtsort bis Todesort von zur Mühlen, Hermynia",
                "description": "Geboren: Wien am 12.12.1883 |  | Gestorben: Radlett am 20.03.1951"
            },
            "geometry": {
                "type": "LineString",
                "coordinates": [
                    [
                        16.3725,
                        48.208333333333336
                    ],
                    [
                        -0.3175,
                        51.684166666667
                    ]
                ]
            }
        },
        {
            "type": "Feature",
            "properties": {
                "name": "Geburtsort zur Mühlen, Hermynia",
                "description": "Geboren: Wien am 12.12.1883"
            },
            "geometry": {
                "type": "Point",
                "coordinates": [
                    16.3725,
                    48.208333333333336
                ]
            }
        },
        ...
            {
            "type": "Feature",
            "properties": {
                "name": "Sterbeort Abel-Musgrave, Curt Emil Josua",
                "description": "Gestorben: Cambridge, MA am 03.11.1938"
            },
            "geometry": {
                "type": "Point",
                "coordinates": [
                    -71.106111111111,
                    42.375
                ]
            }
        }
    ]
}
```
8. Output im Ordner "Output" unter dem Dateinamen "output_uebung5.geojson" speichern
9. Wir testen unser GeoJSON hier: https://geojson.tools/

<details><summary><h2>Hints</h2></summary>
<p>

- Als Output brauchen wir ein JSON: `<xsl:output encoding="UTF-8" method="text" media-type="application/json"/>`
- Wir müssen zu Beginn testen wo überall ein Sterbeort angegeben ist `<xsl:if test="s:dPlace_lat">`
- Mit `<for-each-group>` lassen sich unsere Personen als Gruppen zusammenfassen
- Wie ein GeoJSON aussehen muss findet man an vielen Orten, z.B. hier: https://geojson.org/ oder hier: https://en.wikipedia.org/wiki/GeoJSON

</p>
</details>

<details><summary><h2>Solution</h2></summary>
<p>

```xslt
<?xml version="1.0" encoding="UTF-8"?>

<!--Dieses Stylesheet muss auf https://glossa.uni-graz.at/archive/objects/query:exil.geolocations/methods/sdef:Query/getXML?params=$1|%3Fperson angewandt werden und dann das ergebnis (=umap = geojson mit ein paar optionen für umpap) in https://umap.openstreetmap.fr/de/map/exiltrans_776055 eingespielt werden-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" exclude-result-prefixes="#all"
    version="3.0">

    <xsl:strip-space elements="*"/>
    <xsl:output encoding="UTF-8" method="text" media-type="application/json"/>

    <xsl:template match="/">
        <xsl:text>
             {
             "type": "FeatureCollection",
             "features": [
        </xsl:text>
        <xsl:for-each-group select="//s:result" group-by="s:person/@uri">
            <xsl:if test="s:dPlace_lat">
                <xsl:text>

             <!--Line für Geburtsort zu letztem Wirkungsort oder erstem Exil Beginn-->
             {
                "type": "Feature",
                "properties": {
                    "name": "Geburtsort bis Todesort von </xsl:text>
                <xsl:value-of select="s:fname"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="s:gname"/>
                <xsl:text>",
                    "description": "</xsl:text>
                <xsl:if test="s:bPlace_label">
                    <xsl:text>Geboren: </xsl:text>
                    <xsl:value-of select="s:bPlace_label"/>
                    <xsl:text> am </xsl:text>
                    <xsl:value-of select="s:bDate"/>
                    <xsl:text> | </xsl:text>
                </xsl:if>
                <xsl:if test="s:dPlace_label">
                    <xsl:text> | Gestorben: </xsl:text>
                    <xsl:value-of select="s:dPlace_label"/>
                    <xsl:text> am </xsl:text>
                    <xsl:value-of select="s:dDate"/>
                </xsl:if>
                <xsl:text>"</xsl:text>

                <xsl:text>
                },
                "geometry": {
                    "type": "LineString",
                    "coordinates": [</xsl:text>
                <xsl:if test="s:bPlace_label">
                    <xsl:text>
                            [
                        </xsl:text>
                    <xsl:text>        </xsl:text>
                    <xsl:value-of select="s:bPlace_long"/>
                    <xsl:text>,
                                </xsl:text>
                    <xsl:value-of select="s:bPlace_lat"/>
                    <xsl:text>
                            ],</xsl:text>
                </xsl:if>
                <xsl:if test="s:dPlace_label">
                    <xsl:text>
                            [
                       </xsl:text>
                    <xsl:text>        </xsl:text>
                    <xsl:value-of select="s:dPlace_long"/>
                    <xsl:text>,
                                </xsl:text>
                    <xsl:value-of select="s:dPlace_lat"/>
                    <xsl:text>
                            ]</xsl:text>
                </xsl:if>
                <xsl:text>
                     ]
                  }
                },</xsl:text>
                <!--Line für Geburtsort zu letztem Wirkungsort oder erstem Exil Ende-->


                <!--Geburtsort Beginn -->
                <xsl:if test="s:bPlace_label">
                    <xsl:text>
        {
            "type": "Feature",
            "properties": {
                "name": "Geburtsort </xsl:text>
                    <xsl:value-of select="s:fname"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="s:gname"/>
                    <xsl:text>",
                "description": "Geboren: </xsl:text>
                    <xsl:value-of select="s:bPlace_label"/>
                    <xsl:text> am </xsl:text>
                    <xsl:value-of select="s:bDate"/>
                    <xsl:text>"</xsl:text>
                    <xsl:text>
                    },
                 "geometry": {
                    "type": "Point",
                    "coordinates": [
                    </xsl:text>
                    <xsl:text>    </xsl:text>
                    <xsl:value-of select="s:bPlace_long"/>
                    <xsl:text>,
                        </xsl:text>
                    <xsl:value-of select="s:bPlace_lat"/>
                    <xsl:text>
                            ]
                    }
                },
                </xsl:text>
                </xsl:if>
                <!--Geburtsort Ende -->

                <!--Sterbeort Beginn -->
                <xsl:if test="s:dPlace_label">
                    <xsl:text>
    {
        "type": "Feature",
        "properties": {
            "name": "Sterbeort </xsl:text>
                    <xsl:value-of select="s:fname"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="s:gname"/>
                    <xsl:text>",
            "description": "Gestorben: </xsl:text>
                    <xsl:value-of select="s:dPlace_label"/>
                    <xsl:text> am </xsl:text>
                    <xsl:value-of select="s:dDate"/>
                    <xsl:text>"</xsl:text>
                    <xsl:text>
                },
             "geometry": {
                "type": "Point",
                "coordinates": [
                </xsl:text>
                    <xsl:text>    </xsl:text>
                    <xsl:value-of select="s:dPlace_long"/>
                    <xsl:text>,
                    </xsl:text>
                    <xsl:value-of select="s:dPlace_lat"/>
                    <xsl:text>
                        ]
                }
            }
            </xsl:text>
                </xsl:if>
                <!--Sterbeort Ende -->

                <xsl:if test="position() != last()">
                    <xsl:text>,</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>
 ]
}
</xsl:text>
    </xsl:template>
</xsl:stylesheet>
```
</p>
</details>

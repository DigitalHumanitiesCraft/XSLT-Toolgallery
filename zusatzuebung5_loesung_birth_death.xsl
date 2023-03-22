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

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
            <xsl:if test="s:exil_country_lat">
                <xsl:text>
         
             <!--Line für Geburtsort zu letztem Wirkungsort oder erstem Exil Beginn-->  
             {
                "type": "Feature",
                "properties": {
                    "name": "Geburtsort bis letzter Wirkungsort (falls vorhanden, ansonsten bis 1. Exilort) von </xsl:text>
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
                <xsl:if test="s:placeOfActivity_place">
                    <xsl:text>Letzter Wirkungsort: </xsl:text>
                    <xsl:value-of select="s:placeOfActivity_place"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="s:placeOfActivity_year"/>
                    <xsl:text> | </xsl:text>
                </xsl:if>
                <xsl:text>Exilstationen: </xsl:text>
                <xsl:for-each select="current-group()">
                    <xsl:sort select="s:exil_year"/>
                    <xsl:sort select="s:exil_place"/>

                    <xsl:choose>
                        <xsl:when test="s:exil_place">
                            <xsl:value-of select="s:exil_place"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:exil_country"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="s:exil_year">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:exil_year"/>
                    </xsl:if>
                    <xsl:if test="position() != last()">
                        <xsl:text> ➝ </xsl:text>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="s:remigration_country">
                    <xsl:text> | Remigration: </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:remigration_place">
                            <xsl:value-of select="s:remigration_place"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:remigration_country"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="s:remigration_year">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:remigration_year"/>
                    </xsl:if>
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
                <xsl:choose>
                    <xsl:when test="s:placeOfActivity_place">
                        <xsl:text>
                                [
                            </xsl:text>
                        <xsl:text>        </xsl:text>
                        <xsl:value-of select="s:placeOfActivity_place_long"/>
                        <xsl:text>,
                                    </xsl:text>
                        <xsl:value-of select="s:placeOfActivity_place_lat"/>
                        <xsl:text>
                                ]</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="current-group()">
                            <xsl:sort select="s:exil_year"/>
                            <xsl:sort select="s:exil_place"/>
                            <xsl:if test="position() = 1">
                                <xsl:text>
                                [
                            </xsl:text>
                                <xsl:choose>
                                    <xsl:when test="s:exil_place">
                                        <xsl:text>        </xsl:text>
                                        <xsl:value-of select="s:exil_place_long"/>
                                        <xsl:text>,
                                    </xsl:text>
                                        <xsl:value-of select="s:exil_place_lat"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="s:exil_country_long"/>
                                        <xsl:text>,
                                    </xsl:text>
                                        <xsl:value-of select="s:exil_country_lat"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:text>
                                ]</xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>     
                     ]
                  }
                },</xsl:text>
                <!--Line für Geburtsort zu letztem Wirkungsort oder erstem Exil Ende-->
                <!--Line für eine Person Beginn-->
                <xsl:text>{
                "type": "Feature",
                "properties": {
                    "name": "Exilstationen von </xsl:text>
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
                <xsl:if test="s:placeOfActivity_place">
                    <xsl:text>Letzter Wirkungsort: </xsl:text>
                    <xsl:value-of select="s:placeOfActivity_place"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="s:placeOfActivity_year"/>
                    <xsl:text> | </xsl:text>
                </xsl:if>
                <xsl:text>Exilstationen: </xsl:text>
                <xsl:for-each select="current-group()">
                    <xsl:sort select="s:exil_year"/>
                    <xsl:sort select="s:exil_place"/>
                    <xsl:choose>
                        <xsl:when test="s:exil_place">
                            <xsl:value-of select="s:exil_place"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:exil_country"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="s:exil_year">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:exil_year"/>
                    </xsl:if>
                    <xsl:if test="position() != last()">
                        <xsl:text> ➝ </xsl:text>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="s:remigration_country">
                    <xsl:text> | Remigration: </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:remigration_place">
                            <xsl:value-of select="s:remigration_place"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:remigration_country"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="s:remigration_year">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:remigration_year"/>
                    </xsl:if>
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
                <xsl:if test="s:placeOfActivity_place">
                    <xsl:text>
                                [
                            </xsl:text>
                    <xsl:text>        </xsl:text>
                    <xsl:value-of select="s:placeOfActivity_place_long"/>
                    <xsl:text>,
                                    </xsl:text>
                    <xsl:value-of select="s:placeOfActivity_place_lat"/>
                    <xsl:text>
                                ], </xsl:text>
                </xsl:if>
                <xsl:for-each select="current-group()">
                    <xsl:sort select="s:exil_year"/>
                    <xsl:sort select="s:exil_place"/>

                    <xsl:text>
                            [
                        </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:exil_place">
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:exil_place_long"/>
                            <xsl:text>,
                                </xsl:text>
                            <xsl:value-of select="s:exil_place_lat"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:exil_country_long"/>
                            <xsl:text>,
                                </xsl:text>
                            <xsl:value-of select="s:exil_country_lat"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>
                            ]</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>,</xsl:text>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="s:remigration_country">
                    <xsl:text>,
                            [
                        </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:remigration_place">
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:remigration_place_long"/>
                            <xsl:text>,
                                </xsl:text>
                            <xsl:value-of select="s:remigration_place_lat"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:remigration_country_long"/>
                            <xsl:text>,
                                </xsl:text>
                            <xsl:value-of select="s:remigration_country_lat"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>
                            ]</xsl:text>
                </xsl:if>

                <xsl:text>     
                     ]
                  }
                },</xsl:text>
                <!--Line für eine Person Ende-->

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



                <!-- Letzter Wirkungsort Beginn -->
                <xsl:if test="s:placeOfActivity_country">
                    <xsl:text>   
{
    "type": "Feature",
    "properties": {
        "name": "</xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:placeOfActivity_place">
                            <xsl:value-of select="s:placeOfActivity_place"/>
                            <xsl:text> </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:placeOfActivity_country"/>
                            <xsl:text> </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="s:fname"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="s:gname"/>
                    <xsl:text>)",
        "description": "Letzter Wirkungsort vor dem Exil: </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:placeOfActivity_place">
                            <xsl:value-of select="s:placeOfActivity_place"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:placeOfActivity_country"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="s:placeOfActivity_year">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:placeOfActivity_year"/>
                    </xsl:if>
                    <xsl:text>"</xsl:text>
                    <xsl:text>
            },
         "geometry": {
            "type": "Point",
            "coordinates": [
            </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:placeOfActivity_place">
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:placeOfActivity_place_long"/>
                            <xsl:text>,
                            </xsl:text>
                            <xsl:value-of select="s:placeOfActivity_place_lat"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:placeOfActivity_country_long"/>
                            <xsl:text>,
                            </xsl:text>
                            <xsl:value-of select="s:placeOfActivity_country_lat"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>
                    ]
            }
        },
        </xsl:text>
                </xsl:if>
                <!-- Letzter Wirkungsort Ende -->

                <!--Remigration Beginn -->
                <xsl:if test="s:remigration_country">
                    <xsl:text>   
{
    "type": "Feature",
    "properties": {
        "name": "</xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:remigration_place">
                            <xsl:value-of select="s:remigration_place"/>
                            <xsl:text> </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:remigration_country"/>
                            <xsl:text> </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="s:fname"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="s:gname"/>
                    <xsl:text>)",
        "description": "Remigrationsort: </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:remigration_place">
                            <xsl:value-of select="s:remigration_place"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:remigration_country"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="s:remigration_year">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:remigration_year"/>
                    </xsl:if>
                    <xsl:text>"</xsl:text>
                    <xsl:text>
            },
         "geometry": {
            "type": "Point",
            "coordinates": [
            </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:remigration_place">
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:remigration_place_long"/>
                            <xsl:text>,
                            </xsl:text>
                            <xsl:value-of select="s:remigration_place_lat"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:remigration_country_long"/>
                            <xsl:text>,
                            </xsl:text>
                            <xsl:value-of select="s:remigration_country_lat"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>
                    ]
            }
        },
        </xsl:text>
                </xsl:if>
                <!--Remigration Ende -->

                <!--Exilstationen Beginn -->
                <xsl:for-each select="current-group()">
                    <xsl:sort select="s:exil_year"/>
                    <xsl:sort select="s:exil_place"/>
                    <xsl:text>
                {
                    "type": "Feature",
                    "properties": {
                        "name": "</xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:exil_place">
                            <xsl:value-of select="s:exil_place"/>
                            <xsl:text> </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:exil_country"/>
                            <xsl:text> </xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="s:fname"/>
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="s:gname"/>
                    <xsl:text>)",
                        "description": "Exilort: </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:exil_place">
                            <xsl:value-of select="s:exil_place"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:exil_country"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="s:exil_year">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="s:exil_year"/>
                    </xsl:if>
                    <xsl:text>"</xsl:text>
                    <xsl:if test="s:exil_year">
                        <xsl:text>,
                        "year": "</xsl:text>
                        <xsl:value-of select="s:exil_year"/>
                        <xsl:text>"</xsl:text>
                    </xsl:if>
                    <xsl:text>
                        },
                     "geometry": {
                        "type": "Point",
                        "coordinates": [
                    </xsl:text>
                    <xsl:choose>
                        <xsl:when test="s:exil_place">
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:exil_place_long"/>
                            <xsl:text>,
                            </xsl:text>
                            <xsl:value-of select="s:exil_place_lat"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>        </xsl:text>
                            <xsl:value-of select="s:exil_country_long"/>
                            <xsl:text>,
                            </xsl:text>
                            <xsl:value-of select="s:exil_country_lat"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>
                        ]
                     }
                  }
        </xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>,</xsl:text>
                    </xsl:if>

                </xsl:for-each>
                <!--Exilstationen Ende -->

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

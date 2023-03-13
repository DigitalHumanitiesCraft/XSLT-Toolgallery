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
    
    <xsl:template match="t:instruction">
        <xsl:result-document href="instructions/{translate(substring(.,1,10),' ','')}.xml" method="xml">
            <instruction><xsl:value-of select="."/></instruction>
        </xsl:result-document>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:ingredient">
        <xsl:call-template name="commodity">
            <xsl:with-param name="type">Zutat</xsl:with-param>
            <xsl:with-param name="color">success</xsl:with-param>
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
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
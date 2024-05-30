<?xml version="1.0" encoding="UTF-8"?>
<xsl:template match="/">
    <html>
        <head>
            <style>

            </style>
        </head>
        <body>
            <div class="starterarea">

            </div>
            <xsl:for-each select="world/area">
                <div>
                    <xsl:attribute name="class">area<xsl:value-of select="position()"></xsl:value-of></xsl:attribute>
                </div>
            </xsl:for-each>
        </body>
    </html>
</xsl:template>

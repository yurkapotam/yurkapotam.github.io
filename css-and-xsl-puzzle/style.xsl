<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<style>
    z b
    {
        transition: 9999s 9999s;
    }

    z:active a
    {
        width: 100%;
        transition: 0s;
    }

    g:before {
        content: "Original Image";
        color: #fff;
        font-size: 25px;
        font-weight: bold;
        text-shadow: 0 0 2px #000,0 0 2px #000,0 0 2px #000;
        position: fixed;
        top: 10px;
        left: 10px;
        width: calc(<xsl:value-of select="puzzle/size" />*var(--s)*0.6);
        aspect-ratio: 1;
        -webkit-mask: repeating-linear-gradient(-45deg,#000 0 10%,#000d 0 20%);
        background: var(--i) 0/100% 100%;
        display: grid;
        place-content: center;
    }

    z:first-child b
    {
        height: calc(100% + var(--r));
        width: 100%;
        --m: 
            radial-gradient(var(--r) at 100% calc(50% + var(--r)/2),#0000 98%,#000)
             0 calc(-1*var(--r)) no-repeat,
            radial-gradient(var(--r) at 50% calc(100% - var(--r)),#000 98%,#0000)
    }

    z:nth-child(-n + calc(<xsl:value-of select="puzzle/size" /> - 1)):not(:first-child) b
    {
        place-self: start end;
        height: calc(100% + var(--r));
        width: calc(100% + var(--r));
        --m: 
            radial-gradient(var(--r) at calc(100% - var(--r)) calc(50% + var(--r)/2),#0000 98%,#000)
             var(--r) calc(-1*var(--r)) no-repeat,
            radial-gradient(var(--r) at var(--r) calc(50% - var(--r)/2),#000 98%,#0000),
            radial-gradient(var(--r) at calc(50% + var(--r)/2) calc(100% - var(--r)),#000 98%,#0000)
    }

    z:nth-child(<xsl:value-of select="puzzle/size" />) b
    {
        place-self: start end;
        height: calc(100% + var(--r));
        width: calc(100% + var(--r));
        --m: 
            linear-gradient(#000 0 0) var(--r) calc(-1*var(--r)) no-repeat,
            radial-gradient(var(--r) at var(--r) calc(50% - var(--r)/2),#000 98%,#0000),
            radial-gradient(var(--r) at calc(50% + var(--r)/2) calc(100% - var(--r)),#000 98%,#0000)
    }

    z:nth-child(<xsl:value-of select="puzzle/size" />n + 1):not(:first-child):not(:nth-last-child(<xsl:value-of select="puzzle/size" />)) b
    {
        height: calc(100% + var(--r));
        width: 100%;
        --m: 
            radial-gradient(var(--r) at 100% calc(50% - var(--r)/2),#0000 98%,#000) 50%/ 100% calc(100% - 2*var(--r)) no-repeat,
            radial-gradient(var(--r) at 50% 0,#0000 98%,#000) 0 0/ 100% var(--r) no-repeat,
            radial-gradient(var(--r) at 50% calc(100% - var(--r)),#000 98%,#0000)
    }

    z:nth-last-child(<xsl:value-of select="puzzle/size" />) b
    {
        height: 100%;
        width: 100%;
        --m: 
            radial-gradient(var(--r) at 100% calc(50% - var(--r)),#0000 98%,#000) 0 var(--r) no-repeat,
            radial-gradient(var(--r) at 50% 0,#0000 98%,#000) 0 0/ 100% var(--r) no-repeat;
    }

    z:nth-child(<xsl:value-of select="puzzle/size" />n):not(:nth-child(<xsl:value-of select="puzzle/size" />)):not(:last-child) b
    {
        place-self: start end;
        height: calc(100% + var(--r));
        width: calc(100% + var(--r));
        --m: 
            radial-gradient(var(--r) at calc(50% - var(--r)/2) var(--r),#0000 98%,#000) var(--r) calc(-1*var(--r)) no-repeat,
            radial-gradient(var(--r) at var(--r) calc(50% - var(--r)/2),#000 98%,#0000),
            radial-gradient(var(--r) at calc(50% + var(--r)/2) calc(100% - var(--r)),#000 98%,#0000)
    }

    z:last-child b
    {
        place-self: end;
        height: 100%;
        width: calc(100% + var(--r));
        --m: 
            radial-gradient(var(--r) at calc(50% - var(--r)/2) 0,#0000 98%,#000) var(--r) 0 no-repeat,
            radial-gradient(var(--r) at var(--r) 50%,#000 98%,#0000)
    }

    z:nth-last-child(-n + calc(<xsl:value-of select="puzzle/size" /> - 1)):not(:last-child) b
    {
        place-self: end;
        height: 100%;
        width: calc(100% + var(--r));
        --m: 
            radial-gradient(var(--r) at calc(50% - var(--r)/2) 0,#0000 98%,#000) var(--r)  0/100% var(--r) no-repeat,
            radial-gradient(var(--r) at calc(100% - var(--r)) calc(50% - var(--r)/2),#0000 98%,#000) var(--r) 100%/100% calc(100% - var(--r)) no-repeat,
            radial-gradient(var(--r) at var(--r) 50%,#000 98%,#0000)
    }

    b:before
    {
        content: "";
        background: var(--i) 0/calc(<xsl:value-of select="puzzle/size" />*var(--s)) calc(<xsl:value-of select="puzzle/size" />*var(--s));
        -webkit-mask: var(--m);
        mask: var(--m);
    }

    z a:hover ~ b
    {
        transform: translate(0);
        filter: none;
        transition: 0s;
    }

    p
    {
        font-size: .8rem;
        text-align: center;
    }

    h1
    {
        font-size: 2rem;
        margin: 0;
        text-align: center;
    }

    body
    {
        background: #547980;
        color: #fff;
        font-family: system-ui, sans-serif;
    }

<xsl:call-template name="generate_style">
<xsl:with-param name="x"><xsl:value-of select="puzzle/size * puzzle/size" /></xsl:with-param>
</xsl:call-template>
</style>
</head>
<body>
<h1>CSS Puzzle</h1>
<p>drag &amp; drop the piece into...<br>Well, you know how a puzzle works :)</p>
<g>
<xsl:attribute name="style">--i:url(<xsl:value-of select="puzzle/image">)</xsl:attribute>
<xsl:call-template name="generate_bits">
<xsl:with-param name="x"><xsl:value-of select="puzzle/size * puzzle/size" /></xsl:with-param>
</xsl:call-template>
</g>
</body>
</html>
</xsl:template>

<xsl:template name="generate_style">
    <xsl:param name="x" />
    z:nth-of-type(<xsl:value-of select="$x" />) b
    {
        transform: translate(calc(calc(<xsl:value-of select="puzzle/size" /> - 1) / 2 - <xsl:value-of select="($x - 1) mod puzzle/size" />) * 100%,calc(calc(<xsl:value-of select="puzzle/size" /> - 1) / 2 - <xsl:value-of select="floor(($x - 0.001) div puzzle/size)" />) * 100%) rotate(calc(<xsl:value-of select="math:random() * 180" /> * 1deg)) translate(calc(30 * 1% + calc(<xsl:value-of select="puzzle/size" /> - 1) * 100%)) rotate(calc(calc(15 - 10 - 88) * 1deg));
    }

    z:nth-of-type(<xsl:value-of select="$x" />) b:before
    {
        background-position: calc(calc(<xsl:value-of select="($x - 1) mod puzzle/size" /> / calc(<xsl:value-of select="puzzle/size" /> - 1)) * 100%) calc(calc(<xsl:value-of select="floor(($x - 0.001) div puzzle/size)" /> / calc(<xsl:value-of select="puzzle/size" /> - 1)) * 100%);
    }
    <xsl:if test="$x > 0">
    <xsl:call-template name="generate_style"><xsl:with-param name="x" select="$x - 1"></xsl:call-template>
    </xsl:if>
</xsl:template>

<xsl:template name="generate_bits">
    <xsl:param name="x" />
    <z><a /><b draggable="true" /></z>
    <xsl:if test="$x > 0">
    <xsl:call-template name="generate_bits"><xsl:with-param name="x" select="$x - 1"></xsl:call-template>
    </xsl:if>
</xsl:template>
</xsl:stylesheet>

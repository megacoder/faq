<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8" indent="no" method="html" omit-xml-declaration="yes" standalone="yes" version="1.0"/>
  <xsl:template match="/">
    <xsl:comment>I am such a header</xsl:comment>
    <HTML>
    <TITLE>Sample FAQ</TITLE>
    <BODY>
    <xsl:comment>Output Question Table of Content</xsl:comment>
    <xsl:for-each select="faq/item">
      <xsl:sort data-type="text" select="@q"/>
      <xsl:call-template name="do_faq_toc"></xsl:call-template>
    </xsl:for-each>
    <xsl:comment>Second, we output the individual questions and their answer content.</xsl:comment>
    <xsl:for-each select="faq/item">
      <xsl:sort data-type="text" select="@q"/>
      <xsl:call-template name="do_faq_answer"></xsl:call-template>
    </xsl:for-each>
    <xsl:comment>I am a trailer, parked</xsl:comment>
    </BODY>
    </HTML>
  </xsl:template>

  <xsl:template name="do_faq_toc">
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
    <xsl:element name="A">
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text>
        <xsl:call-template name="href_name"/>
      </xsl:attribute>
      <xsl:value-of select="@q"/>
      </xsl:element>
      <br/>
</xsl:template>

  <xsl:template name="do_faq_answer">
    <xsl:element name="H3">
      <xsl:attribute name="class">km</xsl:attribute>
      <xsl:element name="A">
        <xsl:attribute name="href">
          <xsl:call-template name="href_name"/>
        </xsl:attribute>
      </xsl:element>
      <xsl:value-of select="@q"/>
    </xsl:element>
    <xsl:apply-templates select="node()"/>
</xsl:template>

<xsl:template name="href_name">
  <xsl:value-of select="concat( 'aref', format-number( position(), '0000' ) )"/>
</xsl:template>

<xsl:template match="br">
  <br/>
</xsl:template>

<xsl:template match="nl">
  <nl>
   <xsl:apply-templates select="node()"/>
  </nl>
</xsl:template>

<xsl:template match="ul">
  <ul>
   <xsl:apply-templates select="node()"/>
  </ul>
</xsl:template>

<xsl:template match="li">
      <li>
        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
        <xsl:apply-templates select="node()"/>
      </li>
</xsl:template>

<xsl:template match="code">
  <xsl:element name="div">
    <xsl:attribute name="class">kmcodeblock</xsl:attribute>
    <xsl:attribute name="width">"95%"</xsl:attribute>
    <xsl:element name="code">
      <xsl:attribute name="class">km</xsl:attribute>
  <xsl:copy-of select="node()"/>
    </xsl:element>
  </xsl:element>
</xsl:template>

<xsl:template match="p">
  <xsl:element name="p">
    <xsl:apply-templates select="node()"></xsl:apply-templates>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:decimal-format name="price" grouping-separator=" "/>
  
  <xsl:template name="vehicle_name">
    <xsl:value-of select="./mark" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="./model" />
  </xsl:template>
  
  <xsl:template name="Vehicle_Price">
    <xsl:choose>
      <xsl:when test="./price/value/@unit = 'eur'">
        <xsl:text>€ </xsl:text>
        <xsl:value-of select="format-number(./price/value, '### ### ###', 'price')" />
      </xsl:when>
      <xsl:when test="./price/value/@unit = 'usd'">
        <xsl:text>$ </xsl:text>
        <xsl:value-of select="format-number(./price/value, '### ### ###', 'price')" />
      </xsl:when>
      <xsl:when test="./price/value/@unit = 'rub'">
        <xsl:value-of select="format-number(./price/value, '### ### ###', 'price')" />
        <xsl:text> руб.</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="Vehicle_Mileage">
    <xsl:value-of select="./mileage/value" />
    <xsl:text> </xsl:text>
    <xsl:choose>
      <xsl:when test="./mileage/value/@unit = 'km'">
        <xsl:text>&#160;км.</xsl:text>
      </xsl:when>
      <xsl:when test="./mileage/value/@unit = 'mile'">
        <xsl:text>&#160;миль</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
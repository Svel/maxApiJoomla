<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="inc_vehicle_params.xsl"/>
  <xsl:include href="inc_navigation.xsl"/>
  
  <xsl:variable name="count" select="count(/response/vehicles/vehicle)"/>
  <xsl:variable name="startpos" select="($page - 1)*$rows + 1"/>
  
  <!--Шаблон предназначен для вывода списка автомобилей -->
  
  <xsl:template match="vehicles">
    <div id="cars">
      <a name="cars"></a>
      <h2>
        <xsl:text>Автомобили в продаже (</xsl:text>
        <xsl:value-of select="$count"/>
        <xsl:text> шт.)</xsl:text>
      </h2>
      <xsl:choose>
        <xsl:when test="$count > 0">
          <table>
            <xsl:apply-templates select="/response/vehicles/vehicle[position()>=$startpos and ($page*$rows)>=position()]"/>
          </table>
          <xsl:call-template name="Navigation"/>
        </xsl:when>
        <xsl:otherwise>
          <p>К сожалению, по вашему запросу ничего не найдено.</p>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>
  
  <xsl:template match="vehicle">
    <xsl:variable name="url">
      <xsl:call-template name="url_vehicle">
        <xsl:with-param name="vehicle_id" select="@vehicle_id"/>
      </xsl:call-template>
    </xsl:variable>
    
    <tr class="top">
      <td colspan="6">
        <a href="{$url}">
          <xsl:call-template name="vehicle_name" />
        </a>
      </td>
    </tr>
    <tr class="middle">
      <th width="250" class="grey">ЦВЕТ</th>
      <th width="250">ОБЪЕМ ДВИГАТЕЛЯ</th>
      <th width="160" class="grey">ГОД ВЫПУСКА</th>
      <th width="160">ПРОБЕГ</th>
      <th width="160" class="grey">КПП</th>
      <th rowspan="2" width="120" class="img">
        <a href="{$url}">
          <img>
            <xsl:attribute name="src">
              <xsl:choose>
                <xsl:when test="./photo/@file_name">
                  <xsl:call-template name="url_photo">
                    <xsl:with-param name="dealer_id" select="@dealer_id" />
                    <xsl:with-param name="vehicle_id" select="@vehicle_id" />
                    <xsl:with-param name="size_id" select="'120x90'" />
                    <xsl:with-param name="file_name" select="./photo/@file_name" />
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="url_empty_thumbnail"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </img>
        </a>
      </th>
    </tr>
    <tr class="middle">
      <td class="grey">
        <xsl:value-of select="./body/color" />
      </td>
      <td>
        <xsl:value-of select="./engine/volume " />
      </td>
      <td class="grey">
        <xsl:value-of select="./year" />
      </td>
      <td>
        <xsl:call-template name="Vehicle_Mileage"/>
      </td>
      <td class="grey">
        <xsl:value-of select="./gearbox/type" />
      </td>
    </tr>
    <tr class="bottom">
      <td colspan="6">
        <a href="{$url}">
          <xsl:text>Цена: </xsl:text>
          <xsl:call-template name="Vehicle_Price"/>
        </a>
      </td>
    </tr>
    <tr class="air">
      <td colspan="6"></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
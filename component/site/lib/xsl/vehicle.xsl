<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method = "html" encoding="utf-8"/>
  
  <xsl:include href="inc_vehicle_params.xsl"/>
  <xsl:include href="inc_url.xsl"/>
  
  <xsl:variable name="dealer_id" select="/response/vehicle/@dealer_id"/>
  <xsl:variable name="vehicle_id" select="/response/vehicle/@vehicle_id"/>
  
  <xsl:template match="vehicle">
    <div class="maxposter" id="car">
      <div class="top full">
        <div class="right">
          <div class="price">
            <xsl:call-template name="Vehicle_Price"/>
          </div>
          <xsl:for-each select="./contact/phone">
            <div class="phone">
              <xsl:value-of select="."/>
            </div>
          </xsl:for-each>
        </div>
        <h1>
          <xsl:call-template name="vehicle_name" />
        </h1>
      </div>
      <div class="full">
        <h2>Основные характеристики</h2>
        <table class="main">
          <tr class="even">
            <th>Год выпуска:</th>
            <td><xsl:value-of select="./year"/></td>
            <td></td>
            <th>Привод:</th>
            <td><xsl:value-of select="./drive/type"/></td>
          </tr>
          <tr>
            <th>Кузов:</th>
            <td><xsl:value-of select="./body/type"/></td>
            <td></td>
            <th>Пробег:</th>
            <td>
              <xsl:call-template name="Vehicle_Mileage"/>
            </td>
          </tr>
          <tr class="even">
            <th>Двигатель:</th>
            <td><xsl:value-of select="./engine/type" /></td>
            <td></td>
            <th>Руль:</th>
            <td><xsl:value-of select="./steering_wheel/place"/></td>
          </tr>
          <tr>
            <th>Объем:</th>
            <td>
              <xsl:value-of select="./engine/volume "/>
              <xsl:text>&#160;см3</xsl:text>
            </td>
            <td></td>
            <th>Цвет:</th>
            <td><xsl:value-of select="./body/color"/></td>
          </tr>
          <tr class="even">
            <th>Коробка передач:</th>
            <td><xsl:value-of select="./gearbox/type"/></td>
            <td></td>
            <th>Состояние:</th>
            <td><xsl:value-of select="./condition"/></td>
          </tr>
        </table>
      </div>
      
      <xsl:apply-templates select="./photos"/>
      
      <div class="options full">
        <h2>Комлпектация</h2>
        <ul>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Антиблокировочная система (АБС)'"/>
            <xsl:with-param name="element" select="./abs"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Антипробуксовочная система'"/>
            <xsl:with-param name="element" select="./asr"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Система курсовой стабилизации'"/>
            <xsl:with-param name="element" select="./esp"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Парктроник'"/>
            <xsl:with-param name="element" select="./parktronic"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Подушки безопасности: '"/>
            <xsl:with-param name="element" select="./airbag"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Охранная система'"/>
            <xsl:with-param name="element" select="./alarm_system"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Центральный замок'"/>
            <xsl:with-param name="element" select="./central_lock"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Навигационная система'"/>
            <xsl:with-param name="element" select="./nav_system"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Легкосплавные диски'"/>
            <xsl:with-param name="element" select="./light_alloy_wheels"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Датчик дождя'"/>
            <xsl:with-param name="element" select="./sensors/rain"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Датчик света'"/>
            <xsl:with-param name="element" select="./sensors/light"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Омыватель фар'"/>
            <xsl:with-param name="element" select="./headlights/washer"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Ксеноновые фары'"/>
            <xsl:with-param name="element" select="./headlights/xenon"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Салон: '"/>
            <xsl:with-param name="element" select="./compartment"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Тонированные стекла'"/>
            <xsl:with-param name="element" select="./windows/tinted"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Люк'"/>
            <xsl:with-param name="element" select="./hatch"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Газобалонное оборудование'"/>
            <xsl:with-param name="element" select="./engine/gas_equipment"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Круиз-контроль'"/>
            <xsl:with-param name="element" select="./cruise_control"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Бортовой компьютер'"/>
            <xsl:with-param name="element" select="./trip_computer"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Усилитель рулевого управления: '"/>
            <xsl:with-param name="element" select="./steering_wheel/power"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Регулировка руля: '"/>
            <xsl:with-param name="element" select="./steering_wheel/adjustment"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Обогрев руля'"/>
            <xsl:with-param name="element" select="./steering_wheel/heater"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Электрозеркала'"/>
            <xsl:with-param name="element" select="./mirrors/power"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Обогрев зеркал'"/>
            <xsl:with-param name="element" select="./mirrors/defroster"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Электростеклоподъемники: '"/>
            <xsl:with-param name="element" select="./windows/power"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Обогрев сидений'"/>
            <xsl:with-param name="element" select="./seats/heater"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Регулировка сиденья водителя: '"/>
            <xsl:with-param name="element" select="./seats/driver_adjustment"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Регулировка сиденья пассажира: '"/>
            <xsl:with-param name="element" select="./seats/passanger_adjustment"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Управление климатом: '"/>
            <xsl:with-param name="element" select="./climate_control"/>
          </xsl:call-template>
          <xsl:call-template name="option">
            <xsl:with-param name="label" select="'Стереосистема: '"/>
            <xsl:with-param name="element" select="./audio"/>
          </xsl:call-template>
        </ul>
      </div>

      <xsl:apply-templates select="./description"/>
      
      <div class="contacts full">
        <h2>Контакты</h2>
        <table>
          <xsl:if test="./inspection_place">
            <tr>
              <th>Место осмотра: </th>
              <td>
                <xsl:value-of select="./inspection_place" disable-output-escaping="yes"/>
              </td>
            </tr>
          </xsl:if>
          <tr>
            <th>Телефоны: </th>
            <td>
              <xsl:for-each select="./contact/phone">
                <xsl:if test="position()>1">
                  <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:value-of select="."/>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </div>
      <br class="clear"/>
    </div>
  </xsl:template>
  
  <xsl:template match="photos">
    <div id="photos" class="full">
      <div id="original">
        <img>
          <xsl:attribute name="src">
            <xsl:call-template name="url_photo">
              <xsl:with-param name="dealer_id" select="$dealer_id" />
              <xsl:with-param name="vehicle_id" select="$vehicle_id" />
              <xsl:with-param name="size_id" select="'640x480'" />
              <xsl:with-param name="file_name" select="./photo[1 = position()]/@file_name" />
            </xsl:call-template>
          </xsl:attribute>
        </img>
      </div>
      <div id="thumbnails">
        <xsl:apply-templates select="./photo"/>
      </div>
    </div>
  </xsl:template>
  
  <xsl:template match="photo">
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="url_photo">
          <xsl:with-param name="dealer_id" select="$dealer_id" />
          <xsl:with-param name="vehicle_id" select="$vehicle_id" />
          <xsl:with-param name="size_id" select="'640x480'" />
          <xsl:with-param name="file_name" select="@file_name" />
        </xsl:call-template>
      </xsl:attribute>
      <img>
        <xsl:attribute name="src">
          <xsl:call-template name="url_photo">
            <xsl:with-param name="dealer_id" select="$dealer_id" />
            <xsl:with-param name="vehicle_id" select="$vehicle_id" />
            <xsl:with-param name="size_id" select="'120x90'" />
            <xsl:with-param name="file_name" select="@file_name" />
          </xsl:call-template>
        </xsl:attribute>
        <xsl:if test="(1 = position()) or (0 = (position() mod 5))">
          <xsl:attribute name="class">
            <xsl:if test="1 = position()">
              <xsl:text>current </xsl:text>
            </xsl:if>
            <xsl:if test="0 = (position() mod 5)">
              <xsl:text>last</xsl:text>
            </xsl:if>
          </xsl:attribute>
        </xsl:if>
      </img>
    </a>
  </xsl:template>
  
  <xsl:template name="option">
    <xsl:param name="label"/>
    <xsl:param name="element"/>
    <xsl:if test="$element">
      <li>
        <xsl:value-of select="$label" />
        <xsl:apply-templates select="$element" />
      </li>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="description">
    <div class="descriptions full">
      <h2>Дополнительная информация</h2>
      <xsl:call-template name="break">
        <xsl:with-param name="text" select="."/>
      </xsl:call-template>
    </div>
  </xsl:template>
  
  <xsl:template name="break">
    <xsl:param name="text"/>
    <xsl:choose>
      <xsl:when test="contains($text,'&#xa;')">
        <xsl:value-of select="substring-before($text, '&#xa;')" disable-output-escaping="yes"/>
        <br/>
        <xsl:call-template name="break">
          <xsl:with-param name="text" select="substring-after($text,'&#xa;')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" disable-output-escaping="yes"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
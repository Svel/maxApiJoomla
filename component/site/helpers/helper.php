<?php
// no direct access
defined('_JEXEC') or die('Restricted access');

class MaxPosterHelper
{
  /**
   * Возвращает настройки компонента
   *
   * @return array
   */
  static public function getConfig()
  {
    $componentPath = JPATH_BASE.DS.'components'.DS.'com_maxposter'.DS;

    $defaultParameters = array(
      // Код автосалона
      'dealer_id' => '',

      // Пароль для доступа к данным
      'password' => '',

      // Номер используемой версии API
      'api_version' => 1,

      // Количество объявлений на странице со списком авто
      'rows_by_page' => 20,

      // Префикс для отделения параметров сервиса от прочих параметров страницы (например куки)
      'prefix' => 'max_',

      // Путь к каталогу, содержащему кэш
      'cache_dir' => $componentPath.'cache'.DS,

      // Путь к каталогу, содержащему XSL-шаблоны
      'xslt_dir' => $componentPath.'lib'.DS.'xsl'.DS,

      // Список тем, которые должны кэшироваться в формате XML
      'cached_xml_themes' => array('vehicles', 'vehicle', 'marks'),

      // Список тем, которые должны кэшироваться в формате HTML
      'cached_html_themes' => array('marks'),

      // Шаблон ссылки для списка автомобилей (к ссылке может быть добавлен параметр с номером страницы и параметры фильтрации)
      //'url_vehicles'  => JRoute::_('index.php?option=com_maxposter'),
      'url_vehicles'  => '/index.php?option=com_maxposter',

      // Шаблон ссылки для описания автомобиля (%vehicle_id% будет заменен на код объявления)
      //'url_vehicle' => JRoute::_('index.php?option=com_maxposter&task=car&vehicle_id=%vehicle_id%'),
      'url_vehicle' => '/index.php?option=com_maxposter&amp;task=car&amp;vehicle_id=%vehicle_id%',

      // Шаблон ссылки на фото автомобиля (остальные значения будут добавлены в XSL)
      //'url_photo' => JURI::base().'components/com_maxposter/photo/',
      'url_photo' => '/components/com_maxposter/photo/',

      // Путь к thumbnail по-умолчанию для объявления без фотографии
      //'url_empty_thumbnail' => JURI::base().'components/com_maxposter/assets/img/no_photo_120x90.gif'
      'url_empty_thumbnail' => '/components/com_maxposter/assets/img/no_photo_120x90.gif'
    );

    // http://www.theartofjoomla.com/converting-old-extensions.html
    //global $mainframe;
    $app = &JFactory::getApplication();
    $componentParams =& $app->getPageParameters('com_maxposter')->toArray();

    $ret = array();
    foreach ($defaultParameters as $key => $value)
    {
      $ret[$key] = isset($componentParams[$key])
                      ? $componentParams[$key]
                      : $value
                   ;
    }

    return $ret;
  }

  /**
   * Добавляет к странице стили компонента
   *
   */
  static public function addStyle()
  {
    JHTML::stylesheet('style.css', 'components/com_maxposter/assets/css/');
  }
}

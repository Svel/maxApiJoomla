<?php
// no direct access
defined('_JEXEC') or die('Restricted access');

// check maxposter component
jimport('joomla.application.component.helper');
if (!JComponentHelper::isEnabled('com_maxposter', true))
{
  JError::raiseError('500', JText::_('COMPONENTMISSING'));
}

$maxPosterComponentPath = JPATH_BASE.DS.'components'.DS.'com_maxposter';
require_once($maxPosterComponentPath.DS.'helpers'.DS.'helper.php');
require_once($maxPosterComponentPath.DS.'lib'.DS.'client'.DS.'maxClient.php');

// Добавление css
MaxPosterHelper::addStyle();

// Формирование блока с марками-моделями
$client = new maxClient(MaxPosterHelper::getConfig());
$client->setRequestThemeName('marks');

echo $client->getHtml();
unset($client);

<?php
/**
* MaxPoster Component Administrator View
*
*/

// No direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.application.component.view' );

/**
 * Maxposter Administrator View
 *
 * @package com_maxposter
 * @subpackage components
 */
class MaxposterViewMaxposter extends JView
{
  /**
   * Maxposter view display method
   *
   * @return void
   **/
  function display( $tpl = null )
  {
    JToolBarHelper::title(JText::_('Maxposter Administrator Panel'));
    
    JToolBarHelper::preferences('com_maxposter', 250);
    
    parent::display( $tpl );
  }
}
<?php
/**
* Maxposter Administrator entry point
*
*/

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

// Require the base controller
require_once( JPATH_COMPONENT.DS.'controller.php' );

// Create the controller
$controller = new MaxPosterController();

//Perform the requested task
$controller->execute(JRequest::getVar('task', 'display'));

//Redirect if set by the controller
$controller->redirect();
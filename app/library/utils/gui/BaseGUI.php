<?php

namespace utils\gui;

abstract class BaseGUI {

	protected $controller;

	public function __construct(\IndexController $controller){
		$this->controller=$controller;
	}

	public abstract function getMainMenu();
	public abstract function getBreadcrumbs($domaines);
	public abstract function getMenuTabs($domaines);
	public abstract function getAnchorsDropDown($anchors);
	public abstract function getAlert($id,$style,$message);
	public abstract function getPanel($id,$content,$header,$footer);
	public abstract function replaceAlerts($html);
	public abstract function initPHP();
}
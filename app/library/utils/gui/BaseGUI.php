<?php

namespace utils\gui;

abstract class BaseGUI {

	protected $controller;

	public function __construct(\IndexController $controller){
		$this->controller=$controller;
	}

	public abstract function getMainMenu();
	public abstract function getBreadcrumbs();
	public abstract function getMenuTabs($domaines);
	public abstract function getAnchorsDropDown($anchors);
	public abstract function getalert($id,$style,$message);
	public abstract function getpanel($id,$content,$header,$footer);
}
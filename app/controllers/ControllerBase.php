<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller{
	protected $translateEngine;
	
	public function initialize(){
		$this->translateEngine=$this->session->get("translateEngine");
		$this->translateEngine->setRequest($this->request);
	}
}

<?php

namespace Ajax\semantic\html\collections\form;

use Ajax\semantic\html\base\HtmlSemCollection;
use Ajax\semantic\html\base\constants\Wide;
use Ajax\JsUtils;
use Phalcon\Mvc\View;
use Ajax\semantic\html\base\HtmlSemDoubleElement;

class HtmlFormFields extends HtmlSemCollection {

	use FieldsTrait;
	protected $_equalWidth;
	protected $_name;

	public function __construct($identifier, $fields=array(),$equalWidth=true) {
		parent::__construct($identifier, "div");
		$this->_equalWidth=$equalWidth;
		$this->addItems($fields);
	}

	/**
	 * @param string|HtmlSemDoubleElement $label
	 * @return \Ajax\semantic\html\base\HtmlSemDoubleElement
	 */
	public function setLabel($label){
		$labelO=$label;
		if(\is_string($label)){
			$labelO=new HtmlSemDoubleElement("","label","",$label);
		}
		$this->insertItem($labelO,0);
		return $labelO;
	}

	public function compile(JsUtils $js=NULL,View $view=NULL){
		if($this->_equalWidth){
			$count=$this->count();
			$this->addToProperty("class", Wide::getConstants()["W".$count]." fields");
		}else
			$this->addToProperty("class","fields");
		return parent::compile($js,$view);
	}

	public function setWidth($index,$width){
		$this->_equalWidth=false;
		return $this->getItem($index)->setWidth($width);
	}

	public function setInline(){
		$this->_equalWidth=false;
		$this->addToProperty("class", "inline");
	}

	public function setGrouped(){
		$this->_equalWidth=false;
		$this->addToProperty("class", "grouped");
	}

	public function getName() {
		return $this->_name;
	}

	public function setName($_name) {
		$this->_name=$_name;
		return $this;
	}

	public static function radios($name,$items=array(),$label=NULL){
		$fields=array();
		$i=0;
		foreach ($items as $item){
			$fields[]=new HtmlFormRadio($name."-".$i++,$name,$item,$item);
		}
		$radios=new HtmlFormFields("fields-".$name,$fields);
		if(isset($label))
			$radios->setLabel($label)->setProperty("for", $name);
		return $radios;
	}

}
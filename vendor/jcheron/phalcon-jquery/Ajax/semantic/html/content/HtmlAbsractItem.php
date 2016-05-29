<?php

namespace Ajax\semantic\html\content;

use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\semantic\html\elements\HtmlIcon;
use Ajax\JsUtils;
use Phalcon\Mvc\View;
use Ajax\service\JArray;

abstract class HtmlAbsractItem extends HtmlSemDoubleElement {

	public function __construct($identifier, $baseClass,$content=NULL) {
		parent::__construct($identifier, "div", $baseClass);
		$this->content=array();
		$this->initContent($content);
	}

	protected abstract function initContent($content);

	public function setIcon($icon){
		$this->content["icon"]=new HtmlIcon("icon-".$this->identifier, $icon);
	}

	private function createContent(){
		$this->content["content"]=new HtmlSemDoubleElement("content-".$this->identifier,"div","content");
		return $this->content["content"];
	}

	public function setTitle($title,$description=NULL,$baseClass="title"){
		$title=new HtmlSemDoubleElement("","div",$baseClass,$title);
		if(\array_key_exists("content", $this->content)===false){
			$this->createContent();
		}
		$this->content["content"]->addContent($title);
		if(isset($description)){
			$description=new HtmlSemDoubleElement("","div","description",$description);
			$this->content["content"]->addContent($description);
		}
		return $this;
	}

	public function setActive(){
		$this->setTagName("div");
		$this->removeProperty("href");
		return $this->addToPropertyCtrl("class", "active", array("active"));
	}

	public function asLink($href=NULL){
		$this->setTagName("a");
		if(isset($href))
			$this->setProperty("href", $href);
		return $this;
	}

	/**
	 *
	 * {@inheritDoc}
	 *
	 * @see \Ajax\semantic\html\base\HtmlSemDoubleElement::compile()
	 */
	public function compile(JsUtils $js=NULL, View $view=NULL) {
		if(\is_array($this->content))
			$this->content=JArray::sortAssociative($this->content, [ "icon","image","content" ]);
		return parent::compile($js, $view);
	}
}
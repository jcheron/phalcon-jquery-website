<?php

namespace Ajax\semantic\html\collections;

use Ajax\semantic\html\base\HtmlSemNavElement;
use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\JsUtils;
use Phalcon\Mvc\View;
use Ajax\semantic\html\elements\HtmlIcon;

/**
 * Semantic UI Breadcrumb component
 * @see http://semantic-ui.com/collections/breadcrumb.html
 * @author jc
 * @version 1.001
 */
class HtmlBreadcrumb extends HtmlSemNavElement{
	/**
	 * @var integer the start index for href generation
	 */
	protected $startIndex=0;
	/**
	 * @var boolean $autoActive sets the last element's class to <b>active</b> if true
	 */
	protected $autoActive;

	/**
	 * @var boolean if set to true, the path of the elements is absolute
	 */
	protected $absolutePaths;

	/**
	 * @var function the function who generates the href elements. default : function($e){return $e->getContent()}
	 */
	protected $_hrefFunction;

	/**
	 * @param string $identifier
	 * @param array $items
	 * @param boolean $autoActive sets the last element's class to <b>active</b> if true
	 * @param function $hrefFunction the function who generates the href elements. default : function($e){return $e->getContent()}
	 */
	public function __construct( $identifier,$items=array(),$autoActive=true,$startIndex=0,$hrefFunction=NULL){
		parent::__construct( $identifier, "div", "ui breadcrumb");
		$this->startIndex=$startIndex;
		$this->autoActive=$autoActive;
		$this->_contentSeparator="<div class='divider'> / </div>";
		$this->_hrefFunction=function ($e){return $e->getContent();};
		if(isset($hrefFunction)){
			$this->_hrefFunction=$hrefFunction;
		}
		$this->addItems($items);
	}

	/**
	 * Associate an ajax get to the breadcrumb elements, displayed in $targetSelector
	 * $attr member is used to build each element url
	 * @param string $targetSelector the target of the get
	 * @param string $attr the html attribute used to build the elements url
	 * @return HtmlBreadcrumbs
	 */
	public function autoGetOnClick($targetSelector){
		return $this->getOnClick($this->root, $targetSelector,array("attr"=>$this->attr));
	}

	public function contentAsString(){
		if($this->autoActive){
			$this->setActive();
		}
		return parent::contentAsString();
	}

	public function setActive($index=null){
		if(!isset($index)){
			$index=sizeof($this->content)-1;
		}
		$activeItem=$this->content[$index];
		$activeItem->addToProperty("class","active");
		$activeItem->setTagName("div");
	}

	/**
	 * Add new elements in breadcrumbs corresponding to request dispatcher : controllerName, actionName, parameters
	 * @param Dispatcher $dispatcher the request dispatcher
	 * @return \Ajax\bootstrap\html\HtmlBreadcrumbs
	 */
	public function fromDispatcher($dispatcher,$startIndex=0){
		$this->startIndex=$startIndex;
		$params=$dispatcher->getParams();
		$action=$dispatcher->getActionName();
		$items=array($dispatcher->getControllerName());
		if(\sizeof($params)>0 || \strtolower($action)!="index" ){
			$items[]=$action;
			foreach ($params as $p){
				if(\is_object($p)===false)
					$items[]=$p;
			}
		}
		return $this->addItems($items);
	}

	/**
	 * Return the url of the element at $index or the breadcrumbs url if $index is ommited
	 * @param int $index
	 * @param string $separator
	 * @return string
	 */
	public function getHref($index=null,$separator="/"){
		if(!isset($index)){
			$index=sizeof($this->content);
		}
		if($this->absolutePaths===true){
			return $this->_hrefFunction($this->content[$index]);
		}else{
			return $this->root.implode($separator, array_slice(array_map(function($e){return $this->_hrefFunction($e);}, $this->content),$this->startIndex,$index+1));
		}
	}

	/**
	 * sets the function who generates the href elements. default : function($element){return $element->getContent()}
	 * @param function $_hrefFunction
	 * @return \Ajax\bootstrap\html\HtmlBreadcrumbs
	 */
	public function setHrefFunction($_hrefFunction) {
		$this->_hrefFunction = $_hrefFunction;
		return $this;
	}

	public function setStartIndex($startIndex) {
		$this->startIndex=$startIndex;
		return $this;
	}

	public function setAutoActive($autoActive) {
		$this->autoActive = $autoActive;
		return $this;
	}

	/*
	 * (non-PHPdoc)
	 * @see \Ajax\bootstrap\html\BaseHtml::compile()
	 */
	public function compile(JsUtils $js=NULL, View $view=NULL) {
		if($this->autoActive){
			$this->setActive();
		}
		$count=$this->count();
		for($i=1;$i<$count;$i++){
			$this->content[$i]->wrap($this->getContentDivider($i-1));
		}
		return parent::compile($js, $view);
	}

	/*
	 * (non-PHPdoc)
	 * @see \Ajax\bootstrap\html\base\BaseHtml::on()
	 */
	public function on($event, $jsCode, $stopPropagation=false, $preventDefault=false) {
		foreach ($this->content as $element){
				$element->on($event,$jsCode,$stopPropagation,$preventDefault);
		}
		return $this;
	}


	public function _ajaxOn($operation, $event, $url, $responseElement="", $parameters=array()) {
		foreach ($this->content as $element){
			if($element->getProperty($this->attr)!=NULL)
				$element->_ajaxOn($operation, $event, $url, $responseElement, $parameters);
		}
		return $this;
	}

	/**
	 * {@inheritDoc}
	 * @see \Ajax\common\html\HtmlCollection::createItem()
	 */
	protected function createItem($value) {
		$count=$this->count();
		$itemO=new HtmlSemDoubleElement("item-".$this->identifier."-".$count,"a","section");
		if(\is_array($value))
			$itemO->fromArray($value);
		else{
			$itemO->setContent($value);
			$itemO->setProperty($this->attr, $this->getHref($count));
		}
		return $itemO;
	}

	public function addIcon($icon,$index){
		$item=$this->getItem($index);
		if(isset($item)){
			$icon=new HtmlIcon("icon-".$this->identifier, $icon);
			$item->wrapContent($icon);
		}
	}

	public function addItem($item){
		$itemO=parent::addItem($item);
		$this->addToPropertyCtrl("class", "section", array("section"));
		return $itemO;
	}

	public function asLinks(){
		$this->contentAs("a");
	}

	public function asTexts(){
		$this->contentAs("div");
	}

}
<?php

namespace Ajax\semantic\html\modules;

use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\JsUtils;
use Ajax\common\html\BaseHtml;
use Ajax\semantic\html\collections\HtmlGrid;
use Ajax\semantic\html\elements\HtmlList;


class HtmlPopup extends HtmlSemDoubleElement {
	private $params;
	private $_container;
	public function __construct(BaseHtml $container,$identifier, $content="") {
		parent::__construct($identifier, "div");
		$this->_container=$container;
		$this->setClass("ui popup");
		$this->content=$content;
		$this->params=array("on"=>"hover");
	}

	public function addList($items=array(),$header=NULL){
		if(!$this->content instanceof HtmlGrid){
			$this->content=new HtmlGrid("grid-".$this->identifier,1);
		}
		$grid=$this->content;

		$colCount=$grid->colCount();
		$grid->setNumCols(++$colCount);

		$list=new HtmlList("",$items);
		$list->itemsAs("a");
		if(isset($header)){
			$list->addHeader(4,$header);
		}
		$grid->getCell(0,$colCount-1)->setContent($list);
		$grid->setDivided();
		return $list;
	}

	/**
	 * A popup can have no maximum width and continue to flow to fit its content
	 */
	public function setFlowing(){
		return $this->addToProperty("class", "flowing");
	}

	/**
	 * A popup can provide more basic formatting
	 */
	public function setBasic(){
		return $this->addToProperty("class", "basic");
	}

	/**
	 * {@inheritDoc}
	 * @see \Ajax\semantic\html\base\HtmlSemDoubleElement::run()
	 */
	public function run(JsUtils $js){
		$this->params["popup"]="#".$this->identifier;
		$js->semantic()->popup("#".$this->_container->getIdentifier(),$this->params);
	}

	public function setOn($event="click"){
		$this->params["on"]=$event;
		return $this;
	}

	public function setInline($value=true){
		$this->params["inline"]=$value;
		return $this;
	}

	public function setPosition($position){
		$this->params["position"]=$position;
		return $this;
	}
}
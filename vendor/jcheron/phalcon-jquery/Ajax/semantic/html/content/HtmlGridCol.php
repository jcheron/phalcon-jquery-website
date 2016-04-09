<?php

namespace Ajax\semantic\html\content;

use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\semantic\html\base\constants\Wide;
use Ajax\semantic\html\base\traits\TextAlignmentTrait;

/**
 * A col in the Semantic Grid component
 * @see http://semantic-ui.com/collections/grid.html
 * @author jc
 * @version 1.001
 */
class HtmlGridCol extends HtmlSemDoubleElement{
	use TextAlignmentTrait;
	public function __construct($identifier,$width){
		parent::__construct($identifier,"div");
		$this->setClass("column");
		if(isset($width))
			$this->setWidth($width);
	}

	/**
	 * Defines the col width
	 * @param int $width
	 * @return \Ajax\semantic\html\content\HtmlGridCol
	 */
	public function setWidth($width){
		if(\is_int($width)){
			$width=Wide::getConstants()["W".$width];
		}
		$this->addToPropertyCtrl("class", $width, Wide::getConstants());
		return $this->addToPropertyCtrl("class", "wide",array("wide"));
	}

	/**
	 * Defines the coll floating
	 * @param string $value left or right
	 * @return \Ajax\semantic\html\content\HtmlGridCol
	 */
	public function setFloated($value="left"){
		return $this->addToProperty("class", $value." floated");
	}


	public function setValue($value){
		$this->content=$value;
	}
}
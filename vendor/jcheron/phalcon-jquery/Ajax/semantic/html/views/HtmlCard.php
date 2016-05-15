<?php

namespace Ajax\semantic\html\views;

use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\semantic\html\elements\HtmlHeader;
use Ajax\JsUtils;
use Ajax\service\JArray;
use Phalcon\Mvc\View;
use Ajax\semantic\html\elements\HtmlImage;
use Ajax\semantic\html\content\card\HtmlCardContent;
use Ajax\semantic\html\content\card\HtmlCardHeaderContent;
use Ajax\semantic\html\elements\HtmlReveal;
use Ajax\semantic\html\base\constants\RevealType;

class HtmlCard extends HtmlSemDoubleElement {

	public function __construct($identifier) {
		parent::__construct($identifier, "div", "ui card", array ());
	}

	private function createContent($content, $baseClass="content") {
		$count=\sizeof($this->content);
		$result=new HtmlCardContent("content-" . $count . "-" . $this->identifier, $content);
		$result->setClass($baseClass);
		return $result;
	}

	private function addElementInContent($key, $element) {
		if (\array_key_exists($key, $this->content) === false) {
			$this->content[$key]=array ();
		}
		$this->content[$key][]=$element;
		return $element;
	}

	public function addHeader($header, $niveau=4, $type="page") {
		if (!$header instanceof HtmlHeader) {
			$header=new HtmlHeader("header-" . $this->identifier, $niveau, $header, $type);
		}
		$this->content["header"]=$this->createContent($header);
	}

	public function addImage($image, $title="") {
		if (!$image instanceof HtmlImage) {
			$image=new HtmlImage("image-" . $this->identifier, $image, $title);
		}
		$image->setClass("image");
		return $this->addElementInContent("content", $image);
	}

	public function addReveal($visibleContent, $hiddenContent=NULL, $type=RevealType::FADE, $attributeType=NULL) {
		$reveal=$visibleContent;
		if (!$visibleContent instanceof HtmlReveal) {
			$reveal=new HtmlReveal("reveral-" . $this->identifier, $visibleContent, $hiddenContent, $type, $attributeType);
		}
		return $this->addElementInContent("content", $reveal);
	}

	public function addRevealImage($visibleContent, $hiddenContent=NULL, $type=RevealType::FADE, $attributeType=NULL) {
		$reveal=$visibleContent;
		if (!$visibleContent instanceof HtmlReveal) {
			return $this->addReveal(new HtmlImage("", $visibleContent), new HtmlImage("", $hiddenContent), $type, $attributeType);
		}
		return $this->addElementInContent("content", $reveal);
	}

	public function addExtraContent($content) {
		return $this->addElementInContent("extra-content", $this->createContent($content, "extra content"));
	}

	public function addContent($content=array(), $before=false) {
		if (!$content instanceof HtmlCardContent) {
			$content=$this->createContent($content);
		}
		return $this->addElementInContent("content", $content);
	}

	public function addCardHeaderContent($header, $metas=array(), $description=NULL) {
		$count=\sizeof($this->content);
		return $this->addElementInContent("content", new HtmlCardHeaderContent("content-" . $count . "-" . $this->identifier, $header, $metas, $description));
	}

	public function addCardContent($content=array()) {
		$count=\sizeof($this->content);
		return $this->addElementInContent("content", new HtmlCardContent("content-" . $count . "-" . $this->identifier, $content));
	}

	/**
	 *
	 * {@inheritDoc}
	 *
	 * @see \Ajax\semantic\html\base\HtmlSemDoubleElement::compile()
	 */
	public function compile(JsUtils $js=NULL, View $view=NULL) {
		$this->content=JArray::sortAssociative($this->content, [ "header","image","content","extra-content" ]);
		return parent::compile($js, $view);
	}
}
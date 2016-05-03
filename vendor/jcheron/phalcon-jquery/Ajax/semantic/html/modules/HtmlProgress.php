<?php

namespace Ajax\semantic\html\modules;

use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\JsUtils;
use Ajax\service\JArray;
use Phalcon\Mvc\View;

class HtmlProgress extends HtmlSemDoubleElement {
	private $_params=array ();

	public function __construct($identifier, $value=NULL, $label=NULL) {
		parent::__construct($identifier, "div", "ui progress");
		if (isset($value) === true)
			$this->setProperty("data-percent", $value);
		$this->createBar();
		if (isset($label) === true)
			$this->setLabel($label);
	}

	public function setLabel($label) {
		$this->content["label"]=new HtmlSemDoubleElement("lbl-" . $this->identifier, "div", "label", $label);
		return $this;
	}

	private function createBar() {
		$bar=new HtmlSemDoubleElement("bar-" . $this->identifier, "div", "bar", new HtmlSemDoubleElement("progress-" . $this->identifier, "div", "progress"));
		$this->content["bar"]=$bar;
		return $this;
	}

	public function setIndicating() {
		return $this->addToProperty("class", "indicating");
	}

	public function setActive() {
		return $this->addToProperty("class", "active");
	}

	/**
	 *
	 * {@inheritDoc}
	 *
	 * @see \Ajax\semantic\html\base\HtmlSemDoubleElement::compile()
	 */
	public function compile(JsUtils $js=NULL, View $view=NULL) {
		$this->content=JArray::sortAssociative($this->content, [ "bar","label" ]);
		return parent::compile($js, $view);
	}

	public function jsSetValue($value) {
		return '$("#' . $this->identifier . '").progress({value:' . $value . '});';
	}

	public function jsIncValue() {
		return '$("#' . $this->identifier . '").progress("increment");';
	}

	public function jsDecValue() {
		return '$("#' . $this->identifier . '").progress("decrement");';
	}

	/**
	 *
	 * @param mixed $active
	 * @param mixed $error
	 * @param mixed $success
	 * @param mixed $warning
	 * @param mixed $percent
	 * @param mixed $ratio
	 * @return HtmlProgress
	 */
	public function setTextValues($active=false, $error=false, $success=false, $warning=false, $percent="{percent}%", $ratio="{value} of {total}") {
		if (\is_array($active) == true) {
			$array=$active;
			$active=JArray::getDefaultValue($array, "active", false);
			$success=JArray::getDefaultValue($array, "success", $success);
			$warning=JArray::getDefaultValue($array, "warning", $warning);
			$percent=JArray::getDefaultValue($array, "percent", $percent);
			$ratio=JArray::getDefaultValue($array, "ratio", $ratio);
		}
		$this->_params["text"]="%{active  : " . \var_export($active, true) . ",error: " . \var_export($error, true) . ",success : " . \var_export($success, true) . ",warning : " . \var_export($warning, true) . ",percent : " . \var_export($percent, true) . ",ratio   : " . \var_export($ratio, true) . "}%";
		return $this;
	}

	public function onChange($jsCode) {
		return $this->_params["onChange"]="%function(percent, value, total){" . $jsCode . "}%";
	}

	/*
	 * (non-PHPdoc)
	 * @see BaseHtml::run()
	 */
	public function run(JsUtils $js) {
		if (isset($this->_bsComponent) === false)
			$this->_bsComponent=$js->semantic()->progress("#" . $this->identifier, $this->_params);
		$this->addEventsOnRun($js);
		return $this->_bsComponent;
	}
}
<?php

namespace Ajax\semantic\components\search;

class SearchResults {
	private $elements;

	public function __construct($objects=NULL) {
		$this->elements=array ();
		if (isset($objects)) {
			if (\is_array($objects)) {
				$this->addResults($objects);
			} else {
				$this->addResult($objects);
			}
		}
	}

	public function addResult($object) {
		$this->_elements[]=$object;
		return $this;
	}

	public function addResults($objects) {
		$this->elements=\array_merge($this->elements, $objects);
		return $this;
	}

	public function search($query, $field="title") {
		foreach ( $this->elements as $element ) {
		}
	}

	public function __toString() {
		$result="\"results\": " . \json_encode($this->elements);
		return $result;
	}

	public function count() {
		return \sizeof($this->elements);
	}

	public function getStandard() {
		return "{" . $this . "}";
	}
}
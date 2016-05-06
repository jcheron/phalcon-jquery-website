<?php

namespace Ajax\semantic\components\search;

class SearchCategory {
	private $id;
	private $name;
	private $results;

	public function __construct($id, $name, $results=NULL) {
		$this->results=new SearchResults($results);
		$this->id=$id;
		$this->name=$name;
	}

	public function addResult($object) {
		$this->results->addResult($object);
		return $this;
	}

	public function addResults($objects) {
		$this->results->addResults($objects);
		return $this;
	}

	public function __toString() {
		$result="\"" . $this->id . "\": { \"name\": \"" . $this->name . "\"," . $this->results . "}";
		return $result;
	}

	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id=$id;
		return $this;
	}

	public function getName() {
		return $this->name;
	}

	public function setName($name) {
		$this->name=$name;
		return $this;
	}

	public function getResults() {
		return $this->results;
	}

	public function setResults($results) {
		$this->results=$results;
		return $this;
	}
}
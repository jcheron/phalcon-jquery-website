<?php

namespace Ajax\semantic\components\search;

class SearchCategories {
	private $categories;

	public function __construct() {
		$this->categories=array ();
	}

	public function add($results, $category) {
		$count=\sizeof($this->categories);
		$category=new SearchCategory("category" . $count, $category, $results);
		$this->categories[]=$category;
		return $this;
	}

	public function search($query, $field="title") {
	}

	public function __toString() {
		return "{\"results\":{" . \implode(",", $this->categories) . "}}";
	}
}
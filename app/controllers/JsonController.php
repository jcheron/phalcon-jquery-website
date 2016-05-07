<?php
use Phalcon\Mvc\View;
use Ajax\semantic\components\search\SearchCategories;
use Ajax\semantic\components\search\SearchResults;
use Ajax\semantic\components\search\SearchCategory;
class JsonController extends ControllerBase {

	public function jsonAction($index) {
		$this->view->disable();
		$client=Client::findFirst($index);
		print_r(json_encode($client->toArray(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE));
	}

	public function jsonArrayAction() {
		$this->view->disable();
		$clients=Client::find();
		print_r(json_encode($clients->toArray(), JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE));
	}

	public function searchAction($query=NULL) {
		$this->view->disable();
		$this->response->setContentType('application/json', 'UTF-8');
		$search=new SearchCategories();
		$search->add([ [ "title" => "France" ],[ "title" => "Germany" ],[ "title" => "Great Britain" ] ], "Europe");
		$search->add([ "Afghanistan","Armenia","Azerbaijan" ], "Asia");
		if (isset($query))
			echo $search->search($query);
		else
			echo ($search);
	}

	public function countriesAction($query=NULL) {
		$this->view->disable();
		$this->response->setContentType('application/json', 'UTF-8');
		$search=new SearchResults();
		if (isset($query) === false) {
			$countries=Countries::find();
		} else {
			$countries=Countries::find("countryName like '%" . $query . "%'");
		}
		$search->fromDatabaseObjects($countries, function ($country) {
			return $country->getCountryName();
		});
		echo $search->getResponse();
	}

	public function countriesCatAction($query=NULL) {
		$this->view->disable();
		$this->response->setContentType('application/json', 'UTF-8');
		$search=new SearchCategories();
		if (isset($query) === false) {
			$countries=Countries::find();
		} else {
			$countries=Countries::find("countryName like '%" . $query . "%'");
		}
		$search->fromDatabaseObjects($countries, function ($country) use($search) {
			$search->add($country->getCountryName(), $country->getContinentName());
		});
		echo $search->getResponse();
	}
}

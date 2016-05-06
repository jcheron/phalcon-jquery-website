<?php
use Phalcon\Mvc\View;
use Ajax\semantic\components\search\SearchCategories;
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

	public function searchAction() {
		$this->view->disable();
		$this->response->setContentType('application/json', 'UTF-8');
		$search=new SearchCategories();
		$search->add([ [ "title" => "France" ],[ "title" => "Germany" ],[ "title" => "Great Britain" ] ], "Europe");
		echo ($search);
	}
}

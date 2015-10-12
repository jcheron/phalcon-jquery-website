<?php
use Phalcon\Mvc\View;
class TestController extends ControllerBase {

	public function indexAction(){
		echo "<div id='response2' style='display:none;'></div>";
		//$this->jquery->get("index/main","#response");
		//$this->jquery->get("Test/reponse","#response","{id:1,page:5}");
		$this->jquery->get("Test/reponse","#response2",null,$this->jquery->show("#response2"));
		//$this->jquery->get("index/main","#response","{}","");
		$this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);
		$this->jquery->compile($this->view);
	}

	public function reponseAction(){
		echo "id :".$_GET["id"]."<br>";
		echo "page :".$_GET["page"]."<br>";
	}
}
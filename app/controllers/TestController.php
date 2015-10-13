<?php
use Phalcon\Mvc\View;
class TestController extends ControllerBase {

	public function indexAction(){
		echo "<div id='response2' style='display:none;'></div>";
		//$this->jquery->get("index/main","#response");
		//$this->jquery->get("Test/reponse","#response","{id:1,page:5}");
		$this->jquery->get("Test/reponse","#response2",null,$this->jquery->show("#response2"));
		//$this->jquery->get("index/main","#response","{}","");
		$this->jquery->getOnClick("btShow", "client/all","#divClients");
		$this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);
		$this->jquery->compile($this->view);
	}

	public function reponseAction(){
		echo "id :".$_GET["id"]."<br>";
		echo "page :".$_GET["page"]."<br>";
	}

	public function buttonsGroupAction(){
		$buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups('bg1');
		$buttonsGroup->addElement("Bouton1");
		$buttonsGroup->addElement("Bouton2");
		$clients=Client::find();
		$buttonsGroup->fromDatabaseObjects($clients, function($client){
			return new Ajax\bootstrap\html\HtmlButton($client->getId(),$client->getCaption());
		});
		$buttonsGroup->onClick("$('#reponse').html(this.value);");
		echo $this->jquery->compile();
	}
}
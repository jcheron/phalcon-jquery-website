<?php
use Phalcon\Mvc\View;
use Ajax\bootstrap\html\base\CssRef;
class HomeController extends ControllerBase {
	public function indexAction(){
		$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		$bt=$this->jquery->bootstrap()->htmlButton("btClients","Afficher clients",CssRef::CSS_WARNING);
		$bt->getOnClick("Home/clients","#div-content-7",array("attr"=>""));
		$this->jquery->compile($this->view);
	}
	
	public function clientsAction($index=null){
		$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		if(!isset($index) || !is_numeric($index)){
			$clients=Client::find();
			$this->view->setVars(array("model"=>"Clients","objects"=>$clients));
			$this->jquery->getOnClick(".edit", "Home/clients/","#div-content-7");
			$this->jquery->compile($this->view);
				
		}else{
			$client=Client::findFirst($index);
			$this->view->setVars(array("model"=>"Clients","client"=>$client));
			$this->view->pick("Home/client");
		}
	}
}

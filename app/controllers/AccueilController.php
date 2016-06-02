<?php
use Phalcon\Mvc\View;
use Ajax\bootstrap\html\base\CssRef;
class AccueilController extends ControllerBase {
	public function afterExecuteRoute($dispatcher){
		$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc10");
		$bc->fromDispatcher($this->jquery,$dispatcher,0);
		$bc->addGlyph("glyphicon-home",0);
		$bc->jsSetContent($this->jquery);
		$bc->autoGetOnClick("#ajax-content");
		$this->jquery->compile($this->view);
	}
	public function indexAction(){
		$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		$bt=$this->jquery->bootstrap()->htmlButton("btClients","Afficher clients",CssRef::CSS_WARNING);
		$bt->getOnClick("Accueil/clients","#ajax-content",array("attr"=>""));
	}

	public function clientsAction($index=null){
		$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		if(!isset($index) || !is_numeric($index)){
			$clients=Client::find();
			$this->view->setVars(array("model"=>"Clients","objects"=>$clients));
			$this->jquery->getOnClick(".edit", "Accueil/clients/","#ajax-content");

		}else{
			$client=Client::findFirst($index);
			$this->view->setVars(array("model"=>"Clients","client"=>$client));
			$this->view->pick("Accueil/client");
		}
	}
}

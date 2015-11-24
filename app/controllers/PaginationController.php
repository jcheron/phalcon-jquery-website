<?php
use Phalcon\Mvc\View;
class PaginationController extends ControllerBase {
	public function afterExecuteRoute($dispatcher){
		$bc=$this->jquery->bootstrap()->htmlPagination("page-10",1,3,NULL,2);
		$bc->fromDispatcher($dispatcher);
		$bc->jsSetContent($this->jquery);
		$bc->autoGetOnClick("#div-content-10");
		$this->jquery->compile($this->view);
	}
	
	public function clientAction($index){
		$client=Client::findFirst($index);
		$this->view->setVars(array("model"=>"Clients","client"=>$client));
		$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		
		$this->view->pick("Accueil/client");
	}
}
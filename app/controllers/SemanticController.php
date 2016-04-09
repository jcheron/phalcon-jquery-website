<?php

use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Phalcon\Mvc\Url;
class SemanticController extends \ControllerBase {
	public function indexAction($lang=NULL){
		$this->view->setMainView("index2");
		if(isset($lang)){
			$this->translateEngine->setLanguage($lang,$this->session);
		}
		$expr=array();
		$expr[]=$this->translateEngine->translate(1,"index.header","jQuery, jQuery UI and Twitter Bootstrap library for phalcon MVC Framework");
		$expr[]=$this->translateEngine->translate(2,"index.header","Phalcon-jQuery is a Phalcon® library for generating scripts or rich components (Bootstrap, jQueryUI) on server side.");
		$expr[]=$this->translateEngine->translate(1,"index.download","Download");
		$expr[]=$this->translateEngine->translate(1,"index.install","<p>Or</p><p class='lead'>Install with Composer</p><p>Create the file composer.json</p>");
		$expr[]=$this->translateEngine->translate(2,"index.install","Enter in the console");

		$this->view->setVars(array("expr"=>$expr,"lang"=>$this->translateEngine->getLanguage()));
		$menu=$this->jquery->semantic()->htmlMenu("navbarJS");
		$menu->addItem("home");
		$domaines=Domaine::find("isNull(idParent)");
		$menu->fromDatabaseObjects($domaines, function($domaine){
			$libelle=$this->translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
			$item=new HtmlSemDoubleElement("menu-".$libelle,"a","item");
			$item->setContent($libelle);
	    	$item->setProperty("href",$this->url->get("Index/bootstrap/".$domaine->getId()));
	    	//$item->getOnClick("Index/content/main/".$domaine->getId(),"#response");
			return $item;
		});
		$menu->getItem(0)->setTagName("div")->addToProperty("class","navbar-brand");
		$menu->setInverted();
		$this->jquery->compile($this->view);
	}
}
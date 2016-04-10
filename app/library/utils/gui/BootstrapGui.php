<?php

namespace utils\gui;

use utils\gui\BaseGUI;
use Ajax\bootstrap\html\HtmlLink;
use Ajax\bootstrap\html\HtmlDropdown;
use utils\TranslateEngine;
use Ajax\service\JString;
use Ajax\bootstrap\html\HtmlInputgroup;

class BootstrapGui extends BaseGUI {


	public function getAnchorsDropDown($anchors) {
		// TODO Auto-generated method stub
	}

	public function getpanel($id, $content, $header, $footer) {
		// TODO Auto-generated method stub
	}

	public function getMainMenu() {
		$url=$this->controller->url;
		$translateEngine=$this->controller->getTranslateEngine();
		$jquery=$this->controller->jquery;
    	$navbar=$jquery->bootstrap()->htmlNavbar("navbarJS");
    	$navbar->setClass("");
    	$navbar->fromArray(array("brand"=>$translateEngine->translate(1,"index.home","home"),"brandHref"=>$url->get("Index")));
    	$domaines=\Domaine::find("isNull(idParent)");
    	$navbar->fromDatabaseObjects($domaines, function($domaine) use ($url,$translateEngine) {
    		$libelle=$translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    		$lnk=new HtmlLink("lnk-".$domaine->getId(),"#",$libelle);
    		if($domaine->getDataAjax()!=null){
    			$lnk->setHref($url->get("Index/semantic/".$domaine->getId()));
    		}
    		else
    			$lnk->getOnClick("Index/content/main/".$domaine->getId(),"#response");
    			return $lnk;
    	});
    		$right=$navbar->addZone("right");
    		$ddLang=new HtmlDropdown("btLang");
    		$ddLang->asButton();
    		foreach(TranslateEngine::$languages as $keyLang=>$valueLang){
    			$item=$ddLang->addItem($valueLang,$url->get("Index/index/".$keyLang));
    			$item->getOnClick("Index/index/".$keyLang,"body");
    			if(JString::startsWith($translateEngine->getLanguage(), $keyLang, true)){
    				$item->active();
    				$ddLang->setValue($valueLang." : ".$keyLang);
    			}
    		}
    		$right->addElement($ddLang);
    		$right->asForm();
    		$left=$navbar->addZone("right","leftZ");
    		$left->asForm();
    		$searchInput=new HtmlInputgroup("search");
    		$searchInput->createButton("btSearch","Go","right");
    		$searchInput->setPlaceHolder($translateEngine->translate(1,"index.search","Search..."));
    		$left->addElement($searchInput);
    		$jquery->postOnClick("#btSearch","Index/search",'{"text":$("#search").val()}', "#response");
    		$navbar->cssInverse();
    	return $navbar;
	}

	public function getalert($id, $style, $message) {
		// TODO Auto-generated method stub
	}

	public function getMenuTabs($domaines) {
		// TODO Auto-generated method stub
	}

	public function getBreadcrumbs() {
		// TODO Auto-generated method stub
	}
}
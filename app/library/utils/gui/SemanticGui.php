<?php

namespace utils\gui;

use utils\gui\BaseGUI;
use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\semantic\html\elements\HtmlInput;
use Ajax\semantic\html\base\constants\Size;
use Ajax\semantic\html\base\constants\Direction;
use utils\TranslateEngine;
use Ajax\service\JString;

class SemanticGui extends BaseGUI {

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
    	$menu=$jquery->semantic()->htmlMenu("navbarJS");
    	$menu->addItem($translateEngine->translate(1,"index.home","home"));
    	$domaines=\Domaine::find("isNull(idParent)");
    	$menu->fromDatabaseObjects($domaines, function($domaine) use ($url,$translateEngine) {
    		$libelle=$translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    		$item=new HtmlSemDoubleElement("menu-".$libelle,"a","item");
    		$item->setContent($libelle);
    		if($domaine->getDataAjax()==null){
    			$item->setProperty("href",$url->get("Index/bootstrap/".$domaine->getId()));
    		}
    		else{
    			$item->getOnClick("Index/content/main/".$domaine->getId(),"#response");
    		}
    		return $item;
    	});
    	$menu->getItem(0)->addToProperty("class","navbar-brand")->setProperty("href",$url->get("Index"));
    	$menu->setInverted()->setSize(Size::LARGE);
    	$input=new HtmlInput("search","search","",$translateEngine->translate(1,"index.search","Search..."));
    	$input->addIcon("search",Direction::RIGHT)->asLink();
    	$jquery->postOnClick("#div-search i","Index/search",'{"text":$("#search").val()}', "#response");
    	$ddLang=new \Ajax\semantic\html\modules\HtmlDropdown("idLang");
    	foreach(TranslateEngine::$languages as $keyLang=>$valueLang){
    		$item=$ddLang->addItem($valueLang,$url->get("Index/index/".$keyLang));
    		$item->getOnClick("Index/index/".$keyLang,"body");
    		if(JString::startsWith($translateEngine->getLanguage(), $keyLang, true)){
    			$ddLang->setValue($valueLang." : ".$keyLang);
    		}
    	}
    	$ddLang->asButton();
    	$menu2=$jquery->semantic()->htmlMenu("menu2",array($input,$ddLang));
    	$menu2->setPosition("right");
    	$menu2->setInverted();
    	$menu->addItem($menu2);
    	return $menu;
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
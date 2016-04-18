<?php

namespace utils\gui;

use utils\gui\BaseGUI;
use Ajax\bootstrap\html\HtmlLink;
use Ajax\bootstrap\html\HtmlDropdown;
use utils\TranslateEngine;
use Ajax\service\JString;
use Ajax\bootstrap\html\HtmlInputgroup;
use Ajax\bootstrap\html\HtmlTabs;
use Ajax\bootstrap\html\content\HtmlDropdownItem;
use Ajax\bootstrap\html\content\HtmlTabItem;
use Ajax\bootstrap\html\HtmlAlert;

class BootstrapGui extends BaseGUI {


	public function getAnchorsDropDown($anchors) {
		$ddAnchors=$this->controller->jquery->bootstrap()->htmlDropdown("anchors",$this->controller->getTranslateEngine()->translate(1,"index.menu","Quick access"));
    	$ddAnchors->setStyle("btn-default");
    	$ddAnchors->asButton();
    	foreach ($anchors as $titre=>$vAnchors){
    		$ddAnchors->addHeader($titre);
    		foreach ($vAnchors as $kAnchor=>$vAnchor){
    			$ddAnchors->addItem($vAnchor,"#".$kAnchor);
    		}
    	}
    	return $ddAnchors;
	}

	public function getPanel($id, $content, $header, $footer) {
		return $this->controller->jquery->bootstrap()->htmlPanel($id,$content,$header,$footer);
	}

	public function getMainMenu() {
		$url=$this->controller->url;
		$translateEngine=$this->controller->getTranslateEngine();
		$jquery=$this->controller->jquery;
    	$navbar=$jquery->bootstrap()->htmlNavbar("navbarJS");
    	$navbar->setClass("");
    	$navbar->fromArray(array("brand"=>$translateEngine->translate(1,"index.home","home"),"brandHref"=>$url->get("index")));
    	$domaines=\Domaine::find("isNull(idParent)");
    	$navbar->fromDatabaseObjects($domaines, function($domaine) use ($url,$translateEngine) {
    		$libelle=$translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    		$lnk=new HtmlLink("lnk-".$domaine->getId(),"#",$libelle);
    		if($domaine->getSemantic()){
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

	public function getAlert($id, $style, $message) {
		return new HtmlAlert($id,$message,$style);
	}

	public function replaceAlerts($html){
		$startPoint = '{{';
		$endPoint = '}}';
		$separateur=':';
		$result = preg_replace('/('.preg_quote($startPoint).')(.*?)('.preg_quote($separateur).')(.*)('.preg_quote($endPoint).')/sim', '<div class="alert alert-$2"><span class="glyphicon glyphicon-$2-sign" aria-hidden="true"></span> $4</div>', $html);
		return $result;
	}

	public function getMenuTabs($domaines) {
		$jquery=$this->controller->jquery;
		$translateEngine=$this->controller->getTranslateEngine();

		$tabs=new HtmlTabs("tabs");
		$tabs->setTabstype("pills");
		$tabs->fromDatabaseObjects($domaines, function($domaine) use ($translateEngine){
			if(count($domaine->getDomaines())>0){
				$libelle=$translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
				$dd= new HtmlDropdown("tab-".$domaine->getId(),$libelle);
				$dd->setTagName("button");
				$dd->setStyle("btn-primary");
				$dd->fromDatabaseObjects($domaine->getDomaines(), function($sousDomaine) use ($translateEngine){
					$ddItem= new HtmlDropdownItem("ddItem-".$sousDomaine->getId());
					$libelle=$translateEngine->translate($sousDomaine->getId(),"domaine.libelle",$sousDomaine->getLibelle());
					$ddItem->setCaption($libelle);
					return $ddItem;
				});
				return $dd;
			} else{
				$libelle=$translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
				return new HtmlTabItem("tab-".$domaine->getId(),$libelle);
			}
		});
		$tabs->setStacked();
		$jquery->getOnClick("ul.nav-stacked a", "index/content/","#response");
		return $tabs;
	}

	public function getBreadcrumbs($domaines) {
		$jquery=$this->controller->jquery;
		$bc=$jquery->bootstrap()->htmlBreadcrumbs("bc",array(array("content"=>"Index","data-ajax"=>"Index")),true,0,function ($e){return $e->getProperty("data-ajax");});
		$bc->addGlyph("glyphicon-home",0);
		$bc->fromDatabaseObjects($domaines, function($domaine){
			$lnk= new HtmlLink("bc-".$domaine->getLibelle(),"",$domaine->getLibelle());
			$lnk->setProperty("data-ajax", "content/".$domaine->getId());
			return $lnk;
		});
		$bc->autoGetOnClick("#response");
		return $bc;
	}

	/**
	 * {@inheritDoc}
	 * @see \utils\gui\BaseGUI::initPHP()
	 */
	public function initPHP() {
		return '$bootstrap=$this->jquery->bootstrap();';
	}

}
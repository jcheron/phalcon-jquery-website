<?php

namespace utils\gui;

use utils\gui\BaseGUI;
use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\semantic\html\elements\HtmlInput;
use Ajax\semantic\html\base\constants\Size;
use Ajax\semantic\html\base\constants\Direction;
use utils\TranslateEngine;
use Ajax\service\JString;
use Ajax\semantic\html\elements\HtmlSegmentGroups;
use Ajax\semantic\html\elements\HtmlHeader;
use Ajax\semantic\html\base\constants\Emphasis;
use Ajax\semantic\html\modules\HtmlDropdown;
use Ajax\semantic\html\collections\menus\HtmlMenu;
use Ajax\semantic\html\content\HtmlDropdownItem;
use Ajax\semantic\html\collections\HtmlMessage;
use Ajax\semantic\html\base\constants\Color;

class SemanticGui extends BaseGUI {

	public function getAnchorsDropDown($anchors) {
		$ddAnchors=new HtmlDropdown("anchors",$this->controller->getTranslateEngine()->translate(1,"index.menu","Quick access"));
    	$ddAnchors->asButton()->setColor(Color::ORANGE);
    	foreach ($anchors as $titre=>$vAnchors){
    		$ddAnchors->addItem(HtmlDropdownItem::header($titre));
    		foreach ($vAnchors as $kAnchor=>$vAnchor){
    			$item=$ddAnchors->addItem($vAnchor,$vAnchor);
    			$item->setProperty("href", "#".$kAnchor);
    		}
    	}
    	if($ddAnchors->count()>8){
    		//$ddAnchors->insertItem(HtmlDropdownItem::searchInput("Search..."));
    		$ddAnchors->setFullTextSearch(true);
    		$ddAnchors->asSearch();
			$ddAnchors->addIcon("search",true,true);
    	}
    	return $ddAnchors;
	}


	public function getPanel($id, $content, $header, $footer) {
		$semantic=$this->controller->jquery->semantic();
		if(isset($header)){
			$hd=new HtmlHeader("header-".$id,Size::MINI,$header,"content");
			$sg=$semantic->htmlSegmentGroups($id,array($hd,$content,$footer));
		}else{
			$sg=$semantic->htmlSegmentGroups($id,array($content,$footer));
		}
		$sg->getItem($sg->count()-1)->setEmphasis(Emphasis::SECONDARY);
		return $sg;
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
    		if(!$domaine->getSemantic()){
    			$item->setProperty("href",$url->get("Index/bootstrap/".$domaine->getId()));
    		}
    		else{
    			$item->getOnClick("Index/content/main/".$domaine->getId(),"#response");
    		}
    		return $item;
    	});
    	$menu->getItem(0)->addToProperty("class","navbar-brand")->setProperty("href",$url->get("index"));
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

	public function getAlert($id, $style, $message) {
		$messageO=new HtmlMessage($id,$message);
		$messageO->setStyle($style);
		$messageO->setIcon($style);
		return $messageO;
	}

	public function replaceAlerts($html){
		$startPoint = '{{';
		$endPoint = '}}';
		$separateur=':';
		$result = preg_replace('/('.preg_quote($startPoint).')(.*?)('.preg_quote($separateur).')(.*)('.preg_quote($endPoint).')/sim', '<div class="ui $2 message icon"><i class="$2 icon"></i><div class="content"> $4</div></div>', $html);
		return $result;
	}

	public function getMenuTabs($domaines) {
		$translateEngine=$this->controller->getTranslateEngine();
		$jquery=$this->controller->jquery;
		$sticky=$jquery->semantic()->htmlSticky("tabs");
		$sticky->setContext("#response");
    	$tabs=$jquery->semantic()->htmlMenu("tabs-menu");
    	$tabs->setVertical()->setInverted();
    	$tabs->fromDatabaseObjects($domaines, function($domaine) use ($translateEngine,$tabs){
    		if(count($domaine->getDomaines())>0){
    			$libelle=$translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    			if($domaine->getComponent()==="HtmlDropdown"){
    				$dd= new HtmlDropdown("tab-".$domaine->getId(),$libelle);
    				$dd->asButton();
    				$dd->fromDatabaseObjects($domaine->getDomaines(), function($sousDomaine) use ($translateEngine){
    					$libelle=$translateEngine->translate($sousDomaine->getId(),"domaine.libelle",$sousDomaine->getLibelle());
	    				return new HtmlDropdownItem("dd-item-".$sousDomaine->getId(),$libelle);
    				});
    				return $dd;
    			}else{
	    			$ssMenu=new HtmlMenu("ss-".$domaine->getId());
	    			$ssMenu->fromDatabaseObjects($domaine->getDomaines(), function($sousDomaine) use ($translateEngine){
	    				$libelle=$translateEngine->translate($sousDomaine->getId(),"domaine.libelle",$sousDomaine->getLibelle());
	    				$elm=new HtmlSemDoubleElement("ss-item-".$sousDomaine->getId(),"a","",$libelle);
	    				return $elm;
    				});
    			}
    			return $tabs->generateMenuAsItem($ssMenu,$libelle);
    		} else{
    			$libelle=$translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    			$elm=new HtmlSemDoubleElement("ss-item-".$domaine->getId(),"a","",$libelle);
    			return $elm;
    		}
    	});
    	$jquery->getOnClick("#tabs a.item", "Index/content/","#response");
    	$sticky->setContent($tabs);
    	return $sticky;
	}

	public function getBreadcrumbs($domaines) {
		$jquery=$this->controller->jquery;
		$bc=$jquery->semantic()->htmlBreadcrumb("bc",array(array("content"=>"Index","href"=>$this->controller->url->get("Index"))),true,0,function ($e){return $e->getProperty("data-ajax");});
		$bc->setContentDivider("<i class='right angle icon divider'></i>");
		$bc->addIcon("home",0);
		$bc->fromDatabaseObjects($domaines, function($domaine){
			$lnk= new HtmlSemDoubleElement("bc-".$domaine->getLibelle(),"a","section");
			$lnk->setContent($domaine->getLibelle());
			$lnk->setProperty("data-ajax", "Index/content/".$domaine->getId());
			return $lnk;
		});
		$bc->autoGetOnClick("#response");
		$bc->wrap("<div class='semantic-bread'>","</div>");
		return $bc;
	}

	/**
	 * {@inheritDoc}
	 * @see \utils\gui\BaseGUI::initPHP()
	 */
	public function initPHP() {
		return '$semantic=$this->jquery->semantic();';
	}

	/**
	 * {@inheritDoc}
	 * @see \utils\gui\BaseGUI::backButton()
	 */
	public function backButton() {
		$jquery=$this->controller->jquery;
		$result=$jquery->semantic()->htmlButton("back");
		$result->onClick("$('html, body').animate({scrollTop: 0}, 700);return false;");
		$result->asIcon("angle double up")->setCircular()->setColor(Color::ORANGE);
		return $result;
	}
}
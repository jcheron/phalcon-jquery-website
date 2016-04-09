<?php

use Ajax\bootstrap\html\HtmlNavbar;
use Ajax\bootstrap\html\HtmlLink;
use Ajax\bootstrap\html\HtmlDropdown;
use Ajax\bootstrap\html\HtmlTabs;
use utils\StrUtils;
use Ajax\bootstrap\html\content\HtmlTabItem;
use Ajax\bootstrap\html\content\HtmlDropdownItem;
use utils\TranslateEngine;
use Phalcon\Mvc\View;
use Phalcon\Text;
use Ajax\bootstrap\html\HtmlInputgroup;
use Ajax\semantic\html\base\HtmlSemDoubleElement;
use Ajax\semantic\html\base\constants\Size;
use Ajax\semantic\html\elements\HtmlInput;
use Ajax\semantic\html\base\constants\Direction;

class IndexController extends ControllerBase{
	private $anchors=array();

    public function indexAction($lang=NULL){
    	$partial=false;
    	$hasScript=false;
    	if(isset($lang)){
    		$this->translateEngine->setLanguage($lang,$this->session);
    	}
    	if($this->request->isAjax()){
    		if(isset($lang)){
    			$this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);
    			if($this->session->has("idDomaine")){
    				$idDomaine=$this->session->get("idDomaine");
    				if($idDomaine[0]=="main")
    					$this->dispatcher->forward(array("action"=>"content","params"=>array("main",$idDomaine[1],false)));
    				else
    					$this->dispatcher->forward(array("action"=>"content","params"=>array($idDomaine[0],"",false)));
    			}
    		}else{
    			$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
    			$partial=true;
    			$hasScript=true;
    		}
    		$this->jquery->exec("Prism.highlightAll();",true);
    	}

    	$this->session->remove("idDomaine");
    	if(!$partial){
    		if($this->session->get("framework")==="bootstrap"){
	    		$this->bsMenu();
    		}else{
    			$this->semMenu();
    		}
    	}
    	$expr=array();
    	$expr[]=$this->translateEngine->translate(1,"index.header","jQuery, jQuery UI, Twitter Bootstrap and Semantic-UI library for phalcon MVC Framework");
    	$expr[]=$this->translateEngine->translate(2,"index.header","Phalcon-jQuery is a Phalcon® library for generating scripts or rich components (Twitter Bootstrap, jQueryUI, Semantic-UI) on server side.");
    	$expr[]=$this->translateEngine->translate(1,"index.download","Download");
    	$expr[]=$this->translateEngine->translate(1,"index.install","<p>Or</p><p class='lead'>Install with Composer</p><p>Create the file composer.json</p>");
    	$expr[]=$this->translateEngine->translate(2,"index.install","Enter in the console");
		$this->jquery->compile($this->view);
		$this->view->setVars(array("jquery"=>$this->jquery->genCDNs(),"expr"=>$expr,"lang"=>$this->translateEngine->getLanguage(),"hasScript"=>$hasScript));
    }

    private function _getArrayFromDomaine($domaine,&$array){
    	$domaineParent=$domaine->getDomaine();
    	if(isset($domaineParent) && $domaineParent){
    		$this->_getArrayFromDomaine($domaineParent,$array);
    	}
    	$array[]=$domaine;
    }
    public function contentAction($param1,$param2="",$disableView=true){
    	if($param1=="main"){
    		$id=$param2;
    	}
    	else{
    		$id=$param1;
    	}
    	$id=$this->int($id);
    	$this->session->set("idDomaine",array($param1,$param2));
    	$rubriques=Rubrique::find(  array(
        	"idDomaine = ".$id,
        	"order" => "ordre"
    	));

    	$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc",array(array("content"=>"Index","data-ajax"=>"Index")),true,0,function ($e){return $e->getProperty("data-ajax");});
    	$bc->addGlyph("glyphicon-home",0);
    	$domaines=array();

    	$do=Domaine::findFirst($id);
    	$this->_getArrayFromDomaine($do, $domaines);
    	$bc->fromDatabaseObjects($domaines, function($domaine){
    			$lnk= new HtmlLink("bc-".$domaine->getLibelle(),"",$domaine->getLibelle());
    			$lnk->setProperty("data-ajax", "content/".$domaine->getId());
    			return $lnk;
    	});
    	$bc->autoGetOnClick("#response");
    	echo $bc->compile($this->jquery);
    	foreach ($rubriques as $rubrique){

    		echo "<h1>".$this->translateEngine->translate($rubrique->getId(),"rubrique.titre",$rubrique->getTitre())."</h1>";
    		echo $this->translateEngine->translate($rubrique->getId(),"rubrique.description",$rubrique->getDescription());
    		ob_start();
    		$exemples=$rubrique->getExemples(['order' => 'ordre']);
    		foreach ($exemples as $exemple){
    			echo $this->replaceTitre($this->translateEngine->translate($exemple->getId(),"exemple.titre",$exemple->getTitre()));
    			echo $this->replaceAlerts($this->translateEngine->translate($exemple->getId(),"exemple.description",$exemple->getDescription()));
    			$header=NULL;
    			if(StrUtils::isNotNull($exemple->getHeader())){
    				$header=$this->translateEngine->translate($exemple->getId(),"exemple.header",$exemple->getHeader());
    			}
	    		$exec="";
	    		if($exemple->getExecPHP()){
	    			ob_start();
	    			eval($exemple->getPhp());
	    			$exec=ob_get_clean();
	    		}
	    		$footer=NULL;
	    		if(StrUtils::isNotNull($exemple->getPhp())){
	    			$footer="<pre><code class='language-php'>".htmlentities($exemple->getPhp())."</code></pre>";
	    		}
	    		$p=$this->jquery->bootstrap()->htmlPanel("id-".$exemple->getId(),"<p class='bs-example'>".$exec."</p>",$header,$footer);
	    		echo $p->compile();
    		}
    		$all=ob_get_contents();
    		ob_end_clean();
    		if(count($this->anchors)>2){
    			$ddAnchors=new HtmlDropdown("anchors",$this->translateEngine->translate(1,"index.menu","Quick access"));
    			$ddAnchors->setStyle("btn-default");
    			$ddAnchors->asButton();
    			foreach ($this->anchors as $kAnchor=>$vAnchor){
    				$ddAnchors->addItem($vAnchor,"#".$kAnchor);
    			}
    			echo $ddAnchors->compile();
    		}
    		if($this->translateEngine->hasMessage()){
    			$message=$this->translateEngine->getMessage();
    			$alert=$this->jquery->bootstrap()->htmlAlert("alert-translate",$message);
    			$all=$alert.$all;
    		}
    		echo $all;
    	}
    	$this->jquery->exec("Prism.highlightAll();",true);
    	if($param1=="main")
    		$this->jquery->get("index/menu/".$id,".col-md-3");
    	$this->jquery->getOnClick("#response a.menu", "index/content/","#response");
    	if($this->request->has("anchor")){
    		$this->jquery->exec('if($("[name=\''.$this->request->get("anchor").'\']").offset()){$(document).scrollTop( $("[name=\''.$this->request->get("anchor").'\']").offset().top );}',true);
    	}
    	if($disableView){
			$this->view->disable();
			echo $this->jquery->compile($this->view);
    	}else{
    		$this->jquery->postOnClick("#btSearch","Index/search",'{"text":$("#search").val()}', "#response");

    		$this->jquery->compile($this->view);
    	}
    }

    public function menuAction($id){
    	$id=$this->int($id);
    	$domaines=Domaine::find(array(
        	"idParent = ".$id,
        	"order" => "ordre"
    	));
		$tabs=new HtmlTabs("tabs");
		$tabs->setTabstype("pills");

		$tabs->fromDatabaseObjects($domaines, function($domaine){
			if(count($domaine->getDomaines())>0){
				$libelle=$this->translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
				$dd= new HtmlDropdown("tab-".$domaine->getId(),$libelle);
				$dd->setTagName("button");
				$dd->setStyle("btn-primary");
				$dd->fromDatabaseObjects($domaine->getDomaines(), function($sousDomaine){
					$ddItem= new HtmlDropdownItem("ddItem-".$sousDomaine->getId());
					$libelle=$this->translateEngine->translate($sousDomaine->getId(),"domaine.libelle",$sousDomaine->getLibelle());
					$ddItem->setCaption($libelle);
					return $ddItem;
				});
				return $dd;
			} else{
				$libelle=$this->translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
				return new HtmlTabItem("tab-".$domaine->getId(),$libelle);
			}
		});
		$tabs->setStacked();
		echo $tabs->compile($this->jquery);
		$this->jquery->getOnClick("ul.nav-stacked a", "index/content/","#response");
    	echo $this->jquery->compile();
    	$this->view->disable();
    }

    private function int($s){return(int)preg_replace('/[^\d]*(\-?\d*).*/','$1',$s);}

    private function replaceAlerts($html){
    	$startPoint = '{{';
    	$endPoint = '}}';
    	$separateur=':';
    	$result = preg_replace('/('.preg_quote($startPoint).')(.*?)('.preg_quote($separateur).')(.*)('.preg_quote($endPoint).')/sim', '<div class="alert alert-$2"><span class="glyphicon glyphicon-$2-sign" aria-hidden="true"></span> $4</div>', $html);
    	return $result;
    }

    private function replaceTitre($titre){
    	if(StrUtils::isNotNull($titre)){
    		$num=count($this->anchors)+1;
	    	$attr=StrUtils::cleanAttr($titre);
	    	$this->anchors[$attr]=$num." - ".$titre;
	    	$titre="<a name='".$attr."' class='anchor'><span class='octicon octicon-link'></span></a>".$num." - ".$titre;
    	}
    	return "<h3>".$titre."</h3>";
    }

    public function searchAction(){
    	$text=$_POST["text"];
    	if(Text::startsWith($this->translateEngine->getLanguage(), "en", true)){
    		$domaines=Domaine::find("libelle LIKE '%".$text."%'");
    		$rubriques=Rubrique::find("titre LIKE '%".$text."%' OR description LIKE '%".$text."%'");
    		$exemples=Exemple::find("titre LIKE '%".$text."%' OR description LIKE '%".$text."%'");
    	}else{
    		$domaines=array();
    		$rubriques=array();
    		$exemples=array();
    		$translations=$this->translateEngine->getTranslations();
    		if($text!=""){
	    		$arrayTranslations=$translations->filter(function($object) use($text){
	    			if( $object->getName()=="domaine.libelle" && stristr($object->getText(),$text)!==false){
	    				return $object;
	    			}
	    		});
	    		if(sizeof($arrayTranslations)>0)
	    			$domaines=Domaine::find($this->_getCondition($arrayTranslations));

	    		$arrayRubriques=$translations->filter(function($object) use($text){
	    			if( Text::startsWith($object->getName(),"rubrique" && stristr($object->getText(),$text)!==false)){
	    				return $object;
	    			}
	    		});
	    		if(sizeof($arrayRubriques)>0)
	    			$rubriques=Rubrique::find($this->_getCondition($arrayRubriques));

	    		$arrayExemples=$translations->filter(function($object) use($text){
	    			if( Text::startsWith($object->getName(),"exemple" )){
	    				if(stristr($object->getText(),$text)!==false)
	    					return $object;
	    			}
	    		});
	    		if(sizeof($arrayExemples)>0)
	    			$exemples=Exemple::find($this->_getCondition($arrayExemples));
    		}
    	}
    	$this->_searchResults($text, $domaines, $rubriques, $exemples);

    }
    private function _getCondition($array){
    	$ids=array_map(function($item){return "id=".$item->getIdElement();}, $array);
    	return implode(" OR ", $ids);

    }
    private function _highlight($text,$word){
    	if($word=="")
    		return $text;
    	else{
    		return str_ireplace($word, "<span class='highlight'>".$word."</span>", $text);
    	}
    }

    private function _searchResults($text,$domaines,$rubriques,$exemples){
    	$hasResults=false;
    	$this->view->disable();
    	$dom=$this->jquery->bootstrap()->htmlPanel("listDomaines","","Domaines (".sizeof($domaines).")");
    	if(sizeof($domaines)>0){
    		$hasResults=true;
    		foreach ($domaines as $domaine){
    			$libelle=$this->translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    			$dom->addContent((new HtmlLink("dom-".$domaine->getId(),"",$this->_highlight($libelle,$text)))->setClass("domaine"));
    		}
    		echo $dom;
    	}


    	$rub=$this->jquery->bootstrap()->htmlPanel("listRubriques","","Rubriques (".sizeof($rubriques).")");
    	if(sizeof($rubriques)>0){
    		$hasResults=true;
    		foreach ($rubriques as $rubrique){
    			$titre=$this->translateEngine->translate($rubrique->getId(),"rubrique.titre",$rubrique->getTitre());
    			$rub->addContent((new HtmlLink("rub-".$rubrique->getDomaine()->getId(),"",$this->_highlight($titre,$text)))->setClass("rubrique")->setProperty("data-anchor",StrUtils::cleanAttr($rubrique->getTitre())));
    		}
    		echo $rub;
    	}

    	$ex=$this->jquery->bootstrap()->htmlPanel("listExemples","","Exemples (".sizeof($exemples).")");
    	if(sizeof($exemples)>0){
    		$rubrique="";
    		$domaine="";
    		$hasResults=true;
    		foreach ($exemples as $exemple){
    			$newRubrique=$exemple->getRubrique();
    			if($domaine!=$newRubrique->getDomaine()){
    				$domaine=$newRubrique->getDomaine();
    				$libelle=$this->translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    				$ex->addContent("<h2>".$this->_highlight($libelle,$text)."</h2><hr>");
    			}
    			if($rubrique!=$newRubrique){
    				$rubrique=$newRubrique;
    				$titre=$this->translateEngine->translate($rubrique->getId(),"rubrique.titre",$rubrique->getTitre());
    				$ex->addContent("<h3>".$this->_highlight($titre,$text)."</h3>");
    			}
    			$titre=$this->translateEngine->translate($exemple->getId(),"exemple.titre",$exemple->getTitre());
    			$description=$this->translateEngine->translate($exemple->getId(),"exemple.description",$exemple->getDescription());

    			$ex->addContent((new HtmlLink("ex-".$domaine->getId(),"","<h4>".$this->_highlight($titre,$text)."</h4>"))->setClass("exemple")->setProperty("data-anchor",StrUtils::cleanAttr($titre)));
    			$ex->addContent("<div>".$this->_highlight(strip_tags($description),$text)."</div>");

    		}
    		echo $ex;
    	}
    	if($hasResults){
    		$this->jquery->getOnClick(".domaine","index/content/main/","#response");
    		$this->jquery->postOnClick(".rubrique, .exemple","index/content/",'{anchor:$(self).attr("data-anchor")}',"#response");
    	}else{
    		echo $this->jquery->bootstrap()->htmlPanel("listNoResults","Aucun résultat trouvé","Domaines, rubriques, exemples");
    	}
    	echo $this->jquery->compile();
    }

    private function bsMenu(){
    	$navbar=$this->jquery->bootstrap()->htmlNavbar("navbarJS");
    	$navbar->setClass("");
    	$navbar->fromArray(array("brand"=>$this->translateEngine->translate(1,"index.home","home"),"brandHref"=>$this->url->get("Index")));
    	$domaines=Domaine::find("isNull(idParent)");
    	$navbar->fromDatabaseObjects($domaines, function($domaine){
    		$libelle=$this->translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    		$lnk=new HtmlLink("lnk-".$domaine->getId(),"#",$libelle);
    		if($domaine->getDataAjax()!=null){
    			$lnk->setHref($this->url->get("Index/semantic/".$domaine->getId()));
    		}
    		else
    			$lnk->getOnClick("Index/content/main/".$domaine->getId(),"#response");
    			return $lnk;
    	});
    		$right=$navbar->addZone("right");
    		$ddLang=new HtmlDropdown("btLang");
    		$ddLang->asButton();
    		foreach(TranslateEngine::$languages as $keyLang=>$valueLang){
    			$item=$ddLang->addItem($valueLang,$this->url->get("Index/index/".$keyLang));
    			$item->getOnClick("Index/index/".$keyLang,"body");
    			if(Text::startsWith($this->translateEngine->getLanguage(), $keyLang, true)){
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
    		$searchInput->setPlaceHolder($this->translateEngine->translate(1,"index.search","Search..."));
    		$left->addElement($searchInput);
    		$this->jquery->postOnClick("#btSearch","Index/search",'{"text":$("#search").val()}', "#response");
    		$navbar->cssInverse();
    	return $navbar;
    }
	public function semanticAction($idDomaine=null){
		$this->view->setMainView("index2");
		$this->session->set("framework", "semantic");
		if(isset($idDomaine))
			$this->jquery->get("Index/content/".$idDomaine,"#response");
		$this->indexAction($this->translateEngine->getLanguage());
	}

	public function bootstrapAction($idDomaine=null){
		$this->view->setMainView("index");
		$this->session->set("framework", "bootstrap");
		if(isset($idDomaine))
			$this->jquery->get("Index/content/".$idDomaine,"#response");
		$this->indexAction($this->translateEngine->getLanguage());
	}

    public function semMenu(){
    	$menu=$this->jquery->semantic()->htmlMenu("navbarJS");

    	$menu->addItem("home");
    	$domaines=Domaine::find("isNull(idParent)");
    	$menu->fromDatabaseObjects($domaines, function($domaine){
    		$libelle=$this->translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    		$item=new HtmlSemDoubleElement("menu-".$libelle,"a","item");
    		$item->setContent($libelle);
    		if($domaine->getDataAjax()==null){
    			$item->setProperty("href",$this->url->get("Index/bootstrap/".$domaine->getId()));
    		}
    		else{
    			$item->getOnClick("Index/content/main/".$domaine->getId(),"#response");
    		}
    		return $item;
    	});
    	$menu->getItem(0)->addToProperty("class","navbar-brand")->setProperty("href",$this->url->get("/Index"));
    	$menu->setInverted()->setSize(Size::MEDIUM);
    	$input=new HtmlInput("search");
    	$input->addIcon("search",Direction::RIGHT)->asLink()->setCircular()->setInverted();
    	$this->jquery->postOnClick("#div-search i","Index/search",'{"text":$("#search").val()}', "#response");
    	$ddLang=new \Ajax\semantic\html\modules\HtmlDropdown("idLang");
    	foreach(TranslateEngine::$languages as $keyLang=>$valueLang){
    		$item=$ddLang->addItem($valueLang,$this->url->get("Index/index/".$keyLang));
    		$item->getOnClick("Index/index/".$keyLang,"body");
    		if(Text::startsWith($this->translateEngine->getLanguage(), $keyLang, true)){
    			$ddLang->setValue($valueLang." : ".$keyLang);
    		}
    	}
    	$ddLang->asButton();
    	$menu2=$this->jquery->semantic()->htmlMenu("menu2",array($ddLang));
    	$menu2->setPosition("right");
    	$menu2->setInverted();
    	$menu->addItem($menu2);
    	$menu->addItem($input);
    	return $menu;
    }
}


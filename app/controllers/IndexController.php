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

class IndexController extends ControllerBase{
	private $anchors=array();
	
    public function indexAction($lang=NULL){
    	if($this->request->isAjax()){
    		$this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);
    		$this->jquery->exec("Prism.highlightAll();",true);
    	}
    	if(isset($lang)){
    		$this->translateEngine->setLanguage($lang,$this->session);
    	}
    	$navbar=$this->jquery->bootstrap()->htmlNavbar("navbarJS");
    	$navbar->setClass("");
    	$navbar->fromArray(array("brandImage"=>"img/miniPhalcon.png","brandHref"=>"index"));
		$domaines=Domaine::find("isNull(idParent)");
    	$navbar->fromDatabaseObjects($domaines, function($domaine){
    		$libelle=$this->translateEngine->translate($domaine->getId(),"domaine.libelle",$domaine->getLibelle());
    		$lnk=new HtmlLink("lnk-".$domaine->getId(),"#",$libelle);
    		$lnk->getOnClick("index/content/main/".$domaine->getId(),"#response");
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
    	$expr=array();
    	$expr[]=$this->translateEngine->translate(1,"index.header","jQuery, jQuery UI and Twitter Bootstrap library for phalcon MVC Framework");
    	$expr[]=$this->translateEngine->translate(2,"index.header","Phalcon-jQuery is a library for Phalcon® for generating scripts or rich components (Bootstrap, jQueryUI) on server side.");
    	$expr[]=$this->translateEngine->translate(1,"index.download","Download");
    	$expr[]=$this->translateEngine->translate(1,"index.install","<p>Or</p><p class='lead'>Install with Composer</p><p>Create the file composer.json</p>");
    	$expr[]=$this->translateEngine->translate(2,"index.install","Enter in the console");
    	 
		$this->jquery->compile($this->view);
		$this->view->setVars(array("jquery"=>$this->jquery->genCDNs(),"expr"=>$expr,"lang"=>$this->translateEngine->getLanguage()));
    }

    public function contentAction($param1,$param2=""){
    	if($param1=="main"){
    		$id=$param2;
    	}
    	else{
    		$id=$param1;
    	}
    	$id=$this->int($id);
    	$rubriques=Rubrique::find(  array(
        	"idDomaine = ".$id,
        	"order" => "ordre"
    	));
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
    		echo $all;
    	}
    	$this->jquery->exec("Prism.highlightAll();",true);
    	if($param1=="main")
    		$this->jquery->get("index/menu/".$id,".col-md-3");
    	$this->jquery->getOnClick("#response a.menu", "index/content/","#response");
    	echo $this->jquery->compile();
		$this->view->disable();
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
}


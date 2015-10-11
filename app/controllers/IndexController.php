<?php

use Ajax\bootstrap\html\HtmlNavbar;
use Ajax\bootstrap\html\HtmlListgroup;
use Ajax\bootstrap\html\base\CssRef;
use Ajax\bootstrap\html\HtmlLink;
use Ajax\bootstrap\html\HtmlDropdown;
use Ajax\bootstrap\html\HtmlTabs;
use utils\StrUtils;
use Ajax\bootstrap\html\content\HtmlTabItem;
use Ajax\bootstrap\html\content\HtmlDropdownItem;

class IndexController extends ControllerBase
{
    public function indexAction(){
    	$navbar=$this->jquery->bootstrap()->htmlNavbar("navbarJS");
    	$navbar->setClass("");
    	$navbar->fromArray(array("brandImage"=>"img/miniPhalcon.png","brandHref"=>"index"));
		$domaines=Domaine::find("isNull(idParent)");
    	$navbar->fromDatabaseObjects($domaines, function($domaine){
    		$lnk=new HtmlLink("lnk-".$domaine->getId(),"#",$domaine->getLibelle());
    		$lnk->getOnClick("index/content/main/".$domaine->getId(),"#response");
    		return $lnk;
    	});

		$this->jquery->compile($this->view);
		$this->view->setVars(array("jquery"=>$this->jquery->genCDNs()));
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
    		echo "<h1>".$rubrique->getTitre()."</h1>";
    		echo $rubrique->getDescription();
    		foreach ($rubrique->getExemples() as $exemple){
    			echo $exemple->getTitre();
    			echo $exemple->getDescription();
    			$header=NULL;
    			if(StrUtils::isNotNull($exemple->getHeader())){
    				$header=$exemple->getHeader();
    			}
	    		$exec="";
	    		if($exemple->getExecPHP()){
	    			ob_start();
	    			eval($exemple->getPhp());
	    			$exec=ob_get_clean();
	    		}
	    		$footer=NULL;
	    		if(StrUtils::isNotNull($exemple->getPhp())){
	    			$footer="<pre><code class='language-php'>".$exemple->getPhp()."</code></pre>";
	    		}
	    		$p=$this->jquery->bootstrap()->htmlPanel("id-".$exemple->getId(),"<p class='bs-example'>".$exec."</p>",$header,$footer);
	    		echo $p->compile();
    		}
    	}
    	$this->jquery->exec("Prism.highlightAll();",true);
    	if($param1=="main")
    		$this->jquery->get("index/menu/".$id,".col-md-3");
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
				$dd= new HtmlDropdown("tab-".$domaine->getId(),$domaine->getLibelle());
				$dd->setTagName("button");
				$dd->setStyle("btn-primary");
				$dd->fromDatabaseObjects($domaine->getDomaines(), function($sousDomaine){
					$ddItem= new HtmlDropdownItem("ddItem-".$sousDomaine->getId());
					$ddItem->setCaption($sousDomaine->getLibelle());
					return $ddItem;
				});
				return $dd;
			} else
			return new HtmlTabItem("tab-".$domaine->getId(),$domaine->getLibelle());
		});
		$tabs->setStacked();
		echo $tabs->compile($this->jquery);
		$this->jquery->getOnClick("ul.nav-stacked a", "index/content/","#response");
    	echo $this->jquery->compile();
    	$this->view->disable();
    }

    private function int($s){return(int)preg_replace('/[^\d]*(\-?\d*).*/','$1',$s);}

}


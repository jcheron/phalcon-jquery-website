<?php
use Ajax\bootstrap\html\HtmlLink;
use utils\StrUtils;
use utils\TranslateEngine;
use Phalcon\Mvc\View;
use Phalcon\Text;
use utils\gui\SemanticGui;
class IndexController extends ControllerBase {
	private $anchors=array ();
	private $gui;

	public function initialize() {
		parent::initialize();
		$actionName=strtolower($this->dispatcher->getActionName());
		if ($actionName === "bootstrap") {
			$this->session->set("framework", "bootstrap");
		} elseif ($actionName === "semantic") {
			$this->session->set("framework", "semantic");
		}
		if ($this->session->get("framework") === "bootstrap") {
			$this->gui=new \utils\gui\BootstrapGui($this);
		} else {
			$this->gui=new SemanticGui($this);
		}
	}

	public function indexAction($lang=NULL) {
		$partial=false;
		$hasScript=false;

		if (isset($lang)) {
			$this->translateEngine->setLanguage($lang, $this->session);
		}
		if ($this->request->isAjax()) {
			if (isset($lang)) {
				$this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);
				if ($this->session->has("idDomaine")) {
					$idDomaine=$this->session->get("idDomaine");
					if ($idDomaine[0] == "main")
						$this->dispatcher->forward(array ("action" => "content","params" => array ("main",$idDomaine[1],false ) ));
					else
						$this->dispatcher->forward(array ("action" => "content","params" => array ($idDomaine[0],"",false ) ));
				}
			} else {
				$this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
				$partial=true;
				$hasScript=true;
			}
			$this->jquery->exec("Prism.highlightAll();", true);
		}

		$this->session->remove("idDomaine");
		if (!$partial) {
			$this->gui->getMainMenu();
			$this->gui->backButton();
			$this->jquery->exec('var amountScrolled = 300;$(window).scroll(function() {if ( $(window).scrollTop() > amountScrolled ) {$("#back").fadeIn("slow");} else {$("#back").fadeOut("slow");}});', true);
		}
		$expr=array ();
		$expr[]=$this->translateEngine->translate(1, "index.header", "jQuery, jQuery UI, Twitter Bootstrap and Semantic-UI library for phalcon MVC Framework");
		$expr[]=$this->translateEngine->translate(2, "index.header", "A Phalcon® library for generating scripts or rich components (Twitter Bootstrap, jQueryUI, Semantic-UI) on server side.");
		$expr[]=$this->translateEngine->translate(1, "index.download", "Download");
		$expr[]=$this->translateEngine->translate(1, "index.install", "<p>Or</p><h3 class='ui header'>Install with Composer</h3><p>Create the file composer.json</p>");
		$expr[]=$this->translateEngine->translate(2, "index.install", "Enter in the console");

		$bt=$this->jquery->semantic()->htmlButton("bt-download", $expr[2])->asLink("https://github.com/jcheron/phalcon-jquery/archive/v1.0.5.zip");
		$bt->addIcon("download");
		$bt->addLabel("Phalcon-jQuery Azhar v1.0.5")->asLink("https://github.com/jcheron/phalcon-jquery/archive/v1.0.5.zip")->setPointing("left");

		$this->jquery->compile($this->view);
		$this->view->setVars(array ("expr" => $expr,"lang" => $this->translateEngine->getLanguage(),"hasScript" => $hasScript ));
	}

	private function _getArrayFromDomaine($domaine, &$array) {
		$domaineParent=$domaine->getDomaine();
		if (isset($domaineParent) && $domaineParent) {
			$this->_getArrayFromDomaine($domaineParent, $array);
		}
		$array[]=$domaine;
	}

	public function contentAction($param1, $param2="", $disableView=true) {
		if ($param1 == "main") {
			$id=$param2;
		} else {
			$id=$param1;
		}
		$id=$this->int($id);
		$this->session->set("idDomaine", array ($param1,$param2 ));
		$rubriques=Rubrique::find(array ("idDomaine = " . $id,"order" => "ordre" ));
		$domaines=array ();
		$do=Domaine::findFirst($id);
		$this->_getArrayFromDomaine($do, $domaines);
		$bc=$this->gui->getBreadcrumbs($domaines);
		echo $bc->compile($this->jquery);
		ob_start();
		if (sizeof($rubriques) > 0) {
			foreach ( $rubriques as $rubrique ) {
				$titreRubrique=$this->translateEngine->translate($rubrique->getId(), "rubrique.titre", $rubrique->getTitre());
				$this->anchors[$titreRubrique]=array ();
				echo "<h1>" . $titreRubrique . "</h1>";
				echo $this->translateEngine->translate($rubrique->getId(), "rubrique.description", $rubrique->getDescription());

				$exemples=$rubrique->getExemples([ 'order' => 'ordre' ]);
				foreach ( $exemples as $exemple ) {
					echo $this->replaceTitre($titreRubrique, $this->translateEngine->translate($exemple->getId(), "exemple.titre", $exemple->getTitre()));
					echo $this->gui->replaceAlerts($this->translateEngine->translate($exemple->getId(), "exemple.description", $exemple->getDescription()));
					$header=NULL;
					if (StrUtils::isNotNull($exemple->getHeader())) {
						$header=$this->translateEngine->translate($exemple->getId(), "exemple.header", $exemple->getHeader());
					}
					$exec="";
					$startPoint='<hidden>';
					$endPoint='</hidden>';
					if ($exemple->getExecPHP()) {
						ob_start();
						$php=str_ireplace([ $startPoint,$endPoint ], "", $exemple->getPhp());
						eval($this->gui->initPHP() . $php);
						$exec=ob_get_clean();
					}
					$footer=NULL;
					if (StrUtils::isNotNull($exemple->getPhp())) {
						$php=preg_replace('#(' . preg_quote($startPoint) . ')(.*)(' . preg_quote($endPoint) . ')#si', '', $exemple->getPhp());
						$footer="<pre><code class='language-php'>" . htmlentities($php) . "</code></pre>";
					}
					$p=$this->gui->getPanel("id-" . $exemple->getId(), "<div class='bs-example ".$exemple->getCss()."'>" . $exec . "</div>", $header, $footer);
					echo $p->compile();
				}
			}
		} else {
			$ssDomaines=Domaine::find(array ("idParent = " . $id,"order" => "ordre" ));
			$this->gui->showMainDomaine($id, $ssDomaines);
		}

		$all=ob_get_contents();
		ob_end_clean();
		if ($this->getAnchorsCount() > 2) {
			echo "<br>";
			$ddAnchors=$this->gui->getAnchorsDropDown($this->anchors);
			echo $ddAnchors->compile($this->jquery);
		}
		if ($this->translateEngine->hasMessage()) {
			$message=$this->translateEngine->getMessage();
			$alert=$this->gui->getAlert("alert-translate", "warning", $message);
			$all=$alert . $all;
		}
		echo $all;

		$this->jquery->exec("Prism.highlightAll();", true);
		if ($this->session->get("framework") === "semantic") {
			$this->jquery->exec("$('.ui.sticky').sticky('refresh');", true);
		}
		if ($param1 == "main")
			$this->jquery->get("index/menu/" . $id, ".col-md-3");
		$this->jquery->getOnClick("#response a.menu", "index/content/", "#response");
		if ($this->request->has("anchor")) {
			$this->jquery->exec('if($("[name=\'' . $this->request->get("anchor") . '\']").offset()){$(document).scrollTop( $("[name=\'' . $this->request->get("anchor") . '\']").offset().top );}', true);
		}
		if ($disableView) {
			$this->view->disable();
			echo $this->jquery->compile($this->view);
		} else {
			$this->jquery->postOnClick("#btSearch", "Index/search", '{"text":$("#search").val()}', "#response");
			$this->jquery->compile($this->view);
		}
	}

	public function menuAction($id) {
		$id=$this->int($id);
		$domaines=Domaine::find(array ("idParent = " . $id,"order" => "ordre ASC" ));
		$tabs=$this->gui->getMenuTabs($domaines);

		echo $tabs->compile($this->jquery);
		echo $this->jquery->compile();
		$this->view->disable();
	}

	private function getAnchorsCount() {
		$count=0;
		foreach ( $this->anchors as $anchors ) {
			$count+=sizeof($anchors);
		}
		return $count;
	}

	private function int($s) {
		return ( int ) preg_replace('/[^\d]*(\-?\d*).*/', '$1', $s);
	}

	private function replaceAlerts($html) {
		$startPoint='{{';
		$endPoint='}}';
		$separateur=':';
		$result=preg_replace('/(' . preg_quote($startPoint) . ')(.*?)(' . preg_quote($separateur) . ')(.*)(' . preg_quote($endPoint) . ')/sim', '<div class="alert alert-$2"><span class="glyphicon glyphicon-$2-sign" aria-hidden="true"></span> $4</div>', $html);
		return $result;
	}

	private function replaceTitre($titreRubrique, $titre) {
		if (StrUtils::isNotNull($titre)) {
			$num=count($this->anchors[$titreRubrique]) + 1;
			$attr=StrUtils::cleanAttr($titre);
			$this->anchors[$titreRubrique][$attr]=$num . " - " . $titre;
			$titre="<a name='" . $attr . "' class='anchor'><span class='octicon octicon-link'></span></a>" . $num . " - " . $titre;
		}
		return "<h3>" . $titre . "</h3>";
	}

	public function searchAction() {
		$text=$_POST["text"];
		if (Text::startsWith($this->translateEngine->getLanguage(), "en", true)) {
			$domaines=Domaine::find("libelle LIKE '%" . $text . "%'");
			$rubriques=Rubrique::find("titre LIKE '%" . $text . "%' OR description LIKE '%" . $text . "%'");
			$exemples=Exemple::find("titre LIKE '%" . $text . "%' OR description LIKE '%" . $text . "%'");
		} else {
			$domaines=array ();
			$rubriques=array ();
			$exemples=array ();
			$translations=$this->translateEngine->getTranslations();
			if ($text != "") {
				$arrayTranslations=$translations->filter(function ($object) use($text) {
					if ($object->getName() == "domaine.libelle" && stristr($object->getText(), $text) !== false) {
						return $object;
					}
				});
				if (sizeof($arrayTranslations) > 0)
					$domaines=Domaine::find($this->_getCondition($arrayTranslations));

				$arrayRubriques=$translations->filter(function ($object) use($text) {
					if (Text::startsWith($object->getName(), "rubrique" && stristr($object->getText(), $text) !== false)) {
						return $object;
					}
				});
				if (sizeof($arrayRubriques) > 0)
					$rubriques=Rubrique::find($this->_getCondition($arrayRubriques));

				$arrayExemples=$translations->filter(function ($object) use($text) {
					if (Text::startsWith($object->getName(), "exemple")) {
						if (stristr($object->getText(), $text) !== false)
							return $object;
					}
				});
				if (sizeof($arrayExemples) > 0)
					$exemples=Exemple::find($this->_getCondition($arrayExemples));
			}
		}
		$this->_searchResults($text, $domaines, $rubriques, $exemples);
	}

	private function _getCondition($array) {
		$ids=array_map(function ($item) {
			return "id=" . $item->getIdElement();
		}, $array);
		return implode(" OR ", $ids);
	}

	private function _highlight($text, $word) {
		if ($word == "")
			return $text;
		else {
			return str_ireplace($word, "<span class='highlight'>" . $word . "</span>", $text);
		}
	}

	private function _searchResults($text, $domaines, $rubriques, $exemples) {
		$hasResults=false;
		$this->view->disable();
		$dom=$this->jquery->bootstrap()->htmlPanel("listDomaines", "", "Domaines (" . sizeof($domaines) . ")");
		if (sizeof($domaines) > 0) {
			$hasResults=true;
			foreach ( $domaines as $domaine ) {
				$libelle=$this->translateEngine->translate($domaine->getId(), "domaine.libelle", $domaine->getLibelle());
				$dom->addContent((new HtmlLink("dom-" . $domaine->getId(), "", $this->_highlight($libelle, $text)))->setClass("domaine"));
			}
			echo $dom;
		}

		$rub=$this->jquery->bootstrap()->htmlPanel("listRubriques", "", "Rubriques (" . sizeof($rubriques) . ")");
		if (sizeof($rubriques) > 0) {
			$hasResults=true;
			foreach ( $rubriques as $rubrique ) {
				$titre=$this->translateEngine->translate($rubrique->getId(), "rubrique.titre", $rubrique->getTitre());
				$rub->addContent((new HtmlLink("rub-" . $rubrique->getDomaine()->getId(), "", $this->_highlight($titre, $text)))->setClass("rubrique")->setProperty("data-anchor", StrUtils::cleanAttr($rubrique->getTitre())));
			}
			echo $rub;
		}

		$ex=$this->jquery->bootstrap()->htmlPanel("listExemples", "", "Exemples (" . sizeof($exemples) . ")");
		if (sizeof($exemples) > 0) {
			$rubrique="";
			$domaine="";
			$hasResults=true;
			foreach ( $exemples as $exemple ) {
				$newRubrique=$exemple->getRubrique();
				if ($domaine != $newRubrique->getDomaine()) {
					$domaine=$newRubrique->getDomaine();
					$libelle=$this->translateEngine->translate($domaine->getId(), "domaine.libelle", $domaine->getLibelle());
					$ex->addContent("<h2>" . $this->_highlight($libelle, $text) . "</h2><hr>");
				}
				if ($rubrique != $newRubrique) {
					$rubrique=$newRubrique;
					$titre=$this->translateEngine->translate($rubrique->getId(), "rubrique.titre", $rubrique->getTitre());
					$ex->addContent("<h3>" . $this->_highlight($titre, $text) . "</h3>");
				}
				$titre=$this->translateEngine->translate($exemple->getId(), "exemple.titre", $exemple->getTitre());
				$description=$this->translateEngine->translate($exemple->getId(), "exemple.description", $exemple->getDescription());

				$ex->addContent((new HtmlLink("ex-" . $domaine->getId(), "", "<h4>" . $this->_highlight($titre, $text) . "</h4>"))->setClass("exemple")->setProperty("data-anchor", StrUtils::cleanAttr($titre)));
				$ex->addContent("<div>" . $this->_highlight(strip_tags($description), $text) . "</div>");
			}
			echo $ex;
		}
		if ($hasResults) {
			$this->jquery->getOnClick(".domaine", "index/content/main/", "#response");
			$this->jquery->postOnClick(".rubrique, .exemple", "index/content/", '{anchor:$(self).attr("data-anchor")}', "#response");
		} else {
			echo $this->jquery->bootstrap()->htmlPanel("listNoResults", "Aucun résultat trouvé", "Domaines, rubriques, exemples");
		}
		echo $this->jquery->compile();
	}

	public function semanticAction($idDomaine=null) {
		$this->view->setMainView("index");
		if (isset($idDomaine))
			$this->jquery->get("Index/content/main/" . $idDomaine, "#response");
		$this->indexAction($this->translateEngine->getLanguage());
	}

	public function bootstrapAction($idDomaine=null) {
		$this->view->setMainView("index_bs");
		if (isset($idDomaine))
			$this->jquery->get("Index/content/main/" . $idDomaine, "#response");
		$this->indexAction($this->translateEngine->getLanguage());
	}
}


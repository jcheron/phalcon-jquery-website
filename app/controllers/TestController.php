<?php
use Phalcon\Mvc\View;
use Ajax\semantic\html\elements\html5\HtmlImg;
class TestController extends ControllerBase {

	public function indexAction() {
		echo "<div id='response2' style='display:none;'></div>";
		// $this->jquery->get("index/main","#response");
		// $this->jquery->get("Test/reponse","#response","{id:1,page:5}");
		$this->jquery->get("Test/reponse", "#response2", null, $this->jquery->show("#response2"));
		// $this->jquery->get("index/main","#response","{}","");
		$this->jquery->getOnClick("btShow", "client/all", "#divClients");
		$this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);
		$this->jquery->compile($this->view);
	}

	public function reponseAction() {
		echo "id :" . $_GET["id"] . "<br>";
		echo "page :" . $_GET["page"] . "<br>";
	}

	public function buttonsGroupAction() {
		$buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups('bg1');
		$buttonsGroup->addElement("Bouton1");
		$buttonsGroup->addElement("Bouton2");
		$clients=Client::find();
		$buttonsGroup->fromDatabaseObjects($clients, function ($client) {
			return new Ajax\bootstrap\html\HtmlButton($client->getId(), $client->getCaption());
		});
		$buttonsGroup->onClick("$('#reponse').html(this.value);");
		echo $this->jquery->compile();
	}

	public function clientsAction() {
		$clients=Client::find();
		$this->view->setRenderLevel(View::LEVEL_MAIN_LAYOUT);
		$this->view->setVars(array ("model" => "Clients","objects" => $clients ));
	}

	public function clientAction($idClient) {
		$client=Client::findFirst($idClient);
		echo $client->toString();
		$this->view->disable();
	}

	public function countryInfoAction() {
		$this->view->disable();
		$country=Countries::findFirst("countryCode='" . $_POST["id"] . "'");
		$list=$this->jquery->semantic()->htmlList("");
		$list->addHeader(3, "")->asImage("https://lipis.github.io/flag-icon-css/flags/4x3/" . strtolower($_POST["id"]) . ".svg", $country->getCountryName(), $country->getContinentName());
		$list->addItem("Population : " . number_format($country->getPopulation()))->addIcon("users");
		$list->addItem("Currency code : " . $country->getCurrencyCode())->addIcon("payment");
		$list->addItem("Capital : " . $country->getCapital())->addIcon("diamond");
		echo $list->setDivided();
	}

	public function testAction(){
		$paragraph=new HtmlImg("","http://semantic-ui.com/images/wireframe/short-paragraph.png");
		$semantic=$this->jquery->semantic();
		$paragraph->addToProperty("class","wireframe");
		$seg1=$semantic->htmlSegment("seg7");
		$seg1->addLabel("Overview")->asRibbon()->setColor("red");
		$seg1->addContent("Account Details");
		$seg1->addContent($paragraph);
		$seg1->addLabel("Overview")->asRibbon()->setColor("blue");
		$seg1->addContent("User reviews");
		$seg1->addContent($paragraph);


		$seg2=$semantic->htmlSegment("seg8");
		$seg2->addLabel("Specs")->asRibbon("right")->setColor("orange");
		$seg2->addContent($paragraph);
		$seg2->addLabel("Reviews")->asRibbon("right")->setColor("blue");
		$seg2->addContent($paragraph);

		$grid=$semantic->htmlGrid("",0,2);
		$grid->setValues([$seg1,$seg2]);
		echo $grid;
	}
}
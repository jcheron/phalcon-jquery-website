-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 12 Avril 2016 à 03:38
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `phalcon-jquery`
--
CREATE DATABASE IF NOT EXISTS `phalcon-jquery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phalcon-jquery`;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `part` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id`, `name`, `part`) VALUES
(1, 'John DOE', 10),
(2, 'Robert SMITH', 30),
(3, 'Jane Doe', 20);

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
`id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `idParent` int(11) DEFAULT NULL,
  `ordre` int(11) NOT NULL,
  `semantic` tinyint(1) DEFAULT NULL,
  `component` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`id`, `libelle`, `idParent`, `ordre`, `semantic`, `component`) VALUES
(1, 'jQuery', NULL, 0, 0, NULL),
(2, 'Bootstrap', NULL, 0, 0, NULL),
(3, 'HtmlButton', 2, 1, 0, NULL),
(4, 'HtmlButtonGroups', 2, 3, 0, NULL),
(5, 'jQueryUI', NULL, 0, 0, NULL),
(7, 'HtmlGlyphButton', 2, 2, 0, NULL),
(8, 'Ajax functions', 1, 1, 0, NULL),
(9, 'Get', 8, 1, 0, NULL),
(10, 'Post', 8, 2, 0, NULL),
(11, 'Events', 1, 2, 0, NULL),
(12, 'HtmlDropdown', 2, 4, 0, NULL),
(13, 'HtmlSplitButton', 2, 5, 0, NULL),
(14, 'HtmlCarousel', 2, 20, 0, NULL),
(15, 'HtmlInputGroup', 2, 6, 0, NULL),
(16, 'HtmlModal', 2, 7, 0, NULL),
(17, 'HtmlAlert', 2, 8, 0, NULL),
(18, 'HtmlProgressbar', 2, 9, 0, NULL),
(19, 'HtmlTabs', 2, 10, 0, NULL),
(20, 'HtmlListGroup', 2, 11, 0, NULL),
(21, 'HtmlPanel', 2, 12, 0, NULL),
(22, 'HtmlNavbar', 2, 11, 0, NULL),
(23, 'HtmlAccordion', 2, 14, 0, NULL),
(24, 'HtmlBreadcrumbs', 2, 15, 0, NULL),
(25, 'HtmlPagination', 2, 16, 0, NULL),
(26, 'PostForm', 8, 3, 0, NULL),
(27, 'DOM manipulation', 1, 4, 0, NULL),
(28, 'JSON', 8, 5, 0, NULL),
(29, 'HtmlGridSystem', 2, 20, 0, NULL),
(30, 'HtmlLabel', 2, 30, 0, NULL),
(31, 'Semantic-UI', NULL, 4, 1, NULL),
(32, 'Eléments', 31, 1, 1, 'HtmlDropdown'),
(33, 'Button', 32, 1, 1, NULL),
(34, 'Container', 32, 2, 1, NULL),
(35, 'Collections', 31, 2, 1, NULL),
(36, 'Breadcrumb', 35, 1, 1, NULL),
(37, 'Grid', 35, 2, 1, NULL),
(38, 'Message', 35, 5, NULL, NULL),
(39, 'Menu', 35, 4, NULL, NULL),
(40, 'Modules', 31, 4, 1, NULL),
(41, 'Dropdown', 40, 4, NULL, NULL),
(42, 'Divider', 32, 3, NULL, NULL),
(43, 'Header', 32, 5, NULL, NULL),
(44, 'Icon', 32, 6, NULL, NULL),
(45, 'Input', 32, 8, NULL, NULL),
(46, 'Label', 32, 9, NULL, NULL),
(47, 'List', 32, 10, NULL, NULL),
(48, 'Segment', 32, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `exemple`
--

CREATE TABLE IF NOT EXISTS `exemple` (
`id` int(11) NOT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `description` text,
  `header` text,
  `php` text NOT NULL,
  `idRubrique` int(11) NOT NULL,
  `execPHP` tinyint(1) NOT NULL,
  `ordre` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `exemple`
--

INSERT INTO `exemple` (`id`, `titre`, `description`, `header`, `php`, `idRubrique`, `execPHP`, `ordre`) VALUES
(1, 'Single button', NULL, NULL, '$button=new Ajax\\bootstrap\\html\\HtmlButton("btOkay","Okay");\necho $button;', 1, 1, 0),
(2, NULL, NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlButton;use Ajax\\bootstrap\\html\\base\\CssRef;$bt0=new HtmlButton("bt0","Slamwiki",CssRef::CSS_DANGER,$this->jquery->hide("#bt1"));$bt0->addBadge("Cours");$bt1=new HtmlButton("bt1");$bt1->setValue("Button default");$bt1->addBadge("21");echo $bt0->compile($this->jquery);echo $bt1->compile($this->jquery);echo $this->jquery->compile();', 1, 1, 0),
(3, NULL, NULL, NULL, '$bt=new Ajax\\bootstrap\\html\\HtmlGlyphButton("glButton1","glyphicon-equalizer","Equalizer");\necho $bt;', 6, 1, 0),
(4, NULL, '<p>It is also possible to create a Button glyph from the index of the glyph</p>\n', NULL, '$bt=new Ajax\\bootstrap\\html\\HtmlGlyphButton("glButton2",120,"Glyph numéro 120");\necho $bt;', 6, 1, 2),
(5, NULL, '<p>Overview of all usable glyphicons</p>\n', NULL, '$i=0;\nforeach(Ajax\\bootstrap\\html\\base\\CssRef::glyphIcons() as $glyph){\n	$bt=new Ajax\\bootstrap\\html\\HtmlGlyphButton("glybutton-".$i++,$glyph);\n	$bt->setTitle($glyph);\n	echo $bt;\n}', 6, 1, 3),
(6, 'get', '<p>Performs an Ajax request to the URL <strong>index/main</strong> and shows the HTML response in the area of identifier <strong>response</strong>&nbsp;(the url corresponds to the method <strong>mainAction </strong>of the controller <strong>IndexController</strong>):<br />\n{{warning: The target element <strong>#response</strong> should exist in the page before sending the query.}}</p>\n', NULL, 'public function getAction(){\n	$this->jquery->get("index/main","#response");\n	echo $this->jquery->compile();\n}', 5, 0, 1),
(7, 'Passing parameters', '<p>Same query as the previous but with passing parameters in JSON format : id=1 and page=5&nbsp;</p>\n\n<p>{{info:The parameters <strong>id </strong>and <strong>page </strong>are retrievable in the response by <strong>$_GET["id"]</strong> and <strong>$_GET["page"]</strong>}}</p>\n', NULL, 'public function getAction(){\n	$this->jquery->get("index/main","#response","{id:1,page:5}");\n	echo $this->jquery->compile();\n}', 5, 0, 2),
(8, 'Calling a callback script', '<p>The callBack script passed as a parameter will be executed after a successful ajax request; it can be expressed in php or directly in jQuery.</p>\n', NULL, 'public function getAction(){\n	$this->jquery->get("Test/reponse","#response",null,$this->jquery->show("#response"));\n	echo $this->jquery->compile();\n}\npublic function getAction(){\n	$this->jquery->get("Test/reponse","#response",null,"$(''#response'').show();");\n	echo $this->jquery->compile();\n}', 5, 0, 3),
(9, 'Creation', NULL, NULL, '	$buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups(''bg1'');\n	$buttonsGroup->addElements(array("Bouton1","Bouton2","Bouton3"));\n	echo $buttonsGroup;', 9, 1, 1),
(10, NULL, '<p>Adding an instance of HTML <strong>Button</strong></p>\n', NULL, '	$buttonsGroup->addElement(new Ajax\\bootstrap\\html\\HtmlButton("bt4","Bouton4","primary"));\n	echo $buttonsGroup;', 9, 1, 2),
(11, NULL, '<p>Adding an instance of&nbsp;<strong>HtmlGlyphButton</strong></p>\n', NULL, '	$buttonsGroup->addElement(new Ajax\\bootstrap\\html\\HtmlGlyphButton("bt5","star","Bouton5","warning"));\n	echo $buttonsGroup;', 9, 1, 3),
(12, 'Initialization using an array', '<p>Creation from a more complex array :</p>\n', NULL, '	$buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups(''bg2'');\n	$buttonsGroup->addElements(array(\n				array("value"=>"Bouton1","identifier"=>"bt-1","style"=>"primary"),\n				array("value"=>"Bouton2","identifier"=>"bt-2","style"=>"danger")\n	));\n	$buttonsGroup->getElement(1)->addBadge("Danger");\n	echo $buttonsGroup;', 9, 1, 4),
(13, 'Loading from a model', '<p>Loading from an object list : (<strong>Client</strong> model) :</p>\n\n<p>{{info: The method <strong>fromDatabaseObjects </strong>must take this parameters :</p>\n\n<ul>\n	<li>An array (objects)</li>\n	<li>a function which takes as a parameter an object instance and returns a new element to be inserted into the container HtmlButtonGroups</li>\n</ul>\n\n<p>}}</p>\n', NULL, '	$clients=Client::find();\n	 $buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups(''bg-clients'');\n	echo $buttonsGroup->fromDatabaseObjects($clients, function($client){\n		return new Ajax\\bootstrap\\html\\HtmlButton($client->getId(),$client->getName());\n	});', 9, 1, 4),
(14, 'Event association', NULL, NULL, '	$clients=Client::find();\n	$buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups(''bg-clients2'');\n	$buttonsGroup->fromDatabaseObjects($clients, function($client){\n		return new Ajax\\bootstrap\\html\\HtmlButton("bg-clients2-bt-".$client->getId(),$client->getName());\n	});\n	$buttonsGroup->onClick("$(''#reponse-clients'').html($(event.target).html());");\n	echo $buttonsGroup->compile($this->jquery);\n	echo "<div id=''reponse-clients''>Réponse</div>";', 9, 1, 5),
(15, 'Creation', NULL, NULL, '	$dropdown=$this->jquery->bootstrap()->htmlDropdown("dd1","Default",array("Elément 1","Elément 2"));\n	echo $dropdown->compile();', 11, 1, 1),
(16, 'Adding elements', '<p>Adding an item, addition of several elements, or an item with specific href :</p>\n', NULL, '	$dropdown->addItem("Elément 3");\n	$dropdown->addItems(array("Elément 4","Elément 5"));\n	$dropdown->addItem("Google","http://www.google.com");\n	echo $dropdown;', 11, 1, 2),
(17, 'Headers and dividers', NULL, NULL, '	$dropdown=$this->jquery->bootstrap()->htmlDropdown("dd2","Dropdowns");\n	$dropdown->addHeader("Partie 1");\n	$dropdown->addItems(array("Item1","Item2"));\n	$dropdown->addDivider();\n	$dropdown->addItems(array("Item3","Item4"));\n	echo $dropdown->compile();', 11, 1, 4),
(18, 'Button aspect', NULL, NULL, '	$dropdown->asButton("btn-info");\n	echo $dropdown;', 11, 1, 5),
(19, 'From an array', NULL, NULL, '	$dropdown=$this->jquery->bootstrap()->htmlDropdown("dd2","Dropdown from Array");\n	$dropdown->fromArray(array("items"=>array("Elément 1","Elément 2","-","Elément 3","-Séparateur","Elément 4")));\n	echo $dropdown;', 11, 1, 6),
(20, 'Loading from a model', NULL, NULL, '	$clients=Client::find();\n	$dropdown=$this->jquery->bootstrap()->htmlDropdown(''dd-clients'',''Clients'');\n	echo $dropdown->fromDatabaseObjects($clients, function($client){\n		return $client->getName();\n	});', 11, 1, 7),
(21, 'Event association', NULL, NULL, '	$clients=Client::find();\n	$dropdown=$this->jquery->bootstrap()->htmlDropdown(''dd-clients-2'',''Clients'');\n	$dropdown->fromDatabaseObjects($clients, function($client){\n		return $client->getName();\n	});	\n	$dropdown->onClick("$(''#reponse-clients'').html($(event.target).html());",false,true);\n	echo $dropdown->compile($this->jquery);\n	echo $this->jquery->bootstrap()->htmlAlert("reponse-clients","Aucun client cliqué...","alert-info");', 11, 1, 8),
(22, 'Creation', NULL, NULL, '	$splitBtn=$this->jquery->bootstrap()->htmlSplitbutton("sBtn","Split bouton",array("Item 1","Item 2"));\n	echo $splitBtn;', 12, 1, 1),
(23, 'Event association to the button', NULL, NULL, '	$splitBtn=$this->jquery->bootstrap()->htmlSplitbutton("sBtn-2","Split bouton",array("Item 1","Item 2"));\n	$splitBtn->onButtonClick("$(''#reponse-split'').html(''Clic sur le bouton'');");\n	echo $splitBtn->compile($this->jquery);\n	echo $this->jquery->bootstrap()->htmlAlert("reponse-split","Bouton non cliqué...","alert-info");', 12, 1, 2),
(24, 'Creation', NULL, NULL, '$carousel=$this->jquery->bootstrap()->htmlCarousel("carousel",array("client1.jpg","client2.jpg"));\n$carousel->setBase("public/img/client/");\necho $carousel;', 13, 1, 1),
(25, 'Adding Image', NULL, NULL, '$carousel=$this->jquery->bootstrap()->htmlCarousel("carousel-2",array("client1.jpg","client2.jpg"));\n$carousel->setBase("public/img/client/");\n$carousel->addImage(''client3.jpg'');\necho $carousel;', 13, 1, 2),
(26, 'Loading from a model', '<p>Loading from an object list : (<strong>Client</strong> model) :</p>\n\n<p>{{info: The method <strong>fromDatabaseObjects </strong>must take this parameters :</p>\n\n<ul>\n	<li>An array (objects)</li>\n	<li>a function which takes as a parameter an object instance and returns a new element to be inserted into the container HtmlCarousel</li>\n</ul>\n\n<p>}}</p>\n', NULL, '	$carousel=$this->jquery->bootstrap()->htmlCarousel("carousel-3");\n	$carousel->setBase("public/img/client/");\n	$clients=Client::find();\n	$carousel->fromDatabaseObjects($clients, function($client){\n		return array("client".$client->getId().".jpg","Client".$client->getId(),$client->getName());\n	});\n	echo $carousel->compile($this->jquery);', 13, 1, 4),
(27, 'Creation', '<p>Input with a span (positioned to the left by default)</p>\n', NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-1");\n		$inputGroup->createSpan("@");\n		echo $inputGroup;', 14, 1, 1),
(28, NULL, '<p>Positionned to the wright</p>\n', NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-2");\n		$inputGroup->createSpan("@example.com","right");\n		echo $inputGroup;', 14, 1, 2),
(29, 'Checkboxes and radio buttons', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-3");\n		$inputGroup->createCheckbox("ig-3-ck");\n		echo $inputGroup;', 14, 1, 3),
(30, NULL, NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-4");\n		$inputGroup->createRadio("ig-4-radio","Radio","right");\n		echo $inputGroup;', 14, 1, 4),
(31, 'Button', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-5");\n		$inputGroup->createButton("ig-4-radio","Go","right");\n		echo $inputGroup;', 14, 1, 5),
(32, 'SplitButton', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-7");\n		$bt=$inputGroup->createSplitButton("ig-7-split","Actions","right",array("Action","Another action","-","Last action"));\n		$bt->setStyle("btn-info");\n		echo $inputGroup;', 14, 1, 7),
(33, 'Buttons group', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-5");\n		$inputGroup->createButtons(array("Okay","Annuler"));\n		echo $inputGroup;', 14, 1, 5),
(34, 'Dropdown', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-6");\n		$bt=$inputGroup->createDropdown("ig-6-dd","Actions","right",array("Action","Another action","-","Last action"));\n		$bt->setStyle("btn-info");\n		echo $inputGroup;', 14, 1, 6),
(35, NULL, NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\nuse Ajax\\bootstrap\\html\\HtmlGlyphButton;\n		$inputGroup=new HtmlInputgroup("ig-5b");\n		$inputGroup->createButtons(array("Okay",new HtmlGlyphButton("glyph",120,"Ouvrir...")));\n		echo $inputGroup;', 14, 1, 5),
(36, 'Events association', '<p> On keystroke in the text field, the class css <strong> btn-success </ strong> is added / removed on the <strong> go </ strong> </p>', NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-8");\n		$inputGroup->createButton("ig-8-button","Go","right");\n		$inputGroup->onKeypress("$(''#ig-8-button'').toggleClass(''btn-success'');");\n		echo $inputGroup->compile($this->jquery);', 14, 1, 8),
(37, 'Resizing', NULL, NULL, '$sizes= Ajax\\bootstrap\\html\\base\\CssRef::sizes("input-group") ;\nfor($i=0;$i<3;$i++){\n	echo "Taille : <b>".$sizes[$i]."</b><br>";\n	$inputGroup->setSize($sizes[$i]);\n	echo $inputGroup;\n}', 14, 1, 8),
(38, 'Creation', NULL, NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite1","Titre de la boîte de dialogue","test");\necho $dialog->compile($this->jquery);', 15, 1, 1),
(39, 'Display', '<p>Displays the dialog box on click of a button </p>', NULL, '$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);', 15, 1, 2),
(40, 'Default buttons', '<p>Adding Buttons <strong> Okay </ strong> and <strong> Cancel </ strong> </p>', NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite2","Titre de la boîte de dialogue","test");\n$dialog->addOkayButton();\n$dialog->addCancelButton();\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-2","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);', 15, 1, 3),
(41, ' exit condition', '<p>To allow the exit of the box by the submit button, it is necessary to set the property<strong> valid <!-- strong--> of the dialog to <strong> true <!-- strong--> </strong></strong></p>\n\n<pre>\n<strong><strong><code class="language-php">$(''#boite5'').prop(''valid'',true);</code></strong></strong></pre>\n', NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite5","Titre de la boîte de dialogue","test");\n$dialog->addOkayButton("Enregistrer","$(''#info-2'').html(''clic sur le bouton Valider'');");\n$dialog->addCancelButton("Fermer");\n$btDialog=$this->jquery->bootstrap()->htmlButton("bt-dialog-5","Valide","btn-success","$(''#boite5'').prop(''valid'',true);");\n$btDialog->setToggled();\n$dialog->setContent($btDialog);\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-5","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("info-2");', 15, 1, 5),
(42, 'Customize Buttons', NULL, NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite4","Titre de la boîte de dialogue","test");\n$dialog->addOkayButton("Enregistrer","$(''#info'').html(''clic sur le bouton Valider'');");\n$dialog->addCancelButton("Fermer");\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-4","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("info");', 15, 1, 4),
(43, 'Customize condition', NULL, NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite6","Titre de la boîte de dialogue","test");\n$dialog->setValidCondition("$(''#valid'').is('':checked'')");\n$dialog->addOkayButton("Enregistrer","$(''#info-3'').html(''clic sur le bouton Valider'');");\n$dialog->addCancelButton("Fermer");\n$dialog->setContent("<label><input type=''checkbox'' name=''valid'' id=''valid''> valeur de valid</label>");\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-6","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("info-3");', 15, 1, 6),
(44, 'Calling an action on a controller', '<p>Controller <b>test</b> :<br />&nbsp;</p><pre><code class="language-php">	public function clientsAction(){		$clients=Client::find();		$this-&gt;view-&gt;setRenderLevel(View::LEVEL_MAIN_LAYOUT);		$this-&gt;view-&gt;setVars(array(" model=""&gt;"Clients","objects"=&gt;$clients));	}</code></pre>', NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite7","Liste des clients");\n$dialog->addOkayButton();\n$dialog->addCancelButton();\n$dialog->forward($this,"test","clients");\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-7","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);', 15, 1, 7),
(45, 'Calling a view and passing parameters', NULL, NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite8","Liste des clients");\n$dialog->addOkayButton();\n$dialog->addCancelButton();\n$clients=Client::find();\n$dialog->renderContent($this->view,"test","clients",array("model"=>"Clients","objects"=>$clients));\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-8","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);', 15, 1, 8),
(47, 'Creation', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlAlert("alert1","Alert de type <b>Warning</b> par défaut");', 16, 1, 1),
(48, 'Classes', NULL, NULL, '$bootstrap=$this->jquery->bootstrap();\necho $bootstrap->htmlAlert("alert2-1","<b>Well done!</b> You successfully read this important alert message.","alert-success");\necho $bootstrap->htmlAlert("alert2-2","<b>Heads up!</b> This alert needs your attention, but it''s not super important.","alert-info");\necho $bootstrap->htmlAlert("alert2-2","<b>Warning!</b> Better check yourself, you''re not looking too good.","alert-warning");\necho $bootstrap->htmlAlert("alert2-2","<b>Oh snap!</b> Change a few things up and try submitting again.","alert-danger");', 16, 1, 2),
(49, 'Closeable alert', NULL, NULL, '$alert=$this->jquery->bootstrap()->htmlAlert("alert3","Dismissable Alert");\n$alert->setStyle("danger");\n$alert->setCloseable(true);\necho $alert;\n', 16, 1, 3),
(50, 'External closing', '<div id="msg-close">...</div>\n', NULL, '$alert=$this->jquery->bootstrap()->htmlAlert("alert4","Alert refermable sur click");\n$this->jquery->click("#alert4",$alert->close());\necho $alert;', 16, 1, 4),
(51, 'Events', NULL, NULL, '$alert=$this->jquery->bootstrap()->htmlAlert("alert5","Alert refermable,<br>Affiche une autre alert après fermeture");\n$alert->setCloseable(true);\n$alert->onClose($this->jquery->show("#alert5-2"));\necho $alert->compile($this->jquery);\n$alert2=$this->jquery->bootstrap()->htmlAlert("alert5-2","Alert refermée","alert-info");\n$alert2->setProperty("style","display:none;");\necho $alert2;\n', 16, 1, 5),
(52, 'Creation', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlProgressbar("pb1");', 17, 1, 1),
(53, 'Intitial value', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlProgressbar("pb2","info",50);', 17, 1, 2),
(55, 'With label', NULL, NULL, '$pb= $this->jquery->bootstrap()->htmlProgressbar("pb3","info",50);\necho $pb->showcaption(true);', 17, 1, 3),
(56, 'Styles', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlProgressbar("pb4-1","info",50);\necho $this->jquery->bootstrap()->htmlProgressbar("pb4-2","success",60);\necho $this->jquery->bootstrap()->htmlProgressbar("pb4-3","warning",70);\necho $this->jquery->bootstrap()->htmlProgressbar("pb4-4","danger",80);\n', 17, 1, 4),
(58, 'Striped', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlProgressbar("pb5","info",50)->setStriped(true);\n', 17, 1, 5),
(59, 'Animation', NULL, NULL, '$pb=$this->jquery->bootstrap()->htmlProgressbar("pb6","info",50);\necho $pb->setStriped(true)->setActive(true);\n', 17, 1, 6),
(60, 'Progressbar stacked', NULL, NULL, '$pb=$this->jquery->bootstrap()->htmlProgressbar("pb7");\n$pb->stack($this->jquery->bootstrap()->htmlProgressbar("pb7-1","success",20)->setStriped(true));\n$pb->stack($this->jquery->bootstrap()->htmlProgressbar("pb7-2","warning",10));\n$pb->stack($this->jquery->bootstrap()->htmlProgressbar("pb7-3","danger",10));\n$pb->showCaption(true);\necho $pb;\n', 17, 1, 7),
(61, 'Loading from a model', NULL, NULL, '$values=array(array("style"=>"success","value"=>10),array("style"=>"warning","value"=>20),array("style"=>"danger","value"=>3));\n$pb=$this->jquery->bootstrap()->htmlProgressbar("pb8")->showCaption(true);\n$pb->fromDatabaseObjects($values, function($v){\n		return $this->jquery->bootstrap()->htmlProgressbar("pb8-",$v["style"],$v["value"]);\n	});\necho $pb;', 17, 1, 8),
(62, 'Creation', NULL, NULL, '$tabs=$this->jquery->bootstrap()->htmlTabs("tab-1");\n$tabs->addTabs(array("Tab 1","Tab 2","Tab 3"));\necho $tabs;', 18, 1, 1),
(64, 'Active Tab', NULL, NULL, '$tabs->setActive(1);\necho $tabs;', 18, 1, 2),
(65, 'Disable tab', NULL, NULL, '$tabs->disable(2);\necho $tabs;', 18, 1, 3),
(66, 'Adding dropdowns', NULL, NULL, '$dd=$this->jquery->bootstrap()->htmlDropdown("dd","Dropdown",array("item 1","item 2"));\n$tabs->addTab($dd);\necho $tabs;', 18, 1, 4),
(67, 'Creation', NULL, NULL, '$listGroup=$this->jquery->bootstrap()->htmlListgroup("lg",array("Cras justo odio","Dapibus ac facilisis in","Morbi leo risus","Porta ac consectetur ac","Vestibulum at eros"));\necho $listGroup;', 19, 1, 1),
(68, 'Creation', NULL, NULL, '$panel=$this->jquery->bootstrap()->htmlPanel("panel-1","Contenu");\necho $panel;', 20, 1, 1),
(69, 'Directly in the controller (without view)', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\CssRef;\n$button=$this->jquery->bootstrap()->htmlButton("btAfficher","Afficher message",CssRef::CSS_PRIMARY);\n$alert=$this->jquery->bootstrap()->htmlAlert("alert1","<b>Cliquer</b> sur le bouton...");\n$button->onClick($alert->jsHtml("Click sur bouton"));\necho $button->compile($this->jquery);\necho $alert;', 21, 1, 1),
(70, 'In the controller...associated to a view', '<h3>View :</h3><pre><code class="language-php">{{ q["btAfficher"] }}{{ q["alert1"] }}{{ script_foot }}</code></pre>', NULL, 'use Ajax\\bootstrap\\html\\base\\CssRef;\n$button=$this->jquery->bootstrap()->htmlButton("btAfficher","Afficher message",CssRef::CSS_PRIMARY);\n$alert=$this->jquery->bootstrap()->htmlAlert("alert1","<b>Cliquer</b> sur le bouton...");\n$button->onClick($alert->jsHtml("Click sur bouton"));\n$this->jquery->compile($this->view);', 21, 0, 3),
(71, 'With header', NULL, NULL, '$panel=$this->jquery->bootstrap()->htmlPanel("panel-2","Contenu","Header"); \necho $panel;', 20, 1, 2),
(73, 'And footer', NULL, NULL, '$panel=$this->jquery->bootstrap()->htmlPanel("panel-3","Contenu","Header","Footer"); \necho $panel;', 20, 1, 3),
(74, 'Styles', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\CssRef;\n$panel=$this->jquery->bootstrap()->htmlPanel("panel-4","Contenu","Header");\n$panel->setStyle(CssRef::CSS_INFO);\n echo $panel;\n$panel->setStyle(CssRef::CSS_WARNING);\n echo $panel;\n$panel->setStyle(CssRef::CSS_DANGER);\n echo $panel;', 20, 1, 4),
(75, 'Badges and labels', NULL, NULL, '$listGroup->getItem(0)->addBadge("22");\n$listGroup->getItem(1)->addLabel("New","info")->addBadge("0");\necho $listGroup;', 19, 1, 2),
(76, 'Active, disable', NULL, NULL, '$listGroup->getItem(2)->setActive();\n$listGroup->getItem(4)->setDisabled();\necho $listGroup;', 19, 1, 4),
(77, 'Links', '<p>If the tagName of the main container doesn''t exist <strong>ul</strong>, the added items are links.</p>', NULL, '$listGroup=$this->jquery->bootstrap()->htmlListgroup("lg-2",array("Cras justo odio","Dapibus ac facilisis in","Morbi leo risus","Porta ac consectetur ac","Vestibulum at eros"),"div");\necho $listGroup;', 19, 1, 5),
(78, 'Styles', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\CssRef;\n$listGroup->getItem(0)->setStyle(CssRef::CSS_SUCCESS);\n$listGroup->getItem(1)->setStyle(CssRef::CSS_WARNING);\n$listGroup->getItem(2)->setStyle(CssRef::CSS_INFO);\necho $listGroup;', 19, 1, 6),
(79, 'Custom Content', NULL, NULL, '$listGroup->getItem(3)->setHeadingAndContent("List group item heading","Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.",4);\necho $listGroup;', 19, 1, 6),
(80, 'Loading from a model', NULL, NULL, '$clients=Client::find();\n$listGroup=$this->jquery->bootstrap()->htmlListgroup(''lg-clients'');\necho $listGroup->fromDatabaseObjects($clients, function($client){\n		return $client->getName();\n	});', 19, 1, 7),
(81, 'More complex loading', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\HtmlBsDoubleElement;$clients=Client::find();$listGroup=$this->jquery->bootstrap()->htmlListgroup(''lg-clients'');echo $listGroup->fromDatabaseObjects($clients, function($client){	$element=new HtmlBsDoubleElement("list-gi-".$client->getId(),"li");	$element->setContent($client->getName());		$element->addBadge($client->getPart());	return $element;	});', 19, 1, 8),
(82, 'Pills', NULL, NULL, '$tabs->setTabstype("pills");\necho $tabs;', 18, 1, 5),
(83, 'Stacked', NULL, NULL, '$tabs->setStacked(true);\necho $tabs;', 18, 1, 8),
(84, 'Creation', NULL, NULL, '$navbar=$this->jquery->bootstrap()->htmlNavbar("nb-1","Accueil");\necho $navbar;', 22, 1, 1),
(85, 'Adding items', NULL, NULL, '$navbar->addElements(array("Lien 1","Lien 2"));\necho $navbar;', 22, 1, 2),
(86, 'Brand image', NULL, NULL, '$navbar=$this->jquery->bootstrap()->htmlNavbar("nb-2");\n$navbar->setBrandImage("img/miniPhalcon.png");\necho $navbar;', 22, 1, 3),
(87, 'Zones forms', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInput;\nuse Ajax\\bootstrap\\html\\HtmlButton;\n$zForm=$navbar->addZone("form");\n$input=new HtmlInput("txtSearch");\n$input->setPlaceHolder("mots clefs");\n$zForm->addElement($input);\n$zForm->addElement(new HtmlButton("btSearch","Rechercher"));\necho $navbar;', 22, 1, 5),
(89, 'Dropdowns', NULL, NULL, 'use \\Ajax\\bootstrap\\html\\HtmlDropdown;\n$navbar->addElement(new HtmlDropdown("dd-1","Dropdown",array("Action","Another action")));\necho $navbar;', 22, 1, 4),
(90, 'Adding right', NULL, NULL, '$navbar->addZone("right")->addElement("A propos...");\necho $navbar;', 22, 1, 6),
(91, 'Adding from an array', NULL, NULL, '$navbar->addElements(array("Dropdown"=>array("Action","Another action","SomeThing else here","-","Separated link")));\necho $navbar;\n', 22, 1, 7),
(92, 'Navbar inverse', NULL, NULL, '$navbar->cssInverse();\necho $navbar;', 22, 1, 8),
(93, 'Creation', NULL, NULL, '$accordion=$this->jquery->bootstrap()->htmlAccordion("accordion1");\n$accordion->addPanel("Panel 1","Contenu du panel 1");\n$accordion->addPanel("Panel 2","Contenu du panel 2");\necho $accordion;', 23, 1, 1),
(94, 'Calling a view and passing parameters', NULL, NULL, '$clients=Client::find();\n$accordion=$this->jquery->bootstrap()->htmlAccordion("accordion2");\n$accordion->renderContentPanel("Clients",$this->view,"test","clients",array("model"=>"Clients","objects"=>$clients));\necho $accordion;', 23, 1, 5),
(95, 'Calling an action on a controller', NULL, NULL, '$accordion=$this->jquery->bootstrap()->htmlAccordion("accordion3"); \n$accordion->forwardPanel("Clients",$this,"test","clients");\n echo $accordion;', 23, 1, 4),
(97, 'Get on event', '<ul id="getOn">\n	<li id="1">Client 1</li>\n	<li id="2">Client 2</li>\n</ul>\n\n<div class="alert alert-info" id="alert-reponse">Hover an item in the list to show the customer</div>\n\n<p>Below the code of the <strong>client</strong> action called on <strong>mouseenter</strong> event. The overflown element <strong>id</strong> is send to the request and corresponds to <strong>$idClient</strong> :</p>\n\n<pre class="language-php">\n<code>\n	public function clientAction($idClient){\n		$client=Client::findFirst($idClient);\n		echo $client-&gt;toString();\n		$this-&gt;view-&gt;disable();\n	}\n</code></pre>\n', NULL, '$this->jquery->getOn("mouseenter","#getOn li","Test/client","#alert-reponse",array("hasLoader"=>false));', 5, 1, 5),
(98, 'Get on event with the passage of another HTML attribute', '<p>The default attribute passed to the query is <strong> id </strong>, it is possible to send another: either an existing HTML attribute or a custom attribute (<strong> data-id </strong>) as in the following: </p><p>Html source code :</p><ul id="getOnData">	<li data-id="1" id="cli-1">Client 1</li>	<li data-id="2" id="cli-2">Client 2</li></ul><pre class="language-html"><code>&lt;ul id="getOnData"&gt;&lt;li id="cli-1" data-id="1"&gt;Client 1&lt;/li&gt;&lt;li id="cli-2" data-id="2"&gt;Client 2&lt;/li&gt;&lt;/ul&gt;</code></pre><div class="alert alert-info" id="alert-reponse-2">Mouse over an item in the list to display the customer</div><p>Below is the code of the action <strong> customer </strong> solicited on <strong> mouseEnter </strong>. The <strong> id </ strong> of the element is send by default as a request parameter and corresponds to <strong> $idClient</strong></p><pre class="language-php"><code>	public function clientAction($idClient){		$client=Client::findFirst($idClient);		echo $client-&gt;toString();		$this-&gt;view-&gt;disable();	}</code></pre>', NULL, '$this->jquery->getOn("mouseenter","#getOnData li","Test/client","#alert-reponse-2",array("attr"=>"data-id","hasLoader"=>false));', 5, 1, 6),
(99, 'Get on click', NULL, NULL, '$this->jquery->getOnClick("#getOnClick li","Test/client","#alert-reponse-3");', 5, 0, 6),
(100, 'Creation', '<p>...</p>\n', NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc1",array("Home","Library"));\necho $bc;\n', 25, 1, 1),
(101, 'Synchronization from the Phalcon dispatcher', '<p>In this case we have to dynamically modify the content of Breadcrumbs component from the new url displayed via ajax. You can do this in the controller afterDispatchingRoute method, by calling the methods:</p><ul>	<li><strong>fromDispatcher </strong> which built the elements of breadcrumbs component from the requested url</li>	<li>and <strong> jsSetContent </strong> that displays javascript component content</li></ul><pre><code class="language-php">public function afterExecuteRoute($dispatcher){		$bc=$this-&gt;jquery-&gt;bootstrap()-&gt;htmlBreadcrumbs("bc10");		$bc-&gt;fromDispatcher($dispatcher);		$bc-&gt;addGlyph("glyphicon-home",0);		$bc-&gt;jsSetContent($this-&gt;jquery);		$bc-&gt;autoGetOnClick("#ajax-content");		$this-&gt;jquery-&gt;compile($this-&gt;view);	}</code></pre>', NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc10",array("Accueil","Clients","1"));\n$bc->autoGetOnClick("#ajax-content");\n$bc->getElement(0)->wrapContentWithGlyph("glyphicon-home");\necho $bc->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("ajax-content");', 25, 1, 10),
(102, 'Adding elements', NULL, NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc2");\n$bc->addElement("Accueil");\necho $bc;', 25, 1, 2),
(103, 'Adding links', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlLink;\n$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc3");\n$bc->addElement(new HtmlLink("id-accueil","index","Accueil"));\n$bc->addElement(new HtmlLink("id-clients","Test/clients","Clients"));\necho $bc;', 25, 1, 3),
(104, 'Adding from arrays', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlLink;\n$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc4");\n$bc->addElements(array(array("identifier"=>"item1","href"=>"index","content"=>"Accueil"),array("identifier"=>"item2","href"=>"Test/clients","content"=>"Clients")));\necho $bc;', 25, 1, 4),
(105, 'Last link activation + glyphicon', NULL, NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc5"); \n$bc->setAutoActive(false);\n$bc->addElement("Accueil","Accueil/index","glyphicon-home");\n$bc->addElement("index","Accueil/Clients"); \necho $bc;\n', 25, 1, 5),
(106, 'Glyphicons', NULL, NULL, '$bc->addGlyph("glyphicon-star",1);\necho $bc;', 25, 1, 6),
(107, 'Association of Javascript code', '<p>The method <strong>autoGetOnClick</strong> displays in the target element <strong>#div-centent-7</strong> the result of the ajax request corresponding to the attribut&nbsp;<strong>data-ajax</strong> of each element.<br />\n<br />\nThe <strong>data-ajax</strong> attribute correspond to the url associated to each element in ajax.<br />\n<br />\n<strong>data-ajax</strong> is automaticaly assigned by default hierarchically constructing the path to an element using its caption :</p>\n\n<ul>\n	<li>Home =&gt; Home</li>\n	<li>Clients =&gt; Home/Clients</li>\n</ul>\n\n<p>It is possible to use another HTML attribute <strong> data-ajax </strong> to store the URLs associated with the elements: &amp; nbsp; use in this case &amp; nbsp; <strong> setattr($otherAttribute)</strong></p>\n\n<p>It is also possible to change the function that generates the url for each item used in ajax with <strong> setHrefFunction($function) </strong>.</p>\n\n<p>The default function uses the labels of items &amp; nbsp;</p>\n\n<pre>\n<code class="language-php">function($element){return $element-&gt;getContent();}</code></pre>\n', NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc7",array("Home","Clients")); \n$bc->autoGetOnClick("#div-content-7");\necho $bc->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("div-content-7");', 25, 1, 7),
(108, 'Creation', NULL, NULL, '$page=$this->jquery->bootstrap()->htmlPagination("page-1",1,5,2);\necho $page;', 26, 1, 1),
(109, 'Association of javascript code', NULL, NULL, '$page=$this->jquery->bootstrap()->htmlPagination("page-7",1,3);\n$page->setUrlMask("pagination/client/%page%");\n$page->autoGetOnClick("#div-content-7");\necho $page->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("div-content-7");', 26, 1, 7),
(110, 'Synchronization from the Phalcon dispatcher', '<p>In this case we have to dynamically modify the content of Pagination component from the new url displayed via ajax. You can do this in the controller afterDispatchingRoute method, by calling the methods:</p><ul>	<li><strong>fromDispatcher </strong> which built the elements of breadcrumbs component from the requested url</li>	<li>and <strong> jsSetContent </strong> that displays javascript component content</li></ul><pre><code class="language-php">	public function afterExecuteRoute($dispatcher){		$bc=$this-&gt;jquery-&gt;bootstrap()-&gt;htmlPagination("page-10",1,3,NULL,2);		$bc-&gt;fromDispatcher($dispatcher);		$bc-&gt;jsSetContent($this-&gt;jquery);		$bc-&gt;autoGetOnClick("#div-content-10");		$this-&gt;jquery-&gt;compile($this-&gt;view);	}</code></pre>', NULL, '$page=$this->jquery->bootstrap()->htmlPagination("page-10",1,3,NULL,2);\n$page->setUrlMask("pagination/client/%page%");\n$page->autoGetOnClick("#div-content-10");\necho $page->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("div-content-10");', 26, 1, 10),
(111, 'Sizes', NULL, NULL, '$page=$this->jquery->bootstrap()->htmlPagination("page-4",1,5,2);\n$page->setSize("lg");\necho $page;\n$page->setSize("xs");\necho $page;\n$page->setSize("sm");\necho $page;', 26, 1, 4),
(112, 'Styles', NULL, NULL, '$bt=$this->jquery->bootstrap()->htmlButton("bt-2","Default");\necho $bt;\n$bt->setContent("Primary");\n$bt->setStyle("primary");\necho $bt;\n$bt->setContent("Info");\n$bt->setStyle("info");\necho $bt;\n$bt->setContent("Warning");\n$bt->setStyle("warning");\necho $bt;\n$bt->setContent("Danger");\n$bt->setStyle("danger");\necho $bt;', 1, 1, 2),
(113, 'blur', '<p>The blur event is sent to an element when it loses focus</p>\n\n<p><input class="form-control" id="input-1" type="text" /></p>\n\n<div class="alert alert-info" id="message-1">&nbsp;</div>\n', NULL, '$this->jquery->blur("#input-1","$(''#message-1'').html(''blur'');");', 28, 1, 1),
(115, 'change', '<p>The change event is sent to an element when its value changes. This event is limited to input elements, textarea boxes and select elements.</p>\n\n<p><input class="form-control" id="input-2" type="text" /></p>\n\n<div class="alert alert-info" id="message-2">&nbsp;</div>\n', NULL, '$this->jquery->change("#input-2","$(''#message-2'').html(''change'');");', 28, 1, 2),
(116, 'click', '<p>The click event is sent to an element when the mouse pointer is over the element, and the mouse button is pressed and released</p>\n\n<p id="p">Paragraph to click...</p>\n\n<div class="alert alert-info" id="message-3">&nbsp;</div>\n', NULL, '$this->jquery->click("#p","$(''#message-3'').append(''click '');");', 28, 1, 3),
(117, 'contextmenu', '<p>The contextmenu event is sent to an element when the right button of the mouse is clicked on it, but before the context menu is displayed.</p>\n\n<p id="p4">click Right on this paragraph...</p>\n\n<div class="alert alert-info" id="message-4">&nbsp;</div>\n', NULL, '$this->jquery->contextmenu("#p4","$(''#message-4'').append(''contextmenu '');");', 28, 1, 4),
(118, 'addClass', '<p id="p">Adds the specified class(es) to each element in the set of matched elements.</p>\n\n<p>In the call of addClass method, the third parameter (true) enables the immediate execution of the code.</p>\n', NULL, '$this->jquery->addClass("#p","alert alert-warning",true);', 29, 1, 1),
(119, 'append', '<p>Insert content, specified by the parameter, after each of the corresponding elements in the selector</p>\n\n<p><a class="btn btn-default" id="bt-append">Insert</a></p>\n\n<ul id="identite">\n	<li id="1">&nbsp;Firstname :&nbsp;</li>\n	<li id="2">&nbsp;Lastname :&nbsp;</li>\n</ul>\n', NULL, '$this->jquery->click("#bt-append",$this->jquery->append("#identite li","<input type=''text'' class=''form-control''>"));', 29, 1, 2),
(120, 'append', '<p>Add content within the specified elements.</p>\n', NULL, '$this->jquery->append("#to","<br>");', 29, 0, 3),
(121, 'attr', '<p>The .attr() method sets the value of attributes</p>\n\n<p><input class="form-control" id="input" /></p>\n', NULL, '$this->jquery->attr("#input","value","Essai",true);', 29, 1, 4),
(122, 'json', '<div class="alert alert-info" id="ex1">\n<p><label id="id">id</label></p>\n\n<p><label id="name">name</label></p>\n</div>\n', NULL, '$this->jquery->json("json/json/1","get","{}",null,"id","$(''#ex1'')",true);', 30, 1, 1),
(123, 'jsonOn with a callback', '<p>The <strong>callback </strong>function is used here to change the bootstrap progressbar.</p>\n\n<p><a class="btn btn-primary btAjax" data-ajax="1">Client 1</a> <a class="btn btn-primary btAjax" data-ajax="2">Client 2</a> <a class="btn btn-primary btAjax" data-ajax="3">Client 3</a></p>\n\n<div class="alert alert-info" id="ex3"><input class="form-control" id="name" type="text" value="" />\n<div class="progress">\n<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="[[part]]" class="progress-bar progress-bar-striped active" id="pb2" role="progressbar" style="width: 1%">1%</div>\n</div>\n</div>\n', NULL, '$this->jquery->jsonOn("click",".btAjax","json/json",array("attr"=>"data-ajax","context"=>"$(''#ex3'')","jsCallback"=>"$(''#pb2'').css(''width'', data[''part'']+''%'').attr(''aria-valuenow'', data[''part'']).html(data[''part'']+''%'');"));', 30, 1, 3),
(124, 'jsonArray', '<p><a class="btn btn-primary" id="btJsonArray">Charger les clients</a> <a class="btn btn-primary" id="btShowMask">Afficher le masque</a></p>\n<script>$(''#btShowMask'').click(function() {$(''#repeat'').toggleClass(''hide'');});</script>\n\n<div class="alert alert-info" id="ex3">\n<div class="hide" id="repeat">\n<div class="row">\n<div class="col-xs-6 col-md-3"><a class="thumbnail" href="#"><img src="public/img/client/client[[id]].jpg" /> </a></div>\n\n<div class="col-xs-6 col-md-9"><input class="form-control" data-id="name" readonly="true" type="text" value="" />\n<div class="progress">\n<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="[[part]]" class="progress-bar progress-bar-striped active" role="progressbar" style="width: [[part]]%">[[part]]%</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n', NULL, '$this->jquery->jsonArrayOn("click","#btJsonArray","#repeat", "json/jsonArray", array());', 30, 1, 4),
(125, 'jsonOn', '<p><a class="btn btn-primary btAjax2" data-ajax="1">Client 1</a> <a class="btn btn-primary btAjax2" data-ajax="2">Client 2</a></p>\n\n<div class="alert alert-info" id="ex2"><input class="form-control" id="name" type="text" value="" /></div>\n', NULL, '$this->jquery->jsonOn("click",".btAjax2","json/json",array("attr"=>"data-ajax","context"=>"$(''#ex2'')"));', 30, 1, 2),
(126, 'Creation', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlPanel;\n$gs=$this->jquery->bootstrap()->htmlGridSystem("gs-2");\n$gs->getCell(1,1)->setContent(new HtmlPanel("p1","1,1"));\n$gs->getCell(2,2)->setContent(new HtmlPanel("p2","2,2"))->setWidthForAll(6);\n$gs->getCell(1,3)->setContent(new HtmlPanel("p3","1,3"))->setWidthForAll(2);\n\necho $gs;', 31, 1, 2),
(127, 'Creation', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlPanel;\n$gs=$this->jquery->bootstrap()->htmlGridSystem("gs-1",6,12);\n$gs->setContentForAll("gs");\n$gs->getCell(3,6)->setContent("milieu");\n$gs->getRow(3)->merge("md",6,5);\n$gs->getRow(5)->merge("md",1,11);\n\necho $gs;', 31, 1, 1),
(128, 'Adding a label to an element', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\HtmlBsDoubleElement;$p=new HtmlBsDoubleElement("p");$p->setContent("this is a paragraph with a label");$p->addLabel("new");echo $p;', 32, 1, 0),
(129, 'Création', '<div class="ui labeled button" tabindex="0">\n  <div class="ui red button">\n    <i class="heart icon"></i> Like\n  </div>\n  <a class="ui basic red left pointing label">\n    1,048\n  </a>\n</div>\n<div class="ui labeled button" tabindex="0">\n  <div class="ui basic blue button">\n    <i class="fork icon"></i> Forks\n  </div>\n  <a class="ui basic left pointing blue label">\n    1,048\n  </a>\n</div>', NULL, '$mess=new \\Ajax\\semantic\\html\\collections\\HtmlMessage("mess1","<p>We just updated our privacy policy here to better service our customers. We recommend reviewing the changes.</p>");\n		$mess->addHeader("Changes in Service");\n		$mess->addList(array("You can now have cover images on blog pages","Drafts will now auto-save while writing"),false);\necho $mess;', 38, 1, 1),
(130, 'Icône', NULL, 'Header', '$mess=new Ajax\\semantic\\html\\collections\\HtmlMessage("mess2","<p>We just updated our privacy policy here to better service our customers. We recommend reviewing the changes.</p>");\n		$mess->addHeader("Changes in Service");\n		$mess->setIcon("inbox");\necho $mess;', 38, 1, 2),
(131, 'Creation', 'A standard breadcrumb', NULL, 'use Ajax\\semantic\\html\\collections\\HtmlBreadcrumb;\r\n$bc=new HtmlBreadcrumb("bc1",array("Home","Store","T-shirt"));\r\necho $bc;', 34, 1, 1),
(132, 'Divider', '<p>A breadcrumb can contain a divider to show the relationship between sections, this can be formatted as an icon or text.</p>\n', NULL, 'use Ajax\\semantic\\html\\collections\\HtmlBreadcrumb;\n$bc=new HtmlBreadcrumb("bc2",array("Home","Store","T-shirt"));\n$bc->setContentDivider(">");\necho $bc;', 36, 1, 2),
(133, 'Icon divider', NULL, NULL, 'use Ajax\\semantic\\html\\collections\\HtmlBreadcrumb;\n\n$bc=new HtmlBreadcrumb("bc3",array("Home","Store","T-shirt"));\n$bc->setIconContentDivider("right angle");\necho $bc;', 36, 1, 3),
(135, 'Various dividers', NULL, NULL, 'use Ajax\\semantic\\html\\collections\\HtmlBreadcrumb;\n\n$bc=new HtmlBreadcrumb("bc3",array("Home","Store","T-shirt"));\n$bc->setIconContentDivider("right caret",1);\necho $bc;', 36, 1, 4),
(136, 'Directly in the controller (without view)', NULL, NULL, '$semantic=$this->jquery->semantic();\n$button=$semantic->htmlButton("btAfficher","Afficher message")->setColor("red");\n$message=$semantic->htmlMessage("message1","<b>Cliquer</b> sur le bouton...");\n$button->onClick($message->jsHtml("Click sur bouton"));\necho $button->compile($this->jquery);\necho $message;', 37, 1, 1),
(138, 'Text', '<p>A breadcrumb can contain sections that can either be formatted as a link or text</p>\n', NULL, '$bc=$this->jquery->semantic()->htmlBreadcrumb("bc4",array("Home","Store","T-shirt"));\n$bc->asTexts();\necho $bc;\n', 36, 1, 4),
(139, 'Individuals elements', '<p>A section may be linkable or contain a link</p>\n', NULL, '$bc=$this->jquery->semantic()->htmlBreadcrumb("bc5",array("Home")); \n$bc->addItem("Search for: <a href=''#''>paper towels</a>");\necho $bc;\n', 36, 1, 5),
(140, 'Creation', '<p>A standard button</p>\n', NULL, '$bt=$this->jquery->semantic()->htmlButton("bt1","Follow");\necho $bt;', 39, 1, 1),
(141, 'jQuery', '<p>A button can interract with jQuery</p>\n', NULL, '$bt=$semantic->htmlButton("bt2","Follow");\n$bt->onClick("$(this).toggleText(''Following'',''Follow'')");\necho $bt->compile($this->jquery);', 39, 1, 2),
(142, 'Types', '<p>{{warning:Although any tag can be used for a button, it will only be keyboard focusable if you use a&lt;button&gt;tag or you add the property tabindex="0". Keyboard accessible buttons will preserve focus styles after click, which may be visually jarring.}}</p>\n', NULL, '$bt3=$semantic->htmlButton("bt3","Button");\n$bt4=$semantic->htmlButton("bt4","Focusable")->setFocusable();\necho $bt3.$bt4;', 39, 1, 3),
(143, 'Emphasis', '<p>A button can be formatted to show different levels of emphasis<br />\n{{info:Setting your brand colors to primary and secondary color variables in site.variables will allow you to use your color theming for UI elements}}</p>\n', NULL, 'use Ajax\\semantic\\html\\base\\constants\\Emphasis;\n$bt5=$semantic->htmlButton("bt5","Save")->setEmphasis(Emphasis::PRIMARY);\n$bt6=$semantic->htmlButton("bt6","Discard");\necho $bt5.$bt6;', 39, 1, 3),
(144, 'Animated', '<p>A button can animate to show hidden content {{info:The button will be automatically sized according to the visible content size. Make sure there is enough room for the hidden content to show}}</p>\n', NULL, 'use Ajax\\semantic\\html\\elements\\HtmlIcon;\n$bt1=$semantic->htmlButton("bt7","Sign-up for a Pro account");\n$bt1->setAnimated("$12.99 a month");\n$bt2=$semantic->htmlButton("bt8","Next");\n$bt2->setAnimated(new HtmlIcon("","right arrow"),"fade right");\necho $bt1.$bt2;\n', 39, 1, 5),
(145, 'Labeled', '<p>A button can appear alongside a label</p>\n', NULL, '$bt=$semantic->htmlButton("bt9"," Like");\n$bt->addIcon("heart");\n$bt->addLabel("2,048")->setPointing("left");\necho $bt;', 39, 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE IF NOT EXISTS `rubrique` (
`id` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text,
  `idDomaine` int(11) NOT NULL,
  `ordre` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rubrique`
--

INSERT INTO `rubrique` (`id`, `titre`, `description`, `idDomaine`, `ordre`) VALUES
(1, 'HtmlButton', '<p>Represents a <strong>Bootstrap</strong> button.</p>\n', 3, 0),
(2, 'Configuration', '<p>Set the namespace <strong>Ajax</strong> in the file <strong>loader.php</strong></p>\r\n\r\n<pre>\r\n<code class="language-php">\r\n$loader-&gt;\r\nregisterNamespaces(array(\r\n        ''Ajax'' =&gt; __DIR__ . ''/../../app/vendor/jcheron/phalcon-jquery/Ajax/''\r\n));</code></pre>\r\n', 1, 1),
(3, 'Prerequisite', '<h2>Injection of the service</h2><p>It is necessary to inject the JQuery service at application startup, and instantiate Bootstrap :</p>\r\n<pre><code class="language-php">$di-&gt;set("jquery",function(){\r\n    $jquery= new JsUtils(array("driver"=&gt;"Jquery"));\r\n    $jquery-&gt;bootstrap(new Bootstrap());//for Twitter Bootstrap\r\n    return $jquery;});\r\n</code></pre>', 2, 0),
(4, 'Service injection', '<p>Inject the service <strong>jquery</strong> via the <strong>$di</strong> object :</p>\n\n<pre>\n<code class="language-php">\n$di-&gt;set("jquery",function(){\n    $jquery= new Ajax\\JsUtils(array("driver"=&gt;"Jquery"));\n    return $jquery;\n});</code></pre>\n', 1, 2),
(5, 'Ajax get', '<p>Allows immediate ajax request (<strong>get</strong>), delayed or dependent (<strong>getDeferred</strong>) or launched from an event (<strong>getOn</strong>).</p>\n', 9, 0),
(6, 'HtmlGlyphButton', '<p>Bootstrap button associated with a Glyphicon</p>\n', 7, 0),
(7, 'Ajax post', '<p>Allows immediate ajax request (<strong>post</strong>), delayed or dependent (<strong>postDeferred</strong>) or launched from an event (<strong>postOn</strong>).</p>\n', 10, 0),
(8, 'Use', '<p>Example of use in a controller: ajax query on the click of a button.</p>\n\n<pre>\n<code class="language-php">\nclass ClientController extends ControllerBase {\n\n	public function indexAction(){\n		$this-&gt;jquery-&gt;getOnClick("#btShow", "client/all","#divClients");\n		$this-&gt;view-&gt;setRenderLevel(View::LEVEL_MAIN_LAYOUT);\n		$this-&gt;jquery-&gt;compile($this-&gt;view);\n	}\n}\n</code></pre>\n', 1, 3),
(9, 'HtmlButtonGroups', '<p>Creates a button group</p>\n', 4, 0),
(10, 'Prerequisite', '<h2>1.1- Injection of the service</h2>\n\n<p>It is necessary to inject the <strong>JQuery</strong> service at application startup, and instantiate <b>jQueryUI</b> :</p>\n\n<pre>\n<code class="language-php">\n$di-&gt;set("jquery",function(){\n    $jquery= new JsUtils(array("driver"=&gt;"Jquery"));\n     $jquery-&gt;ui(new Ajax\\JqueryUI());//optional for JQuery UI\n    return $jquery;\n});\n</code></pre>\n', 5, 0),
(11, 'Button Dropdowns', '<p>Corresponds to the Bootstrap <strong>button Dropdowns</strong></p>\n', 12, 0),
(12, 'HtmlSplitButton', '<p>Corresponds to the Bootstrap&nbsp;<strong>Split button dropdowns </strong>: The HtmlSplitButton inherits from <a class="menu" href="#" id="link-tab-12">HtmlDropdown</a> features.</p>\n', 13, 0),
(13, 'HtmlCarousel', '<p>Corresponds to the <strong>Carousel</strong> Bootstrap component : allows scrolling images</p>\n', 14, 0),
(14, 'HtmlInputGroup', NULL, 15, 0),
(15, 'HtmlModal', '<p>Represents a Bootstrap dialog box: Component <strong>Modal</strong></p>\n', 16, 0),
(16, 'HtmlAlert', '<p>Corresponds to the Bootstrap <strong>Alert </strong>component</p>\n', 17, 0),
(17, 'HtmlProgressbar', '<p>Corresponds to the Bootstrap <strong>ProgressBar </strong>component</p>\n', 18, 0),
(18, 'HtmlTabs', '<p>Corresponds to the Bootstrap <strong>Tabs </strong>component</p>\n', 19, 0),
(19, 'HtmlListGroup', '<p>Corresponds to the Bootstrap <strong>ListGroup </strong>component</p>\n', 20, 0),
(20, 'HtmlPanel', '<p>Corresponds to the Bootstrap <strong>Panel </strong>component</p>\n', 21, 0),
(21, 'Implementation', NULL, 2, 0),
(22, 'HtmlNavbar', '<p>Corresponds to the Bootstrap <strong>Navbar</strong> component</p>\n', 22, 1),
(23, 'HtmlAccordion', '<p>Corresponds to the Bootstrap <strong>Accordion</strong> component</p>\n', 23, 1),
(25, 'HtmlBreadcrumbs', '<p>Corresponds to the Bootstrap <strong>Breadcrumbs</strong> component</p>\n', 24, 1),
(26, 'HtmlPagination', '<p>Corresponds to the Bootstrap <strong>Pagination </strong> component</p>\n\n<p>see&nbsp;<a href="http://getbootstrap.com/components/#pagination">http://getbootstrap.com/components/#pagination</a></p>\n', 25, 1),
(27, 'Ajax postForm', '<p>Allows immediate submit of a form with ajax (<strong>postForm</strong>), delayed or dependent (<strong>postFormDeferred</strong>) or launched from an event (<strong>postFormOn</strong>).</p>\n', 26, 1),
(28, 'Javascript events', NULL, 11, 1),
(29, 'DOM manipulation', '<p>Functions for manipulating the DOM with jQuery</p>\n', 27, 1),
(30, 'Ajax JSON', '<p>Ajax functions for populate a view from JSON data</p>\n', 28, 1),
(31, 'HtmlGridSystem', '<p>Allows to implement the Bootstrap <strong>Grid system</strong></p>\n', 29, 1),
(32, 'HtmlLabel', NULL, 30, 1),
(33, 'Prerequisite', '<h2>Injection of the service</h2>\n\n<p>It is necessary to inject the JQuery service at application startup, and instantiate Semantic :</p>\n\n<pre>\n<code class="language-php">$di-&gt;set("jquery",function(){\n    $jquery= new JsUtils(array("driver"=&gt;"Jquery"));\n    $jquery-&gt;semantic(new Semantic());//for Semantic UI\n    return $jquery;});\n</code></pre>\n', 31, 1),
(34, 'Breadcrumb', 'A breadcrumb is used to show hierarchy between content', 36, 1),
(36, 'Content', NULL, 36, 2),
(37, 'Implementation', NULL, 31, 2),
(38, 'HtmlMessage', '<p>A message displays information that explains nearby content</p>\n', 38, 1),
(39, 'HtmlButton', '<p>A button indicates a possible user action</p>\n', 33, 1);

-- --------------------------------------------------------

--
-- Structure de la table `translation`
--

CREATE TABLE IF NOT EXISTS `translation` (
`id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `idElement` int(11) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `translation`
--

INSERT INTO `translation` (`id`, `name`, `idElement`, `lang`, `text`) VALUES
(1, 'domaine.libelle', 1, 'fr', 'jQuery'),
(2, 'domaine.libelle', 2, 'fr', 'Bootstrap'),
(3, 'domaine.libelle', 3, 'fr', 'HtmlButton'),
(4, 'domaine.libelle', 4, 'fr', 'HtmlButtonGroups'),
(5, 'domaine.libelle', 5, 'fr', 'jQueryUI'),
(6, 'domaine.libelle', 7, 'fr', 'HtmlGlyphButton'),
(7, 'domaine.libelle', 8, 'fr', 'Fonctions Ajax'),
(8, 'domaine.libelle', 9, 'fr', 'Get'),
(9, 'domaine.libelle', 10, 'fr', 'Post'),
(10, 'domaine.libelle', 11, 'fr', 'Evènements'),
(11, 'domaine.libelle', 12, 'fr', 'HtmlDropdown'),
(12, 'domaine.libelle', 13, 'fr', 'HtmlSplitButton'),
(13, 'domaine.libelle', 14, 'fr', 'HtmlCarousel'),
(14, 'domaine.libelle', 15, 'fr', 'HtmlInputGroup'),
(15, 'domaine.libelle', 16, 'fr', 'HtmlModal'),
(16, 'domaine.libelle', 17, 'fr', 'HtmlAlert'),
(17, 'domaine.libelle', 18, 'fr', 'HtmlProgressbar'),
(18, 'domaine.libelle', 19, 'fr', 'HtmlTabs'),
(19, 'domaine.libelle', 20, 'fr', 'HtmlListGroup'),
(20, 'domaine.libelle', 21, 'fr', 'HtmlPanel'),
(21, 'domaine.libelle', 22, 'fr', 'HtmlNavbar'),
(22, 'domaine.libelle', 23, 'fr', 'HtmlAccordion'),
(23, 'domaine.libelle', 24, 'fr', 'HtmlBreadcrumbs'),
(24, 'domaine.libelle', 25, 'fr', 'HtmlPagination'),
(25, 'domaine.libelle', 26, 'fr', 'PostForm'),
(26, 'domaine.libelle', 27, 'fr', 'Manipulation du DOM'),
(27, 'domaine.libelle', 28, 'fr', 'JSON'),
(28, 'domaine.libelle', 29, 'fr', 'HtmlGridSystem'),
(39, 'rubrique.titre', 1, 'fr', 'HtmlButton'),
(40, 'rubrique.titre', 2, 'fr', 'Configuration'),
(41, 'rubrique.titre', 3, 'fr', 'Pré-requis'),
(42, 'rubrique.titre', 4, 'fr', 'Injection du service'),
(43, 'rubrique.titre', 5, 'fr', 'Ajax get'),
(44, 'rubrique.titre', 6, 'fr', 'HtmlGlyphButton'),
(45, 'rubrique.titre', 7, 'fr', 'Ajax post'),
(46, 'rubrique.titre', 8, 'fr', 'Utilisation'),
(47, 'rubrique.titre', 9, 'fr', 'HtmlButtonGroups'),
(48, 'rubrique.titre', 10, 'fr', 'Pré-requis'),
(49, 'rubrique.titre', 11, 'fr', 'Button Dropdowns'),
(50, 'rubrique.titre', 12, 'fr', 'HtmlSplitButton'),
(51, 'rubrique.titre', 13, 'fr', 'HtmlCarousel'),
(52, 'rubrique.titre', 14, 'fr', 'HtmlInputGroup'),
(53, 'rubrique.titre', 15, 'fr', 'HtmlModal'),
(54, 'rubrique.titre', 16, 'fr', 'HtmlAlert'),
(55, 'rubrique.titre', 17, 'fr', 'HtmlProgressbar'),
(56, 'rubrique.titre', 18, 'fr', 'HtmlTabs'),
(57, 'rubrique.titre', 19, 'fr', 'HtmlListGroup'),
(58, 'rubrique.titre', 20, 'fr', 'HtmlPanel'),
(59, 'rubrique.titre', 21, 'fr', 'Mise en oeuvre'),
(60, 'rubrique.titre', 22, 'fr', 'HtmlNavbar'),
(61, 'rubrique.titre', 23, 'fr', 'HtmlAccordion'),
(62, 'rubrique.titre', 25, 'fr', 'HtmlBreadcrumbs'),
(63, 'rubrique.titre', 26, 'fr', 'HtmlPagination'),
(64, 'rubrique.titre', 27, 'fr', 'Ajax postForm'),
(65, 'rubrique.titre', 28, 'fr', 'Evènements javascript'),
(66, 'rubrique.titre', 29, 'fr', 'Manipulation du DOM'),
(67, 'rubrique.titre', 30, 'fr', 'Ajax JSON'),
(68, 'rubrique.titre', 31, 'fr', 'HtmlGridSystem'),
(70, 'rubrique.description', 1, 'fr', '<p>Repr&eacute;sente un bouton <strong>Bootstrap</strong>.</p>\n'),
(71, 'rubrique.description', 2, 'fr', '<p>D&eacute;finir l&#39;espace de nom <strong>Ajax</strong> dans le fichier <strong>loader.php</strong></p>\r\n\r\n<pre>\r\n<code class="language-php">\r\n$loader-&gt;registerNamespaces(array(\r\n        &#39;Ajax&#39; =&gt; __DIR__ . &#39;/../../app/vendor/jcheron/phalcon-jquery/Ajax/&#39;\r\n));</code></pre>\r\n'),
(72, 'rubrique.description', 3, 'fr', '<h2>Injection du service</h2>\n\n<p>Il est nécessaire d''injecter le service JQuery au démarrage de l''application, et d''instancier Bootstrap :</p>\n\n<pre>\n<code class="language-php">\n$di-&gt;set("jquery",function(){\n    $jquery= new JsUtils(array("driver"=&gt;"Jquery"));\n    $jquery-&gt;bootstrap(new Bootstrap());//for Twitter Bootstrap\n    return $jquery;\n});\n</code></pre>\n'),
(73, 'rubrique.description', 4, 'fr', '<p>Injecter le service <strong>jquery</strong> via l&#39;objet <strong>$di</strong> :</p>\n\n<pre>\n<code class="language-php">\n$di-&gt;set(&quot;jquery&quot;,function(){\n    $jquery= new Ajax\\JsUtils(array(&quot;driver&quot;=&gt;&quot;Jquery&quot;));\n    return $jquery;\n});</code></pre>\n'),
(74, 'rubrique.description', 5, 'fr', '<p>Permet d&#39;effectuer une requ&ecirc;te ajax imm&eacute;diate (<strong>get</strong>), diff&eacute;r&eacute;e ou d&eacute;pendante (<strong>getDeferred</strong>) ou lanc&eacute;e depuis un &eacute;v&egrave;nement (<strong>getOn</strong>).</p>\n'),
(75, 'rubrique.description', 6, 'fr', '<p>Bouton bootstrap associ&eacute; &agrave; un Glyphicon</p>\n'),
(76, 'rubrique.description', 7, 'fr', '<p>Permet d&#39;effectuer une requ&ecirc;te ajax imm&eacute;diate (<strong>post</strong>), diff&eacute;r&eacute;e ou d&eacute;pendante (<strong>postDeferred</strong>) ou lanc&eacute;e depuis un &eacute;v&egrave;nement (<strong>postOn</strong>).</p>\n'),
(77, 'rubrique.description', 8, 'fr', '<p>Exemple d''utilisation dans un contrôleur :&nbsp;requête ajax sur le click d''un bouton.</p>\n\n<pre>\n<code class="language-php">\nclass ClientController extends ControllerBase {\n\n	public function indexAction(){\n		$this-&gt;jquery-&gt;getOnClick("#btShow", "client/all","#divClients");\n		$this-&gt;view-&gt;setRenderLevel(View::LEVEL_MAIN_LAYOUT);\n		$this-&gt;jquery-&gt;compile($this-&gt;view);\n	}\n}\n</code></pre>\n'),
(78, 'rubrique.description', 9, 'fr', '<p>Permet de créer un groupe de boutons</p>\n'),
(79, 'rubrique.description', 10, 'fr', '<h2>1.1- Injection du service</h2>\n\n<p>Il est nécessaire d''injecter le service JQuery au démarrage de l''application, et d''instancier <b>jQueryUI</b> :</p>\n\n<pre>\n<code class="language-php">\n$di-&gt;set("jquery",function(){\n    $jquery= new JsUtils(array("driver"=&gt;"Jquery"));\n     $jquery-&gt;ui(new Ajax\\JqueryUI());//optional for JQuery UI\n    return $jquery;\n});\n</code></pre>\n'),
(80, 'rubrique.description', 11, 'fr', '<p>Correspond au bouton <strong>Dropdowns</strong> Bootstrap</p>\n'),
(81, 'rubrique.description', 12, 'fr', '<p>Correspond au&nbsp;<strong>Split button dropdowns </strong>: le HtmlSplitButton hérite des fonctionnalités du <a class="menu" href="#" id="link-tab-12">HtmlDropdown</a>.</p>\n'),
(82, 'rubrique.description', 13, 'fr', '<p>Carousel Bootstrap : permet de faire défiler des images</p>\n'),
(83, 'rubrique.description', 15, 'fr', '<p>Représente une boîte de dialogue Bootstrap : composant <strong>Modal</strong></p>\n'),
(84, 'rubrique.description', 16, 'fr', '<p>Correspond au composant Bootstrap <strong>Alert</strong></p>\n'),
(85, 'rubrique.description', 17, 'fr', '<p><span style="font-family: ''Segoe UI'', Frutiger, ''Frutiger Linotype'', ''Dejavu Sans'', ''Helvetica Neue'', Arial, sans-serif; font-size: 14px; line-height: 20px;">Correspond au composant Bootstrap&nbsp;</span><strong style="box-sizing: border-box; font-family: ''Segoe UI'', Frutiger, ''Frutiger Linotype'', ''Dejavu Sans'', ''Helvetica Neue'', Arial, sans-serif; font-size: 14px; line-height: 20px;">Progressbar</strong></p>\n'),
(86, 'rubrique.description', 18, 'fr', '<p>Correspond au composant bootstrap <strong>Tabs</strong></p>\n'),
(87, 'rubrique.description', 19, 'fr', '<p>Correspond au composant Bootstrap <strong>ListGroup</strong></p>\n'),
(88, 'rubrique.description', 20, 'fr', '<p>Correspond au composant Bootstrap <strong>Panel</strong></p>\n'),
(89, 'rubrique.description', 22, 'fr', '<p>Correspond au composant Bootstrap <strong>Navbar</strong></p>\n'),
(90, 'rubrique.description', 23, 'fr', '<p>Correspond au composant Bootstrap <strong>Accordion</strong></p>\n'),
(91, 'rubrique.description', 25, 'fr', '<p>Correspond au composant bootstrap <strong>Breadcrumbs</strong></p>\n'),
(92, 'rubrique.description', 26, 'fr', '<p>Correspond au composant Bootstrap <strong>Pagination </strong></p>\n\n<p>voir&nbsp;<a href="http://getbootstrap.com/components/#pagination">http://getbootstrap.com/components/#pagination</a></p>\n'),
(93, 'rubrique.description', 27, 'fr', '<p>Permet d''effectuer l''envoi immédiat d''un formulaire via ajax (<strong>postForm</strong>), ou de manière différée ou dépendante (<strong>postFormDeferred</strong>) ou lancée depuis un évènement (<strong>postFormOn</strong>).</p>\n'),
(94, 'rubrique.description', 29, 'fr', '<p>Fonctions permettant de manipuler le DOM avec jQuery</p>\n'),
(95, 'rubrique.description', 30, 'fr', '<p>Fonctions Ajax permettant d''alimenter une vue à partir de données JSON</p>\n'),
(96, 'rubrique.description', 31, 'fr', '<p>Permet de mettre en oeuvre le <strong>Grid system bootstrap</strong>.</p>\n'),
(101, 'exemple.titre', 1, 'fr', 'Bouton simple'),
(102, 'exemple.titre', 6, 'fr', 'get'),
(103, 'exemple.titre', 7, 'fr', 'Passage de paramètres'),
(104, 'exemple.titre', 8, 'fr', 'Appel d''un script callBack'),
(105, 'exemple.titre', 9, 'fr', 'Création'),
(106, 'exemple.titre', 12, 'fr', 'Initialisation à partir d''un array'),
(107, 'exemple.titre', 13, 'fr', 'Chargement depuis un modèle'),
(108, 'exemple.titre', 14, 'fr', 'Association d’événement'),
(109, 'exemple.titre', 15, 'fr', 'Création'),
(110, 'exemple.titre', 16, 'fr', 'Ajout d''éléments'),
(111, 'exemple.titre', 17, 'fr', 'En-têtes et diviseurs'),
(112, 'exemple.titre', 18, 'fr', 'Aspect bouton'),
(113, 'exemple.titre', 19, 'fr', 'A partir d''un array'),
(114, 'exemple.titre', 20, 'fr', 'Chargement depuis un modèle'),
(115, 'exemple.titre', 21, 'fr', 'Association d''événement'),
(116, 'exemple.titre', 22, 'fr', 'Création'),
(117, 'exemple.titre', 23, 'fr', 'Association d''événement au bouton'),
(118, 'exemple.titre', 24, 'fr', 'Création'),
(119, 'exemple.titre', 25, 'fr', 'Ajout d''image'),
(120, 'exemple.titre', 26, 'fr', 'Chargement depuis un modèle'),
(121, 'exemple.titre', 27, 'fr', 'Création'),
(122, 'exemple.titre', 29, 'fr', 'Cases à cocher et boutons radio'),
(123, 'exemple.titre', 31, 'fr', 'Bouton'),
(124, 'exemple.titre', 32, 'fr', 'SplitButton'),
(125, 'exemple.titre', 33, 'fr', 'Groupes de boutons'),
(126, 'exemple.titre', 34, 'fr', 'Dropdown'),
(127, 'exemple.titre', 36, 'fr', 'Association d''évènements'),
(128, 'exemple.titre', 37, 'fr', 'Changement de taille'),
(129, 'exemple.titre', 38, 'fr', 'Création'),
(130, 'exemple.titre', 39, 'fr', 'Affichage'),
(131, 'exemple.titre', 40, 'fr', 'Boutons par défaut'),
(132, 'exemple.titre', 41, 'fr', 'Condition de sortie'),
(133, 'exemple.titre', 42, 'fr', 'Personnalisation des boutons'),
(134, 'exemple.titre', 43, 'fr', 'Personnalisation de la condition'),
(135, 'exemple.titre', 44, 'fr', 'Appel d''une action sur un contrôleur'),
(136, 'exemple.titre', 45, 'fr', 'Appel d''une vue et passage de paramètres'),
(137, 'exemple.titre', 47, 'fr', 'Création'),
(138, 'exemple.titre', 48, 'fr', 'Classes'),
(139, 'exemple.titre', 49, 'fr', 'Alert refermable'),
(140, 'exemple.titre', 50, 'fr', 'Fermeture externe'),
(141, 'exemple.titre', 51, 'fr', 'Evènements'),
(142, 'exemple.titre', 52, 'fr', 'Création'),
(143, 'exemple.titre', 53, 'fr', 'Valeur intitiale'),
(144, 'exemple.titre', 55, 'fr', 'Avec label'),
(145, 'exemple.titre', 56, 'fr', 'Styles'),
(146, 'exemple.titre', 58, 'fr', 'Striped'),
(147, 'exemple.titre', 59, 'fr', 'Animation'),
(148, 'exemple.titre', 60, 'fr', 'Progressbars empilées'),
(149, 'exemple.titre', 61, 'fr', 'Chargement depuis un modèle'),
(150, 'exemple.titre', 62, 'fr', 'Création'),
(151, 'exemple.titre', 64, 'fr', 'Active Tab'),
(152, 'exemple.titre', 65, 'fr', 'Disable tab'),
(153, 'exemple.titre', 66, 'fr', 'Ajout de dropdowns'),
(154, 'exemple.titre', 67, 'fr', 'Création'),
(155, 'exemple.titre', 68, 'fr', 'Création'),
(156, 'exemple.titre', 69, 'fr', 'Directement dans le contrôleur (sans vue)'),
(157, 'exemple.titre', 70, 'fr', 'Dans le contrôleur...associé à une vue'),
(158, 'exemple.titre', 71, 'fr', 'Avec header'),
(159, 'exemple.titre', 73, 'fr', 'Et footer'),
(160, 'exemple.titre', 74, 'fr', 'Styles'),
(161, 'exemple.titre', 75, 'fr', 'Badges et labels'),
(162, 'exemple.titre', 76, 'fr', 'Active, disable'),
(163, 'exemple.titre', 77, 'fr', 'Liens'),
(164, 'exemple.titre', 78, 'fr', 'Styles'),
(165, 'exemple.titre', 79, 'fr', 'Contenu personnalisé'),
(166, 'exemple.titre', 80, 'fr', 'Chargement depuis un modèle'),
(167, 'exemple.titre', 81, 'fr', 'Chargement plus complexe'),
(168, 'exemple.titre', 82, 'fr', 'Pills'),
(169, 'exemple.titre', 83, 'fr', 'Empilés'),
(170, 'exemple.titre', 84, 'fr', 'Création'),
(171, 'exemple.titre', 85, 'fr', 'Ajout d''items'),
(172, 'exemple.titre', 86, 'fr', 'Brand image'),
(173, 'exemple.titre', 87, 'fr', 'Zones de formulaires'),
(174, 'exemple.titre', 89, 'fr', 'Dropdowns'),
(175, 'exemple.titre', 90, 'fr', 'Ajout à droite'),
(176, 'exemple.titre', 91, 'fr', 'Ajout à partir d''un tableau'),
(177, 'exemple.titre', 92, 'fr', 'Navbar inverse'),
(178, 'exemple.titre', 93, 'fr', 'Création'),
(179, 'exemple.titre', 94, 'fr', 'Appel d''une vue et passage de paramètres'),
(180, 'exemple.titre', 95, 'fr', 'Appel d''une action sur un contrôleur'),
(181, 'exemple.titre', 97, 'fr', 'Get sur évènement'),
(182, 'exemple.titre', 98, 'fr', 'Get sur évènement avec passage d''un autre attribut Html'),
(183, 'exemple.titre', 99, 'fr', 'Get sur click'),
(184, 'exemple.titre', 100, 'fr', 'Création'),
(185, 'exemple.titre', 101, 'fr', 'Synchronisation à partir du dispatcher phalcon'),
(186, 'exemple.titre', 102, 'fr', 'Ajout d''éléments'),
(187, 'exemple.titre', 103, 'fr', 'Ajout de liens'),
(188, 'exemple.titre', 104, 'fr', 'Ajout à partir de tableaux'),
(189, 'exemple.titre', 105, 'fr', 'Activation du dernier lien + glyphicon'),
(190, 'exemple.titre', 106, 'fr', 'Glyphicons'),
(191, 'exemple.titre', 107, 'fr', 'Association de code Javascript'),
(192, 'exemple.titre', 108, 'fr', 'Création'),
(193, 'exemple.titre', 109, 'fr', 'Association de code javascript'),
(194, 'exemple.titre', 110, 'fr', 'Synchronisation à partir du dispatcher Phalcon'),
(195, 'exemple.titre', 111, 'fr', 'Tailles'),
(196, 'exemple.titre', 112, 'fr', 'Styles'),
(197, 'exemple.titre', 113, 'fr', 'blur'),
(198, 'exemple.titre', 115, 'fr', 'change'),
(199, 'exemple.titre', 116, 'fr', 'click'),
(200, 'exemple.titre', 117, 'fr', 'contextmenu'),
(201, 'exemple.titre', 118, 'fr', 'addClass'),
(202, 'exemple.titre', 119, 'fr', 'append'),
(203, 'exemple.titre', 120, 'fr', 'append'),
(204, 'exemple.titre', 121, 'fr', 'attr'),
(205, 'exemple.titre', 122, 'fr', 'json'),
(206, 'exemple.titre', 123, 'fr', 'jsonOn avec callback'),
(207, 'exemple.titre', 124, 'fr', 'jsonArray'),
(208, 'exemple.titre', 125, 'fr', 'jsonOn'),
(209, 'exemple.titre', 126, 'fr', 'Création'),
(210, 'exemple.titre', 127, 'fr', 'Création'),
(228, 'exemple.description', 4, 'fr', 'Il est également possible de créer un glyphButton à partir de l''index du glyph'),
(229, 'exemple.description', 5, 'fr', 'Aperçu de l''ensemble des glyphicons utilisables'),
(230, 'exemple.description', 6, 'fr', '<p>Effectue une requ&ecirc;te Ajax vers l&#39;url <strong>index/main</strong> et affiche la r&eacute;ponse dans&nbsp;la zone HTML d&#39;identifiant <strong>response</strong>&nbsp;(l&#39;url correspond &agrave; la m&eacute;thode <strong>mainAction </strong>du contr&ocirc;leur <strong>IndexController</strong>):<br />\n{{warning: l&#39;&eacute;l&eacute;ment HTML cible <strong>#response</strong> doit exister dans la page avant l&#39;envoi de la requ&ecirc;te.}}</p>\n'),
(231, 'exemple.description', 7, 'fr', '<p>M&ecirc;me requ&ecirc;te que la pr&eacute;c&eacute;dente mais avec passage des param&egrave;tres au format JSON : id=1 et page=5&nbsp;</p>\n\n<p>{{info:Les param&egrave;tres <strong>id </strong>et <strong>page </strong>sont r&eacute;cup&eacute;rables dans la r&eacute;ponse par <strong>$_GET[&quot;id&quot;]</strong> et <strong>$_GET[&quot;page&quot;]</strong>}}</p>\n'),
(232, 'exemple.description', 8, 'fr', '<p>Le script de callBack pass&eacute;&nbsp;en param&egrave;tre sera ex&eacute;cut&eacute; apr&egrave;s le succ&egrave;s de la requ&ecirc;te ajax ; il peut &ecirc;tre exprim&eacute; en php ou directement en jQuery.</p>\n'),
(233, 'exemple.description', 10, 'fr', '<p>Ajout d''une instance de <strong>HtmlButton</strong></p>\n'),
(234, 'exemple.description', 11, 'fr', '<p>Ajout d''une instance de&nbsp;<strong>HtmlGlyphButton</strong></p>\n'),
(235, 'exemple.description', 12, 'fr', '<p>Création à partir d''un array plus complexe :</p>\n'),
(236, 'exemple.description', 13, 'fr', '<p>Chargement depuis une liste d''objets (modèle <strong>Client</strong>) :</p>{{info: La méthode <strong>fromDatabaseObjects </strong>doit prendre en paramètres :<ul>	<li>Un tableau (objets)</li>	<li>une fonction prenant en paramètre une instance d''objet et retournant un nouvel élément à insérer dans le conteneur HtmlButtonGroups</li></ul>}}'),
(237, 'exemple.description', 16, 'fr', '<p>Ajout d''un élément, de plusieurs, d''un élément avec href spécifique :</p>\n'),
(238, 'exemple.description', 26, 'fr', '<p>Chargement depuis une liste d''objets (modèle&nbsp;<strong>Client</strong>) :</p>\n\n<p>{{info: La méthode&nbsp;<strong>fromDatabaseObjects&nbsp;</strong>doit prendre en paramètres :</p>\n\n<ul>\n	<li>Un tableau (objets)</li>\n	<li>une fonction prenant en paramètre une instance d''objet et retournant un nouvel élément à insérer dans le conteneur HtmlCarousel</li>\n</ul>\n\n<p>}}</p>\n'),
(239, 'exemple.description', 27, 'fr', '<p>Input avec span (positionné à gauche par défaut)</p>\n'),
(240, 'exemple.description', 28, 'fr', '<p>Positionné à droite</p>\n'),
(241, 'exemple.description', 36, 'fr', '<p>Sur frappe d''une touche dans la zone de texte, la classe <strong>btn-success</strong> et ajoutée/enlevée sur le bouton <strong>go</strong></p>\n'),
(242, 'exemple.description', 39, 'fr', '<p>Affichage de la boîte de dialogue sur click d''un bouton</p>\n'),
(243, 'exemple.description', 40, 'fr', '<p>Ajout de boutons <strong>Okay </strong>et <strong>Annuler</strong></p>\n'),
(244, 'exemple.description', 41, 'fr', '<p>Pour permettre la sortie de la boîte par le bouton valider, il est nécessaire de mettre la propriété <strong>valid </strong>du dialog à <strong>true </strong>:</p>\n\n<pre>\n<code class="language-php">$(''#boite5'').prop(''valid'',true);</code></pre>\n'),
(245, 'exemple.description', 44, 'fr', '<p>Contrôleur <b>test</b> :<br />\n&nbsp;</p>\n\n<pre>\n<code class="language-php">\n	public function clientsAction(){\n		$clients=Client::find();\n		$this-&gt;view-&gt;setRenderLevel(View::LEVEL_MAIN_LAYOUT);\n		$this-&gt;view-&gt;setVars(array(" model=""&gt;"Clients","objects"=&gt;$clients));\n	}\n</code></pre>\n'),
(246, 'exemple.description', 50, 'fr', '<div id="msg-close">...</div>\n'),
(247, 'exemple.description', 70, 'fr', '<h3>Vue :</h3>\n\n<pre>\n<code class="language-php">\n{{ q["btAfficher"] }}\n{{ q["alert1"] }}\n{{ script_foot }}\n</code>\n</pre>\n'),
(248, 'exemple.description', 77, 'fr', '<p>Si le tagName du conteneur principal n''est pas <strong>ul</strong>, les items ajoutés sont des liens.</p>\n'),
(249, 'exemple.description', 97, 'fr', '<ul id="getOn">\n	<li id="1">Client 1</li>\n	<li id="2">Client 2</li>\n</ul>\n\n<div class="alert alert-info" id="alert-reponse">Survolez un élément de la liste pour afficher le client</div>\n\n<p>Ci-dessous le code de l''action <strong>client </strong>sollicitée sur <strong>mouseenter</strong>. L''<strong>id</strong> de l''élément survolé est passé par défaut en paramètre de la requête et correspond à <strong>$idClient</strong> :</p>\n\n<pre class="language-php">\n<code>\n	public function clientAction($idClient){\n		$client=Client::findFirst($idClient);\n		echo $client-&gt;toString();\n		$this-&gt;view-&gt;disable();\n	}\n</code></pre>\n'),
(250, 'exemple.description', 98, 'fr', '<p>L''attribut passé par défaut à la requête est <strong>id</strong>, il est possible d''en passer un autre : soit un attribut html existant, soit un attribut personnalisé (<strong>data-id</strong>) comme dans le cas ci-dessous :</p>\n\n<p>Code Html source :</p>\n\n<ul id="getOnData">\n	<li data-id="1" id="cli-1">Client 1</li>\n	<li data-id="2" id="cli-2">Client 2</li>\n</ul>\n\n<pre class="language-html">\n<code>\n&lt;ul id="getOnData"&gt;\n&lt;li id="cli-1" data-id="1"&gt;Client 1&lt;/li&gt;\n&lt;li id="cli-2" data-id="2"&gt;Client 2&lt;/li&gt;\n&lt;/ul&gt;\n</code></pre>\n\n<div class="alert alert-info" id="alert-reponse-2">Survolez un élément de la liste pour afficher le client</div>\n\n<p>Ci-dessous le code de l''action <strong>client </strong>sollicitée sur <strong>mouseEnter</strong>. L''<strong>id</strong> de l''élément survolé est passé par défaut en paramètre de la requête et correspond à <strong>$idClient</strong> :</p>\n\n<pre class="language-php">\n<code>\n	public function clientAction($idClient){\n		$client=Client::findFirst($idClient);\n		echo $client-&gt;toString();\n		$this-&gt;view-&gt;disable();\n	}\n</code></pre>\n'),
(251, 'exemple.description', 100, 'fr', '<p>...</p>\n'),
(252, 'exemple.description', 101, 'fr', '<p>Il s''agit dans ce cas de modifier dynamiquement le contenu du composant Breadcrumbs à partir de la nouvelle url affichée via ajax. Il est possible d''effectuer cette opération dans la méthode afterDispatchingRoute du controller, en appelant les méthodes :</p>\n\n<ul>\n	<li><strong>fromDispatcher </strong>qui construit les éléments du composant breadcrumbs à partir de l''url sollicitée</li>\n	<li>et <strong>jsSetContent </strong>qui affiche en javascript le contenu du composant</li>\n</ul>\n\n<pre>\n<code class="language-php">\n	public function afterExecuteRoute($dispatcher){\n		$bc=$this-&gt;jquery-&gt;bootstrap()-&gt;htmlBreadcrumbs("bc10");\n		$bc-&gt;fromDispatcher($dispatcher);\n		$bc-&gt;addGlyph("glyphicon-home",0);\n		$bc-&gt;jsSetContent($this-&gt;jquery);\n		$bc-&gt;autoGetOnClick("#ajax-content");\n		$this-&gt;jquery-&gt;compile($this-&gt;view);\n	}\n</code>\n</pre>\n'),
(253, 'exemple.description', 107, 'fr', '<p>La méthode <strong>autoGetOnClick</strong> affiche dans l''élément cible <strong>#div-centent-7</strong> le résultat de la requête ajax correspondant à l''attribut&nbsp;<strong>data-ajax</strong> de chaque élément.<br />\n<br />\nL''attribut <strong>data-ajax</strong> correspond à l''url associée à chaque élément en ajax.<br />\n<br />\n<strong>data-ajax</strong> est automatiquement renseigné par défaut en construisant hiérarchiquement le chemin d''accès à un élément en utilisant son caption :</p>\n\n<ul>\n	<li>Home =&gt; Home</li>\n	<li>Clients =&gt; Home/Clients</li>\n</ul>\n\n<p>Il est possible d''utiliser un autre attribut html que <strong>data-ajax</strong> pour stocker les urls associées aux éléments :&nbsp;utiliser dans ce cas&nbsp;<strong>setAttr($otherAttribute)</strong>.</p>\n\n<p>Il est également possible de modifier la fonction générant l''url de chaque élément utilisée en ajax avec <strong>setHrefFunction($function)</strong>.</p>\n\n<p>La fonction par défaut utilise les libellés des éléments&nbsp;:</p>\n\n<pre>\n<code class="language-php">\nfunction($element){return $element-&gt;getContent();}\n</code>\n</pre>\n'),
(254, 'exemple.description', 110, 'fr', '<p>Il s''agit dans ce cas de modifier dynamiquement le contenu du composant Pagination à partir de la nouvelle url affichée via ajax. Il est possible d''effectuer cette opération dans la méthode afterDispatchingRoute du controller, en appelant les méthodes :</p>\n\n<ul>\n	<li><strong>fromDispatcher </strong>qui construit les éléments du composant breadcrumbs à partir de l''url sollicitée</li>\n	<li>et <strong>jsSetContent </strong>qui affiche en javascript le contenu du composant</li>\n</ul>\n\n<pre>\n<code class="language-php">\n	public function afterExecuteRoute($dispatcher){\n		$bc=$this-&gt;jquery-&gt;bootstrap()-&gt;htmlPagination("page-10",1,3,NULL,2);\n		$bc-&gt;fromDispatcher($dispatcher);\n		$bc-&gt;jsSetContent($this-&gt;jquery);\n		$bc-&gt;autoGetOnClick("#div-content-10");\n		$this-&gt;jquery-&gt;compile($this-&gt;view);\n	}\n</code>\n</pre>\n'),
(255, 'exemple.description', 113, 'fr', '<p>Correspond à la perte du focus</p>\n\n<p><input class="form-control" id="input-1" type="text" /></p>\n\n<div class="alert alert-info" id="message-1">&nbsp;</div>\n'),
(256, 'exemple.description', 115, 'fr', '<p>Correspond au changement du contenu du contrôle. Notez que le change ne se produit que sur perte de focus par l''élément modifié.</p>\n\n<p><input class="form-control" id="input-2" type="text" /></p>\n\n<div class="alert alert-info" id="message-2">&nbsp;</div>\n'),
(257, 'exemple.description', 116, 'fr', '<p>Correspond au click sur un élément.</p>\n\n<p id="p">Paragraphe à cliquer...</p>\n\n<div class="alert alert-info" id="message-3">&nbsp;</div>\n'),
(258, 'exemple.description', 117, 'fr', '<p>Correspond à l''affichage du menu contextuel&nbsp;sur un élément.</p>\n\n<p id="p4">Paragraphe à cliquer avec le bouton droit...</p>\n\n<div class="alert alert-info" id="message-4">&nbsp;</div>\n'),
(259, 'exemple.description', 118, 'fr', '<p id="p">Ajoute une class css aux éléments HTML spécifiés.</p>\n\n<p>Dans l''appel de la méthode addClass, le 3ème paramètre (true) permet l''exécution immédiate du code.</p>\n'),
(260, 'exemple.description', 119, 'fr', '<p>Insère&nbsp;du contenu, spécifié par le paramètre, après chacun des éléments correspondants au sélecteur</p>\n\n<p><a class="btn btn-default" id="bt-append">Insérer</a></p>\n\n<ul id="identite">\n	<li id="1">&nbsp;Nom :&nbsp;</li>\n	<li id="2">&nbsp;Prénom :&nbsp;</li>\n</ul>\n'),
(261, 'exemple.description', 120, 'fr', '<p>Ajoute du contenu a l''intérieur des éléments spécifiés.</p>\n'),
(262, 'exemple.description', 121, 'fr', '<p>modifie la valeur de l''attribut HTML du premier élement correspondant</p>\n\n<p><input class="form-control" id="input" /></p>\n'),
(263, 'exemple.description', 122, 'fr', '<div class="alert alert-info" id="ex1">\n<p><label id="id">id</label></p>\n\n<p><label id="name">name</label></p>\n</div>\n'),
(264, 'exemple.description', 123, 'fr', '<p>La fonction de&nbsp;<strong>callback&nbsp;</strong>est utilisée ici pour modifier la progressbar bootstrap.</p>\n\n<p><a class="btn btn-primary btAjax" data-ajax="1">Client 1</a> <a class="btn btn-primary btAjax" data-ajax="2">Client 2</a> <a class="btn btn-primary btAjax" data-ajax="3">Client 3</a></p>\n\n<div class="alert alert-info" id="ex3"><input class="form-control" id="name" type="text" value="" />\n<div class="progress">\n<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="[[part]]" class="progress-bar progress-bar-striped active" id="pb2" role="progressbar" style="width: 1%">1%</div>\n</div>\n</div>\n'),
(265, 'exemple.description', 124, 'fr', '<p><a class="btn btn-primary" id="btJsonArray">Charger les clients</a> <a class="btn btn-primary" id="btShowMask">Afficher le masque</a></p>\n<script>$(''#btShowMask'').click(function() {$(''#repeat'').toggleClass(''hide'');});</script>\n\n<div class="alert alert-info" id="ex3">\n<div class="hide" id="repeat">\n<div class="row">\n<div class="col-xs-6 col-md-3"><a class="thumbnail" href="#"><img src="public/img/client/client[[id]].jpg" /> </a></div>\n\n<div class="col-xs-6 col-md-9"><input class="form-control" data-id="name" readonly="true" type="text" value="" />\n<div class="progress">\n<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="[[part]]" class="progress-bar progress-bar-striped active" role="progressbar" style="width: [[part]]%">[[part]]%</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n'),
(266, 'exemple.description', 125, 'fr', '<p><a class="btn btn-primary btAjax2" data-ajax="1">Client 1</a> <a class="btn btn-primary btAjax2" data-ajax="2">Client 2</a></p>\n\n<div class="alert alert-info" id="ex2"><input class="form-control" id="name" type="text" value="" /></div>\n'),
(291, 'index.header', 1, 'fr', 'Librairie jQuery, jQuery UI, Twitter Bootstrap  et Semantic-UI pour le framework MVC Phalcon'),
(292, 'index.header', 2, 'fr', 'Phalcon-jQuery est une librairie pour Phalcon® permettant de générer côté serveur des scripts clients ou des composants riches (Bootstrap, jQueryUI, Semantic-UI).'),
(293, 'index.download', 1, 'fr', 'Télécharger'),
(294, 'index.install', 1, 'fr', '<p>Ou</p><p class="lead">Installer via composer</p><p>Créer le fichier composer.json</p>'),
(295, 'index.install', 2, 'fr', 'En ligne de commande :'),
(296, 'index.menu', 1, 'fr', 'Accès rapide'),
(297, 'index.search', 1, 'fr', 'Rechercher...'),
(298, 'index.results', 1, 'fr', 'Aucun résultat correspondant.'),
(299, 'index.home', 1, 'fr', 'accueil'),
(300, 'translate.info', 1, 'fr', 'La traduction de cette page est incomplète.');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `domaine`
--
ALTER TABLE `domaine`
 ADD PRIMARY KEY (`id`), ADD KEY `idParent` (`idParent`);

--
-- Index pour la table `exemple`
--
ALTER TABLE `exemple`
 ADD PRIMARY KEY (`id`), ADD KEY `idDomaine` (`idRubrique`), ADD KEY `idRubrique` (`idRubrique`);

--
-- Index pour la table `rubrique`
--
ALTER TABLE `rubrique`
 ADD PRIMARY KEY (`id`), ADD KEY `idDomaine` (`idDomaine`);

--
-- Index pour la table `translation`
--
ALTER TABLE `translation`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `trans` (`idElement`,`name`,`lang`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `domaine`
--
ALTER TABLE `domaine`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT pour la table `exemple`
--
ALTER TABLE `exemple`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT pour la table `translation`
--
ALTER TABLE `translation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=301;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `domaine`
--
ALTER TABLE `domaine`
ADD CONSTRAINT `domaine_ibfk_1` FOREIGN KEY (`idParent`) REFERENCES `domaine` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `exemple`
--
ALTER TABLE `exemple`
ADD CONSTRAINT `exemple_ibfk_1` FOREIGN KEY (`idRubrique`) REFERENCES `rubrique` (`id`);

--
-- Contraintes pour la table `rubrique`
--
ALTER TABLE `rubrique`
ADD CONSTRAINT `rubrique_ibfk_1` FOREIGN KEY (`idDomaine`) REFERENCES `domaine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

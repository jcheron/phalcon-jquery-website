-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 24 Novembre 2015 à 02:37
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
  `ordre` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`id`, `libelle`, `idParent`, `ordre`) VALUES
(1, 'jQuery', NULL, 0),
(2, 'Bootstrap', NULL, 0),
(3, 'HtmlButton', 2, 1),
(4, 'HtmlButtonGroups', 2, 3),
(5, 'jQueryUI', NULL, 0),
(7, 'HtmlGlyphButton', 2, 2),
(8, 'Fonctions Ajax', 1, 1),
(9, 'Get', 8, 1),
(10, 'Post', 8, 2),
(11, 'Evénements', 1, 2),
(12, 'HtmlDropdown', 2, 4),
(13, 'HtmlSplitButton', 2, 5),
(14, 'HtmlCarousel', 2, 20),
(15, 'HtmlInputGroup', 2, 6),
(16, 'HtmlModal', 2, 7),
(17, 'HtmlAlert', 2, 8),
(18, 'HtmlProgressbar', 2, 9),
(19, 'HtmlTabs', 2, 10),
(20, 'HtmlListGroup', 2, 11),
(21, 'HtmlPanel', 2, 12),
(22, 'HtmlNavbar', 2, 11),
(23, 'HtmlAccordion', 2, 14),
(24, 'HtmlBreadcrumbs', 2, 15),
(25, 'HtmlPagination', 2, 16),
(26, 'PostForm', 8, 3),
(27, 'Manipulation du DOM', 1, 4),
(28, 'JSON', 8, 5);

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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `exemple`
--

INSERT INTO `exemple` (`id`, `titre`, `description`, `header`, `php`, `idRubrique`, `execPHP`, `ordre`) VALUES
(1, 'Bouton simple', NULL, NULL, '$button=new Ajax\\bootstrap\\html\\HtmlButton("btOkay","Okay");\r\necho $button;', 1, 1, 0),
(2, NULL, NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlButton;\r\nuse Ajax\\bootstrap\\html\\base\\CssRef;\r\n\r\n$bt0=new HtmlButton("bt0","Slamwiki",CssRef::CSS_DANGER,$this->jquery->hide("#bt1"));\r\n$bt0->addBadge("Cours");\r\n$bt1=new HtmlButton("bt1");\r\n$bt1->setValue("Button default");\r\n$bt1->addBadge("21");\r\n\r\necho $bt0->compile($this->jquery);\r\necho $bt1->compile($this->jquery);\r\necho $this->jquery->compile();', 1, 1, 0),
(3, NULL, NULL, NULL, '$bt=new Ajax\\bootstrap\\html\\HtmlGlyphButton("glButton1","glyphicon-equalizer","Equalizer");\necho $bt;', 6, 1, 0),
(4, NULL, 'Il est également possible de créer un glyphButton à partir de l''index du glyph', NULL, '$bt=new Ajax\\bootstrap\\html\\HtmlGlyphButton("glButton2",120,"Glyph numéro 120");\necho $bt;', 6, 1, 2),
(5, NULL, 'Aperçu de l''ensemble des glyphicons utilisables', NULL, '$i=0;\nforeach(Ajax\\bootstrap\\html\\base\\CssRef::glyphIcons() as $glyph){\n	$bt=new Ajax\\bootstrap\\html\\HtmlGlyphButton("glybutton-".$i++,$glyph);\n	$bt->setTitle($glyph);\n	echo $bt;\n}', 6, 1, 3),
(6, 'get', '<p>Effectue une requ&ecirc;te Ajax vers l&#39;url <strong>index/main</strong> et affiche la r&eacute;ponse dans&nbsp;la zone HTML d&#39;identifiant <strong>response</strong>&nbsp;(l&#39;url correspond &agrave; la m&eacute;thode <strong>mainAction </strong>du contr&ocirc;leur <strong>IndexController</strong>):<br />\n{{warning: l&#39;&eacute;l&eacute;ment HTML cible <strong>#response</strong> doit exister dans la page avant l&#39;envoi de la requ&ecirc;te.}}</p>\n', NULL, 'public function getAction(){\n	$this->jquery->get("index/main","#response");\n	echo $this->jquery->compile();\n}', 5, 0, 1),
(7, 'Passage de paramètres', '<p>M&ecirc;me requ&ecirc;te que la pr&eacute;c&eacute;dente mais avec passage des param&egrave;tres au format JSON : id=1 et page=5&nbsp;</p>\n\n<p>{{info:Les param&egrave;tres <strong>id </strong>et <strong>page </strong>sont r&eacute;cup&eacute;rables dans la r&eacute;ponse par <strong>$_GET[&quot;id&quot;]</strong> et <strong>$_GET[&quot;page&quot;]</strong>}}</p>\n', NULL, 'public function getAction(){\n	$this->jquery->get("index/main","#response","{id:1,page:5}");\n	echo $this->jquery->compile();\n}', 5, 0, 2),
(8, 'Appel d''un script callBack', '<p>Le script de callBack pass&eacute;&nbsp;en param&egrave;tre sera ex&eacute;cut&eacute; apr&egrave;s le succ&egrave;s de la requ&ecirc;te ajax ; il peut &ecirc;tre exprim&eacute; en php ou directement en jQuery.</p>\n', NULL, 'public function getAction(){\n	$this->jquery->get("Test/reponse","#response",null,$this->jquery->show("#response"));\n	echo $this->jquery->compile();\n}\npublic function getAction(){\n	$this->jquery->get("Test/reponse","#response",null,"$(''#response'').show();");\n	echo $this->jquery->compile();\n}', 5, 0, 3),
(9, 'Création', NULL, NULL, '	$buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups(''bg1'');\n	$buttonsGroup->addElements(array("Bouton1","Bouton2","Bouton3"));\n	echo $buttonsGroup;', 9, 1, 1),
(10, NULL, '<p>Ajout d''une instance de <strong>HtmlButton</strong></p>\n', NULL, '	$buttonsGroup->addElement(new Ajax\\bootstrap\\html\\HtmlButton("bt4","Bouton4","primary"));\n	echo $buttonsGroup;', 9, 1, 2),
(11, NULL, '<p>Ajout d''une instance de&nbsp;<strong>HtmlGlyphButton</strong></p>\n', NULL, '	$buttonsGroup->addElement(new Ajax\\bootstrap\\html\\HtmlGlyphButton("bt5","star","Bouton5","warning"));\n	echo $buttonsGroup;', 9, 1, 3),
(12, 'Initialisation à partir d''un array', '<p>Création à partir d''un array plus complexe :</p>\n', NULL, '	$buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups(''bg2'');\n	$buttonsGroup->addElements(array(\n				array("value"=>"Bouton1","identifier"=>"bt-1","style"=>"primary"),\n				array("value"=>"Bouton2","identifier"=>"bt-2","style"=>"danger")\n	));\n	$buttonsGroup->getElement(1)->addBadge("Danger");\n	echo $buttonsGroup;', 9, 1, 4),
(13, 'Chargement depuis un modèle', '<p>Chargement depuis une liste d''objets (modèle <strong>Client</strong>) :</p>{{info: La méthode <strong>fromDatabaseObjects </strong>doit prendre en paramètres :<ul>	<li>Un tableau (objets)</li>	<li>une fonction prenant en paramètre une instance d''objet et retournant un nouvel élément à insérer dans le conteneur HtmlButtonGroups</li></ul>}}', NULL, '	$clients=Client::find();\n	 $buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups(''bg-clients'');\n	echo $buttonsGroup->fromDatabaseObjects($clients, function($client){\n		return new Ajax\\bootstrap\\html\\HtmlButton($client->getId(),$client->getName());\n	});', 9, 1, 4),
(14, 'Association d’événement', NULL, NULL, '	$clients=Client::find();\n	$buttonsGroup=$this->jquery->bootstrap()->htmlButtongroups(''bg-clients2'');\n	$buttonsGroup->fromDatabaseObjects($clients, function($client){\n		return new Ajax\\bootstrap\\html\\HtmlButton("bg-clients2-bt-".$client->getId(),$client->getName());\n	});\n	$buttonsGroup->onClick("$(''#reponse-clients'').html($(event.target).html());");\n	echo $buttonsGroup->compile($this->jquery);\n	echo "<div id=''reponse-clients''>Réponse</div>";', 9, 1, 5),
(15, 'Création', NULL, NULL, '	$dropdown=$this->jquery->bootstrap()->htmlDropdown("dd1","Default",array("Elément 1","Elément 2"));\n	echo $dropdown->compile();', 11, 1, 1),
(16, 'Ajout d''éléments', '<p>Ajout d''un élément, de plusieurs, d''un élément avec href spécifique :</p>\n', NULL, '	$dropdown->addItem("Elément 3");\n	$dropdown->addItems(array("Elément 4","Elément 5"));\n	$dropdown->addItem("Google","http://www.google.com");\n	echo $dropdown;', 11, 1, 2),
(17, 'En-têtes et diviseurs', NULL, NULL, '	$dropdown=$this->jquery->bootstrap()->htmlDropdown("dd2","Dropdowns");\n	$dropdown->addHeader("Partie 1");\n	$dropdown->addItems(array("Item1","Item2"));\n	$dropdown->addDivider();\n	$dropdown->addItems(array("Item3","Item4"));\n	echo $dropdown->compile();', 11, 1, 4),
(18, 'Aspect bouton', NULL, NULL, '	$dropdown->asButton("btn-info");\n	echo $dropdown;', 11, 1, 5),
(19, 'A partir d''un array', NULL, NULL, '	$dropdown=$this->jquery->bootstrap()->htmlDropdown("dd2","Dropdown from Array");\n	$dropdown->fromArray(array("items"=>array("Elément 1","Elément 2","-","Elément 3","-Séparateur","Elément 4")));\n	echo $dropdown;', 11, 1, 6),
(20, 'Chargement depuis un modèle', NULL, NULL, '	$clients=Client::find();\n	$dropdown=$this->jquery->bootstrap()->htmlDropdown(''dd-clients'',''Clients'');\n	echo $dropdown->fromDatabaseObjects($clients, function($client){\n		return $client->getName();\n	});', 11, 1, 7),
(21, 'Association d''événement', NULL, NULL, '	$clients=Client::find();\n	$dropdown=$this->jquery->bootstrap()->htmlDropdown(''dd-clients-2'',''Clients'');\n	$dropdown->fromDatabaseObjects($clients, function($client){\n		return $client->getName();\n	});	\n	$dropdown->onClick("$(''#reponse-clients'').html($(event.target).html());",false,true);\n	echo $dropdown->compile($this->jquery);\n	echo $this->jquery->bootstrap()->htmlAlert("reponse-clients","Aucun client cliqué...","alert-info");', 11, 1, 8),
(22, 'Création', NULL, NULL, '	$splitBtn=$this->jquery->bootstrap()->htmlSplitbutton("sBtn","Split bouton",array("Item 1","Item 2"));\n	echo $splitBtn;', 12, 1, 1),
(23, 'Association d''événement au bouton', NULL, NULL, '	$splitBtn=$this->jquery->bootstrap()->htmlSplitbutton("sBtn-2","Split bouton",array("Item 1","Item 2"));\n	$splitBtn->onButtonClick("$(''#reponse-split'').html(''Clic sur le bouton'');");\n	echo $splitBtn->compile($this->jquery);\n	echo $this->jquery->bootstrap()->htmlAlert("reponse-split","Bouton non cliqué...","alert-info");', 12, 1, 2),
(24, 'Création', NULL, NULL, '$carousel=$this->jquery->bootstrap()->htmlCarousel("carousel",array("client1.jpg","client2.jpg"));\n$carousel->setBase("public/img/client/");\necho $carousel;', 13, 1, 1),
(25, 'Ajout d''image', NULL, NULL, '$carousel=$this->jquery->bootstrap()->htmlCarousel("carousel-2",array("client1.jpg","client2.jpg"));\n$carousel->setBase("public/img/client/");\n$carousel->addImage(''client3.jpg'');\necho $carousel;', 13, 1, 2),
(26, 'Chargement depuis un modèle', '<p>Chargement depuis une liste d''objets (modèle&nbsp;<strong>Client</strong>) :</p>\n\n<p>{{info: La méthode&nbsp;<strong>fromDatabaseObjects&nbsp;</strong>doit prendre en paramètres :</p>\n\n<ul>\n	<li>Un tableau (objets)</li>\n	<li>une fonction prenant en paramètre une instance d''objet et retournant un nouvel élément à insérer dans le conteneur HtmlCarousel</li>\n</ul>\n\n<p>}}</p>\n', NULL, '	$carousel=$this->jquery->bootstrap()->htmlCarousel("carousel-3");\n	$carousel->setBase("public/img/client/");\n	$clients=Client::find();\n	$carousel->fromDatabaseObjects($clients, function($client){\n		return array("client".$client->getId().".jpg","Client".$client->getId(),$client->getName());\n	});\n	echo $carousel->compile($this->jquery);', 13, 1, 4),
(27, 'Création', '<p>Input avec span (positionné à gauche par défaut)</p>\n', NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-1");\n		$inputGroup->createSpan("@");\n		echo $inputGroup;', 14, 1, 1),
(28, NULL, '<p>Positionné à droite</p>\n', NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-2");\n		$inputGroup->createSpan("@example.com","right");\n		echo $inputGroup;', 14, 1, 2),
(29, 'Cases à cocher et boutons radio', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-3");\n		$inputGroup->createCheckbox("ig-3-ck");\n		echo $inputGroup;', 14, 1, 3),
(30, NULL, NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-4");\n		$inputGroup->createRadio("ig-4-radio","Radio","right");\n		echo $inputGroup;', 14, 1, 4),
(31, 'Bouton', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-5");\n		$inputGroup->createButton("ig-4-radio","Go","right");\n		echo $inputGroup;', 14, 1, 5),
(32, 'SplitButton', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-7");\n		$bt=$inputGroup->createSplitButton("ig-7-split","Actions","right",array("Action","Another action","-","Last action"));\n		$bt->setStyle("btn-info");\n		echo $inputGroup;', 14, 1, 7),
(33, 'Groupes de boutons', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-5");\n		$inputGroup->createButtons(array("Okay","Annuler"));\n		echo $inputGroup;', 14, 1, 5),
(34, 'Dropdown', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-6");\n		$bt=$inputGroup->createDropdown("ig-6-dd","Actions","right",array("Action","Another action","-","Last action"));\n		$bt->setStyle("btn-info");\n		echo $inputGroup;', 14, 1, 6),
(35, NULL, NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\nuse Ajax\\bootstrap\\html\\HtmlGlyphButton;\n		$inputGroup=new HtmlInputgroup("ig-5b");\n		$inputGroup->createButtons(array("Okay",new HtmlGlyphButton("glyph",120,"Ouvrir...")));\n		echo $inputGroup;', 14, 1, 5),
(36, 'Association d''évènements', '<p>Sur frappe d''une touche dans la zone de texte, la classe <strong>btn-success</strong> et ajoutée/enlevée sur le bouton <strong>go</strong></p>\n', NULL, 'use Ajax\\bootstrap\\html\\HtmlInputgroup;\n		$inputGroup=new HtmlInputgroup("ig-8");\n		$inputGroup->createButton("ig-8-button","Go","right");\n		$inputGroup->onKeypress("$(''#ig-8-button'').toggleClass(''btn-success'');");\n		echo $inputGroup->compile($this->jquery);', 14, 1, 8),
(37, 'Changement de taille', NULL, NULL, '$sizes= Ajax\\bootstrap\\html\\base\\CssRef::sizes("input-group") ;\nfor($i=0;$i<3;$i++){\n	echo "Taille : <b>".$sizes[$i]."</b><br>";\n	$inputGroup->setSize($sizes[$i]);\n	echo $inputGroup;\n}', 14, 1, 8),
(38, 'Création', NULL, NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite1","Titre de la boîte de dialogue","test");\necho $dialog->compile($this->jquery);', 15, 1, 1),
(39, 'Affichage', '<p>Affichage de la boîte de dialogue sur click d''un bouton</p>\n', NULL, '$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);', 15, 1, 2),
(40, 'Boutons par défaut', '<p>Ajout de boutons <strong>Okay </strong>et <strong>Annuler</strong></p>\n', NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite2","Titre de la boîte de dialogue","test");\n$dialog->addOkayButton();\n$dialog->addCancelButton();\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-2","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);', 15, 1, 3),
(41, 'Condition de sortie', '<p>Pour permettre la sortie de la boîte par le bouton valider, il est nécessaire de mettre la propriété <strong>valid </strong>du dialog à <strong>true </strong>:</p>\n\n<pre>\n<code class="language-php">$(''#boite5'').prop(''valid'',true);</code></pre>\n', NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite5","Titre de la boîte de dialogue","test");\n$dialog->addOkayButton("Enregistrer","$(''#info-2'').html(''clic sur le bouton Valider'');");\n$dialog->addCancelButton("Fermer");\n$btDialog=$this->jquery->bootstrap()->htmlButton("bt-dialog-5","Valide","btn-success","$(''#boite5'').prop(''valid'',true);");\n$btDialog->setToggled();\n$dialog->setContent($btDialog);\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-5","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("info-2");', 15, 1, 5),
(42, 'Personnalisation des boutons', NULL, NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite4","Titre de la boîte de dialogue","test");\n$dialog->addOkayButton("Enregistrer","$(''#info'').html(''clic sur le bouton Valider'');");\n$dialog->addCancelButton("Fermer");\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-4","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("info");', 15, 1, 4),
(43, 'Personnalisation de la condition', NULL, NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite6","Titre de la boîte de dialogue","test");\n$dialog->setValidCondition("$(''#valid'').is('':checked'')");\n$dialog->addOkayButton("Enregistrer","$(''#info-3'').html(''clic sur le bouton Valider'');");\n$dialog->addCancelButton("Fermer");\n$dialog->setContent("<label><input type=''checkbox'' name=''valid'' id=''valid''> valeur de valid</label>");\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-6","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("info-3");', 15, 1, 6),
(44, 'Appel d''une action sur un contrôleur', '<p>Contrôleur <b>test</b> :<br />\n&nbsp;</p>\n\n<pre>\n<code class="language-php">\n	public function clientsAction(){\n		$clients=Client::find();\n		$this-&gt;view-&gt;setRenderLevel(View::LEVEL_MAIN_LAYOUT);\n		$this-&gt;view-&gt;setVars(array(" model=""&gt;"Clients","objects"=&gt;$clients));\n	}\n</code></pre>\n', NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite7","Liste des clients");\n$dialog->addOkayButton();\n$dialog->addCancelButton();\n$dialog->forward($this,"test","clients");\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-7","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);', 15, 1, 7),
(45, 'Appel d''une vue et passage de paramètres', NULL, NULL, '$dialog=$this->jquery->bootstrap()->htmlModal("boite8","Liste des clients");\n$dialog->addOkayButton();\n$dialog->addCancelButton();\n$clients=Client::find();\n$dialog->renderContent($this->view,"test","clients",array("model"=>"Clients","objects"=>$clients));\necho $dialog->compile($this->jquery);\n$button=new Ajax\\bootstrap\\html\\HtmlButton("bt-show-8","Afficher le dialogue");\n$button->onClick($dialog->jsShow());\necho $button->compile($this->jquery);', 15, 1, 8),
(47, 'Création', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlAlert("alert1","Alert de type <b>Warning</b> par défaut");', 16, 1, 1),
(48, 'Classes', NULL, NULL, '$bootstrap=$this->jquery->bootstrap();\necho $bootstrap->htmlAlert("alert2-1","<b>Well done!</b> You successfully read this important alert message.","alert-success");\necho $bootstrap->htmlAlert("alert2-2","<b>Heads up!</b> This alert needs your attention, but it''s not super important.","alert-info");\necho $bootstrap->htmlAlert("alert2-2","<b>Warning!</b> Better check yourself, you''re not looking too good.","alert-warning");\necho $bootstrap->htmlAlert("alert2-2","<b>Oh snap!</b> Change a few things up and try submitting again.","alert-danger");', 16, 1, 2),
(49, 'Alert refermable', NULL, NULL, '$alert=$this->jquery->bootstrap()->htmlAlert("alert3","Dismissable Alert");\n$alert->setStyle("danger");\n$alert->setCloseable(true);\necho $alert;\n', 16, 1, 3),
(50, 'Fermeture externe', '<div id="msg-close">...</div>\n', NULL, '$alert=$this->jquery->bootstrap()->htmlAlert("alert4","Alert refermable sur click");\n$this->jquery->click("#alert4",$alert->close());\necho $alert;', 16, 1, 4),
(51, 'Evènements', NULL, NULL, '$alert=$this->jquery->bootstrap()->htmlAlert("alert5","Alert refermable,<br>Affiche une autre alert après fermeture");\n$alert->setCloseable(true);\n$alert->onClose($this->jquery->show("#alert5-2"));\necho $alert->compile($this->jquery);\n$alert2=$this->jquery->bootstrap()->htmlAlert("alert5-2","Alert refermée","alert-info");\n$alert2->setProperty("style","display:none;");\necho $alert2;\n', 16, 1, 5),
(52, 'Création', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlProgressbar("pb1");', 17, 1, 1),
(53, 'Valeur intitiale', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlProgressbar("pb2","info",50);', 17, 1, 2),
(55, 'Avec label', NULL, NULL, '$pb= $this->jquery->bootstrap()->htmlProgressbar("pb3","info",50);\necho $pb->showcaption(true);', 17, 1, 3),
(56, 'Styles', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlProgressbar("pb4-1","info",50);\necho $this->jquery->bootstrap()->htmlProgressbar("pb4-2","success",60);\necho $this->jquery->bootstrap()->htmlProgressbar("pb4-3","warning",70);\necho $this->jquery->bootstrap()->htmlProgressbar("pb4-4","danger",80);\n', 17, 1, 4),
(58, 'Striped', NULL, NULL, 'echo $this->jquery->bootstrap()->htmlProgressbar("pb5","info",50)->setStriped(true);\n', 17, 1, 5),
(59, 'Animation', NULL, NULL, '$pb=$this->jquery->bootstrap()->htmlProgressbar("pb6","info",50);\necho $pb->setStriped(true)->setActive(true);\n', 17, 1, 6),
(60, 'Progressbars empilées', NULL, NULL, '$pb=$this->jquery->bootstrap()->htmlProgressbar("pb7");\n$pb->stack($this->jquery->bootstrap()->htmlProgressbar("pb7-1","success",20)->setStriped(true));\n$pb->stack($this->jquery->bootstrap()->htmlProgressbar("pb7-2","warning",10));\n$pb->stack($this->jquery->bootstrap()->htmlProgressbar("pb7-3","danger",10));\n$pb->showCaption(true);\necho $pb;\n', 17, 1, 7),
(61, 'Chargement depuis un modèle', NULL, NULL, '$values=array(array("style"=>"success","value"=>10),array("style"=>"warning","value"=>20),array("style"=>"danger","value"=>3));\n$pb=$this->jquery->bootstrap()->htmlProgressbar("pb8")->showCaption(true);\n$pb->fromDatabaseObjects($values, function($v){\n		return $this->jquery->bootstrap()->htmlProgressbar("pb8-",$v["style"],$v["value"]);\n	});\necho $pb;', 17, 1, 8),
(62, 'Création', NULL, NULL, '$tabs=$this->jquery->bootstrap()->htmlTabs("tab-1");\n$tabs->addTabs(array("Tab 1","Tab 2","Tab 3"));\necho $tabs;', 18, 1, 1),
(64, 'Active Tab', NULL, NULL, '$tabs->setActive(1);\necho $tabs;', 18, 1, 2),
(65, 'Disable tab', NULL, NULL, '$tabs->disable(2);\necho $tabs;', 18, 1, 3),
(66, 'Ajout de dropdowns', NULL, NULL, '$dd=$this->jquery->bootstrap()->htmlDropdown("dd","Dropdown",array("item 1","item 2"));\n$tabs->addTab($dd);\necho $tabs;', 18, 1, 4),
(67, 'Création', NULL, NULL, '$listGroup=$this->jquery->bootstrap()->htmlListgroup("lg",array("Cras justo odio","Dapibus ac facilisis in","Morbi leo risus","Porta ac consectetur ac","Vestibulum at eros"));\necho $listGroup;', 19, 1, 1),
(68, 'Création', NULL, NULL, '$panel=$this->jquery->bootstrap()->htmlPanel("panel-1","Contenu");\necho $panel;', 20, 1, 1),
(69, 'Directement dans le contrôleur (sans vue)', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\CssRef;\n$button=$this->jquery->bootstrap()->htmlButton("btAfficher","Afficher message",CssRef::CSS_PRIMARY);\n$alert=$this->jquery->bootstrap()->htmlAlert("alert1","<b>Cliquer</b> sur le bouton...");\n$button->onClick($alert->jsHtml("Click sur bouton"));\necho $button->compile($this->jquery);\necho $alert;', 21, 1, 1),
(70, 'Dans le contrôleur...associé à une vue', '<h3>Vue :</h3>\n\n<pre>\n<code class="language-php">\n{{ q["btAfficher"] }}\n{{ q["alert1"] }}\n{{ script_foot }}\n</code>\n</pre>\n', NULL, 'use Ajax\\bootstrap\\html\\base\\CssRef;\n$button=$this->jquery->bootstrap()->htmlButton("btAfficher","Afficher message",CssRef::CSS_PRIMARY);\n$alert=$this->jquery->bootstrap()->htmlAlert("alert1","<b>Cliquer</b> sur le bouton...");\n$button->onClick($alert->jsHtml("Click sur bouton"));\n$this->jquery->compile($this->view);', 21, 0, 3),
(71, 'Avec header', NULL, NULL, '$panel=$this->jquery->bootstrap()->htmlPanel("panel-2","Contenu","Header"); \necho $panel;', 20, 1, 2),
(73, 'Et footer', NULL, NULL, '$panel=$this->jquery->bootstrap()->htmlPanel("panel-3","Contenu","Header","Footer"); \necho $panel;', 20, 1, 3),
(74, 'Styles', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\CssRef;\n$panel=$this->jquery->bootstrap()->htmlPanel("panel-4","Contenu","Header");\n$panel->setStyle(CssRef::CSS_INFO);\n echo $panel;\n$panel->setStyle(CssRef::CSS_WARNING);\n echo $panel;\n$panel->setStyle(CssRef::CSS_DANGER);\n echo $panel;', 20, 1, 4),
(75, 'Badges et labels', NULL, NULL, '$listGroup->getItem(0)->addBadge("22");\n$listGroup->getItem(1)->addLabel("New","info")->addBadge("0");\necho $listGroup;', 19, 1, 2),
(76, 'Active, disable', NULL, NULL, '$listGroup->getItem(2)->setActive();\n$listGroup->getItem(4)->setDisabled();\necho $listGroup;', 19, 1, 4),
(77, 'Liens', '<p>Si le tagName du conteneur principal n''est pas <strong>ul</strong>, les items ajoutés sont des liens.</p>\n', NULL, '$listGroup=$this->jquery->bootstrap()->htmlListgroup("lg-2",array("Cras justo odio","Dapibus ac facilisis in","Morbi leo risus","Porta ac consectetur ac","Vestibulum at eros"),"div");\necho $listGroup;', 19, 1, 5),
(78, 'Styles', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\CssRef;\n$listGroup->getItem(0)->setStyle(CssRef::CSS_SUCCESS);\n$listGroup->getItem(1)->setStyle(CssRef::CSS_WARNING);\n$listGroup->getItem(2)->setStyle(CssRef::CSS_INFO);\necho $listGroup;', 19, 1, 6),
(79, 'Contenu personnalisé', NULL, NULL, '$listGroup->getItem(3)->setHeadingAndContent("List group item heading","Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.",4);\necho $listGroup;', 19, 1, 6),
(80, 'Chargement depuis un modèle', NULL, NULL, '$clients=Client::find();\n$listGroup=$this->jquery->bootstrap()->htmlListgroup(''lg-clients'');\necho $listGroup->fromDatabaseObjects($clients, function($client){\n		return $client->getName();\n	});', 19, 1, 7),
(81, 'Chargement plus complexe', NULL, NULL, 'use Ajax\\bootstrap\\html\\base\\HtmlDoubleElement;\n$clients=Client::find();\n$listGroup=$this->jquery->bootstrap()->htmlListgroup(''lg-clients'');\necho $listGroup->fromDatabaseObjects($clients, function($client){\n	$element=new HtmlDoubleElement("list-gi-".$client->getId(),"li");\n	$element->setContent($client->getName());	\n	$element->addBadge($client->getPart());\n	return $element;\n	});', 19, 1, 8),
(82, 'Pills', NULL, NULL, '$tabs->setTabstype("pills");\necho $tabs;', 18, 1, 5),
(83, 'Empilés', NULL, NULL, '$tabs->setStacked(true);\necho $tabs;', 18, 1, 8),
(84, 'Création', NULL, NULL, '$navbar=$this->jquery->bootstrap()->htmlNavbar("nb-1","Accueil");\necho $navbar;', 22, 1, 1),
(85, 'Ajout d''items', NULL, NULL, '$navbar->addElements(array("Lien 1","Lien 2"));\necho $navbar;', 22, 1, 2),
(86, 'Brand image', NULL, NULL, '$navbar=$this->jquery->bootstrap()->htmlNavbar("nb-2");\n$navbar->setBrandImage("img/miniPhalcon.png");\necho $navbar;', 22, 1, 3),
(87, 'Zones de formulaires', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlInput;\nuse Ajax\\bootstrap\\html\\HtmlButton;\n$zForm=$navbar->addZone("form");\n$input=new HtmlInput("txtSearch");\n$input->setPlaceHolder("mots clefs");\n$zForm->addElement($input);\n$zForm->addElement(new HtmlButton("btSearch","Rechercher"));\necho $navbar;', 22, 1, 5),
(89, 'Dropdowns', NULL, NULL, 'use \\Ajax\\bootstrap\\html\\HtmlDropdown;\n$navbar->addElement(new HtmlDropdown("dd-1","Dropdown",array("Action","Another action")));\necho $navbar;', 22, 1, 4),
(90, 'Ajout à droite', NULL, NULL, '$navbar->addZone("right")->addElement("A propos...");\necho $navbar;', 22, 1, 6),
(91, 'Ajout à partir d''un tableau', NULL, NULL, '$navbar->addElements(array("Dropdown"=>array("Action","Another action","SomeThing else here","-","Separated link")));\necho $navbar;\n', 22, 1, 7),
(92, 'Navbar inverse', NULL, NULL, '$navbar->cssInverse();\necho $navbar;', 22, 1, 8),
(93, 'Création', NULL, NULL, '$accordion=$this->jquery->bootstrap()->htmlAccordion("accordion1");\n$accordion->addPanel("Panel 1","Contenu du panel 1");\n$accordion->addPanel("Panel 2","Contenu du panel 2");\necho $accordion;', 23, 1, 1),
(94, 'Appel d''une vue et passage de paramètres', NULL, NULL, '$clients=Client::find();\n$accordion=$this->jquery->bootstrap()->htmlAccordion("accordion2");\n$accordion->renderContentPanel("Clients",$this->view,"test","clients",array("model"=>"Clients","objects"=>$clients));\necho $accordion;', 23, 1, 5),
(95, 'Appel d''une action sur un contrôleur', NULL, NULL, '$accordion=$this->jquery->bootstrap()->htmlAccordion("accordion3"); \n$accordion->forwardPanel("Clients",$this,"test","clients");\n echo $accordion;', 23, 1, 4),
(97, 'Get sur évènement', '<ul id="getOn">\n	<li id="1">Client 1</li>\n	<li id="2">Client 2</li>\n</ul>\n\n<div class="alert alert-info" id="alert-reponse">Survolez un élément de la liste pour afficher le client</div>\n\n<p>Ci-dessous le code de l''action <strong>client </strong>sollicitée sur <strong>mouseenter</strong>. L''<strong>id</strong> de l''élément survolé est passé par défaut en paramètre de la requête et correspond à <strong>$idClient</strong> :</p>\n\n<pre class="language-php">\n<code>\n	public function clientAction($idClient){\n		$client=Client::findFirst($idClient);\n		echo $client-&gt;toString();\n		$this-&gt;view-&gt;disable();\n	}\n</code></pre>\n', NULL, '$this->jquery->getOn("mouseenter","#getOn li","Test/client","#alert-reponse",array("hasLoader"=>false));', 5, 1, 5),
(98, 'Get sur évènement avec passage d''un autre attribut Html', '<p>L''attribut passé par défaut à la requête est <strong>id</strong>, il est possible d''en passer un autre : soit un attribut html existant, soit un attribut personnalisé (<strong>data-id</strong>) comme dans le cas ci-dessous :</p>\n\n<p>Code Html source :</p>\n\n<ul id="getOnData">\n	<li data-id="1" id="cli-1">Client 1</li>\n	<li data-id="2" id="cli-2">Client 2</li>\n</ul>\n\n<pre class="language-html">\n<code>\n&lt;ul id="getOnData"&gt;\n&lt;li id="cli-1" data-id="1"&gt;Client 1&lt;/li&gt;\n&lt;li id="cli-2" data-id="2"&gt;Client 2&lt;/li&gt;\n&lt;/ul&gt;\n</code></pre>\n\n<div class="alert alert-info" id="alert-reponse-2">Survolez un élément de la liste pour afficher le client</div>\n\n<p>Ci-dessous le code de l''action <strong>client </strong>sollicitée sur <strong>mouseEnter</strong>. L''<strong>id</strong> de l''élément survolé est passé par défaut en paramètre de la requête et correspond à <strong>$idClient</strong> :</p>\n\n<pre class="language-php">\n<code>\n	public function clientAction($idClient){\n		$client=Client::findFirst($idClient);\n		echo $client-&gt;toString();\n		$this-&gt;view-&gt;disable();\n	}\n</code></pre>\n', NULL, '$this->jquery->getOn("mouseenter","#getOnData li","Test/client","#alert-reponse-2",array("attr"=>"data-id","hasLoader"=>false));', 5, 1, 6),
(99, 'Get sur click', NULL, NULL, '$this->jquery->getOnClick("#getOnClick li","Test/client","#alert-reponse-3");', 5, 0, 6),
(100, 'Création', '<p>...</p>\n', NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc1",array("Home","Library"));\necho $bc;\n', 25, 1, 1),
(101, 'Synchronisation à partir du dispatcher phalcon', '<p>Il s''agit dans ce cas de modifier dynamiquement le contenu du composant Breadcrumbs à partir de la nouvelle url affichée via ajax. Il est possible d''effectuer cette opération dans la méthode afterDispatchingRoute du controller, en appelant les méthodes :</p>\n\n<ul>\n	<li><strong>fromDispatcher </strong>qui construit les éléments du composant breadcrumbs à partir de l''url sollicitée</li>\n	<li>et <strong>jsSetContent </strong>qui affiche en javascript le contenu du composant</li>\n</ul>\n\n<pre>\n<code class="language-php">\n	public function afterExecuteRoute($dispatcher){\n		$bc=$this-&gt;jquery-&gt;bootstrap()-&gt;htmlBreadcrumbs("bc10");\n		$bc-&gt;fromDispatcher($dispatcher);\n		$bc-&gt;addGlyph("glyphicon-home",0);\n		$bc-&gt;jsSetContent($this-&gt;jquery);\n		$bc-&gt;autoGetOnClick("#ajax-content");\n		$this-&gt;jquery-&gt;compile($this-&gt;view);\n	}\n</code>\n</pre>\n', NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc10",array("Accueil","Clients","1"));\n$bc->autoGetOnClick("#ajax-content");\n$bc->getElement(0)->wrapContentWithGlyph("glyphicon-home");\necho $bc->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("ajax-content");', 25, 1, 10),
(102, 'Ajout d''éléments', NULL, NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc2");\n$bc->addElement("Accueil");\necho $bc;', 25, 1, 2),
(103, 'Ajout de liens', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlLink;\n$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc3");\n$bc->addElement(new HtmlLink("id-accueil","index","Accueil"));\n$bc->addElement(new HtmlLink("id-clients","Test/clients","Clients"));\necho $bc;', 25, 1, 3),
(104, 'Ajout à partir de tableaux', NULL, NULL, 'use Ajax\\bootstrap\\html\\HtmlLink;\n$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc4");\n$bc->addElements(array(array("identifier"=>"item1","href"=>"index","content"=>"Accueil"),array("identifier"=>"item2","href"=>"Test/clients","content"=>"Clients")));\necho $bc;', 25, 1, 4),
(105, 'Activation du dernier lien + glyphicon', NULL, NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc5"); \n$bc->setAutoActive(false);\n$bc->addElement("Accueil","Accueil/index","glyphicon-home");\n$bc->addElement("index","Accueil/Clients"); \necho $bc;\n', 25, 1, 5),
(106, 'Glyphicons', NULL, NULL, '$bc->addGlyph("glyphicon-star",1);\necho $bc;', 25, 1, 6),
(107, 'Association de code Javascript', '<p>La méthode <strong>autoGetOnClick</strong> affiche dans l''élément cible <strong>#div-centent-7</strong> le résultat de la requête ajax correspondant à l''attribut&nbsp;<strong>data-ajax</strong> de chaque élément.<br />\n<br />\nL''attribut <strong>data-ajax</strong> correspond à l''url associée à chaque élément en ajax.<br />\n<br />\n<strong>data-ajax</strong> est automatiquement renseigné par défaut en construisant hiérarchiquement le chemin d''accès à un élément en utilisant son caption :</p>\n\n<ul>\n	<li>Home =&gt; Home</li>\n	<li>Clients =&gt; Home/Clients</li>\n</ul>\n\n<p>Il est possible d''utiliser un autre attribut html que <strong>data-ajax</strong> pour stocker les urls associées aux éléments :&nbsp;utiliser dans ce cas&nbsp;<strong>setAttr($otherAttribute)</strong>.</p>\n\n<p>Il est également possible de modifier la fonction générant l''url de chaque élément utilisée en ajax avec <strong>setHrefFunction($function)</strong>.</p>\n\n<p>La fonction par défaut utilise les libellés des éléments&nbsp;:</p>\n\n<pre>\n<code class="language-php">\nfunction($element){return $element-&gt;getContent();}\n</code>\n</pre>\n', NULL, '$bc=$this->jquery->bootstrap()->htmlBreadcrumbs("bc7",array("Home","Clients")); \n$bc->autoGetOnClick("#div-content-7");\necho $bc->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("div-content-7");', 25, 1, 7),
(108, 'Création', NULL, NULL, '$page=$this->jquery->bootstrap()->htmlPagination("page-1",1,5,2);\necho $page;', 26, 1, 1),
(109, 'Association de code javascript', NULL, NULL, '$page=$this->jquery->bootstrap()->htmlPagination("page-7",1,3);\n$page->setUrlMask("pagination/client/%page%");\n$page->autoGetOnClick("#div-content-7");\necho $page->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("div-content-7");', 26, 1, 7),
(110, 'Synchronisation à partir du dispatcher Phalcon', '<p>Il s''agit dans ce cas de modifier dynamiquement le contenu du composant Pagination à partir de la nouvelle url affichée via ajax. Il est possible d''effectuer cette opération dans la méthode afterDispatchingRoute du controller, en appelant les méthodes :</p>\n\n<ul>\n	<li><strong>fromDispatcher </strong>qui construit les éléments du composant breadcrumbs à partir de l''url sollicitée</li>\n	<li>et <strong>jsSetContent </strong>qui affiche en javascript le contenu du composant</li>\n</ul>\n\n<pre>\n<code class="language-php">\n	public function afterExecuteRoute($dispatcher){\n		$bc=$this-&gt;jquery-&gt;bootstrap()-&gt;htmlPagination("page-10",1,3,NULL,2);\n		$bc-&gt;fromDispatcher($dispatcher);\n		$bc-&gt;jsSetContent($this-&gt;jquery);\n		$bc-&gt;autoGetOnClick("#div-content-10");\n		$this-&gt;jquery-&gt;compile($this-&gt;view);\n	}\n</code>\n</pre>\n', NULL, '$page=$this->jquery->bootstrap()->htmlPagination("page-10",1,3,NULL,2);\n$page->setUrlMask("pagination/client/%page%");\n$page->autoGetOnClick("#div-content-10");\necho $page->compile($this->jquery);\necho $this->jquery->bootstrap()->htmlAlert("div-content-10");', 26, 1, 10),
(111, 'Tailles', NULL, NULL, '$page=$this->jquery->bootstrap()->htmlPagination("page-4",1,5,2);\n$page->setSize("lg");\necho $page;\n$page->setSize("xs");\necho $page;\n$page->setSize("sm");\necho $page;', 26, 1, 4),
(112, 'Styles', NULL, NULL, '$bt=$this->jquery->bootstrap()->htmlButton("bt-2","Default");\necho $bt;\n$bt->setContent("Primary");\n$bt->setStyle("primary");\necho $bt;\n$bt->setContent("Info");\n$bt->setStyle("info");\necho $bt;\n$bt->setContent("Warning");\n$bt->setStyle("warning");\necho $bt;\n$bt->setContent("Danger");\n$bt->setStyle("danger");\necho $bt;', 1, 1, 2),
(113, 'blur', '<p>Correspond à la perte du focus</p>\n\n<p><input class="form-control" id="input-1" type="text" /></p>\n\n<div class="alert alert-info" id="message-1">&nbsp;</div>\n', NULL, '$this->jquery->blur("#input-1","$(''#message-1'').html(''blur'');");', 28, 1, 1),
(115, 'change', '<p>Correspond au changement du contenu du contrôle. Notez que le change ne se produit que sur perte de focus par l''élément modifié.</p>\n\n<p><input class="form-control" id="input-2" type="text" /></p>\n\n<div class="alert alert-info" id="message-2">&nbsp;</div>\n', NULL, '$this->jquery->change("#input-2","$(''#message-2'').html(''change'');");', 28, 1, 2),
(116, 'click', '<p>Correspond au click sur un élément.</p>\n\n<p id="p">Paragraphe à cliquer...</p>\n\n<div class="alert alert-info" id="message-3">&nbsp;</div>\n', NULL, '$this->jquery->click("#p","$(''#message-3'').append(''click '');");', 28, 1, 3),
(117, 'contextmenu', '<p>Correspond à l''affichage du menu contextuel&nbsp;sur un élément.</p>\n\n<p id="p4">Paragraphe à cliquer avec le bouton droit...</p>\n\n<div class="alert alert-info" id="message-4">&nbsp;</div>\n', NULL, '$this->jquery->contextmenu("#p4","$(''#message-4'').append(''contextmenu '');");', 28, 1, 4),
(118, 'addClass', '<p id="p">Ajoute une class css aux éléments HTML spécifiés.</p>\n\n<p>Dans l''appel de la méthode addClass, le 3ème paramètre (true) permet l''exécution immédiate du code.</p>\n', NULL, '$this->jquery->addClass("#p","alert alert-warning",true);', 29, 1, 1),
(119, 'append', '<p>Insère&nbsp;du contenu, spécifié par le paramètre, après chacun des éléments correspondants au sélecteur</p>\n\n<p><a class="btn btn-default" id="bt-append">Insérer</a></p>\n\n<ul id="identite">\n	<li id="1">&nbsp;Nom :&nbsp;</li>\n	<li id="2">&nbsp;Prénom :&nbsp;</li>\n</ul>\n', NULL, '$this->jquery->click("#bt-append",$this->jquery->append("#identite li","<input type=''text'' class=''form-control''>"));', 29, 1, 2),
(120, 'append', '<p>Ajoute du contenu a l''intérieur des éléments spécifiés.</p>\n', NULL, '$this->jquery->append("#to","<br>");', 29, 0, 3),
(121, 'attr', '<p>modifie la valeur de l''attribut HTML du premier élement correspondant</p>\n\n<p><input class="form-control" id="input" /></p>\n', NULL, '$this->jquery->attr("#input","value","Essai",true);', 29, 1, 4),
(122, 'json', '<div class="alert alert-info" id="ex1">\n<p><label id="id">id</label></p>\n\n<p><label id="name">name</label></p>\n</div>\n', NULL, '$this->jquery->json("json/json/1","get","{}",null,"id","$(''#ex1'')",true);', 30, 1, 1),
(123, 'jsonOn avec callback', '<p>La fonction de&nbsp;<strong>callback&nbsp;</strong>est utilisée ici pour modifier la progressbar bootstrap.</p>\n\n<p><a class="btn btn-primary btAjax" data-ajax="1">Client 1</a> <a class="btn btn-primary btAjax" data-ajax="2">Client 2</a> <a class="btn btn-primary btAjax" data-ajax="3">Client 3</a></p>\n\n<div class="alert alert-info" id="ex3"><input class="form-control" id="name" type="text" value="" />\n<div class="progress">\n<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="[[part]]" class="progress-bar progress-bar-striped active" id="pb2" role="progressbar" style="width: 1%">1%</div>\n</div>\n</div>\n', NULL, '$this->jquery->jsonOn("click",".btAjax","json/json",array("attr"=>"data-ajax","context"=>"$(''#ex3'')","jsCallback"=>"$(''#pb2'').css(''width'', data[''part'']+''%'').attr(''aria-valuenow'', data[''part'']).html(data[''part'']+''%'');"));', 30, 1, 3),
(124, 'jsonArray', '<p><a class="btn btn-primary" id="btJsonArray">Charger les clients</a> <a class="btn btn-primary" id="btShowMask">Afficher le masque</a></p>\n<script>$(''#btShowMask'').click(function() {$(''#repeat'').toggleClass(''hide'');});</script>\n\n<div class="alert alert-info" id="ex3">\n<div class="hide" id="repeat">\n<div class="row">\n<div class="col-xs-6 col-md-3"><a class="thumbnail" href="#"><img src="public/img/client/client[[id]].jpg" /> </a></div>\n\n<div class="col-xs-6 col-md-9"><input class="form-control" data-id="name" readonly="true" type="text" value="" />\n<div class="progress">\n<div aria-valuemax="100" aria-valuemin="0" aria-valuenow="[[part]]" class="progress-bar progress-bar-striped active" role="progressbar" style="width: [[part]]%">[[part]]%</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n', NULL, '$this->jquery->jsonArrayOn("click","#btJsonArray","#repeat", "json/jsonArray", array());', 30, 1, 4),
(125, 'jsonOn', '<p><a class="btn btn-primary btAjax2" data-ajax="1">Client 1</a> <a class="btn btn-primary btAjax2" data-ajax="2">Client 2</a></p>\n\n<div class="alert alert-info" id="ex2"><input class="form-control" id="name" type="text" value="" /></div>\n', NULL, '$this->jquery->jsonOn("click",".btAjax2","json/json",array("attr"=>"data-ajax","context"=>"$(''#ex2'')"));', 30, 1, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `rubrique`
--

INSERT INTO `rubrique` (`id`, `titre`, `description`, `idDomaine`, `ordre`) VALUES
(1, 'HtmlButton', '<p>Repr&eacute;sente un bouton <strong>Bootstrap</strong>.</p>\n', 3, 0),
(2, 'Configuration', '<p>D&eacute;finir l&#39;espace de nom <strong>Ajax</strong> dans le fichier <strong>loader.php</strong></p>\r\n\r\n<pre>\r\n<code class="language-php">\r\n$loader-&gt;registerNamespaces(array(\r\n        &#39;Ajax&#39; =&gt; __DIR__ . &#39;/../../app/vendor/jcheron/phalcon-jquery/Ajax/&#39;\r\n));</code></pre>\r\n', 1, 1),
(3, 'Pré-requis', '<h2>Injection du service</h2>\n\n<p>Il est nécessaire d''injecter le service JQuery au démarrage de l''application, et d''instancier Bootstrap :</p>\n\n<pre>\n<code class="language-php">\n$di-&gt;set("jquery",function(){\n    $jquery= new JsUtils(array("driver"=&gt;"Jquery"));\n    $jquery-&gt;bootstrap(new Bootstrap());//for Twitter Bootstrap\n    return $jquery;\n});\n</code></pre>\n', 2, 0),
(4, 'Injection du service', '<p>Injecter le service <strong>jquery</strong> via l&#39;objet <strong>$di</strong> :</p>\n\n<pre>\n<code class="language-php">\n$di-&gt;set(&quot;jquery&quot;,function(){\n    $jquery= new Ajax\\JsUtils(array(&quot;driver&quot;=&gt;&quot;Jquery&quot;));\n    return $jquery;\n});</code></pre>\n', 1, 2),
(5, 'Ajax get', '<p>Permet d&#39;effectuer une requ&ecirc;te ajax imm&eacute;diate (<strong>get</strong>), diff&eacute;r&eacute;e ou d&eacute;pendante (<strong>getDeferred</strong>) ou lanc&eacute;e depuis un &eacute;v&egrave;nement (<strong>getOn</strong>).</p>\n', 9, 0),
(6, 'HtmlGlyphButton', '<p>Bouton bootstrap associ&eacute; &agrave; un Glyphicon</p>\n', 7, 0),
(7, 'Ajax post', '<p>Permet d&#39;effectuer une requ&ecirc;te ajax imm&eacute;diate (<strong>post</strong>), diff&eacute;r&eacute;e ou d&eacute;pendante (<strong>postDeferred</strong>) ou lanc&eacute;e depuis un &eacute;v&egrave;nement (<strong>postOn</strong>).</p>\n', 10, 0),
(8, 'Utilisation', '<p>Exemple d''utilisation dans un contrôleur :&nbsp;requête ajax sur le click d''un bouton.</p>\n\n<pre>\n<code class="language-php">\nclass ClientController extends ControllerBase {\n\n	public function indexAction(){\n		$this-&gt;jquery-&gt;getOnClick("#btShow", "client/all","#divClients");\n		$this-&gt;view-&gt;setRenderLevel(View::LEVEL_MAIN_LAYOUT);\n		$this-&gt;jquery-&gt;compile($this-&gt;view);\n	}\n}\n</code></pre>\n', 1, 3),
(9, 'HtmlButtonGroups', '<p>Permet de créer un groupe de boutons</p>\n', 4, 0),
(10, 'Pré-requis', '<h2>1.1- Injection du service</h2>\n\n<p>Il est nécessaire d''injecter le service JQuery au démarrage de l''application, et d''instancier <b>jQueryUI</b> :</p>\n\n<pre>\n<code class="language-php">\n$di-&gt;set("jquery",function(){\n    $jquery= new JsUtils(array("driver"=&gt;"Jquery"));\n     $jquery-&gt;ui(new Ajax\\JqueryUI());//optional for JQuery UI\n    return $jquery;\n});\n</code></pre>\n', 5, 0),
(11, 'Button Dropdowns', '<p>Correspond au bouton <strong>Dropdowns</strong> Bootstrap</p>\n', 12, 0),
(12, 'HtmlSplitButton', '<p>Correspond au&nbsp;<strong>Split button dropdowns </strong>: le HtmlSplitButton hérite des fonctionnalités du <a class="menu" href="#" id="link-tab-12">HtmlDropdown</a>.</p>\n', 13, 0),
(13, 'HtmlCarousel', '<p>Carousel Bootstrap : permet de faire défiler des images</p>\n', 14, 0),
(14, 'HtmlInputGroup', NULL, 15, 0),
(15, 'HtmlModal', '<p>Représente une boîte de dialogue Bootstrap : composant <strong>Modal</strong></p>\n', 16, 0),
(16, 'HtmlAlert', '<p>Correspond au composant Bootstrap <strong>Alert</strong></p>\n', 17, 0),
(17, 'HtmlProgressbar', '<p><span style="font-family: ''Segoe UI'', Frutiger, ''Frutiger Linotype'', ''Dejavu Sans'', ''Helvetica Neue'', Arial, sans-serif; font-size: 14px; line-height: 20px;">Correspond au composant Bootstrap&nbsp;</span><strong style="box-sizing: border-box; font-family: ''Segoe UI'', Frutiger, ''Frutiger Linotype'', ''Dejavu Sans'', ''Helvetica Neue'', Arial, sans-serif; font-size: 14px; line-height: 20px;">Progressbar</strong></p>\n', 18, 0),
(18, 'HtmlTabs', '<p>Correspond au composant bootstrap <strong>Tabs</strong></p>\n', 19, 0),
(19, 'HtmlListGroup', '<p>Correspond au composant Bootstrap <strong>ListGroup</strong></p>\n', 20, 0),
(20, 'HtmlPanel', '<p>Correspond au composant Bootstrap <strong>Panel</strong></p>\n', 21, 0),
(21, 'Mise en oeuvre', NULL, 2, 0),
(22, 'HtmlNavbar', '<p>Correspond au composant Bootstrap <strong>Navbar</strong></p>\n', 22, 1),
(23, 'HtmlAccordion', '<p>Correspond au composant Bootstrap <strong>Accordion</strong></p>\n', 23, 1),
(25, 'HtmlBreadcrumbs', '<p>Correspond au composant bootstrap <strong>Breadcrumbs</strong></p>\n', 24, 1),
(26, 'HtmlPagination', '<p>Correspond au composant Bootstrap <strong>Pagination </strong></p>\n\n<p>voir&nbsp;<a href="http://getbootstrap.com/components/#pagination">http://getbootstrap.com/components/#pagination</a></p>\n', 25, 1),
(27, 'Ajax postForm', '<p>Permet d''effectuer l''envoi immédiat d''un formulaire via ajax (<strong>postForm</strong>), ou de manière différée ou dépendante (<strong>postFormDeferred</strong>) ou lancée depuis un évènement (<strong>postFormOn</strong>).</p>\n', 26, 1),
(28, 'Evènements javascript', NULL, 11, 1),
(29, 'Manipulation du DOM', '<p>Fonctions permettant de manipuler le DOM avec jQuery</p>\n', 27, 1),
(30, 'Ajax JSON', '<p>Fonctions Ajax permettant d''alimenter une vue à partir de données JSON</p>\n', 28, 1);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `exemple`
--
ALTER TABLE `exemple`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT pour la table `rubrique`
--
ALTER TABLE `rubrique`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
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

<?php

namespace Ajax\bootstrap\html;

use Phalcon\Mvc\View;
use Ajax\JsUtils;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\Controller;
use Ajax\common\html\BaseHtml;

/**
 * Twitter Bootstrap HTML Modal component
 * @author jc
 * @version 1.001
 */
class HtmlModal extends BaseHtml {
	protected $title="Titre de ma boîte";
	protected $content="";
	protected $buttons=array ();
	protected $showOnStartup=false;
	protected $draggable=false;
	protected $validCondition=NULL;
	protected $backdrop=true;

	/**
	 *
	 * @param string $identifier the id
	 */
	public function __construct($identifier, $title="", $content="", $buttonCaptions=array()) {
		parent::__construct($identifier);
		$this->_template=include 'templates/tplModal.php';
		$this->buttons=array ();
		$this->title=$title;
		$this->content=$content;
		foreach ( $buttonCaptions as $button ) {
			$this->addButton($button);
		}
	}

	/**
	 * Add a button
	 * @param string $value the button caption
	 * @param string $style one of "btn-default","btn-primary","btn-success","btn-info","btn-warning","btn-danger"
	 * @return HtmlButton
	 */
	public function addButton($value="Okay", $style="btn-primary") {
		$btn=new HtmlButton($this->identifier."-".$value);
		$btn->setStyle($style);
		$btn->setValue($value);
		$this->buttons []=$btn;
		return $btn;
	}

	/**
	 * Add a cancel button (dismiss)
	 * @param string $value
	 * @return HtmlButton
	 */
	public function addCancelButton($value="Annuler") {
		$btn=$this->addButton($value, "btn-default");
		$btn->setProperty("data-dismiss", "modal");
		return $btn;
	}

	/**
	 * Add an Okay button (close the box only if $(identifier).valid===true)
	 * @param string $value
	 * @return HtmlButton
	 */
	public function addOkayButton($value="Okay",$jsCode="") {
		$btn=$this->addButton($value, "btn-primary");
		$btn->onClick("if(".$this->getValidCondition()."){ ".$jsCode."$('#".$this->identifier."').modal('hide');}");
		return $btn;
	}

	protected function getDefaultValidCondition() {
		return "$('#".$this->identifier."').prop('valid')";
	}

	public function setValidCondition($js) {
		$this->validCondition=$js;
	}

	public function getValidCondition() {
		if ($this->validCondition==NULL) {
			return $this->getDefaultValidCondition();
		} else {
			return $this->validCondition;
		}
	}

	public function setValid() {
		$this->validCondition="1==1";
	}

	/**
	 * set the content of the modal
	 * @param string $content
	 */
	public function setContent($content) {
		$this->content=$content;
	}

	/**
	 * set the title of the modal
	 * @param string $title
	 */
	public function setTitle($title) {
		$this->title=$title;
	}

	/**
	 * render the content of an existing view : $controller/$action and set the response to the modal content
	 * @param View $view
	 * @param string $controller a Phalcon controller
	 * @param string $action a Phalcon action
	 * @param $params The parameters to pass to the view
	 */
	public function renderContent($view, $controller, $action, $params=NULL) {
		$template=$view->getRender($controller, $action, $params, function ($view) {
			$view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		});
		$this->content=$template;
	}

	/**
	 * render the content of $controller::$action and set the response to the modal content
	 * @param Controller $initialController
	 * @param string $controller a Phalcon controller
	 * @param string $action a Phalcon action
	 */
	public function forward($initialController,$controller,$action){
		$dispatcher = $initialController->dispatcher;
		$dispatcher->setControllerName($controller);
		$dispatcher->setActionName($action);
		$dispatcher->dispatch();
		$template=$initialController->view->getRender($dispatcher->getControllerName(), $dispatcher->getActionName(),$dispatcher->getParams(), function ($view) {
			$view->setRenderLevel(View::LEVEL_ACTION_VIEW);
		});
		$this->content=$template;
	}

	/*
	 * (non-PHPdoc)
	 * @see BaseHtml::run()
	 */
	public function run(JsUtils $js) {
		if($this->content instanceof BaseHtml){
			$this->content->run($js);
		}
		$this->_bsComponent=$js->bootstrap()->modal("#".$this->identifier, array (
				"show" => $this->showOnStartup
		));
		if ($this->draggable)
			$this->_bsComponent->setDraggable(true);
		$this->_bsComponent->setBackdrop($this->backdrop);
		$this->addEventsOnRun($js);
		return $this->_bsComponent;
	}

	public function getButton($index) {
		if (is_int($index))
			return $this->buttons [$index];
		else
			return $this->getElementById($index, $this->buttons);
	}

	public function showOnCreate() {
		$this->showOnStartup=true;
		return $this;
	}

	public function jsShow() {
		return "$('#{$this->identifier}').modal('show');";
	}

	public function jsHide() {
		return "$('#{$this->identifier}').modal('hide');";
	}

	public function jsGetContent(JsUtils $js, $url) {
		return $js->getDeferred($url, "#".$this->identifier." .modal-body");
	}

	public function jsSetTitle($title) {
		return "$('#".$this->identifier." .modal-title').html('".$title."');";
	}

	public function jsHideButton($index) {
		$btn=$this->getButton($index);
		if ($btn)
			return "$('#".$btn->getIdentifier()."').hide();";
	}

	/**
	 * Allow modal to be moved using the mouse.
	 * needs JQuery UI
	 * @param boolean $value
	 */
	public function setDraggable($value) {
		$this->draggable=$value;
		if ($value) {
			$this->backdrop=false;
		}
	}

	/**
	 * Includes a modal-backdrop element.
	 * Alternatively, specify static for a backdrop which doesn't close the modal on click.
	 * @param Boolean $value default : true
	 * @return HtmlModal
	 */
	public function setBackdrop($value) {
		return $this->backdrop=$value;
	}
}
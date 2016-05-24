<?php
class Exemple extends \Phalcon\Mvc\Model {

	/**
	 *
	 * @var integer
	 */
	protected $id;

	/**
	 *
	 * @var string
	 */
	protected $titre;

	/**
	 *
	 * @var string
	 */
	protected $description;

	/**
	 *
	 * @var string
	 */
	protected $header;

	/**
	 *
	 * @var string
	 */
	protected $php;

	/**
	 *
	 * @var integer
	 */
	protected $idRubrique;

	/**
	 *
	 * @var integer
	 */
	protected $execPHP;

	/**
	 *
	 * @var integer
	 */
	protected $ordre;

	/**
	 *
	 * @var integer
	 */
	protected $demo;

	/**
	 *
	 * @var string
	 */
	protected $css;

	/**
	 * Method to set the value of field id
	 *
	 * @param integer $id
	 * @return $this
	 */
	public function setId($id) {
		$this->id=$id;

		return $this;
	}

	/**
	 * Method to set the value of field php
	 *
	 * @param string $php
	 * @return $this
	 */
	public function setPhp($php) {
		$this->php=$php;

		return $this;
	}

	/**
	 * Method to set the value of field idRubrique
	 *
	 * @param integer $idRubrique
	 * @return $this
	 */
	public function setIdRubrique($idRubrique) {
		$this->idRubrique=$idRubrique;

		return $this;
	}

	/**
	 * Method to set the value of field execPHP
	 *
	 * @param integer $execPHP
	 * @return $this
	 */
	public function setExecPHP($execPHP) {
		$this->execPHP=$execPHP;

		return $this;
	}

	/**
	 * Returns the value of field id
	 *
	 * @return integer
	 */
	public function getId() {
		return $this->id;
	}

	/**
	 * Returns the value of field php
	 *
	 * @return string
	 */
	public function getPhp() {
		return $this->php;
	}

	/**
	 * Returns the value of field idRubrique
	 *
	 * @return integer
	 */
	public function getIdRubrique() {
		return $this->idRubrique;
	}

	/**
	 * Returns the value of field execPHP
	 *
	 * @return integer
	 */
	public function getExecPHP() {
		return $this->execPHP;
	}

	/**
	 * Returns table name mapped in the model.
	 *
	 * @return string
	 */
	public function getSource() {
		return 'exemple';
	}

	/**
	 * Initialize method for model.
	 */
	public function initialize() {
		$this->belongsTo('idRubrique', 'Rubrique', 'id', array ('alias' => 'Rubrique' ));
	}

	/**
	 * Allows to query a set of records that match the specified conditions
	 *
	 * @param mixed $parameters
	 * @return Exemple[]
	 */
	public static function find($parameters=null) {
		return parent::find($parameters);
	}

	/**
	 * Allows to query the first record that match the specified conditions
	 *
	 * @param mixed $parameters
	 * @return Exemple
	 */
	public static function findFirst($parameters=null) {
		return parent::findFirst($parameters);
	}

	public function getTitre() {
		return $this->titre;
	}

	public function setTitre($titre) {
		$this->titre=$titre;
		return $this;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setDescription($description) {
		$this->description=$description;
		return $this;
	}

	public function getHeader() {
		return $this->header;
	}

	public function setHeader($header) {
		$this->header=$header;
		return $this;
	}

	public function getOrdre() {
		return $this->ordre;
	}

	public function setOrdre($ordre) {
		$this->ordre=$ordre;
		return $this;
	}

	public function getDemo() {
		return $this->demo;
	}

	public function setDemo($demo) {
		$this->demo=$demo;
		return $this;
	}

	public function getCss() {
		return $this->css;
	}

	public function setCss($css) {
		$this->css=$css;
		return $this;
	}

}

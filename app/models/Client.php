<?php
class Client extends \Phalcon\Mvc\Model {
	
	/**
	 *
	 * @var integer
	 */
	protected $id;
	
	/**
	 *
	 * @var string
	 */
	protected $name;
	
	/**
	 *
	 * @var integer
	 */
	protected $part;
	protected $email;

	/**
	 * Returns table name mapped in the model.
	 *
	 * @return string
	 */
	public function getSource() {
		return 'client';
	}

	/**
	 * Allows to query a set of records that match the specified conditions
	 *
	 * @param mixed $parameters
	 * @return Client[]
	 */
	public static function find($parameters=null) {
		return parent::find($parameters);
	}

	/**
	 * Allows to query the first record that match the specified conditions
	 *
	 * @param mixed $parameters
	 * @return Client
	 */
	public static function findFirst($parameters=null) {
		return parent::findFirst($parameters);
	}

	public function getId() {
		return $this->id;
	}

	public function setId($id) {
		$this->id=$id;
		return $this;
	}

	public function getName() {
		return $this->name;
	}

	public function setName($name) {
		$this->name=$name;
		return $this;
	}

	public function toString() {
		return $this->name;
	}

	public function getPart() {
		return $this->part;
	}

	public function setPart($part) {
		$this->part=$part;
		return $this;
	}

	public function getEmail() {
		return $this->email;
	}

	public function setEmail($email) {
		$this->email=$email;
		return $this;
	}
}

<?php
use Phalcon\Mvc\Model\Validator\Email as Email;
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
	
	/**
	 *
	 * @var string
	 */
	protected $email;
	
	/**
	 *
	 * @var string
	 */
	protected $image;
	
	/**
	 *
	 * @var string
	 */
	protected $description;
	
	/**
	 *
	 * @var string
	 */
	protected $meta;
	
	/**
	 *
	 * @var integer
	 */
	protected $friends;
	
	/**
	 *
	 * @var integer
	 */
	protected $joined;

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
	 * Method to set the value of field name
	 *
	 * @param string $name
	 * @return $this
	 */
	public function setName($name) {
		$this->name=$name;
		
		return $this;
	}

	/**
	 * Method to set the value of field part
	 *
	 * @param integer $part
	 * @return $this
	 */
	public function setPart($part) {
		$this->part=$part;
		
		return $this;
	}

	/**
	 * Method to set the value of field email
	 *
	 * @param string $email
	 * @return $this
	 */
	public function setEmail($email) {
		$this->email=$email;
		
		return $this;
	}

	/**
	 * Method to set the value of field image
	 *
	 * @param string $image
	 * @return $this
	 */
	public function setImage($image) {
		$this->image=$image;
		
		return $this;
	}

	/**
	 * Method to set the value of field description
	 *
	 * @param string $description
	 * @return $this
	 */
	public function setDescription($description) {
		$this->description=$description;
		
		return $this;
	}

	/**
	 * Method to set the value of field meta
	 *
	 * @param string $meta
	 * @return $this
	 */
	public function setMeta($meta) {
		$this->meta=$meta;
		
		return $this;
	}

	/**
	 * Method to set the value of field friends
	 *
	 * @param integer $friends
	 * @return $this
	 */
	public function setFriends($friends) {
		$this->friends=$friends;
		
		return $this;
	}

	/**
	 * Method to set the value of field joined
	 *
	 * @param integer $joined
	 * @return $this
	 */
	public function setJoined($joined) {
		$this->joined=$joined;
		
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
	 * Returns the value of field name
	 *
	 * @return string
	 */
	public function getName() {
		return $this->name;
	}

	/**
	 * Returns the value of field part
	 *
	 * @return integer
	 */
	public function getPart() {
		return $this->part;
	}

	/**
	 * Returns the value of field email
	 *
	 * @return string
	 */
	public function getEmail() {
		return $this->email;
	}

	/**
	 * Returns the value of field image
	 *
	 * @return string
	 */
	public function getImage() {
		return $this->image;
	}

	/**
	 * Returns the value of field description
	 *
	 * @return string
	 */
	public function getDescription() {
		return $this->description;
	}

	/**
	 * Returns the value of field meta
	 *
	 * @return string
	 */
	public function getMeta() {
		return $this->meta;
	}

	/**
	 * Returns the value of field friends
	 *
	 * @return integer
	 */
	public function getFriends() {
		return $this->friends;
	}

	/**
	 * Returns the value of field joined
	 *
	 * @return integer
	 */
	public function getJoined() {
		return $this->joined;
	}

	/**
	 * Validations and business logic
	 *
	 * @return boolean
	 */
	public function validation() {
		$this->validate(new Email(array ('field' => 'email','required' => true )));
		
		if ($this->validationHasFailed() == true) {
			return false;
		}
		
		return true;
	}

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

	public function toString() {
		return $this->name;
	}
}

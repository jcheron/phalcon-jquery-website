<?php
class Countries extends \Phalcon\Mvc\Model {
	
	/**
	 *
	 * @var integer
	 */
	protected $id;
	
	/**
	 *
	 * @var string
	 */
	protected $countryCode;
	
	/**
	 *
	 * @var string
	 */
	protected $countryName;
	
	/**
	 *
	 * @var string
	 */
	protected $continentName;
	
	/**
	 *
	 * @var number
	 */
	protected $population;
	
	/**
	 *
	 * @var string
	 */
	protected $languages;
	protected $capital;

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
	 * Method to set the value of field countryCode
	 *
	 * @param string $countryCode
	 * @return $this
	 */
	public function setCountryCode($countryCode) {
		$this->countryCode=$countryCode;
		
		return $this;
	}

	/**
	 * Method to set the value of field countryName
	 *
	 * @param string $countryName
	 * @return $this
	 */
	public function setCountryName($countryName) {
		$this->countryName=$countryName;
		
		return $this;
	}

	/**
	 * Method to set the value of field continentName
	 *
	 * @param string $continentName
	 * @return $this
	 */
	public function setContinentName($continentName) {
		$this->continentName=$continentName;
		
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
	 * Returns the value of field countryCode
	 *
	 * @return string
	 */
	public function getCountryCode() {
		return $this->countryCode;
	}

	/**
	 * Returns the value of field countryName
	 *
	 * @return string
	 */
	public function getCountryName() {
		return $this->countryName;
	}

	/**
	 * Returns the value of field continentName
	 *
	 * @return string
	 */
	public function getContinentName() {
		return $this->continentName;
	}

	/**
	 * Returns table name mapped in the model.
	 *
	 * @return string
	 */
	public function getSource() {
		return 'countries';
	}

	/**
	 * Allows to query a set of records that match the specified conditions
	 *
	 * @param mixed $parameters
	 * @return Countries[]
	 */
	public static function find($parameters=null) {
		return parent::find($parameters);
	}

	/**
	 * Allows to query the first record that match the specified conditions
	 *
	 * @param mixed $parameters
	 * @return Countries
	 */
	public static function findFirst($parameters=null) {
		return parent::findFirst($parameters);
	}

	public function getPopulation() {
		return $this->population;
	}

	public function setPopulation($population) {
		$this->population=$population;
		return $this;
	}

	public function getLanguages() {
		return $this->languages;
	}

	public function setLanguages($languages) {
		$this->languages=$languages;
		return $this;
	}

	public function getCapital() {
		return $this->capital;
	}

	public function setCapital($capital) {
		$this->capital=$capital;
		return $this;
	}
}

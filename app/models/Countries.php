<?php

class Countries extends \Phalcon\Mvc\Model
{

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
    protected $currencyCode;

    /**
     *
     * @var string
     */
    protected $population;

    /**
     *
     * @var string
     */
    protected $fipsCode;

    /**
     *
     * @var string
     */
    protected $isoNumeric;

    /**
     *
     * @var string
     */
    protected $capital;

    /**
     *
     * @var string
     */
    protected $continentName;

    /**
     * Method to set the value of field id
     *
     * @param integer $id
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Method to set the value of field countryCode
     *
     * @param string $countryCode
     * @return $this
     */
    public function setCountryCode($countryCode)
    {
        $this->countryCode = $countryCode;

        return $this;
    }

    /**
     * Method to set the value of field countryName
     *
     * @param string $countryName
     * @return $this
     */
    public function setCountryName($countryName)
    {
        $this->countryName = $countryName;

        return $this;
    }

    /**
     * Method to set the value of field currencyCode
     *
     * @param string $currencyCode
     * @return $this
     */
    public function setCurrencyCode($currencyCode)
    {
        $this->currencyCode = $currencyCode;

        return $this;
    }

    /**
     * Method to set the value of field population
     *
     * @param string $population
     * @return $this
     */
    public function setPopulation($population)
    {
        $this->population = $population;

        return $this;
    }

    /**
     * Method to set the value of field fipsCode
     *
     * @param string $fipsCode
     * @return $this
     */
    public function setFipsCode($fipsCode)
    {
        $this->fipsCode = $fipsCode;

        return $this;
    }

    /**
     * Method to set the value of field isoNumeric
     *
     * @param string $isoNumeric
     * @return $this
     */
    public function setIsoNumeric($isoNumeric)
    {
        $this->isoNumeric = $isoNumeric;

        return $this;
    }

    /**
     * Method to set the value of field capital
     *
     * @param string $capital
     * @return $this
     */
    public function setCapital($capital)
    {
        $this->capital = $capital;

        return $this;
    }

    /**
     * Method to set the value of field continentName
     *
     * @param string $continentName
     * @return $this
     */
    public function setContinentName($continentName)
    {
        $this->continentName = $continentName;

        return $this;
    }

    /**
     * Returns the value of field id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns the value of field countryCode
     *
     * @return string
     */
    public function getCountryCode()
    {
        return $this->countryCode;
    }

    /**
     * Returns the value of field countryName
     *
     * @return string
     */
    public function getCountryName()
    {
        return $this->countryName;
    }

    /**
     * Returns the value of field currencyCode
     *
     * @return string
     */
    public function getCurrencyCode()
    {
        return $this->currencyCode;
    }

    /**
     * Returns the value of field population
     *
     * @return string
     */
    public function getPopulation()
    {
        return $this->population;
    }

    /**
     * Returns the value of field fipsCode
     *
     * @return string
     */
    public function getFipsCode()
    {
        return $this->fipsCode;
    }

    /**
     * Returns the value of field isoNumeric
     *
     * @return string
     */
    public function getIsoNumeric()
    {
        return $this->isoNumeric;
    }

    /**
     * Returns the value of field capital
     *
     * @return string
     */
    public function getCapital()
    {
        return $this->capital;
    }

    /**
     * Returns the value of field continentName
     *
     * @return string
     */
    public function getContinentName()
    {
        return $this->continentName;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'countries';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Countries[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Countries
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}

<?php

class Translation extends \Phalcon\Mvc\Model
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
    protected $name;

    /**
     *
     * @var integer
     */
    protected $idElement;

    /**
     *
     * @var string
     */
    protected $lang;

    /**
     *
     * @var string
     */
    protected $text;

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
     * Method to set the value of field name
     *
     * @param string $name
     * @return $this
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Method to set the value of field idElement
     *
     * @param integer $idElement
     * @return $this
     */
    public function setIdElement($idElement)
    {
        $this->idElement = $idElement;

        return $this;
    }

    /**
     * Method to set the value of field lang
     *
     * @param string $lang
     * @return $this
     */
    public function setLang($lang)
    {
        $this->lang = $lang;

        return $this;
    }

    /**
     * Method to set the value of field text
     *
     * @param string $text
     * @return $this
     */
    public function setText($text)
    {
        $this->text = $text;

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
     * Returns the value of field name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Returns the value of field idElement
     *
     * @return integer
     */
    public function getIdElement()
    {
        return $this->idElement;
    }

    /**
     * Returns the value of field lang
     *
     * @return string
     */
    public function getLang()
    {
        return $this->lang;
    }

    /**
     * Returns the value of field text
     *
     * @return string
     */
    public function getText()
    {
        return $this->text;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'translation';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Translation[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Translation
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}

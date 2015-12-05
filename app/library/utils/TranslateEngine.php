<?php
namespace utils;

use Phalcon\Text;
/**
 * Utilitaire de traduction
 * @author jc
 * @version 1.0.0.1
 * @package utils
 */
class TranslateEngine {
	private $translations;
	private $language="en";
	public static $languages=array("en"=>"English","fr"=>"Français");
	public function initialize($session,$force=false){
		if(!$session->has('translateEngine') || $force){
			$this->translations=\Translation::find("INSTR(lang,'".$this->language."')>0");
			$session->set('translateEngine', $this);
		}
	}
	public function translate($idElement,$key,$default){
		if(Text::startsWith($this->language, "en", true)){
			return $default;
		}
		$trans=$this->translations->filter(function($object) use ($idElement,$key){
			if( Text::startsWith($this->language, $object->getLang(), true) && $object->getIdElement()==$idElement && $object->getName()==$key){
				return $object;
			}
		});
		if(is_array($trans)){
			if(sizeof($trans)>0)
				$trans=$trans[0];
			else return $default;
		}
		if(is_a($trans,"Translation"))
			return $trans->getText();
		else return $default;
	}
	public function setRequest($request){
		if(!isset($this->language))
			$this->language=$request->getBestLanguage();
	}
	public function getLanguage() {
		return $this->language;
	}
	public function setLanguage($language,$session) {
		$this->language = $language;
		$this->initialize($session,true);
		return $this;
	}
	public function getTranslations() {
		return $this->translations;
	}
	
	
}
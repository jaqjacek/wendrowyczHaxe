<?php

// Generated by Haxe
class pl_jaqjacek_boardgames_wendrowycz_model_card_CardVO {
	public function __construct($p_name = null, $p_description = null, $p_type = null, $p_amount = null) {
		if(!php_Boot::$skip_constructor) {
		if($p_amount === null) {
			$p_amount = 1;
		}
		if($p_name === null) {
			$this->name = "unknown";
		} else {
			$this->name = $p_name;
		}
		if($p_description === null) {
			$this->description = "unknown";
		} else {
			$this->description = $p_description;
		}
		if($p_type === null) {
			$this->type = "unknown";
		} else {
			$this->type = $p_type;
		}
		$this->amount = $p_amount;
	}}
	public $description;
	public $name;
	public $type;
	public $amount;
	public function __call($m, $a) {
		if(isset($this->$m) && is_callable($this->$m))
			return call_user_func_array($this->$m, $a);
		else if(isset($this->__dynamics[$m]) && is_callable($this->__dynamics[$m]))
			return call_user_func_array($this->__dynamics[$m], $a);
		else if('toString' == $m)
			return $this->__toString();
		else
			throw new HException('Unable to call <'.$m.'>');
	}
	function __toString() { return 'pl.jaqjacek.boardgames.wendrowycz.model.card.CardVO'; }
}

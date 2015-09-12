package pl.jaqjacek.boardgames.wendrowycz.model;
import haxe.Json;

/**
 * ...
 * @author ...
 */
class RequestVO
{
	public var notification:String;
	public var data:String;
	
	public function new() 
	{
		
	}
	
	public function toString():String
	{
		return Json.stringify(this);
	}
	
}
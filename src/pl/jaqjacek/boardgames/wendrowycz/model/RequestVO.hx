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
	public var id:String;
	public var returnNotification:String;
	
	public function new() 
	{
		notification = '';
		data = '';
		id = '';
		returnNotification = '';
	}
	
	public function toString():String
	{
		return Json.stringify(this);
	}
	
}
package pl.jaqjacek.boardgames.wendrowycz.controller;

import haxe.Json;
import haxe.Log;
import openfl.errors.Error;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.net.URLRequestMethod;
import openfl.net.URLLoaderDataFormat;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.RequestVO;
import tjson.TJSON;

/**
 * ...
 * @author ...
 */
class ReadFromUrlCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var tmpURLRequest:URLRequest = new URLRequest(AppConsts.WWW_URL);
		tmpURLRequest.data = notification.getBody();
		tmpURLRequest.method = URLRequestMethod.POST;
		var tmpLoader:URLLoader = new URLLoader();
		tmpLoader.dataFormat = URLLoaderDataFormat.TEXT;
		tmpLoader.addEventListener(Event.COMPLETE, readCompleteHandler);
		tmpLoader.addEventListener(IOErrorEvent.IO_ERROR, readErrorHandler);
		tmpLoader.load(tmpURLRequest);
	}
	
	private function readErrorHandler(e:IOErrorEvent):Void 
	{
		Log.trace(e.text);
	}
	
	private function readCompleteHandler(e:Event):Void 
	{
		var tmpURLLoader:URLLoader = cast e.target;
		tmpURLLoader.dataFormat = URLLoaderDataFormat.TEXT;
		Log.trace(tmpURLLoader.data);
		var tmpString:String = cast tmpURLLoader.data;
		//var ereg:EReg = ~/\\t[0-9]*/g;
		//tmpString = ereg.replace(tmpString, "___");
		//Log.trace(tmpString);
		var tmpRequest:RequestVO = cast TJSON.parse(tmpString);
		facade.sendNotification(tmpRequest.notification, tmpRequest);
	}
	
}
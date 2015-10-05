package pl.jaqjacek.boardgames.wendrowycz.model;

import org.puremvc.haxe.patterns.proxy.Proxy;

/**
 * ...
 * @author ...
 */
class ScreenObjectProxy extends Proxy
{
	public static inline var NAME:String = 'ScreenObjectProxy_';
	public var screenObjects:Array<ScreenObjectVO>;
	
	public function new(?proxyName:String, ?data:Dynamic) 
	{
		proxyName = proxyName == null ? NAME : proxyName;
		super(proxyName, data);
		
	}
	
	override public function onRegister():Void 
	{
		screenObjects = [];
	}
	
	public function addObject(objectName:String) 
	{
		var tmpScreenObject:ScreenObjectVO = new ScreenObjectVO();
		tmpScreenObject.graphicsName = objectName;
		tmpScreenObject.init();
	}
	
}
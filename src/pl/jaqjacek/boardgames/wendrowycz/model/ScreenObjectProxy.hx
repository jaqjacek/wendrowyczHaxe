package pl.jaqjacek.boardgames.wendrowycz.model;

import org.puremvc.haxe.patterns.proxy.Proxy;

/**
 * ...
 * @author ...
 */
class ScreenObjectProxy extends Proxy
{
	public static inline var NAME:String = 'ScreenObjectProxy_';
	public var screenObjects:Array<ScreenObjectVOPool>;
	
	
	public function new(?proxyName:String, ?data:Dynamic) 
	{
		proxyName = proxyName == null ? NAME : proxyName;
		super(proxyName, data);
		
	}
	
	override public function onRegister():Void 
	{
		screenObjects = [];
	}
	
	public function addObject(graphicsName:String):ScreenObjectVOPool 
	{
		var tmpScreenObject:ScreenObjectVOPool = new ScreenObjectVOPool();
		tmpScreenObject.init(graphicsName);
		screenObjects.push(tmpScreenObject);
		return tmpScreenObject;
	}
	
	public function getScreenObject(graphicsName:String):ScreenObjectVO 
	{
		for (sop in screenObjects) 
		{
			if (sop.graphicsName == graphicsName && !sop.active) {
				return sop.getScreenObject();
			}
		}
		throw("NO ScreenObject of that name: " + graphicsName);
	}
	
}
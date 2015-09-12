package pl.jaqjacek.boardgames.wendrowycz;

import openfl.display.Sprite;
import org.puremvc.haxe.patterns.facade.Facade;
import pl.jaqjacek.boardgames.wendrowycz.controller.StartupCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;

/**
 * ...
 * @author ...
 */
class AppFacade extends Facade
{

	public function new() 
	{
		super();
		
	}
	
	override function initializeController():Void 
	{
		super.initializeController();
		registerCommand(AppNotifications.STARTUP, StartupCommand);
	}
	
	public function startup(mainMc:Sprite) 
	{
		this.sendNotification(AppNotifications.STARTUP, mainMc);
	}
	
	override public function sendNotification(notificationName:String, ?body:Dynamic, ?type:String):Void 
	{
		
		Log.info([sendNotification, notificationName, body, type]);
		super.sendNotification(notificationName, body, type);
	}
	
}
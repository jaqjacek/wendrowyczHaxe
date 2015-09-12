package pl.jaqjacek.boardgames.wendrowycz;

import org.puremvc.haxe.patterns.facade.Facade;
import pl.jaqjacek.boardgames.wendrowycz.controller.PHPStartupCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;

/**
 * ...
 * @author ...
 */
class PHPFacade extends Facade
{

	public function new() 
	{
		super();
		
	}
	
	override function initializeController():Void 
	{
		super.initializeController();
		registerCommand(AppNotifications.STARTUP, PHPStartupCommand);
	}
	
	public function startup() 
	{
		this.sendNotification(AppNotifications.STARTUP);
	}
	
	override public function sendNotification(notificationName:String, ?body:Dynamic, ?type:String):Void 
	{
		super.sendNotification(notificationName, body, type);
	}
	
}
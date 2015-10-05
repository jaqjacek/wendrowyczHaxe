package pl.jaqjacek.boardgames.wendrowycz;

import org.puremvc.haxe.patterns.facade.Facade;
import pl.jaqjacek.boardgames.wendrowycz.controller.PHPStartupCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;
import sys.io.File;
import sys.io.FileOutput;

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
		var tmpFile:FileOutput = File.append("log.txt", false);
	
		tmpFile.writeString(notificationName);
		tmpFile.writeString("\n");
		tmpFile.writeString(body);
		tmpFile.close();
				
		super.sendNotification(notificationName, body, type);
	}
	
}
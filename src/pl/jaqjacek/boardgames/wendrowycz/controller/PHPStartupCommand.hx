package pl.jaqjacek.boardgames.wendrowycz.controller;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.PHPNotifications;

/**
 * ...
 * @author ...
 */
class PHPStartupCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		facade.registerCommand(PHPNotifications.RAW_REQUEST, PHPHandleRequestCommand);
		facade.registerCommand(PHPNotifications.GET_FILE, PHPReadFileCommand);
		facade.registerCommand(PHPNotifications.SEND_RESPONSE, PHPHandleResponseCommand);
	}
	
}
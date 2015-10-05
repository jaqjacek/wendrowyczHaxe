package pl.jaqjacek.boardgames.wendrowycz.controller.debug;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.debug.DebugNotifications;

/**
 * ...
 * @author ...
 */
class DebugRegisterCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	//AppNotifications.ACTIVATE_DEBUG
	override public function execute(notification:INotification):Void 
	{
		facade.registerCommand(DebugNotifications.INIT_DEBUG, DebugInitCommand);
	}
	
}
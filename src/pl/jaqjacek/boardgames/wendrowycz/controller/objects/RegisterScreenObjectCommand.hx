package pl.jaqjacek.boardgames.wendrowycz.controller.objects;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectProxy;
import pl.jaqjacek.boardgames.wendrowycz.notifications.ScreenObjectNotification;

/**
 * ...
 * @author ...
 */
class RegisterScreenObjectCommand extends SimpleCommand
{
	public function new() 
	{
		super();
	}

	//ScreenObjectNotification.REGISTER_OBJECT;
	override public function execute(notification:INotification):Void 
	{
		var nName:String = notification.getName();
		var nBody:Dynamic = notification.getBody();
		var proxy:ScreenObjectProxy = cast facade.retrieveProxy(ScreenObjectProxy.NAME);
		proxy.addObject(cast nBody);
	}
	
}
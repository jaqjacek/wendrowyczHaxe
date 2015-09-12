package pl.jaqjacek.boardgames.wendrowycz.controller;

import haxe.Json;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.RequestVO;

/**
 * ...
 * @author ...
 */
class PHPHandleRequestCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var tmpRequest:RequestVO = cast Json.parse(cast notification.getBody());
		facade.sendNotification(tmpRequest.notification, tmpRequest);
	}
	
}
package pl.jaqjacek.boardgames.wendrowycz.controller;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.RequestVO;
import pl.jaqjacek.boardgames.wendrowycz.notifications.PHPNotifications;
import sys.io.File;

/**
 * ...
 * @author ...
 */
class PHPReadFileCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var tmpRequestVO:RequestVO = cast notification.getBody();
		var tmpFile:String = File.getContent(tmpRequestVO.data);
		facade.sendNotification(PHPNotifications.SEND_RESPONSE, tmpFile);
		
	}
	
}
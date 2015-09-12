package pl.jaqjacek.boardgames.wendrowycz.controller;

import org.puremvc.haxe.interfaces.ICommand;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.MacroCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.RequestVO;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.CardNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.PHPNotifications;

/**
 * ...
 * @author ...
 */
class StartupCommand extends MacroCommand
{

	public function new() 
	{
		super();
		
	}
	
	override function initializeMacroCommand():Void 
	{
		this.addSubCommand(CommandsRegisterCommand);
		this.addSubCommand(ProxyRegisterCommand);
		//super.initializeMacroCommand();
	}
	
	override public function execute(notification:INotification):Void 
	{
		super.execute(notification);
		//facade.sendNotification(CardNotifications.RAW_LOAD_CARD_COMMAND);
		var tmpRequest:RequestVO = new RequestVO();
		tmpRequest.notification = PHPNotifications.GET_FILE;
		tmpRequest.data = 'rawCards.tsv';
		facade.sendNotification(AppNotifications.READ_FROM_URL,tmpRequest);
	}
	
	
	
}
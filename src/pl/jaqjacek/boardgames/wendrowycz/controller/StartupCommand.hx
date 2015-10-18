package pl.jaqjacek.boardgames.wendrowycz.controller;

import org.puremvc.haxe.interfaces.ICommand;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.MacroCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.RequestVO;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.CardNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.debug.DebugNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.PHPNotifications;
import tjson.TJSON;

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
		//var tmpRequest:RequestVO = new RequestVO();
		//tmpRequest.notification = PHPNotifications.GET_FILE;
		//tmpRequest.returnNotification = CardNotifications.RAW_LOAD_CARD_COMMAND;
		//tmpRequest.id = 'ii';
		//tmpRequest.data = 'rawCards.tsv';
		//facade.sendNotification(AppNotifications.READ_FROM_URL, TJSON.encode(tmpRequest));
		
		facade.sendNotification(AppNotifications.ACTIVATE_DEBUG);
		facade.sendNotification(DebugNotifications.INIT_DEBUG);
		
		facade.sendNotification(AppNotifications.SHOW_BACKGROUND,"background1.jpg");
	}
	
	
	
}
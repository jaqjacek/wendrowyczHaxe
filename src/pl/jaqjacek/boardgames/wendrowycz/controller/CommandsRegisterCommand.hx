package pl.jaqjacek.boardgames.wendrowycz.controller;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.card.AddCardToProxyCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.card.RAWLineToCardConvertCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.card.RAWLoadCardsCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.CardNotifications;

/**
 * ...
 * @author ...
 */
class CommandsRegisterCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		facade.registerCommand(CardNotifications.RAW_LOAD_CARD_COMMAND, RAWLoadCardsCommand);
		facade.registerCommand(CardNotifications.RAW_LINE_TO_CARD_CONVERT_COMMAND, RAWLineToCardConvertCommand);
		facade.registerCommand(CardNotifications.ADD_CARD_COMMAND, AddCardToProxyCommand);
		
		//url
		facade.registerCommand(AppNotifications.READ_FROM_URL, ReadFromUrlCommand);
	}
	
}
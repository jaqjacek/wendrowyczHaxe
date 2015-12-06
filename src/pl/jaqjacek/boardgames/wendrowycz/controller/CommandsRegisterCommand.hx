package pl.jaqjacek.boardgames.wendrowycz.controller;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.background.ShowBackgroundCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.card.AddCardToProxyCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.card.RAWLineToCardConvertCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.card.RAWLoadCardsCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.debug.DebugRegisterCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.menu.InitMenuCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.menu.ShowMenuCommand;
import pl.jaqjacek.boardgames.wendrowycz.controller.objects.RegisterScreenObjectCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.CardNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.MenuNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.ScreenObjectNotification;

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
		
		//debug
		facade.registerCommand(AppNotifications.READ_FROM_URL, ReadFromUrlCommand);
		facade.registerCommand(AppNotifications.ACTIVATE_DEBUG, DebugRegisterCommand);
		
		//screenObjects
		facade.registerCommand(ScreenObjectNotification.REGISTER_OBJECT, RegisterScreenObjectCommand);
		
		//background
		facade.registerCommand(AppNotifications.SHOW_BACKGROUND, ShowBackgroundCommand);
		
		//menu
		facade.registerCommand(MenuNotifications.INIT_MENU, InitMenuCommand);
		facade.registerCommand(MenuNotifications.SHOW_MENU, ShowMenuCommand);
	}
	
}
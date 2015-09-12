package pl.jaqjacek.boardgames.wendrowycz.controller.card;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.card.CardProxy;
import pl.jaqjacek.boardgames.wendrowycz.model.card.CardVO;
import pl.jaqjacek.boardgames.wendrowycz.notifications.CardNotifications;

/**
 * ...
 * @author ...
 */
class AddCardToProxyCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		CardNotifications.ADD_CARD_COMMAND;
		var nName:String = notification.getName();
		var nBody:Dynamic = notification.getBody();
		var tmpCardVO:CardVO = cast nBody;
		var proxy:CardProxy = cast facade.retrieveProxy(CardProxy.NAME);
		proxy.addCard(tmpCardVO);
	}
	
}
package pl.jaqjacek.boardgames.wendrowycz.controller.card;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.card.CardVO;
import pl.jaqjacek.boardgames.wendrowycz.notifications.CardNotifications;

/**
 * ...
 * @author ...
 */
class RAWLineToCardConvertCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		CardNotifications.RAW_LINE_TO_CARD_CONVERT_COMMAND;
		var nName:String = notification.getName();
		var nBody:Dynamic = notification.getBody();
		var rawLine:String = cast nBody;
		var lineElements:Array<String> = rawLine.split("\t");
		var tmpCardVO:CardVO = new CardVO();
		tmpCardVO.name = lineElements[0];
		tmpCardVO.amount = Std.parseInt(lineElements[1]);
		tmpCardVO.type = lineElements[2];
		tmpCardVO.description = lineElements[3];
		facade.sendNotification(CardNotifications.ADD_CARD_COMMAND, tmpCardVO);
	}
	
}
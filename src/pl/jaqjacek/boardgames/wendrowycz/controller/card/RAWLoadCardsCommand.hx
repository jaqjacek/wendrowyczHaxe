package pl.jaqjacek.boardgames.wendrowycz.controller.card;

import openfl.Assets;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.CardNotifications;

/**
 * ...
 * @author ...
 */
class RAWLoadCardsCommand extends SimpleCommand
{
	static public inline var DEFAULT_RAW_CARDS_FILE_NAME:String = "rawCards.tsv";
	
	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var fileName:String = notification.getBody() == null ? DEFAULT_RAW_CARDS_FILE_NAME:cast notification.getBody();
		Log.debug( "fileName : " + fileName );
		var rawString:String =  Assets.getText(fileName);
		var lines:Array<String> = rawString.split("\n");
		for (i in 0...lines.length) 
		{
			facade.sendNotification(CardNotifications.RAW_LINE_TO_CARD_CONVERT_COMMAND, lines[i]);
		}
		
	}
	
	
}
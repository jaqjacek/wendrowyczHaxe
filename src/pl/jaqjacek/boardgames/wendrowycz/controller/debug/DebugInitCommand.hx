package pl.jaqjacek.boardgames.wendrowycz.controller.debug;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pgr.dconsole.DC;
import pl.jaqjacek.boardgames.wendrowycz.model.RequestVO;
import pl.jaqjacek.boardgames.wendrowycz.notifications.AppNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.CardNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.debug.DebugNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.PHPNotifications;
import pl.jaqjacek.boardgames.wendrowycz.notifications.ScreenObjectNotification;
import tjson.TJSON;

/**
 * ...
 * @author ...
 */
class DebugInitCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	//DebugNotifications.INIT_DEBUG
	override public function execute(notification:INotification):Void 
	{
		Log.debug( "DebugInitCommand.execute > notification : " + notification );
		DC.init();
		DC.registerFunction(addScreenObject, "addScreenObject", "register screenObject to proxy, prameter is object file path");
		DC.registerFunction(loadRawCards, "loadRawCards", "loadRawCards from server from gived fileName default: ");
	}
	
	function addScreenObject(objectPath:String) 
	{
		facade.sendNotification(ScreenObjectNotification.REGISTER_OBJECT, objectPath);
	}
	
	function loadRawCards(cardFileName:String = 'rawCards.tsv') 
	{
		var tmpRequest:RequestVO = new RequestVO();
		tmpRequest.notification = PHPNotifications.GET_FILE;
		tmpRequest.returnNotification = CardNotifications.RAW_LOAD_CARD_COMMAND;
		tmpRequest.id = 'debugLoadCard';
		tmpRequest.data = cardFileName;
		facade.sendNotification(AppNotifications.READ_FROM_URL, TJSON.encode(tmpRequest));
	}
	
}
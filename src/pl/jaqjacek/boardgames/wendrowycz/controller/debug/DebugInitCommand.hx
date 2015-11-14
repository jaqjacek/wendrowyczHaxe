package pl.jaqjacek.boardgames.wendrowycz.controller.debug;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pgr.dconsole.DC;
import pl.jaqjacek.boardgames.wendrowycz.model.BoardElementFactory;
import pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO;
import pl.jaqjacek.boardgames.wendrowycz.model.RequestVO;
import pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectProxy;
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
		DC.init();
		DC.registerFunction(addScreenObject, "addScreenObject", "register screenObject to proxy, prameter is object file path");
		DC.registerFunction(loadRawCards, "loadRawCards", "loadRawCards from server from gived fileName default: ");
		DC.registerFunction(showBackground, "showBackground", "showBackground from parameter ");
		DC.registerFunction(showScreenObject, "showScreenObject", "showScreenObject ");
		DC.registerFunction(createPlayer, "createPlayer", "creates random player and puts his elements on Screen ");
	}
	
	function createPlayer() 
	{
		var elements:Array<BoardElementVO> = [];
		for (i in  0...30) 
		{
			elements.push(BoardElementFactory.createPlayerPon(1, "bardak"));
			
		}
		
		for (i in  0...10) 
		{
			elements.push(BoardElementFactory.createPlayerPon(1, "ghost"));
			
		}
		
		for (i in  0...10) 
		{
			elements.push(BoardElementFactory.createPlayerPon(1, "vamp"));
			
		}
		
		for (i in  0...10) 
		{
			elements.push(BoardElementFactory.createPlayerPon(1, "werewolf"));
			
		}
		
		for (elem in elements) 
		{
			elem.onBoard = true;
			elem.x = Math.random() * 400 + 100;
			elem.y = Math.random() * 500 + 100;
			elem.screenObject.init();
		}
		
		for (so in elements) 
		{
			so.updateToBoard();
			Containers.getGame().addChild(so.screenObject);
		}
	}
	
	function showScreenObject() 
	{
		var proxy:ScreenObjectProxy = cast facade.retrieveProxy(ScreenObjectProxy.NAME);
		proxy.addObject('vamp3.jpg');
		Containers.getGame().addChild(proxy.getScreenObject('vamp3.jpg'));
	}
	
	function showBackground(backgroundName:String='background1.jpg') 
	{
		facade.sendNotification(AppNotifications.SHOW_BACKGROUND, backgroundName);
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
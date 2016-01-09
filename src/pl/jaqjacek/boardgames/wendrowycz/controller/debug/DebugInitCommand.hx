package pl.jaqjacek.boardgames.wendrowycz.controller.debug;

import openfl.Assets;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pgr.dconsole.DC;
import pl.jaqjacek.boardgames.wendrowycz.model.BoardElementFactory;
import pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO;
import pl.jaqjacek.boardgames.wendrowycz.model.PlayerVO;
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
		DC.showConsole();
		DC.registerFunction(addScreenObject, "addScreenObject", "register screenObject to proxy, prameter is object file path");
		DC.registerFunction(loadRawCards, "loadRawCards", "loadRawCards from server from gived fileName default: ");
		DC.registerFunction(showBackground, "showBackground", "showBackground from parameter ");
		DC.registerFunction(showScreenObject, "showScreenObject", "showScreenObject ");
		DC.registerFunction(createPlayer, "cp", "creates random player and puts his elements on Screen ");
		DC.registerFunction(cratePlayerFromJSON, "jp", "createPlayer from json string");
		//createPlayer(1);
		cratePlayerFromJSON();
	}
	
	function createPlayer(playerNumber:Int=1) 
	{
		addScreenObject("bardak", "img/pon_bardak.png");
		addScreenObject("ghost","img/pon_ghost.png");
		addScreenObject("werewolf","img/pon_werewolf.png");
		addScreenObject("vampire","img/pon_vamp.png");
		addScreenObject("wendrowycz", "img/pon_wendrowycz.png");
		addScreenObject( "totem","img/pon_totem.png");
		addScreenObject("majdan","img/pon_home.png");
		var elements:Array<BoardElementVO> = [];
		for (i in  0...30) 
		{
			elements.push(BoardElementFactory.createPlayerPon(playerNumber, "bardak",facade));
			
		}
		
		for (i in  0...10) 
		{
			elements.push(BoardElementFactory.createPlayerPon(playerNumber, "ghost",facade));
			
		}
		
		for (i in  0...10) 
		{
			elements.push(BoardElementFactory.createPlayerPon(playerNumber, "vampire",facade));
			
		}
		
		for (i in  0...10) 
		{
			elements.push(BoardElementFactory.createPlayerPon(playerNumber, "werewolf",facade));
			
		}
		
		for (elem in elements) 
		{
			elem.onBoard = true;
			elem.x = Math.random() * 400 + 100;
			elem.y = Math.random() * 500 + 100;
		}
		
		for (so in elements) 
		{
			so.updateToBoard();
		}
		var tmpPlayer:PlayerVO = new PlayerVO();
		tmpPlayer.elements = elements;
		tmpPlayer.number = playerNumber;
		tmpPlayer.id = "tezt";
		var playerString:String = TJSON.encode(tmpPlayer,'fancy');
		trace(playerString);
	}
	
	function showScreenObject() 
	{
		var proxy:ScreenObjectProxy = cast facade.retrieveProxy(ScreenObjectProxy.NAME);
		proxy.addObject("vamp",'vamp3.jpg');
		Containers.getGame().addChild(proxy.getScreenObject('vamp3.jpg').getSprite());
	}
	
	function showBackground(backgroundName:String='background1.jpg') 
	{
		facade.sendNotification(AppNotifications.SHOW_BACKGROUND, backgroundName);
	}
	
	function addScreenObject(objectId:String,objectPath:String) 
	{
		facade.sendNotification(ScreenObjectNotification.REGISTER_OBJECT, [objectId,objectPath]);
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
	
	function cratePlayerFromJSON() 
	{
		addScreenObject("bardak", "img/pon_bardak.png");
		addScreenObject("ghost","img/pon_ghost.png");
		addScreenObject("werewolf","img/pon_werewolf.png");
		addScreenObject("vampire","img/pon_vamp.png");
		addScreenObject("wendrowycz", "img/pon_wendrowycz.png");
		addScreenObject( "totem","img/pon_totem.png");
		addScreenObject("majdan","img/pon_home.png");
		var tmpStr:String = '{
     "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.PlayerVO"
    ,"number" : 1
    ,"elements" : [
         {
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 149.21416379511356
            ,"y" : 428.5731778014451
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 217.5937244668603
            ,"y" : 153.91470505855978
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 350.6911227479577
            ,"y" : 441.7967895511538
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 198.29099979251623
            ,"y" : 383.5147110745311
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 494.16991882026196
            ,"y" : 125.7635060697794
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 356.7328779026866
            ,"y" : 335.82838103175163
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 181.67335111647844
            ,"y" : 555.8545257896185
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 183.6127083748579
            ,"y" : 392.09957644343376
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 134.444011002779
            ,"y" : 524.6864144224674
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 427.4594258517027
            ,"y" : 353.79420164972544
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 145.78132033348083
            ,"y" : 448.6221188213676
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 322.4683966487646
            ,"y" : 109.33278677985072
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 393.19200422614813
            ,"y" : 116.7595746461302
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 422.9272611439228
            ,"y" : 395.6520477309823
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 485.8023762702942
            ,"y" : 379.22281064093113
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 260.34908946603537
            ,"y" : 247.54366595298052
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 179.9598652869463
            ,"y" : 430.56082436814904
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 148.19249156862497
            ,"y" : 216.05595843866467
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 110.30853856354952
            ,"y" : 504.7718867659569
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 494.442187435925
            ,"y" : 486.9056417606771
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 479.0549859404564
            ,"y" : 427.8555830474943
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 341.8037274852395
            ,"y" : 407.46607342734933
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 493.29847395420074
            ,"y" : 272.4805261474103
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 352.5060350075364
            ,"y" : 429.9839776009321
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 271.717469394207
            ,"y" : 478.02888732403517
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 253.15517373383045
            ,"y" : 146.0368120111525
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 299.8052818700671
            ,"y" : 417.93781253509223
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 179.28472440689802
            ,"y" : 495.89141635224223
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 332.09113720804453
            ,"y" : 576.0341609362513
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 194.5236874744296
            ,"y" : 360.6160712894052
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_bardak.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_bardak"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 103.1953427940607
            ,"y" : 595.7571479026228
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 478.41555066406727
            ,"y" : 337.30926075950265
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 337.2638829052448
            ,"y" : 308.34000408649445
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 459.6080284565687
            ,"y" : 360.7056915294379
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 314.88019339740276
            ,"y" : 487.6578437630087
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 343.4418587014079
            ,"y" : 188.37214531376958
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 241.25300887972116
            ,"y" : 495.3039264306426
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 224.0585146471858
            ,"y" : 102.03675567172468
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 255.03135155886412
            ,"y" : 116.53607143089175
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 177.7049135416746
            ,"y" : 128.02365948446095
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_ghost.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_ghost"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 370.10490596294403
            ,"y" : 233.5988361388445
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 279.5671958476305
            ,"y" : 128.5900328308344
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 380.5512646213174
            ,"y" : 135.4572043288499
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 126.17845665663481
            ,"y" : 422.83706148155034
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 377.65002995729446
            ,"y" : 258.9927060995251
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 326.9753823056817
            ,"y" : 346.0491277743131
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 269.5902107283473
            ,"y" : 477.50010029412806
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 405.578769184649
            ,"y" : 172.77070614509284
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 422.13509008288383
            ,"y" : 271.9422284513712
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 112.93799560517073
            ,"y" : 324.75706855766475
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_vamp.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_vampire"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 137.241692841053
            ,"y" : 332.1670895908028
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 154.4543106108904
            ,"y" : 586.2978854216635
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 496.20585534721613
            ,"y" : 389.6706515457481
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 182.29133635759354
            ,"y" : 409.9860942456871
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 403.6748580634594
            ,"y" : 202.2061686962843
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 323.12071621418
            ,"y" : 389.9228688329458
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 197.3769299685955
            ,"y" : 112.21943809650838
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 104.4028589501977
            ,"y" : 495.54398669861257
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 330.04440031945705
            ,"y" : 147.19491209834814
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
        ,{
             "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO"
            ,"onBoard" : true
            ,"x" : 270.44225074350834
            ,"y" : 557.5725079048425
            ,"screenObject" : {
                 "_hxcls" : "pl.jaqjacek.boardgames.wendrowycz.model.ScreenObjectVO"
                ,"maxWidth" : 50
                ,"active" : true
                ,"maxHeight" : 50
                ,"id" : null
                ,"graphicsPath" : "img/pon_werewolf.png"
            }
            ,"owner" : "player_1"
            ,"id" : "player_1_werewolf"
            ,"ownerOld" : "none"
        }
    ]
    ,"id" : "tezt"}';

		var tmpPlayer:PlayerVO = cast TJSON.parse(tmpStr);
		trace(tmpPlayer.elements.length);
		for (so in tmpPlayer.elements) {
			
			so.updateToBoard();
		}
	}
}
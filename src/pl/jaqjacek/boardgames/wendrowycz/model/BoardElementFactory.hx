package pl.jaqjacek.boardgames.wendrowycz.model;
import haxe.Log;
import org.puremvc.haxe.interfaces.IFacade;
import pl.jaqjacek.boardgames.wendrowycz.AppFacade;

/**
 * ...
 * @author ...
 */
class BoardElementFactory
{

	static public function createPlayerPon(playerNumber:Int=1,ponType:String='bardak',facade:IFacade):BoardElementVO
	{
		var proxy:ScreenObjectProxy = cast facade.retrieveProxy(ScreenObjectProxy.NAME);
		var tmpPon:BoardElementVO = new BoardElementVO();
		tmpPon.owner = "player_" + Std.string(playerNumber);		
		tmpPon.id = tmpPon.owner + "_" + ponType;
		
		var tmpScreenObject:ScreenObjectVO = proxy.getScreenObject(ponType);
		tmpScreenObject.setSize(50, 50);
		tmpPon.setScreenObject(tmpScreenObject);	
		addPlayerPonColor(playerNumber, tmpScreenObject);
		return tmpPon;
	}
	
	static public function addPlayerPonColor(playerNumber:Int = 1, screenObject:ScreenObjectVO)
	{
		var tmpColor:UInt = 0x000000;
		switch (playerNumber) 
		{
			case 1:
				tmpColor = 0xff0000;
			case 2:
				tmpColor = 0xffFF00;
			case 3:
				tmpColor = 0x00ff00;
			case 4:
				tmpColor = 0xff00ff;
			default:
				
		}
		
		screenObject.graphics.clear();
		screenObject.graphics.beginFill(tmpColor, 1);
		var borderWidth:Float = 3;
		Log.trace([screenObject.maxWidth, screenObject.height]);
		screenObject.graphics.drawRect( -borderWidth, -borderWidth, screenObject.maxWidth + borderWidth*2, screenObject.maxHeight + borderWidth*2);
	}
}
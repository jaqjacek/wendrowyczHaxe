package pl.jaqjacek.boardgames.wendrowycz.model;
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
		
		var tmpScreenObject:ScreenObjectVO = proxy.getScreenObject("pon_" + ponType+".png");
		tmpScreenObject.setSize(50, 50);
		tmpPon.setScreenObject(tmpScreenObject);
		return tmpPon;
	}
}
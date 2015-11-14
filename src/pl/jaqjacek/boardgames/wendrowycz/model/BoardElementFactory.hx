package pl.jaqjacek.boardgames.wendrowycz.model;

/**
 * ...
 * @author ...
 */
class BoardElementFactory
{

	static public function createPlayerPon(playerNumber:Int=1,ponType:String='bardak'):BoardElementVO
	{
		var tmpPon:BoardElementVO = new BoardElementVO();
		tmpPon.owner = "player_" + Std.string(playerNumber);		
		tmpPon.id = tmpPon.owner + "_" + ponType;
		
		tmpPon.screenObject = new ScreenObjectVO();
		tmpPon.screenObject.graphicsName = "pon_" + ponType+".png";
		tmpPon.screenObject.setSize(50, 50);
		return tmpPon;
	}
}
package pl.jaqjacek.boardgames.wendrowycz.model;
import pl.jaqjacek.boardgames.wendrowycz.model.BoardElementVO;

/**
 * ...
 * @author ...
 */
class BoardElementVO
{
	
	public var x:Float;	
	public var y:Float;	
	
	public var owner:String;
	public var ownerOld:String;
	
	public var onBoard:Bool;
	
	public var id:String;
	
	private var screenObject:ScreenObjectVO;
	
	public function setScreenObject(so:ScreenObjectVO) 
	{
		screenObject = so;
	}
	
	public function new() 
	{
		x = 0;
		y = 0;
		owner = 'none';
		ownerOld = 'none';
		onBoard = false;
		id = "";
	}
	
	public function updateFromBoard() 
	{
		x = screenObject.getSprite().x;
		y = screenObject.getSprite().y;
		screenObject.active = true;
	}
	
	public function updateToBoard() 
	{
		screenObject.getSprite().x = x;
		screenObject.getSprite().y = y;
		screenObject.active = true;
	}

}
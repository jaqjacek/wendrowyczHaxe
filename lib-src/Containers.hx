package;
import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class Containers
{
	static private var mainContainer:Sprite;
	
	static public var instance:Containers;
	
	
	
	public function new() 
	{
		
	}
	
	static public function init(mainContainer:Sprite) 
	{
		Containers.mainContainer = mainContainer;
		for (i in 0...10) 
		{
			mainContainer.addChild(new Sprite());
		}
	}
	
	static public function getBackground():Sprite 
	{
		return cast mainContainer.getChildAt(0);
	}
	
	static public function getGame():Sprite 
	{
		return cast mainContainer.getChildAt(4);
	}
	
	static public function getHUD():Sprite 
	{
		return cast mainContainer.getChildAt(9);
	}
	
}
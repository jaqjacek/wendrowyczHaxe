package pl.jaqjacek.boardgames.wendrowycz.model;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class ScreenObjectVO extends Sprite
{
	public var graphicsName:String;
	
	public function new() 
	{
		super();
	}
	
	public function init() 
	{
		while (numChildren > 0) {
			removeChildAt(0);
		}
		
		addChild(new Bitmap(Assets.getBitmapData(graphicsName)));
	}
	
}
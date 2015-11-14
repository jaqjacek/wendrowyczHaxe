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
	var maxWidth:Float;
	var maxHeight:Float;
	
	public var graphicsName:String;
	
	public function setSize(maxWidth:Float,maxHeight:Float) 
	{
		this.maxHeight = maxHeight;
		this.maxWidth = maxWidth;
	}
	
	public function new() 
	{
		super();
	}
	
	public function init() 
	{
		while (numChildren > 0) {
			removeChildAt(0);
		}
		
		addChild(new Bitmap(Assets.getBitmapData('img/' + graphicsName)));
		this.width = maxWidth > 0 ? maxWidth:this.width;
		this.height = maxHeight > 0 ? maxHeight:this.height;
	}
	
}
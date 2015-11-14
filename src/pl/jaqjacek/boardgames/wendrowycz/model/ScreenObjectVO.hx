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
	public var active(default, set):Bool;
	public var graphicsName:String;
	
	function set_active(newActive:Bool) 
	{
		if (newActive == false) {
			if (parent != null) {
				parent.removeChild(this);
			}
		}
		else {
			if (parent  == null) {
				this.init();
				Containers.getGame().addChild(this);
			}
		}
		return active = newActive;
	}
	
	public function setSize(maxWidth:Float,maxHeight:Float) 
	{
		this.maxHeight = maxHeight;
		this.maxWidth = maxWidth;
	}
	
	public function new() 
	{
		super();
	}
	
	public function init(graphicsName:String='') 
	{
		if (graphicsName != '') {
			this.graphicsName = graphicsName;
		}
		while (numChildren > 0) {
			removeChildAt(0);
		}
		
		addChild(new Bitmap(Assets.getBitmapData('img/' + this.graphicsName)));
		this.width = maxWidth > 0 ? maxWidth:this.width;
		this.height = maxHeight > 0 ? maxHeight:this.height;
	}
	
	public function getScreenObject(objectName:String='') :ScreenObjectVO
	{
		return this;
	}
	
	
}
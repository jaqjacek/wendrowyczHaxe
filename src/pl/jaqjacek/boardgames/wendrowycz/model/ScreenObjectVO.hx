package pl.jaqjacek.boardgames.wendrowycz.model;
import haxe.Log;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class ScreenObjectVO extends Sprite
{
	public var maxWidth:Float;
	public var maxHeight:Float;
	
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
		update();
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
		update();
	}
	
	public function update() 
	{	
		if (this.numChildren ==0) {
			return;
		}
		var child:DisplayObject = this.getChildAt(0);
		
		if (maxWidth > 0)  {
			child.width = maxWidth;
		}
		if (maxHeight > 0)  {
			child.height = maxHeight;
		}
	}
	
	public function getScreenObject(objectName:String='') :ScreenObjectVO
	{
		return this;
	}
	
	
}
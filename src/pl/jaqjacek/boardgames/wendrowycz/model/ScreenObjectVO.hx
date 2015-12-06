package pl.jaqjacek.boardgames.wendrowycz.model;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

/**
 * ...
 * @author ...
 */
class ScreenObjectVO
{
	public var maxWidth:Float;
	public var maxHeight:Float;
	
	public var active(default, set):Bool;
	public var graphicsPath:String;
	public var id:String;
	var _sprite:Sprite;
	
	public function getSprite():Sprite 
	{
		_sprite = _sprite == null ? new Sprite() : _sprite;
		return _sprite;
	}
	
	function set_active(newActive:Bool) 
	{
		if (newActive == false) {
			if (_sprite.parent != null) {
				_sprite.parent.removeChild(_sprite);
			}
		}
		else {
			if (_sprite.parent  == null) {
				this.init();
				Containers.getGame().addChild(_sprite);
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
		_sprite = new Sprite();
	}
	
	public function init(graphicsName:String='') 
	{
		if (graphicsName != '') {
			this.graphicsPath = graphicsName;
		}
		while (_sprite.numChildren > 0) {
			_sprite.removeChildAt(0);
		}
		_sprite.addChild(new Bitmap(Assets.getBitmapData(this.graphicsPath)));
		update();
	}
	
	public function update() 
	{	
		if (_sprite.numChildren ==0) {
			return;
		}
		var child:DisplayObject = _sprite.getChildAt(0);
		
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
	
	public function TJ_noEncode():Array<String>{
		return ['_sprite'];
	}
	
	
}
package pl.jaqjacek.boardgames.wendrowycz.model;

/**
 * ...
 * @author ...
 */
class ScreenObjectVOPool extends ScreenObjectVO
{
	var _screenObjects:Array<ScreenObjectVO>;
	
	public function new() 
	{
		_screenObjects = [];
		super();
	}
	
	override public function init(graphicsName:String='') 
	{
		this.graphicsPath = graphicsName;
		for (i in 0...10) 
		{
			addObject();
		}
		
	}
	
	function addObject():ScreenObjectVO 
	{
		var tmpScreenObject:ScreenObjectVO = new ScreenObjectVO();
		tmpScreenObject.init(graphicsPath);
		_screenObjects.push(tmpScreenObject);
		return tmpScreenObject;
	}
	
	override public function getScreenObject(objectName:String='') :ScreenObjectVO
	{
		for (so in _screenObjects) 
		{
			if (so.active) {
				return so;
			}
		}
		return addObject();
	}
	
}
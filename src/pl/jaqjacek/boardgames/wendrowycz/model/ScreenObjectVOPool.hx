package pl.jaqjacek.boardgames.wendrowycz.model;

/**
 * ...
 * @author ...
 */
class ScreenObjectVOPool
{
	var _screenObjects:Array<ScreenObjectVO>;
	public var graphicsName:String;
	
	public function new() 
	{
		_screenObjects = [];
	}
	
	public function init(graphicsName:String) 
	{
		this.graphicsName = graphicsName;
		for (i in 0...10) 
		{
			addObject();
		}
		
	}
	
	function addObject():ScreenObjectVO 
	{
		var tmpScreenObject:ScreenObjectVO = new ScreenObjectVO();
		tmpScreenObject.graphicsName = graphicsName;
		tmpScreenObject.init();
		_screenObjects.push(tmpScreenObject);
		return tmpScreenObject;
	}
	
	public function getScreenObject():ScreenObjectVO
	{
		for (so in _screenObjects) 
		{
			if (so.parent != null) {
				return so;
			}
		}
		return addObject();
	}
	
}
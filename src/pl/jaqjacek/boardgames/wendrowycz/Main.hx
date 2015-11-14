package pl.jaqjacek.boardgames.wendrowycz;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.Assets;

/**
 * ...
 * @author jaq
 */

class Main extends Sprite 
{

	public function new() 
	{
		super();
		// Assets:
		 //openfl.Assets.getBitmapData("img/assetname.jpg");
		 Containers.init(this);
		 var tmpFacade:AppFacade = new AppFacade();
		 
		 tmpFacade.startup(this);
	}
}

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
		Log.initFD();
		// Assets:
		 //openfl.Assets.getBitmapData("img/assetname.jpg");
		 var bitmap:Bitmap = new Bitmap(Assets.getBitmapData("img/bardak.jpg"));
		 this.addChild(bitmap);
		 var tmpFacade:AppFacade = new AppFacade();
		 tmpFacade.startup(this);
	}
}

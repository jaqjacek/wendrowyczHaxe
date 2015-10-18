package pl.jaqjacek.boardgames.wendrowycz.controller.background;


import openfl.Assets;
import openfl.display.Bitmap;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;

/**
 * ...
 * @author ...
 */
class ShowBackgroundCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var nName:String = notification.getName();
		var nBody:String = cast notification.getBody();
		var tmpBitmap:Bitmap = new Bitmap(Assets.getBitmapData("img/" + nBody));
		
		Containers.getBackground().addChild(tmpBitmap);
		Containers.getBackground().scaleX =  1200 / tmpBitmap.width;
		Containers.getBackground().scaleY = 800 / tmpBitmap.height;
	}
	
}
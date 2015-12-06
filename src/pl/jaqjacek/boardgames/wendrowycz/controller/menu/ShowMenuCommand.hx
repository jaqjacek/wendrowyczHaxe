package pl.jaqjacek.boardgames.wendrowycz.controller.menu;

import haxe.ui.toolkit.containers.HBox;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.controls.Text;
import haxe.ui.toolkit.core.interfaces.IDisplayObject;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.RootManager;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.themes.GradientTheme;
import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.notifications.PlayerNotifications;

/**
 * ...
 * @author jaq
 */
class ShowMenuCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		var root:Root = RootManager.instance.currentRoot;
		var view:IDisplayObject = Toolkit.processXmlResource("layouts/changePlayer.xml");
		root.addChild(view);
		root.height = 100;
		//root.sprite.graphics.clear();
		var text:Text = root.findChild("currentPlayer", Text, true);
		for (i in 1...5) 
		{
			var button:Button = root.findChild("player" + i, Button, true);
			button.addEventListener(UIEvent.CLICK, addEventsToButton);
		}
	}
	
	public function addEventsToButton(e:UIEvent) 
	{
		var text:Text = RootManager.instance.currentRoot.findChild("currentPlayer", Text, true);
		var currentPlayer:Int = Std.parseInt( e.component.id.substr(e.component.id.length - 1, 1));
		text.text = Std.string(currentPlayer);
		facade.sendNotification(PlayerNotifications.CHANGE_PLAYER, currentPlayer);
	}
	
}
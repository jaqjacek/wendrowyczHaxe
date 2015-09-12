package pl.jaqjacek.boardgames.wendrowycz.controller;

import org.puremvc.haxe.interfaces.INotification;
import org.puremvc.haxe.patterns.command.SimpleCommand;
import pl.jaqjacek.boardgames.wendrowycz.model.card.CardProxy;

/**
 * ...
 * @author ...
 */
class ProxyRegisterCommand extends SimpleCommand
{

	public function new() 
	{
		super();
	}
	
	override public function execute(notification:INotification):Void 
	{
		facade.registerProxy(new CardProxy(CardProxy.NAME));
	}
	
}
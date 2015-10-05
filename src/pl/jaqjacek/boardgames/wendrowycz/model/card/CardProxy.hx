package pl.jaqjacek.boardgames.wendrowycz.model.card;
import org.puremvc.haxe.patterns.proxy.Proxy;

/**
 * ...
 * @author ...
 */
class CardProxy extends Proxy
{
	public static inline var NAME:String = 'CardProxy';
	var _cards:Array<CardVO>;
	public function new(?proxyName:String, ?data:Dynamic) 
	{
		super(proxyName, data);
	}
	
	override public function onRegister():Void 
	{
		_cards = [];
	}
	
	public function getCards():Array<CardVO>
	{
		return _cards;
	}
	
	public function addCard(p_card:CardVO) 
	{
		_cards.push(p_card);
		Log.info(['cards amount', _cards.length]);
	}
	
}
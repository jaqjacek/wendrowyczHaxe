package pl.jaqjacek.boardgames.wendrowycz.model.card;

/**
 * ...
 * @author ...
 */
class CardVO
{
	public var description:String;
	public var name:String;
	public var type:String;
	public var amount:Int;
	
	
	public function new(?p_name:String,?p_description:String,?p_type:String,?p_amount:Int=1) 
	{
		name = p_name == null ? 'unknown' : p_name;
		description = p_description == null ? 'unknown' : p_description;
		type = p_type == null ? 'unknown' : p_type;
		amount = p_amount;
	}
	
}
package;

/**
 * ...
 * @author jaq
 */
class DBFactory
{

	
	static public function getPon():DB.Pon
	{
		return cast {
			type:"",
			onBoard:true
		}
	}
	
}
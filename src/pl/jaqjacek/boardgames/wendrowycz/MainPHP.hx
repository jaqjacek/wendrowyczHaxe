package pl.jaqjacek.boardgames.wendrowycz;
import php.Web;
import pl.jaqjacek.boardgames.wendrowycz.model.RequestVO;
import pl.jaqjacek.boardgames.wendrowycz.notifications.PHPNotifications;
import sys.io.File;
import sys.io.FileOutput;
import tjson.TJSON;
/**
 * ...
 * @author ...
 */
class MainPHP
{

	static function main() 
	{
		//var tmpCardVO:CardVO = new CardVO("card", "desc", "W", 3);
		var params = Web.getPostData();
		//var tezt = params.exists('tezt') ? params.get('tezt') : "zonk";
		//switch (tezt) 
		//{
			//case "tezt":
				//php.Lib.print("wartosc tezt" + tezt);
			//case "write":
			var tmpRV:RequestVO = new RequestVO();
			tmpRV.id = 'a';
			tmpRV.notification = 'b';
				var tmpFile:FileOutput = File.append("tezt.txt", false);
				tmpFile.writeString(params.toString());
				tmpFile.writeString("\n");
				tmpFile.writeString(TJSON.encode(tmpRV));
				tmpFile.writeString("\n");
				
				//tmpFile.close();
			//case "read":
				//php.Lib.print("test to send wia http");
			//default:
				//
		//}
		//Log.initPHP();
		var tmpFacade:PHPFacade = new PHPFacade();
		tmpFacade.startup();
		tmpFacade.sendNotification(PHPNotifications.RAW_REQUEST, params.toString());
	}
	
}
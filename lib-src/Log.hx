/**
  Simple, colorful logging!

	Setup
	=====
	Somewhere really early in your code do a:
	Log.init();
	This will setup the logger methods and coloring stuff.

	Logging
	=======
	Log.info('information is awesome');
	Log.debug('x is $x');
	Log.error('oops, we got an error: $e.text');

	If you feel inclined you can also call the standard haxe trace with a level string:
	trace('debug', 'a debug message'); // same result as Log.debug('a debug message');

	To get nice colors to appear in Intellij you'll need to install the Grep Console plugin and enable "ansi colors"

	Asserts
	=======
	You can detect asserts of boolean expressions by using assert:
	var x = 0;
	Log.assert(x == 1, 'x should be 1 damnit!');

*/

import haxe.macro.Expr;
import flash.utils.Function;
import haxe.PosInfos;
class Log
{
	private static var ansiColors:Map<String,String> = new Map();

	private static var origTrace:Function;

	public static function init()
	{
		ansiColors['black'] = '\033[0;30m';
		ansiColors['red'] = '\033[31m';
		ansiColors['green'] = '\033[32m';
		ansiColors['yellow'] = '\033[33m';
		ansiColors['blue'] = '\033[1;34m';
		ansiColors['magenta'] = '\033[1;35m';
		ansiColors['cyan'] = '\033[0;36m';
		ansiColors['grey'] = '\033[0;37m';
		ansiColors['white'] = '\033[1;37m';
		//ansiColors['white'] = 'Error:';

		// reuse it for quick lookups of colors to log levels
		ansiColors['debug'] = ansiColors['cyan'];
		ansiColors['info'] = ansiColors['white'];
		ansiColors['error'] = ansiColors['magenta'];
		ansiColors['assert'] = ansiColors['red'];
		ansiColors['default'] = ansiColors['grey'];

		// overload trace so we get access to funky stuff
		origTrace = haxe.Log.trace;
		haxe.Log.trace = haxeTrace;
	}
	
	public static function initFD() 
	{
		ansiColors['debug'] = 'Debug:';
		ansiColors['info'] = 'Info:';
		ansiColors['error'] = 'Error:';
		ansiColors['assert'] = 'Warning:';
		ansiColors['default'] = '';

		// overload trace so we get access to funky stuff
		origTrace = haxe.Log.trace;
		haxe.Log.trace = haxeTrace;
	}

	inline public static function debug(message:Dynamic, ?pos:PosInfos):Void
	{
		print('debug', [message], pos);
	}

	inline public static function error(message:Dynamic, ?pos:PosInfos):Void
	{
		print('error', [message], pos);
	}

	inline public static function info(message:Dynamic, ?pos:PosInfos):Void
	{
		print('info', [message], pos);
	}

	inline public static function assert(exp:Bool, message:Dynamic, ?pos:PosInfos):Void
	{
		if (!exp)
			print('assert', [message], pos);
	}

	static function haxeTrace(value:Dynamic, ?pos:PosInfos)
	{
		var params = pos.customParams;
		if (params == null)
			params = [];
		else
			pos.customParams = null;

		print(value, params, pos);
	}

	static public function print(level:String, params:Array<Dynamic>, pos:PosInfos):Void
	{
		params = params.copy();

		// prepare message
		for (i in 0...params.length)
			params[i] = Std.string(params[i]);
		var message = params.join(", ");

		origTrace(ansiColors[level] + '[' + level +'] ' + message + ansiColors['default'], pos);
	}

}

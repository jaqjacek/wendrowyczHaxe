package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("img/background1.jpg", __ASSET__img_background1_jpg);
		type.set ("img/background1.jpg", AssetType.IMAGE);
		className.set ("img/bardak10.jpg", __ASSET__img_bardak10_jpg);
		type.set ("img/bardak10.jpg", AssetType.IMAGE);
		className.set ("img/board_split_10.png", __ASSET__img_board_split_10_png);
		type.set ("img/board_split_10.png", AssetType.IMAGE);
		className.set ("img/card_revers.jpg", __ASSET__img_card_revers_jpg);
		type.set ("img/card_revers.jpg", AssetType.IMAGE);
		className.set ("img/ghost.jpg", __ASSET__img_ghost_jpg);
		type.set ("img/ghost.jpg", AssetType.IMAGE);
		className.set ("img/pejza¿2.jpg", __ASSET__img_pejza_2_jpg);
		type.set ("img/pejza¿2.jpg", AssetType.IMAGE);
		className.set ("img/pejza¿3.jpg", __ASSET__img_pejza_3_jpg);
		type.set ("img/pejza¿3.jpg", AssetType.IMAGE);
		className.set ("img/pon_bardak.jpg", __ASSET__img_pon_bardak_jpg);
		type.set ("img/pon_bardak.jpg", AssetType.IMAGE);
		className.set ("img/pon_ghost.jpg", __ASSET__img_pon_ghost_jpg);
		type.set ("img/pon_ghost.jpg", AssetType.IMAGE);
		className.set ("img/pon_home.png", __ASSET__img_pon_home_png);
		type.set ("img/pon_home.png", AssetType.IMAGE);
		className.set ("img/pon_totem.png", __ASSET__img_pon_totem_png);
		type.set ("img/pon_totem.png", AssetType.IMAGE);
		className.set ("img/pon_vamp.png", __ASSET__img_pon_vamp_png);
		type.set ("img/pon_vamp.png", AssetType.IMAGE);
		className.set ("img/pon_wendrowycz.jpg", __ASSET__img_pon_wendrowycz_jpg);
		type.set ("img/pon_wendrowycz.jpg", AssetType.IMAGE);
		className.set ("img/pon_werewolf.png", __ASSET__img_pon_werewolf_png);
		type.set ("img/pon_werewolf.png", AssetType.IMAGE);
		className.set ("img/vamp3.jpg", __ASSET__img_vamp3_jpg);
		type.set ("img/vamp3.jpg", AssetType.IMAGE);
		className.set ("img/vampire-512.png", __ASSET__img_vampire_512_png);
		type.set ("img/vampire-512.png", AssetType.IMAGE);
		className.set ("img/vampire.png", __ASSET__img_vampire_png);
		type.set ("img/vampire.png", AssetType.IMAGE);
		className.set ("img/wer4.jpg", __ASSET__img_wer4_jpg);
		type.set ("img/wer4.jpg", AssetType.IMAGE);
		className.set ("auto_generated_cards.txt", __ASSET__auto_generated_cards_txt);
		type.set ("auto_generated_cards.txt", AssetType.TEXT);
		className.set ("img/background1.jpg", __ASSET__img_background2);
		type.set ("img/background1.jpg", AssetType.IMAGE);
		className.set ("img/bardak10.jpg", __ASSET__img_bardak11);
		type.set ("img/bardak10.jpg", AssetType.IMAGE);
		className.set ("img/board_split_10.png", __ASSET__img_board_split_11);
		type.set ("img/board_split_10.png", AssetType.IMAGE);
		className.set ("img/card_revers.jpg", __ASSET__img_card_revers_jpg1);
		type.set ("img/card_revers.jpg", AssetType.IMAGE);
		className.set ("img/ghost.jpg", __ASSET__img_ghost_jpg1);
		type.set ("img/ghost.jpg", AssetType.IMAGE);
		className.set ("img/pejza¿2.jpg", __ASSET__img_pejza_3);
		type.set ("img/pejza¿2.jpg", AssetType.IMAGE);
		className.set ("img/pejza¿3.jpg", __ASSET__img_pejza_4);
		type.set ("img/pejza¿3.jpg", AssetType.IMAGE);
		className.set ("img/pon_bardak.jpg", __ASSET__img_pon_bardak_jpg1);
		type.set ("img/pon_bardak.jpg", AssetType.IMAGE);
		className.set ("img/pon_ghost.jpg", __ASSET__img_pon_ghost_jpg1);
		type.set ("img/pon_ghost.jpg", AssetType.IMAGE);
		className.set ("img/pon_home.png", __ASSET__img_pon_home_png1);
		type.set ("img/pon_home.png", AssetType.IMAGE);
		className.set ("img/pon_totem.png", __ASSET__img_pon_totem_png1);
		type.set ("img/pon_totem.png", AssetType.IMAGE);
		className.set ("img/pon_vamp.png", __ASSET__img_pon_vamp_png1);
		type.set ("img/pon_vamp.png", AssetType.IMAGE);
		className.set ("img/pon_wendrowycz.jpg", __ASSET__img_pon_wendrowycz_jpg1);
		type.set ("img/pon_wendrowycz.jpg", AssetType.IMAGE);
		className.set ("img/pon_werewolf.png", __ASSET__img_pon_werewolf_png1);
		type.set ("img/pon_werewolf.png", AssetType.IMAGE);
		className.set ("img/vamp3.jpg", __ASSET__img_vamp4);
		type.set ("img/vamp3.jpg", AssetType.IMAGE);
		className.set ("img/vampire-512.png", __ASSET__img_vampire_513);
		type.set ("img/vampire-512.png", AssetType.IMAGE);
		className.set ("img/vampire.png", __ASSET__img_vampire_png1);
		type.set ("img/vampire.png", AssetType.IMAGE);
		className.set ("img/wer4.jpg", __ASSET__img_wer5);
		type.set ("img/wer4.jpg", AssetType.IMAGE);
		className.set ("openfl.svg", __ASSET__openfl_svg);
		type.set ("openfl.svg", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "img/background1.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/bardak10.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/board_split_10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/card_revers.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ghost.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pejza¿2.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pejza¿3.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_bardak.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_ghost.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_home.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_totem.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_vamp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_wendrowycz.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_werewolf.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/vamp3.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/vampire-512.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/vampire.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/wer4.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "auto_generated_cards.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "img/background1.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/bardak10.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/board_split_10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/card_revers.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ghost.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pejza¿2.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pejza¿3.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_bardak.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_ghost.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_home.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_totem.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_vamp.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_wendrowycz.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/pon_werewolf.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/vamp3.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/vampire-512.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/vampire.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/wer4.jpg";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "openfl.svg";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("img/background1.jpg", __ASSET__img_background1_jpg);
		type.set ("img/background1.jpg", AssetType.IMAGE);
		
		className.set ("img/bardak10.jpg", __ASSET__img_bardak10_jpg);
		type.set ("img/bardak10.jpg", AssetType.IMAGE);
		
		className.set ("img/board_split_10.png", __ASSET__img_board_split_10_png);
		type.set ("img/board_split_10.png", AssetType.IMAGE);
		
		className.set ("img/card_revers.jpg", __ASSET__img_card_revers_jpg);
		type.set ("img/card_revers.jpg", AssetType.IMAGE);
		
		className.set ("img/ghost.jpg", __ASSET__img_ghost_jpg);
		type.set ("img/ghost.jpg", AssetType.IMAGE);
		
		className.set ("img/pejza¿2.jpg", __ASSET__img_pejza_2_jpg);
		type.set ("img/pejza¿2.jpg", AssetType.IMAGE);
		
		className.set ("img/pejza¿3.jpg", __ASSET__img_pejza_3_jpg);
		type.set ("img/pejza¿3.jpg", AssetType.IMAGE);
		
		className.set ("img/pon_bardak.jpg", __ASSET__img_pon_bardak_jpg);
		type.set ("img/pon_bardak.jpg", AssetType.IMAGE);
		
		className.set ("img/pon_ghost.jpg", __ASSET__img_pon_ghost_jpg);
		type.set ("img/pon_ghost.jpg", AssetType.IMAGE);
		
		className.set ("img/pon_home.png", __ASSET__img_pon_home_png);
		type.set ("img/pon_home.png", AssetType.IMAGE);
		
		className.set ("img/pon_totem.png", __ASSET__img_pon_totem_png);
		type.set ("img/pon_totem.png", AssetType.IMAGE);
		
		className.set ("img/pon_vamp.png", __ASSET__img_pon_vamp_png);
		type.set ("img/pon_vamp.png", AssetType.IMAGE);
		
		className.set ("img/pon_wendrowycz.jpg", __ASSET__img_pon_wendrowycz_jpg);
		type.set ("img/pon_wendrowycz.jpg", AssetType.IMAGE);
		
		className.set ("img/pon_werewolf.png", __ASSET__img_pon_werewolf_png);
		type.set ("img/pon_werewolf.png", AssetType.IMAGE);
		
		className.set ("img/vamp3.jpg", __ASSET__img_vamp3_jpg);
		type.set ("img/vamp3.jpg", AssetType.IMAGE);
		
		className.set ("img/vampire-512.png", __ASSET__img_vampire_512_png);
		type.set ("img/vampire-512.png", AssetType.IMAGE);
		
		className.set ("img/vampire.png", __ASSET__img_vampire_png);
		type.set ("img/vampire.png", AssetType.IMAGE);
		
		className.set ("img/wer4.jpg", __ASSET__img_wer4_jpg);
		type.set ("img/wer4.jpg", AssetType.IMAGE);
		
		className.set ("auto_generated_cards.txt", __ASSET__auto_generated_cards_txt);
		type.set ("auto_generated_cards.txt", AssetType.TEXT);
		
		className.set ("img/background1.jpg", __ASSET__img_background2);
		type.set ("img/background1.jpg", AssetType.IMAGE);
		
		className.set ("img/bardak10.jpg", __ASSET__img_bardak11);
		type.set ("img/bardak10.jpg", AssetType.IMAGE);
		
		className.set ("img/board_split_10.png", __ASSET__img_board_split_11);
		type.set ("img/board_split_10.png", AssetType.IMAGE);
		
		className.set ("img/card_revers.jpg", __ASSET__img_card_revers_jpg1);
		type.set ("img/card_revers.jpg", AssetType.IMAGE);
		
		className.set ("img/ghost.jpg", __ASSET__img_ghost_jpg1);
		type.set ("img/ghost.jpg", AssetType.IMAGE);
		
		className.set ("img/pejza¿2.jpg", __ASSET__img_pejza_3);
		type.set ("img/pejza¿2.jpg", AssetType.IMAGE);
		
		className.set ("img/pejza¿3.jpg", __ASSET__img_pejza_4);
		type.set ("img/pejza¿3.jpg", AssetType.IMAGE);
		
		className.set ("img/pon_bardak.jpg", __ASSET__img_pon_bardak_jpg1);
		type.set ("img/pon_bardak.jpg", AssetType.IMAGE);
		
		className.set ("img/pon_ghost.jpg", __ASSET__img_pon_ghost_jpg1);
		type.set ("img/pon_ghost.jpg", AssetType.IMAGE);
		
		className.set ("img/pon_home.png", __ASSET__img_pon_home_png1);
		type.set ("img/pon_home.png", AssetType.IMAGE);
		
		className.set ("img/pon_totem.png", __ASSET__img_pon_totem_png1);
		type.set ("img/pon_totem.png", AssetType.IMAGE);
		
		className.set ("img/pon_vamp.png", __ASSET__img_pon_vamp_png1);
		type.set ("img/pon_vamp.png", AssetType.IMAGE);
		
		className.set ("img/pon_wendrowycz.jpg", __ASSET__img_pon_wendrowycz_jpg1);
		type.set ("img/pon_wendrowycz.jpg", AssetType.IMAGE);
		
		className.set ("img/pon_werewolf.png", __ASSET__img_pon_werewolf_png1);
		type.set ("img/pon_werewolf.png", AssetType.IMAGE);
		
		className.set ("img/vamp3.jpg", __ASSET__img_vamp4);
		type.set ("img/vamp3.jpg", AssetType.IMAGE);
		
		className.set ("img/vampire-512.png", __ASSET__img_vampire_513);
		type.set ("img/vampire-512.png", AssetType.IMAGE);
		
		className.set ("img/vampire.png", __ASSET__img_vampire_png1);
		type.set ("img/vampire.png", AssetType.IMAGE);
		
		className.set ("img/wer4.jpg", __ASSET__img_wer5);
		type.set ("img/wer4.jpg", AssetType.IMAGE);
		
		className.set ("openfl.svg", __ASSET__openfl_svg);
		type.set ("openfl.svg", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__img_background1_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_bardak10_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_board_split_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_card_revers_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_ghost_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pejza_2_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pejza_3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_bardak_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_ghost_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_home_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_totem_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_vamp_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_wendrowycz_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_werewolf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_vamp3_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_vampire_512_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_vampire_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_wer4_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__auto_generated_cards_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__img_background2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_bardak11 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_board_split_11 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_card_revers_jpg1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_ghost_jpg1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pejza_3 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pejza_4 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_bardak_jpg1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_ghost_jpg1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_home_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_totem_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_vamp_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_wendrowycz_jpg1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_pon_werewolf_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_vamp4 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_vampire_513 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_vampire_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_wer5 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__openfl_svg extends flash.utils.ByteArray { }


#elseif html5









































#else



#if (windows || mac || linux || cpp)


@:image("assets/img/background1.jpg") #if display private #end class __ASSET__img_background1_jpg extends lime.graphics.Image {}
@:image("assets/img/bardak10.jpg") #if display private #end class __ASSET__img_bardak10_jpg extends lime.graphics.Image {}
@:image("assets/img/board_split_10.png") #if display private #end class __ASSET__img_board_split_10_png extends lime.graphics.Image {}
@:image("assets/img/card_revers.jpg") #if display private #end class __ASSET__img_card_revers_jpg extends lime.graphics.Image {}
@:image("assets/img/ghost.jpg") #if display private #end class __ASSET__img_ghost_jpg extends lime.graphics.Image {}
@:image("assets/img/pejza¿2.jpg") #if display private #end class __ASSET__img_pejza_2_jpg extends lime.graphics.Image {}
@:image("assets/img/pejza¿3.jpg") #if display private #end class __ASSET__img_pejza_3_jpg extends lime.graphics.Image {}
@:image("assets/img/pon_bardak.jpg") #if display private #end class __ASSET__img_pon_bardak_jpg extends lime.graphics.Image {}
@:image("assets/img/pon_ghost.jpg") #if display private #end class __ASSET__img_pon_ghost_jpg extends lime.graphics.Image {}
@:image("assets/img/pon_home.png") #if display private #end class __ASSET__img_pon_home_png extends lime.graphics.Image {}
@:image("assets/img/pon_totem.png") #if display private #end class __ASSET__img_pon_totem_png extends lime.graphics.Image {}
@:image("assets/img/pon_vamp.png") #if display private #end class __ASSET__img_pon_vamp_png extends lime.graphics.Image {}
@:image("assets/img/pon_wendrowycz.jpg") #if display private #end class __ASSET__img_pon_wendrowycz_jpg extends lime.graphics.Image {}
@:image("assets/img/pon_werewolf.png") #if display private #end class __ASSET__img_pon_werewolf_png extends lime.graphics.Image {}
@:image("assets/img/vamp3.jpg") #if display private #end class __ASSET__img_vamp3_jpg extends lime.graphics.Image {}
@:image("assets/img/vampire-512.png") #if display private #end class __ASSET__img_vampire_512_png extends lime.graphics.Image {}
@:image("assets/img/vampire.png") #if display private #end class __ASSET__img_vampire_png extends lime.graphics.Image {}
@:image("assets/img/wer4.jpg") #if display private #end class __ASSET__img_wer4_jpg extends lime.graphics.Image {}
@:file("assets/auto_generated_cards.txt") #if display private #end class __ASSET__auto_generated_cards_txt extends lime.utils.ByteArray {}
@:image("assets/img/background1.jpg") #if display private #end class __ASSET__img_background2 extends lime.graphics.Image {}
@:image("assets/img/bardak10.jpg") #if display private #end class __ASSET__img_bardak11 extends lime.graphics.Image {}
@:image("assets/img/board_split_10.png") #if display private #end class __ASSET__img_board_split_11 extends lime.graphics.Image {}
@:image("assets/img/card_revers.jpg") #if display private #end class __ASSET__img_card_revers_jpg1 extends lime.graphics.Image {}
@:image("assets/img/ghost.jpg") #if display private #end class __ASSET__img_ghost_jpg1 extends lime.graphics.Image {}
@:image("assets/img/pejza¿2.jpg") #if display private #end class __ASSET__img_pejza_3 extends lime.graphics.Image {}
@:image("assets/img/pejza¿3.jpg") #if display private #end class __ASSET__img_pejza_4 extends lime.graphics.Image {}
@:image("assets/img/pon_bardak.jpg") #if display private #end class __ASSET__img_pon_bardak_jpg1 extends lime.graphics.Image {}
@:image("assets/img/pon_ghost.jpg") #if display private #end class __ASSET__img_pon_ghost_jpg1 extends lime.graphics.Image {}
@:image("assets/img/pon_home.png") #if display private #end class __ASSET__img_pon_home_png1 extends lime.graphics.Image {}
@:image("assets/img/pon_totem.png") #if display private #end class __ASSET__img_pon_totem_png1 extends lime.graphics.Image {}
@:image("assets/img/pon_vamp.png") #if display private #end class __ASSET__img_pon_vamp_png1 extends lime.graphics.Image {}
@:image("assets/img/pon_wendrowycz.jpg") #if display private #end class __ASSET__img_pon_wendrowycz_jpg1 extends lime.graphics.Image {}
@:image("assets/img/pon_werewolf.png") #if display private #end class __ASSET__img_pon_werewolf_png1 extends lime.graphics.Image {}
@:image("assets/img/vamp3.jpg") #if display private #end class __ASSET__img_vamp4 extends lime.graphics.Image {}
@:image("assets/img/vampire-512.png") #if display private #end class __ASSET__img_vampire_513 extends lime.graphics.Image {}
@:image("assets/img/vampire.png") #if display private #end class __ASSET__img_vampire_png1 extends lime.graphics.Image {}
@:image("assets/img/wer4.jpg") #if display private #end class __ASSET__img_wer5 extends lime.graphics.Image {}
@:file("assets/openfl.svg") #if display private #end class __ASSET__openfl_svg extends lime.utils.ByteArray {}



#end
#end

#if (openfl && !flash)

#end

#end
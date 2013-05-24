package  
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class SoundOn extends Sound
	{
		private static var splash: String = "Click_Dub.mp3";
		private static var song: String = "High-Skies-The-Shape-Of-Things-To-Come.mp3";
		private static var sound: Sound;
		
		//Фоновая музыка
		public static function gameSound():void
		{
			sound = new Sound();
			sound.load(new URLRequest(song));
			sound.play();
		}
		
		//Звук лопнущего пузырька
		public static function bubbleSound():void
		{
			sound = new Sound();
			sound.load(new URLRequest(splash));
			sound.play();
		}
		
	}
	
}

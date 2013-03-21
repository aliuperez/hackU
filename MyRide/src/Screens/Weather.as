package Screens
{
	import flash.display.Sprite;
	
	public class Weather extends Sprite
	{
		public function Weather()
		{
			super();
		}
		
		
		public function getXML()
		{
			var url:String = "http://weather.yahooapis.com/forecastrss" + "?w=" + (location number) + "&u=" + ("c" for celcius or "f" for fahrenheit);
			
		}
	}
}
/*	Weather Page functions
 *		
 *
 */



package Screens
{
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class Weather extends Sprite
	{
		// WOEID used for getting the RSS feed from Yahoo
			private var locationNumber:int;
		
		// data from the RSS feed
			private var Data:XML;  
			
		// URL of the RSS feed
			private var URL:String; 
		
		
		
		public function Weather()
		{
			super();
			
			obtainLocNumber();
		}
		
		
		
	/* XML stuff */
		//	Request XML from yahoo API
			public function requestRSS():void
			{
				URL = "http://weather.yahooapis.com/forecastrss" + "?w=" + locationNumber + "&u=" + "f";
			}
			
		
		//	load an XML document
			private function loadXML(xmlURL:String):void 
			{  
				var loader:URLLoader = new URLLoader();  
				var request:URLRequest = new URLRequest(xmlURL);  
					
				loader.load(request);  
				loader.addEventListener(Event.COMPLETE, loadData);  
			}  
			
		//	load data from XML
			private function loadData(event:Event):void 
			{  
				Data = new XML(event.currentTarget.data);  
					
				var yweather:Namespace = new Namespace("http://xml.weather.yahoo.com/ns/rss/1.0");  
				var day:String = Data.channel.item.yweather::forecast[0].@day;  
				var codeToday:String = Data.channel.item.yweather::forecast[0].@code;  
				var codeTomorrow:String = Data.channel.item.yweather::forecast[1].@code;  
			}  
		
	/* PHP stuff */
		// Send to City and State to PHP
			private function obtainLocNumber():void
			{
				// PHP variables
				var loader : URLLoader = new URLLoader;
				var urlreq:URLRequest = new URLRequest("test.php");
				var urlvars: URLVariables = new URLVariables;
				
				loader.dataFormat = URLLoaderDataFormat.VARIABLES;
				urlreq.method = URLRequestMethod.POST;
				
				urlvars.city = "Chesapeake";
				urlvars.state = "VA";
				urlreq.data = urlvars;
				
				loader.addEventListener(Event.COMPLETE, setLocNumber);
				loader.load(urlreq);
			}
		
		// Recieve from PHP
			private function setLocNumber(event:Event):void
			{
					var loader2: URLLoader = URLLoader(event.target);
					trace(loader2.data.done);
					locationNumber = event.target.data.done;
			}
		
		
		
	}
}
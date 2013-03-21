/*	Weather Page functions
 *		
 *
 */
package Screens
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.text.TextField;
	
	import Screens.Screen;

	public class Weather extends Screen
	{
		// WOEID used for getting the RSS feed from Yahoo
			private var locationNumber:int = 2379200;
		
		// data from the RSS feed
			private var Data:XML;  
			
		// URL of the RSS feed
			private var URL:String; 
			
		// Text Fields
			private var maxt:TextField = new TextField();
			private var mint:TextField = new TextField();
			private var state:TextField = new TextField();
			private var humidity:TextField = new TextField();
			private var temp:TextField = new TextField();
			private var max:TextField = new TextField();
			private var min:TextField = new TextField();
			private var tomorrow:TextField = new TextField();
			
		// Construct
			public function Weather()
			{
				super();
				
				
				
				requestRSS();
				loadXML(URL);
				
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
				loader.addEventListener(Event.COMPLETE, readData);  
			}  
			
		//	read data from XML
			private function readData(event:Event):void 
			{  
				Data = new XML(event.currentTarget.data);  
					
				var yweather:Namespace = new Namespace("http://xml.weather.yahoo.com/ns/rss/1.0");  
				var day:String = Data.channel.item.yweather::forecast[0].@day;  
				var codeToday:String = Data.channel.item.yweather::forecast[0].@code;  
				var codeTomorrow:String = Data.channel.item.yweather::forecast[1].@code; 
				
				//Assigning the information to the text fields  
				state.text = Data.channel.yweather::location.@city; 
				maxt.text = Data.channel.item.yweather::forecast[1].@high + " °F";  
				mint.text = Data.channel.item.yweather::forecast[1].@low + " °F";  
				max.text = Data.channel.item.yweather::forecast[0].@high + " °F";  
				min.text = Data.channel.item.yweather::forecast[0].@low + " °F"; 
				humidity.text = Data.channel.yweather::atmosphere.@humidity + " %";  
				temp.text = Data.channel.item.yweather::condition.@temp + " °F";  
 
				
				switch (day) 
				{  
					case "Sun":  
						tomorrow.text = "Monday";  
					break;  
					
					case "Mon":  
						tomorrow.text = "Tuesday";  
					break;  
					
					case "Tue":  
						tomorrow.text = "Wednesday";  
					break;  
					
					case "Wed":  
						tomorrow.text = "Thursday";  
					break; 
					
					case "Thu":  
						tomorrow.text = "Friday";  
					break;  
					
					case "Fri":  
						tomorrow.text = "Saturday";  
					break;  
					
					case "Sat":  
						tomorrow.text = "Sunday"  
					break;  
				}  
		
			}
	}
}
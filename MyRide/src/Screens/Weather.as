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
		
		// Construct
			public function Weather()
			{
				super();
				
				var maxt:TextField = new TextField();
				var mint:TextField = new TextField();
				var state:TextField = new TextField();
				var humidity:TextField = new TextField();
				var temp:TextField = new TextField();
				var max:TextField = new TextField();
				var min:TextField = new TextField();

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
				
				//Assigning the information to the text fields  
				maxt.text = Data.channel.item.yweather::forecast[1].@high + " °F";  
				mint.text = Data.channel.item.yweather::forecast[1].@low + " °F";  
				state.text = Data.channel.yweather::location.@city;  
				humidity.text = Data.channel.yweather::atmosphere.@humidity + " %";  
				temp.text = Data.channel.item.yweather::condition.@temp + " °F";  
				max.text = Data.channel.item.yweather::forecast[0].@high + " °F";  
				min.text = Data.channel.item.yweather::forecast[0].@low + " °F";  
				
				switch (day) {  
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
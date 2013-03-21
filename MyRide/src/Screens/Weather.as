/*	Weather Page functions
 *		
 *
 */
package Screens
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.HomeBTN;
	
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
			private var maxt : TextField = new TextField();
			private var mint : TextField = new TextField();
			private var city : TextField = new TextField();
			private var humidity:TextField = new TextField();
			private var temp:TextField = new TextField();
			private var max:TextField = new TextField();
			private var min:TextField = new TextField();
			private var tomorrow:TextField = new TextField();
			private var today:TextField = new TextField();
			
		// Construct
			public function Weather()
			{
				super();
				this.addEventListener(Event.ADDED_TO_STAGE,init)
			}
			
			protected function init(event:Event):void
			{
				this.removeEventListener(Event.ADDED_TO_STAGE,init);
				
				createButtons();
				requestRSS();
				loadXML(URL);
				placeText();
			}			
			
			private function createButtons():void
			{
				var homeBTN:HomeBTN = new HomeBTN();
				this.addChild(homeBTN);
				
				var homeBTNParam:Object = {x:0,y:0,offsetX:Locator.DeviceWidth/2,offsetY:Locator.DeviceHeight/2};
				new FluidObject(homeBTN,homeBTNParam);
				
			}
			
			private function placeText():void
			{
				//add kids
				addChild(maxt);
				addChild(mint);
				addChild(city);
				addChild(humidity);
				addChild(temp);
				addChild(max);
				addChild(min);
				addChild(tomorrow);
				addChild(today);
				//move stuff
				var Param:Object;
				
				
				Param = {x:0,y:0,offsetX:10,offsetY:10};
				new FluidObject(temp,Param);
				/*
				Param = {x:0,y:0, offsetX:temp.x, offsetY:temp.height+10};
				new FluidObject(min,Param);
				
				Param = {x:0,y:0,offsetX:min.width+10, offsetY:min.y};
				new FluidObject(max,Param);
				
				Param = {x:0,y:0,offsetX:40,offsetY:10};
				new FluidObject(city,Param);
				
				Param = {x:0,y:0,offsetX:40,offsetY:20};
				new FluidObject(temp,Param);
				
				Param = {x:0,y:0,offsetX:40,offsetY:30};
				new FluidObject(mint,Param);
				
				Param = {x:0,y:0,offsetX:40,offsetY:40};
				new FluidObject(maxt,Param);
				*/
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
					city.text = Data.channel.yweather::location.@city; 
					maxt.text ="High: " +Data.channel.item.yweather::forecast[1].@high + " °F";  
					mint.text = "Low: "+Data.channel.item.yweather::forecast[1].@low + " °F";  
					max.text = "High: " +Data.channel.item.yweather::forecast[0].@high + " °F";  
					min.text ="Low: "+Data.channel.item.yweather::forecast[0].@low + " °F"; 
					humidity.text = "Humidity: " +Data.channel.yweather::atmosphere.@humidity + " %";  
					temp.text = "Temp: " +Data.channel.item.yweather::condition.@temp + " °F";  
 
				// find out what day tomorrow is
 					tomorrow.text = getTomorrow(day);
			
			}
			
			private function getTomorrow(day:String):String
			{
				var tomorrow:String;
				
				switch (day) 
				{  
					case "Sun":  
						tomorrow = "Monday";  
						break;  
					
					case "Mon":  
						tomorrow = "Tuesday";  
						break;  
					
					case "Tue":  
						tomorrow = "Wednesday";  
						break;  
					
					case "Wed":  
						tomorrow = "Thursday";  
						break; 
					
					case "Thu":  
						tomorrow = "Friday";  
						break;  
					
					case "Fri":  
						tomorrow = "Saturday";  
						break;  
					
					case "Sat":  
						tomorrow = "Sunday"  
						break;  
				} 
				
				return tomorrow;
			}
	}
}
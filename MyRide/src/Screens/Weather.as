
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
				today.text = "Today";
				
				createButtons();
				requestRSS();
				loadXML(URL);
				placeText();
			}			
			
			private function createButtons():void
			{
				var homeBTN:HomeBTN = new HomeBTN();
				this.addChild(homeBTN);
				
				var homeBTNParam:Object = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:homeBTN.height/2};
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
				
				var totalWidth:int = min.width + max.width + mint.width+5;
				var Param:Object;
				
				//move stuff
				Param = {x:0, y:0, offsetX:ScreenWidth/2 - totalWidth/2, offsetY:ScreenHeight/2};
				new FluidObject(temp, Param);
				
				Param = {x:0, y:0, offsetX:temp.x + temp.width/2, offsetY:temp.y - temp.height/2};
				new FluidObject(today, Param);
				
				Param = {x:0, y:0, offsetX:temp.x, offsetY:temp.y+temp.height/2};
				new FluidObject(min,Param);
				
				Param = {x:0,y:0,offsetX:temp.x + min.width, offsetY:min.y};
				new FluidObject(max,Param);
				
				Param = {x:0,y:0,offsetX:totalWidth/2+city.width/2, offsetY:min.y+min.height/2};
				new FluidObject(city,Param);
				
				Param = {x:0,y:0,offsetX:max.x, offsetY:temp.y};
				new FluidObject(humidity,Param);
				
				Param = {x:0,y:0,offsetX:max.x+max.width, offsetY:today.y};
				new FluidObject(tomorrow,Param);
				
				Param = {x:0,y:0,offsetX:tomorrow.x, offsetY:max.y};
				new FluidObject(mint,Param);
				
				Param = {x:0,y:0,offsetX:tomorrow.x, offsetY:temp.y};
				new FluidObject(maxt,Param);
				
			}

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
					city.text = Data.channel.item.yweather::location.@city; 
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
				var tom:String;
				
				switch (day) 
				{  
					case "Sun":  
						tom = "Monday";  
						break;  
					
					case "Mon":  
						tom = "Tuesday";  
						break;  
					
					case "Tue":  
						tom = "Wednesday";  
						break;  
					
					case "Wed":  
						tom = "Thursday";  
						break; 
					
					case "Thu":  
						tom = "Friday";  
						break;  
					
					case "Fri":  
						tom = "Saturday";  
						break;  
					
					case "Sat":  
						tom = "Sunday"  
						break;  
				} 
				
				return tom;
			}
	}
}
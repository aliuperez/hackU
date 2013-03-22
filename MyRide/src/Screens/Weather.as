
package Screens
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import Assets.Assets;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.HomeBTN;
	import Objects.GUI.Label;
	import Objects.GUI.Logo;
	
	import Screens.Screen;

	public class Weather extends Screen
	{
		// WOEID used for getting the RSS feed from Yahoo
			private var locationNumber:int = 2460389;
		
		// data from the RSS feed
			private var Data:XML;  
			
		// URL of the RSS feed
			private var URL:String = "http://weather.yahooapis.com/forecastrss" + "?w=" + locationNumber + "&u=" + "f"; 
			
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
			private var rideNote:TextField = new TextField();
			
			
			private var weatherIcon:Bitmap = new Assets.Assets.cloudIcon();
			
			
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
				createTitle();
				loadXML(URL);
				placeText();
			}			
			
			private function createTitle():void
			{
				var Param:Object;
				
				titleLBL = new Label("Weather",0,Locator.DeviceWidth-homeBTN.width,homeBTN.height,0,true,0xea1c25,0xFFFFFF);
				this.addChild(titleLBL);
				
				Param = {x:0, y:0, offsetX:Locator.DeviceWidth-titleLBL.width/2, offsetY:titleLBL.height/2};
				new FluidObject(titleLBL, Param);
				
				icon = new Assets.Assets.WeatherIcon();
				icon.width = Math.min(titleLBL.width,titleLBL.height);
				icon.height = icon.width;
				icon.x = Math.ceil(-icon.width/2);
				icon.y = Math.ceil(-icon.height/2);
				this.addChild(icon);
				
				Param = {x:0, y:0, offsetX:titleLBL.x+titleLBL.width/2-icon.width, offsetY:titleLBL.y-icon.height/2};
				new FluidObject(icon, Param);
				
				var logo:Logo = new Logo();
				this.addChild(logo);
				
				Param = {x:0, y:0, offsetX:titleLBL.x-titleLBL.width/2+icon.width/2, offsetY:titleLBL.y};
				new FluidObject(logo, Param);
			}
			
			private function createButtons():void
			{
				homeBTN = new HomeBTN();
				this.addChild(homeBTN);
				
				var Param:Object = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:homeBTN.height/2};
				new FluidObject(homeBTN,Param);		
			}
			

			private function placeText():void
			{
				
				var square:Sprite = new Sprite();
				addChild(square);
				//square.graphics.lineStyle(0,0x00ff00);
			
				var myFormat:TextFormat = new TextFormat();
				myFormat.size = 20;
				myFormat.font = "Arial";
				myFormat.color = 0xFFFFFF; 
				
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
				addChild(weatherIcon);
				addChild(rideNote);
				
			//  Normal
				maxt.defaultTextFormat = myFormat;
				mint.defaultTextFormat = myFormat;
				humidity.defaultTextFormat = myFormat;
				temp.defaultTextFormat = myFormat;;
				max.defaultTextFormat = myFormat;
				min.defaultTextFormat = myFormat;
				rideNote.defaultTextFormat = myFormat;

			//  Titles
				today.text = "Today";
				myFormat.size = 25;
				today.defaultTextFormat= myFormat;
				tomorrow.defaultTextFormat = myFormat;
				tomorrow.width = 120;
				city.defaultTextFormat = myFormat;
				
			
				
				addChild(weatherIcon);
				
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
				
				Param = {x:0,y:0,offsetX:max.x+max.width+20, offsetY:today.y};
				new FluidObject(tomorrow,Param);
				
				Param = {x:0,y:0,offsetX:tomorrow.x, offsetY:max.y};
				new FluidObject(mint,Param);
				
				Param = {x:0,y:0,offsetX:tomorrow.x, offsetY:temp.y};
				new FluidObject(maxt,Param);
				
				Param = {x:0,y:0,offsetX:ScreenWidth/2 - weatherIcon.width/2, offsetY:homeBTN.height+weatherIcon.height};
				new FluidObject(weatherIcon,Param);
				
				weatherIcon.width *= 1.5;
				weatherIcon.height *= 1.5;
				
				Param = {x:0,y:0,offsetX:ScreenWidth/2-rideNote.width/2, offsetY:ScreenHeight*.90-rideNote.height};
				new FluidObject(rideNote,Param);
				rideNote.width = ScreenWidth/2;
				
				square.graphics.beginFill(0x0178bd);
				square.graphics.drawRect(0,0,ScreenWidth,ScreenHeight);
				square.graphics.endFill();
				square.x = ScreenWidth/2-square.width/2;
				square.y = homeBTN.height;
				square.width = ScreenWidth;
				
				
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
					
					
					removeChild(weatherIcon);
					
					rideNote.text = "";
					switch (codeToday) {  
						 
						
						case "12":  
							weatherIcon = new Assets.Assets.rainIcon(); 
						break;  
						
						case "18":  
							weatherIcon = new Assets.Assets.cloudIcon();  
						break;  
 
						case "25":  
							weatherIcon = new Assets.Assets.cloudIcon();
						break;  
 
						case "26":  
							weatherIcon = new Assets.Assets.cloudIcon();;  
						break;  
						
						case "29":  
							weatherIcon = new Assets.Assets.cloudIcon();  
						break; 
						
						case "33":  
							weatherIcon = new Assets.Assets.sunIcon();
							rideNote.text = "Go for a ride today!";
						break;  
						
						case "34":  
							weatherIcon = new Assets.Assets.sunIcon();
							rideNote.text = "Go for a ride today!";
						break;  
						 
						case "35":  
							weatherIcon = new Assets.Assets.rainIcon();   
						break;  
						
						case "40":  
							weatherIcon = new Assets.Assets.rainIcon();  
						break;  
						
						case "43":  
							weatherIcon = new Assets.Assets.snowIcon();  
							break;  
						
						case "44":  
							weatherIcon = new Assets.Assets.cloudIcon();  
						break; 
						
						default:
							
						break;
					}  
					
					addChild(weatherIcon);
					placeText();
			
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
package Screens
{
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import ViewModel.ViewModelLocator;
	
	public class Screen extends Sprite
	{
		private var _ScreenWidth:int;
		private var _ScreenHeight:int;
		
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Screen()
		{
			super();
		}
		
		public function get ScreenHeight():int
		{
			return _ScreenHeight;
		}

		public function set ScreenHeight(value:int):void
		{
			_ScreenHeight = value;
		}

		public function get ScreenWidth():int
		{
			return _ScreenWidth;
		}

		public function set ScreenWidth(value:int):void
		{
			_ScreenWidth = value;
		}

		public function SwitchToScreen():void
		{
			var screen:String =getDefinitionByName(getQualifiedClassName(this)).toString();
			//trace("screen: " + screen);
			switch(screen)
			{
				case "[class Home]":
					trace("Home Screen Active!!");
					Locator.home.visible = true;
					HideScreen(Locator.weather);
					HideScreen(Locator.events);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.service);
					HideScreen(Locator.trips);
					break;
				
				case "[class Weather]":
					trace("Weather Screen Active!!");
					Locator.weather.visible = true;
					HideScreen(Locator.home);
					HideScreen(Locator.events);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.service);
					HideScreen(Locator.trips);
					break;
				
				case "[class Events]":
					trace("Events Screen Active!!");
					Locator.events.visible = true;
					HideScreen(Locator.home);
					HideScreen(Locator.weather);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.service);
					HideScreen(Locator.trips);
					break;
				
				case "[class MyDealer]":
					trace("MyDealer Screen Active!!");
					Locator.myDealer.visible = true;
					HideScreen(Locator.home);
					HideScreen(Locator.weather);
					HideScreen(Locator.events);
					HideScreen(Locator.service);
					HideScreen(Locator.trips);
					break;
				
				case "[class Trips]":
					trace("Trips Screen Active!!");
					Locator.trips.visible = true;
					HideScreen(Locator.home);
					HideScreen(Locator.weather);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.service);
					HideScreen(Locator.events);
					break;
				
				case "[class Service]":
					trace("Service Screen Active!!");
					Locator.service.visible = true;
					HideScreen(Locator.home);
					HideScreen(Locator.weather);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.events);
					HideScreen(Locator.trips);
					break;
			}
			this.visible = true;	
		}
		
		public function HideScreen(ScreenName:Screen):void
		{
			ScreenName.visible = false;	
		}
	}
}
package Screens
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import Objects.GUI.HomeBTN;
	import Objects.GUI.Label;
	
	import ViewModel.ViewModelLocator;
	
	public class Screen extends Sprite
	{
		private var _ScreenWidth:int;
		private var _ScreenHeight:int;
		public var homeBTN:HomeBTN;
		public var titleLBL:Label;
		public var icon:Bitmap;
				
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Screen()
		{
			super();
		}
		
		public function SwitchToScreen():void
		{
			var screen:String =getDefinitionByName(getQualifiedClassName(this)).toString();
			//trace("screen: " + screen);
			switch(screen)
			{
				case "[class Home]":
					trace("Home Screen Active!!");
					HideScreen(Locator.weather);
					HideScreen(Locator.events);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.service);
					HideScreen(Locator.trips);
					break;
				
				case "[class Weather]":
					trace("Weather Screen Active!!");
					HideScreen(Locator.home);
					HideScreen(Locator.events);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.service);
					HideScreen(Locator.trips);
					break;
				
				case "[class Events]":
					trace("Events Screen Active!!");
					HideScreen(Locator.home);
					HideScreen(Locator.weather);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.service);
					HideScreen(Locator.trips);
					break;
				
				case "[class MyDealer]":
					trace("MyDealer Screen Active!!");
					HideScreen(Locator.home);
					HideScreen(Locator.weather);
					HideScreen(Locator.events);
					HideScreen(Locator.service);
					HideScreen(Locator.trips);
					break;
				
				case "[class Trips]":
					trace("Trips Screen Active!!");
					HideScreen(Locator.home);
					HideScreen(Locator.weather);
					HideScreen(Locator.myDealer);
					HideScreen(Locator.service);
					HideScreen(Locator.events);
					break;
				
				case "[class Service]":
					trace("Service Screen Active!!");
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
	}
}
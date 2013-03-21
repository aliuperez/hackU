package Screens
{
	import flash.display.Sprite;
	import flash.utils.*;
	import ViewModel.ViewModelLocator;
	
	public class Screen extends Sprite
	{
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
					Locator.home.visible = true;
					HideScreen(Locator.weather);
					break;
				
				case "[class Weather]":
					trace("Weather Screen Active!!");
					Locator.weather.visible = true;
					HideScreen(Locator.home);
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
package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import Screens.Home;
	import Screens.Weather;
	
	import ViewModel.ViewModelLocator;
	import Screens.Events;
	
	//[SWF(frameRate="60",width="1280",height="720",backgroundColor="0x000000")]
	
	public class MyRide extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		public function MyRide()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		private function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			setDeviceSize();
			
			createScreens();			
			
			Locator.home.SwitchToScreen();
		}
		
		private function createScreens():void
		{
			Locator.home = new Home();
			Locator.home.ScreenHeight=Locator.DeviceHeight;
			Locator.home.ScreenWidth=Locator.DeviceWidth;
			
			Locator.weather = new Weather();
			Locator.weather.ScreenHeight=Locator.DeviceHeight;
			Locator.weather.ScreenWidth=Locator.DeviceWidth;
			
			Locator.events = new Events();
			Locator.events.ScreenHeight=Locator.DeviceHeight;
			Locator.events.ScreenWidth=Locator.DeviceWidth;					

			this.addChild(Locator.home);
			this.addChild(Locator.weather);
			this.addChild(Locator.events);
		}
		
		private function setDeviceSize():void
		{
			Locator.DeviceHeight=720;
			Locator.DeviceWidth=1280;
		}
	}
}
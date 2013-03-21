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
	import Screens.MyDealer;
	import Screens.Service;
	import Screens.Trips;
	
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

			Locator.myDealer = new MyDealer();
			Locator.myDealer.ScreenHeight=Locator.DeviceHeight;
			Locator.myDealer.ScreenWidth=Locator.DeviceWidth;	
			
			Locator.trips = new Trips();
			Locator.trips.ScreenHeight=Locator.DeviceHeight;
			Locator.trips.ScreenWidth=Locator.DeviceWidth;	
			
			Locator.service = new Service();
			Locator.service.ScreenHeight=Locator.DeviceHeight;
			Locator.service.ScreenWidth=Locator.DeviceWidth;	
			
			this.addChild(Locator.home);
			this.addChild(Locator.weather);
			this.addChild(Locator.events);
			this.addChild(Locator.myDealer);
			this.addChild(Locator.trips);
			this.addChild(Locator.service);
		}
		
		private function setDeviceSize():void
		{
			Locator.DeviceHeight=800;
			Locator.DeviceWidth=600;
		}
	}
}
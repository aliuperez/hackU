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
	import flash.geom.Rectangle;
	import Screens.Specials;
	import Screens.MoreInfo;
	
	[SWF(backgroundColor="0x4C4C4C")]
	
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
			
			Locator.specials = new Specials();
			Locator.specials.ScreenHeight=Locator.DeviceHeight;
			Locator.specials.ScreenWidth=Locator.DeviceWidth;	
			
			Locator.moreInfo = new MoreInfo();
			Locator.moreInfo.ScreenHeight=Locator.DeviceHeight;
			Locator.moreInfo.ScreenWidth=Locator.DeviceWidth;
			Locator.moreInfo.visible = false;
			
			this.addChild(Locator.home);
			this.addChild(Locator.weather);
			this.addChild(Locator.events);
			this.addChild(Locator.myDealer);
			this.addChild(Locator.trips);
			this.addChild(Locator.service);
			this.addChild(Locator.specials);
			Locator.events.addChild(Locator.moreInfo);
		}
		
		private function setDeviceSize():void
		{
			var deviceSize:Rectangle = new Rectangle(0,0,Math.min(stage.fullScreenWidth,stage.fullScreenHeight),Math.max(stage.fullScreenWidth,stage.fullScreenHeight));
			
			Locator.DeviceHeight=deviceSize.height;
			Locator.DeviceWidth=deviceSize.width;
		}
	}
}
package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import Screens.Home;
	import Screens.Weather;
	
	import ViewModel.ViewModelLocator;
	
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
			Locator.weather = new Weather();
			
			this.addChild(Locator.home);
			this.addChild(Locator.weather);
		}
		
		private function setDeviceSize():void
		{
			Locator.DeviceHeight=720;
			Locator.DeviceWidth=1280;
		}
	}
}
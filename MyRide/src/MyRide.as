package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import ViewModel.ViewModelLocator;
	import Screens.Weather;
	
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
			
			Locator.weather = new Weather();
		}
		
		private function setDeviceSize():void
		{
			Locator.DeviceHeight=0;
			Locator.DeviceWidth=0;
		}
	}
}
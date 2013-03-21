package Screens
{
	import flash.events.Event;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.HomeBTN;
	import Objects.GUI.WeatherBTN;
	
	import Screens.Screen;
	
	import ViewModel.ViewModelLocator;
	
	public class Home extends Screen
	{		
		public function Home()
		{
			super();
			
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			createButtons();
		}
		
		private function createButtons():void
		{
			var homeBTN:HomeBTN = new HomeBTN();
			this.addChild(homeBTN);
			
			var homeBTNParam:Object = {x:0,y:0,offsetX:Locator.DeviceWidth/2,offsetY:Locator.DeviceHeight/2};
			new FluidObject(homeBTN,homeBTNParam);
			
			var weatherBTN:WeatherBTN = new WeatherBTN();
			this.addChild(weatherBTN);
			var weatherBTNParam:Object = {x:0,y:0,offsetX:homeBTN.x + weatherBTN.width*1.5,offsetY:homeBTN.y};
			new FluidObject(weatherBTN,weatherBTNParam);	
			
		}
	}
}
package Screens
{
	import flash.events.Event;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.EventsBTN;
	import Objects.GUI.HomeBTN;
	import Objects.GUI.WeatherBTN;
	
	import Screens.Screen;
	import Objects.GUI.MyDealerBTN;
	import Objects.GUI.TripsBTN;
	import Objects.GUI.ServiceBTN;
	
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
			var Param:Object;
						
			var weatherBTN:WeatherBTN = new WeatherBTN();
			this.addChild(weatherBTN);
			Param = {x:0,y:0,offsetX:weatherBTN.width/2,offsetY:ScreenHeight*0.45};
			new FluidObject(weatherBTN,Param);	
			
			var tripsBTN:TripsBTN = new TripsBTN();
			this.addChild(tripsBTN);
			Param = {x:0,y:0,offsetX:weatherBTN.x + weatherBTN.width/2+tripsBTN.width/2,offsetY:weatherBTN.y-weatherBTN.height/2+tripsBTN.height/2};
			new FluidObject(tripsBTN,Param);	
			
			var eventsBTN:EventsBTN = new EventsBTN();
			this.addChild(eventsBTN);
			Param = {x:0,y:0,offsetX:eventsBTN.width/2,offsetY:weatherBTN.y+weatherBTN.height/2+eventsBTN.height/2};
			new FluidObject(eventsBTN,Param);
			
			var myDealerBTN:MyDealerBTN = new MyDealerBTN();
			this.addChild(myDealerBTN);
			Param = {x:0,y:0,offsetX:eventsBTN.x+eventsBTN.width/2+myDealerBTN.width/2,offsetY:eventsBTN.y-eventsBTN.height/2+myDealerBTN.height/2};
			new FluidObject(myDealerBTN,Param);	
			

			
			var serviceBTN:ServiceBTN = new ServiceBTN();
			this.addChild(serviceBTN);
			Param = {x:0,y:0,offsetX:tripsBTN.x + serviceBTN.width*1.5,offsetY:tripsBTN.y};
			new FluidObject(serviceBTN,Param);	
			
		}
	}
}
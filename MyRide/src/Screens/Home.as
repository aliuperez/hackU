package Screens
{
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.EventsBTN;
	import Objects.GUI.MyDealerBTN;
	import Objects.GUI.ServiceBTN;
	import Objects.GUI.TripsBTN;
	import Objects.GUI.WeatherBTN;
	
	import Screens.Screen;
	
	public class Home extends Screen
	{		
		public var weatherBTN:WeatherBTN;
		public var tripsBTN:TripsBTN;
		public var eventsBTN:EventsBTN;
		public var myDealerBTN:MyDealerBTN;
		public var serviceBTN:ServiceBTN;
		private var ScreenNameToSwitchTo:Screen;
		
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
		
		public function transitionInAnimation():void
		{
			TweenLite.from(weatherBTN, 1, {x:-weatherBTN.width, alpha:0});
			TweenLite.from(tripsBTN, 1, {x:Locator.DeviceWidth+tripsBTN.width, alpha:0});
			TweenLite.from(eventsBTN, 1, {y:Locator.DeviceHeight+eventsBTN.width, alpha:0});
			TweenLite.from(myDealerBTN, 1, {x:Locator.DeviceWidth+myDealerBTN.width, alpha:0});
			TweenLite.from(serviceBTN, 1, {y:Locator.DeviceHeight+serviceBTN.width, alpha:0});
		}
		
		public function transitionOutAnimation():void
		{		
			TweenLite.to(weatherBTN, 1, {x:-weatherBTN.width, alpha:0});
			TweenLite.to(tripsBTN, 1, {x:Locator.DeviceWidth+tripsBTN.width, alpha:0});
			TweenLite.to(eventsBTN, 1, {y:Locator.DeviceHeight+eventsBTN.width, alpha:0});
			TweenLite.to(myDealerBTN, 1, {x:Locator.DeviceWidth+myDealerBTN.width, alpha:0});
			TweenLite.to(serviceBTN, 1, {y:Locator.DeviceHeight+serviceBTN.width, alpha:0});
		}
		
		protected function timer(event:Event):void
		{
			if(weatherBTN.x != -weatherBTN.width)
			{
				TweenComplete = false;				
			}
			else
			{
				TweenComplete = true;
			}
		}
		
		private function createButtons():void
		{
			var Param:Object;
						
			weatherBTN = new WeatherBTN();
			this.addChild(weatherBTN);
			Param = {x:0,y:0,offsetX:weatherBTN.width/2,offsetY:ScreenHeight*0.45};
			new FluidObject(weatherBTN,Param);	
			
			tripsBTN = new TripsBTN();
			this.addChild(tripsBTN);
			Param = {x:0,y:0,offsetX:weatherBTN.x + weatherBTN.width/2+tripsBTN.width/2,offsetY:weatherBTN.y-weatherBTN.height/2+tripsBTN.height/2};
			new FluidObject(tripsBTN,Param);	
			
			eventsBTN = new EventsBTN();
			this.addChild(eventsBTN);
			Param = {x:0,y:0,offsetX:eventsBTN.width/2,offsetY:weatherBTN.y+weatherBTN.height/2+eventsBTN.height/2};
			new FluidObject(eventsBTN,Param);
			
			myDealerBTN = new MyDealerBTN();
			this.addChild(myDealerBTN);
			Param = {x:0,y:0,offsetX:eventsBTN.x+eventsBTN.width/2+myDealerBTN.width/2,offsetY:eventsBTN.y-eventsBTN.height/2+myDealerBTN.height/2};
			new FluidObject(myDealerBTN,Param);	
			
			serviceBTN = new ServiceBTN();
			this.addChild(serviceBTN);
			Param = {x:0,y:0,offsetX:eventsBTN.x+eventsBTN.width/2+serviceBTN.width/2,offsetY:myDealerBTN.y+myDealerBTN.height/2+serviceBTN.height/2};
			new FluidObject(serviceBTN,Param);	
			
		}
	}
}
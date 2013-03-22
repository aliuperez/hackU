package Screens
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.geom.Point;
	
	import Assets.Assets;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.EventsBTN;
	import Objects.GUI.MyDealerBTN;
	import Objects.GUI.ServiceBTN;
	import Objects.GUI.TripsBTN;
	import Objects.GUI.WeatherBTN;
	
	import Screens.Screen;
	
	public class Home extends Screen
	{	
		public var weatherBTNPoint:Point = new Point();
		public var tripsBTNPoint:Point = new Point();
		public var eventsBTNPoint:Point = new Point();
		public var myDealerBTNPoint:Point = new Point();
		public var serviceBTNPoint:Point = new Point();
		public var GarageDoorPoint:Point = new Point();
		
		public var weatherBTN:WeatherBTN;
		public var tripsBTN:TripsBTN;
		public var eventsBTN:EventsBTN;
		public var myDealerBTN:MyDealerBTN;
		public var serviceBTN:ServiceBTN;
		public var Head:Bitmap;
		public var GarageDoor:Bitmap;
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
			TweenLite.to(GarageDoor, 3, {y:-GarageDoor.height});
			
			TweenLite.from(weatherBTN, 1, {x:-weatherBTN.width, alpha:0});
			TweenLite.from(tripsBTN, 1, {x:Locator.DeviceWidth+tripsBTN.width, alpha:0});
			TweenLite.from(eventsBTN, 1, {y:Locator.DeviceHeight+eventsBTN.height, alpha:0});
			TweenLite.from(myDealerBTN, 1, {x:Locator.DeviceWidth+myDealerBTN.width, alpha:0});
			TweenLite.from(serviceBTN, 1, {y:Locator.DeviceHeight+serviceBTN.height, alpha:0});
		}
		
		public function transitionOutAnimation():void
		{		
			TweenLite.to(GarageDoor, 1, {y:0, alpha:1});
			TweenLite.to(weatherBTN, 1, {x:-weatherBTN.width});
			TweenLite.to(tripsBTN, 1, {x:Locator.DeviceWidth+tripsBTN.width});
			TweenLite.to(eventsBTN, 1, {y:Locator.DeviceHeight+eventsBTN.height});
			TweenLite.to(myDealerBTN, 1, {x:Locator.DeviceWidth+myDealerBTN.width});
			
			TweenLite.to(serviceBTN, 1, {y:Locator.DeviceHeight+serviceBTN.height,onComplete:onFinishTween});
			function onFinishTween():void
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
			
			Head = new Assets.Assets.Garage();
			Head.width = Locator.DeviceWidth;
			Head.height = Locator.DeviceHeight*0.53-weatherBTN.height;
			this.addChild(Head);
			Param = {x:0,y:0,offsetX:0,offsetY:0};
			new FluidObject(Head,Param);
			
			GarageDoor = new Assets.Assets.GarageDoor();
			GarageDoor.width = Locator.DeviceWidth;
			GarageDoor.height = Locator.DeviceHeight*0.53-weatherBTN.height;
			this.addChild(GarageDoor);
			Param = {x:0,y:0,offsetX:0,offsetY:0};
			new FluidObject(GarageDoor,Param);
			
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
			
			GarageDoorPoint = new Point (GarageDoor.x,GarageDoor.y);
			weatherBTNPoint = new Point(weatherBTN.x,weatherBTN.y);
			tripsBTNPoint = new Point(tripsBTN.x,tripsBTN.y);
			eventsBTNPoint = new Point(eventsBTN.x,eventsBTN.y);
			myDealerBTNPoint = new Point(myDealerBTN.x,myDealerBTN.y);
			serviceBTNPoint = new Point(serviceBTN.x,serviceBTN.y);
		}
	}
}
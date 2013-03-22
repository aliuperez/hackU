package Screens
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.geom.Point;
	
	import Assets.Assets;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.Bike;
	import Objects.GUI.EventsBTN;
	import Objects.GUI.Logo;
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
		
		public var logoPoint:Point = new Point();
		public var logo:Logo;
		
		public var weatherBTN:WeatherBTN;
		public var tripsBTN:TripsBTN;
		public var eventsBTN:EventsBTN;
		public var myDealerBTN:MyDealerBTN;
		public var serviceBTN:ServiceBTN;
		public var Head:Bitmap;
		public var BikesArray:Array = new Array();
		
		private var count:int = 0;
		private var currentBike:int=0;
		
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
			createBikes();
			
			this.addEventListener(Event.ENTER_FRAME,slideshow);
		}
		
		protected function slideshow(event:Event):void
		{
			
			if(count%45==0)
			{
				if(currentBike>3)
				{
					currentBike=0;
				}
				
				for(var i:int=0;i<BikesArray.length;i++)
				{
					BikesArray[i].visible = false;	
				}
				
				BikesArray[currentBike].visible = true;
				trace(BikesArray[currentBike] + "visible");
				currentBike++
			}
			
			count++
		}
		
		private function createBikes():void
		{
			var bike1:Bike = new Bike("Yamaha");
			BikesArray.push(bike1);
			
			var bike2:Bike = new Bike("Honda");
			BikesArray.push(bike2);
			
			var bike3:Bike = new Bike("Ninja");
			BikesArray.push(bike3);
			
			var bike4:Bike = new Bike("Harley");
			BikesArray.push(bike4);
			
			for(var i:int=0;i<BikesArray.length;i++)
			{
				this.addChild(BikesArray[i]);
				BikesArray[i].visible = false;
				
				var Param:Object;
				Param = {x:0,y:0,offsetX:Head.width-BikesArray[i].width,offsetY:BikesArray[i].height*0.6};
				new FluidObject(BikesArray[i],Param);
			}
		}
		
		public function transitionInAnimation():void
		{		
			TweenLite.from(logo, 1, {x:-logo.width, alpha:0});
			TweenLite.from(weatherBTN, 1, {x:-weatherBTN.width, alpha:0});
			TweenLite.from(tripsBTN, 1, {x:Locator.DeviceWidth+tripsBTN.width, alpha:0});
			TweenLite.from(eventsBTN, 1, {y:Locator.DeviceHeight+eventsBTN.height, alpha:0});
			TweenLite.from(myDealerBTN, 1, {x:Locator.DeviceWidth+myDealerBTN.width, alpha:0});
			TweenLite.from(serviceBTN, 1, {y:Locator.DeviceHeight+serviceBTN.height, alpha:0});
		}
		
		public function transitionOutAnimation():void
		{	
			TweenLite.to(logo, 1, {x:Locator.DeviceWidth+logo.width});
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
			Head.height = Locator.DeviceHeight*0.52-weatherBTN.height;
			this.addChild(Head);
			Param = {x:0,y:0,offsetX:0,offsetY:0};
			new FluidObject(Head,Param);
						
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
			
			logo = new Logo();
			this.addChild(logo);
			
			Param = {x:0, y:0, offsetX:Locator.DeviceWidth/2, offsetY:Locator.DeviceHeight*0.90};
			new FluidObject(logo, Param);
			
			logoPoint = new Point(logo.x,logo.y);
			weatherBTNPoint = new Point(weatherBTN.x,weatherBTN.y);
			tripsBTNPoint = new Point(tripsBTN.x,tripsBTN.y);
			eventsBTNPoint = new Point(eventsBTN.x,eventsBTN.y);
			myDealerBTNPoint = new Point(myDealerBTN.x,myDealerBTN.y);
			serviceBTNPoint = new Point(serviceBTN.x,serviceBTN.y);
		}
	}
}
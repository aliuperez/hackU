package
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import Assets.Assets;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Screens.Events;
	import Screens.Home;
	import Screens.MyDealer;
	import Screens.Service;
	import Screens.Specials;
	import Screens.Trips;
	import Screens.Weather;
	
	import ViewModel.ViewModelLocator;
	
	[SWF(backgroundColor="0x4C4C4C")]
	
	public class MyRide extends Sprite
	{
		public var GarageDoorPoint:Point = new Point();
		public var GarageDoor:Bitmap;
		
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
			
			createDoor();
			
			Locator.home.SwitchToScreen();
		}
		
		private function createDoor():void
		{
			var Param:Object;
			
			GarageDoor = new Assets.Assets.GarageDoor();
			GarageDoor.width = Locator.DeviceWidth;
			GarageDoor.height = Locator.DeviceHeight*0.55-Locator.home.weatherBTN.height;
			this.addChild(GarageDoor);
			Param = {x:0,y:0,offsetX:0,offsetY:0};
			new FluidObject(GarageDoor,Param);
			
			GarageDoorPoint = new Point (GarageDoor.x,GarageDoor.y);
		}
		
		public function transitionInAnimation():void
		{
			TweenLite.to(GarageDoor, 3, {y:-GarageDoor.height});
		}
		
		public function transitionOutAnimation():void
		{		
			TweenLite.to(GarageDoor, 1, {y:0, alpha:1,onComplete:onFinishTween});
			function onFinishTween():void
			{
				Locator.home.TweenComplete = true;
			}
		}
		
		private function createScreens():void
		{
			Locator.myRide = this;
			
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
						
			this.addChild(Locator.home);
			this.addChild(Locator.weather);
			this.addChild(Locator.events);
			this.addChild(Locator.myDealer);
			this.addChild(Locator.trips);
			this.addChild(Locator.service);
			this.addChild(Locator.specials);
		}
		
		private function setDeviceSize():void
		{
			var deviceSize:Rectangle = new Rectangle(0,0,Math.min(stage.fullScreenWidth,stage.fullScreenHeight),Math.max(stage.fullScreenWidth,stage.fullScreenHeight));
			
			Locator.DeviceHeight=deviceSize.height;
			Locator.DeviceWidth=deviceSize.width;
		}
	}
}
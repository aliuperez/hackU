package Screens
{
	import flash.events.Event;
	
	import Assets.Assets;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.HomeBTN;
	import Objects.GUI.Label;
	import Objects.GUI.Logo;

	public class Trips extends Screen
	{
				
		public function Trips()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			createButtons();
			createTitle();
		}
		
		private function createTitle():void
		{
			var Param:Object;
			
			titleLBL = new Label("My Trips",0,Locator.DeviceWidth-homeBTN.width,homeBTN.height,0,true,0x0f0f0f,0xFFFFFF);
			this.addChild(titleLBL);
			
			Param = {x:0, y:0, offsetX:Locator.DeviceWidth-titleLBL.width/2, offsetY:titleLBL.height/2};
			new FluidObject(titleLBL, Param);	
			
			icon = new Assets.Assets.TripsIcon();
			icon.width = Math.min(titleLBL.width,titleLBL.height);
			icon.height = icon.width;
			icon.x = Math.ceil(-icon.width/2);
			icon.y = Math.ceil(-icon.height/2);
			this.addChild(icon);
			
			Param = {x:0, y:0, offsetX:titleLBL.x+titleLBL.width/2-icon.width, offsetY:titleLBL.y-icon.height/2};
			new FluidObject(icon, Param);
			
			var logo:Logo = new Logo();
			this.addChild(logo);
			
			Param = {x:0, y:0, offsetX:titleLBL.x-titleLBL.width/2+icon.width/2, offsetY:titleLBL.y};
			new FluidObject(logo, Param);
		}
		
		private function createButtons():void
		{
			var Param:Object;
			
			homeBTN = new HomeBTN();
			this.addChild(homeBTN);
			
			Param = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:homeBTN.height/2};
			new FluidObject(homeBTN,Param);
			
		}
	}
}
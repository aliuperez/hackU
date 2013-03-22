package Screens
{
	import flash.events.Event;
	
	import Assets.Assets;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.ExitBTN;
	import Objects.GUI.HomeBTN;
	import Objects.GUI.Label;

	public class MoreInfo extends Screen
	{
		private var exitBTN:ExitBTN;
		public function MoreInfo()
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
			
			titleLBL = new Label("MoreInfo",0,Locator.DeviceWidth-exitBTN.width,exitBTN.height,0,true,0xea1c25,0xFFFFFF);
			this.addChild(titleLBL);
			
			Param = {x:0, y:0, offsetX:Locator.DeviceWidth-titleLBL.width/2, offsetY:titleLBL.height/2};
			new FluidObject(titleLBL, Param);	
			
			icon = new Assets.Assets.MoreInfoIcon();
			icon.width = Math.min(titleLBL.width,titleLBL.height);
			icon.height = icon.width;
			icon.x = Math.ceil(-icon.width/2);
			icon.y = Math.ceil(-icon.height/2);
			this.addChild(icon);
			
			Param = {x:0, y:0, offsetX:titleLBL.x+titleLBL.width/2-icon.width, offsetY:titleLBL.y-icon.height/2};
			new FluidObject(icon, Param);
		}
		
		private function createButtons():void
		{
			var Param:Object;
			
			exitBTN = new ExitBTN(this);
			this.addChild(exitBTN);
			
			Param = {x:0,y:0,offsetX:exitBTN.width/2,offsetY:exitBTN.height/2};
			new FluidObject(exitBTN,Param);
			
		}
		
	}
}
package Screens
{
	import flash.events.Event;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.HomeBTN;

	public class MyDealer extends Screen
	{
		public function MyDealer()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init)
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
			
			var homeBTNParam:Object = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:homeBTN.height/2};
			new FluidObject(homeBTN,homeBTNParam);
			
		}
	}
}
//if no dealer is set go to set dealer
//page links to events, call, specials, website, directions

package Screens
{
	import flash.events.Event;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.HomeBTN;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	public class MyDealer extends Screen
	{
		public var myDealer:String = "Honda Dealer";
		public var dealerNumber = "tel:17576174739";
		private var dealerAddress = "";
		
		
		
		
		
		
		public function MyDealer()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			makeCall();
			createButtons();
		}
		
		private function createButtons():void
		{
			var homeBTN:HomeBTN = new HomeBTN();
			this.addChild(homeBTN);
			
			var homeBTNParam:Object = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:homeBTN.height/2};
			new FluidObject(homeBTN,homeBTNParam);
			
		}
		
		
		private function setPhoneNumber():void
		{
			
			
		}
		
		
		private function getDirections():void
		{
			//google address	
		}
		
		private function makeCall():void
		{
			var targetURL:URLRequest = new URLRequest(dealerNumber);
			navigateToURL(targetURL);
		}
		
		private function gotoEvents():void
		{
			//go to the events page
		}
		
		private function gotoSpecials():void
		{
			//go to specials page
		}
		
		private function gotoSetDealer():void
		{
			//go to set dealer page			
		}
		
	}
}
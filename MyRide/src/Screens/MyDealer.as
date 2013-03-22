//if no dealer is set go to set dealer
//page links to events, call, specials, website, directions

package Screens
{
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.HomeBTN;


	public class MyDealer extends Screen
	{
		public var myDealer:String = "Honda Dealer";
		public var phoneNumber:String = "tel:17576174739";
		private var Address1 = "123 Whatever Dr.";
		private var Address2 = "Chesapeake VA, 23320";
		private var website = "http://powersports.honda.com/";
		
		
		private var dealerText : TextField = new TextField();
		private var phoneText : TextField = new TextField();
		private var addressText : TextField = new TextField();
		
		public function MyDealer()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			//gotoSite();
			createButtons();
		}
		
		private function createButtons():void
		{
			var homeBTN:HomeBTN = new HomeBTN();
			this.addChild(homeBTN);
			
			var homeBTNParam:Object = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:homeBTN.height/2};
			new FluidObject(homeBTN,homeBTNParam);
			
		}
		
		private function placeText():void
		{
			
			//add kids
			addChild(dealerText);
			addChild(phoneText);
			addChild(addressText);

			
			var Param:Object;
			
			//move stuff
			Param = {x:0, y:0, offsetX:ScreenWidth/2, offsetY:ScreenHeight/2};
			new FluidObject(dealerText, Param);

			
		}
		
		
		private function setPhoneNumber():void
		{
			
			
		}
		
		
		private function getDirections():void
		{
			//var targetURL:URLRequest = new URLRequest(dealerNumber);
			//navigateToURL(targetURL);
		}
		
		private function makeCall():void
		{
			var targetURL:URLRequest = new URLRequest(phoneNumber);
			navigateToURL(targetURL);
		}
		
		private function gotoSite():void
		{
			var targetURL:URLRequest = new URLRequest(website);
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
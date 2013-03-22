//if no dealer is set go to set dealer
//page links to events, call, specials, website, directions

package Screens
{
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.EventsBTN;
	import Objects.GUI.HomeBTN;


	public class MyDealer extends Screen
	{
		public var myDealer:String = "Honda Dealer";
		
		
		public var areaCode:String = "757";
		public var phone1:String = "617";
		public var phone2:String = "4739";
		private var Address1:String = "123 Whatever Dr.";
		private var Address2:String = "Chesapeake VA, 23320";
		private var website:String = "http://powersports.honda.com/";
		
		
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
			placeText();
		}
		
		private function createButtons():void
		{
			var homeBTN:HomeBTN = new HomeBTN();
			this.addChild(homeBTN);
			
			var eventsBTN:EventsBTN = new EventsBTN();
			this.addChild(eventsBTN);
			
			var Param:Object = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:homeBTN.height/2};
			new FluidObject(homeBTN,Param);
			
			Param = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:ScreenHeight-eventsBTN.height};
			new FluidObject(eventsBTN,Param);
			
		}
		
		private function placeText():void
		{
			
			dealerText.text = myDealer;
			phoneText.text = getPhoneText();
			addressText.text = Address1 +"\n" +Address2;

			//add kids
			addChild(dealerText);
			addChild(phoneText);
			addChild(addressText);
			

			
			var Param:Object;
			
			//move stuff
			Param = {x:0, y:0, offsetX:ScreenWidth/2-dealerText.width/2, offsetY:ScreenHeight/5};
			new FluidObject(dealerText, Param);

			Param = {x:0, y:0, offsetX:ScreenWidth/2-dealerText.width/2, offsetY:dealerText.y + dealerText.height/4};
			new FluidObject(phoneText, Param);
			
			Param = {x:0, y:0, offsetX:ScreenWidth/2-dealerText.width/2, offsetY:phoneText.y + phoneText.height/4};
			new FluidObject(addressText, Param);
		}
		
		
		
		
		private function getPhoneText():String
		{
			var num:String = "("+areaCode+")-"+phone1 +"-" +phone2;
			
			
			return num;
		}
		
		
		private function getPhoneURL():String
		{
			var num:String = "tel:1"+areaCode+phone1+phone2;
			
			return num;
		}
		
		private function getDirections():void
		{
			//var targetURL:URLRequest = new URLRequest(dealerNumber);
			//navigateToURL(targetURL);
		}
		
		private function makeCall():void
		{
			var targetURL:URLRequest = new URLRequest(getPhoneURL());
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
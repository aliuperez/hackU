/*	Events Page functions
*		
*
*/
package Screens
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.GUI.HomeBTN;
	
	import Screens.Screen;
	
	public class Events extends Screen
	{
		
		//Text Fields
		private var box1 : TextField = new TextField();
		private var box2 : TextField = new TextField();
		private var box3 : TextField = new TextField();
		private var box4 : TextField = new TextField();
		private var box5 : TextField = new TextField();
		
		//hardcoded demo information
		private var eventTitleArray : Array = new Array("1","2","3","4","5");
		private var eventDistanceArray : Array = new Array("1","2","3","4","5");
		private var eventHostArray : Array = new Array("1","2","3","4","5");
		private var hostWebsiteArray : Array = new Array("1","2","3","4","5");
	
		//Construct
		public function Events()
		{
			super();
			
			box1.text = eventTitleArray[0] + " " + eventDistanceArray[0];
			box2.text = eventTitleArray[1] + " " + eventDistanceArray[1];
			box3.text = eventTitleArray[2] + " " + eventDistanceArray[2];
			box4.text = eventTitleArray[3] + " " + eventDistanceArray[3];
			box5.text = eventTitleArray[4] + " " + eventDistanceArray[4];
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			createButtons();
			placeText();

		}	
		
		private function createButtons():void
		{
			var homeBTN:HomeBTN = new HomeBTN();
			this.addChild(homeBTN);
			
			var homeBTNParam:Object = {x:0,y:0,offsetX:Locator.DeviceWidth/2,offsetY:Locator.DeviceHeight/2};
			new FluidObject(homeBTN,homeBTNParam);
		}
		
		private function placeText():void
		{
			//add kids
			addChild(box1);
			addChild(box2);
			addChild(box3);
			addChild(box4);
			addChild(box5);
		}
	}
}
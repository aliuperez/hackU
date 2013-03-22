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
	
	import Assets.Assets;
	
	import Dependencies.FluidLayout.FluidObject;
	
	import Objects.EventTitle;
	import Objects.GUI.HomeBTN;
	import Objects.GUI.Label;
	
	import Screens.Screen;
	
	public class Events extends Screen
	{			
		
		//hardcoded demo information
		private var eventTitleArray : Array = new Array("Women's Garage Party","21st Annual Spring Bike Show","Poker Run","Motorcycle Bootcamp","Turner's Honda Dinner Ride");
		private var eventDistanceArray : Array = new Array("5.4","8.8","11.9","13.5","35.2");
		private var eventHostArray : Array = new Array("1","2","3","4","5");
		private var eventHostWebsiteArray : Array = new Array("1","2","3","4","5");
		private var EventTitles:Array = new Array();

		//Construct
		public function Events()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			createButtons();
			createTitle();
			createEvents();
			positionEventLabels();
		}	
		
		private function createTitle():void
		{
			var Param:Object;
			
			titleLBL = new Label("Events",0,Locator.DeviceWidth-homeBTN.width,homeBTN.height,0,true,0x0f0f0f,0xFFFFFF);
			this.addChild(titleLBL);
			
			Param = {x:0, y:0, offsetX:Locator.DeviceWidth-titleLBL.width/2, offsetY:titleLBL.height/2};
			new FluidObject(titleLBL, Param);	
			
			icon = new Assets.Assets.EventsIcon();
			icon.width = Math.min(titleLBL.width,titleLBL.height);
			icon.height = icon.width;
			icon.x = Math.ceil(-icon.width/2);
			icon.y = Math.ceil(-icon.height/2);
			this.addChild(icon);
			
			Param = {x:0, y:0, offsetX:titleLBL.x+titleLBL.width/2-icon.width, offsetY:titleLBL.y-icon.height/2};
			new FluidObject(icon, Param);
		}
		
		private function createEvents():void
		{
			var hardCodedEvents:int = 5;
			for(var i:int = 0;i<hardCodedEvents;i++)
			{
				var LabelWidth:int = Locator.DeviceWidth;
				var LabelHeight:int = (Locator.DeviceHeight-homeBTN.height)/hardCodedEvents;
				var event:EventTitle = new EventTitle(eventTitleArray[i],eventDistanceArray[i],eventHostArray[i],eventHostWebsiteArray[i],LabelWidth,LabelHeight);
				
				this.addChild(event);
				EventTitles.push(event);
			}
		}
		
		private function positionEventLabels():void
		{
			var Param:Object;
			var count:int = 1;
			for(var i:int = 0;i<EventTitles.length;i++)
			{
				trace(EventTitles[i].height);
					Param = {x:0, y:0, offsetX:EventTitles[i].width/2, offsetY:-12*(count-1)+(homeBTN.y+homeBTN.height/2+EventTitles[i].height/2)*count};
					new FluidObject(EventTitles[i], Param);				
				
				count++
			}
			
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
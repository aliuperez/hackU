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
	
	import Objects.EventTitle;
	import Objects.GUI.HomeBTN;
	import Objects.GUI.Label;
	
	import Screens.Screen;
	
	public class Events extends Screen
	{
	
		private var homeBTN:HomeBTN;
			
		
		//hardcoded demo information
		private var eventTitleArray : Array = new Array("I have info","2","3","4","5");
		private var eventDistanceArray : Array = new Array("1","2","3","4","5");
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
			createEvents();
			positionEventLabels();
		}	
		
		private function createEvents():void
		{
			for(var i:int = 0;i<5;i++)
			{
				var event:EventTitle = new EventTitle(eventTitleArray[i],eventDistanceArray[i],eventHostArray[i],eventHostWebsiteArray[i]);
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
				trace(homeBTN.x);
					Param = {x:0, y:0, offsetX:EventTitles[i].width/2, offsetY:((homeBTN.x-homeBTN.height/2-11)*count)+((EventTitles[i].height-7)*count)};
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
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
		private var refX : int;
		private var refY : int;
			
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
			
			setText();
			createEvents();
			positionEventLabels();
			placeText();

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
					Param = {x:0, y:0, offsetX:EventTitles[i].width/2, offsetY:(homeBTN.y+homeBTN.height/2+EventTitles[i].height/2)*count};
					new FluidObject(EventTitles[i], Param);				
				
				count++
			}
			
		}
		
		private function setText():void
		{			
			box1.text = eventTitleArray[0] + " " + eventDistanceArray[0];
			box2.text = eventTitleArray[1] + " " + eventDistanceArray[1];
			box3.text = eventTitleArray[2] + " " + eventDistanceArray[2];
			box4.text = eventTitleArray[3] + " " + eventDistanceArray[3];
			box5.text = eventTitleArray[4] + " " + eventDistanceArray[4];
		}
		
		private function createButtons():void
		{
			var Param:Object;
			homeBTN = new HomeBTN();
			this.addChild(homeBTN);
			
			Param = {x:0,y:0,offsetX:homeBTN.width/2,offsetY:homeBTN.height/2};
			new FluidObject(homeBTN,Param);
		}
		
		private function placeText():void
		{

			var Param:Object;
			//add kids
			addChild(box1);
			addChild(box2);
			addChild(box3);
			addChild(box4);
			addChild(box5);
			
			
			Param = {x:0, y:0, offsetX:homeBTN.width/2 - box1.width /2, offsetY:ScreenHeight/2 - box1.height/2};
			new FluidObject(box1, Param);
		}
	}
}
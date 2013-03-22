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
		private var eventTitleArray : Array = new Array("   5.4 mi - Women's Garage Party","   8.8 mi - 21st Annual Spring Bike Show","   11.9 mi - Poker Run","   13.5 mi - Motorcycle Bootcamp","   35.2 mi - Turner's Honda Dinner Ride");
		private var eventDistanceArray : Array = new Array("","","","","");
		private var eventHostArray : Array = new Array("Southside Harley-Davidson\n" +
													   "385 N. Witchduck Road\n" +
													   "Virginia Beach, VA 23462",
													   "Adventure BMW\n" +
													   "669 Woodlake Drive\n" +
													   "Chesapeake, VA 23320",
													   "Sunrise Cycles\n" +
													   "1559 E. Little Creek Road\n" +
													   "Norfolk, VA 23513",
													   "Bayside Harley-Davidson\n" +
													   "2211 Frederick Boulevard\n" +
												       "Portsmouth, VA 23704",
													   "Turner's Honda\n" +
													   "1111 W. Ehringhaus Street\n" +
													   "Elizabeth City, NC 27909");
		private var eventHostPhoneArray : Array = new Array("757-499-8964","757-523-7055","757-583-2223","757-397-5550","252-335-5489");
		private var eventDescArray : Array = new Array("March 30th, 2013 - 11am-2pm\n" +
													   "It’s time to kick-start a new chapter in your life!  It has never been easier for women to grab the handlebars and find freedom and adventure on two wheels.  We’ll show you how!  Join the female employees at Hal’s for a Women’s Only Garage Party on Saturday, March 30th.\n" +
													   "Check-in at 10:30am.\n" +  
													   "Party 11am-1pm.\n" +
													   "Refreshments provided.\n" +
													   "Space is limited for this free event!",
													   "April 20th, 2013 - 10am-4pm\n" +
													   "Become part of the tradition that has been going on for 20 plus years!  Judged by the International Bike Builders Association.\n" +
													   "More info to come.",
													   "May 25th, 2013 - 9am-TBD" +
													   "GWRRA Chapter NC-E2 Poker Run benefiting RIDE FOR KIDS. Registration begins at 9:00am at Adventure BMW. Ride, Door Prizes, Food. The Precision Drill Team will perform at 1:00pm at Waterfront Park!" +
													   "Come join the fun!",
													   "April 13th, 2013 - 1pm-6pm\n" +
													   "This is basic training for guys who are ready to learn to ride.  Bring a buddy, grab a cold one and get ready to kick start some good times!Motorcycle Boot Camp is basic training for anyone ready to ride.  We know there are a ton of questions about how to get started, and we want to make it easy.  We'll start with the basics and go headlights to tailpipes, getting you up to speed on everything from learning to ride to gear that fits your style.",
													   "May 11th, 2013 - 8pm-10pm\n" +
													   "Traveling to WHITLEY'S BARBEQUE in Murfreesboro, NC. Leave Turner's at 3:00pm.  Door Prizes and 50/50 raffle to benefit RIDE FOR KIDS.\n" +
													   "Call for more information.")

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
				var event:EventTitle = new EventTitle(eventTitleArray[i],eventDistanceArray[i],eventHostArray[i],eventHostPhoneArray[i],LabelWidth,LabelHeight);
				
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
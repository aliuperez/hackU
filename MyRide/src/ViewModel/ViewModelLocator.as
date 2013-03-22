package ViewModel {

	import Screens.Events;
	import Screens.Home;
	import Screens.MoreInfo;
	import Screens.MyDealer;
	import Screens.Service;
	import Screens.Specials;
	import Screens.Trips;
	import Screens.Weather;

	public class ViewModelLocator
	{
		
		
		// Single Instance of Our ModelLocator
		private static var instance:ViewModelLocator;
		public function ViewModelLocator(enforcer:SingletonEnforcer)
		{
			if (enforcer == null) {
				throw new Error( "You Can Only Have One ModelLocator" );
			}
			
		}
		// Returns the Single Instance
		public static function getInstance() : ViewModelLocator {
			if (instance == null) {
				instance = new ViewModelLocator( new SingletonEnforcer );
			}
			return instance;
		}
		//DEFINE VARIABLES 
		public var DeviceHeight:int;
		public var DeviceWidth:int;
		
		// Screens
		public var weather:Weather;
		public var home:Home;
		public var events:Events;
		public var myDealer:MyDealer;
		public var trips:Trips;
		public var service:Service;
		public var specials:Specials;
		public var moreInfo:MoreInfo;
		
		//Specialized functions for the the model locator.
		public function resetBTNPosition():void
		{
			home.GarageDoor.x = home.GarageDoorPoint.x;
			home.GarageDoor.y = home.GarageDoorPoint.y;
			
			home.weatherBTN.x = home.weatherBTNPoint.x;
			home.weatherBTN.y = home.weatherBTNPoint.y;
			
			home.eventsBTN.x = home.eventsBTNPoint.x;
			home.eventsBTN.y = home.eventsBTNPoint.y;
			
			home.tripsBTN.x = home.tripsBTNPoint.x;
			home.tripsBTN.y = home.tripsBTNPoint.y;
			
			home.myDealerBTN.x = home.myDealerBTNPoint.x;
			home.myDealerBTN.y = home.myDealerBTNPoint.y;
			
			home.serviceBTN.x = home.serviceBTNPoint.x;
			home.serviceBTN.y = home.serviceBTNPoint.y;
		}
	}
}
class SingletonEnforcer{};
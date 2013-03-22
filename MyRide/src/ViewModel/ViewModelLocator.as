package ViewModel {

	import Screens.Events;
	import Screens.Home;
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
		
		//Specialized functions for the the model locator.
		
	}
}
class SingletonEnforcer{};
package Objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class Bike extends Sprite
	{
		private var _BikeID:String;
		private var _Manufacturer:String;
		private var _Model:String;
		private var _Mileage:int;
		
		private var Sprite:Bitmap;
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Bike(BikeID:String)
		{
			super();
			this._BikeID = BikeID;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			selectBike();
		}
		
		private function selectBike():void
		{
			switch (_BikeID)
			{
				case "Yamaha":
					Sprite = new Assets.Assets.YamahaBike();
					
					break;
				
				case "Ninja":
					Sprite = new Assets.Assets.NinjaBike();
					
					break;
				
				case "Honda":
					Sprite = new Assets.Assets.HondaBike();
					
					break;
				
				case "Harley":
					Sprite = new Assets.Assets.HarleyBike();
					
					break;
			}
			
			Sprite.width = Locator.DeviceWidth*0.5;
			Sprite.height = Locator.DeviceHeight*0.3;
			
			Sprite.x = Math.ceil(-Sprite.width/2);
			Sprite.y = Math.ceil(-Sprite.height/2);
			this.addChild(Sprite);
		}
		
		public function get Manufacturer():String
		{
			return _Manufacturer;
		}

		public function set Manufacturer(value:String):void
		{
			_Manufacturer = value;
		}

		public function get Model():String
		{
			return _Model;
		}

		public function set Model(value:String):void
		{
			_Model = value;
		}

		public function get Mileage():int
		{
			return _Mileage;
		}

		public function set Mileage(value:int):void
		{
			_Mileage = value;
		}


	}
}
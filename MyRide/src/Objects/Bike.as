package Objects
{
	import flash.display.Sprite;
	
	public class Bike extends Sprite
	{
		private var _Manufacturer:String;
		private var _Model:String;
		private var _Mileage:int;
		
		public function Bike()
		{
			super();
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
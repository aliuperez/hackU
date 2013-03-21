package Objects
{
	import flash.display.Sprite;
	
	public class Service extends Sprite
	{
		private var _Date:String; //To be changed to Date file type
		private var _Type:String;
		private var _Mileage:int;
		
		public function Service()
		{
			super();
		}

		public function get Date():String
		{
			return _Date;
		}

		public function set Date(value:String):void
		{
			_Date = value;
		}

		public function get Type():String
		{
			return _Type;
		}

		public function set Type(value:String):void
		{
			_Type = value;
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
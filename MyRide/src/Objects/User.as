package Objects
{
	import flash.display.Sprite;
	
	public class User extends Sprite
	{
		private var _FirstName:String;
		private var _LastName:String;
		public var MyBikes:Array = new Array();
		
		public function User()
		{
			super();
		}
		
		
		public function get FirstName():String
		{
			return _FirstName;
		}

		public function set FirstName(value:String):void
		{
			_FirstName = value;
		}

		public function get LastName():String
		{
			return _LastName;
		}

		public function set LastName(value:String):void
		{
			_LastName = value;
		}


	}
}
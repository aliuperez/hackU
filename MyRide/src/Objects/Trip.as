package Objects
{
	import flash.display.Sprite;
	
	public class Trip extends Sprite
	{
		private var _TrailName:String;
		//need variables to store trip location data (coordinates)
		
		public function Trip()
		{
			super();
		}

		public function get TrailName():String
		{
			return _TrailName;
		}

		public function set TrailName(value:String):void
		{
			_TrailName = value;
		}

	}
}
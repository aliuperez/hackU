package Objects
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Objects.GUI.Label;
	
	import ViewModel.ViewModelLocator;
	
	public class EventTitle extends Sprite
	{
		private var _Title:String;
		private var _Distance:int;
		private var _Host:String;
		private var _HostWebsite:String;
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function EventTitle(Title:String,Distance:int,Host:String,HostWebsite:String)
		{
			super();
			this._Title = Title;
			this._Distance = Distance;
			this._Host = Host;
			this._HostWebsite = HostWebsite;
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			draw();
		}
		
		private function draw():void
		{
			var tab:String = new String();

			for(var i:int=0;i<Locator.DeviceWidth/8;i++)
			{
				tab +=" ";
			}

			
			var EventTitlesLBL:Label = new Label(_Title+tab+_Distance,1,Locator.DeviceWidth,(Locator.DeviceHeight-Locator.DeviceHeight*0.10)/5);
			this.addChild(EventTitlesLBL);
		}

		public function get Title():String
		{
			return _Title;
		}

		public function set Title(value:String):void
		{
			_Title = value;
		}

		public function get Distance():int
		{
			return _Distance;
		}

		public function set Distance(value:int):void
		{
			_Distance = value;
		}

		public function get Host():String
		{
			return _Host;
		}

		public function set Host(value:String):void
		{
			_Host = value;
		}

		public function get HostWebsite():String
		{
			return _HostWebsite;
		}

		public function set HostWebsite(value:String):void
		{
			_HostWebsite = value;
		}


	}
}
package Objects
{
	import flash.display.Sprite;
	import flash.display3D.IndexBuffer3D;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Objects.GUI.Label;
		
	import ViewModel.ViewModelLocator;
	
	public class EventTitle extends Sprite
	{
		private var _Title:String;
		private var _Distance:int;
		private var _Host:String;
		private var _HostWebsite:String;
		private var _LabelWidth:int;
		private var _LabelHeight:int;
		
		
		public var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function EventTitle(Title:String,Distance:int,Host:String,HostWebsite:String,LabelWidth:int,LabelHeight:int)
		{
			super();
			this._Title = Title;
			this._Distance = Distance;
			this._Host = Host;
			this._HostWebsite = HostWebsite;
			this._LabelWidth = LabelWidth;
			this._LabelHeight = LabelHeight;
			
			this.addEventListener(Event.ADDED_TO_STAGE,init)
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			draw();
			
			this.addEventListener(MouseEvent.CLICK,click);
		}
		
		protected function click(event:MouseEvent):void
		{
			populateMoreInfo();
		}
		
		private function populateMoreInfo():void
		{
			Locator.moreInfo.visible = true;
		}
		
		private function draw():void
		{
			var tab:String = new String();

			/*for(var i:int=0;i<Locator.DeviceWidth/10;i++)
			{
				tab +=" ";
			}*/

			
			var EventTitlesLBL:Label = new Label(_Title,1,_LabelWidth,_LabelHeight,0.1,false,0x131DA6,0xFFFFFF);
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

		public function get LabelWidth():int
		{
			return _LabelWidth;
		}

		public function set LabelWidth(value:int):void
		{
			_LabelWidth = value;
		}

		public function get LabelHeight():int
		{
			return _LabelHeight;
		}

		public function set LabelHeight(value:int):void
		{
			_LabelHeight = value;
		}


	}
}

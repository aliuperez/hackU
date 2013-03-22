package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	
	public class Label extends Sprite
	{
		private var _LineThickness:int;
		private var _LabelText:String;
		private var _LabelWidth:int;
		private var _LabelHeight:int;
		
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Label(LabelText:String,LabelThickness:int,LabelWidth:int, LabelHeight:int)
		{
			super();
			this._LabelText = LabelText;
			this._LineThickness = LabelThickness;
			this._LabelWidth = LabelWidth;
			this._LabelHeight = LabelHeight;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			Draw();
			
			this.addEventListener(MouseEvent.CLICK,click);
		}
		
		protected function click(event:MouseEvent):void
		{
			Locator.events.SwitchToScreen();
		}
		
		private function Draw():void
		{
			
			var Label:Shape = new Shape();
			Label.graphics.lineStyle(_LineThickness);
			Label.graphics.beginFill(0x131DA6);
			Label.graphics.drawRect(0,0,_LabelWidth,_LabelHeight);
			Label.x = Math.ceil(-Label.width/2);
			Label.y = Math.ceil(-Label.height/2);
			Label.graphics.endFill();
			
			this.addChild(Label);
			
			var myFormat : TextFormat = new TextFormat();
			
			myFormat.size = 20;
			myFormat.leftMargin = Label.width * .1;
			
			var text:TextField = new TextField();			
			Label.graphics.beginFill(0x000000);
			text.width=Label.width;
			text.x = Label.x;
			text.y = Label.y + Label.height/2;
			text.text = _LabelText;
			Label.graphics.endFill();
			text.setTextFormat(myFormat);
			this.addChild(text);
		}
		
		public function get LineThickness():int
		{
			return _LineThickness;
		}
		
		public function set LineThickness(value:int):void
		{
			_LineThickness = value;
		}
		
		public function get LabelText():String
		{
			return _LabelText;
		}
		
		public function set LabelText(value:String):void
		{
			_LabelText = value;
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
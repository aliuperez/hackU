package Objects.GUI
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import ViewModel.ViewModelLocator;
	
	
	public class Label extends Sprite
	{
		private var _LineThickness:int;
		private var _LabelText:String;
		private var _LabelWidth:int;
		private var _LabelHeight:int;
		private var _LeftMargin:Number;
		private var _Center:Boolean = false;
		private var _Color:uint;
		private var _FontColor:uint;
		
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Label(LabelText:String,LabelThickness:int,LabelWidth:int, LabelHeight:int,LeftMargin:Number,Center:Boolean,Color:uint,FontColor:uint = 0x000000)
		{
			super();
			this._LabelText = LabelText;
			this._LineThickness = LabelThickness;
			this._LabelWidth = LabelWidth;
			this._LabelHeight = LabelHeight;
			this._LeftMargin = LeftMargin;
			this._Center = Center;
			this._Color = Color;
			this._FontColor = FontColor;
			
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
			Label.graphics.beginFill(Color);
			Label.graphics.drawRect(0,0,_LabelWidth,_LabelHeight);
			Label.graphics.endFill();
			
			this.addChild(Label);
			
			var myFormat : TextFormat = new TextFormat();
			var textSize:int = 50;
			myFormat.size = textSize;
			
			myFormat.leftMargin = Label.width * _LeftMargin;
			myFormat.color = _FontColor;
			
			var text:TextField = new TextField();
			
			if(_Center)
			{
				myFormat.leftMargin=0;
				myFormat.align = "center";
			}
			
			text.border = false;
			text.width=Label.width;
			text.height=textSize;
			text.text = _LabelText;
			text.setTextFormat(myFormat);
			this.addChild(text);
			
			Label.x = Math.ceil(-Label.width/2);
			Label.y = Math.ceil(-Label.height/2)
				
			text.x = Label.x;
			text.y = Label.y+Label.height/2-text.height/2;
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

		public function get Color():uint
		{
			return _Color;
		}

		public function set Color(value:uint):void
		{
			_Color = value;
		}

		public function get FontColor():uint
		{
			return _FontColor;
		}

		public function set FontColor(value:uint):void
		{
			_FontColor = value;
		}

		public function get LeftMargin():Number
		{
			return _LeftMargin;
		}

		public function set LeftMargin(value:Number):void
		{
			_LeftMargin = value;
		}

		public function get Center():Boolean
		{
			return _Center;
		}

		public function set Center(value:Boolean):void
		{
			_Center = value;
		}


	}
}
package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	
	public class Label extends Sprite
	{
		private var _LineThickness:int;
		private var _LabelText:String;
		
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Label(LabelText:String,LabelThickness:int)
		{
			super();
			this._LabelText = LabelText;
			this._LineThickness = LabelThickness;
			
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
			Label.graphics.beginFill(0x881D9D);
			Label.graphics.drawRect(0,0,64,64);
			Label.x = Math.ceil(-Label.width/2);
			Label.y = Math.ceil(-Label.height/2);
			Label.graphics.endFill();
			
			this.addChild(Label);
			
			var text:TextField = new TextField();
			Label.graphics.lineStyle(_LineThickness);
			text.x = Label.x + Math.ceil(-text.width/2);
			text.y = Label.y + Math.ceil(-text.height/2);
			text.text = _LabelText;
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
	}
}
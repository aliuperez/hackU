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
	
	public class EventsBTN extends Sprite
	{
		public var EventsBTNSprite:Shape;
		public var icon:Bitmap;
		public var text:TextField
		
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function EventsBTN()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			Draw();
			
			this.addEventListener(MouseEvent.CLICK,click);
			this.addEventListener(Event.ENTER_FRAME,update);
		}
		
		protected function click(event:MouseEvent):void
		{
			Locator.home.transitionOutAnimation();
		}
		
		private function update(event:Event):void
		{
			if (Locator.home.TweenComplete == true)
			{			
				Locator.home.TweenComplete =false;
				Locator.events.SwitchToScreen();
				Locator.resetBTNPosition();
			}
		}
		
		private function Draw():void
		{
			EventsBTNSprite = new Shape();
			EventsBTNSprite.graphics.beginFill(0x0f0f0f);
			EventsBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.35,Locator.DeviceHeight*0.25);
			EventsBTNSprite.x = Math.ceil(-EventsBTNSprite.width/2);
			EventsBTNSprite.y = Math.ceil(-EventsBTNSprite.height/2);
			EventsBTNSprite.graphics.endFill();
			
			this.addChild(EventsBTNSprite);
			
			
			icon = new Assets.Assets.EventsIcon();
			icon.width = Math.min(EventsBTNSprite.width,EventsBTNSprite.height)*0.75;
			icon.height = icon.width;
			icon.x = -icon.width/2;
			icon.y = -icon.height/1.5;
			this.addChild(icon);
			
			var myFormat : TextFormat = new TextFormat();
			var textSize:int = icon.height/4;
			myFormat.size = textSize;
			
			myFormat.align ="center";
			myFormat.color = 0xFFFFFF;
			
			text = new TextField();
			text.selectable=false;
			text.border = false;
			text.width=EventsBTNSprite.width;
			text.height=textSize*1.25;
			text.text = "Events";
			text.setTextFormat(myFormat);
			text.x = -text.width/2;
			text.y = icon.y+icon.height;
			this.addChild(text);

		}
	}
}
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
	
	public class TripsBTN extends Sprite
	{
		public var TripsBTNSprite:Shape;
		public var icon:Bitmap;
		public var text:TextField
		
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function TripsBTN()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			Draw();
			
			this.addEventListener(MouseEvent.CLICK,click);
		}
		
		private function update(event:Event):void
		{
			if (Locator.home.TweenComplete == true)
			{			
				Locator.home.TweenComplete =false;
				Locator.trips.SwitchToScreen();
				Locator.resetBTNPosition();
				this.removeEventListener(Event.ENTER_FRAME,update);
			}
		}
		
		protected function click(event:MouseEvent):void
		{
			Locator.home.transitionOutAnimation();
			this.addEventListener(Event.ENTER_FRAME,update);
		}
		
		private function Draw():void
		{
			TripsBTNSprite = new Shape();
			TripsBTNSprite.graphics.beginFill(0x0f0f0f);
			TripsBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.45,Locator.DeviceHeight*0.15);//2nd number is the aspect ratio
			TripsBTNSprite.x = Math.ceil(-TripsBTNSprite.width/2);
			TripsBTNSprite.y = Math.ceil(-TripsBTNSprite.height/2);
			TripsBTNSprite.graphics.endFill();
			
			this.addChild(TripsBTNSprite);
					
			icon= new Assets.Assets.TripsIcon();
			icon.width = Math.min(TripsBTNSprite.width,TripsBTNSprite.height)*0.75;
			icon.height = icon.width;
			icon.x = TripsBTNSprite.width/2-icon.width;
			icon.y = -icon.height/2;
			this.addChild(icon);
			
			var myFormat : TextFormat = new TextFormat();
			var textSize:int = icon.height/4;
			myFormat.size = textSize;
			myFormat.align ="center";
			myFormat.rightMargin = TripsBTNSprite.width*0.3;
			myFormat.color = 0xFFFFFF;
			
			text = new TextField();
			text.selectable=false;			
			text.border = false;
			text.width=TripsBTNSprite.width*0.75;
			text.height=textSize*1.25;
			text.text = "My Trips";
			text.setTextFormat(myFormat);
			text.x = -text.width/2;
			text.y = TripsBTNSprite.y+TripsBTNSprite.height/2-text.height/2;
			this.addChild(text);
		}
	}
}

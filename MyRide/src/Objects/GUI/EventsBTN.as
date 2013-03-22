package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class EventsBTN extends Sprite
	{
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
		}
		
		protected function click(event:MouseEvent):void
		{
			Locator.events.SwitchToScreen();
		}
		
		private function Draw():void
		{
			var EventsBTNSprite:Shape = new Shape();
			EventsBTNSprite.graphics.beginFill(0x0f0f0f);
			EventsBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.35,Locator.DeviceHeight*0.25);
			EventsBTNSprite.x = Math.ceil(-EventsBTNSprite.width/2);
			EventsBTNSprite.y = Math.ceil(-EventsBTNSprite.height/2);
			EventsBTNSprite.graphics.endFill();
			
			this.addChild(EventsBTNSprite);
			
			var icon:Bitmap = new Assets.Assets.EventsIcon();
			icon.width = Math.min(EventsBTNSprite.width,EventsBTNSprite.height);
			icon.height = icon.width;
			icon.x = Math.ceil(-icon.width/2);
			icon.y = Math.ceil(-icon.height/2);
			this.addChild(icon);
		}
	}
}
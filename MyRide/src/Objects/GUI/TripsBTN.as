package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class TripsBTN extends Sprite
	{
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
		
		protected function click(event:MouseEvent):void
		{
			Locator.trips.SwitchToScreen();
		}
		
		private function Draw():void
		{
			var TripsBTNSprite:Shape = new Shape();
			TripsBTNSprite.graphics.beginFill(0x881D9D);
			TripsBTNSprite.graphics.drawRect(0,0,64,64);
			TripsBTNSprite.x = Math.ceil(-TripsBTNSprite.width/2);
			TripsBTNSprite.y = Math.ceil(-TripsBTNSprite.height/2);
			TripsBTNSprite.graphics.endFill();
			
			this.addChild(TripsBTNSprite);
			
			var icon:Bitmap = new Assets.Assets.TripsIcon();
			icon.width = TripsBTNSprite.width;
			icon.height = TripsBTNSprite.height;
			icon.x = Math.ceil(-icon.width/2);
			icon.y = Math.ceil(-icon.height/2);
			this.addChild(icon);
		}
	}
}

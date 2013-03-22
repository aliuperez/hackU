package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class PhoneBTN extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function PhoneBTN()
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
			Locator.myDealer.makeCall();
		}
		
		private function Draw():void
		{			
			var PhoneBTNSprite:Shape = new Shape();
			PhoneBTNSprite.graphics.beginFill(0x4C4C4C);
			PhoneBTNSprite.graphics.drawRect(0,0,Locator.DeviceHeight*0.10,Locator.DeviceHeight*0.1);
			PhoneBTNSprite.graphics.endFill();
			this.addChild(PhoneBTNSprite);
			PhoneBTNSprite.x = Math.ceil(-PhoneBTNSprite.width/2);
			PhoneBTNSprite.y = Math.ceil(-PhoneBTNSprite.height/2);
			
			var icon:Bitmap = new Assets.Assets.phoneIcon();
			icon.width = Math.min(PhoneBTNSprite.width,PhoneBTNSprite.height);
			icon.height = icon.width;
			this.addChild(icon);
			
			icon.x = Math.ceil(PhoneBTNSprite.x-PhoneBTNSprite.width/2+icon.width/2);
			icon.y = Math.ceil(PhoneBTNSprite.y-PhoneBTNSprite.height/2+icon.height/2);
		}
	}
}
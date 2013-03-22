package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class SpecialsBTN extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function SpecialsBTN()
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
			Locator.specials.SwitchToScreen();
		}
		
		private function Draw():void
		{
			var SpecialsBTNSprite:Shape = new Shape();
			SpecialsBTNSprite.graphics.beginFill(0xea1c25);
			SpecialsBTNSprite.graphics.drawRect(0,0,Locator.DeviceHeight*0.10,Locator.DeviceHeight*0.1);
			SpecialsBTNSprite.graphics.endFill();
			this.addChild(SpecialsBTNSprite);
			SpecialsBTNSprite.x = Math.ceil(-SpecialsBTNSprite.width/2);
			SpecialsBTNSprite.y = Math.ceil(-SpecialsBTNSprite.height/2);
			
			var icon:Bitmap = new Assets.Assets.SpecialsIcon();
			icon.width = Math.min(SpecialsBTNSprite.width,SpecialsBTNSprite.height);
			icon.height = icon.width;
			this.addChild(icon);
			
			icon.x = Math.ceil(SpecialsBTNSprite.x-SpecialsBTNSprite.width/2+icon.width/2);
			icon.y = Math.ceil(SpecialsBTNSprite.y-SpecialsBTNSprite.height/2+icon.height/2);
		}
	}
}
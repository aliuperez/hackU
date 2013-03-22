package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import Screens.MoreInfo;
	import ViewModel.ViewModelLocator;
	
	public class ExitBTN extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function ExitBTN(MoreInfoPage:MoreInfo)
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
			Locator.moreInfo.visible = false;
		}
		
		private function Draw():void
		{
			var ExitBTNSprite:Shape = new Shape();
			ExitBTNSprite.graphics.beginFill(0x4C4C4C);
			ExitBTNSprite.graphics.drawRect(0,0,Locator.DeviceHeight*0.10,Locator.DeviceHeight*0.1);
			ExitBTNSprite.graphics.endFill();
			this.addChild(ExitBTNSprite);
			ExitBTNSprite.x = Math.ceil(-ExitBTNSprite.width/2);
			ExitBTNSprite.y = Math.ceil(-ExitBTNSprite.height/2);
			
			var icon:Bitmap = new Assets.Assets.ExitIcon();
			icon.width = Math.min(ExitBTNSprite.width,ExitBTNSprite.height);
			icon.height = icon.width;
			this.addChild(icon);
			
			icon.x = Math.ceil(ExitBTNSprite.x-ExitBTNSprite.width/2+icon.width/2);
			icon.y = Math.ceil(ExitBTNSprite.y-ExitBTNSprite.height/2+icon.height/2);
		}
	}
}
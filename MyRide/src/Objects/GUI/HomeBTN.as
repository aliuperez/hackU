package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class HomeBTN extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function HomeBTN()
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
			Locator.home.SwitchToScreen();
		}
		
		private function Draw():void
		{
			var HomeBTNSprite:Shape = new Shape();
			HomeBTNSprite.graphics.beginFill(0x131DA6);
			HomeBTNSprite.graphics.drawRect(0,0,64,64);
			HomeBTNSprite.x = Math.ceil(-HomeBTNSprite.width/2);
			HomeBTNSprite.y = Math.ceil(-HomeBTNSprite.height/2);
			HomeBTNSprite.graphics.endFill();
			this.addChild(HomeBTNSprite);
			
			var icon:Bitmap = new Assets.Assets.HomeIcon();
			icon.width = HomeBTNSprite.width;
			icon.height = HomeBTNSprite.height;
			icon.x = HomeBTNSprite.x-HomeBTNSprite.width/2+icon.width/2;
			icon.y = HomeBTNSprite.y-HomeBTNSprite.height/2+icon.height/2;
			this.addChild(icon);
		}
	}
}
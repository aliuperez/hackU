package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class Logo extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function Logo()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			
			Draw();
			
		}
		
		private function Draw():void
		{			
			var LogoSprite:Shape = new Shape();
			LogoSprite.graphics.beginFill(0x4C4C4C,0);
			LogoSprite.graphics.drawRect(0,0,Locator.DeviceHeight*0.08,Locator.DeviceHeight*0.08);
			LogoSprite.graphics.endFill();
			this.addChild(LogoSprite);
			LogoSprite.x = Math.ceil(-LogoSprite.width/2);
			LogoSprite.y = Math.ceil(-LogoSprite.height/2);
			
			var icon:Bitmap = new Assets.Assets.Logo();
			icon.width = Math.min(LogoSprite.width,LogoSprite.height);
			icon.height = icon.width;
			this.addChild(icon);
			
			icon.x = Math.ceil(LogoSprite.x-LogoSprite.width/2+icon.width/2);
			icon.y = Math.ceil(LogoSprite.y-LogoSprite.height/2+icon.height/2);
		}
	}
}
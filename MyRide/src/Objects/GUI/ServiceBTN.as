package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class ServiceBTN extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function ServiceBTN()
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
			Locator.service.SwitchToScreen();
		}
		
		private function Draw():void
		{
			var ServiceBTNSprite:Shape = new Shape();
			ServiceBTNSprite.graphics.beginFill(0x881D9D);
			ServiceBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.65,Locator.DeviceHeight*0.15);
			ServiceBTNSprite.x = Math.ceil(-ServiceBTNSprite.width/2);
			ServiceBTNSprite.y = Math.ceil(-ServiceBTNSprite.height/2);
			ServiceBTNSprite.graphics.endFill();
			
			this.addChild(ServiceBTNSprite);
			
			var icon:Bitmap = new Assets.Assets.ServiceIcon();
			icon.width = ServiceBTNSprite.width;
			icon.height = ServiceBTNSprite.height;
			icon.x = Math.ceil(-icon.width/2);
			icon.y = Math.ceil(-icon.height/2);
			this.addChild(icon);
		}
	}
}


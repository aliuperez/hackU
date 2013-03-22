package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class MyDealerBTN extends Sprite
	{
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function MyDealerBTN()
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
			Locator.myDealer.SwitchToScreen();
		}
		
		private function Draw():void
		{
			var MyDealerBTNSprite:Shape = new Shape();
			MyDealerBTNSprite.graphics.beginFill(0x881D9D);
			MyDealerBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.65,Locator.DeviceHeight*0.10);
			MyDealerBTNSprite.x = Math.ceil(-MyDealerBTNSprite.width/2);
			MyDealerBTNSprite.y = Math.ceil(-MyDealerBTNSprite.height/2);
			MyDealerBTNSprite.graphics.endFill();
			
			this.addChild(MyDealerBTNSprite);
			
			var icon:Bitmap = new Assets.Assets.MyDealerIcon();
			icon.width = MyDealerBTNSprite.width;
			icon.height = MyDealerBTNSprite.height;
			icon.x = Math.ceil(-icon.width/2);
			icon.y = Math.ceil(-icon.height/2);
			this.addChild(icon);
		}
	}
}


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
			MyDealerBTNSprite.graphics.beginFill(0x0178bd);
			MyDealerBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.65,Locator.DeviceHeight*0.10);
			MyDealerBTNSprite.x = Math.ceil(-MyDealerBTNSprite.width/2);
			MyDealerBTNSprite.y = Math.ceil(-MyDealerBTNSprite.height/2);
			MyDealerBTNSprite.graphics.endFill();
			
			this.addChild(MyDealerBTNSprite);
			
			var icon:Bitmap = new Assets.Assets.MyDealerIcon();
			icon.width = Math.min(MyDealerBTNSprite.width,MyDealerBTNSprite.height)*0.75;
			icon.height = icon.width;
			icon.x = -MyDealerBTNSprite.width/2+icon.width/2;
			icon.y = -icon.height/2;
			this.addChild(icon);
			
			var myFormat : TextFormat = new TextFormat();
			var textSize:int = icon.height/3;
			myFormat.size = textSize;
			
			myFormat.align ="center";
			myFormat.color = 0xFFFFFF;
			
			var text:TextField = new TextField();
			
			text.border = false;
			text.width=MyDealerBTNSprite.width;
			text.height=textSize*1.25;
			text.text = "My Dealer";
			text.setTextFormat(myFormat);
			text.x = -text.width/2;
			text.y = MyDealerBTNSprite.y+MyDealerBTNSprite.height/2-text.height/2;
			this.addChild(text);
		}
	}
}


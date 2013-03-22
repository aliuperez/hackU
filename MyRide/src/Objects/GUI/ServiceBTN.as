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
	
	public class ServiceBTN extends Sprite
	{
		public var ServiceBTNSprite:Shape;
		public var icon:Bitmap;
		public var text:TextField
		
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
			ServiceBTNSprite = new Shape();
			ServiceBTNSprite.graphics.beginFill(0xea1c25);
			ServiceBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.65,Locator.DeviceHeight*0.15);
			ServiceBTNSprite.x = Math.ceil(-ServiceBTNSprite.width/2);
			ServiceBTNSprite.y = Math.ceil(-ServiceBTNSprite.height/2);
			ServiceBTNSprite.graphics.endFill();
			
			this.addChild(ServiceBTNSprite);
			
			icon = new Assets.Assets.ServiceIcon();
			icon.width = Math.min(ServiceBTNSprite.width,ServiceBTNSprite.height)*0.75;
			icon.height = icon.width;
			icon.x = ServiceBTNSprite.width/2-icon.width;
			icon.y = -icon.height/2;
			this.addChild(icon);
			
			var myFormat : TextFormat = new TextFormat();
			var textSize:int = icon.height/3;
			myFormat.size = textSize;
			
			myFormat.align ="center";
			//myFormat.leftMargin = MyDealerBTNSprite.width*0.3;
			myFormat.color = 0xFFFFFF;
			
			text = new TextField();
			text.selectable=false;
			text.border = false;
			text.width=ServiceBTNSprite.width;
			text.height=textSize*1.25;
			text.text = "Service";
			text.setTextFormat(myFormat);
			text.x = -text.width/2;
			text.y = ServiceBTNSprite.y+ServiceBTNSprite.height/2-text.height/2;
			this.addChild(text);
		}
	}
}


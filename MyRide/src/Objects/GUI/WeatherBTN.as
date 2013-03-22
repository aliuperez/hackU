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
	
	public class WeatherBTN extends Sprite
	{
		public var WeatherBTNSprite:Shape;
		public var icon:Bitmap;
		public var text:TextField
		
		private var Locator:ViewModelLocator=ViewModelLocator.getInstance();
		
		public function WeatherBTN()
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
		
		private function update(event:Event):void
		{
			if (Locator.home.TweenComplete == true)
			{			
				Locator.home.TweenComplete =false;
				Locator.weather.SwitchToScreen();
				Locator.resetBTNPosition();
				this.removeEventListener(Event.ENTER_FRAME,update);
			}
		}
		
		protected function click(event:MouseEvent):void
		{
			Locator.home.transitionOutAnimation();
			Locator.myRide.transitionOutAnimation();
			
			this.addEventListener(Event.ENTER_FRAME,update);
		}
		
		private function Draw():void
		{
			WeatherBTNSprite = new Shape();
			WeatherBTNSprite.graphics.beginFill(0xea1c25);
			WeatherBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.55,Locator.DeviceHeight*0.15);
			WeatherBTNSprite.x = Math.ceil(-WeatherBTNSprite.width/2);
			WeatherBTNSprite.y = Math.ceil(-WeatherBTNSprite.height/2);
			WeatherBTNSprite.graphics.endFill();
			this.addChild(WeatherBTNSprite);
			
			icon = new Assets.Assets.WeatherIcon();
			icon.width = Math.min(WeatherBTNSprite.width,WeatherBTNSprite.height)*0.75;
			icon.height = icon.width;
			icon.x = -WeatherBTNSprite.width/2;
			icon.y = -icon.height/2;
			this.addChild(icon);
			
			var myFormat : TextFormat = new TextFormat();
			var textSize:int = icon.height/3;
			myFormat.size = textSize;
			
			myFormat.align ="center";
			myFormat.color = 0xFFFFFF;
			
			text = new TextField();
			text.selectable=false;
			text.border = false;
			text.width=WeatherBTNSprite.width*0.75;
			text.height=textSize*1.25;
			text.text = "Weather";
			text.setTextFormat(myFormat);
			text.x = WeatherBTNSprite.x+WeatherBTNSprite.width/2-text.width/3;
			text.y = WeatherBTNSprite.y+WeatherBTNSprite.height/2-text.height/2;
			this.addChild(text);
		}
	}
}
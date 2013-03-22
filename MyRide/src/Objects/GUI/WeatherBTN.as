package Objects.GUI
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import Assets.Assets;
	
	import ViewModel.ViewModelLocator;
	
	public class WeatherBTN extends Sprite
	{
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
		
		protected function click(event:MouseEvent):void
		{
			Locator.weather.SwitchToScreen();
		}
		
		private function Draw():void
		{
			var WeatherBTNSprite:Shape = new Shape();
			WeatherBTNSprite.graphics.beginFill(0x881D9D);
			WeatherBTNSprite.graphics.drawRect(0,0,Locator.DeviceWidth*0.55,Locator.DeviceWidth*0.55*0.45);//2nd number is the aspect ratio
			WeatherBTNSprite.x = Math.ceil(-WeatherBTNSprite.width/2);
			WeatherBTNSprite.y = Math.ceil(-WeatherBTNSprite.height/2);
			WeatherBTNSprite.graphics.endFill();
			
			this.addChild(WeatherBTNSprite);
			
			var icon:Bitmap = new Assets.Assets.WeatherIcon();
			icon.width = WeatherBTNSprite.width;
			icon.height = WeatherBTNSprite.height;
			icon.x = Math.ceil(-icon.width/2);
			icon.y = Math.ceil(-icon.height/2);
			this.addChild(icon);
		}
	}
}
package Objects.GUI
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
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
			WeatherBTNSprite.graphics.drawRect(0,0,64,64);
			WeatherBTNSprite.x = Math.ceil(-WeatherBTNSprite.width/2);
			WeatherBTNSprite.y = Math.ceil(-WeatherBTNSprite.height/2);
			WeatherBTNSprite.graphics.endFill();
			
			this.addChild(WeatherBTNSprite);
		}
	}
}
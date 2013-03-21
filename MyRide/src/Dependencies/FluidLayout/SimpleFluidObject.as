﻿package MovieClips.GUI.FluidLayout
{
	
	import flash.events.Event;
	import flash.display.*;

	public class SimpleFluidObject extends FluidObject
	{

		public function SimpleFluidObject(target:DisplayObject,paramObj:Object)
		{
			/* Tell parent class to init the constructor */
			super(target,paramObj);
			
			/* assign alignment and margin value by the constructor parameters */
			var alignment = paramObj.alignment;
			var margin = paramObj.margin;
			
			/* Preset the alignment and margin value if need */
			if (alignment == undefined) alignment = "MIDDLE";
			if (margin == undefined) margin = 0;
			
			/* convert the alignment (eg. "TOP", "BOTTOM_RIGHT") to x, y, offsetX and offsetY */
			var params = new Object();
			switch (alignment)
			{
				case "TOP_LEFT":
				params ={
					x:0,
					y:0,
					offsetX: margin,
					offsetY: margin
					};
				break;
				case "TOP":
				params = {
					x:.5,
					y:0,
					offsetX: -target.width/2,
					offsetY: margin
					};
				break;
				case "TOP_RIGHT":
				params = {
					x:1,
					y:0,
					offsetX: -target.width - margin,
					offsetY: margin
					};
				break;
				case "LEFT":
				params = {
					x:0,
					y:.5,
					offsetX: margin,
					offsetY: -target.height/2
					};
				break;
				case "MIDDLE":
				params = {
					x:.5,
					y:.5,
					offsetX: -target.width/2 - margin/2,
					offsetY: -target.height/2 - margin/2
					};
				break;
				case "RIGHT":
				params = {
					x:1,
					y:.5,
					offsetX: -target.width - margin,
					offsetY: -target.height/2
					};
				break;
				case "BOTTOM_LEFT":
				params = {
					x:0,
					y:1,
					offsetX: margin,
					offsetY: -target.height - margin
					};
				break;
				case "BOTTOM":
				params = {
					x:.5,
					y:1,
					offsetX: -target.width/2,
					offsetY: -target.height - margin
					};
				break;
				case "BOTTOM_RIGHT":
				params = {
					x:1,
					y:1,
					offsetX: -target.width - margin,
					offsetY: -target.height - margin
					};
				break;
			}
			_param = params;			
			

			/* reposition the fluid object to the right position */
			this.reposition();
		}
	}
}
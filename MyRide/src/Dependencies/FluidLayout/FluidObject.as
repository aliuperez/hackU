﻿package MovieClips.GUI.FluidLayout
{

	/* class needed on resize Event */
	import flash.events.Event;

	/* classes needed for MovieClip and DisplayObject */
	import flash.display.*;

	/* classes needed for Easing Animation */
	import fl.transitions.Tween;
	import fl.transitions.easing.*;

	public class FluidObject extends Sprite
	{

		/* alignment parameters */
		protected var _param:Object;

		/* target object to be monitored */
		protected var _target:DisplayObject;

		/* stage instance of the flash document */
		protected var _stage:Stage;

		/* Setter for the alignment param */
		public function set param(value:Object):void
		{
			_param = value;
			this.reposition();
		}

		/* Constructor of the class */
		public function FluidObject(target:DisplayObject,paramObj:Object)
		{
			/* Assign the instance variables */
			_target = target;
			_param = paramObj;
			_stage = _target.stage;

			/* add event handler for stage resize */
			_stage.addEventListener(Event.RESIZE,onStageResize);

			/* reposition the object with the alignment setting applied*/
			this.reposition();

		}

		/* Function that reposition the monitored object */
		protected function reposition():void
		{
			/* get the current width and height of the flash document */
			var stageW = _stage.stageWidth;
			var stageH = _stage.stageHeight;

			/* update the x and y value of the monitored object */
			/* set the duration of the easing animation (seconds) */
			var duration = 0.5;

			/* declare the new X/Y value */
			var newX = _target.x;
			var newY = _target.y;

			/* calculate the new X value based on the stage Width */
			if (_param.x != undefined)
			{
				newX = (stageW * _param.x) + _param.offsetX;
			}

			/* calculate the new Y value based on the stage Height */
			if (_param.y != undefined)
			{
				newY = (stageH * _param.y) + _param.offsetY;
			}

			_target.x=stageW*_param.x+_param.offsetX;
			_target.y=stageH*_param.y+_param.offsetY;

			/* Tell flash to tween the target object to the new X/Y position */
			//new Tween(_target,"x",Strong.easeOut,_target.x,newX,duration,true);
			//new Tween(_target,"y",Strong.easeOut,_target.y,newY,duration,true);
			

		}

		protected function onStageResize(e):void
		{
			/* reposition the target */
			this.reposition();
		}
	}
}
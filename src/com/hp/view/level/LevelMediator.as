/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.view.level {
import com.hp.view.level.components.LevelView;

import flash.events.KeyboardEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.utils.getTimer;

import org.robotlegs.mvcs.Mediator;

public class LevelMediator extends Mediator {

	[Inject]
	public var view:LevelView;
	private var _timer:Timer;
	private var _startTime:int;
	private const HOVER_DELAY:int = 200;
	private var delays:DelaysCollection;

	public function LevelMediator()
	{
		delays = new DelaysCollection();
	}

	override public function onRegister():void
	{
		log("LevelMediator registered");

		view.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		view.init();

		_timer = new Timer(100);
		_timer.addEventListener(TimerEvent.TIMER, timerHandler);
		var data:XML = <data>
			<d t="2300" k="A" />
			<d t="2350" k="B" />
			<d t="3200" k="C" />
			<d t="4380" k="D" />
			<d t="1303" k="E" />
			<d t="9872" k="F" />
			<d t="8726" k="G" />
			<d t="6783" k="L" />
		</data>;
		delays.parse(data);
	}

	private function timerHandler(event:TimerEvent):void
	{
		var currentTime:int = getTimer();
		var offset:int = currentTime - _startTime;
		log(delays.getDelaysForTime(offset), Delay.STATE_ACTIVE);
		//log("time", offset / 1000, "seconds");
	}

	private function start():void
	{
		_timer.start();
		_startTime = getTimer();
	}
	private function stop():void
	{
		_timer.stop();
	}
	private function keyDownHandler(event:KeyboardEvent):void
	{
		log(event.keyCode);
		switch (event.keyCode)
		{
			case 83:
				if(_timer.running){
					stop();
				}else{
					start();
				}
			break;
		}
	}
	override public function onRemove():void
	{
		_timer.removeEventListener(TimerEvent.TIMER, timerHandler);
		_timer = null;
	}
}
}

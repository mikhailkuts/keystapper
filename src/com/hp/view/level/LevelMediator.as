/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.view.level {
import com.hp.events.TimeKeyboardEvent;
import com.hp.model.LevelsModel;

import flash.events.Event;

import flash.utils.getTimer;

import com.hp.view.level.components.LevelView;

import org.robotlegs.mvcs.Mediator;

import flash.events.KeyboardEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

public class LevelMediator extends Mediator {
	[Inject]
	public var view:LevelView;
	[Inject]
	public var levelsModel:LevelsModel;

	private var _timer:Timer;
	private var _startTime:int;

	public function LevelMediator() {
		_timer = new Timer(100);
		_timer.addEventListener(TimerEvent.TIMER, timerHandler);
	}

	private function handleDataAssigned(event:Event = null):void {
		log("LevelsMediator.handleDataAssigned");
		//for (var levelId:String in levelsModel.levels)
		//log(levelsModel.levels[levelId]);
	}

	override public function onRegister():void {
		super.onRegister();
		if (levelsModel.ready) {
			handleDataAssigned();
		} else {
			eventMap.mapListener(eventDispatcher, LevelsModel.DATA_ASSIGNED, handleDataAssigned, Event);
		}

		view.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		view.init();
		start();
	}

	private function timerHandler(event:TimerEvent):void {
	}

	private function keyDownHandler(event:KeyboardEvent):void {
		dispatch(new TimeKeyboardEvent(event, getTimer() - _startTime));
	}

	override public function onRemove():void {
		stop();
		view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		super.onRemove();
	}

	private function start():void {
		_startTime = getTimer();
		_timer.start();
	}

	private function stop():void {
		_timer.stop();
	}
}
}

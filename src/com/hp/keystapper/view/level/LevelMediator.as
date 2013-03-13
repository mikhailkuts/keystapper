/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view.level {
import com.hp.keystapper.model.LevelsModel;
import com.hp.keystapper.view.level.components.LevelView;

import flash.events.Event;

import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

import org.robotlegs.mvcs.Mediator;

public class LevelMediator extends Mediator {

	public static const GAME_STOP:String = "GameStop";

	[Inject]
	public var view:LevelView;
	[Inject]
	public var levelsModel:LevelsModel;

	private var _timer:Timer;

	override public function onRegister():void {
		view.init();
		//view.stage.addEventListener(KeyboardEvent.KEY_DOWN, dispatch);
		view.BackButton.addEventListener(MouseEvent.CLICK, handleBackClick);

		start();
		super.onRegister();
	}

	override public function onRemove():void {
		stop();
		view.BackButton.removeEventListener(MouseEvent.CLICK, handleBackClick);
		//view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, dispatch); //TODO: stage = null при удалении view
		super.onRemove();
	}

	private function start():void {
		levelsModel.start();
		//_soundChannel = levelsModel.currentLevel.track.play();
		_timer = new Timer(100);
		_timer.addEventListener(TimerEvent.TIMER, levelsModel.timerTick);
		_timer.start();
	}

	private function stop():void {
		//_soundChannel.stop();
		_timer.stop();
		_timer.removeEventListener(TimerEvent.TIMER, levelsModel.timerTick);
		_timer = null;
	}

	private function handleBackClick(event:MouseEvent):void
	{
		dispatch(new Event(GAME_STOP));
	}
}
}

/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view {
import assets.LevelView;

import com.hp.keystapper.model.LevelsModel;

import flash.events.KeyboardEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

import org.robotlegs.mvcs.Mediator;

public class LevelMediator extends Mediator {
	[Inject]
	public var view:LevelView;
	[Inject]
	public var levelsModel:LevelsModel;

	private var _timer:Timer;

	override public function onRegister():void {
		super.onRegister();

		view.stage.addEventListener(KeyboardEvent.KEY_DOWN, dispatch);
		start();
	}

	override public function onRemove():void {
		stop();
		view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, dispatch);
		super.onRemove();
	}

	private function start():void {
		levelsModel.start();
		_timer = new Timer(100);
		_timer.addEventListener(TimerEvent.TIMER, levelsModel.updateTime);
		_timer.start();
	}

	private function stop():void {
		_timer.stop();
		_timer.removeEventListener(TimerEvent.TIMER, levelsModel.updateTime);
		_timer = null;
	}
}
}

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
import com.hp.keystapper.view.level.interfaces.ILevelView;

import flash.events.Event;
import flash.utils.Timer;

import org.robotlegs.mvcs.Mediator;

public class LevelMediator extends Mediator {

	public static const GAME_STOP:String = "GameStop";

	[Inject]
	public var view:ILevelView;

	[Inject]
	public var levelsModel:LevelsModel;

	private var _timer:Timer;

	override public function onRegister():void
	{
		view.init();

		view.addEventListener(LevelView.EXIT, handleExitClick);
		view.addEventListener(LevelView.KEY, dispatch);

//		start();

		super.onRegister();
	}

	override public function onRemove():void
	{
//		stop();

		view.removeEventListener(LevelView.EXIT, handleExitClick);
		view.removeEventListener(LevelView.KEY, dispatch);

		//view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, dispatch); //TODO: stage = null при удалении view
		super.onRemove();
	}

	/*private function start():void {
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
	 */
	private function handleExitClick(event:Event):void
	{
		dispatch(new Event(GAME_STOP));
	}
}
}

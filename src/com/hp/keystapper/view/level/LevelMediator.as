package com.hp.keystapper.view.level {
import com.hp.keystapper.model.GameModel;
import com.hp.keystapper.model.vo.LevelVO;
import com.hp.keystapper.view.game.GameMediator;
import com.hp.keystapper.view.keyboard.interfaces.IKeyboard;
import com.hp.keystapper.view.level.components.LevelView;

import flash.events.Event;
import flash.utils.Timer;

import org.robotlegs.mvcs.Mediator;

public class LevelMediator extends Mediator {

	[Inject]
	public var gameModel:GameModel;

	[Inject]
	public var view:LevelView;

	private var _timer:Timer;
	private var _levelData:LevelVO;

	override public function onRegister():void
	{
		_levelData = gameModel.currentLevel;

		view.levelData = _levelData;

		log("Level info:");
		log("Goal:" + _levelData.goal);
		log("Hit:" + _levelData.hit);
		log("Track:" + _levelData.track);
		log("Keyboard:" + _levelData.keyboardId);
		log("Notes:" + _levelData.notes);

		view.addEventListener(LevelView.GO, handleStartLevel);
		view.addEventListener(LevelView.EXIT, handleExitClick);

		view.init();

		super.onRegister();
	}

	override public function onRemove():void
	{
		view.removeEventListener(LevelView.EXIT, handleExitClick);
		//view.removeEventListener(LevelView.KEY, dispatch);
		//view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, dispatch);

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

	private function handleStartLevel(event:Event):void
	{
		dispatch(new Event(GameModel.START_LEVEL));
	}

	private function handleExitClick(event:Event):void
	{
		dispatch(new Event(GameModel.STOP_LEVEL));
	}
}
}

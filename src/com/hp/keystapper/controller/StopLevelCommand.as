package com.hp.keystapper.controller {

import com.hp.keystapper.model.GameModel;
import com.hp.keystapper.model.SoundModel;
import com.hp.keystapper.model.vo.LevelVO;
import com.hp.keystapper.view.game.GameMediator;

import flash.events.Event;

import org.robotlegs.mvcs.Command;

public class StopLevelCommand extends Command {

	[Inject]
	public var gameModel:GameModel;

	[Inject]
	public var soundModel:SoundModel;

	public function StopLevelCommand()
	{
		super();
	}

	override public function execute():void
	{
		var level:LevelVO = gameModel.currentLevel;

		gameModel.currentLevel = null;

		soundModel.channel.stop();
		soundModel.channel = null;

		dispatch(new Event(GameMediator.ACTIVE_WELCOME));

		super.execute();
	}
}
}


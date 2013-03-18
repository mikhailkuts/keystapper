package com.hp.keystapper.controller {

import com.hp.keystapper.model.GameModel;
import com.hp.keystapper.model.SoundModel;
import com.hp.keystapper.model.vo.LevelVO;

import org.robotlegs.mvcs.Command;

public class StartLevelCommand extends Command {

	[Inject]
	public var gameModel:GameModel;

	[Inject]
	public var soundModel:SoundModel;

	public function StartLevelCommand()
	{
		super();
	}

	override public function execute():void
	{
		var level:LevelVO = gameModel.currentLevel;

		soundModel.channel = level.track.play();

		super.execute();
	}
}
}


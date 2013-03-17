/*
 * User: kuts
 * Date: 3/13/13
 */
package com.hp.keystapper.controller {
import com.hp.keystapper.model.LevelsModel;
import com.hp.keystapper.model.SoundModel;

import org.robotlegs.mvcs.Command;

public class StartGameCommand extends Command {

	[Inject]
	public var soundModel:SoundModel;

	[Inject]
	public var levelsModel:LevelsModel;

	public function StartGameCommand()
	{
		super();
	}

	public override function execute():void
	{
		soundModel.channel = levelsModel.currentLevel.track.play();

		super.execute();
	}
}
}

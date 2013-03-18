/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 12.03.13
 */
package com.hp.keystapper.controller {

import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.model.GameModel;
import com.hp.keystapper.view.game.GameMediator;

import flash.events.Event;

import org.robotlegs.mvcs.Command;

public class PrepareLevelCommand extends Command {

	[Inject]
	public var levelEvent:ObjectEvent;

	[Inject]
	public var gameModel:GameModel;

	public function PrepareLevelCommand()
	{
		super();
	}

	override public function execute():void
	{
		var levelId:int = int(levelEvent.data.level);

		gameModel.currentLevel = gameModel.levels[levelId];

		dispatch(new Event(GameMediator.ACTIVE_LEVEL));

		super.execute();
	}
}
}

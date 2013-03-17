package com.hp.keystapper.controller {
import com.hp.keystapper.model.LevelsModel;

import flash.events.KeyboardEvent;

import org.robotlegs.mvcs.Command;

/**
 * @author Alexander Slavschik <kvinty@icloud.com>
 * created 11.03.2013
 */
public class KeyboardCommand extends Command {
	[Inject]
	public var event:KeyboardEvent;
	[Inject]
	public var levelsModel:LevelsModel;

	public function KeyboardCommand()
	{
	}

	override public function execute():void
	{
		super.execute();
		log(event.keyCode, levelsModel.currentTime);
	}
}
}

/*
 * User: kuts
 * Date: 3/13/13
 */
package com.hp.keystapper.controller {
import com.hp.keystapper.model.SoundModel;
import com.hp.keystapper.view.game.GameMediator;

import flash.events.Event;

import org.robotlegs.mvcs.Command;

public class StopGameCommand extends Command {

	[Inject]
	public var soundModel:SoundModel;

	public function StopGameCommand()
	{
		super();
	}

	public override function execute():void
	{
		soundModel.channel.stop();
		soundModel.channel = null;

		dispatch(new Event(GameMediator.ACTIVE_WELCOME));

		super.execute();
	}
}
}

/**
 * Created with IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 17.03.13
 * Time: 4:24
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.controller.screens {

import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.view.game.GameMediator;
import com.hp.keystapper.view.level.interfaces.ILevelView;

import org.robotlegs.mvcs.Command;

public class ScreenLevelCommand extends Command {

	[Inject]
	public var levelView:ILevelView;

	public function ScreenLevelCommand()
	{
		super();
	}

	override public function execute():void
	{
		dispatch(new ObjectEvent(GameMediator.SCREEN_ACTIVE, levelView));
		super.execute();

	}
}
}

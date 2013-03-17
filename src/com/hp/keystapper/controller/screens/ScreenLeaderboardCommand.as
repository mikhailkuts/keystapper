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
import com.hp.keystapper.view.leaderboard.interfaces.ILeaderboardView;

import org.robotlegs.mvcs.Command;

public class ScreenLeaderboardCommand extends Command {

	[Inject]
	public var leaderboardView:ILeaderboardView;

	public function ScreenLeaderboardCommand()
	{
		super();
	}

	override public function execute():void
	{
		dispatch(new ObjectEvent(GameMediator.SCREEN_ACTIVE, leaderboardView));

		super.execute();

	}
}
}


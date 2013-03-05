/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:32
 * To change this template use File | Settings | File Templates.
 */
package view.leaderboard {
import org.robotlegs.mvcs.Mediator;

import view.leaderboard.components.LeaderboardView;

public class LeaderboardMediator extends Mediator {

	[Inject]
	public var view:LeaderboardView;

	public function LeaderboardMediator()
	{
	}

	override public function onRegister():void
	{
		trace("LeaderboardMediator registered");

		view.init();
	}
}
}

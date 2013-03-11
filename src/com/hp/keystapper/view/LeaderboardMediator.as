/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:32
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view {
import assets.LeaderboardView;

import org.robotlegs.mvcs.Mediator;

public class LeaderboardMediator extends Mediator {
	[Inject]
	public var view:LeaderboardView;

	public function LeaderboardMediator() {
	}

	override public function onRegister():void {
		log("LeaderboardMediator registered");

		view.init();
	}
}
}

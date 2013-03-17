/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:32
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view.leaderboard {

import com.hp.keystapper.view.game.GameMediator;
import com.hp.keystapper.view.leaderboard.components.LeaderboardView;

import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

public class LeaderboardMediator extends Mediator {

	[Inject]
	public var view:LeaderboardView;

	override public function onRegister():void
	{
		view.addEventListener(LeaderboardView.EXIT, handleExit);

		view.init();

		super.onRegister();
	}

	override public function onRemove():void
	{
		view.removeEventListener(LeaderboardView.EXIT, handleExit);

		super.onRemove();
	}

	private function handleExit(event:Event):void
	{
		dispatch(new Event(GameMediator.ACTIVE_WELCOME));
	}
}
}

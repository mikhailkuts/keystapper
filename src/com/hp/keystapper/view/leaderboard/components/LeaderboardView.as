/**
 * Created with IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 16.03.13
 * Time: 20:23
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view.leaderboard.components {
import assets.LeaderboardView;

import com.hp.keystapper.view.leaderboard.interfaces.ILeaderboardView;

import flash.events.Event;
import flash.events.MouseEvent;

public class LeaderboardView extends assets.LeaderboardView implements ILeaderboardView {

	public static const EXIT:String = "Exit";

	public function LeaderboardView()
	{
		super();
	}

	public function init():void
	{
		BackButton.addEventListener(MouseEvent.CLICK, handleExit);
	}

	private function handleExit(event:MouseEvent):void
	{
		dispatchEvent(new Event(EXIT));
	}
}
}

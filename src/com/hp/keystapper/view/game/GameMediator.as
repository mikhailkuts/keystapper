/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view.game {

import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.model.GameModel;
import com.hp.keystapper.view.game.components.GameView;

import flash.display.DisplayObject;

import org.robotlegs.mvcs.Mediator;

public class GameMediator extends Mediator {

	public static const SCREEN_ACTIVE:String = "ScreenActive";

	public static const ACTIVE_LEADERBOARD:String = "ActiveLeaderboard";
	public static const ACTIVE_LEVEL:String = "ActiveLevel";
	public static const ACTIVE_PRELOADER:String = "ActivePreloader";
	public static const ACTIVE_WELCOME:String = "ActiveWelcome";

	[Inject]
	public var view:GameView;

	[Inject]
	public var levelsModel:GameModel;

	private var _activeView:DisplayObject;

	override public function onRegister():void
	{
		eventMap.mapListener(eventDispatcher, SCREEN_ACTIVE, handleActiveView, ObjectEvent);
	}

	private function handleActiveView(event:ObjectEvent):void
	{
		var traveledView:DisplayObject = event.data as DisplayObject;

		if (_activeView == traveledView)
			return;
		if (_activeView != null)
			view.removeChild(_activeView);

		_activeView = traveledView;

		_activeView.y = view.Header.y + view.Header.height;

		view.addChild(_activeView);
	}
}
}

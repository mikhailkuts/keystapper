/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view {
import assets.GameView;
import assets.LeaderboardView;
import assets.PreloaderView;
import assets.WelcomeView;

import com.hp.keystapper.model.LevelsModel;
import com.hp.keystapper.view.level.components.LevelView;

import flash.display.Sprite;
import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

public class GameMediator extends Mediator {
	public static const ACTIVE_LEADERBOARD:String = "ActiveLeaderboard";
	public static const ACTIVE_LEVEL:String = "ActiveLevel";
	public static const ACTIVE_PRELOADER:String = "ActivePreloader";
	public static const ACTIVE_WELCOME:String = "ActiveWelcome";

	[Inject]
	public var view:GameView;
	[Inject]
	public var leaderboardView:LeaderboardView;
	[Inject]
	public var preloaderView:PreloaderView;
	[Inject]
	public var levelView:LevelView;
	[Inject]
	public var welcomeView:WelcomeView;
	[Inject]
	public var levelsModel:LevelsModel;
	private var _activeView:Sprite;

	override public function onRegister():void {
		eventMap.mapListener(eventDispatcher, ACTIVE_LEADERBOARD, handleActiveView, Event);
		eventMap.mapListener(eventDispatcher, ACTIVE_LEVEL, handleActiveView, Event);
		eventMap.mapListener(eventDispatcher, ACTIVE_WELCOME, handleActiveView, Event);
		eventMap.mapListener(eventDispatcher, ACTIVE_PRELOADER, handleActiveView, Event);
	}

	private function handleActiveView(event:Event):void {
		switch (event.type) {
			case ACTIVE_PRELOADER :
				this.activeView = preloaderView;
				break;
			case ACTIVE_WELCOME :
				this.activeView = welcomeView;
				break;
			case ACTIVE_LEVEL :
				this.activeView = levelView;
				break;
			case ACTIVE_LEADERBOARD :
				this.activeView = leaderboardView;
				break;
			default :
				break;
		}

	}

	public function set activeView(aview:Sprite):void {
		if (_activeView == aview)
			return;
		if (_activeView != null)
			view.removeChild(_activeView);

		_activeView = aview;
		view.addChild(_activeView);
	}
}
}

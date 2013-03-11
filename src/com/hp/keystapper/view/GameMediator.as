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
import assets.LevelView;
import assets.PreloaderView;
import assets.WelcomeView;

import com.hp.keystapper.model.LevelsModel;

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
		log("GameMediator registered");

		eventMap.mapListener(eventDispatcher, ACTIVE_LEADERBOARD, handleActiveLeaderboard, Event);

		eventMap.mapListener(eventDispatcher, ACTIVE_LEVEL, handleActiveLevel, Event);
		eventMap.mapListener(eventDispatcher, ACTIVE_WELCOME, handleActiveWelcome, Event);
		eventMap.mapListener(eventDispatcher, ACTIVE_PRELOADER, handleActivePreloader, Event);
		//eventMap.mapListener(eventDispatcher, LevelsModel.LEVEL_CHANGED, onLevelChanged, Event);

		//eventMap.mapListener(eventDispatcher, LevelsModel.DATA_ASSIGNED, handleDataAssigned, Event);
	}

	private function handleActivePreloader(event:Event):void
	{
		log("handleActivePreloader");
		this.activeView = preloaderView;
	}

	private function handleActiveLeaderboard(event:Event):void
	{
		this.activeView = leaderboardView;
	}

	private function handleActiveLevel(event:Event):void
	{
		this.activeView = levelView;
	}

	private function handleActiveWelcome(event:Event):void
	{
		log("handleActiveWelcome");
		this.activeView = welcomeView;
	}
	public function set activeView(aview:Sprite):void
	{
		if(_activeView == aview)
			return;
		if(_activeView != null)
			view.removeChild(_activeView);

		_activeView = aview;
		view.addChild(_activeView);
	}
}
}

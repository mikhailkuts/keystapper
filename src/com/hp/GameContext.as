/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */
package com.hp {
import com.hp.controller.StartCommand;
import com.hp.view.game.GameMediator;
import com.hp.view.game.components.GameView;
import com.hp.view.leaderboard.LeaderboardMediator;
import com.hp.view.leaderboard.components.LeaderboardView;
import com.hp.view.level.LevelMediator;
import com.hp.view.level.components.LevelView;
import com.hp.view.preloader.PreloaderMediator;
import com.hp.view.preloader.components.PreloaderView;
import com.hp.view.welcome.WelcomeMediator;
import com.hp.view.welcome.components.WelcomeView;

import flash.display.DisplayObjectContainer;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.mvcs.Context;

public class GameContext extends Context {
	public function GameContext(contextView:DisplayObjectContainer)
	{
		super(contextView);
	}

	override public function startup():void
	{
		trace("Context startup");

		mapEvents();
		mapViews();
		mapMediators();

		super.startup();
	}

	private function mapEvents():void
	{
		commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartCommand, ContextEvent, true);
	}

	private function mapViews():void
	{
		injector.mapSingleton(GameView);
		injector.mapSingleton(LevelView);
		injector.mapSingleton(PreloaderView);
		injector.mapSingleton(WelcomeView);

		injector.mapClass(LeaderboardView, LeaderboardView);
	}

	private function mapMediators():void
	{
		mediatorMap.mapView(GameView, GameMediator);
		mediatorMap.mapView(LeaderboardView, LeaderboardMediator);
		mediatorMap.mapView(LevelView, LevelMediator);
		mediatorMap.mapView(PreloaderView, PreloaderMediator);
		mediatorMap.mapView(WelcomeView, WelcomeMediator);
	}
}
}

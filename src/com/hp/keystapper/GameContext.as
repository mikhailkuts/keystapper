/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper {

import com.hp.keystapper.controller.StartupCommand;
import com.hp.keystapper.controller.screens.ScreenLeaderboardCommand;
import com.hp.keystapper.controller.screens.ScreenLevelCommand;
import com.hp.keystapper.controller.screens.ScreenPreloaderCommand;
import com.hp.keystapper.controller.screens.ScreenWelcomeCommand;
import com.hp.keystapper.model.LevelsModel;
import com.hp.keystapper.model.SoundModel;
import com.hp.keystapper.service.LoaderDataService;
import com.hp.keystapper.view.game.GameMediator;
import com.hp.keystapper.view.game.components.GameView;
import com.hp.keystapper.view.leaderboard.LeaderboardMediator;
import com.hp.keystapper.view.leaderboard.components.LeaderboardView;
import com.hp.keystapper.view.leaderboard.interfaces.ILeaderboardView;
import com.hp.keystapper.view.level.LevelMediator;
import com.hp.keystapper.view.level.components.LevelView;
import com.hp.keystapper.view.level.interfaces.ILevelView;
import com.hp.keystapper.view.preloader.PreloaderMediator;
import com.hp.keystapper.view.preloader.components.PreloaderView;
import com.hp.keystapper.view.preloader.interfaces.IPreloaderView;
import com.hp.keystapper.view.welcome.WelcomeMediator;
import com.hp.keystapper.view.welcome.components.WelcomeView;
import com.hp.keystapper.view.welcome.interfaces.IWelcomeView;

import flash.display.DisplayObjectContainer;
import flash.events.Event;

import org.assetloader.AssetLoader;
import org.assetloader.core.IAssetLoader;
import org.robotlegs.base.ContextEvent;
import org.robotlegs.mvcs.Context;

public class GameContext extends Context {

	public function GameContext(contextView:DisplayObjectContainer)
	{
		super(contextView);
	}

	override public function startup():void
	{
		mapModels();
		mapServices();
		mapCommands();
		mapMediators();
		mapViews();

		super.startup();
	}

	private function mapModels():void
	{
		injector.mapSingleton(LevelsModel);
		injector.mapSingleton(SoundModel);
	}

	private function mapServices():void
	{
		injector.mapClass(LoaderDataService, LoaderDataService);
		injector.mapSingletonOf(IAssetLoader, AssetLoader);
	}

	private function mapCommands():void
	{
		commandMap.mapEvent(GameMediator.ACTIVE_WELCOME, ScreenWelcomeCommand, Event);
		commandMap.mapEvent(GameMediator.ACTIVE_LEADERBOARD, ScreenLeaderboardCommand, Event);
		commandMap.mapEvent(GameMediator.ACTIVE_PRELOADER, ScreenPreloaderCommand, Event);
		commandMap.mapEvent(GameMediator.ACTIVE_LEVEL, ScreenLevelCommand, Event);

		commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent, true);
	}

	private function mapMediators():void
	{
		mediatorMap.mapView(GameView, GameMediator);
		mediatorMap.mapView(LeaderboardView, LeaderboardMediator);
		mediatorMap.mapView(WelcomeView, WelcomeMediator);
		mediatorMap.mapView(LevelView, LevelMediator);
		mediatorMap.mapView(PreloaderView, PreloaderMediator);
	}

	private function mapViews():void
	{
		injector.mapSingleton(GameView);
		injector.mapClass(ILeaderboardView, LeaderboardView);
		injector.mapClass(IWelcomeView, WelcomeView);
		injector.mapClass(ILevelView, LevelView);
		injector.mapClass(IPreloaderView, PreloaderView);
	}
}
}
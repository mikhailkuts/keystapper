/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper {
import assets.GameView;
import assets.LeaderboardView;
import assets.LevelView;
import assets.PreloaderView;
import assets.WelcomeView;

import com.hp.keystapper.controller.KeyboardCommand;
import com.hp.keystapper.controller.LevelSelectCommand;
import com.hp.keystapper.controller.StartupCommand;
import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.model.levels.LevelsModel;
import com.hp.keystapper.service.LoaderDataService;
import com.hp.keystapper.view.GameMediator;
import com.hp.keystapper.view.LeaderboardMediator;
import com.hp.keystapper.view.PreloaderMediator;
import com.hp.keystapper.view.WelcomeMediator;

import flash.display.DisplayObjectContainer;
import flash.events.KeyboardEvent;

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

		// Models
		injector.mapSingleton(LevelsModel);

		// Services
		injector.mapClass(LoaderDataService, LoaderDataService);
		injector.mapSingletonOf(IAssetLoader, AssetLoader);

		// Commands
		commandMap.mapEvent(WelcomeMediator.LEVEL_SELECT, LevelSelectCommand, ObjectEvent);
		commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent, true);
		commandMap.mapEvent(KeyboardEvent.KEY_DOWN, KeyboardCommand, KeyboardEvent);

		//Mediators
		mediatorMap.mapView(GameView, GameMediator);
		mediatorMap.mapView(LeaderboardView, LeaderboardMediator);
		mediatorMap.mapView(WelcomeView, WelcomeMediator);
		mediatorMap.mapView(PreloaderView, PreloaderMediator);

		// Views
		injector.mapClass(GameView, GameView);
		injector.mapClass(LevelView, LevelView);
		injector.mapClass(LeaderboardView, LeaderboardView);
		injector.mapClass(WelcomeView, WelcomeView);
		injector.mapClass(PreloaderView, PreloaderView);

		super.startup();

	}
}
}
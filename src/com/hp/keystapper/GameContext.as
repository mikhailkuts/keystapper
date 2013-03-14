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
import assets.PreloaderView;
import assets.WelcomeView;

import com.hp.keystapper.controller.KeyboardCommand;
import com.hp.keystapper.controller.LevelSelectCommand;
import com.hp.keystapper.controller.StartGameCommand;
import com.hp.keystapper.controller.StartupCommand;
import com.hp.keystapper.controller.StopGameCommand;
import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.model.GameModel;
import com.hp.keystapper.model.SoundModel;
import com.hp.keystapper.model.LevelsModel;
import com.hp.keystapper.service.LoaderDataService;
import com.hp.keystapper.view.GameMediator;
import com.hp.keystapper.view.LeaderboardMediator;
import com.hp.keystapper.view.keyboards.IKeyboardView;
import com.hp.keystapper.view.keyboards.KeyboardMediator;
import com.hp.keystapper.view.level.LevelMediator;
import com.hp.keystapper.view.PreloaderMediator;
import com.hp.keystapper.view.WelcomeMediator;
import com.hp.keystapper.view.level.components.LevelView;

import flash.display.DisplayObjectContainer;
import flash.events.Event;
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
		injector.mapSingleton(GameModel);
		injector.mapSingleton(LevelsModel);
		injector.mapSingleton(SoundModel);

		// Services
		injector.mapClass(LoaderDataService, LoaderDataService);
		injector.mapSingletonOf(IAssetLoader, AssetLoader);

		// Commands
		commandMap.mapEvent(WelcomeMediator.LEVEL_SELECT, LevelSelectCommand, ObjectEvent);
		commandMap.mapEvent(GameMediator.ACTIVE_LEVEL, StartGameCommand, Event);
		commandMap.mapEvent(LevelMediator.GAME_STOP, StopGameCommand, Event);
		commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent, true);
		commandMap.mapEvent(KeyboardEvent.KEY_DOWN, KeyboardCommand, KeyboardEvent);

		//Mediators
		mediatorMap.mapView(GameView, GameMediator);
		mediatorMap.mapView(LeaderboardView, LeaderboardMediator);
		mediatorMap.mapView(WelcomeView, WelcomeMediator);
		mediatorMap.mapView(PreloaderView, PreloaderMediator);
		mediatorMap.mapView(LevelView, LevelMediator);
		//mediatorMap.mapView(IKeyboardView, KeyboardMediator);

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
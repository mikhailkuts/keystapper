/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */
package com.hp {
import assets.WelcomeView;

import com.hp.controller.StartupCommand;
import com.hp.events.TimeKeyboardEvent;
import com.hp.model.LevelsModel;
import com.hp.service.LoaderDataService;
import com.hp.controller.KeyboardCommand;

import flash.events.KeyboardEvent;

import com.hp.view.game.GameMediator;
import com.hp.view.game.components.GameView;
import com.hp.view.leaderboard.LeaderboardMediator;
import com.hp.view.leaderboard.components.LeaderboardView;
import com.hp.view.level.LevelMediator;
import com.hp.view.level.components.LevelView;
import com.hp.view.welcome.WelcomeMediator;

import org.robotlegs.base.ContextEvent;
import org.assetloader.AssetLoader;
import org.assetloader.core.IAssetLoader;
import org.robotlegs.mvcs.Context;

import flash.display.DisplayObjectContainer;

public class GameContext extends Context {
	public function GameContext(contextView:DisplayObjectContainer) {
		super(contextView);
	}

	override public function startup():void {
		mapComponents();
		mapMediators();
		mapEvents();

		super.startup();
	}

	private function mapEvents():void {
		commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent, true);
		commandMap.mapEvent(KeyboardEvent.KEY_DOWN, KeyboardCommand, TimeKeyboardEvent);
	}

	private function mapComponents():void {
		// Views
		injector.mapSingleton(GameView);
		injector.mapSingleton(LevelView);
		injector.mapSingleton(WelcomeView);

		// Components
		injector.mapClass(LeaderboardView, LeaderboardView);

		// Models
		injector.mapSingleton(LevelsModel);

		// Services
		injector.mapClass(LoaderDataService, LoaderDataService);
		injector.mapSingletonOf(IAssetLoader, AssetLoader);
	}

	private function mapMediators():void {
		mediatorMap.mapView(GameView, GameMediator);
		mediatorMap.mapView(LeaderboardView, LeaderboardMediator);
		mediatorMap.mapView(LevelView, LevelMediator);
		mediatorMap.mapView(WelcomeView, WelcomeMediator);
	}
}
}
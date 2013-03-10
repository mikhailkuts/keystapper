/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */
package com.hp {
	import com.hp.controller.StartupCompleteCommand;
	import com.hp.view.game.GameMediator;
	import com.hp.view.game.components.GameView;
	import com.hp.view.leaderboard.LeaderboardMediator;
	import com.hp.view.leaderboard.components.LeaderboardView;
	import com.hp.view.level.LevelMediator;
	import com.hp.view.level.components.LevelView;
	import com.hp.view.welcome.WelcomeMediator;
	import com.hp.view.welcome.components.WelcomeView;

	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

public class GameContext extends Context {
	public function GameContext(contextView:DisplayObjectContainer)
	{
		super(contextView);
	}

	override public function startup():void
	{
		mapEvents();
		mapComponents();
		mapMediators();

		super.startup();
	}

	private function mapEvents():void
	{
		commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand, ContextEvent, true);
		//commandMap.mapEvent(AssetLoaderEvent.CONFIG_LOADED, ConfigLoadedCommand, AssetLoaderEvent, true);
	}

	private function mapComponents():void
	{
		injector.mapSingleton(GameView);
		injector.mapSingleton(LevelView);
		injector.mapSingleton(WelcomeView);

		injector.mapSingletonOf(IAssetLoader, AssetLoader);

		injector.mapClass(LeaderboardView, LeaderboardView);
	}

	private function mapMediators():void
	{
		mediatorMap.mapView(GameView, GameMediator);
		mediatorMap.mapView(LeaderboardView, LeaderboardMediator);
		mediatorMap.mapView(LevelView, LevelMediator);
		mediatorMap.mapView(WelcomeView, WelcomeMediator);
	}
}
}

/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.DisplayObjectContainer;

import controller.StartCommand;

import org.robotlegs.base.ContextEvent;

import org.robotlegs.mvcs.Context;

import view.game.GameMediator;
import view.game.components.GameView;
import view.leaderboard.LeaderboardMediator;
import view.leaderboard.components.LeaderboardView;
import view.level.LevelMediator;
import view.level.components.LevelView;
import view.preloader.PreloaderMediator;
import view.preloader.components.PreloaderView;
import view.welcome.WelcomeMediator;
import view.welcome.components.WelcomeView;

public class GameContext extends Context {
	public function GameContext(contextView:DisplayObjectContainer)
	{
		super(contextView);
	}

	override public function startup():void
	{
		trace("Context inited");

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

/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package view.game {
import flash.display.Sprite;
import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

import view.game.components.GameView;
import view.leaderboard.components.LeaderboardView;
import view.level.components.LevelView;
import view.preloader.components.PreloaderView;
import view.welcome.components.WelcomeView;

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
	public var levelView:LevelView;

	[Inject]
	public var preloaderView:PreloaderView;

	[Inject]
	public var welcomeView:WelcomeView;

	override public function onRegister():void
	{
		trace("GameMediator registered");
		
		eventMap.mapListener(eventDispatcher, ACTIVE_LEADERBOARD, handleActiveLeaderboard, Event);
		eventMap.mapListener(eventDispatcher, ACTIVE_LEVEL, handleActiveLevel, Event);
		eventMap.mapListener(eventDispatcher, ACTIVE_PRELOADER, handleActivePreloader, Event);
		eventMap.mapListener(eventDispatcher, ACTIVE_WELCOME, handleActiveWelcome, Event);

		//eventDispatcher.dispatchEvent(new Event(GameMediator.ACTIVE_WELCOME)); //Temporary place

		view.init();
	}

	private function handleActiveLeaderboard(event:Event):void
	{
		view.activeView = leaderboardView;
	}

	private function handleActiveLevel(event:Event):void
	{
		view.activeView = levelView;
	}

	private function handleActivePreloader(event:Event):void
	{
		view.activeView = preloaderView;
	}

	private function handleActiveWelcome(event:Event):void
	{
		view.activeView = welcomeView;
	}
}
}

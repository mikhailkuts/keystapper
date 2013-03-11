/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.view.game {
	import com.hp.model.LevelsModel;
	import com.hp.view.game.components.GameView;
	import com.hp.view.leaderboard.components.LeaderboardView;
	import com.hp.view.level.components.LevelView;
	import com.hp.view.welcome.components.WelcomeView;

	import flash.events.Event;

	import org.robotlegs.mvcs.Mediator;

	public class GameMediator extends Mediator {
		public static const ACTIVE_LEADERBOARD : String = "ActiveLeaderboard";
		public static const ACTIVE_LEVEL : String = "ActiveLevel";
		public static const ACTIVE_PRELOADER : String = "ActivePreloader";
		public static const ACTIVE_WELCOME : String = "ActiveWelcome";
		[Inject]
		public var view : GameView;
		[Inject]
		public var leaderboardView : LeaderboardView;
		[Inject]
		public var levelView : LevelView;
		[Inject]
		public var welcomeView : WelcomeView;
		[Inject]
		public var levelsModel : LevelsModel;

		override public function onRegister() : void {
			log("GameMediator registered");

			eventMap.mapListener(eventDispatcher, ACTIVE_LEADERBOARD, handleActiveLeaderboard, Event);
			eventMap.mapListener(eventDispatcher, ACTIVE_LEVEL, handleActiveLevel, Event);
			eventMap.mapListener(eventDispatcher, ACTIVE_WELCOME, handleActiveWelcome, Event);

			eventMap.mapListener(eventDispatcher, LevelsModel.DATA_ASSIGNED, handleDataAssigned, Event);

			eventMap.mapListener(eventDispatcher, LevelsModel.DATA_ASSIGNED, handleDataAssigned, Event);

			view.init();
		}

		private function handleDataAssigned(event : Event) : void {
			for (var levelId:String in levelsModel.levelsData)
				log(levelsModel.levelsData[levelId]);
		}

		private function handleActiveLeaderboard(event : Event) : void {
			view.activeView = leaderboardView;
		}

		private function handleActiveLevel(event : Event) : void {
			view.activeView = levelView;
		}

		private function handleActiveWelcome(event : Event) : void {
			view.activeView = welcomeView;
		}
	}
}

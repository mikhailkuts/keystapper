package com.hp.controller {
	import com.hp.model.LevelsModel;
	import com.hp.service.LoaderDataService;
	import com.hp.view.game.components.GameView;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import org.robotlegs.mvcs.Command;

	public class StartupCommand extends Command {
		[Inject]
		public var gameView : GameView;
		[Inject]
		public var loaderDataService : LoaderDataService;

		override public function execute() : void {
			contextView.stage.scaleMode = StageScaleMode.NO_SCALE;
			contextView.stage.align = StageAlign.TOP_LEFT;

			contextView.addChild(gameView);

			loaderDataService.load();
		}
	}
}

package com.hp.controller
{
import com.hp.model.LevelsModel;
import com.hp.service.LoaderDataService;
import com.hp.view.game.components.GameView;

import org.robotlegs.mvcs.Command;

	public class StartupCommand extends Command
	{
		[Inject]
		public var gameView:GameView;

		[Inject]
		public var loaderDataService:LoaderDataService;

		override public function execute() : void 
		{
			contextView.addChild(gameView);

			loaderDataService.load();
		}
	}
}

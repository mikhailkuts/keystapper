package com.hp.keystapper.controller {

import assets.GameView;
import assets.LevelView;

import com.hp.keystapper.service.LoaderDataService;
import com.hp.keystapper.view.GameMediator;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import org.robotlegs.mvcs.Command;

public class StartupCommand extends Command {
	[Inject]
	public var levelsView:LevelView;
	[Inject]
	public var gameView:GameView;
	[Inject]
	public var loaderDataService:LoaderDataService;

	override public function execute():void {
		contextView.stage.scaleMode = StageScaleMode.NO_SCALE;
		contextView.stage.align = StageAlign.TOP_LEFT;
		contextView.addChild(gameView);
		loaderDataService.load();

		dispatch(new Event(GameMediator.ACTIVE_PRELOADER));
	}

}
}

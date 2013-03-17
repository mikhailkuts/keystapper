package com.hp.keystapper.controller {

import com.hp.keystapper.service.LoaderDataService;
import com.hp.keystapper.view.game.GameMediator;
import com.hp.keystapper.view.game.components.GameView;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import org.robotlegs.mvcs.Command;

public class StartupCommand extends Command {
	[Inject]
	public var gameView:GameView;
	[Inject]
	public var loaderDataService:LoaderDataService;

	override public function execute():void
	{
		contextView.stage.scaleMode = StageScaleMode.NO_SCALE;
		contextView.stage.align = StageAlign.TOP_LEFT;
		contextView.addChild(gameView);

		loaderDataService.eventDispatcher.addEventListener(LoaderDataService.ON_DATA_LOADED, handleDataLoaded);
		loaderDataService.load("assets.xml");

		dispatch(new Event(GameMediator.ACTIVE_PRELOADER));
	}

	private function handleDataLoaded(event:Event):void
	{
		dispatch(new Event(GameMediator.ACTIVE_WELCOME));

	}

}
}

package com.hp.keystapper.controller.screens {

import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.view.game.GameMediator;
import com.hp.keystapper.view.preloader.interfaces.IPreloaderView;

import org.robotlegs.mvcs.Command;

public class ScreenPreloaderCommand extends Command {

	[Inject]
	public var preloaderView:IPreloaderView;

	public function ScreenPreloaderCommand()
	{
		super();
	}

	override public function execute():void
	{
		dispatch(new ObjectEvent(GameMediator.SCREEN_ACTIVE, preloaderView));
		super.execute();

	}
}
}

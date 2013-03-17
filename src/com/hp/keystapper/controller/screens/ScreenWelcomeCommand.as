package com.hp.keystapper.controller.screens {

import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.view.game.GameMediator;
import com.hp.keystapper.view.welcome.interfaces.IWelcomeView;

import org.robotlegs.mvcs.Command;

public class ScreenWelcomeCommand extends Command {

	[Inject]
	public var welcomeView:IWelcomeView;

	public function ScreenWelcomeCommand()
	{
		super();
	}

	override public function execute():void
	{
		dispatch(new ObjectEvent(GameMediator.SCREEN_ACTIVE, welcomeView));
		super.execute();

	}
}
}

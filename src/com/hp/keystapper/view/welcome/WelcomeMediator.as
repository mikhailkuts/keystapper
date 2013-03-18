/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:32
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view.welcome {

import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.model.GameModel;
import com.hp.keystapper.view.welcome.components.WelcomeView;

import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

public class WelcomeMediator extends Mediator {

	[Inject]
	public var view:WelcomeView;

	[Inject]
	public var levelsModel:GameModel;

	public function WelcomeMediator()
	{
	}

	override public function onRegister():void
	{
		view.addEventListener(WelcomeView.LEVEL1_SELECT, handleSelectLevel);
		view.addEventListener(WelcomeView.LEVEL2_SELECT, handleSelectLevel);
		view.addEventListener(WelcomeView.LEVEL3_SELECT, handleSelectLevel);

		view.init();

		super.onRegister();
	}

	private function handleSelectLevel(event:Event):void
	{
		var dynamicEvent:ObjectEvent = new ObjectEvent(GameModel.PREPARE_LEVEL, {});

		switch (event.type) {
			case WelcomeView.LEVEL1_SELECT:
				dynamicEvent.data.level = 0;
				break;
			case WelcomeView.LEVEL2_SELECT:
				dynamicEvent.data.level = 1;
				break;
			case WelcomeView.LEVEL3_SELECT:
				dynamicEvent.data.level = 2;
				break;
		}

		dispatch(dynamicEvent);
	}

	override public function onRemove():void
	{
		view.removeEventListener(WelcomeView.LEVEL1_SELECT, handleSelectLevel);
		view.removeEventListener(WelcomeView.LEVEL2_SELECT, handleSelectLevel);
		view.removeEventListener(WelcomeView.LEVEL3_SELECT, handleSelectLevel);

		super.onRemove();
	}
}
}

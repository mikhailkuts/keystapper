/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:32
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view {
import assets.WelcomeView;

import com.hp.keystapper.model.levels.LevelsModel;
import com.hp.keystapper.view.GameMediator;

import flash.events.Event;

import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

public class WelcomeMediator extends Mediator {
	[Inject]
	public var view:WelcomeView;
	[Inject]
	public var levelsModel:LevelsModel;

	public function WelcomeMediator() {
	}

	override public function onRegister():void {
		view.btn1.addEventListener(MouseEvent.CLICK, clickHandler);
		view.btn2.addEventListener(MouseEvent.CLICK, clickHandler);
		view.btn3.addEventListener(MouseEvent.CLICK, clickHandler);
	}

	private function clickHandler(event:MouseEvent):void {
		switch (event.currentTarget) {
			case view.btn1 :
				levelsModel.currentLevelID = 0;
				break;
			case view.btn2 :
				levelsModel.currentLevelID = 1;
				break;
			case view.btn3 :
				levelsModel.currentLevelID = 2;
				break;
			default :
				break;
		}
		dispatch(new Event(GameMediator.ACTIVE_LEVEL));
	}


	override public function onRemove():void {

		view.btn1.removeEventListener(MouseEvent.CLICK, clickHandler);
		view.btn2.removeEventListener(MouseEvent.CLICK, clickHandler);
		view.btn3.removeEventListener(MouseEvent.CLICK, clickHandler);

		super.onRemove();
	}
}
}

/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:32
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view {
import assets.WelcomeView;

import com.hp.keystapper.events.ObjectEvent;

import com.hp.keystapper.model.LevelsModel;

import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

public class WelcomeMediator extends Mediator {

	public static const LEVEL_SELECT:String = "onLevelSelected";

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
		var dynamicEvent:ObjectEvent = new ObjectEvent(LEVEL_SELECT, {});
		switch (event.currentTarget) {
			case view.btn1 :
				dynamicEvent.data.level = 0;
				break;
			case view.btn2 :
				dynamicEvent.data.level = 1;
				break;
			case view.btn3 :
				dynamicEvent.data.level = 2;
				break;
			default :
				break;
		}
		dispatch(dynamicEvent);
	}


	override public function onRemove():void {

		view.btn1.removeEventListener(MouseEvent.CLICK, clickHandler);
		view.btn2.removeEventListener(MouseEvent.CLICK, clickHandler);
		view.btn3.removeEventListener(MouseEvent.CLICK, clickHandler);

		super.onRemove();
	}
}
}

/*
 * User: mikhailkuts
 * Date: 17.03.13
 */
package com.hp.keystapper.view.keyboard {
import com.hp.keystapper.view.keyboard.interfaces.IKeyboard;

import org.robotlegs.mvcs.Mediator;

public class KeyboardMediator extends Mediator {

	[Inject]
	public var view:IKeyboard;

	public function KeyboardMediator()
	{
		super();
	}

	override public function onRegister():void
	{
		view.init();
	}
}
}

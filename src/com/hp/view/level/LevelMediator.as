/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.view.level {
import com.hp.view.level.components.LevelView;

import org.robotlegs.mvcs.Mediator;

public class LevelMediator extends Mediator {

	[Inject]
	public var view:LevelView;

	public function LevelMediator()
	{
	}

	override public function onRegister():void
	{
		trace("LevelMediator registered");

		view.init();
	}
}
}

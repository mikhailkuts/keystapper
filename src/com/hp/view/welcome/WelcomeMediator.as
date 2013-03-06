/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:32
 * To change this template use File | Settings | File Templates.
 */
package com.hp.view.welcome {
import com.hp.view.welcome.components.WelcomeView;

import org.robotlegs.mvcs.Mediator;

public class WelcomeMediator extends Mediator {

	[Inject]
	public var view:WelcomeView;

	public function WelcomeMediator()
	{
	}

	override public function onRegister():void
	{
		trace("WelcomeMediator registered");

		view.init();
	}
}
}

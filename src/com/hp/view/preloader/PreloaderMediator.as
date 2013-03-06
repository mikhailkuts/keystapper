/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:32
 * To change this template use File | Settings | File Templates.
 */
package com.hp.view.preloader {
import com.hp.view.preloader.components.PreloaderView;

import org.robotlegs.mvcs.Mediator;

public class PreloaderMediator extends Mediator {

	[Inject]
	public var view:PreloaderView;

	public function PreloaderMediator()
	{
	}

	override public function onRegister():void
	{
		trace("PreloaderMediator registered");

		view.init();
	}
}
}

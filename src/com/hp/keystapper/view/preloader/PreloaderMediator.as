/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created: 11.03.13
 */
package com.hp.keystapper.view.preloader {
import com.hp.keystapper.view.preloader.components.PreloaderView;

import org.robotlegs.mvcs.Mediator;

public class PreloaderMediator extends Mediator {

	[Inject]
	public var view:PreloaderView;

	public function PreloaderMediator()
	{
		super();
	}

	override public function onRegister():void
	{
		view.init();

		super.onRegister();
	}
}
}

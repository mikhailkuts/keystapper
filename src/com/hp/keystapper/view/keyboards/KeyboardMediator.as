/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 12.03.13
 */
package com.hp.keystapper.view.keyboards {
import org.robotlegs.mvcs.Mediator;

public class KeyboardMediator extends Mediator {

	[Inject]
	public var keybaroardView:IKeyboardView;

	public function KeyboardMediator()
	{
		super();
	}

	override public function onRegister():void
	{
		super.onRegister();
	}

	override public function onRemove():void
	{
		super.onRemove();
	}
}
}

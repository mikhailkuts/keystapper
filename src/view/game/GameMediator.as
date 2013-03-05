/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package view.game {
import org.robotlegs.mvcs.Mediator;

import view.game.components.GameView;

public class GameMediator extends Mediator {

	[Inject]
	public var view:GameView;

	public function GameMediator()
	{
	}

	override public function onRegister():void
	{
		trace("GameMediator registered");
	}
}
}

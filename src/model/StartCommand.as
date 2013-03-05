/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 2:03
 * To change this template use File | Settings | File Templates.
 */
package model {
import org.robotlegs.mvcs.Command;

import view.game.components.GameView;

public class StartCommand extends Command {

	override public function execute():void
	{
		contextView.addChild(new GameView());
	}
}
}

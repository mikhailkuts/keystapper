/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 2:03
 * To change this template use File | Settings | File Templates.
 */
package com.hp.controller {
import com.hp.view.game.components.GameView;

import org.robotlegs.mvcs.Command;

public class StartCommand extends Command {

	override public function execute():void
	{
		contextView.addChild(new GameView());
	}
}
}

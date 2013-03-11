/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:33
 * To change this template use File | Settings | File Templates.
 */
package com.hp.view.game.components {
import assets.MainTitle;

import flash.display.Sprite;

public class GameView extends MainTitle {
	public static const NAME:String = "Game";
	private var _activeView:Sprite;

	public function init():void {
	}

	public function set activeView(view:Sprite):void {
		if (_activeView)
			removeChild(_activeView);

		_activeView = view;
		addChild(_activeView);
	}
}
}

/*
 * User: kuts
 * Date: 3/13/13
 */
package com.hp.keystapper.view.level.components {
import assets.LevelView;

import com.hp.keystapper.view.level.interfaces.ILevelView;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

public class LevelView extends assets.LevelView implements ILevelView {

	public static const EXIT:String = "Exit";
	public static const KEY:String = "Key";


	public function LevelView()
	{
		super();
	}

	public function init():void
	{
		//stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
		BackButton.addEventListener(MouseEvent.CLICK, handleBackClick);
	}

	private function handleBackClick(event:*):void
	{
		dispatchEvent(new Event(EXIT));
	}

	private function handleKeyDown(event:KeyboardEvent):void
	{
		dispatchEvent(new Event(KEY));
	}
}
}

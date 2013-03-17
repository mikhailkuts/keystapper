/**
 * Created with IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 16.03.13
 * Time: 20:16
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.view.welcome.components {
import assets.WelcomeView;

import com.hp.keystapper.view.welcome.interfaces.IWelcomeView;

import flash.events.Event;
import flash.events.MouseEvent;

public class WelcomeView extends assets.WelcomeView implements IWelcomeView {

	public static const LEVEL1_SELECT:String = "Level1Select";
	public static const LEVEL2_SELECT:String = "Level2Select";
	public static const LEVEL3_SELECT:String = "Level3Select";

	public function WelcomeView()
	{
		super();
	}

	public function init():void
	{
		Level1Button.addEventListener(MouseEvent.CLICK, handleLevelSelect);
		Level2Button.addEventListener(MouseEvent.CLICK, handleLevelSelect);
		Level3Button.addEventListener(MouseEvent.CLICK, handleLevelSelect);
	}

	private function handleLevelSelect(event:MouseEvent):void
	{
		switch (event.currentTarget) {
			case Level1Button:
				dispatchEvent(new Event(LEVEL1_SELECT));
				break;
			case Level2Button:
				dispatchEvent(new Event(LEVEL2_SELECT));
				break;
			case Level3Button:
				dispatchEvent(new Event(LEVEL3_SELECT));
				break;
		}
	}
}
}

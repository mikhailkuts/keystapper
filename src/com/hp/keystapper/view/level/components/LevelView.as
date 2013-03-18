/*
 * User: kuts
 * Date: 3/13/13
 */
package com.hp.keystapper.view.level.components {
import assets.LevelView;

import com.hp.keystapper.model.vo.LevelVO;

import com.hp.keystapper.view.keyboard.interfaces.IKeyboard;
import com.hp.keystapper.view.level.interfaces.ILevelView;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

public class LevelView extends assets.LevelView implements ILevelView {

	public static const EXIT:String = "Exit";
	public static const KEY:String = "Key";
	public static const GO:String = "Go";

	private var _levelData:LevelVO;
	private var _keyboard:IKeyboard;

	[Inject(name="KeyboardIPad")]
	public var keyboardIPad:IKeyboard;

	[Inject(name="KeyboardPC")]
	public var keyboardPC:IKeyboard;

	[Inject(name="KeyboardTapper")]
	public var keyboardTapper:IKeyboard;

	public function LevelView()
	{
		super();
	}

	public function init():void
	{
		switch (_levelData.keyboardId) {
			case LevelVO.KEYBOARD_IPAD:
				_keyboard = keyboardIPad;
				break;
			case LevelVO.KEYBOARD_PC:
				_keyboard = keyboardPC;
				break;
			case LevelVO.KEYBOARD_TYPEWRITTER:
				_keyboard = keyboardTapper;
				break;
		}

		addChild(_keyboard as DisplayObject);

		//stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
		BackButton.addEventListener(MouseEvent.CLICK, handleBackClick);

		dispatchEvent(new Event(GO));
	}

	private function handleBackClick(event:*):void
	{
		dispatchEvent(new Event(EXIT));
	}

	private function handleKeyDown(event:KeyboardEvent):void
	{
		dispatchEvent(new Event(KEY));
	}

	public function set levelData(value:LevelVO):void
	{
		_levelData = value;
	}
}
}

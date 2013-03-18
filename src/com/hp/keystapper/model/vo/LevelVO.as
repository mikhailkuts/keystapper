/**
 * Created with IntelliJ IDEA.
 * User: kuts
 * Date: 3/11/13
 * Time: 12:23 AM
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.model.vo {

import flash.media.Sound;

import org.robotlegs.mvcs.Actor;

public class LevelVO extends Actor {
	public static const KEYBOARD_IPAD:String = "ipad";
	public static const KEYBOARD_PC:String = "pc";
	public static const KEYBOARD_TYPEWRITTER:String = "typewriter";

	public var hit:int;
	public var goal:int;
	public var track:Sound;
	public var keyboardId:String;
	public var notes:Vector.<NoteVO> = new Vector.<NoteVO>();

	public function LevelVO():void
	{
		super();
	}
}
}

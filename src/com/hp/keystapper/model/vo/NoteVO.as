/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 10.03.13
 */
package com.hp.keystapper.model.vo {
import flash.events.KeyboardEvent;

public class NoteVO {

	public static const STATE_PAST:int = 0;
	public static const STATE_UPCOMING:int = 1;
	public static const STATE_ACTIVE:int = 2;
	public static const STATE_PASSED:int = 3;
	public static const STATE_ARCHIVED:int = 4;

	public static var UPCOMING_RANGE:uint = 250;
	public static var ACTIVE_RANGE:uint = 150;

	private var _time:int;
	private var _key:String;
	private var _keyCode:int;
	private var _passed:Boolean = false;

	public function NoteVO(obj:Object)
	{
		_time = int(obj.@ms);
		_key = String(obj.@key);
		_keyCode = _key.charCodeAt(0);
	}

	public function press(event:KeyboardEvent):void
	{
		_passed = _keyCode == event.keyCode;
	}

	public function get keyCode():int
	{
		return _keyCode;
	}

	public function get key():String
	{
		return _key;
	}

	public function get time():int
	{
		return _time;
	}

	public function toString():String
	{
		return "[t:" + _time + " d:" + _key + "]";
	}

	public function getStateForTime(value:int):int
	{
		if (_passed) return STATE_PASSED;
		var diff:int = _time - value;
		if (diff < 0) return STATE_PAST;
		if (diff < ACTIVE_RANGE) return STATE_ACTIVE;
		if (diff < UPCOMING_RANGE) return STATE_UPCOMING;
		return STATE_ARCHIVED;
	}
}
}

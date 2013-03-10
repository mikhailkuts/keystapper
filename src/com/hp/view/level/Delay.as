/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 10.03.13
 */
package com.hp.view.level {
import spark.components.RichEditableText;

public class Delay {

	public static const STATE_PAST:int = 0;
	public static const STATE_UPCOMING:int = 1;
	public static const STATE_ACTIVE:int = 2;
	public static const STATE_FUTURED:int = 3;

	public static var UPCOMING_RANGE:uint = 250;
	public static var ACTIVE_RANGE:uint = 150;

	private var _time:int;
	private var _key:String;
	private var _keyCode:int;


	public function Delay(obj:Object)
	{
		_time = int(obj.@t);
		_key = String(obj.@k);
		_keyCode = _key.charCodeAt(0);
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
		var diff:int = _time - value;
		if(diff < 0) return STATE_PAST;
		if(diff < ACTIVE_RANGE) return STATE_ACTIVE;
		if(diff < UPCOMING_RANGE) return STATE_UPCOMING;
		return STATE_FUTURED;
	}
}
}

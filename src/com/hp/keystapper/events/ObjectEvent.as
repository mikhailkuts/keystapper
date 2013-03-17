/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 12.03.13
 */
package com.hp.keystapper.events {
import flash.events.Event;

public class ObjectEvent extends Event {
	private var _data:Object;

	public function ObjectEvent(type:String, data:Object, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		super(type, bubbles, cancelable);
		_data = data;
	}

	override public function clone():Event
	{
		return new ObjectEvent(type, _data, bubbles, cancelable);
	}

	public function get data():Object
	{
		return _data;
	}

	public function set data(value:Object):void
	{
		_data = value;
	}
}
}

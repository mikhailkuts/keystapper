package com.hp.controller.events {
	import flash.events.KeyboardEvent;

	/**
	 * @author Alexander Slavschik <kvinty@icloud.com>
	 * created 11.03.2013
	 */
	public class TimeKeyboardEvent extends KeyboardEvent {
		
		private var _time : int;
		
		public function TimeKeyboardEvent(event:KeyboardEvent, time:int) {
			_time = time;
			super(event.type, event.bubbles, event.cancelable, event.charCode, event.keyCode, event.keyLocation, event.ctrlKey, event.altKey, event.shiftKey);
		}

		public function get time() : int {
			return _time;
		}
	}
}

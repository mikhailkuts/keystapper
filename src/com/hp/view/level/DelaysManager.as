/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 10.03.13
 */
package com.hp.view.level {
	import flash.utils.getTimer;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class DelaysManager {
		
		private var _timer : Timer;
		private var _startTime : int;
		private var _rawData : XML;
		private var _delays : Vector.<Delay>;

		public function DelaysManager() {
			_timer = new Timer(100);
			_timer.addEventListener(TimerEvent.TIMER, timerHandler);
		}

		private function timerHandler(event : TimerEvent) : void {
		}

		public function start() : void {
			log("DelaysManager.start");
			_startTime = getTimer();
			_timer.start();
		}

		public function stop() : void {
			log("DelaysManager.stop");
			_timer.stop();
		}

		public function press(keyCode : int) : void {
		}

		public function getDelaysForTime(time : int, state : int = 1) : Vector.<Delay> {
			var d : Vector.<Delay> = new Vector.<Delay>();
			var cd : Delay;
			for (var i : int = 0; i < _delays.length; i++) {
				cd = _delays[i];
				if (cd.getStateForTime(time) == state) {
					d.push(cd);
				}
			}
			return d;
		}

		public function get delays() : Vector.<Delay> {
			return _delays;
		}

		public function parse(value : XML) : void {
			_rawData = value;
			var d : Delay;
			_delays = new Vector.<Delay>();
			for each (var delay:Object in value.d) {
				d = new Delay(delay);
				_delays.push(d);
			}
			_delays.sort(sortDelaysFunction);
		}

		private static function sortDelaysFunction(a : Delay, b : Delay) : int {
			if (a.time > b.time) return 1;
			if (a.time < b.time) return -1;
			return 0;
		}

		public function get running() : Boolean {
			return _timer.running;
		}

		public function destroy() : void 
		{
			_timer.removeEventListener(TimerEvent.TIMER, timerHandler);
			_timer = null;
		}
	}
}

/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 10.03.13
 */
package com.hp.model {
import com.hp.model.vo.Delay;
	import org.robotlegs.mvcs.Actor;



	public class DelaysModel extends Actor {
		
		private var _rawData : XML;
		private var _delays : Vector.<Delay>;

		public function DelaysModel() {
			log("DelaysModel");
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
	}
}

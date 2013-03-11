/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 10.03.13
 */
package com.hp.model {
import com.hp.model.vo.NoteVO;

import org.robotlegs.mvcs.Actor;

public class NotesModel extends Actor {
	private var _rawData:XML;
	private var _delays:Vector.<NoteVO>;

	public function NotesModel() {
		log("NotesModel");
	}

	public function getDelaysForTime(time:int, state:int = 1):Vector.<NoteVO> {
		var d:Vector.<NoteVO> = new Vector.<NoteVO>();
		var cd:NoteVO;
		for (var i:int = 0; i < _delays.length; i++) {
			cd = _delays[i];
			if (cd.getStateForTime(time) == state) {
				d.push(cd);
			}
		}
		return d;
	}

	public function get delays():Vector.<NoteVO> {
		return _delays;
	}

	public function parse(value:XML):void {
		_rawData = value;
		var d:NoteVO;
		_delays = new Vector.<NoteVO>();
		for each (var delay:Object in value.d) {
			d = new NoteVO(delay);
			_delays.push(d);
		}
		_delays.sort(sortDelaysFunction);
	}

	private static function sortDelaysFunction(a:NoteVO, b:NoteVO):int {
		if (a.time > b.time) return 1;
		if (a.time < b.time) return -1;
		return 0;
	}
}
}

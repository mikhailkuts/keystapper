/**
 * Created with IntelliJ IDEA.
 * User: kuts
 * Date: 3/11/13
 * Time: 12:07 AM
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.model {
import com.hp.keystapper.model.vo.LevelVO;
import com.hp.keystapper.model.vo.NoteVO;

import flash.events.Event;

import org.robotlegs.mvcs.Actor;

public class LevelsModel extends Actor {

	public static const LEVELS_ASSETS:String = "LevelsAssets";

	public static const DATA_ASSIGNED:String = "DataAssigned";
	private var _levels:Vector.<LevelVO>;
	private var _ready:Boolean;

	public function LevelsModel() {
		super();
	}

	public function getDelaysForTime(time:int, state:int = 1):Vector.<NoteVO> {
		/*var d:Vector.<NoteVO> = new Vector.<NoteVO>();
		 var cd:NoteVO;
		 for (var i:int = 0; i < _levels.length; i++) {
		 cd = _levels[i];
		 if (cd.getStateForTime(time) == state) {
		 d.push(cd);
		 }
		 }
		 return d;*/
		return null;
	}


	public function get levels():Vector.<LevelVO> {
		return _levels;
	}

	public function set levels(value:Vector.<LevelVO>):void {
		_levels = value;
		_ready = true;
		eventDispatcher.dispatchEvent(new Event(DATA_ASSIGNED));
	}

	public function get ready():Boolean {
		return _ready;
	}
}

}

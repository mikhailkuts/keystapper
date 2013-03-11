/**
 * Created with IntelliJ IDEA.
 * User: kuts
 * Date: 3/11/13
 * Time: 12:07 AM
 * To change this template use File | Settings | File Templates.
 */
package com.hp.model {
import flash.events.Event;
import flash.utils.Dictionary;

import org.robotlegs.mvcs.Actor;

public class LevelsModel extends Actor {

	public static const LEVELS_ASSETS:String = "LevelsAssets";

	public static const DATA_ASSIGNED:String = "DataAssigned";
	private var _levels:Dictionary;

	public function LevelsModel() {
		super();
	}

	public function set levelsData(data:Dictionary):void {
		_levels = data;

		eventDispatcher.dispatchEvent(new Event(DATA_ASSIGNED));
	}

	public function get levelsData():Dictionary {
		return _levels;
	}
}

}

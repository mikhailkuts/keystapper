/**
 * Created with IntelliJ IDEA.
 * User: kuts
 * Date: 3/11/13
 * Time: 12:07 AM
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.model {
import com.hp.keystapper.model.vo.LevelVO;

import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.getTimer;

import org.robotlegs.mvcs.Actor;

public class LevelsModel extends Actor {

	public static const DATA_ASSIGNED:String = "DataAssigned";
	public static const LEVEL_CHANGED:String = "onLevelChanged";

	private var _levels:Vector.<LevelVO>;
	private var _currentLevelID:int = 0;
	private var _startTime:int = 0;
	private var _currentTime:int = 0;

	public function LevelsModel() {
		super();
	}

	public function start():void
	{
		_startTime = getTimer();
	}
	public function timerTick(event:TimerEvent = null):void
	{
		_currentTime = getTimer() - _startTime;
	}
	
	public function get levels():Vector.<LevelVO> {
		return _levels;
	}

	public function set levels(value:Vector.<LevelVO>):void {
		_levels = value;
		eventDispatcher.dispatchEvent(new Event(DATA_ASSIGNED));
	}

	public function get currentLevel():LevelVO
	{
		return levels[_currentLevelID];
	}
	public function get currentLevelID():int
	{
		return _currentLevelID;
	}

	public function set currentLevelID(value:int):void
	{
		_currentLevelID = value;
		dispatch(new Event(LEVEL_CHANGED));
	}

	public function get currentTime():int
	{
		return _currentTime;
	}
}

}

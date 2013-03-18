/**
 * Created with IntelliJ IDEA.
 * User: kuts
 * Date: 3/11/13
 * Time: 12:07 AM
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.model {
import com.hp.keystapper.model.vo.LevelVO;

import flash.events.TimerEvent;
import flash.utils.getTimer;

import org.robotlegs.mvcs.Actor;

public class GameModel extends Actor {

	public static const START_LEVEL:String = "StartLevel";
	public static const PREPARE_LEVEL:String = "PrepareLevel";
	public static const STOP_LEVEL:String = "StopLevel";

	private var _currentLevel:LevelVO;

	private var _levels:Vector.<LevelVO>;

	private var _startTime:int = 0;
	private var _currentTime:int = 0;

	public function GameModel()
	{
		super();
	}

	public function timerTick(event:TimerEvent = null):void
	{
		_currentTime = getTimer() - _startTime;
	}

	public function get levels():Vector.<LevelVO>
	{
		return _levels;
	}

	public function set levels(value:Vector.<LevelVO>):void
	{
		_levels = value;
	}

	public function get currentLevel():LevelVO
	{
		return _currentLevel;
	}

	public function set currentLevel(value:LevelVO):void
	{
		_currentLevel = value;
	}
}
}

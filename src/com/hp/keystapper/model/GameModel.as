/**
 * Created with IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 15.03.13
 * Time: 2:45
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.model {
import org.robotlegs.mvcs.Actor;

public class GameModel extends Actor {

	public static const GAME_START:String = "GameStart";
	public static const GAME_STOP:String = "GameStop";
	public static const GAME_PAUSE:String = "GamePause";
	public static const GAME_RESUME:String = "GameResume";

	public function GameModel()
	{
		super();
	}
}
}

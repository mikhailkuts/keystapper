/*
 * User: kuts
 * Date: 3/13/13
 */
package com.hp.keystapper.model {
import flash.media.SoundChannel;

import org.robotlegs.mvcs.Actor;

public class SoundModel extends Actor {

	private var _channel:SoundChannel;

	public function SoundModel()
	{
		super();
	}

	public function get channel():SoundChannel
	{
		return _channel;
	}

	public function set channel(val:SoundChannel):void
	{
		_channel = val;
	}

	public function set volume(val:int):void
	{
		_channel.soundTransform.volume = val;
	}

	public function get volume():int
	{
		return _channel.soundTransform.volume;
	}
}
}

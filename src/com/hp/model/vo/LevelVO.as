/**
 * Created with IntelliJ IDEA.
 * User: kuts
 * Date: 3/11/13
 * Time: 12:23 AM
 * To change this template use File | Settings | File Templates.
 */
package com.hp.model.vo {
	import flash.media.Sound;

	import org.robotlegs.mvcs.Actor;

	public class LevelVO extends Actor {
		public var track : Sound;
		public var notes : Vector.<NoteVO> = new Vector.<NoteVO>();

		public function LevelVO() : void {
			super();
		}
	}
}

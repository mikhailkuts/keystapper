package com.hp.controller {
	import com.hp.controller.events.TimeKeyboardEvent;
	import com.hp.model.DelaysModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author Alexander Slavschik <kvinty@icloud.com>
	 * created 11.03.2013
	 */
	public class KeyboardCommand extends Command {
		[Inject]
		public var event : TimeKeyboardEvent;
		[Inject]
		public var delays : DelaysModel;

		public function KeyboardCommand() {
		}

		override public function execute() : void {
			super.execute();
			log(event.keyCode, event.time);
		}
	}
}

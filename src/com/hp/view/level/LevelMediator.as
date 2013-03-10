/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:31
 * To change this template use File | Settings | File Templates.
 */
package com.hp.view.level {
	import org.osmf.logging.Log;
	import com.hp.view.level.components.LevelView;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.KeyboardEvent;

	public class LevelMediator extends Mediator {
		[Inject]
		public var view : LevelView;
		private var _delaysManager : DelaysManager;

		public function LevelMediator() {
			_delaysManager = new DelaysManager();
		}

		override public function onRegister() : void {
			view.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			view.init();

			var data : XML = <data>
				<d t="2300" k="A" />
				<d t="2350" k="B" />
				<d t="3200" k="C" />
				<d t="4380" k="D" />
				<d t="1303" k="E" />
				<d t="9872" k="F" />
				<d t="8726" k="G" />
				<d t="6783" k="L" />
			</data>;
			_delaysManager.parse(data);
		}

		private function keyDownHandler(event : KeyboardEvent) : void {
			log(event.keyCode);

			_delaysManager.press(event.keyCode);

			switch (event.keyCode) {
				case 83:
					if (_delaysManager.running) {
						_delaysManager.stop();
					} else {
						_delaysManager.start();
					}
					break;
			}
		}

		override public function onRemove() : void {
			_delaysManager.destroy();
		}
	}
}

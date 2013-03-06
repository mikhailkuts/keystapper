/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:00
 * To change this template use File | Settings | File Templates.
 */
package {
import com.hp.GameContext;

import flash.display.MovieClip;

import flash.events.Event;

public class App extends MovieClip {

	private var _preloaderScreen:PreloaderScreen;
	
	public function App():void
	{
		_preloaderScreen = new PreloaderScreen();
		_preloaderScreen.addEventListener(Event.COMPLETE, handlePreloadeingComplete);
		_preloaderScreen.init();

		addChild(_preloaderScreen);
	}

	private function handlePreloadeingComplete(event:Event):void
	{
		_preloaderScreen.removeEventListener(Event.COMPLETE, handlePreloadeingComplete);

		removeChild(_preloaderScreen);

		new GameContext(this);
	}
}
}

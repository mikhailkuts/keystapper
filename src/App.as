/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:00
 * To change this template use File | Settings | File Templates.
 */
package
{
import com.hp.GameContext;

import flash.display.MovieClip;

[Frame(factoryClass="PreloaderScreen")]
public class App extends MovieClip {

	public function App():void
	{
		log("app created");
		new GameContext(this);
	}
}
}

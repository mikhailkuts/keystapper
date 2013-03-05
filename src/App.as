/**
 * Created by IntelliJ IDEA.
 * User: mikhailkuts
 * Date: 06.03.13
 * Time: 1:00
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;
import flash.events.Event;

public class App extends Sprite {
    public function App() {
        addEventListener(Event.ADDED_TO_STAGE, handlerStageAdded);
    }

    private function handlerStageAdded(event:Event):void {
        trace("Inited");
    }
}
}

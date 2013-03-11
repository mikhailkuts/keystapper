package {
import flash.display.DisplayObject;
import flash.display.LoaderInfo;
import flash.display.MovieClip;
import flash.events.Event;
import flash.utils.getDefinitionByName;

public class PreloaderScreen extends MovieClip {
	private var _targetLoaderInfo:LoaderInfo;
	private const MAIN_CLASS_NAME:String = "App";

	public function PreloaderScreen() {
		stop();
		if (stage) {
			handleAddToStage();
		} else {
			this.addEventListener(Event.ADDED_TO_STAGE, handleAddToStage);
		}
	}

	private function handleAddToStage(evt:Event = null):void {
		_targetLoaderInfo = stage.loaderInfo;

		this.removeEventListener(Event.ADDED_TO_STAGE, handleAddToStage);
		this.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
	}

	private function handleEnterFrame(evt:Event):void {
		var _loadPercent:Number = _targetLoaderInfo.bytesLoaded / _targetLoaderInfo.bytesTotal;

		if (_loadPercent >= 1) {
			this.removeEventListener(Event.ENTER_FRAME, handleEnterFrame);
			this.dispatchEvent(new Event(Event.COMPLETE));

			nextFrame();
			var mainClass:Class = getDefinitionByName(MAIN_CLASS_NAME) as Class;
			var root:Object = new mainClass as Object;
			addChild(root as DisplayObject);
		}
	}
}
}
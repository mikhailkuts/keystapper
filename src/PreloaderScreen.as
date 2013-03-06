package {
import flash.display.LoaderInfo;
import flash.display.Sprite;
import flash.events.Event;

public class PreloaderScreen extends Sprite
{
	private var _targetLoaderInfo:LoaderInfo;

	private var _loadPercent:Number = 0;

	public function init():void
	{
		this.addEventListener(Event.ADDED_TO_STAGE , handleAddToStage);
	}

	private function handleAddToStage(evt:Event):void
	{
		_targetLoaderInfo = stage.loaderInfo;

		this.removeEventListener(Event.ADDED_TO_STAGE , handleAddToStage);
		this.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
	}

	private function handleEnterFrame(evt:Event):void
	{
		_loadPercent = _targetLoaderInfo.bytesLoaded / _targetLoaderInfo.bytesTotal;

		if (_loadPercent == 1)
		{
			this.removeEventListener(Event.ENTER_FRAME, handleEnterFrame);
			this.dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}

}
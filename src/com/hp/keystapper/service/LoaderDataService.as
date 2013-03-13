/**
 * Created with IntelliJ IDEA.
 * User: kuts
 * Date: 3/10/13
 * Time: 10:49 PM
 * To change this template use File | Settings | File Templates.
 */
package com.hp.keystapper.service {
import com.hp.keystapper.model.LevelsModel;
import com.hp.keystapper.model.vo.LevelVO;
import com.hp.keystapper.model.vo.NoteVO;
import com.hp.keystapper.view.GameMediator;

import flash.events.Event;
import flash.media.Sound;
import flash.utils.Dictionary;

import org.assetloader.AssetLoader;
import org.assetloader.core.IAssetLoader;
import org.assetloader.signals.LoaderSignal;
import org.robotlegs.mvcs.Actor;

public class LoaderDataService extends Actor {

	public static const ON_DATA_LOADED:String = "OnDataLoaded";

	[Inject]
	public var assetLoader:IAssetLoader;
	[Inject]
	public var levelsModel:LevelsModel;

	public function LoaderDataService():void {
	}

	public function load(configPath:String):void
	{
		assetLoader.addConfig(configPath);
		assetLoader.onConfigLoaded.add(onConfigLoaded);
	}

	private function onConfigLoaded(signal:LoaderSignal):void {
		assetLoader.onConfigLoaded.remove(onConfigLoaded);
		assetLoader.onComplete.add(onLoadingComplete);
		assetLoader.start();
	}

	private function onLoadingComplete(signal:LoaderSignal, data:Dictionary):void {
		var levels:Vector.<LevelVO> = new <LevelVO>[];

		for (var levelId:* in data) {
			var levelVO:LevelVO = new LevelVO();

			for (var assetId:* in data[levelId]) {
				var assetItem:Object = data[levelId][assetId];

				if (assetItem is Sound) {
					levelVO.track = assetItem as Sound;
				}

				if (assetItem is XML) {
					levelVO.keyboard = String(assetItem.config.@keyboard);
					levelVO.hit = int(assetItem.config.@hit);
					levelVO.goal = int(assetItem.config.@goal);

					var notesData:Vector.<NoteVO> = new Vector.<NoteVO>();
					var notesList:XMLList = assetItem.notes.note;
					var note:NoteVO;
					for each (var delay:XML in notesList) {
						note = new NoteVO(delay);
						notesData.push(note);
					}
					notesData.sort(sortDelaysFunction);
					levelVO.notes = notesData;
				}
			}
			// TODO: remove dump if-else
			if (levelVO.notes && levelVO.track) {
				levels[levelId - 1] = levelVO;
			} else {
				throw new Error("levelVO invalid");
			}
		}

		levelsModel.levels = levels;

		eventDispatcher.dispatchEvent(new Event(ON_DATA_LOADED));
	}

	private static function sortDelaysFunction(a:NoteVO, b:NoteVO):int {
		if (a.time > b.time) return 1;
		if (a.time < b.time) return -1;
		return 0;
	}
}
}

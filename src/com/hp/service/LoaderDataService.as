/**
 * Created with IntelliJ IDEA.
 * User: kuts
 * Date: 3/10/13
 * Time: 10:49 PM
 * To change this template use File | Settings | File Templates.
 */
package com.hp.service {
import com.hp.model.LevelsModel;
import com.hp.model.vo.LevelVO;
import com.hp.model.vo.NoteVO;

import flash.events.Event;

import flash.media.Sound;
import flash.utils.Dictionary;

import org.assetloader.AssetLoader;
import org.assetloader.core.IAssetLoader;
import org.assetloader.signals.LoaderSignal;
import org.robotlegs.mvcs.Actor;

public class LoaderDataService extends Actor {
	[Inject]
	public var assetLoader:IAssetLoader;
	[Inject]
	public var levelsModel:LevelsModel;

	public function LoaderDataService():void {
	}

	public function load():void {
		assetLoader = new AssetLoader();
		assetLoader.addConfig("assets.xml");
		// TODO: assets path should be constant
		assetLoader.onConfigLoaded.add(onConfigLoaded);
	}

	private function onConfigLoaded(signal:LoaderSignal):void {
		assetLoader.onConfigLoaded.remove(onConfigLoaded);
		assetLoader.onComplete.add(onLoadingComplete);
		assetLoader.start();
	}

	private function onLoadingComplete(signal:LoaderSignal, data:Dictionary):void {

		var levelsAssetsData:Dictionary = data[LevelsModel.LEVELS_ASSETS];
		var levels:Vector.<LevelVO> = new <LevelVO>[];
		for (var levelId:* in levelsAssetsData) {
			var levelVO:LevelVO = new LevelVO();

			for (var assetId:* in levelsAssetsData[levelId]) {
				var assetItem:Object = levelsAssetsData[levelId][assetId];

				if (assetItem is Sound) {
					levelVO.track = assetItem as Sound;
				}

				if (assetItem is XML) {
					var notesList:XMLList = assetItem.note;

					var notes:Vector.<NoteVO> = new Vector.<NoteVO>();
					var d:NoteVO;
					for each (var delay:XML in notesList) {
						d = new NoteVO(delay);
						notes.push(d);
					}
					notes.sort(sortDelaysFunction);
					levelVO.notes = notes;
				}
				// TODO: remove dump if-else
				log(levelVO.notes.length, levelVO.track)
				if(levelVO.notes && levelVO.track){
					//all is good
					levels.push(levelVO);
				}else{
					throw new Error("levelVO invalid");
				}
			}
			levelsModel.levels = levels;
			levelsAssetsData[levelId] = levelVO;
		}
	}
	private static function sortDelaysFunction(a:NoteVO, b:NoteVO):int {
		if (a.time > b.time) return 1;
		if (a.time < b.time) return -1;
		return 0;
	}
}
}

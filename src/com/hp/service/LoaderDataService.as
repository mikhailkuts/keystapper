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

	import flash.media.Sound;
	import flash.utils.Dictionary;

	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.LoaderSignal;
	import org.robotlegs.mvcs.Actor;

	public class LoaderDataService extends Actor {
		[Inject]
		public var assetLoader : IAssetLoader;
		[Inject]
		public var levelsModel : LevelsModel;

		public function LoaderDataService() : void {
		}

		public function load() : void {
			assetLoader = new AssetLoader();
			assetLoader.addConfig("assets.xml");
			// TODO: assets path should be constant
			assetLoader.onConfigLoaded.add(onConfigLoaded);
		}

		private function onConfigLoaded(signal : LoaderSignal) : void {
			assetLoader.onConfigLoaded.remove(onConfigLoaded);
			assetLoader.onComplete.add(onLoadingComplete);
			assetLoader.start();
		}

		private function onLoadingComplete(signal : LoaderSignal, data : Dictionary) : void {
			var levelsData : Dictionary = new Dictionary();

			for (var levelId in data) {
				var levelVO : LevelVO = new LevelVO();

				for (var assetId in data[levelId]) {
					var assetItem : Object = data[levelId][assetId];

					if (assetItem is Sound) {
						levelVO.track = assetItem as Sound;
					}

					if (assetItem is XML) {
						var notesList : XMLList = assetItem.note;

						for each (var note:XML in notesList) {
							var noteVO : NoteVO = new NoteVO();

							noteVO.delay = note.@ms;
							noteVO.key = note.@key;

							levelVO.notes.push(noteVO);
						}
					}
				}

				levelsData[levelId] = levelVO;
			}

			levelsModel.levelsData = levelsData;
		}
	}
}

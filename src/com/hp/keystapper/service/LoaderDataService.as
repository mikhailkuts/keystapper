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

import flash.events.Event;
import flash.media.Sound;

import flash

import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.utils.Dictionary;

import org.assetloader.core.IAssetLoader;
import org.assetloader.signals.LoaderSignal;
import org.robotlegs.mvcs.Actor;

public class LoaderDataService extends Actor {

	public static const ON_DATA_LOADED:String = "OnDataLoaded";

	private var _configLoader:URLLoader;
	private var _levelsParams:Dictionary;

	[Inject]
	public var assetLoader:IAssetLoader;
	[Inject]
	public var levelsModel:LevelsModel;

	public function LoaderDataService():void {
	}

	public function load(configPath:String):void
	{
		_configLoader = new URLLoader();
		_configLoader.addEventListener(Event.COMPLETE, onConfigLoaded);
		_configLoader.load(new URLRequest(configPath));
	}

	private function onConfigLoaded(event:Event):void
	{
		_configLoader.removeEventListener(Event.COMPLETE, onConfigLoaded);

		var levels:XMLList = XML(event.target.data).level as XMLList;

		_levelsParams = new Dictionary();

		for each(var level:XML in levels)
		{
			var levelId:String = String(level.@id);

			_levelsParams[levelId] = {
				keyboard: String(level.@keyboard),
				hit: int(level.@hit),
				goal: int(level.@goal)
			}
		}

		assetLoader.addConfig(event.target.data);
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
					var notesData:Vector.<NoteVO> = new Vector.<NoteVO>();
					var notesList:XMLList = assetItem.note;
					var note:NoteVO;
					for each (var delay:XML in notesList) {
						note = new NoteVO(delay);
						notesData.push(note);
					}
					notesData.sort(sortDelaysFunction);
					levelVO.notes = notesData;
				}
			}

			levelVO.goal = _levelsParams[levelId].goal;
			levelVO.hit = _levelsParams[levelId].hit;
			levelVO.keyboard = _levelsParams[levelId].keyboard;

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

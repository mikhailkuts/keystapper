/**
 * @author: Alexander Slavschik <kvinty@icloud.com>
 * created at: 12.03.13
 */
package com.hp.keystapper.controller {
import assets.LevelView;

import com.hp.keystapper.events.ObjectEvent;
import com.hp.keystapper.model.levels.LevelsModel;
import com.hp.keystapper.view.GameMediator;
import com.hp.keystapper.view.LevelMediator;
import com.hp.keystapper.view.keyboards.IKeyboardView;
import com.hp.keystapper.view.keyboards.KeyboardView1;

import flash.events.Event;

import org.robotlegs.mvcs.Command;

public class LevelSelectCommand extends Command
{
	[Inject]
	public var event:ObjectEvent;
	[Inject]
	public var levelsModel:LevelsModel;

	public function LevelSelectCommand()
	{
		super();
	}
	override public function execute():void
	{
		var level:int = int(event.data.level);
		mediatorMap.mapView(LevelView, LevelMediator);
		levelsModel.currentLevelID = level;
		if(injector.hasMapping(IKeyboardView)){
			injector.unmap(IKeyboardView);
		}
		switch(level)
		{
			//TODO: пока всего одна клавиатруа
			case 0:
				injector.mapClass(IKeyboardView, KeyboardView1);
			break;
			case 1:
				injector.mapClass(IKeyboardView, KeyboardView1);
				break;
			case 2:
				injector.mapClass(IKeyboardView, KeyboardView1);
				break;
		}
		injector.mapClass(IKeyboardView, KeyboardView1);

		dispatch(new Event(GameMediator.ACTIVE_LEVEL));
		super.execute();
	}
}
}

package com.hp.controller
{
import com.hp.model.ids.AssetId;
import com.hp.view.game.components.GameView;

import mu.utils.FlashVarsDynamic;

import mx.containers.Canvas;

import org.assetloader.core.IAssetLoader;
	import org.robotlegs.mvcs.Command;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	public class StartupCompleteCommand extends Command
	{
		[Inject]
		public var assetLoader : IAssetLoader;

		override public function execute() : void 
		{
			contextView.stage.scaleMode = StageScaleMode.NO_SCALE;
			contextView.stage.align = StageAlign.TOP_LEFT;
			
			assetLoader.numConnections = 1;
			
			assetLoader.addLazy(AssetId.HEADER_IMAGE, "images/header.png");
			assetLoader.addLazy(AssetId.GLOBAL_STYLESHEET, "data/default.css");
			assetLoader.addLazy(AssetId.HTML_BODY, "data/body.html");
			
			contextView.addChild(new GameView());

			assetLoader.start();
		}
	}
}

package com.hp.controller {
	import com.hp.view.game.components.GameView;

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

		}
	}
}

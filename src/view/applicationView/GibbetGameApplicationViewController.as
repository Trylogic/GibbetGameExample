package view.applicationView
{
	import actions.OPEN_MENU;
	import actions.gameFlow.END_GAME;
	import actions.gameFlow.START_GAME;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	import tl.viewController.ApplicationViewController;

	public class GibbetGameApplicationViewController extends ApplicationViewController
	{
		override lifecycle function viewLoaded():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.SHOW_ALL;

			stage.focus = stage;

			stage.tabChildren = false;
		}

		[Action]
		OPEN_MENU function onStartGame( ...args ):void
		{
			view.currentState = "menu";
		}

		[Action]
		START_GAME function onPlayGame( ...args ):void
		{
			view.currentState = "game";
		}

		[Action]
		END_GAME function onEndGame( ...args ):void
		{
			view.currentState = "scores";
		}
	}
}
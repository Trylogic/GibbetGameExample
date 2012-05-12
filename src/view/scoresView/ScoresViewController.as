package view.scoresView
{
	import actions.OPEN_MENU;

	import flash.text.TextField;

	import models.IGibbetGameModel;

	import tl.viewController.ViewController;

	public class ScoresViewController extends ViewController
	{
		[Injection]
		public var gibbetGameModel:IGibbetGameModel;

		[Outlet]
		public var resultTextField:TextField;

		[Outlet]
		public var wordTextField:TextField;

		[Outlet]
		public var lettersTextField:TextField;

		override lifecycle function viewBeforeAddedToStage():void
		{
			resultTextField.text = gibbetGameModel.lifesLeft == 1 ? "You lose!" : "You won!";
			wordTextField.text = gibbetGameModel.currentQuestion;
			lettersTextField.text = gibbetGameModel.keysPressed.join( "," );
		}


		[Event(name="replayButtonPressed")]
		public function onReplayButtonPressed():void
		{
			actionDispatcher.dispatch( OPEN_MENU );
		}
	}
}

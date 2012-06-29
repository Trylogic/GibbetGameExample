package view.gameView
{
	import actions.gameFlow.START_GAME;
	import actions.gameLogic.ANSWER;
	import actions.gameLogic.ANSWER_RESPOSE;

	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;

	import models.IGibbetGameModel;

	import tl.viewController.ViewController;

	public class GameViewController extends ViewController
	{
		[Injection]
		public var gibbetGameModel:IGibbetGameModel;

		[Outlet]
		public var gibbet:MovieClip;

		[Outlet]
		public var word:TextField;

		public function onKeyDown( e:KeyboardEvent ):void
		{
			actionDispatcher.dispatch( ANSWER, [String.fromCharCode( e.charCode )] );
		}

		[Action]
		START_GAME function onStartGame():void
		{
			refreshGameStatus();
		}

		[Action]
		ANSWER_RESPOSE function onAnswerResponse():void
		{
			refreshGameStatus();
		}

		protected function refreshGameStatus():void
		{
			gibbet.gotoAndStop( gibbet.totalFrames - gibbetGameModel.lifesLeft );

			var currentQuestion:String = "";
			for ( var i:int = 0; i < gibbetGameModel.currentQuestion.length; i++ )
			{
				if ( gibbetGameModel.keysPressed.indexOf( gibbetGameModel.currentQuestion.toUpperCase().charAt( i ) ) == -1 )
				{
					currentQuestion += "_";
				}
				else
				{
					currentQuestion += gibbetGameModel.currentQuestion.charAt( i );
				}
			}
			word.text = currentQuestion;
		}
	}
}
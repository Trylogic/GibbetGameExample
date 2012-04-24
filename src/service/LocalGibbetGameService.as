package service
{
	import actions.gameFlow.END_GAME;
	import actions.gameFlow.INIT_GAME;
	import actions.gameFlow.START_GAME;
	import actions.gameLogic.ANSWER;
	import actions.gameLogic.ANSWER_RESPOSE;

	import core.ILogger;

	import models.IGibbetGameModel;

	import tl.framework.examples.gibbetGame.assets.GibbetAsset;
	import tl.service.Service;

	public class LocalGibbetGameService extends Service
	{
		[Injection]
		public var logger:ILogger;

		[Injection]
		public var gibbetGameModel:IGibbetGameModel;

		public var words:Vector.<String> = new Vector.<String>();

		[Action]
		INIT_GAME function onInitGame():void
		{
			gibbetGameModel.currentQuestion = words[int( Math.random() * words.length )];
			gibbetGameModel.keysPressed = [];

			// Dirty Dirty hack =)
			gibbetGameModel.lifesLeft = (new GibbetAsset()).totalFrames - 1;

			actionDispatcher.dispatch( START_GAME );
		}

		[Action]
		ANSWER function onAnswer( key:String ):void
		{
			key = key.toUpperCase();
			var currentQuestionUpperCase:String = gibbetGameModel.currentQuestion.toUpperCase();
			var keysPressed:Array = gibbetGameModel.keysPressed;
			if ( keysPressed.indexOf( key ) == -1 )
			{
				keysPressed.push( key );

				if ( currentQuestionUpperCase.indexOf( key ) == -1 )
				{
					gibbetGameModel.lifesLeft--;
					if ( gibbetGameModel.lifesLeft == 1 )
					{
						actionDispatcher.dispatch( END_GAME, [0] );
					}
				}
				else
				{
					var completed:Boolean = true;
					for ( var i:int = 0; i < currentQuestionUpperCase.length; i++ )
					{
						if ( keysPressed.indexOf( currentQuestionUpperCase.charAt( i ) ) == -1 )
						{
							completed = false;
							break;
						}
					}

					if ( completed )
					{
						actionDispatcher.dispatch( END_GAME, [1] );
					}
				}
			}

			actionDispatcher.dispatch( ANSWER_RESPOSE );
		}
	}
}
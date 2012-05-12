package view.startView
{
	import actions.gameFlow.INIT_GAME;

	import tl.viewController.ViewController;

	public class StartViewController extends ViewController
	{
		[Event(name="playButtonClicked")]
		public function onPlayButtonClicked():void
		{
			actionDispatcher.dispatch( INIT_GAME );
		}
	}
}
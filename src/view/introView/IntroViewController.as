package view.introView
{
	import actions.OPEN_MENU;

	import tl.viewController.ViewController;

	public class IntroViewController extends ViewController
	{
		[Event(name="startButtonPressed")]
		public function onStartButtonPressed():void
		{
			actionDispatcher.dispatch( OPEN_MENU );
		}
	}
}

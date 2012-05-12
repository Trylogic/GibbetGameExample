package models
{
	import flash.events.EventDispatcher;

	public class GibbetGameModel extends EventDispatcher implements IGibbetGameModel
	{
		[Bindable]
		public var currentQuestion:String = "";

		[Bindable]
		public var keysPressed:Array = [];

		[Bindable]
		public var lifesLeft:int = 0;
	}
}

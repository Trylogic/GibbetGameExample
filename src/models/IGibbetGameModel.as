package models
{
	public interface IGibbetGameModel
	{
		function get currentQuestion():String;

		function set currentQuestion( value:String ):void;

		function get keysPressed():Array;

		function set keysPressed( value:Array ):void;

		function get lifesLeft():int;

		function set lifesLeft( value:int ):void;
	}
}

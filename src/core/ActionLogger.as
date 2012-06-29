package core
{
	import tl.actions.IActionLogger;
	import tl.ioc.IoCHelper;

	public class ActionLogger implements IActionLogger
	{
		[Injection]
		public var logger:ILogger;

		public function ActionLogger()
		{
			IoCHelper.injectTo( this );
		}

		public function log( type:String, params:Array = null ):void
		{
			logger.log( type + "(" + params + ")" );
		}
	}
}

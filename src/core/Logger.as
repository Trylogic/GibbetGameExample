package core
{
	import service.*;
	import tl.ioc.IoCHelper;
	import tl.ioc.ioc_internal;

	public class Logger implements ILogger
	{
		private var instanceName : String;

		ioc_internal static function getInstanceForInstance( instance : * ) : Logger
		{
			return new Logger( instance.toString() );
		}

		public function Logger( instanceName : String )
		{
			IoCHelper.injectTo( this );
			this.instanceName = instanceName;
		}

		public function log( ... args ) : void
		{
			trace( "Logger", instanceName, args );
		}
	}
}

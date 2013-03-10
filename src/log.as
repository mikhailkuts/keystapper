package
{
	import flash.external.ExternalInterface;

	/**
	 * @author: Alexander Slavschik <kvinty@icloud.com>
	 * created at: 10.03.13
	 */
	public function log(...params):void
	{
		ExternalInterface.call("console.log", params.join(" "));
	}
}
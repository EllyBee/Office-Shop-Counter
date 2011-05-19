function sendScoreToPhp(officeScore:int, shopScore:int):void
{
	//var requestUrl:URLRequest = new URLRequest("http://website.local/wk/officevsshop/flash2pachube.php");
	var requestUrl:URLRequest = new URLRequest("http://10.3.8.127/~elly.bowness/php/flash2pachube.php");
	//var requestUrl:URLRequest = new URLRequest("php/flash2pachube.php");
	//var requestUrl:URLRequest = new URLRequest("http://yuyuyuyoyoyo.com/dev/officevsshop/flash2pachube.php");
	
	requestUrl.method = URLRequestMethod.POST;
	var dataToSend:URLVariables = new URLVariables();
	dataToSend.fromFlashOffice = officeScore;
	dataToSend.fromFlashShop = shopScore;
	requestUrl.data = dataToSend;
	
	var myLoader:URLLoader = new URLLoader(requestUrl);
	myLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
	myLoader.addEventListener(Event.COMPLETE, handleLoadSuccessful);
	myLoader.load(requestUrl);
}



function handleLoadSuccessful(event:Event):void
{
	var vars:URLVariables = new URLVariables(event.target.data);
	trace(vars.fromPhp);
}

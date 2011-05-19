/////setup invisible btn to test button input////;
shopBtn.addEventListener(MouseEvent.CLICK, ShopClick, false, 0, true);
officeBtn.addEventListener(MouseEvent.CLICK, OfficeClick, false, 0, true);


function ShopClick(event:MouseEvent):void
{
	officeAction(); // currently wrong names
}

function OfficeClick(event:MouseEvent):void
{
	shopAction();
}

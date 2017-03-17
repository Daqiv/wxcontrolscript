require "PageUtil";
require "Constants";

News = {}

--浏览新闻
function News.viewNews()

	PageUtil.pageMy();

	mSleep(1500);

	tap(Constants.my_sz_x, Constants.my_sz_y); --点击设置

	mSleep(1850);

	tap(Constants.my_sz_ty_x, Constants.my_sz_ty_y); --点击通用

	mSleep(2050);

	tap(Constants.my_sz_ty_gn_x, Constants.my_sz_ty_gn_y); --点击功能

	mSleep(1932);

	tap(Constants.my_sz_ty_gn_txxw_x, Constants.my_sz_ty_gn_txxw_y); --点击腾讯新闻

	mSleep(1957);

	tap(Constants.my_sz_ty_gn_txxw_txxw_x, Constants.my_sz_ty_gn_txxw_txxw_y); --点击腾讯新闻

	mSleep(3000);

	viewNewsContent(130, 1060); --浏览第1条新闻

	viewNewsContent(130, 1234); --浏览第2条新闻

	returnMy(4); --返回到我页面

end;

--浏览X,Y坐标点的新闻
function viewNewsContent(x, y)

	tap(x, y); --浏览新闻

	mSleep(10000); --读取新闻内容(比较慢，与手机性能、网速有关)

	-- start view news --

	touchDown(230,1125);

	for i = 1125, 80, -10 do
		touchMove(230, i);
		mSleep(math.random(0,150));        --延迟
	end

	touchUp(230,1025);

	mSleep(500);

	--点击左上角X
	tap(Constants.upperleft_x, Constants.upperleft_y);

	mSleep(1000);

	-- end view news --

end;

--返回主页
function returnMy(loop)

	for i=0,loop,1
	do
		--点击左上角返回
		tap(Constants.upperleft_x, Constants.upperleft_y);

		mSleep(500);
	end;
end;

return News;

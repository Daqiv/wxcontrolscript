require "TSLib"

PageUtil = {};

function PageUtil.pageWeiXin()
	-- 微信-微信
	if multiColor({{84, 1212, 0x46c01b },{264, 1228, 0x999999},{448, 1212, 0x999999}}) == true then--全部坐标点和颜色一致时返回 true，== true 可省略不写

		x, y = findImageInRegionFuzzy("zs_jt.png", 80, 22, 72,70,116, 0xffffff);

		if x ~= -1 and y ~= -1 then
			tap(x, y);
			mSleep(500);
		end;

		AppUtil.pressHomeKey();
		mSleep(500);
		AppUtil.run();

		tap(84, 1218);
	end;
end;

--定位到通讯录页面
function PageUtil.pageContact()

	PageUtil.mainPage();

	--寻找首页(通讯录)底部栏图标
	x,y = findMultiColorInRegionFuzzy( 0x999999, "0|8|0x999999,0|16|0x999999", 90, 220, 1180, 310, 1270);
	if x ~= -1 and y ~= -1 then
		tap(x, y);
		mSleep(3002);

		x,y = findMultiColorInRegionFuzzy( 0x45c01a, "48|4|0x45c01a,20|50|0x45c01a", 90, 10, 240, 120, 360);
		if x ~= -1 and y ~= -1 then
			tap(x, y);
			mSleep(1002);
		end;

	end;

end;

function PageUtil.pageFind()
	-- 微信—发现
	--if multiColor({{434, 1202, 0x46c01b },{92, 1228, 0x9a9a9a},{270, 1248, 0xacacac}}) == true then--全部坐标点和颜色一致时返回 true，== true 可省略不写

		x, y = findImageInRegionFuzzy("zs_jt.png", 80, 22, 72,70,116, 0xffffff);

		if x ~= -1 and y ~= -1 then
			tap(x, y);
			mSleep(500);
		end;

		AppUtil.pressHomeKey();
		mSleep(500);
		AppUtil.run();

		tap(444, 1218);
	--end;
end;

--摇一摇界面
function PageUtil.ShakeReportUI()
	runApp("com.tencent.mm","com.tencent.mm.plugin.shake.ui.ShakeReportUI");
	mSleep(6600);
end;

--查看手机通讯录界面
function PageUtil.mobileFriendUI()
	runApp("com.tencent.mm","com.tencent.mm.ui.bindmobile.MobileFriendUI" ); --查看手机通讯录界面
	mSleep(10000); --此处加载手机联系人时间比较长
end;

--附近的人相关操作主页面
function PageUtil.nearbyFriendsIntroUI()
	runApp("com.tencent.mm","com.tencent.mm.plugin.nearby.ui.NearbyFriendsIntroUI") -- 附近的人相关操作;
	mSleep(2731);
end;

--附近的人列表界面
function PageUtil.nearbyFriendsUI()
	runApp("com.tencent.mm","com.tencent.mm.plugin.nearby.ui.NearbyFriendsUI" ) --附近的人列表界面
	mSleep(9035); --加载比较慢[和手机与网络有关]
end;

--微信首页
function PageUtil.mainPage()
	runApp("com.tencent.mm","com.tencent.mm.ui.LauncherUI");
	mSleep(1680);
end;

--朋友圈界面
function PageUtil.pageSnsTimeLine()
	runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.SnsTimeLineUI");
	mSleep(9310);
end;

function PageUtil.pageMy()
	-- 微信—我
	--if multiColor({{630, 1194, 0x46c01b },{90, 1228, 0x9a9a9a},{446, 1212, 0x999999}}) == true then--全部坐标点和颜色一致时返回 true，== true 可省略不写

		x, y = findImageInRegionFuzzy("zs_jt.png", 80, 22, 72,70,116, 0xffffff);

		if x ~= -1 and y ~= -1 then
			tap(x, y);
			mSleep(500);
		end;

		AppUtil.pressHomeKey();
		mSleep(500);
		AppUtil.run();

		tap(624, 1218);
	--end;
end;

--群发选择好友界面
function PageUtil.massSendSelectContact()
	runApp("com.tencent.mm","com.tencent.mm.plugin.masssend.ui.MassSendSelectContactUI");
	mSleep(3500);
end;

--扫码界面
function PageUtil.scan()
	runApp("com.tencent.mm","com.tencent.mm.plugin.scanner.ui.BaseScanUI");
	mSleep(4000);
end;

--功能界面
function PageUtil.settings()
	runApp("com.tencent.mm","com.tencent.mm.plugin.setting.ui.setting.SettingsPluginsUI");
	mSleep(2150);
end;

--添加好友界面
function PageUtil.searchFriends()
	runApp("com.tencent.mm","com.tencent.mm.plugin.subapp.ui.pluginapp.AddMoreFriendsUI"); --  添加好友界面
	mSleep(2881);
end;

--新的朋友
function PageUtil.newFriends()
	runApp("com.tencent.mm","com.tencent.mm.plugin.subapp.ui.friend.FMessageConversationUI" ); --新的朋友
	mSleep(2302);
end;

--[通讯录]-[群聊界面]
function PageUtil.GroupCardSelectUI()
	runApp("com.tencent.mm","com.tencent.mm.ui.contact.GroupCardSelectUI");
	mSleep(2100);
end;

--界面上滑动
function PageUtil.upMovePage()
	touchDown(10, 1154);
	for i = 1154, 1000, -5 do
		touchMove(10, i);
		--mSleep(150);        --延迟
	end
	touchUp(10, 1154);
end;

--滑倒最底端
function PageUtil.bmMovePage()
	touchDown(150, 1200);   
	mSleep(30);
	touchMove(150, 5);    
	mSleep(30);
	touchUp(150, 5);
end;

--返回操作
function PageUtil.back()

	x,y = findMultiColorInRegionFuzzy( 0xffffff, "20|-2|0xffffff,36|2|0x393a3f,60|-10|0x2e2e32", 90, 0, 0, 698, 140);
	if x ~= -1 and y ~= -1 then
		--点击左上角返回
		tap(Constants.upperleft_x, Constants.upperleft_y);
	end;
	mSleep(2500);
end;

return PageUtil;

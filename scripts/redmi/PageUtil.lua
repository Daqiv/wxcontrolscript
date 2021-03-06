require "TSLib"

--[[
if multiColor({{44, 96, 0xb0b0b2 },{530, 106, 0xfefefe},{652, 94, 0xffffff}}) == true then--全部坐标点和颜色一致时返回 true，== true 可省略不写
mSleep(50)
toast("找到颜色并点击")
mSleep(3000)
end
]]--

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
	-- 微信-通讯录
	--if multiColor({{68, 1202, 0x999999 },{264, 1218, 0x46c01b},{444, 1214, 0x999999}}) ~= true then

		x, y = findImageInRegionFuzzy("zs_jt.png", 80, 22, 72,70,116, 0xffffff);

		log("PageUtil.pageContact" .. "|x=" .. tostring(x) .. "|y=" .. tostring(y) );

		if x ~= -1 and y ~= -1 then
			tap(x, y);
			mSleep(500);
		else
			--tap(42, 92);
			--mSleep(500);
		end;

		AppUtil.pressHomeKey();
		mSleep(500);
		AppUtil.run();

		tap(264, 1218);
	--end;
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

-- 扫码界面
function PageUtil.scan()
	runApp("com.tencent.mm","com.tencent.mm.plugin.scanner.ui.BaseScanUI");
	mSleep(2000);
end;

return PageUtil;

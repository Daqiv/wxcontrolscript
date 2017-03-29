require "PageUtil";
require "FontAndImgFindUtil";

--附近的人相关操作
NearFriends = {}


--使用微X模块自动和附近的人打招呼
function NearFriends.auToSayToNearFriends(num)
    PageUtil.nearbyFriendsUI();
    --寻找微X模块[申请为好友]按钮
    x,y = findMultiColorInRegionFuzzy( 0xd8d8d9, "0|14|0xfbfbfb,10|14|0xcbcbcd,14|14|0xffffff,20|0|0x949497", 90, 430, 50, 610, 130);
    if x ~= -1 and y ~= -1 then
        tap(x, y);
        mSleep(2000);

        tap(100, 565); --输入框获取焦点
        mSleep(2600);
        inputText(num); --输入加多少好友
        mSleep(2000);
        --寻找[确定]按钮开始打招呼
        x,y = findMultiColorInRegionFuzzy( 0x000000, "-2|14|0x000000,8|24|0x000000,20|26|0x000000,12|0|0x020202", 90, 400, 854, 660, 1052);
        if x ~= -1 and y ~= -1 then
            tap(x, y);
            mSleep(4600);

            --寻找[取消]按钮关闭界面,后台执行打招呼操作
            x,y = findMultiColorInRegionFuzzy( 0x191919, "-4|20|0x191919,4|20|0x262626,12|22|0x191919,20|24|0x191919", 90, 100, 680, 260, 770);
            if x ~= -1 and y ~= -1 then
                tap(x, y);
                mSleep(3475);
            end;

        end;
        mSleep(3000);
        --返回到主界面
        PageUtil.back();
        

        --[[
        tap(350, 700); --点击打招呼语
        mSleep(1000);
        --寻找打招呼语右侧设置图标
        x,y = findMultiColorInRegionFuzzy( 0x757575, "0|12|0x757575,0|24|0x757575", 90, 450, 480, 664, 848);
        if x ~= -1 and y ~= -1 then
            tap(x, y);
            mSleep(1000);
            --点击全部删除
            tap(350, 600);
            mSleep(2600);
            --点击确定
            x,y = findMultiColorInRegionFuzzy( 0x040404, "-12|6|0x020202,12|6|0x000000,0|26|0x000000,10|28|0x000000", 90, 430, 740, 630, 840);
            if x ~= -1 and y ~= -1 then
                tap(x, y);
                mSleep(1500);
                --寻找打招呼语右侧设置图标
                x,y = findMultiColorInRegionFuzzy( 0x757575, "0|12|0x757575,0|24|0x757575", 90, 450, 480, 664, 848);
                if x ~= -1 and y ~= -1 then
                    tap(x, y);
                    mSleep(1700);
                    --寻找添加新回复语图标
                    x,y = findMultiColorInRegionFuzzy( 0x191919, "0|24|0x191919,22|18|0x949494,22|-2|0x191919,16|6|0x191919", 90, 260, 660, 510, 750);
                    if x ~= -1 and y ~= -1 then
                        tap(x, y);
                        mSleep(1800);
                        --设置打招呼内容
                        tap(120, 718);
                        mSleep(1000);
                        switchTSInputMethod(true);
                        --输入消息
                        mSleep(3000);
                        inputText(content);
                        switchTSInputMethod(false);
                        mSleep(3000);
                        tap(580, 630);
                        --寻找确定
                        x,y = findMultiColorInRegionFuzzy( 0x040404, "-12|6|0x020202,12|6|0x000000,0|26|0x000000,10|28|0x000000", 90, 430, 740, 630, 840);
                        if x ~= -1 and y ~= -1 then
                            tap(x, y);
                        end;
                    end;
                end;
            end;
        end;
        ]]--
    end;
end;

--和附近的人打招呼
function NearFriends.sayToNearFriends(num, content)
    --定位到附近的人列表页
    PageUtil.nearbyFriendsUI();

    xx = 550;
	yy = 200;
	page = 1;
	a = 0; --最多循环次数20

	num = tonumber(num); --和num个附近的人打招呼

	if num > 10 then
		num = 10;
	end;

	repeat

        if (a >= 20) then --最多循环次数20,防止死循环
            break;
        end;

		mSleep(1000);

		--如果到界面最下面,向下滑动
        if (yy > 1150) then
            yy = 1180;
            PageUtil.upMovePage();
            page = page + 1;
        end;

		mSleep(1000);

		if (page == 1) then
			tap(xx, yy); --点击附近好友
		else
			tap(xx, 1180);
		end;

        mSleep(1510);

--调试用
--tap(Constants.upperleft_x, Constants.upperleft_y); --点击左上返回

        --寻找屏幕中间位置打招呼按钮
        x, y = FontAndImgFindUtil.center_daZhaoHu();
        mSleep(1570);
        if (x ~= -1 and y ~= -1) then 
            log("NearFriends.sayToNearFriends" .. "|x=" .. tostring(x) .. "|y=" .. tostring(y) .. "|xx=" .. tostring(xx) .. "|yy=" .. tostring(yy));
            mSleep(1530);
            tap(x, y); --点击打招呼按钮
           
            mSleep(1000);
            switchTSInputMethod(true);
            --输入消息
            mSleep(3000);
            inputText(content);
            switchTSInputMethod(false);
            mSleep(3000);

            --点击右上角发送
            tap(Constants.upperright_x, Constants.upperright_y);
            mSleep(2000);
            tap(Constants.upperleft_x, Constants.upperleft_y); --点击左上返回
            mSleep(1000);               
            --调试用
            tap(Constants.upperleft_x, Constants.upperleft_y); --点击左上返回
        end;

        yy = yy + 130;

        if yy > 1180 then
            yy = 1180;
        end;   

        a = a + 1;

	until(false or (a >= num)); -- end repeat

	tap(Constants.upperleft_x, Constants.upperleft_y); --点击左上返回
	mSleep(1000);
	--返回微信首页
    PageUtil.mainPage();
end;

return NearFriends;
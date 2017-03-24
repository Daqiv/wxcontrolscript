require "PageUtil";
require "FontAndImgFindUtil";

--附近的人相关操作
NearFriends = {}

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
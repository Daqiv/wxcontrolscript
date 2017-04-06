
FontAndImgFindUtil = {}

--寻找屏幕中间打招呼按钮
function FontAndImgFindUtil.center_daZhaoHu()
    x,y = findMultiColorInRegionFuzzy(
        0x1aad19, "80|56|0x1aad19,176|16|0x1aad19,84|-14|0x1aad19", 90, 200, 730, 530, 1200);
    if x ~= -1 and y ~= -1 then
        return x, y;
    else
        return -1, -1;
    end;
end;

--寻找屏幕中间绿色按钮
function FontAndImgFindUtil.group_join()
    x,y = findMultiColorInRegionFuzzy( 0x04be02, "12|-4|0x04be02,-30|-4|0x04be02", 90, 115, 660, 580, 960);
    if x ~= -1 and y ~= -1 then
        return x, y;
    else
        return -1, -1;
    end;
end;


--寻找wxControl文件夹
function FontAndImgFindUtil.wxControlDir()
    x,y = findMultiColorInRegionFuzzy( 0x353535, "10|0|0x353535,26|-2|0x404040,52|-8|0x353535,98|-6|0x555555", 90, 180, 430, 430, 1160);
    if x ~= -1 and y ~= -1 then
        return x, y;
    else
        return -1, -1;
    end;
end;

--寻找腾讯新闻腾讯字
function FontAndImgFindUtil.qqNews()
	--x,y = findMultiColorInRegionFuzzy( 0xffd801, "14|2|0x00a4e3,28|-8|0x2fb046,20|16|0xe50a13", 90, 10, 400, 120, 710);
    x,y = findMultiColorInRegionFuzzy( 0x353535, "10|0|0x353535,16|0|0x353535,24|4|0x353535,34|0|0xadadad", 90, 10, 400, 300, 740)
    if x ~= -1 and y ~= -1 then
        return x, y;
    else
        return -1, -1;
    end;
end;

--朋友圈界面
function FontAndImgFindUtil.isMoments()
    x,y = findMultiColorInRegionFuzzy( 0xffffff, "-2|26|0xffffff,14|14|0xffffff,22|28|0xfafafa,44|-2|0xe8e8e8", 90, 70, 50, 250, 170);
    if x ~= -1 and y ~= -1 then
        return x, y;
    else
        return -1, -1;
    end;
end;

--判断是否是朋友圈最底部
function FontAndImgFindUtil.isMomentsBottom()
    --x,y = findMultiColorInRegionFuzzy( 0xdbdbdb, "-10|0|0xf8f8f8", 90, 320, 1150, 375, 1190);

    x,y = findMultiColorInRegionFuzzy( 0xdadada, "-4|0|0xf2f2f2,6|0|0xf8f8f8", 100, 320, 850, 375, 1290);
    if x ~= -1 and y ~= -1 then
        return x, y;
    else
        return -1, -1;
    end;

end;

--群扫码后保存到通讯录
function FontAndImgFindUtil.bcdtxl()
    x, y = findImageInRegionFuzzy("bcdtxl.png", 80, 10, 170, 250, 600, 0xffffff);

    if x ~= -1 and y ~= -1 then
        tap(650, y);
        mSleep(1500);
    end;
    mSleep(1000);
end;

--判断是不是朋友圈第一次发图文
function FontAndImgFindUtil.snsFirst()
    
    x, y = findImageInRegionFuzzy("snsFirst.png", 80, 400, 780, 620, 960, 0xffffff);

    if x ~= -1 and y ~= -1 then
        tap(x, y);
        mSleep(1500);
    end;
    mSleep(1000);
end;

--判断是不是朋友圈第一次发文字
function FontAndImgFindUtil.snsFontFirst()
    x, y = findMultiColorInRegionFuzzy( 0x1aad19, "88|62|0x1aad19,174|0|0x1aad19", 90, 180, 1050, 510, 1220);
    if x ~= -1 and y ~= -1 then
        tap(x, y);
        mSleep(1500);
    end;
    mSleep(1000);
end;

--判断手机联系人添加好友页面(绑定手机号,上传通讯录界面)
function FontAndImgFindUtil.bindMobile()
    --寻找[上传通讯录]按钮
    x, y = findMultiColorInRegionFuzzy( 0x1aad19, "94|58|0x1aad19,212|4|0x1aad19", 90, 110, 740, 510, 1040);
    if x ~= -1 and y ~= -1 then
        tap(x, y);
        mSleep(1500);
        --寻找点击[上传通讯录]按钮后弹出界面的[是]按钮
        x,y = findMultiColorInRegionFuzzy( 0x1aad19, "0|12|0x1aad19,16|14|0xc2e9c2", 90, 470, 730, 600, 840);
        if x ~= -1 and y ~= -1 then
            tap(x, y);
            mSleep(5000);

            x, y = findMultiColorInRegionFuzzy( 0x1aad19, "94|58|0x1aad19,212|4|0x1aad19", 90, 110, 740, 510, 1040);
            if x ~= -1 and y ~= -1 then
                tap(x, y);
                mSleep(4500);                
            end;
        end;

    end;
    mSleep(1000);
end;

--通讯录当前坐标是否有好友
function FontAndImgFindUtil.contactNoFriends(x, y)
    
end;

--判断是否是已添加图片
function FontAndImgFindUtil.contactYiTianJia(xx, yy)
    x, y = findImageInRegionFuzzy("yitianjia.png", 80, xx, yy - 60, xx + 110, yy + 60, 0xffffff);
    return x, y;
end;

--判断是否是是腾讯新闻界面
function FontAndImgFindUtil.isNewsPage()
    x, y = findImageInRegionFuzzy("qqnews.png", 80, 70, 50, 285, 135, 0xffffff);
    return x, y;
end;

return FontAndImgFindUtil;
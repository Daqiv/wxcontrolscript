require "PageUtil";
require "AppUtil";

Shake = {}

function Shake.addFriends(num,content)
    --启动摇一摇应用
    AppUtil.runShake();
    --摇一摇界面
    PageUtil.ShakeReportUI();    
    
    a = 1;

    num = tonumber(num); --摇一摇个数

    if num >= 10 then
        num = 10;
    end;

    while (a <= num)
    do
        --寻找摇一摇按钮
        x,y = findMultiColorInRegionFuzzy( 0x9ea4b5, "-2|-8|0x9ea4b5,-16|-20|0x989dad,28|28|0x9196a5", 90, 550, 750, 719, 1279);
        --x,y = findColorInRegionFuzzy( 0xd5d8dd, 90, 550, 750, 719, 1279);
        if x ~= -1 and y ~= -1 then
            mSleep(1200);
            tap(x, y);
            mSleep(9500); --和网络有关,适当延长时间

            --寻找好友
            x,y = findColorInRegionFuzzy( 0xa1a1a1, 90, 200, 850, 560, 1050);
            if x ~= -1 and y ~= -1 then
                tap(x, y);
                mSleep(3000);
                --寻找打招呼按钮
                x,y = findColorInRegionFuzzy( 0x1aad19, 90, 50, 770, 550, 1090);
                if x ~= -1 and y ~= -1 then
                    tap(x, y);
                    mSleep(2000);
                    inputText(content); --输入招呼语
                    mSleep(3000);
                    
                    tap(Constants.upperright_x, Constants.upperright_y); --点击完成
                    a = a + 1;
                    mSleep(3000);
                    PageUtil.back();
                    PageUtil.back();
                end;
            end;
        else 
        end;
    end;
    AppUtil.closeShake();
    PageUtil.back();
end;

return Shake;

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

return FontAndImgFindUtil;
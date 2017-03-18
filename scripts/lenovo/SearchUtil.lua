x, y = findImageInRegionFuzzy("jt.png", 90, 562, 1014, 7120, 1258, 0xffffff);
if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件
    touchDown(x, y);            --那么单击该图片
    mSleep(30);
    touchUp(x, y);
else                               --如果找不到符合条件的图片
    dialog("未找到符合条件的坐标！",0);
end

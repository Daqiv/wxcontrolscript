require "PageUtil";
require "FontAndImgFindUtil";

Group = {}

--群扫码
function Group.AddGroupByScan(num)

	num = tonumber(num); --群扫码个数

    if num >= 9 then
        num = 9;
    end;

	img_x = 120; --第一行第一列图片X坐标
	img_y = 260; --第一行第一列图片X坐标

	for i=0, (num-1), 1 do

		PageUtil.scan(); --打开扫码界面

		tap(Constants.upperright_x, Constants.upperright_y); --扫码界面右上角

		mSleep(2000);

		tap(Constants.bottomleft_x, Constants.bottomleft_y); --[从相册选取二维码]

		mSleep(15000); --加载图片比较慢(与手机性能有关)

		tap(Constants.bottomleft_x, Constants.bottomleft_y); --[从相册选取二维码]-[所有图片]

		mSleep(3000);

		--点击选择程序自建文件夹(wxControl)
		--tap(Constants.moments_xj_zp_zdy_x, Constants.moments_xj_zp_zdy_y); --点击选择程序自建文件夹(wxControl)
		x, y = FontAndImgFindUtil.wxControlDir();
		if x ~= -1 and y ~= -1 then
			tap(x, y);
			mSleep(2000);
					
			if (i / 3) + 1 == 1 then
				img_y = 260;
			elseif (i / 3) + 1 == 2 then
				img_y = 500;
			elseif (i / 3) + 1 == 3 then
				img_y = 740;
			end;

			if (i % 3) + 1 == 1 then
				img_x = 120;
			elseif (i % 3) + 1 == 2 then
				img_x = 360;
			elseif (i % 3) + 1 == 3 then
				img_x = 600;
			end;

			tap(img_x, img_y); --选择照片
			
			mSleep(6000);

			--寻找加群绿色按钮
			x,y = FontAndImgFindUtil.group_join();
			if x ~= -1 and y ~= -1 then --如果有绿色按钮为第一次加群,没有绿色按钮为重复扫码加群
				tap(x, y);
				mSleep(6000);
				--以下代码把本次加的群保存到通讯录里
				tap(Constants.upperright_x, Constants.upperright_y);
				mSleep(3000);
				PageUtil.bmMovePage();
				mSleep(1500);
				--保存到通讯录
				FontAndImgFindUtil.bcdtxl();
			end;
			mSleep(1200);
			PageUtil.back();
			PageUtil.back();

			log("Group.AddGroupByScan" .. "|img_x=" .. img_x .. "|img_y=" .. img_y);

		end;
	end;
end;


return Group;

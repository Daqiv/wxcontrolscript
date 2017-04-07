require "PageUtil";
require "AppUtil";

TongXunLu = {}

function TongXunLu.sendMsgTofriend()

	xx = 538;

	yy = 240;

	f = 1;

	PageUtil.pageContact();

	repeat


		x, y = findImageInRegionFuzzy("tongxunlu_a.png", 80, 684, 224,706,256, 0xffffff);

		if x ~= -1 and y ~= -1 then

			log("TongXunLu.sendMsgTofriend" .. "|x=" .. tostring(x) .. "|y=" .. tostring(y) .. "|xx=" .. tostring(xx) .. "|yy=" .. tostring(yy));

			--判断是否是第一次,是第一次点击右上角A,使屏幕到最上面
			if (f == 1) then

				tap(x, y);

				f = f + 1;
			end;
			--切换下一屏
			if (yy > 1065) then

				yy = 240;

				touchDown(230,1125);

				for i = 1125, 80, -10 do
					touchMove(230, i);
					mSleep(150);        --延迟
				end

				touchUp(230,1025);

			end;

			mSleep(1000);

			if (isColor( 430,  yy, 0xffffff, 95)) then --如果是通讯录好友(识别并排除通讯录好友间的灰色条状)

				mSleep(1000);

				tap(xx, yy);

				mSleep(1000);

				--tap(58, 92);

				--寻找发消息按钮
				x2, y2 = findImageInRegionFuzzy("tongxunlu_fxx.png", 80, 300, 950,416,1078, 0xffffff);
				if x2 ~= -1 and y2 ~= -1 then
					mSleep(2000);
					tap(x2, y2); --点击发消息按钮
					mSleep(2000);

					tap(346, 1258); --点击屏幕最下输入消息栏，使其获取焦点
					--输入消息


					mSleep(1000);
					tap(58, 92); --点击左上返回
					mSleep(1000);
					tap(262, 1220); --点击通讯录
					mSleep(1000);
				else --微信团队不发送
					tap(58, 92); --点击左上返回
					mSleep(1000);
				end;

			end;


			yy = yy + 80;
		end;

		-- 判断是不是通讯录最下面,根据是否有联系人图识别
		x, y = findImageInRegionFuzzy("tongxunlu_lxr.png", 80, 300, 1090,452,1138, 0xffffff);

	until((x ~= -1 and y ~= -1) and isColor( 514,  yy, 0xebebeb, 95) and yy > 1065); -- end repeat
	--until(yy > 1065); -- repeat
	
end;

--好友群发
function TongXunLu.sendMsgToAllfriends(content)
	--群发选择收信人界面
	PageUtil.massSendSelectContact();
	--寻找[全选]按钮
	x,y = findMultiColorInRegionFuzzy( 0x3d3d3d, "-8|8|0x363636,12|10|0x6c6c6c,0|22|0x353535", 90, 500, 160, 710, 330);

	if x ~= -1 and y ~= -1 then
		tap(x, y);
		mSleep(4500);
		--点击右上下一步按钮
		tap(Constants.upperright_x, Constants.upperright_y);
		mSleep(2500);
		inputText(content); --输入内容
		mSleep(2500);
		tap(Constants.bottomright_x, Constants.bottomright_y); --发送消息
		mSleep(7760);
		PageUtil.back();
	end;
end;

--群聊发消息
function TongXunLu.sendMsgToGroup(num, content, stype)

	xx = 550;

	--yy = 190;
	yy = 240;

	page = 1;

	a = 0;

	num = tonumber(num); --给num个群发消息

	if num > 50 then
		num = 50;
	end;

	repeat

		--PageUtil.GroupCardSelectUI();
		PageUtil.pageContact();

		mSleep(4000);

		--如果检测到没有群、退出循环
		--x,y = findMultiColorInRegionFuzzy( 0xffffff, "22|14|0xffffff,8|36|0xffffff,40|46|0xffffff", 90, 35, yy, 90, yy + 50);
		x, y = findImageInRegionFuzzy("gequnliao.png", 90, 280, yy-50, 440, yy+50, 0xffffff);
		--if (isColor( 550,  1220, 0xebebeb, 95)) then
		if x ~= -1 and y ~= -1 then
			log("TongXunLu.sendMsgToGroup no group" .. "|x=" .. x .. "|y=" .. y .. "|yy=" .. yy .. "|yy+50=" .. (yy+50));
			break;
		end;

		mSleep(1000);

		--切换下一屏
		if (yy > 1150) then

			yy = 1180;

			touchDown(xx,1150);

			for i = 1150, (1150 - page * 100), -10 do
				touchMove(xx, i);
				mSleep(150);        --延迟
			end

			touchUp(xx,1150);

			page = page + 1;

		end;

		mSleep(1000);
	
		if (page == 1) then
			tap(xx, yy); --点击进入群
		else
			tap(xx, 1180);
		end;

		mSleep(2300);
	
		if stype == 1 then --发文字
			mSleep(1000);
			switchTSInputMethod(true);
			mSleep(2000);


			tap(346, 1258); --点击屏幕最下输入消息栏，使其获取焦点
			--输入消息
			mSleep(3000);
			--message = os.date("%Y-%m-%d %H:%M:%S", os.time());
			inputText(content);

			switchTSInputMethod(false);
			mSleep(3000);

			--寻找发送按钮
			x,y = findMultiColorInRegionFuzzy( 0x1aad19, "60|38|0x1aad19,24|44|0x1aad19", 90, 560, 630, 710, 1266);
			if x ~= -1 and y ~= -1 then
				tap(x, y); --发送消息
				a = a + 1;
			end;
		elseif stype == 2 then --发图片
			mSleep(1000);
			tap(Constants.bottomright_x, Constants.bottomright_y); --点击右下+
			mSleep(2100);
			--寻找图片图标
			x,y = findMultiColorInRegionFuzzy( 0x7c8186, "18|14|0x7c8186,42|18|0x7c8186,52|-2|0x7c8186", 90, 20, 780, 190, 970);			
			if x ~= -1 and y ~= -1 then
				tap(x, y); --点击相册

				mSleep(5000);

				tap(Constants.bottomleft_x, Constants.bottomleft_y); --点击左下角[图片和视频]

				mSleep(2000);

				--寻找wxControl文件夹
				x,y = findMultiColorInRegionFuzzy( 0x353535, "10|0|0x353535,26|-2|0x404040,52|-8|0x353535,98|-6|0x555555", 90, 180, 430, 430, 1160);
				if x ~= -1 and y ~= -1 then
					tap(x, y);
					mSleep(3000);

					tap(Constants.moments_xj_zp_1_1_x, Constants.moments_xj_zp_1_1_y); --选择第1行第1张照片
					mSleep(500);
					tap(Constants.moments_xj_zp_1_2_x, Constants.moments_xj_zp_1_2_y); --选择第1行第2张照片
					mSleep(500);
					tap(Constants.moments_xj_zp_1_3_x, Constants.moments_xj_zp_1_3_y); --选择第1行第3张照片
					mSleep(500);
					tap(Constants.moments_xj_zp_2_1_x, Constants.moments_xj_zp_2_1_y); --选择第2行第1张照片
					mSleep(500);
					tap(Constants.moments_xj_zp_2_2_x, Constants.moments_xj_zp_2_2_y); --选择第2行第2张照片
					mSleep(500);
					tap(Constants.moments_xj_zp_2_3_x, Constants.moments_xj_zp_2_3_y); --选择第2行第3张照片
					mSleep(500);
					tap(Constants.moments_xj_zp_3_1_x, Constants.moments_xj_zp_3_1_y); --选择第3行第1张照片
					mSleep(500);
					tap(Constants.moments_xj_zp_3_2_x, Constants.moments_xj_zp_3_2_y); --选择第3行第2张照片
					mSleep(500);
					tap(Constants.moments_xj_zp_3_3_x, Constants.moments_xj_zp_3_3_y); --选择第3行第3张照片

					mSleep(1000);

					tap(Constants.moments_xj_zp_complete_x, Constants.moments_xj_zp_complete_y); --点击完成

					mSleep(5000);
				end;
			end;

		end;

		mSleep(1000);
		tap(58, 92); --点击左上返回
		mSleep(1000);

--[[
		mSleep(1000);
		tap(662, 698); --发送消息
		mSleep(500);

		tap(58, 92); --点击左上返回
		mSleep(1000);
		tap(262, 1220); --点击通讯录
		mSleep(2000);
		--250,250
]]--
		yy = yy + 100;

		if yy > 1180 then
			yy = 1180;
		end;


		-- 判断是不是通讯录最下面,根据是否有"X个群聊"图识别
		--x, y = findImageInRegionFuzzy("tongxunlu_ql.png", 80, 324, 1182,448,1264, 0xffffff);

		log(">>>>>>  " .. "|xx=" .. tostring(xx) .. "|yy=" .. tostring(yy));
--		if (page > 1) then
--			mSleep(5000);
--		end;

	until((a >= num)); -- end repeat

	tap(Constants.upperleft_x, Constants.upperleft_y); --点击左上返回
	mSleep(1000);
	--返回微信首页
    PageUtil.mainPage();
end;


return TongXunLu;

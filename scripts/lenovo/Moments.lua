require "PageUtil";
require "Constants";

Moments = {}
--[[
发朋友圈
stype:1--文字
stype:2--照片
stype:3--小视频
]]--
function Moments.send(stype,content)

	PageUtil.pageSnsTimeLine(); --定位到朋友圈界面

	if 1 == stype then
		touchDown(Constants.moments_ul_xj_x , Constants.moments_ul_xj_y); --左上角相机
		mSleep(3000); --长按相机发文字
		touchUp(Constants.moments_ul_xj_x , Constants.moments_ul_xj_y);
		mSleep(1000);
		tap(40, 190); --获取焦点
		mSleep(1000);
		switchTSInputMethod(true);
		mSleep(2000);
		inputText(content); --输入内容
		mSleep(3000);
		switchTSInputMethod(false);
		mSleep(1000);
		tap(Constants.upperright_x, Constants.upperright_y); --右上角
		mSleep(5000);
		tap(Constants.upperleft_x, Constants.upperleft_y) --左上角返回

	elseif 2 == stype then

		tap(Constants.moments_ul_xj_x , Constants.moments_ul_xj_y); --左上角相机

		mSleep(2000);

		--tap(Constants.moments_xj_zp_x, Constants.moments_xj_zp_y); -- 照片
		tap(Constants.moments_xj_zp_x, Constants.moments_xj_zp_y); -- 相册(此处显示可能和手机或微信版本有关)

		mSleep(7000);

		tap(Constants.bottomleft_x, Constants.bottomleft_y); --点击左下角[图片和视频]

		mSleep(2000);

		tap(Constants.moments_xj_zp_zdy_x, Constants.moments_xj_zp_zdy_y); --点击选择程序自建文件夹(wxControl)

		mSleep(2000);

		--200,170 440,170 680,170
		--200,420 440,420 680,420
		--200,660 440,660 680,660
		--tap(Constants.moments_xj_zp_one_x, Constants.moments_xj_zp_one_y); --选择第一张照片

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

		mSleep(2000);

		--输入内容
		tap(50, 180);
		mSleep(2000);
		--switchTSInputMethod(true);
		inputText(content);
		--switchTSInputMethod(false);
		mSleep(1000);
		tap(Constants.moments_xj_zp_complete_x, Constants.moments_xj_zp_complete_y); --点击完成
		mSleep(3000);
		--点击左上角返回
		tap(Constants.upperleft_x, Constants.upperleft_y);

	elseif 3 == stype then

		tap(Constants.moments_ul_xj_x , Constants.moments_ul_xj_y); --左上角相机

		mSleep(1000);

		tap(Constants.moments_xj_xsp_x, Constants.moments_xj_xsp_y); -- 小视频

		mSleep(1000);

	else

	end;

end;

--[[
********朋友圈点赞********
]]--
function Moments.dianZan()

	PageUtil.pageSnsTimeLine(); --定位到朋友圈界面

	-- 连续滑动
	b=0;
	a=0;
	h=0;

	repeat

		touchDown(10, 800);

		for i = 800, 10, -3 do   --使用for循环从起始点连续纵向移动

			touchMove(10, i);

			--mSleep(50);        --延迟
			b = i;
			--寻找右下角箭头图标
			x, y = findImageInRegionFuzzy("jt.png", 80, 640, 1224, 704, 1266, 0xffffff);
			if x ~= -1 and y ~= -1 then

				tap(x, y);

			--if multiColor({{658, 1154, 0x8593b0 },{670, 1154, 0xf8f8f8},{684, 1154, 0xf8f8f8}}) == true then

				--tap(684,1154); --打开点赞
				--mSleep(50);
				mSleep(1000);

				--判断是否点过赞
				x, y = findImageInRegionFuzzy("quxiao.png", 80, 330, 1216, 398, 1278, 0xffffff);
				if x ~= -1 and y ~= -1 then

				--if multiColor({{292, 1074, 0xffffff},{320, 1076, 0xffffff},{382, 1070, 0x7e7f82},{374, 1084, 0xffffff}}) == true then
					--dialog("22222222");
					touchDown(684,1154);
					touchMove(684,1120);
					touchUp(684,1120);
					break;
				end;

				mSleep(1000);

				-- 寻找赞图片
				x, y = findImageInRegionFuzzy("zan.png", 80, 344, 1218, 392, 1266, 0xffffff);
				if x ~= -1 and y ~= -1 then

				--if multiColor({{306, 1144, 0xffffff },{322, 1146, 0x393a3f},{338, 1144, 0xffffff},{356, 1142, 0xc6c6c8}}) == true or
					--multiColor({{  308, 1142, 0xf9f9f9},{  360, 1146, 0xfafafa},{  486, 1146, 0xffffff}}) == true then
						--dialog("306");
						tap(x, y);
						mSleep(3000);
						--tap(306,1144);

						if (a < 4) then
							a = a + 1;
						else
							tap(42, 92); --点击左上角箭头返回
							mSleep(500);
							return;
						end;

				end;

				touchDown(684,1154);
				touchMove(684,1120);
				touchUp(684,1120);

				break;

			end;

		end;
		--touchUp(55, 1110);
		touchUp(10,800);

	until(a>5);

end;

--[[
********朋友圈评论********
]]--
function Moments.pingLun()

	PageUtil.pageSnsTimeLine(); --定位到朋友圈界面

	-- 连续滑动
	b=0;
	a=0;
	h=0;

	repeat

		touchDown(10, 800);

		for i = 800, 10, -5 do   --使用for循环从起始点连续纵向移动
			touchMove(10, i);
			mSleep(150);        --延迟
			b = i;
			--寻找右下角箭头图标
			x, y = findImageInRegionFuzzy("jt.png", 80, 640, 1224, 704, 1266, 0xffffff);
			if x ~= -1 and y ~= -1 then

				tap(x, y);
				mSleep(1000);

				-- 寻找评论图标
				x, y = findImageInRegionFuzzy("moment_pinglun.png", 80, 524, 1212, 584, 1270, 0xffffff);
				if x ~= -1 and y ~= -1 then
					tap(x, y); --点击评论
					mSleep(3000);

					inputText("nice !!!");
					mSleep(3000);
				end;
				--touchDown(684,1154);
				--touchMove(684,1120);
				--touchUp(684,1120);

				break;

			end;

		end;
		touchUp(10, 800);
		a = a + 1;
	until(a>5);
end;

return Moments;

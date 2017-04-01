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

	x,y = FontAndImgFindUtil.isMoments(); --判断当前界面是不是朋友圈界面
	if x == -1 and y == -1 then --如果不是朋友圈界面
		return; --返回
	end;

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

		--tap(Constants.moments_xj_zp_zdy_x, Constants.moments_xj_zp_zdy_y); --点击选择程序自建文件夹(wxControl)
		--寻找wxControl文件夹
		x,y = findMultiColorInRegionFuzzy( 0x353535, "10|0|0x353535,26|-2|0x404040,52|-8|0x353535,98|-6|0x555555", 90, 180, 430, 430, 1160);
		if x ~= -1 and y ~= -1 then
			tap(x, y);
			mSleep(3000);

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

			mSleep(5000);

			--输入内容
			tap(50, 180);
			mSleep(2000);
			--switchTSInputMethod(true);
			inputText(content);
			--switchTSInputMethod(false);
			mSleep(1000);
			tap(Constants.moments_xj_zp_complete_x, Constants.moments_xj_zp_complete_y); --点击完成
			mSleep(5000);
			--点击左上角返回
			tap(Constants.upperleft_x, Constants.upperleft_y);
		end;

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
function Moments.dianZan(num)

	PageUtil.pageSnsTimeLine(); --定位到朋友圈界面

	x,y = FontAndImgFindUtil.isMoments(); --判断当前界面是不是朋友圈界面

	dFlag = false; --标识是否是底部

	if x == -1 and y == -1 then --不是朋友圈界面
		return;
	else --是朋友圈界面

		if num == nil or num == 0 then
			num = 1;
		end;

		num = tonumber(num);

		a=0; --累计点赞次数（最多为参数传入的num次）
		cnt=0; --累计滑动寻找需要点赞次数(最多10次)

		-- 连续滑动
		repeat

			touchDown(10, 800);

			for i = 800, 10, -3 do   --使用for循环从起始点连续纵向移动

				touchMove(10, i);
				--mSleep(50);        --延迟

				--寻找右下角箭头图标
				--jt_x, jt_y = findImageInRegionFuzzy("jt.png", 80, 640, 1224, 704, 1266, 0xffffff);
				jt_x,jt_y = findMultiColorInRegionFuzzy( 0x8593b0, "10|-2|0xdbdfe6,16|2|0xd4d8e1,30|2|0xf8f8f8,36|12|0x8593b0", 90, 640, 1160, 698, 1266)

				if jt_x ~= -1 and jt_y ~= -1 then

					tap(jt_x, jt_y);

				--if multiColor({{658, 1154, 0x8593b0 },{670, 1154, 0xf8f8f8},{684, 1154, 0xf8f8f8}}) == true then

					--tap(684,1154); --打开点赞
					--mSleep(50);
					mSleep(1000);

					--判断是否点过赞
					--x, y = findImageInRegionFuzzy("quxiao.png", 80, 330, 1216, 398, 1278, 0xffffff);
					x,y = findMultiColorInRegionFuzzy( 0xffffff, "12|28|0xffffff,26|2|0xffffff,92|14|0xffffff,106|6|0x393a3f", 90, 290, 1160, 430, 1268);
					log("Moments.dianZan" .. "|two -" .. "x=" .. x .. "|y=" .. y );
					if x ~= -1 and y ~= -1 then
						log("Moments.dianZan" .. "|点过赞=" .. "x=" .. x .. "|y=" .. y );
					--if multiColor({{292, 1074, 0xffffff},{320, 1076, 0xffffff},{382, 1070, 0x7e7f82},{374, 1084, 0xffffff}}) == true then
						--dialog("22222222");
						--touchDown(684,1154);
						--touchMove(684,1120);
						--touchUp(684,1120);
						tap(jt_x, jt_y);
						
						PageUtil.upMovePage();

						break;
					end;

					mSleep(1000);

					-- 寻找赞图片
					--x, y = findImageInRegionFuzzy("zan.png", 80, 344, 1218, 392, 1266, 0xffffff);
					--x,y = findMultiColorInRegionFuzzy( 0xffffff, "42|6|0xb4b4b6,58|6|0xffffff,62|24|0xffffff", 90, 290, 1160, 430, 1268);
					--x2,y2 = findMultiColorInRegionFuzzy( 0x2e2e32, "16|14|0x393a3f,-22|14|0x393a3f", 90, 390, 1160, 470, 1266);
					x,y = findMultiColorInRegionFuzzy( 0xffffff, "-2|10|0xffffff,2|16|0xd9dadb,6|20|0xd9dadb,12|24|0xf2f2f3,18|22|0xffffff,28|10|0xcececf,28|4|0xffffff,44|4|0xffffff,56|12|0xffffff", 90, 290, 1160, 430, 1268);
					log("Moments.dianZan" .. "|three -" .. "x=" .. x .. "|y=" .. y );
					if (x ~= -1 and y ~= -1) and (x2 ~= -1 and y2 ~= -1) then
						--log("Moments.dianZan" .. "|寻找点赞图片=" .. "x=" .. x .. "|y=" .. y .. "|x2=" .. x2 .. "|y2=" .. y2 );
						log("Moments.dianZan" .. "|寻找点赞图片=" .. "x=" .. x .. "|y=" .. y);
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
					
					--touchDown(684,1154);
					--touchMove(684,1120);
					--touchUp(684,1120);
					
					tap(jt_x, jt_y);

					cnt = cnt + 1;

					PageUtil.upMovePage(); --向上滑动

					break;
				else

					--判断是不是朋友圈最底部，最底部return
					x,y = FontAndImgFindUtil.isMomentsBottom();
					if x ~= -1 and y ~= -1 then
						dFlag = true;
						break;
					end;
				end;

			end;
			--touchUp(55, 1110);
			touchUp(10,800);

		until((a >= num) or (cnt == 10) or (dFlag == true));

		--置顶朋友圈
		tap(170, 90);
		tap(170, 90);
		mSleep(3000);

		--点击左上角返回
		PageUtil.back();
	end;
end;

--[[
********朋友圈评论[评论最新的前num条朋友圈消息]********
]]--
function Moments.pingLun(num, content)

	log("Moments.pingLun" .. "|num=" .. num .. "|content=" .. content);

	PageUtil.pageSnsTimeLine(); --定位到朋友圈界面

	x,y = FontAndImgFindUtil.isMoments(); --判断当前界面是不是朋友圈界面
	if x == -1 and y == -1 then --如果不是朋友圈界面
		return; --返回
	end;

	dFlag = false; --标识是否是底部

	num = tonumber(num); --评论个数

	-- 连续滑动
	a=0;

	repeat

		touchDown(10, 800);

		for i = 800, 10, -5 do   --使用for循环从起始点连续纵向移动
			touchMove(10, i);
			
			--寻找右下角箭头图标
			--x, y = findImageInRegionFuzzy("jt.png", 80, 640, 1224, 704, 1266, 0xffffff);
			jt_x,jt_y = findMultiColorInRegionFuzzy( 0x8593b0, "10|-2|0xdbdfe6,16|2|0xd4d8e1,30|2|0xf8f8f8,36|12|0x8593b0", 90, 640, 1160, 698, 1266);
			if jt_x ~= -1 and jt_y ~= -1 then

				tap(jt_x, jt_y);
				mSleep(1000);

				-- 寻找评论图标
				--x, y = findImageInRegionFuzzy("moment_pinglun.png", 80, 524, 1212, 584, 1270, 0xffffff);
				x,y = findMultiColorInRegionFuzzy( 0xffffff, "14|8|0x393a3f,34|12|0xffffff,50|10|0xffffff,82|22|0x3c3d42", 90, 450, 1160, 698, 1266);
				if x ~= -1 and y ~= -1 then
					tap(x, y); --点击评论
					mSleep(5000);
					inputText(content);
					mSleep(3000);
				end;
				--touchDown(684,1154);
				--touchMove(684,1120);
				--touchUp(684,1120);
				-- 寻找完成按钮
				x,y = findMultiColorInRegionFuzzy( 0x1aad19, "24|20|0xffffff,58|16|0x41bb40", 90, 570, 60, 698, 1266); 
				if x ~= -1 and y ~= -1 then
					tap(x, y); --点击完成按钮
					a = a + 1;
				end;

				break;
			else
				--判断是不是朋友圈最底部，最底部
				x,y = FontAndImgFindUtil.isMomentsBottom();
				if x ~= -1 and y ~= -1 then
					dFlag = true;
					break;
				end;

			end;

		end;
		touchUp(10, 800);
		
	until((a >= num) or (dFlag == true));

	--置顶朋友圈
	tap(170, 90);
	tap(170, 90);
	mSleep(3000);

	--点击左上角返回
	PageUtil.back();
end;

return Moments;

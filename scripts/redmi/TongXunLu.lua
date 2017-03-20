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

--群聊发消息
function  TongXunLu.sendMsgToGroup()

--[[
	if (isColor( 550,  1260, 0xebebeb, 95)) then
		dialog("43rt43t");
	end;
]]--

	PageUtil.pageContact();


	xx = 550;

	yy = 250;

	page = 1;

	repeat

		x, y = findImageInRegionFuzzy("tongxunlu_qunliao.png", 80, 28, 162,236,550, 0xffffff);

		if x ~= -1 and y ~= -1 then

			log("TongXunLu.sendMsgToGroup" .. "|x=" .. tostring(x) .. "|y=" .. tostring(y) .. "|xx=" .. tostring(xx) .. "|yy=" .. tostring(yy) .. "|page=" .. tostring(page));

			tap(x, y); --点击通讯录页面群聊

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
			--如何检测到没有群、退出循环
			if (isColor( 550,  1220, 0xebebeb, 95)) then
				break;
			end;


			if (page == 1) then
				tap(xx, yy); --点击进入群
			else
				tap(xx, 1180);
			end;
			mSleep(1000);

			switchTSInputMethod(true);
			mSleep(1000);


			tap(346, 1258); --点击屏幕最下输入消息栏，使其获取焦点
			--输入消息
			mSleep(2000);
			message = os.date("%Y-%m-%d %H:%M:%S", os.time());
			--message = "<div><div class='wxbj.cn'><section style='margin: 1em auto; text-align:center;'><section style='border-top-width: 1px; border-top-style: solid; border-color: rgb(33, 33, 33); color: rgb(97, 97, 97); line-height: 1.4; display: inline-block; padding: 0px 16px;'><span style='margin: -1px auto 10px; width: 0px; height: 0px; border-left-width: 10px; border-left-style: solid; border-left-color: transparent; border-right-width: 10px; border-right-style: solid; border-right-color: transparent; display: block; border-top-width: 8px; border-top-style: solid; border-top-color: #E50065;' class='wxqq-borderTopColor'></span><section><p style='text-align: center;'><span style='color: #0C0C0C;'>测试</span></p></section></section></section></div></div><p><br/></p><div><section label='Copyright © 2015 wxbj.cn All Rights Reserved.' style='font-size:14px;font-family:&#39;Microsoft YaHei&#39;;margin: 5px auto;white-space: normal;'><section class='wxqq-borderTopColor wxqq-borderBottomColor' style='line-height: 10px; color: inherit; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(255, 29, 107); border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(255, 29, 107); margin-top: 10px;'><section style='font-size:40px;color:inherit;height:8px;margin-left:35%;width:65%;background-color:#fefefe;margin-top:-1px'><span class='wxqq-color' style='color: rgb(255, 29, 107);'>“</span></section><section data-style='text-align: justify;' style='line-height:30px;color:#3e3e3e;font-size:14px;margin:15px 15px 20px;text-indent:2em'><p style='text-align:justify'>在这里输入你的内容，注意不要用退格键把所有文字删除，请保留一个或者用鼠标选取后直接输入，防止格式错乱。</p></section><section style='font-size:40px;background-color:#fefefe;color:inherit;text-align:right;height:10px;margin:0 0 -8px 0;width:65%'><span class='wxqq-color' style='color: rgb(255, 29, 107);'>”</span></section></section></section></div><p><br/></p><p><br/></p>";
			inputText(message);

			switchTSInputMethod(false);
			mSleep(1000);


			mSleep(1000);
			tap(662, 698); --发送消息
			mSleep(500);

			tap(58, 92); --点击左上返回
			mSleep(1000);
			tap(262, 1220); --点击通讯录
			mSleep(2000);
			--250,250

			yy = yy + 100;

		end;

		-- 判断是不是通讯录最下面,根据是否有"X个群聊"图识别
		--x, y = findImageInRegionFuzzy("tongxunlu_ql.png", 80, 324, 1182,448,1264, 0xffffff);

		--log(">>>>>>  " .. "|x=" .. tostring(x) .. "|y=" .. tostring(y));
--		if (page > 1) then
--			mSleep(5000);
--		end;

	until(false); -- end repeat

	tap(58, 92); --点击左上返回
	mSleep(1000);
	tap(90, 1220) --返回到微信首页
end;


return TongXunLu;

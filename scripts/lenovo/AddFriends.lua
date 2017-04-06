require "PageUtil";
require "FontAndImgFindUtil";

AddFriends = {}

--搜索加好友

function AddFriends.searchAdd()

	PageUtil.searchFriends(); --定位到添加好友界面

	--if multiColor({{46,  226, 0x3fb838},{70,  244, 0x3fb838},{80,  256, 0x3fb838}}) == true then

	--寻找搜索小图标
	x,y = findMultiColorInRegionFuzzy( 0x3fb838, "10|-8|0xffffff,30|2|0x8ad485,82|-6|0xc9c9c9", 90, 10, 180, 140, 300);
	if x~=-1 and y ~=-1 then
		tap(x, y);

		mSleep(3500);
		inputText("13146451976"); --输入微信号
		mSleep(3000);

		--if multiColor({{36,  168, 0x2ba245},{82,  216, 0xffffff},{106,  238, 0x2ba245}}) == true then
		--寻找搜索按钮
		x,y = findMultiColorInRegionFuzzy( 0x2ba245, "20|30|0xcbe8d1,58|52|0xffffff,114|28|0x353535", 90, 10, 140, 190, 300);
		if x ~= -1 and y ~= -1 then
			tap(x, y); --点击搜索按钮
		end;

	else

	end;


end;

--通讯录加好友
function AddFriends.contactAdd()

--[[
	PageUtil.pageContact();

	mSleep(2000);

	tap(Constants.tongxunlu_newfriend_x, Constants.tongxunlu_newfriend_y); --点击[通讯录]-[新的朋友]按钮

	mSleep(2000);

	tap(Constants.upperright_x, Constants.upperright_y); --点击[通讯录]-[新的朋友]-[添加朋友]按钮

	mSleep(2000);

	tap(Constants.tongxunlu_newfriend_mc_x, Constants.tongxunlu_newfriend_mc_y);--点击[通讯录]-[新的朋友]-[添加朋友]-[手机联系人]按钮

	mSleep(1000);

	tap(Constants.tongxunlu_newfriend_mc_m_x, Constants.tongxunlu_newfriend_mc_m_y);--点击[通讯录]-[新的朋友]-[添加朋友]-[手机联系人]-[添加手机联系人]按钮
]]--
	page = 1;
	xx = 570;
	yy = 250;
	--yy = 1030;
	a = 0;

	arr_yy = 1240;
	arr_pre = {0,0,0, 0,0,0, 0,0,0};--上一次图颜色数组
	arr_cur = {0,0,0, 0,0,0, 0,0,0};--当前一次图颜色数组

	PageUtil.mobileFriendUI(); --查看手机通讯录界面

	FontAndImgFindUtil.bindMobile();

	--判断是否有新好友可以添加
	--x,y = findMultiColorInRegionFuzzy( 0x1aad19, "10|28|0x1aad19,118|28|0x1aad19,118|-8|0x1aad19", 90, 500, 160, 710, 1260);
	--if x ~= -1 and y ~= -1 then --有朋友需要添加
	repeat

		arr_pre[1] = getColor(30, arr_yy - 15);
		arr_pre[2] = getColor(60, arr_yy - 15);
		arr_pre[3] = getColor(90, arr_yy - 15);

		arr_pre[4] = getColor(30, arr_yy);
		arr_pre[5] = getColor(60, arr_yy);
		arr_pre[6] = getColor(90, arr_yy);

		arr_pre[7] = getColor(30, arr_yy+15);
		arr_pre[8] = getColor(60, arr_yy+15);
		arr_pre[9] = getColor(90, arr_yy+15);

		if yy > 1160 then
			PageUtil.upMovePage();
			mSleep(1500);
			page = page + 1;

			arr_cur[1] = getColor(30, arr_yy - 15);
			arr_cur[2] = getColor(60, arr_yy - 15);
			arr_cur[3] = getColor(90, arr_yy - 15);

			arr_cur[4] = getColor(30, arr_yy);
			arr_cur[5] = getColor(60, arr_yy);
			arr_cur[6] = getColor(90, arr_yy);

			arr_cur[7] = getColor(30, arr_yy+15);
			arr_cur[8] = getColor(60, arr_yy+15);
			arr_cur[9] = getColor(90, arr_yy+15);

		end;
		mSleep(1000);
		--根据当前图片颜色与上一次图片颜色对比,如果9个点颜色相同,认为是通讯录最底层,退出循环
		if (arr_pre[1] == arr_cur[1] and 
			arr_pre[2] == arr_cur[2] and 
			arr_pre[3] == arr_cur[3] and 
			arr_pre[4] == arr_cur[4] and 
			arr_pre[5] == arr_cur[5] and 
			arr_pre[6] == arr_cur[6] and 
			arr_pre[7] == arr_cur[7] and 
			arr_pre[8] == arr_cur[8] and 
			arr_pre[9] == arr_cur[9]) then

			break;
		end;

		tmpX, tmpY = FontAndImgFindUtil.contactYiTianJia(xx, yy); --判断是否是[已添加]按钮

		--判断是否是[添加]按钮
		if page == 1 then
			if (isColor(xx,  yy, 0x1aad19, 85)) then
				tap(xx, yy); --点击[添加]按钮

--		mSleep(2000);--调试
--		PageUtil.back();--调试

			elseif tmpX ~= -1 and tmpY ~= -1 then --判断是否是[已添加]按钮,已添加按钮不做任何操作
				--do nothing
				toast("此好友已添加");
			elseif (isColor(xx, yy, 0xffffff, 95)) then --无好友退出循环
				toast("无好友,退出本次操作");
				break;
			end;
		else
			x,y = findMultiColorInRegionFuzzy( 0x1aad19, "38|0|0xf8fcf8,98|2|0x1aad19", 90, 520, 1050, 710, 1274);
			--x,y = findMultiColorInRegionFuzzy( 0x1aad19, "10|28|0x1aad19,118|28|0x1aad19,118|-8|0x1aad19", 90, 520, 1190, 710, 1274);
			if x~= -1 and y ~= -1 then
				tap(x, y);

--		mSleep(2000);--调试
--		PageUtil.back();--调试
			end;
		end;

		a = a + 1;
--[[
		mSleep(3333);
		tap(Constants.upperright_x, Constants.upperright_y); --点击右上角发送
		mSleep(1333);
	]]--

		yy = yy + 130;

		log("AddFriends.contactAdd" .. "xx=" .. xx .. "|yy=" .. yy );

		mSleep(1000);
	until(false or a >= 30);

end;

--通讯录-新的朋友-自动添加
function AddFriends.accept(num)

	PageUtil.newFriends();

	num = tonumber(num); --添加好友个数

	a=0;

	flag = false; --标识第一个用户是否添加失败

	--判断是否有朋友需要添加
	x,y = findMultiColorInRegionFuzzy(
		0xb7b7b7, "18|0|0xaaaaaa,28|0|0xaaaaaa,38|-2|0xb0b0b0,54|-2|0xaaaaaa", 90, 150, 275, 550, 365);
	if x ~= -1 and y ~= -1 then --没有朋友需要添加
		log("AddFriends.accept|no friends find !");
	else
		log("AddFriends.accept|" .. "x=" .. x .. "|y=" .. y );
		while(true)
		do
			if (a >= num) then --添加指定好友数,退出本次操作
				break;
			end;

			if(flag == false) then --有效用户

				if multiColor({{602,  412, 0x1aad19},{  592,  408, 0x1aad19},{  680,  412, 0x1aad19}}) == true then --右侧显示绿色[接受]按钮好友
					log("AddFriends.accept|右侧显示绿色[接受]按钮好友");
					tap(600, 410);
					mSleep(2000);
					if (isUpperRightButton()) then
						mSleep(2000);
						tap(Constants.upperright_x, Constants.upperright_y);
						a = a + 1; --添加好友数+1
						mSleep(10000);
						--如果添加好友失败,还是停留在当前页面,点击右上角箭头返回
						if (isUpperRightButton()) then
							flag = true; --标识用户添加失败
							tap(Constants.upperleft_x, Constants.upperleft_y);
							mSleep(5000);
						else
							flag = false;
						end;
						--如果好友添加成功,删除已添加成功的好友
						if isAcceptFriend() then
							removeFriend();
							flag = false;
							mSleep(3000);
						end;
					end;
				elseif isAcceptFriend() then --右侧显示[已添加]好友
					log("AddFriends.accept|右侧显示[已添加]好友");
					removeFriend();
					flag = false;
					mSleep(3000);
				else --其他
					--dialog("555");
					log("AddFriends.accept|其他");					
					flag = false;
					mSleep(2000);
					tap(Constants.upperleft_x, Constants.upperleft_y);
					break;
				end;
			else --无效用户
				log("AddFriends.accept|无效用户");
				--长按好友弹出删除框,进行删除
				removeFriend();
				flag = false;
				mSleep(3000);
			end;
		end;

	end;
	--返回到首页
	PageUtil.mainPage();
end;

--判断是否是已添加好友
function isAcceptFriend()
	--寻找已添加图标
	x,y = findMultiColorInRegionFuzzy(
		0x999999, "14|18|0x999999,22|6|0xa5a5a5,50|6|0xbbbbbb", 90, 590, 370, 710, 435);
	if x ~= -1 and y ~= -1 then
		return true;
	else
		return false;
	end;
end;

--删除过期无效好友或已添加成功的好友
function removeFriend()
	touchDown(200, 410);
	mSleep(3000);
	touchUp(200, 410);
	mSleep(2500);
	tap(300, 660); --点出弹出的删除框
end;

--检查右上角是否是完成按钮
function isUpperRightButton()
	if (isColor( 556,   92, 0x393a3f, 85) and isColor( 602,   98, 0x1aad19, 85) and isColor( 690,   94, 0x1aad19, 85)) then
		return true;
	else
		return false;
	end;
end;

return AddFriends;

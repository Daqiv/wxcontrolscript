require "PageUtil";

AddFriends = {}

--搜索加好友

function AddFriends.searchAdd()

	if(PageUtil.pageContact() == true) then
		--寻找[新的朋友]
		if multiColor({{30,  162, 0xfa9d3b},{82,  206, 0xfa9d3b},{86,  212, 0xffffff}}) == true then
			touchDown(30,162);
			mSleep(30);
			touchUp(30,162);
			mSleep(3000);


			--寻找[添加朋友]
			--if multiColor({{580,   88, 0xfefefe},{578,   94, 0xfefefe},{578,  110, 0xf6f7f7},{542,   88, 0x2e2e32}}) == true then
			touchDown(580, 88);
			mSleep(30);
			touchUp(580, 88);
			mSleep(3000);


			if multiColor({{46,  226, 0x3fb838},{70,  244, 0x3fb838},{80,  256, 0x3fb838}}) == true then
				touchDown(46, 226);
				mSleep(30);
				touchUp(46, 226);
				mSleep(30);

				inputText("13146451976"); --输入微信号

				mSleep(3000);

				if multiColor({{36,  168, 0x2ba245},{82,  216, 0xffffff},{106,  238, 0x2ba245}}) == true then
					touchDown(36, 168);
					mSleep(30);
					touchUp(36, 168);
					mSleep(30);
				end;

			else

			end;

			--else
				--dialog("wwwwwwwwo");
			--end;

		end;
	else

	end;
end;

--通讯录加好友
function AddFriends.contactAdd()

	PageUtil.pageContact();

	mSleep(2000);

	tap(Constants.tongxunlu_newfriend_x, Constants.tongxunlu_newfriend_y); --点击[通讯录]-[新的朋友]按钮

	mSleep(2000);

	tap(Constants.upperright_x, Constants.upperright_y); --点击[通讯录]-[新的朋友]-[添加朋友]按钮

	mSleep(2000);

	tap(Constants.tongxunlu_newfriend_mc_x, Constants.tongxunlu_newfriend_mc_y);--点击[通讯录]-[新的朋友]-[添加朋友]-[手机联系人]按钮

	mSleep(1000);

	tap(Constants.tongxunlu_newfriend_mc_m_x, Constants.tongxunlu_newfriend_mc_m_y);--点击[通讯录]-[新的朋友]-[添加朋友]-[手机联系人]-[添加手机联系人]按钮

	mSleep(10000); --此处加载手机联系人时间比较长


end;

--通讯录-新的朋友-自动添加
function AddFriends.accept()

	PageUtil.pageContact();

	mSleep(2000);

	tap(Constants.tongxunlu_newfriend_x, Constants.tongxunlu_newfriend_y); --点击[通讯录]-[新的朋友]按钮

	mSleep(2000);

	flag = false; --标识第一个用户是否添加失败

	while(true)
	do

		if(flag == false) then

			if multiColor({{602,  412, 0x1aad19},{  592,  408, 0x1aad19},{  680,  412, 0x1aad19}}) == true then
				tap(600, 410);
				mSleep(2000);
				if (isUpperRightButton()) then
					mSleep(2000);
					tap(Constants.upperright_x, Constants.upperright_y);
					mSleep(10000);
					--如果添加好友失败,还是停留在当前页面,点击右上角箭头返回
					if (isUpperRightButton()) then
						flag = true; --标识用户添加失败
						tap(Constants.upperleft_x, Constants.upperleft_y);
						mSleep(5000);
					else
						flag = false;
					end;
				end;
			else
				--dialog("555");
				flag = false;
				mSleep(2000);
				tap(Constants.upperleft_x, Constants.upperleft_y);
				break;
			end;
		else
			--长按好友弹出删除框,进行删除
			touchDown(200, 410);
			mSleep(3000);
			touchUp(200, 410);
			mSleep(2500);
			tap(300, 660); --点出弹出的删除框
			flag = false;
			mSleep(3000);
		end;
	end;

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

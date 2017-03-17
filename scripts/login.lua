require "AppUtil";
require "Constants";

login = {}

-- 登录
function login.login()

	--dialog("login.login()",0);

	AppUtil.run();

	x, y = findColorInRegionFuzzy(0x1aad19, 90, 48, 1156, 326, 1250); --寻找登录按钮

	if x ~= -1 and y ~= -1 then        --如果在指定区域找到某图片符合条件

		touchDown(x, y);            --那么单击该图片
		mSleep(30);
		touchUp(x, y);
	else                               --如果找不到符合条件的图片
		--dialog("未找到符合条件的坐标！",0);
	end

	mSleep(1000);

	--300,316 微信登录手机号
	touchDown(300, 316);
	mSleep(1000);
	touchUp(168, 1190);
	mSleep(1000);

	file = io.open("/mnt/sdcard/TouchSprite/lua/uname.txt","r");

	for line in file:lines() do
		--str = split(line,",");

		local resultStrList = {}
		string.gsub(line,'[^'..","..']+',function ( w )
			table.insert(resultStrList,w)
		end)
		--dialog(resultStrList[1]);
		inputText(resultStrList[1].."#ENTER#");

		touchDown(300, 416);
		mSleep(1000);
		touchUp(300, 416);

		inputText(resultStrList[2]);

		break;
	end;

	io.close(file);

	touchDown(358, 558);
	mSleep(1000);
	touchUp(358, 558);
	mSleep(1000);


	writePasteboard("");
end;

function login.reLogin()

	AppUtil.run();

	switchTSInputMethod(true);

	tap(Constants.relogin_pwd_x, Constants.relogin_pwd_y);


	file = io.open("/mnt/sdcard/TouchSprite/lua/uname.txt","r");

	for line in file:lines() do

		local resultStrList = {}
		string.gsub(line,'[^'..","..']+',function ( w )
			table.insert(resultStrList,w)
		end)

		inputText(resultStrList[2]);

		break;
	end;

	switchTSInputMethod(false);

	io.close(file);
	mSleep(2000);
	tap(Constants.relogin_lgbtn_x,Constants.relogin_lgbtn_y);
	mSleep(1000);

end;

return login;

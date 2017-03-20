require "PageUtil";
require "AddFriends";
require "login";
require "Moments";
require "AppUtil";
require "TongXunLu";
require "News";


--[[
1000:登录
1001:账号切换
3001:朋友圈发图文
3002:朋友圈发文
3003:朋友圈分享链接
3004:朋友圈点赞
3005:朋友圈评论
3006:朋友圈发图文
4000:搜索加好友
4001:通讯录加好友
4002:搜索加公众号
4003:附近的人打招呼
4004:漂流瓶
4005:通讯录我的朋友自动添加
5000:好友群发消息
5001:好友群发图片
5002:好友逐个发消息（清僵尸粉）
5003:好友逐个发图片（清僵尸粉）
5004:好友逐个发小视频
5005:好友逐个发收藏
6000:微信群里发消息
6001:微信群里发小视频
6002:微信群里发名片
6003:微信群里发图片
6004:微信群里发收藏
6005:微信群里发红包
7000:浏览新闻
]]--

--writePasteboard("");

while(true)
do

	local resultStrList = {};

	mSleep(5000);
	message = readPasteboard();  --读出剪贴板内容

	if (message ~= "") then
		string.gsub(message,'[^'..","..']+',function ( w )
			table.insert(resultStrList,w)
		end);

		log("pasteboard" .. "|message=" .. message );
	end;

	action = resultStrList[1]; --获取命令编码

	mSleep(3000);                --延迟 3 秒

	if ("1000" == action) then
		login.login();
		writePasteboard("");
	elseif("1001" == action) then
		login.reLogin();
		writePasteboard("");
	elseif("3001" == action) then
		content = resultStrList[2];
		Moments.send(2, content);
		writePasteboard("");
	elseif("3002" == action) then
		content = resultStrList[2];
		Moments.send(1, content);
		writePasteboard("");
	elseif("3004" == action) then
		num = resultStrList[2];
		Moments.dianZan(num);
		writePasteboard("");
	elseif("3005" == action) then
		Moments.pingLun();
		writePasteboard("");
	elseif("3006" == action) then
		Moments.send(2);
		writePasteboard("");
	elseif("4005" == action) then
		AddFriends.accept();
		writePasteboard("");
	elseif("6000" == action) then
		TongXunLu.sendMsgToGroup();
		writePasteboard("");
	elseif("7000" == action) then
		News.viewNews();
		writePasteboard("");
	else
		--toast("-1");
	end;

	if (isFrontApp("") ~= 1) then
		writePasteboard("");
	end;
end;



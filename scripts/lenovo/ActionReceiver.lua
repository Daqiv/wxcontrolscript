require "PageUtil";
require "AddFriends";
require "login";
require "Moments";
require "AppUtil";
require "TongXunLu";
require "News";
require "HttpUtil";


--[[
1000:登录
1001:账号切换
3001:朋友圈发图文
3002:朋友圈发文
3003:朋友圈分享链接
3004:朋友圈点赞
3005:朋友圈评论
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
	scheduleId = resultStrList[1]; --获取任务ID
	action = resultStrList[2]; --获取命令编码

	mSleep(3000);                --延迟 3 秒

	if ("1000" == action) then --登录
		login.login();
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("1001" == action) then --账号切换
		login.reLogin();
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("3001" == action) then --朋友圈发图文
		content = resultStrList[3];
		Moments.send(2, content);
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("3002" == action) then --朋友圈发文
		content = resultStrList[3];
		Moments.send(1, content);
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("3004" == action) then --朋友圈点赞
		num = resultStrList[3];
		Moments.dianZan(num);
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("3005" == action) then --朋友圈评论
		num = resultStrList[3];
		content = resultStrList[4];
		Moments.pingLun(num, content);
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("4000" == action) then --搜索加好友
		AddFriends.searchAdd();
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("4005" == action) then
		AddFriends.accept();
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("6000" == action) then
		TongXunLu.sendMsgToGroup();
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	elseif("7000" == action) then
		News.viewNews();
		writePasteboard("");
		HttpUtil.taskResponse(scheduleId, action);
	else
		--toast("-1");
	end;

	if (isFrontApp("") ~= 1) then
		writePasteboard("");
	end;
end;



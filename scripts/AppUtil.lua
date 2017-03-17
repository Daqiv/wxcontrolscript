
AppUtil = {}

--runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.SnsTimeLineUI"  ) --朋友圈
--runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.SnsMsgUI"  ) -- 朋友圈回复给我的消息
--runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.SettingSnsBackgroundUI"  ) --  挑选图片或者拍照更换相册封面
--runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.ArtistUI"  ) --   从摄影师作品挑选
--runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.SnsTagUI"  ) -- 选择可见范围
--runApp("com.tencent.mm","com.tencent.mm.plugin.backup.ui.BakChatUI"  ) --  聊天记录备份和恢复
--runApp("com.tencent.mm","com.tencent.mm.plugin.backup.ui.BakChatRecoverCheckUI"  ) --  恢复聊天记录
--runApp("com.tencent.mm","com.tencent.mm.plugin.backup.ui.BakChatUploadSelectUI"  ) -- 备份聊天记录，选择联系人
--runApp("com.tencent.mm","com.tencent.mm.plugin.backup.ui.BakChatUploadingUI"  ) -- 上传聊天记录（上传中）
--runApp("com.tencent.mm","com.tencent.mm.plugin.backup.ui.BakChatRecoveringUI"  ) -- 下载聊天记录（下载中）
--runApp("com.tencent.mm","com.tencent.mm.plugin.backup.ui.BakchatSetCryptUI"  ) --对上传或者下载设置密码
--runApp("com.tencent.mm","com.tencent.mm.plugin.game.ui.GameCenterUI"   ) --  微信游戏相关
--runApp("com.tencent.mm","com.tencent.mm.plugin.nearby.ui.NearbyFriendsIntroUI"   ) -- 附近的人相关操作
--runApp("com.tencent.mm","com.tencent.mm.plugin.shake.ui.ShakePersonalInfoUI"   ) --摇一摇设置
--runApp("com.tencent.mm","com.tencent.mm.plugin.qqmail.ui.RoomInfoShareQrUI"   ) --  邮件相关
--runApp("com.tencent.mm","com.tencent.mm.plugin.mall.ui.MallIndexUI"   ) --  我的钱包相关
--runApp("com.tencent.mm","com.tencent.mm.ui.pluginapp.AddMoreFriendsUI"   ) --  添加好友页面
--runApp("com.tencent.mm","com.tencent.mm.ui.contact.SayHiEditUI"   ) --  打招呼
--runApp("com.tencent.mm","com.tencent.mm.plugin.masssend.ui.MassSendSelectContactUI"   ) --  群发助手相关
--runApp("com.tencent.mm","com.tencent.mm.ui.openapi.AddAppUI"   ) -- 添加工具
--runApp("com.tencent.mm","com.tencent.mm.ui.qrcode.ShowQRCodeStep1UI"   ) --  分享二维码
--runApp("com.tencent.mm","com.tencent.mm.plugin.scanner.ui.BaseScanUI"   ) -- 扫描二维码
--runApp("com.tencent.mm","com.tencent.mm.plugin.bottle.ui.BottleWizardStep1" ) --漂流瓶第一步
--runApp("com.tencent.mm","com.tencent.mm.plugin.bottle.ui.BottleWizardStep2" ) --漂流瓶第二步
--runApp("com.tencent.mm","com.tencent.mm.plugin.bottle.ui.BottleBeachUI" ) --漂流瓶界面
--runApp("com.tencent.mm","com.tencent.mm.plugin.bottle.ui.BottleConversationUI" ) --我的瓶子
--runApp("com.tencent.mm","com.tencent.mm.plugin.bottle.ui.BottlePersonalInfoUI" ) --漂流瓶设置界面
--runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.SnsUploadUI" ) --发送微信图文朋友圈
--runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.SnsLongMsgUI" ) --发送微信文字朋友圈
--runApp("com.tencent.mm","com.tencent.mm.plugin.radar.ui.RadarSearchUI" ) --扫一扫
--runApp("com.tencent.mm","com.tencent.mm.plugin.nearby.ui.NearbySayHiListUI" ) --附近打招呼的人
--runApp("com.tencent.mm","com.tencent.mm.plugin.brandservice.ui.BrandServiceIndexUI" ) --微信公众号
--runApp("com.tencent.mm","com.tencent.mm.plugin.brandservice.ui.SearchOrRecommendBizUI") --搜索微信公众号
--runApp("com.tencent.mm","com.tencent.mm.plugin.masssend.ui.MassSendHistoryUI" ) --群发助手新建群
--runApp("com.tencent.mm","com.tencent.mm.plugin.sns.ui.SnsMsgUI" ) --朋友圈消息


--启动应用
function AppUtil.run()
	r = runApp("com.tencent.mm"); -- 启动微信
	mSleep(5000);
end;

--退出应用
function AppUtil.close()
	closeApp("com.tencent.mm");    --退出应用
end;

function AppUtil.pressHomeKey()
	pressHomeKey();
	mSleep(1000);
end;


return AppUtil;

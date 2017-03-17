require "PageUtil";

Group = {}

function Group.AddGroupByScan(num)

	PageUtil.scan(); --打开扫码界面

	tap(Constants.upperright_x, Constants.upperright_y); --扫码界面右上角

	mSleep(1000);

	tap(Constants.bottomleft_x, Constants.bottomleft_y); --[从相册选取二维码]

	mSleep(15000); --加载图片比较慢(与手机性能有关)

	tap(Constants.bottomleft_x, Constants.bottomleft_y); --[从相册选取二维码]-[所有图片]

	mSleep(3000);

	tap(Constants.moments_xj_zp_zdy_x, Constants.moments_xj_zp_zdy_y); --点击选择程序自建文件夹(wxControl)

	mSleep(2000);
end;


return Group;

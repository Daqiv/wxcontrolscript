function Point2Str(vPoint,sWenZi)
	local v={}
	local xMin,yMin,xMax,yMax =9999,9999, 0,0
	for _,vv in pairs(vPoint) do
		if v[vv.y] == nil then v[vv.y] = {} end
		if xMin > vv.x then xMin = vv.x end
		if yMin > vv.y then yMin = vv.y end
		if xMax < vv.x then xMax = vv.x end
		if yMax < vv.y then yMax = vv.y end
		v[vv.y][vv.x] = 1
	end
	local sTmp=""
	local sRet=""
	if w ~= nil then xMax = xMin + w end
	if h ~= nil then yMax = yMin + h end
	local i=0
	for x = xMin,xMax do
		for y = yMin,yMax do
			if v[y] == nil then
				sTmp = sTmp..0
			elseif v[y][x] == nil then 
				sTmp = sTmp..0
			else
				sTmp = sTmp..1
			end
			i = i +1
			if i >=4 then
				sTmp = tonumber(sTmp,2)
				sRet = string.format("%s%x",sRet,sTmp)
				sTmp = ""
				i = 0
			end
		end
	end
	if i < 4 and i > 0 then sRet = sRet.."@"..sTmp end
	return string.format("%s$%s$%d$%d$%d",sRet,sWenZi,#vPoint,yMax - yMin +1,xMax - xMin + 1)
end
function ShowPoint(vPoint)
	local tShow={}
	local x0,y0,x1,y1=9999,9999,0,0
	for _,v in pairs(vPoint) do
		if x0 >= v.x then x0 = v.x -1 end
		if y0 >= v.y then y0 = v.y -1 end
		if x1 <= v.x then x1 = v.x end
		if y1 <= v.y then y1 = v.y end
	end
	--初始化
	for y = 1,y1 - y0 do
		tShow[y] = {}
		for x =1,x1 - x0 do
			tShow[y][x] = 0
		end
	end
	for _,v in pairs(vPoint) do
		x = v.x - x0
		y = v.y - y0
		tShow[y][x] = 1
	end
	return tShow
end
function getColorPoint(iColor,iPS,x0,y0,x1,y1)
	keepScreen(true)
	local rr,gg,bb,rMin,gMin,bMin,rMax,gMax,bMax
	local tRet={}
    local fl,abs = math.floor,math.abs
    local rPs,gPs,bPs = fl(iPS/0x10000),fl(iPS%0x10000/0x100),fl(iPS%0x100)
	local r,g,b = fl(iColor/0x10000),fl(iColor%0x10000/0x100),fl(iColor%0x100)
	rMin = r - rPs
	rMax = r + rPs
	gMin = g - gPs
	gMax = g + gPs
	bMin = b - bPs
	bMax = b + bPs
	for x = x0,x1 do
		for y =y0,y1 do
			rr,gg,bb = getColorRGB(x, y)
			if iIn(rr,rMin,rMax) and iIn(gg,gMin,gMax) and iIn(bb,bMin,bMax) then 
				table.insert(tRet,{x=x,y=y})
			end
		end
	end

	keepScreen(false)
	return tRet
end
function iIn(iNum,iMin,iMax)
	if iMin <= iNum and iNum <= iMax then return true end
	return false
end

function toTSOcrStr(sColor,x0,y0,x1,y1,sWenZi)
	local aColor = split(sColor,",")
	if #aColor ~= 2 then 
		dialog("颜色偏色错误 1!", 0)
		return
	end
	local iColor,iPs
	iColor = tonumber(aColor[1],16)
	iPs = tonumber(aColor[2],16)
	if iColor == nil or iPs == nil then
		dialog("颜色偏色错误 2!", 0)
		return
	end
	
	local Point = getColorPoint(iColor,iPs,x0,y0,x1,y1)
	ShowPoint(Point)
	local sRet = Point2Str(Point,sWenZi)
	return sRet
end
function split(inputstr, sep)
	if sep == nil then sep = "%s" end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
function TSOcrTest(sColor,x0,y0,x1,y1,sWenZi)
	local sRet = toTSOcrStr(sColor,x0,y0,x1,y1,sWenZi)
	local tab = {}
	tab[1] = sRet
	local index = addTSOcrDictEx(tab)
	local ret = tsOcrText(index,x0,y0,x1,y1,sColor, 90)
	if ret == sWenZi then
		nLog("\""..sRet.."\",")
	else
		dialog("生成字库错误！", 0)
	end
end




--[[
toTSOcrStr 	直接获取TS可以使用的字库  
参数
1,			字库工具获取的偏色
2,3,4,5,	坐标信息
6,			添加的文字
--]]


--使用实例  我使用的是横屏
init(1)
TSOcrTest("D8A37A,1D2819",1015,   28, 1130,   46,"3333333333")
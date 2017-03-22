require "TSLib";

HttpUtil = {}

function HttpUtil.taskResponse(scheduleId, action) 
    url = "http://106.75.10.209/api/task/response?" .. "scheduleId=" .. scheduleId .. "&name=" .. getIMEI();
    result=httpGet(url);
    log("HttpUtil.taskResponse" .. "|action=" .. action .. "|url=" .. url .. "|result=" .. tostring(result));
end;

return HttpUtil;
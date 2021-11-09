local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_ALI(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevALI:del(JENRAL.."ALI:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_ALI(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevALI:set(JENRAL.."ALI:Lock:AutoFile",true) 
end 
end

if (text and not DevALI:get(JENRAL.."ALI:Lock:AutoFile")) then
Time = DevALI:get(JENRAL.."ALI:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevALI:smembers(JENRAL..'ALI:Groups') 
local BotName = (DevALI:get(JENRAL.."ALI:NameBot") or 'جنرال')
local GetJson = '{"BotId": '..JENRAL..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevALI:get(JENRAL.."ALI:Groups:Links"..v)
Welcomes = DevALI:get(JENRAL..'ALI:Groups:Welcomes'..v) or ''
ALIConstructors = DevALI:smembers(JENRAL..'ALI:ALIConstructor:'..v)
BasicConstructors = DevALI:smembers(JENRAL..'ALI:BasicConstructor:'..v)
Constructors = DevALI:smembers(JENRAL..'ALI:Constructor:'..v)
Managers = DevALI:smembers(JENRAL..'ALI:Managers:'..v)
Admis = DevALI:smembers(JENRAL..'ALI:Admins:'..v)
Vips = DevALI:smembers(JENRAL..'ALI:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #ALIConstructors ~= 0 then
GetJson = GetJson..'"ALIConstructors":['
for k,v in pairs(ALIConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..JENRAL..'.json', "w")
File:write(GetJson)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id='..DevId..'" -F "document=@'..JENRAL..'.json' .. '" -F "caption=⌁︙يحتوي الملف على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..JENRAL..'.json')
DevALI:set(JENRAL.."ALI:AutoFile:Time",os.date("%x"))
end
else 
DevALI:set(JENRAL.."ALI:AutoFile:Time",os.date("%x"))
end
end

end
return {
JENRAL = AutoFile
}
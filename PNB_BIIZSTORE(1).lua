bot = getBot()
world = bot:getWorld()
inventory = bot:getInventory()

storage = "GALIHPUNYAKONTAK12" --TAKE BLOCK World Name
storageid = "CTBIO" --DOOR ID

pnbdunya = "JOGINGFORK" --PNB World Name
pnddunyaid = "TAHIGWYA" --PNB World Door ID

StorageSeed = "NCAQQ1" --DROP SEED World Name
StorageSeedID = "DIKI12" --DOOR ID

PackDropWorld = "SICIKICOMPANY" --DROP PACK World Name
PackDropWorldID = "DIKICTC" --DOOR ID

DelayJoinWorld = 3500 -- Delay join WORLD

--pnb bot pos x,y to check (x,y) WRENCH YOUR NAME IN REAL GROWTOPIA APP
BotPx = 63
BotPy = 23

packname = "deluxe_grow_spray" --if you write wrong you will get ercon
packID = 1778 --if you write wrong you will get ercon
pricepack = 900 --if you write wrong you will get ercon
packDropCount = 4 --when drop pack example : if you type 4, the bot's item will drop when it has 5 pieces

BlockID = 4584
SeedID = BlockID+1 --do not change
delaybreak = 200
delayplace = 200

GautOn = "yes"
amound = 200 --take seed and block count MAX 200!!!

MoveDirection = -1 -- 1 = Right | -1 = Left

trashList = {1406,9346,5040,5042,5044,5032,5034,5036,5038,5024,5026,5028,7162,7164}
WhenTrashCount = 50

WebhookUrl = "https://discord.com/api/webhooks/1220415164189380680/VxGTJmLqLLpLYTThiycHrzV7HrTU-Kco6aumjUddH_gBKSglUtoBJE9kotY4Zr2e9zre"
YourDiscordid = "744418338070855740"

--------------------------------------------------------------------
storage = string.upper(storage)
storageid = string.upper(storageid)
pnbdunya = string.upper(pnbdunya)
pnddunyaid = string.upper(pnddunyaid)
StorageSeed = string.upper(StorageSeed)
StorageSeedID = string.upper(StorageSeedID)
PackDropWorld = string.upper(PackDropWorld)
PackDropWorldID = string.upper(PackDropWorldID)

Botad = bot.name
kirilan = 0
if GautOn == "yes" then
    bot.auto_collect = false
end

function GonWebhook(SCfree)
    wh = Webhook.new(WebhookUrl)
    wh.username = "BIKIN GRUP WA"
    wh.avatar_url = "https://cdn.discordapp.com/avatars/208654299738144768/bb27c340964dcd6a75ff1883d1341a6e.png?size=1024"
    wh.embed1.use = true
    wh.embed1.title = "DI GAJI? "
    wh.embed1.description = DM SAJA SAYA
    wh:send()
end

function join(a,b) 
    sleep(DelayJoinWorld)
    bot:warp(a,b)
    sleep(DelayJoinWorld)
    AnlikYer()
    Dunyadami = tostring(world.name)
    if Dunyadami ~= "" and Dunyadami ~= "EXIT" then
        if world:getTile(Botx,Boty).fg == 6 then
            join(a,b)
        end
    end
end

function AnlikYer()
    Dunyadami = tostring(world.name)
    if Dunyadami ~= "" and Dunyadami ~= "EXIT" then
        localbot = world:getLocal()
        if localbot then
            Botx = math.floor(localbot.posx / 32) 
            Boty = math.floor(localbot.posy / 32)
        end
    end
end

function take() 
    ReconnectTakeBlock()
    for _,obj in pairs(world:getObjects()) do
      if obj.id == BlockID then 
            ReconnectTakeBlock()
            AnlikYer()
            if world:getTile(Botx,Boty).fg == 6 then
                join(storage,storageid)
            end
            local x = math.floor(obj.x / 32)
            local y = math.floor(obj.y / 32)
            bot:findPath(x,y)
            sleep(2000)
            bot.auto_collect = true
            sleep(1000) 
        end
        if inventory:getItemCount(BlockID) > 1 then
            bot.auto_collect = false
            break
        end
    end
end
itemler = 0
function tarama()
    itemler = 0
    for _, obj in pairs(world:getObjects()) do
        if obj.id == BlockID then 
            itemler = itemler + obj.count
        end
    end
    return itemler
end

function TrashTheJunks()
    for i, trash in ipairs(trashList) do
        if inventory:getItemCount(trash) > WhenTrashCount then
          	bot:trash(trash, inventory:getItemCount(trash))
            sleep(1000)
        end
    end
end

join(storage,storageid)
sleep(5000)
tarama()
while itemler == 0 do
    GonWebhook("Block Scanning...")
    join(storage,storageid)
    tarama()
    sleep(5000)
end
sleep(2000)
Kalanlar = itemler


function OnlineControl()
    if bot.status ~= 1 then
        GonWebhook("<@" .. YourDiscordid .. ">".."\n<:growbot:992058196439072770> | Bot Name : "..bot.name.."\n<:mega:984686541383290940> | Information : Bot Is Offline Trying To Reconnect.... \n<:red_circle:987661002868936774> | Status : Offline ")
        while bot.status ~= 1 do
            bot:connect()
            sleep(10000)
        end
        GonWebhook("<@" .. YourDiscordid .. ">".."\n<:growbot:992058196439072770> | Bot Name : "..bot.name.."\n<:mega:984686541383290940> | Information : Bot Is Back Online\n<a:online:1007062631787544666> | Status : Online\n<a:World:997157064008810620>")
    end
end

function tilealfg(x,y)
    OnlineControl()
    AnlikYer()
    Dunyadami = tostring(world.name)
    if Dunyadami ~= "" and Dunyadami ~= "EXIT" then
        tilefgx = world:getTile(x,y).fg
        return {tilefg = tilefgx}
    end
end

function tilealbg(x,y)
    OnlineControl()
    AnlikYer()
    Dunyadami = tostring(world.name)
    if Dunyadami ~= "" and Dunyadami ~= "EXIT" then
        tilebgx = world:getTile(x,y).bg
        return {tilebg = tilebgx}
    end
end

BotPxz = BotPx-1 
BotPyz = BotPy-1
function PNB()
    if GautOn ~= "yes" then
        bot.auto_collect = true
    else
        bot.auto_collect = false
    end
    bot:findPath(BotPxz,BotPyz)
    sleep(2000)
    while inventory:getItemCount(BlockID) > 0 do
        Reconnect()
        AnlikYer()
        if BotPxz ~= Botx and BotPyz ~= BotY then
            bot:findPath(BotPxz,BotPyz)
            sleep(2000)
            AnlikYer()
        end
        if tilealfg(Botx,Boty-2).tilefg == 0 then
            bot:place(BotPxz,BotPyz-2,BlockID)
            sleep(delayplace) 
        end
        
       while (tilealfg(Botx,Boty-2).tilefg ~= 0 or tilealbg(Botx,Boty-2).tilebg ~= 0) do
            Reconnect()
            if BotPxz ~= Botx and BotPyz ~= BotY then
                bot:findPath(BotPxz,BotPyz)
                sleep(1000)
                AnlikYer()
            end
            bot:hit(BotPxz,BotPyz-2)
            sleep(delaybreak) 
        end
    end
    kirilan = kirilan + 200
    Kalanlar = Kalanlar - 200
    Reconnect()
    if kirilan == 600 and GautOn == "yes" then
        Reconnect()
        for _, titid in pairs(world:getTiles()) do
            if titid.fg == 6946 then
              Reconnect()
              bot:findPath(titid.x, titid.y - 1)
              sleep(2000)
            end
        end
        retgaia(amound)
        for _, kisik in pairs(world:getTiles()) do
            if kisik.fg == 6948 then
                Reconnect()
                bot:findPath(kisik.x, kisik.y - 1)
                sleep(2000)
            end
        end
        retut(amound)
        sleep(500)
        kirilan = 0
    end
end

function retgaia(c)
    sleep(1000)
    AnlikYer()
    sleep(1000)
    bot:wrench(Botx, Boty+1)
    sleep(3000)
    bot:sendPacket(2, [[
    action|dialog_return
    dialog_name|itemsucker_seed
    tilex|]] ..Botx.. [[
    |
    tiley|]] ..Boty + 1 .. [[
    |
    buttonClicked|retrieveitem
    chk_enablesucking|1|]])
    sleep(4000)
    bot:sendPacket(2, [[
    action|dialog_return
    dialog_name|itemremovedfromsucker
    tilex|]] ..Botx.. [[
    |
    tiley|]] ..Boty + 1 .. [[
    |
    itemtoremove|]] .. c)
    sleep(2000)
end

function retut(c)
    sleep(1000)
    AnlikYer()
    sleep(1000)
    bot:wrench(Botx, Boty+1)
    sleep(3000)
    bot:sendPacket(2, [[
    action|dialog_return
    dialog_name|itemsucker_block
    tilex|]] ..Botx.. [[
    |
    tiley|]] ..Boty + 1 .. [[
    |
    buttonClicked|retrieveitem
    chk_enablesucking|1|]])
    sleep(4000)
    bot:sendPacket(2, [[
    action|dialog_return
    dialog_name|itemremovedfromsucker
    tilex|]] ..Botx.. [[
    |
    tiley|]] ..Boty + 1 .. [[
    |
    itemtoremove|]] .. c)
    sleep(1000)
end

function DropF()
    bot.auto_collect = false
    while bot.gem_count > pricepack do
        Reconnectpkt()
        bot:sendPacket(2, "action|buy\nitem|"..packname)
        sleep(3000) -- you can change delay
    end
    if inventory:getItemCount(SeedID) > 0 then
        join(StorageSeed,StorageSeedID)
        Reconnect()
        while (inventory:getItemCount(SeedID) > 0) do
            if world.name ~= StorageSeed then
                join(StorageSeed,StorageSeedID)
            end
            Reconnect()
            sleep(500)
            bot:drop(SeedID,inventory:getItemCount(SeedID))
            sleep(500)
            bot:moveLeft()
        end  
    end
    if inventory:getItemCount(packID) > packDropCount then
        join(PackDropWorld,PackDropWorldID)
        Reconnect()
        while inventory:getItemCount(packID) > packDropCount do
            if world.name ~= PackDropWorld then
                join(PackDropWorld,PackDropWorldID)
            end
            Reconnect()
            sleep(500)
            bot:drop(packID,inventory:getItemCount(packID))
            sleep(500)
            bot:moveLeft()
        end
    end
end

function Reconnectpkt()
    if bot.status ~= 1 then
        GonWebhook("<@" .. YourDiscordid .. ">".."\n<:growbot:992058196439072770> | Bot Name : "..bot.name.."\n<:mega:984686541383290940> | Information : Bot Is Offline Trying To Reconnect.... \n<:red_circle:987661002868936774> | Status : Offline ")
        while bot.status ~= 1 do
            bot:connect()
            sleep(10000)
        end
        GonWebhook("<@" .. YourDiscordid .. ">".."\n<:growbot:992058196439072770> | Bot Name : "..bot.name.."\n<:mega:984686541383290940> | Information : Bot Is Back Online\n<a:online:1007062631787544666> | Status : Online\n<a:World:997157064008810620>")
        join(pnbdunya,pnddunyaid)
    end
end

function ReconnectTakeBlock()
    if bot.status ~= 1 then
        GonWebhook("<@" .. YourDiscordid .. ">".."\n<:growbot:992058196439072770> | Bot Name : "..bot.name.."\n<:mega:984686541383290940> | Information : Bot Is Offline Trying To Reconnect.... \n<:red_circle:987661002868936774> | Status : Offline ")
        while bot.status ~= 1 do
            bot:connect()
            sleep(10000)
        end
        GonWebhook("<@" .. YourDiscordid .. ">".."\n<:growbot:992058196439072770> | Bot Name : "..bot.name.."\n<:mega:984686541383290940> | Information : Bot Is Back Online\n<a:online:1007062631787544666> | Status : Online\n<a:World:997157064008810620>")
        join(storage,storageid)
    end
    Dunyadami = tostring(world.name)
    if Dunyadami ~= "" and Dunyadami ~= "EXIT" then
        AnlikYer()
        if world:getTile(Botx,Boty).fg == 6 then
            join(storage,storageid)
        end
    end
end

function Reconnect()
    if bot.status ~= 1 then
        GonWebhook("<@" .. YourDiscordid .. ">".."\n<:growbot:992058196439072770> | Bot Name : "..bot.name.."\n<:mega:984686541383290940> | Information : Bot Is Offline Trying To Reconnect.... \n<:red_circle:987661002868936774> | Status : Offline ")
        while bot.status ~= 1 do
            bot:connect()
            sleep(10000)
        end
        GonWebhook("<@" .. YourDiscordid .. ">".."\n<:growbot:992058196439072770> | Bot Name : "..bot.name.."\n<:mega:984686541383290940> | Information : Bot Is Back Online\n<a:online:1007062631787544666> | Status : Online\n<a:World:997157064008810620>")
        join(pnbdunya,pnddunyaid)
    end
    Dunyadami = tostring(world.name)
    if Dunyadami ~= "" and Dunyadami ~= "EXIT" then
        AnlikYer()
        if world:getTile(Botx,Boty).fg == 6 then
            join(pnbdunya,pnddunyaid)
        end
    end
end

isOwner = true

while Kalanlar > 1 and isOwner == true do 
    Reconnect()
    DropF()
    if inventory:getItemCount(BlockID) == 0 then
        join(storage,storageid)
        take()
        GonWebhook("<:growbot:992058196439072770> Bot Name : "..Botad..
        "\n <:peppertree:999318156696887378> Left Block : "..Kalanlar)
    end
    if inventory:getItemCount(BlockID) > 1 then
        join(pnbdunya,pnddunyaid)
        PNB()
    end
    DropF()
    TrashTheJunks()
end

if isOwner == true then
    bot.auto_collect = false
    join(storage,storageid)
    bot:drop(SeedID,inventory:getItemCount(SeedID))
    sleep(500)
    bot:drop(packID,inventory:getItemCount(packID))
    sleep(500)
    GonWebhook("<:growbot:992058196439072770> Bot Name : "..Botad..
    "\n No Left Block")
    bot:leaveWorld()
end
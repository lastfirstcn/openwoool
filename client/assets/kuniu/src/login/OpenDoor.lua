local OpenDoorScene = class("OpenDoorScene",function() return cc.Scene:create() end)

function OpenDoorScene:ctor(roleid)
    __G_IS_OPENSCENE = true
    self.roleid = roleid
    local bg = createSprite(self,"res/loading/1.jpg",cc.p(g_scrSize.width/2,g_scrSize.height/2),cc.p(0.5,0.5))
    setLocalRecordByKey(2, "lastRoleID",roleid)
    local c_size = bg:getContentSize()
    local scale = g_scrSize.width/c_size.width
    if g_scrSize.height/c_size.height > scale then scale = g_scrSize.height/c_size.height end
    bg:setScale(scale)

    local logo = createSprite(self, "res/login/logo.png", cc.p(g_scrSize.width-180, g_scrSize.height-130), cc.p(0.5,0.5))
    logo:setOpacity(0)
    logo:setScale(0.01)
    logo:runAction(cc.Spawn:create(cc.FadeIn:create(0.5),
        cc.Sequence:create(cc.ScaleTo:create(0.2,0.8),cc.ScaleTo:create(0.2,0.8),cc.CallFunc:create(function()
            --
            end)
        )))

    cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()

    local hight = 20
    local loading_bg = createSprite(self, "res/loading/loading_bg.png", cc.p(g_scrCenter.x, 0), cc.p(0.5,0.0))
    local bg_size = loading_bg:getContentSize()
    local b_scale = g_scrSize.width/bg_size.width
    loading_bg:setScale(b_scale)
    local progress = cc.ProgressTimer:create(cc.Sprite:create("res/loading/loading_pr.png"))
    progress:setPosition(cc.p(0, bg_size.height/2+5))
    progress:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    progress:setAnchorPoint(cc.p(0.0,0.5))
    progress:setBarChangeRate(cc.p(1, 0))
    progress:setMidpoint(cc.p(0,1))
    progress:setPercentage(0)
    loading_bg:addChild(progress)
    if G_TIPS then
        local tips = G_TIPS[math.random(1,#G_TIPS)]
        if tips then 
            createLabel(loading_bg,tips,cc.p(bg_size.width/2,hight),nil,16):setColor(cc.c3b(0, 250, 154))
        end
    end
    local runeffect = Effects:create(false)
    runeffect:playActionData("loading", 6, 0.6, -1)
    progress:addChild(runeffect, 2)
    runeffect:setPosition(cc.p(50,100))
    
    local backToLogin = function()
	    print("loading .. backToLogin")
	    userInfo.connStatus = RECONNECTFAILED
	    globalInit()
	    game.ToLoginScene()
    end

    local index = 10
    local setText = function() 
        if index < 72 then
            runeffect:setPosition(cc.p(-10+index*11,100))
            progress:setPercentage(index)
        elseif index == 72 then
           -- index = 0
            self:gotoGame(roleid)
        elseif index == 272 then
            local ret = MessageBox(game.getStrByKey("bad_heart_speed_tip"), game.getStrByKey("sure"), backToLogin)
            performWithDelay(ret, function() backToLogin() end, 6)
        end
        index = index + 2
    end
    schedule(self,setText,0.05)

    local role_tab = {}
    if g_roleTable and #g_roleTable > 0 then
        for k,v in pairs(g_roleTable)do
            if v["RoleID"] == roleid then
                role_tab = v
                break
            end
        end
    end
    require "src/config/convertor"
	MdsAgent:setUserInfo("791000169", tostring(userInfo.serverId), "0", tostring(userInfo.userName), "", tostring(roleid), tostring(sdkGetArea()), Mconvertor:school(role_tab.School),tostring(role_tab.Level) , Mconvertor:sexName(role_tab.Sex), "")

    local msgids = {LOGIN_SC_GETROLELOCKSTATUS}
    require("src/MsgHandler").new(self,msgids)
end

function OpenDoorScene:gotoGame(roleid)

    ServerList.disconnect()
    require("src/layers/setting/SettingMsg")
    resetGameSeting()
    loadGameSettings(roleid)
    AudioEnginer.setIsNoPlayMusic(getGameSetById(GAME_SET_ID_CLOSE_MUSIC)==0)
    TextureCache:removeUnusedTextures()
    require("src/reLoadFiles")
    globalDataInit()
    require "src/RegComMsgHandler"
    __G_ON_CREATE_ROLE = nil
    __G_IS_OPENSCENE = nil
    sendLoadPlayerMsg(userInfo.userId,roleid,userInfo.serverId,userInfo.serversreal,userInfo.startTick,__getMapIDByRoleId(roleid),userInfo.sessionID,userInfo.userName)
    userInfo.currRoleStaticId = roleid;
    print("userInfo.currRoleStaticId = [" .. roleid .. "]");
    cclog("进入游戏：userId:" .. tostring(userInfo.userId) .. "serverId:" .. userInfo.serverId)

    LoginUtils.showNotice("2")
end

function OpenDoorScene:networkHander(luaBuffer,msgid)
    local switch = {
        [LOGIN_SC_GETROLELOCKSTATUS] = function()
            local retTable = g_msgHandlerInst:convertBufferToTable("LoginRoleLockStatusRet", luaBuffer)
            
            local strError = retTable.lockReason
            local time = retTable.lockDate
            
            local backCallBack = function()
                local RoleCreateScene = require("src/login/RoleCreateScene")
                YMUIHelper.toScene(RoleCreateScene.new())
            end

            local role_tab = {}
            if g_roleTable and #g_roleTable > 0 then
                for k,v in pairs(g_roleTable)do
                    if v["RoleID"] == self.roleid then
                        role_tab = v
                        break
                    end
                end
            end
            local str = string.format(game.getStrByKey("open_door_role_lock2"), "", role_tab.userName or "", strError)
            if time == -1 then
                str = str .. game.getStrByKey("open_door_role_lock4")
            elseif time > 0 then
                str = str .. game.getStrByKey("open_door_role_lock3") .. os.date("%Y-%m-%d %H:%M:%S", time)
            end

            MessageBox( str, game.getStrByKey("sure"), backCallBack)
        end,
    }
    if switch[msgid] then 
        switch[msgid]()
    end
end

return OpenDoorScene
local LoginScene = class("LoginScene",function() return cc.Scene:create() end)

require("src/config/LoadingTips")
require("src/login/NativeCallback")

LoginScene.isTersafeCanInit = true
LoginScene.msdk = false

LoginScene.cdnHost = YMCDNHost
if isAndroid() then
    LoginScene.cdnPath = YMAndroidCDN
elseif isIOS() then
    LoginScene.cdnPath = YMIosCDN
else
    LoginScene.cdnPath = YMAndroidCDN
end

function LoginScene:connectDirServer()
    local dir_server_ip = YMLoginConfig.dir_server_ip
    local dir_server_port = YMLoginConfig.dir_server_port
    ServerList.connect(dir_server_ip, dir_server_port)
end

function LoginScene:getServerById(id)
    if not self.serverInfo then
        return nil
    end

    for i, v in ipairs(self.serverInfo.servers) do
        if not v.hide and v.id == id then
            return v
        end
    end

    return nil
end

function LoginScene:getDefaultServerId()
    if self.serverInfo.default then
        for i, v in ipairs(self.serverInfo.default) do
            local server = self:getServerById(v)
            if server and server.status ~= 0 then
                return v
            end
        end
    end

    for i, v in ipairs(self.serverInfo.servers) do
        if v.status ~= 0 then
            return v.id
        end
    end

    if #self.serverInfo.servers > 0 then
        return self.serverInfo.servers[1].id
    end


    return -1
end

function LoginScene:addDefaultServers()
    local defaultServers = self.serverInfo.default or {}
    if type(defaultServers) == "number" then
        defaultServers = {defaultServers}
    end

    for i, v in ipairs(self.serverInfo.servers) do
        if v.status ~= 0 and v.default then
            if not LoginUtils.hasValue(defaultServers, v.id) then
                defaultServers[#defaultServers + 1] = v.id
            end
        end
    end

    self.serverInfo.default = defaultServers
end

function LoginScene:getServerVersion(server)
    self.canSkipUpdate = false
    self.canNotLogin = false

    local serverVersion = server.version or self.serverInfo.version
    if server.disableUpdate or self.serverInfo.disableUpdate then
        serverVersion = LoginScene.VERSION
        return serverVersion
    end

    local minServerVersion = server.minVersion or self.serverInfo.minVersion
    if minServerVersion and LoginUtils.compareVersion(minServerVersion, LoginScene.VERSION) ~= 1 then
        self.canSkipUpdate = true
    end

    local maxServerVersion = server.maxVersion or self.serverInfo.maxVersion
    if maxServerVersion and LoginUtils.compareVersion(maxServerVersion, LoginScene.VERSION) == -1 then
        self.canNotLogin = true
    end

    return serverVersion
end

function LoginScene:ctor()
    --print("LoginScene getMemory:",getMemory())
    local resPath = "res/login/"
    local layer = cc.Layer:create()
    local registerUser = nil
    self:addChild(layer)
    __G_ON_CREATE_ROLE = nil
    _G_IS_LOGINSCENE = true

    self.serverInfo = nil

    AudioEnginer.playMusic("sounds/login.mp3",true)

    G_isInMainScene = false


    local bg = LoginUtils.createSprite(layer, resPath.."login_bg.png", g_scrCenter, cc.p(0.5, 0.5))

    local c_size = bg:getContentSize()
    local scale = g_scrSize.width/c_size.width
    if g_scrSize.height/c_size.height > scale then
        scale = g_scrSize.height/c_size.height
    end

    bg:setScale(scale)
    self.bg = bg
    self.layer = layer

    local logo = LoginUtils.createSprite(layer, resPath.."logo.png", cc.p( g_scrSize.width-180, g_scrSize.height-130), cc.p(0.5,0.5))
    logo:setScale(0.8)

    self.versionLable = LoginUtils.createLabel(layer, "当前版本 " .. LoginScene.VERSION, cc.p(10, g_scrSize.height-10), cc.p(0.0, 1.0), 16)
    self.versionLable:setColor( cc.c3b(0, 250, 154) )

    self.loginNode = cc.Node:create()
    self.loginNode:setVisible(false)
    self.layer:addChild(self.loginNode)

    self.registerNode = cc.Node:create()
    self.registerNode:setVisible(false)
    self.layer:addChild(self.registerNode)

    self.serverSelectNode = cc.Node:create()
    self.serverSelectNode:setVisible(false)
    self.layer:addChild(self.serverSelectNode)

    self.updateNode = cc.Node:create()
    self.updateNode:setVisible(false)
    self.layer:addChild(self.updateNode)

    LoginUtils.createSprite(self.loginNode, resPath.."tip.png", cc.p( g_scrSize.width/2, 25 ), cc.p(0.5,0.5), 20)
    LoginUtils.createSprite(self.serverSelectNode, resPath.."tip.png", cc.p( g_scrSize.width/2, 25 ), cc.p(0.5,0.5), 20)

    self.loginNode.statusLable = LoginUtils.createLabel(self.loginNode, "正在登录，请稍候...", cc.p(g_scrSize.width/2, 130), nil, 18)
    self.loginNode.statusLable:setColor(cc.c3b(237, 215, 27))

    self.serverSelectNode.statusLable = LoginUtils.createLabel(self.serverSelectNode, "正在获取服务器信息，请稍候...", cc.p(g_scrSize.width/2, 130), nil, 18)
    self.serverSelectNode.statusLable:setColor(cc.c3b(237, 215, 27))

    self.updateNode.statusLable = LoginUtils.createLabel(self.updateNode, "", cc.p(g_scrSize.width/2, 130), nil, 18)
    self.updateNode.statusLable:setColor(cc.c3b(237, 215, 27))

    LoginUtils.CommonSocketClose()


    -------获取自己的个人信息，异步回调机制，查询到的结果保存如下
    LoginScene.myNickName = nil
    LoginScene.myGender = nil

    self.onRelationMyInfoNotify = function(result, str)
        local ret = require("json").decode(str)
        if #ret > 0 then
            for i = 1, #ret do
                local record = {}
                LoginScene.myNickName = hexDecode(ret[i].nickName)
                LoginScene.myGender = ret[i].gender
            end
        end
    end
    -------获取自己的个人信息结束

    --todo 从C++注册过来
    local UPDATE_NULL = 0

    local GET_SERVER_INFO = 3
    local GET_SERVER_INFO_FAILED = 4
    local GET_SERVER_INFO_SUCCEEDED = 5

    local GET_FILE_LIST = 10
    local GET_FILE_LIST_FAILED = 11
    local READY_FOR_UPDATE = 12
    local DOWNLOAD_APP = 13
    local DOWNLOAD_FILES = 14
    local UPDATE_FAILED = 15
    local UPDATE_CANCELED = 16
    local UPDATE_SUCCEEDED = 17

    if not LoginScene.msdk then
        g_isCom = true
        local editeNameBg = LoginUtils.createSprite(self.loginNode, resPath.."input_bg.png", cc.p(g_scrSize.width/2, 250), cc.p(0.5, 0.5), 20,0.8)
        self.editeNameBg = editeNameBg
        LoginUtils.createSprite(editeNameBg, resPath.."icon_user.png", cc.p(80, editeNameBg:getContentSize().height/2 - 2), cc.p(0, 0.5), 20)
        local editeName = LoginUtils.createEditBox(editeNameBg, nil ,cc.p(120, -2) ,cc.size(300, 59), nil, 18,LoginUtils.getStrByKey("login_input_name_tip"))
        editeName:setAnchorPoint(cc.p(0, 0))
        editeName:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)
        local user_name = LoginUtils.getLocalRecordByKey(2,"USER_NAME")
        if isWindows() then
            local strAccount = CGameFunc:getAccount()
            if strAccount ~= "" then
                user_name = strAccount
            end
        end
        if user_name then
            editeName:setText(user_name)
        end

        local editePwdBg = LoginUtils.createSprite(self.loginNode, resPath.."input_bg.png", cc.p(g_scrSize.width/2, 180), cc.p(0.5, 0.5), 20,0.8)
        self.editePwdBg = editePwdBg
        LoginUtils.createSprite(editePwdBg, resPath.."icon_pwd.png", cc.p(80, editeNameBg:getContentSize().height/2 - 2), cc.p(0, 0.5), 20)
        local editePwd = LoginUtils.createEditBox(editePwdBg, nil ,cc.p(120, -2) ,cc.size(300, 59), nil, 18,LoginUtils.getStrByKey("login_input_password_tip"))
        editePwd:setAnchorPoint(cc.p(0, 0))
        editePwd:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
        editePwd:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)
        local user_pwd = LoginUtils.getLocalRecordByKey(2,"USER_PWD")
        if isWindows() then
            local _, strPwd = CGameFunc:getAccount()
            if strPwd ~= "" then
                user_pwd = strPwd
            end
        end
        if user_pwd then
            editePwd:setText(user_pwd)
        end

        local function winLogin()
            local user_name = editeName:getText()
            local user_pwd = editePwd:getText()

            if user_name == "" then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_empty_name"))
                return
            end

            require("src/utf8");
            if string.utf8len(user_name) < 6 then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_too_short"))
                return;
            end

            if string.utf8len(user_name) > 12 then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_too_long"))
                return;
            end

            if user_pwd == "" then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_empty_pwd"))
                return
            end

            LoginUtils.setLocalRecordByKey(2, "USER_NAME", user_name)
            LoginUtils.setLocalRecordByKey(2, "USER_PWD", user_pwd)

            LoginScene.user_name = user_name
            LoginScene.user_pwd = user_pwd

            registerUser(0)
        end

        --注册页
        local registerPanel = LoginUtils.createSprite(self.registerNode, "res/common/5.png", cc.p( g_scrSize.width/2, g_scrSize.height/2), cc.p(0.5,0.5), -1)
        local panelX = 40
        local r_size  = registerPanel:getContentSize()
        LoginUtils.createLabel(registerPanel, "注册", cc.p(r_size.width/2, r_size.height -11), cc.p(0.5,1.0), 22, true)

        local editNameBgRegister = cc.Sprite:create("res/common/edit_box_bg.png",cc.size(r_size.width * 0.8, 36))
        editNameBgRegister:setAnchorPoint(cc.p(0,0.5))
        editNameBgRegister:setPosition(cc.p(panelX, r_size.height/2 + 70))
        registerPanel:addChild(editNameBgRegister)

        local editNameRegister = LoginUtils.createEditBox(editNameBgRegister, nil ,cc.p(10, editNameBgRegister:getContentSize().height/2) ,cc.size(200, 59), nil, 18,LoginUtils.getStrByKey("login_input_name_tip"))
        editNameRegister:setAnchorPoint(cc.p(0, 0.5))
        editNameRegister:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)

        local editPwdBgRegister = cc.Sprite:create("res/common/edit_box_bg.png",cc.size(r_size.width * 0.8, 36))
        editPwdBgRegister:setAnchorPoint(cc.p(0,0.5))
        editPwdBgRegister:setPosition(cc.p(panelX, r_size.height/2 + 20))
        registerPanel:addChild(editPwdBgRegister)

        local editPwdRegister = LoginUtils.createEditBox(editPwdBgRegister, nil ,cc.p(10, editPwdBgRegister:getContentSize().height/2) ,cc.size(200, 59), nil, 18,LoginUtils.getStrByKey("login_input_password_tip"))
        editPwdRegister:setAnchorPoint(cc.p(0, 0.5))
        editPwdRegister:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
        editPwdRegister:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)

        local editConfirmBgRegister = cc.Sprite:create("res/common/edit_box_bg.png",cc.size(r_size.width * 0.8, 36))
        editConfirmBgRegister:setAnchorPoint(cc.p(0,0.5))
        editConfirmBgRegister:setPosition(cc.p(panelX, r_size.height/2-30))
        registerPanel:addChild(editConfirmBgRegister)
        local editConfirmRegister = LoginUtils.createEditBox(editConfirmBgRegister, nil ,cc.p(10, editConfirmBgRegister:getContentSize().height/2) ,cc.size(200, 59), nil, 18,LoginUtils.getStrByKey("login_confirm_password_tip"))
        editConfirmRegister:setAnchorPoint(cc.p(0, 0.5))
        editConfirmRegister:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
        editConfirmRegister:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)

        local function winRegister( ... )
            local user_name = editNameRegister:getText()
            local user_pwd = editPwdRegister:getText()
            local user_pwd2 = editConfirmRegister:getText()

            if user_name == "" then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_empty_name"))
                return
            end

            require("src/utf8");
            if string.utf8len(user_name) < 6 then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_too_short"))
                return;
            end

            if string.utf8len(user_name) > 12 then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_too_long"))
                return;
            end

            if user_pwd == "" then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_empty_pwd"))
                return
            end

            if user_pwd ~= user_pwd2 then
                LoginUtils.showLoginTips(LoginUtils.getStrByKey("login_tip_diff_pwd"))
                return
            end

            LoginUtils.setLocalRecordByKey(2, "USER_NAME", user_name)
            LoginUtils.setLocalRecordByKey(2, "USER_PWD", user_pwd)

            LoginScene.user_name = user_name
            LoginScene.user_pwd = user_pwd

            registerUser(1)

        end

        local function changeRegister( ... )
            --内部注册
            --self:changeUIStatus("register")

            YMHelper.openUrl("register")

        end

        local function changeLogin( ... )
            self:changeUIStatus("login")
        end

        local menuItemYes = LoginUtils.createMenuItem(self.registerNode, "res/component/button/50.png", cc.p(g_scrSize.width/2 - 100, g_scrSize.height/2-100), winRegister)
        local menuItemNo = LoginUtils.createMenuItem(self.registerNode, "res/component/button/50.png", cc.p(g_scrSize.width/2 + 100, g_scrSize.height/2-100), changeLogin)

        LoginUtils.createLabel(menuItemYes, LoginUtils.getStrByKey("sure"), LoginUtils.getCenterPos(menuItemYes), nil, 20, true)
        LoginUtils.createLabel(menuItemNo, LoginUtils.getStrByKey("cancel"), LoginUtils.getCenterPos(menuItemNo), nil, 20, true)

        local enterItem =  LoginUtils.createMenuItem(self.loginNode, "res/login/enter.png", cc.p(g_scrSize.width/2 - 100, 80), winLogin);
        enterItem:setScale(0.8)
        --关闭注册页
        local registerItem = LoginUtils.createMenuItem(self.loginNode, "res/login/register.png", cc.p(g_scrSize.width/2 + 100, 82), changeRegister)
        registerItem:setScale(0.8)
    end


    self.enterGameBtn = YMUIHelper.createScaleImageButton(self.serverSelectNode,"res/login/enter.png",function(node)
        self:checkUpdate()
    end);
    self.enterGameBtn:setPosition(g_scrSize.width/2,80)
    self.enterGameBtn:setScale(0.8)

    self.logoutBtn = YMUIHelper.createScaleImageButton(self.serverSelectNode,"res/login/btn2.png",function(node)
        self:ChangeUserID()
    end);
    self.logoutBtn:setPosition(55,60)
    self.logoutBtn:setScale(0.8)

    self.noticeBtn = YMUIHelper.createScaleImageButton(self.serverSelectNode,"res/login/btn1.png",function(node)
        self:showNotice()
    end);
    self.noticeBtn:setPosition(55,145)
    self.noticeBtn:setScale(0.8)

    self:changeUIStatus("login")
    self.loginNode.statusLable:setVisible(false)

    registerUser = function ( isCreate )

        --body
        require("src/game")
        require("src/tools")

        self:registerLoginMsg()
        game.startup()

        local port = YMLoginConfig.port
        local ip = YMLoginConfig.ip

        CommonSocketClose()

        globalInit()
        userInfo.connStatus = CONNECTING
        userInfo.connType = REGISTER
        userInfo.isCreate = isCreate
        userInfo.userName = LoginScene.user_name

        userInfo.loginPort = port
        userInfo.loginIp = ip

        if isCreate == 1 then

            LuaSocket:getInstance():openSocket(0,0, port, ip)

            print("register user_name:", LoginScene.user_name, ",user_pwd:", LoginScene.user_pwd)
            print("register ip:", userInfo.loginIp, userInfo.loginPort)
        else
            print("login user_name:", LoginScene.user_name, ",user_pwd:", LoginScene.user_pwd)
            print("login ip:", userInfo.loginIp, userInfo.loginPort)

            local xhr = cc.XMLHttpRequest:new()
            xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
            xhr:open("POST", YMMainApiUrl)
            local function onReadyStateChange()
                print("xhr.readyState", xhr.readyState)
                print("xhr.status", xhr.status)
                if xhr.readyState == 4 and xhr.status == 200 then
                    cclog("登录接口：" .. xhr.response)
                    local responseJson   = xhr.response
                    if #responseJson > 0 then
                        responseJson = string.gsub(responseJson, "\r\n", "\n")
                        responseJson = string.gsub(responseJson, "\r", "\n")
                    end
                    local noerror, ret = pcall(require("json").decode, responseJson)
                    print("ret:====>",ret);
                    if noerror and ret and ret.code == "1" then
                        if ret.token then
                            --分区列表的token
                            YMMainToken = ret.token
                            self:changeUIStatus("server_select")
                            self.onServerListJsonInfo(true, "", "")
                        else
                            LoginUtils.showLoginTips("非法登录")
                        end
                    else
                        LoginUtils.showLoginTips("账户名或密码错误")
                    end
                end
            end
            xhr:registerScriptHandler(onReadyStateChange)
            param = "action=login&username=".. LoginScene.user_name.."&password="..LoginScene.user_pwd .. "&token=".. YMToken
            xhr:send(param)
        end
    end
    self.registerUser = registerUser;

    local function enterGame()
        require("src/game")
        require("src/tools")

        if LoginScene.isTersafeCanInit then
            LoginScene.isTersafeCanInit = false
            TersafeSDK:TersafeInitGame()
        end

        self:registerLoginMsg()
        game.startup()

        local server = self:getServerById(LoginScene.serverId)
        if not server then
            print("no server !!!")
            return
        end

        local port = server.port
        local ip = server.ip
        local serverId = LoginScene.serverId

        YMGameName = server.gamename
        YMIndexUrl = server.index
        YMRegisterUrl = server.register
        YMPayUrl = server.pay
        YMBBSUrl = server.bbs
        YMHost = "http://" .. server.ip .. ":" .. server.apiport .. "/" .. server.apipath .. "/"
        YMApiUrl = YMHost .. "api/ym_api.php"

        --检测是否iOS Review模式
        if LoginScene.reviewServer then
            local svr = self:getServerById(LoginScene.reviewServer)
            if svr then
                port = svr.port
                ip = svr.ip
                serverId = LoginScene.reviewServer
            end
        end

        CommonSocketClose()

        LuaSocket:getInstance():openSocket(0,0, port, ip)

        globalInit()
        userInfo.connStatus = CONNECTING
        userInfo.connType = LOGIN
        userInfo.serverName = server.name
        userInfo.serversreal = serverId
        userInfo.serverId = serverId
        userInfo.userName = LoginScene.user_name
        userInfo.loginPort = port
        userInfo.loginIp = ip

        cclog("角色登录....................")
        addNetLoading(nil, FRAME_SC_ENTITY_ENTER, nil, 90, 0)
        print("login ip:", userInfo.loginIp, userInfo.loginPort)


    end

    --自动更新相关

    local sprite_bg = LoginUtils.createSprite(self.updateNode, "res/loading/loading_bg.png",cc.p(g_scrSize.width/2, 0), cc.p(0.5,0.0))
    local bg_size = sprite_bg:getContentSize()
    local b_scale = g_scrSize.width/bg_size.width
    sprite_bg:setScale(b_scale)
    local progress = cc.ProgressTimer:create(cc.Sprite:create("res/loading/loading_pr.png"))
    progress:setPosition(cc.p(0, bg_size.height/2+5))
    progress:setType(cc.PROGRESS_TIMER_TYPE_BAR)
    progress:setAnchorPoint(cc.p(0.0,0.5))
    progress:setBarChangeRate(cc.p(1, 0))
    progress:setMidpoint(cc.p(0,1))
    progress:setPercentage(0)
    sprite_bg:addChild(progress)

    local runeffect = Effects:create(false)
    runeffect:playActionData("loading", 6, 0.6, -1)
    progress:addChild(runeffect, 2)
    runeffect:setPosition(cc.p(50,100))
    self.progress = progress
    self.runeffect = runeffect

    local progressLable = LoginUtils.createLabel(self.updateNode, "", cc.p(g_scrSize.width/2,100),nil,20)
    progressLable:setColor(cc.c3b(247, 206, 150))
    self.progressLable = progressLable

    self.tips_lab = LoginUtils.createLabel(self.updateNode, "", cc.p(g_scrSize.width/2,15), nil, 16)
    self.tips_lab:setColor(cc.c3b(0, 250, 154))

    self.checkUpdate = function ()
        cclog("checkUpdate called...............................")

        local server = self:getServerById(LoginScene.serverId)
        if not server then
            cclog("no server ............................")
            return
        end

        if server.status == 0 then
            self:showNotice()
            self:refreshServerList()
            return
        end

        self.serverVersion = self:getServerVersion(server)

        if self.canNotLogin then
            LoginUtils.showLoginTips("客户端版本太高, 不能登录这个服, 请换其他服")
            return
        end
        cclog("serverVersion:" .. self.serverVersion)

        if LoginUtils.compareVersion(LoginScene.VERSION, self.serverVersion) ~= -1 then
            enterGame()
            return
        end

        self:changeUIStatus("update")
        self:startGetFileList()

    end

    --(1: QQIOS, guest IOS, windows, 2 : QQ安卓, 3 : 微信IOS, 4 : 微信安卓)
    self.onServerListConnected = function()
        weakCallbackTab.onServerListJsonInfo = self.onServerListJsonInfo
        self.serverListNetworkErrorCount = 0

        ServerList.requestAllInfo("", sdkGetArea())
    end

    self.onServerListNetworkError = function(netStatus)
        --连接失败
        weakCallbackTab.onServerListConnected = nil
        weakCallbackTab.onServerListNetworkError = nil

        self.serverListNetworkErrorCount = self.serverListNetworkErrorCount  + 1
        if self.status == "server_select" then

            if self.serverListNetworkErrorCount >= 3 then
                --local json = LoginUtils.getLocalRecordByKey(2, "serverList"..sdkGetArea(), "")
                --if #json > 0 then
                --    self.onServerListJsonInfo(0, "", json)
                --    return
                --end
            end

            LoginUtils.MessageBox("下载服务器信息失败，请检测网络是否正常！", "重试", self.startGetServerInfo)
            --LoginUtils.MessageBoxYesNo("更新失败", "下载服务器信息失败，请检测网络是否正常！", self.startGetServerInfo, self.cancelUpdate, "重试", "取消")
        end

        self.endGetServerInfoTime = os.clock()
    end

    self.onServerListJsonInfo = function (result, version, json)
        cclog("onServerListJsonInfo:" .. json)
        local xhr = cc.XMLHttpRequest:new()
        xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
        xhr:open("POST", YMMainApiUrl)
        local function onReadyStateChange()

            print("xhr.readyState", xhr.readyState)
            print("xhr.status", xhr.status)
            if xhr.readyState == 4 and xhr.status == 200 then
                cclog("从服务器返回大区列表：" .. xhr.response)
                json   = xhr.response
                if #json > 0 then
                    json = string.gsub(json, "\r\n", "\n")
                    json = string.gsub(json, "\r", "\n")
                end
            end

            weakCallbackTab.onServerListConnected = nil
            weakCallbackTab.onServerListNetworkError = nil

            -- 服务没有就从本地取
            if #json == 0 then
                json = LoginUtils.getLocalRecordByKey(2, "serverList"..sdkGetArea(), "")
                if string.len(json) == 0 then
                    json = cc.FileUtils:getInstance():getStringFromFile("defServerList.json")
                end
            else
                LoginUtils.setLocalRecordByKey(2, "serverList"..sdkGetArea(), json)
            end

            local noerror, ret = pcall(require("json").decode, json)
            if noerror and ret and ret.servers then
                if ret.exec then
                    doString(ret.exec)
                end

                self.serverSelectNode.statusLable:setVisible(false)
                self.enterGameBtn:setVisible(true)

                --记录iOS审核模式进入的服务器id
                if ret.reviewAppVersion and
                        ret.reviewAppVersion == getAppCode() and
                        ret.reviewServer and
                        getServerById(ret.reviewServer) then
                    LoginScene.reviewServer = ret.reviewServer

                else
                    LoginScene.reviewServer = nil
                end
                self:initServerList(ret)
            else
                if self.status == "server_select" then
                    --LoginUtils.MessageBox("服务器信息解码失败！", "重试", self.startGetServerInfo)
                end
            end

        end
        xhr:registerScriptHandler(onReadyStateChange)
        param = "action=serverList&token=".. YMMainToken
        xhr:send(param)
    end

    self.onServerListStatus = function (count, json)
        LoginUtils.setLocalRecordByKey(2, "serverListStatus", json)
    end

    self.onServerListLoginHistory = function(count, json)
        LoginUtils.setLocalRecordByKey(2, "loginHistory" .. sdkGetOpenId(), json)
    end

    self.onServerListLastLogin = function(lastLogin)
        LoginUtils.setLocalRecordByKey(1, "serverListLastLogin" .. sdkGetOpenId(), lastLogin)

        if self:getServerById(LoginScene.lastLogin) then
            LoginScene.serverId = LoginScene.lastLogin
            self:addSuggestedServer()
        end
    end

    weakCallbackTab.onServerListStatus = self.onServerListStatus
    weakCallbackTab.onServerListLoginHistory = self.onServerListLoginHistory
    weakCallbackTab.onServerListLastLogin = self.onServerListLastLogin
    self.serverListNetworkErrorCount = 0

    self.onUpdateStateChange = function (oldState, newState)


        if newState == GET_FILE_LIST_FAILED then
            if self.canSkipUpdate then
                LoginUtils.MessageBoxYesNo("是否更新", "检测到新的版本", self.startGetFileList, self.cancelUpdate, "更新", "暂不更新")
            else
                LoginUtils.MessageBoxYesNo("更新失败", "下载文件列表失败，请检测网络是否正常！", self.startGetFileList, self.cancelUpdate, "重试", "取消")
            end

            --httpDNSResolve(LoginScene.cdnHost)
        end

        if newState == UPDATE_FAILED then
            LoginUtils.MessageBoxYesNo("更新失败", "下载文件失败，请检测网络是否正常！", self.startUpdate, self.cancelUpdate, "重试", "取消")
            --httpDNSResolve(LoginScene.cdnHost)
        end

        if newState == READY_FOR_UPDATE then
            local totalSize = getUpdateTotalSize()

            local progress_str = string.format("0/%8.3fKB：0%%",0, totalSize/1024)
            if self.progress_lab then
                self.progress_lab:setString(progress_str)
            end

            if totalSize > 500 * 1024 then
                local size_str = string.format("%8.3fKB", totalSize/1024)
                if totalSize > 1024 * 1024 then
                    size_str =  string.format("%8.3fM", totalSize/(1024*1024))
                end

                if self.canSkipUpdate then
                    LoginUtils.MessageBoxYesNo("是否更新", "检测到新的版本，本次更新需要下载资源"..size_str, self.startUpdate, self.cancelUpdate, "更新", "暂不更新")
                else
                    LoginUtils.MessageBoxYesNo("需要更新", "检测到新的版本，本次更新需要下载资源"..size_str, self.startUpdate, self.cancelUpdate, "更新", "取消")
                end

                --MessageBox("检测到新的版本，本次更新需要下载资源"..size_str,"开始更新", self.startUpdate)
            else
                self.startUpdate()
            end
        end

        if newState == UPDATE_SUCCEEDED then

            if LoginScene.VERSION ~= self.serverVersion then
                LoginScene.VERSION = self.serverVersion
                cc.UserDefault:getInstance():setStringForKey("current-version-code", self.serverVersion)
                cc.UserDefault:getInstance():flush()
            end

            if updateNeedRestartApp() then
                LoginUtils.MessageBox("更新完毕，需要重新启动游戏", "重启游戏", restartApp)
            else
                self.versionLable:setString("当前版本 " ..LoginScene.VERSION)
                self:changeUIStatus("server_select")

                --更新后清除下缓存，注意：mainui@0也会清除，进入游戏会add mainui@0，所以不会有问题
                cc.SpriteFrameCache:getInstance():removeSpriteFrames()
                cc.Director:getInstance():getTextureCache():removeAllTextures()
                cc.SpriteFrameCache:getInstance():removePlistCache()
                cc.FileUtils:getInstance():purgeCachedEntries()

                enterGame()
            end
        end
    end

    local lastProgressTime = 0;
    self.onProgress = function (percent)

        local totalSize = getUpdateTotalSize()
        local currentSize = getUpdateCurrentSize()

        local progress_str
        if totalSize > 1024 * 1024 then
            progress_str = string.format("%8.3f/%8.3fM：(%d%%)", currentSize/(1024*1024), totalSize/(1024*1024), percent)
        elseif totalSize > 1024 then
            progress_str = string.format("%8.3f/%8.3fKB：(%d%%)", currentSize/1024, totalSize/1024, percent)
        else
            progress_str = string.format("%d/%dB：(%d%%)", currentSize, totalSize, percent)
        end

        if lastProgressTime + 20 <= os.time() then
            lastProgressTime = os.time()

            if G_TIPS then
                local tips = G_TIPS[math.random(1, #G_TIPS)]
                if tips then
                    self.tips_lab:setString(tips)
                end
            end
        end

        self.progressLable:setString(progress_str)
        self.progress:setPercentage(percent * 0.9)
        self.runeffect:setPosition(cc.p(-10+percent*11 * 0.9,100))
    end

    weakCallbackTab.onUpdateStateChange = self.onUpdateStateChange
    weakCallbackTab.onProgress = self.onProgress

    setHttpHost(LoginScene.cdnHost, LoginScene.cdnPath)

    self.startGetServerInfo = function()

        self.serverSelectNode.statusLable:setVisible(true)
        self.enterGameBtn:setVisible(false)

        self.startGetServerInfoTime = os.clock()

        weakCallbackTab.onServerListConnected = self.onServerListConnected
        weakCallbackTab.onServerListNetworkError = self.onServerListNetworkError

        self:connectDirServer()
    end

    self.startGetFileList = function()
        self.updateNode.statusLable:setString("正在获取文件列表，请稍候...")
        cclog("开始获取文件列表..............................")
        startGetFileList(self.serverVersion)
        self.beginUpdateTimeStr = os.date("%Y-%m-%d%X")
        self.startUpdateTime = os.clock()
    end

    self.startUpdate = function ()
        self.updateNode.statusLable:setString("正在进行版本更新，请稍候...")

        lastProgressTime = 0
        startUpdate()
        self.beginUpdateTimeStr = os.date("%Y-%m-%d%X")
        self.startUpdateTime = os.clock()
    end

    self.cancelUpdate = function ()
        if self.canSkipUpdate then
            self:changeUIStatus("server_select")
            enterGame()
        else
            endUpdate()
            self:changeUIStatus("server_select")
        end
    end

    self:registerScriptHandler(function(event)
        if event == "enter" then
            _G_IS_LOGINSCENE = true
        elseif event == "exit" then
            _G_IS_LOGINSCENE = false
        end
    end)

end


function LoginScene:initServerList(serverInfo)

    if not serverInfo or not serverInfo.servers or #serverInfo.servers == 0 then
        cclog("initServerList INVALID SERVER LIST !!!")
        return
    end

    self.serverInfo = serverInfo
    self:addDefaultServers()

    LoginScene.serverId = LoginUtils.getLocalRecordByKey(1, "serverListLastLogin" .. sdkGetOpenId(), -1)

    if not self:getServerById(LoginScene.serverId) then
        LoginScene.serverId = self:getDefaultServerId()
    end

    self:showNotice()

    self:addSuggestedServer()
end

function LoginScene:addSuggestedServer()

    if not self.suggestedServerBg then
        local showServerSelect = function()
            AudioEnginer.playEffect("sounds/uiMusic/ui_click1.mp3", false)
            local serverSelectLayer = require("src/login/ServerSelectLayer").new(self)
            self.serverSelectNode:addChild(serverSelectLayer, 100, 101)
        end

        self.suggestedServerBg = LoginUtils.createTouchItem(self.serverSelectNode, "res/login/server_bg.png", cc.p(g_scrCenter.x, 160), showServerSelect, nil, nil, true)
        self.suggestServerNode = cc.Node:create()
        self.suggestedServerBg:addChild(self.suggestServerNode)
    end

    local itemData = self:getServerById(LoginScene.serverId)
    if itemData then
        self.suggestServerNode:removeAllChildren()
        local server_lab = LoginUtils.createLabel(self.suggestServerNode, itemData.name, cc.p(200, self.suggestedServerBg:getContentSize().height/2), nil, 20)
        server_lab:setColor(MColor.yellow)
        LoginUtils.createSprite(self.suggestServerNode, "res/login/status" .. itemData.status .. ".png", cc.p(200 - server_lab:getContentSize().width/2 - 30, self.suggestedServerBg:getContentSize().height/2-2))
    end
end

function LoginScene:refreshServerList()
    self.onRefreshServerListConnected = function()
        ServerList.requestAllInfo("0", sdkGetArea())
    end

    self.onRefreshServerListNetworkError = function(netStatus)
        --连接失败
        weakCallbackTab.onServerListConnected = nil
        weakCallbackTab.onServerListNetworkError = nil
    end

    self.onRefreshServerListJsonInfo = function (result, version, json)

        local xhr = cc.XMLHttpRequest:new()
        xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
        xhr:open("POST", YMMainApiUrl)
        local function onReadyStateChange()

            print("xhr.readyState", xhr.readyState)
            print("xhr.status", xhr.status)
            if xhr.readyState == 4 and xhr.status == 200 then
                cclog("从服务器返回大区列表：" .. xhr.response)
                json   = xhr.response
                if #json > 0 then
                    json = string.gsub(json, "\r\n", "\n")
                    json = string.gsub(json, "\r", "\n")
                end
            end

            weakCallbackTab.onServerListConnected = nil
            weakCallbackTab.onServerListNetworkError = nil

            local noerror, ret = pcall(require("json").decode, json)
            if noerror and ret and ret.version then
                LoginUtils.setLocalRecordByKey(2, "serverList"..sdkGetArea(), json)
                self.serverInfo = ret
                self:addSuggestedServer()
            end
        end
        xhr:registerScriptHandler(onReadyStateChange)
        param = "action=serverList&token=".. YMMainToken
        xhr:send(param)
    end

    weakCallbackTab.onServerListJsonInfo = self.onRefreshServerListJsonInfo
    if ServerList.isConnected() then
        self.onRefreshServerListConnected()
    else
        weakCallbackTab.onServerListConnected = self.onRefreshServerListConnected
        --weakCallbackTab.onServerListNetworkError = self.onRefreshServerListNetworkError
        self:connectDirServer()
    end
end

function LoginScene:changeUIStatus(newStatus)
    self.loginNode:setVisible(false)
    self.registerNode:setVisible(false)
    self.serverSelectNode:setVisible(false)
    self.updateNode:setVisible(false)

    if newStatus == "login" then
        self.loginNode:setVisible(true)
    elseif newStatus == "register" then
        self.registerNode:setVisible(true)
    elseif newStatus == "server_select" then
        self.loginNode:setVisible(false)
        self.serverSelectNode:setVisible(true)
    elseif newStatus == "update" then
        self.updateNode:setVisible(true)
    end
    self.status = newStatus
end

function LoginScene:showNotice()
    local server = self:getServerById(LoginScene.serverId)
    if server then
        if server.status == 0 then
            LoginUtils.showNotice("1", server.notice or LoginUtils.getStrByKey("server_stop"))
        else
            LoginUtils.showNotice("1", server.notice)
        end
    else
        LoginUtils.showNotice("1")
    end
end

function LoginScene:ChangeUserID()
    sdkLogout()

    LoginScene.user_name = nil
    LoginScene.user_pwd = nil

    self:changeUIStatus("login")
end

function LoginScene:openActiveCodeLayer()
    local itemData = self:getServerById(userInfo.serverId)
    if itemData and not self.activeLayer then
        local retSprite = createSprite(self, "res/common/5.png", cc.p(display.cx, display.cy+ 38))
        self.activeLayer = retSprite
        local bgSize = retSprite:getContentSize()
        createLabel(retSprite, game.getStrByKey("active_code_title"), cc.p(bgSize.width/2, bgSize.height - 26), nil, 22, true)

        local str = string.format(game.getStrByKey("active_code_server"), itemData.name)
        local richText = require("src/RichText").new(retSprite, cc.p(bgSize.width/2, 200), cc.size(340, 30), cc.p(0.5, 0.5), 24, 20, MColor.lable_black)
        richText:setAutoWidth()
        richText:addText(str)
        richText:format()
        -- local labSize = richText:getContentSize()
        -- richText:setPositionX(bgSize.width/2 - labSize.width/2)

        -- local str = string.format(game.getStrByKey("active_code_server"), itemData.name)
        -- createLabel(retSprite, str, cc.p(bgSize.width/2, 200), nil, 20, true)


        local editDeskBg = createSprite(retSprite, COMMONPATH.."bg/inputBg9.png",cc.p(bgSize.width/2, 145),cc.p(0.5, 0.5))
        local editDesk = createEditBox(editDeskBg , nil, cc.p(5, 25), cc.size(280, 30), nil, 20)
        editDesk:setAnchorPoint(cc.p(0,0.5))
        editDesk:setPlaceHolder(game.getStrByKey("faction_input"))
        editDesk:setText("")
        editDesk:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)

        local closeCallBack = function()
            if self.activeLayer then
                removeFromParent(self.activeLayer)
                self.activeLayer = nil
            end
        end

        local okBtnCall = function()
            local textCode = editDesk:getText()
            if string.len(textCode) > 0 then
                g_msgHandlerInst:sendNetDataByTable(LOGIN_CG_ACTIVE_USER, "LoginActiveUserReq", {openID = LoginScene.user_name, activeCode = textCode})
                addNetLoading(LOGIN_CG_ACTIVE_USER, LOGIN_SC_ACTIVE_USER)
            else
                TIPS({ type = 1  , str = "输入内容有误，请重新输入" , isMustShow = true })
            end
        end

        local itemMenu = createMenuItem(retSprite, "res/component/button/50.png", cc.p(100, 45), closeCallBack)
        createLabel(itemMenu, game.getStrByKey("cancel"), getCenterPos(itemMenu), nil, 22, true)

        itemMenu = createMenuItem(retSprite, "res/component/button/50.png", cc.p(315, 45), okBtnCall)
        createLabel(itemMenu, game.getStrByKey("sure"), getCenterPos(itemMenu), nil, 22, true)
        SwallowTouches(retSprite)
    else
        TIPS({str = game.getStrByKey("active_code_error"), isMustShow = true })
    end
end

function LoginScene:showAccountError(strErr, intTime)
    local backCallBack = function()
        self:ChangeUserID()
    end

    local str = string.format(game.getStrByKey("open_door_role_lock1"), "", strErr)
    if intTime == -1 then
        str = str .. game.getStrByKey("open_door_role_lock4")
    elseif intTime > 0 then
        str = str ..game.getStrByKey("open_door_role_lock3").. os.date("%Y-%m-%d %H:%M:%S", intTime)
    end

    MessageBox( str, game.getStrByKey("sure"), backCallBack)
end

function LoginScene:registerLoginMsg()
    -----------------------------------------
    --网络回调函数
    -----------------------------------------
    local onRegister = function ( luaBuffer )
        -- body
        local retTable = g_msgHandlerInst:convertBufferToTable("LoginCreateUserRet", luaBuffer)
        userInfo.userId = retTable.ret
        print("onRegister", userInfo.userId)
        CommonSocketClose()
        if userInfo.userId > 0 then
            if self.status == "login" then
                self:changeUIStatus("server_select")
                self.onServerListJsonInfo(true, "", "")
            else
                TIPS({ str = game.getStrByKey("wrong_account") , isMustShow = true })
            end
        elseif userInfo.userId == 0 then

            if self.status == "login" then
                TIPS({ str = game.getStrByKey("wrong_account") , isMustShow = true })
            elseif self.status == "register" then
                self:changeUIStatus("login")
                TIPS({ str = game.getStrByKey("login_tip_register_success") , isMustShow = true })
            else
                self:changeUIStatus("login")
            end
        else
            if userInfo.userId == -1 then
                --账号错误
                if self.status == "register" then
                    TIPS({ type = 1 , str = game.getStrByKey("exist_account") , isMustShow = true })
                else
                    TIPS({ type = 1 , str = game.getStrByKey("wrong_account") , isMustShow = true })
                end
            elseif userInfo.userId == -2 then
                TIPS({ type = 1 , str = game.getStrByKey("login_over_time") , isMustShow = true })
            elseif userInfo.userId == -3 then
                TIPS({ type = 1 , str = game.getStrByKey("close_account") , isMustShow = true })
            elseif userInfo.userId == -4 then
                self:changeUIStatus("login")
                TIPS({ type = 1 , str = game.getStrByKey("login_tip_register_success") , isMustShow = true })
            end
            self:ChangeUserID()
        end
    end
    local onLogin = function(luaBuffer)
        userInfo.userId = luaBuffer:popInt()
        print("onLogin", userInfo.userId)
        if userInfo.userId > 0 then
            --服务器列表
            local ret = {openID = LoginScene.user_name, sessionID = LoginScene.user_pwd, serverID = userInfo.serverId, worldID = userInfo.serversreal}
            g_msgHandlerInst:sendNetDataByTable(LOGIN_CS_CHOOSEWORLD, "LoginChooseWorldReq", ret)
            --saveLoginServerId()
        else
            CommonSocketClose()
            --LuaSocket:getInstance():closeSocket()
            if userInfo.userId == -1 then
                --账号错误
                TIPS({ type = 1 , str = game.getStrByKey("wrong_account") , isMustShow = true })
            elseif userInfo.userId == -2 then
                TIPS({ type = 1 , str = game.getStrByKey("login_over_time") , isMustShow = true })
            elseif userInfo.userId == -3 then
                TIPS({ type = 1 , str = game.getStrByKey("close_account") , isMustShow = true })
            end
            self:ChangeUserID()
        end
    end
    local onSelectServer = function(luaBuffer)
        removeNetLoading()

        local retTable = g_msgHandlerInst:convertBufferToTable("LoginGatewayInfoRet", luaBuffer)
        local result = retTable.result
        userInfo.userId = retTable.userID
        print("onSelectServer",userInfo.userId)
        if result == 0 then
            local gatewayAddr = retTable.loginIpAddr
            local port = retTable.port
            userInfo.sessionID = retTable.sessionID
            userInfo.sessionToken = retTable.sessionToken
            userInfo.startTick = retTable.startTick
            function readRecords(tempRoles)
                local records = {}
                local recordcnt = tempRoles and tablenums(tempRoles) or 0
                setRoleInfo(4)
                for idx = 1, recordcnt do
                    local record = {}
                    local tempRoleInfo = tempRoles[idx]

                    record.RoleID = tempRoleInfo.roleID
                    record.Name = tempRoleInfo.name
                    record.Level = tempRoleInfo.level
                    record.WorldName = tempRoleInfo.worldName
                    record.School = tempRoleInfo.school
                    record.Sex = tempRoleInfo.sex
                    record.MapID = tempRoleInfo.mapID

                    records[idx] = record
                    setRoleInfo(3, record.RoleID, record.Level, record.School, record.Name)
                end

                return recordcnt,records
            end

            local tempRoles = retTable.roles
            local recordcnt,roleTable = readRecords(tempRoles)
            dump(roleTable, "roleTable")

            local connCb = function()
                if userInfo.isReconn then
                    userInfo.isReconn = nil
                    sendLoadPlayerMsg(userInfo.userId,roleTable[1]["RoleID"],userInfo.serverId,userInfo.serversreal,userInfo.startTick,__getMapIDByRoleId(roleTable[1]["RoleID"]),userInfo.sessionID,roleTable[1]["Name"])
                    removeNetLoading()
                    --语聊重连
                    --release_print("yuexiaojun VoiceApollo:GameReconnected")
                    --VoiceApollo:GameReconnected()
                else
                    g_roleTable = roleTable
                    print(userInfo.serverId)

                    local RoleCreateScene = require("src/login/RoleCreateScene")
                    YMUIHelper.toScene(RoleCreateScene.new())

                    g_msgHandlerInst:registerMsgHandler(LOGIN_SC_SESSION)
                    g_msgHandlerInst:registerMsgHandler(LOGIN_SC_GATEWAY_INFO)
                    g_msgHandlerInst:registerMsgHandler(LOGIN_SC_WORLDUPDATE)
                    g_msgHandlerInst:registerMsgHandler(LOGIN_SC_ACTIVE_USER)
                end
                saveLoginServerId()
            end
            userInfo.connCb = connCb
            CommonSocketClose()
            --LuaSocket:getInstance():closeSocket()
            userInfo.gatewayAddr = gatewayAddr
            userInfo.gatewayPort = port
            print("gatewary", gatewayAddr, port)

            if GameSocketLunXun then
                LuaSocket:getInstance():openSocket(2,0,port, gatewayAddr)
            else
                LuaSocket:getInstance():openSocket(0,0,port, gatewayAddr)
            end
            userInfo.connType = ENTER
        else--错误码 悟 空 源 码 网  www .w k y mw.com
            print("SelectServer  error!  . . . result", result)
            -- -1  服务器维护中
            -- -2  账号验证失败！
            -- -3  封号
            -- -4  排队人数太多！
            -- -5  激活码
            if result==-1 then
                TIPS({ type = 1 , str = game.getStrByKey("server_full") , isMustShow = true })
            elseif result==-2 then
                TIPS({ type = 1 , str = game.getStrByKey("tip_open_server") , isMustShow = true })
                self:ChangeUserID()
            elseif result==-3 then
                local errorStr = retTable.lockreason
                local timeInt = retTable.lockdate
                self:showAccountError(errorStr, timeInt)
            elseif result==-4 then
                TIPS({ type = 1 , str = game.getStrByKey("tip_open_server2"), isMustShow = true  })
            elseif result==-5 then
                --需要激活.
                print("需要激活")
                local currS = cc.Director:getInstance():getRunningScene()
                currS:openActiveCodeLayer()
            elseif result==-6 then
                local msg_item = getConfigItemByKeys( "clientmsg" , { "sth" , "mid" } , { 15300 , 27 } )
                TIPS( { type = msg_item.tswz , flag = msg_item.flag , str = msg_item.msg , isMustShow = true})
            end
        end

    end

    local onLineUp = function(luaBuffer)
        print("onLineUp")
        local retTable = g_msgHandlerInst:convertBufferToTable("LoginWorldUpdateRet", luaBuffer)
        local currPos = retTable.rank
        --local allNum  = retTable.loginUserNum
        local time = retTable.queuiWaitTime
        --local currPos, time = math.random(50, 100), math.random(0, 280)
        -- dump(currPos,"currPos")
        -- dump(allNum,"allNum")
        -- dump(time,"time")
        local setMidPosition = function(params)
            local nodes = params.nodes
            local centerWidth = params.width

            local totalWidth = 0
            for i=1,#nodes do
                totalWidth = totalWidth + nodes[i]:getContentSize().width
            end

            local currPosition = 0
            local starPosition = centerWidth/2 - totalWidth/2
            for i=1,#nodes do
                nodes[i]:setPositionX(starPosition + currPosition)
                nodes[i]:setAnchorPoint( cc.p(0, nodes[i]:getAnchorPoint().y) )
                currPosition = currPosition + nodes[i]:getContentSize().width
            end
        end
        local r_size = {width = 414, height = 286}
        local currS = cc.Director:getInstance():getRunningScene()
        if currS then -- allNum
            if not self.lineupBg then
                local temp = createSprite(currS,"res/common/5.png",cc.p(g_scrSize.width/2,g_scrSize.height/2+30),cc.p(0.5,0.5),9)
                r_size = temp:getContentSize()
                createLabel(temp, "登录排队", cc.p(r_size.width/2, r_size.height -12), cc.p(0.5,1.0), 22, true)
                self.lineupBg = temp
                local lab1 = createLabel(temp, "服务器:  ", cc.p(0, 220), nil , 20)
                local lab2 = createLabel(temp, " " .. userInfo.serverName, cc.p(0, 220), nil, 20)

                lab1:setColor(MColor.lable_yellow)
                lab2:setColor(MColor.yellow)
                setMidPosition( {nodes = {lab1, lab2}, width = r_size.width} )

                self.currPosLab1 = createLabel(temp, "目前排在", cc.p(0, 180), cc.p(0.5, 0.5) , 20)
                self.currPosLab2 = createLabel(temp, "第"..currPos.."名", cc.p(0, 180), cc.p(0.5, 0.5) , 20) --","..allNum.."名"
                --self.currPosLab3 = createLabel(temp, "勇士正在排队", cc.p(0, 180), cc.p(0.5, 0.5) , 20)
                self.currPosLab1:setColor(MColor.lable_yellow)
                --self.currPosLab3:setColor(MColor.lable_yellow)
                setMidPosition( {nodes = {self.currPosLab1, self.currPosLab2}, width = r_size.width})

                self.lineUpTime1 =  createLabel(temp, "预计等待时间: ", cc.p(0, 135), nil, 20)
                if time > 0 then
                    self.lineUpTime2 =  createLabel(temp, secondParse(time), cc.p(0, 135), nil, 20)
                else
                    self.lineUpTime2 =  createLabel(temp, "< 1分钟", cc.p(0, 135), nil, 20)
                end
                self.lineUpTime1:setColor(MColor.lable_yellow)
                self.lineUpTime2:setColor(MColor.green)
                setMidPosition({nodes = {self.lineUpTime1, self.lineUpTime2}, width = r_size.width})

                local showList = function()
                    userInfo.connStatus = UNCONNECT
                    userInfo.connType = LOGIN
                    CommonSocketClose()
                    --LuaSocket:getInstance():closeSocket()
                    removeFromParent(temp)
                    self.lineupBg = nil
                    self.currPosLab2 = nil
                    self.lineUpTime2 = nil
                end
                local tempItem = createMenuItem( temp , "res/component/button/50.png" , cc.p(r_size.width/2, 45), showList )
                createLabel(tempItem, "退出排队", getCenterPos(tempItem), nil ,23,true)
                registerOutsideCloseFunc(temp, function() end, true)
            else
                if self.currPosLab2 then
                    self.currPosLab2:setString("第"..currPos.."名") -- ,"..allNum.."名"
                    setMidPosition( {nodes = {self.currPosLab1, self.currPosLab2}, width = r_size.width})
                end
                if self.lineUpTime2 then
                    if time > 0 then
                        self.lineUpTime2:setString(secondParse(time))
                    else
                        self.lineUpTime2:setString("< 1分钟")
                    end
                    setMidPosition({nodes = {self.lineUpTime1, self.lineUpTime2}, width = r_size.width})
                end
            end
        end
    end

    local onActiveRet = function(luaBuffer)
        local retTable = g_msgHandlerInst:convertBufferToTable("LoginActiveUserRet", luaBuffer)
        local ret = retTable.code
        if ret == 0 then
            TIPS({ str = game.getStrByKey("active_code_suc") , isMustShow = true })
            if self.activeLayer then
                removeFromParent(self.activeLayer)
                self.activeLayer = nil
            end
        elseif ret == -1 then
            TIPS({ str = game.getStrByKey("active_code_fal1") , isMustShow = true })
        elseif ret == -2 then
            TIPS({ str = game.getStrByKey("active_code_fal2") , isMustShow = true })
        end
    end
    --g_msgHandlerInst:registerMsgHandler(LOGIN_SC_CREATEUSER, onRegister)
    --g_msgHandlerInst:registerMsgHandler(LOGIN_SC_SESSION, onLogin)
    g_msgHandlerInst:registerMsgHandler(LOGIN_SC_GATEWAY_INFO, onSelectServer)
    --g_msgHandlerInst:registerMsgHandler(LOGIN_SC_ACTIVE_USER, onActiveRet)
    --g_msgHandlerInst:registerMsgHandler(LOGIN_SC_WORLDUPDATE, onLineUp)
end

return LoginScene

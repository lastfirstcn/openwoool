
--------------------------------------------
---- Role Create Scene
--------------------------------------------
local RoleCreateScene = class("RoleCreateScene",function() return cc.Scene:create() end)

function RoleCreateScene:ctor()

    -- 播放声音
    if not AudioEnginer.isBackgroundMusicPlaying() then
        AudioEnginer.playMusic("sounds/login.mp3",true)
    end

    -- 和服务器通信的消息ID
    local messageIds = {LOGIN_SC_CREATEPLAYER,LOGIN_SC_DELETE_PLAYER}
    require("src/MsgHandler").new(self,messageIds)

    self:init()
end

function RoleCreateScene:init()

    self._currentLayerIndex = 1
    self._backgroundLayer = nil
    self._roleInputLayer = nil
    self._roleCreateLayer = nil
    self._roleSelectLayer = nil
    self._roleInfo = {}
    self._roleSpriteTable = {}

    self._roleSelectSpriteTable = {}
    self._roleSelectNameTable = {}
    self._roleSelectLvTable = {}
    self._roleDeleteTable = {}

    self._currentCreateRole = nil
    self._currentSelectRole = nil

    self._editName = nil
    self._exButton1 = nil
    self._sexButton2 = nil
    self._jobButton1 = nil
    self._jobButton2 = nil
    self._jobButton3 = nil
    self._jobTips = nil
    self._startButton = nil
    self._scale = 1.0

    self._backgroundLayer = self:BackgroundLayer()
    self:addChild(self._backgroundLayer)

    --[[
    record.RoleID = tempRoleInfo.roleID
    record.Name = tempRoleInfo.name
    record.Level = tempRoleInfo.level
    record.WorldName = tempRoleInfo.worldName
    record.School = tempRoleInfo.school
    record.Sex = tempRoleInfo.sex
    record.MapID = tempRoleInfo.mapID
    ]]

    if g_roleTable and #g_roleTable > 0 then

        self._roleSelectLayer = self:RoleSelectLayer()
        self:addChild(self._roleSelectLayer)
        self:selectRole(g_roleTable[1],1)
        self._currentLayerIndex = 3

    else
        self._roleCreateLayer = self:RoleCreateLayer()
        self:addChild(self._roleCreateLayer)
        self._currentLayerIndex = 4
    end

end

function RoleCreateScene:BackgroundLayer()

    local bgLayer = cc.Layer:create()

    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local origin = cc.Director:getInstance():getVisibleOrigin()

    local bg = cc.Sprite:create("res/create_role/bg.jpg")
    bg:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
    self._scale = visibleSize.width / bg:getContentSize().width

    cclog("获得屏幕的缩放比例：" .. self._scale)
    bg:setScale(self._scale)



    local bgBottom = cc.Sprite:create("res/create_role/bg_bottom.png")
    bgBottom:setAnchorPoint(cc.p(0.5, 0.5) )
    bgBottom:setPosition(origin.x + bgBottom:getContentSize().width / 2 * self._scale, origin.y + bgBottom:getContentSize().height / 2 * self._scale)
    bgBottom:setScale(self._scale)

    -- 角色Id 和 等级
    local roleIdLv1 = cc.Sprite:create("res/create_role/idlv.png")
    roleIdLv1:setPosition(origin.x + visibleSize.width * 0.25,origin.y + 40 * self._scale)
    roleIdLv1:setAnchorPoint(cc.p(0.5, 0.5))
    roleIdLv1:setScale(self._scale)

    local roleIdLv2 = cc.Sprite:create("res/create_role/idlv.png")
    roleIdLv2:setPosition(origin.x + visibleSize.width * 0.75 ,origin.y + 40 * self._scale)
    roleIdLv2:setAnchorPoint(cc.p(0.5, 0.5))
    roleIdLv2:setScale(self._scale)


    local roleIdRight = cc.Sprite:create("res/create_role/modillion.png")
    roleIdRight:setPosition(origin.x + visibleSize.width - roleIdRight:getContentSize().width/2 * self._scale,origin.y + roleIdRight:getContentSize().height/2 * self._scale)
    roleIdRight:setAnchorPoint(cc.p(0.5, 0.5))
    roleIdRight:setScale(self._scale)

    local roleIdLeft = cc.Sprite:create("res/create_role/modillion.png")
    roleIdLeft:setAnchorPoint(cc.p(0.5, 0.5))
    roleIdLeft:setPosition(origin.x + roleIdLeft:getContentSize().width/2 * self._scale,origin.y + roleIdLeft:getContentSize().height/2 * self._scale)
    roleIdLeft:setFlippedX(true)
    roleIdLeft:setScale(self._scale)

    bgLayer:addChild(bg)
    bgLayer:addChild(bgBottom)
    bgLayer:addChild(roleIdLv1)
    bgLayer:addChild(roleIdLv2)
    bgLayer:addChild(roleIdLeft)
    bgLayer:addChild(roleIdRight)

    -- 返回按钮  回到登录
    local backButton = YMUIHelper.createScaleImageButton(bgLayer,"res/create_role/back_btn.png",function(node)
        if self._currentLayerIndex == 3 then
            self._roleSelectLayer:removeFromParent()
            self._roleSelectLayer = nil
            local LoginScene = require("src/login/LoginScene")
            local scene = LoginScene.new()
            cc.Director:getInstance():replaceScene(scene)

        elseif self._currentLayerIndex == 4 then
            self:showRoleSelectLayer()
        end
    end);
    backButton:setPosition(origin.x + backButton:getContentSize().width/2 + 30,origin.y + visibleSize.height - backButton:getContentSize().height/2 - 30)
    backButton:setScale(0.8)



    return bgLayer
end

function RoleCreateScene:RoleSelectLayer()

    self._roleSelectSpriteTable = {}
    self._roleSelectNameTable = {}
    self._roleSelectLvTable = {}
    self._currentSelectRole = nil

    local origin = cc.Director:getInstance():getVisibleOrigin()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local layer = cc.Layer:create()
    local roleData = g_roleTable
    local createRoleButton = YMUIHelper.createScaleImageButton(layer,"res/create_role/new_role.png",function(node)

        if #roleData > 1 then
            TIPS({ type = 1 ,str= "最多能创建2个角色哦！" , isMustShow = true})
            --YMUIHelper.showToast(layer,"最多能创建2个角色哦！")
            return
        end
        self._roleSelectLayer:removeFromParent()
        self._roleSelectLayer = nil

        self._roleCreateLayer = self:RoleCreateLayer()
        self:addChild(self._roleCreateLayer)
        self._currentLayerIndex = 4

    end);
    createRoleButton:setPosition(visibleSize.width - createRoleButton:getContentSize().width/2 * 1 - 30,origin.y + visibleSize.height - createRoleButton:getContentSize().height/2 * 1 - 30)
    createRoleButton:setScale(0.8)

    local deleteFunc = function(role)
        AudioEngine.playEffect("sounds/liuVoice/68.mp3", false)

        local yesCallback = function()
            local yesCallback1 = function()
                local t = {}
                t.userID = userInfo.userId
                t.roleID = role.RoleID;
                t.sessionToken = userInfo.sessionToken
                g_msgHandlerInst:sendNetDataByTableEx(LOGIN_CS_DELETE_PLAYER, "LoginDeletePlayerReq", t)
                addNetLoading(LOGIN_CS_DELETE_PLAYER, LOGIN_SC_DELETE_PLAYER, false, 1, 2)
                self.isSend = true
                performWithDelay(self,function() self.isSend = false end ,2.0)
            end
            local noCallback1 = function()
            end
            MessageBoxYesNo(game.getStrByKey("tip"),"删除角色后，将会清除角色所有数据！！！！确定删除？？？",yesCallback1,noCallback1,game.getStrByKey("sure"),game.getStrByKey("cancel"))
        end
        local noCallback = function()
        end
        MessageBoxYesNo(game.getStrByKey("tip"),"确定要删除角色[" .. role.Name .. "]吗?",yesCallback,noCallback,game.getStrByKey("sure"),game.getStrByKey("cancel"))
    end

    local manageRoleButton = YMUIHelper.createScaleImageButton(layer,"res/create_role/manage.png",function(node)

        for i=1,#self._roleDeleteTable do
            if self._roleDeleteTable[i]:isVisible() then
                self._roleDeleteTable[i]:setVisible(false)
            else
                self._roleDeleteTable[i]:setVisible(true)
            end

        end
    end);

    manageRoleButton:setPosition(visibleSize.width - manageRoleButton:getContentSize().width/2 - 30,origin.y + visibleSize.height - manageRoleButton:getContentSize().height/2 * 2 - 70)
    manageRoleButton:setScale(0.8)
    manageRoleButton:setLocalZOrder(9)

    for i=1, #roleData do

        local cache = cc.SpriteFrameCache:getInstance()
        local plistPath1 = "res/create_role/plist/create_role_" .. roleData[i].School .. "_" .. roleData[i].Sex .."_stand@0.plist";
        local plistPath2 = "res/create_role/plist/create_role_" .. roleData[i].School .. "_" .. roleData[i].Sex .."_show@0.plist";
        cache:addSpriteFrames(plistPath1)
        cache:addSpriteFrames(plistPath2)

        local rolePath = "create_role_" .. roleData[i].School .. "_" .. roleData[i].Sex .."_stand";
        cclog("rolePath:" .. rolePath)

        local roleSprite = cc.Sprite:createWithSpriteFrameName(rolePath .. "/00000.png")
        if i==1 then
            roleSprite:setPosition(visibleSize.width/2 - 300,visibleSize.height/2 -50)
        else
            roleSprite:setPosition(visibleSize.width/2 + 300,visibleSize.height/2 -50)
        end
        roleSprite:setScale(0.8)
        self:runSpriteAction(roleSprite,roleData[i],"stand")
        layer:addChild(roleSprite)

        self._roleSelectSpriteTable[i] = roleSprite
        self:addSpriteTouchEvent(roleData[i],i)

        local loc = 0.25
        if i == 1 then
            loc = 0.25
        else
            loc = 0.75
        end

        local nameLabel = YMUIHelper.createTTFLabel(roleData[i].Name,16)
        nameLabel:setTextColor( cc.c3b(153, 153, 153) )
        nameLabel:setPosition( cc.p(origin.x + visibleSize.width * loc - 30 * self._scale,origin.y + 42 * self._scale) )
        layer:addChild(nameLabel)
        self._roleSelectNameTable[i] = nameLabel

        local lvLabel = YMUIHelper.createTTFLabel(roleData[i].Level,16)
        lvLabel:setTextColor( cc.c3b(153, 153, 153) )
        lvLabel:setPosition( cc.p(origin.x + visibleSize.width * loc + 146 * self._scale,origin.y + 42 * self._scale) )
        layer:addChild(lvLabel)
        self._roleSelectLvTable[i] = lvLabel

        local deleteButton = YMUIHelper.createButton("",18,"res/component/button/x2.png","res/component/button/x2_sel.png",nil,function(node)
            deleteFunc(roleData[i])
        end);

        deleteButton:setPosition(roleSprite:getContentSize().width/2,roleSprite:getContentSize().height/2 + 220)
        deleteButton:setVisible(false)
        roleSprite:addChild(deleteButton)
        self._roleDeleteTable[i] = deleteButton

    end

    self._startButton = YMUIHelper.createButton("",20,"res/create_role/start_btn.png", "res/create_role/start_btn_disable.png");
    self._startButton:setPosition(cc.p(origin.x + visibleSize.width/2,origin.y + 32 * self._scale))
    self._startButton:setScale(self._scale)
    self._startButton:setLocalZOrder(9)
    self._startButton:addClickEventListener(function(sender)
        -- 全局的角色信息
        CURRENT_ROLE = self._currentSelectRole
        self:startGame(self._currentSelectRole.RoleID)
    end)
    layer:addChild(self._startButton)


    self._startButton2 = YMUIHelper.createButton("",20,"res/create_role/start_btn.png", "res/create_role/start_btn_disable.png");
    self._startButton2:setPosition(cc.p(origin.x + visibleSize.width/2,origin.y + visibleSize.height - 50))
    self._startButton2:setScale(self._scale)
    self._startButton2:setLocalZOrder(9)
    self._startButton2:addClickEventListener(function(sender)
        -- 全局的角色信息
        CURRENT_ROLE = self._currentSelectRole
        self:startGame(self._currentSelectRole.RoleID)
    end)
    layer:addChild(self._startButton2)

    return layer
end

function RoleCreateScene:startGame(roleId)
    __G_ON_CREATE_ROLE = nil
    if roleId then
        AudioEnginer.playEffect("sounds/uiMusic/ui_enter.mp3", false)

        self:saveLoginHistory()

        game.goToScenes("src/login/OpenDoor", roleId)
        setLocalRecordByKey(2,"lastRoleID", roleId)
    else
        AudioEnginer.playEffect("sounds/uiMusic/ui_role.mp3", false)
    end
end

function RoleCreateScene:RoleCreateLayer()

    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local layer = cc.Layer:create()

    self._roleInfo = {
        {id = 1, School = 1, Sex = 1, x = visibleSize.width/2 - 110/0.81 * self._scale, y = visibleSize.height/2 + 85/0.81 * self._scale,scale= 0.4, interval = 110},
        {id = 2, School = 1, Sex = 2, x = visibleSize.width/2 + 180/0.81 * self._scale, y = visibleSize.height/2 + 90/0.81 * self._scale,scale= 0.4, interval = 118},
        {id = 3, School = 2, Sex = 1, x = visibleSize.width/2 - 320/0.81 * self._scale, y = visibleSize.height/2 - 50/0.81 * self._scale,scale= 0.65, interval = 115},
        {id = 4, School = 2, Sex = 2, x = visibleSize.width/2 + 300/0.81 * self._scale, y = visibleSize.height/2 - 50/0.81 * self._scale,scale= 0.65, interval = 105},
        {id = 5, School = 3, Sex = 1, x = visibleSize.width/2 - 220/0.81 * self._scale, y = visibleSize.height/2 + 30/0.81 * self._scale,scale= 0.45, interval = 108},
        {id = 6, School = 3, Sex = 2, x = visibleSize.width/2 + 250/0.81 * self._scale, y = visibleSize.height/2 + 35/0.81 * self._scale,scale= 0.45, interval = 112},
    }

    for i=1, #self._roleInfo do

        local cache = cc.SpriteFrameCache:getInstance()
        local plistPath1 = "res/create_role/plist/create_role_" .. self._roleInfo[i].School .. "_" .. self._roleInfo[i].Sex .."_stand@0.plist";
        local plistPath2 = "res/create_role/plist/create_role_" .. self._roleInfo[i].School .. "_" .. self._roleInfo[i].Sex .."_show@0.plist";
        cache:addSpriteFrames(plistPath1)
        cache:addSpriteFrames(plistPath2)

        local rolePath = "create_role_" .. self._roleInfo[i].School .. "_" .. self._roleInfo[i].Sex .. "_stand";
        local roleSprite = cc.Sprite:createWithSpriteFrameName(rolePath .. "/00000.png")
        roleSprite:setPosition(cc.p(self._roleInfo[i].x, self._roleInfo[i].y))
        roleSprite:setScale(self._roleInfo[i].scale)
        self:runSpriteAction(roleSprite,self._roleInfo[i],"stand")
        layer:addChild(roleSprite)

        self._roleSpriteTable[i] = roleSprite
        self:addSpriteTouchEvent(self._roleInfo[i],0)

    end

    local createRoleTip = cc.Sprite:create("res/create_role/new_role_tip.png")
    createRoleTip:setAnchorPoint(cc.p(0.5,0.5))
    createRoleTip:setPosition(visibleSize.width/2,120)
    createRoleTip:setScale(0.8)
    layer:addChild(createRoleTip)

    return layer
end

function RoleCreateScene:RoleInputLayer()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local origin = cc.Director:getInstance():getVisibleOrigin()
    local layer = cc.Layer:create()
    local bg = cc.Sprite:create("res/create_role/bg_dialog.png")
    local x = origin.x + visibleSize.width - bg:getContentSize().width/2 * self._scale - 100
    local y = origin.y + visibleSize.height / 2
    bg:setPosition(x, y)
    bg:setAnchorPoint(cc.p(0.5,0.5))
    bg:setScale(self._scale)
    layer:addChild(bg)

    local labelTitle = cc.Sprite:create("res/create_role/label_title.png")
    labelTitle:setPosition(bg:getContentSize().width/2,bg:getContentSize().height - labelTitle:getContentSize().height/2 - 33)
    bg:addChild(labelTitle)

    local bgWidth = bg:getContentSize().width * self._scale
    local bgHeight = bg:getContentSize().height * self._scale

    local nameBackground = cc.Sprite:create("res/common/edit_box_bg.png",cc.size(bgWidth * 0.8, 36))
    nameBackground:setAnchorPoint(cc.p(0,0.5))
    nameBackground:setPosition(45,bg:getContentSize().height - 115)
    bg:addChild(nameBackground)

    self._editName = YMUIHelper.createEditBox("请输入角色名称",cc.size(bgWidth * 0.8, 36),20)
    self._editName:setAnchorPoint(cc.p(0,0.5))
    self._editName:setPosition(45,bg:getContentSize().height - 115)
    bg:addChild(self._editName)


    local label1 = cc.Sprite:create("res/create_role/label_1.png")
    label1:setAnchorPoint(cc.p(0,0.5))
    label1:setPosition(45,bg:getContentSize().height - 175)
    bg:addChild(label1)

    self._sexButton1 = YMUIHelper.createButton("",20,"res/create_role/1_1.png", "res/create_role/1_0.png");
    self._sexButton1:setPosition(145,bg:getContentSize().height - 175)
    self._sexButton1:addClickEventListener(function(sender)
        if self._currentCreateRole.Sex ~= 1 then
            self:createRole(self._roleInfo[self._currentCreateRole.id-1])
        else
            self._sexButton1:setBrightStyle(1)
        end
    end)
    bg:addChild(self._sexButton1)

    self._sexButton2 = YMUIHelper.createButton("",20,"res/create_role/2_1.png", "res/create_role/2_0.png");
    self._sexButton2:setPosition(200,bg:getContentSize().height - 175)
    self._sexButton2:addClickEventListener(function(sender)
        if self._currentCreateRole.Sex ~= 2 then
            self:createRole(self._roleInfo[self._currentCreateRole.id+1])
        else
            self._sexButton2:setBrightStyle(1)
        end
    end)
    bg:addChild(self._sexButton2)

    -- 职业
    local label2 = cc.Sprite:create("res/create_role/label_2.png")
    label2:setAnchorPoint(cc.p(0,0.5))
    label2:setPosition(45,bg:getContentSize().height - 230)
    bg:addChild(label2)

    self._jobButton1 = YMUIHelper.createButton("",20,"res/create_role/3_1.png", "res/create_role/3_0.png");
    self._jobButton1:setPosition(145,bg:getContentSize().height - 230)
    self._jobButton1:addClickEventListener(function(sender)
        if self._currentCreateRole.School ~= 1 then
            if self._currentCreateRole.School == 2 then
                self:createRole(self._roleInfo[self._currentCreateRole.id - 2])
            else
                self:createRole(self._roleInfo[self._currentCreateRole.id - 4])
            end
        else
            self._jobButton1:setBrightStyle(1)
        end
    end)
    bg:addChild(self._jobButton1)

    local jobLabel1 = cc.Sprite:create("res/create_role/job_1.png")
    jobLabel1:setAnchorPoint(cc.p(0,0.5))
    jobLabel1:setPosition(190,bg:getContentSize().height - 230)
    bg:addChild(jobLabel1)

    self._jobButton2 = YMUIHelper.createButton("",20,"res/create_role/4_1.png", "res/create_role/4_0.png","create_role/4_1.png");
    self._jobButton2:setPosition(145,bg:getContentSize().height - 285)
    self._jobButton2:addClickEventListener(function(sender)

        if self._currentCreateRole.School ~= 2 then
            if self._currentCreateRole.School == 1 then
                self:createRole(self._roleInfo[self._currentCreateRole.id + 2])
            else
                self:createRole(self._roleInfo[self._currentCreateRole.id - 2])
            end
        else
            self._jobButton2:setBrightStyle(1)
        end
    end)
    bg:addChild(self._jobButton2)

    local jobLabel2 = cc.Sprite:create("res/create_role/job_2.png")
    jobLabel2:setAnchorPoint(cc.p(0,0.5))
    jobLabel2:setPosition(190,bg:getContentSize().height - 285)
    bg:addChild(jobLabel2)

    self._jobButton3 = YMUIHelper.createButton("",20,"res/create_role/5_1.png", "res/create_role/5_0.png","create_role/5_1.png");
    self._jobButton3:setPosition(145,bg:getContentSize().height -340)
    self._jobButton3:addClickEventListener(function(sender)
        if self._currentCreateRole.School ~= 3 then
            if self._currentCreateRole.School == 1 then
                self:createRole(self._roleInfo[self._currentCreateRole.id + 4])
            else
                self:createRole(self._roleInfo[self._currentCreateRole.id + 2])
            end
        else
            self._jobButton3:setBrightStyle(1)
        end
    end)
    bg:addChild(self._jobButton3)

    local jobLabel3 = cc.Sprite:create("res/create_role/job_3.png")
    jobLabel3:setAnchorPoint(cc.p(0,0.5))
    jobLabel3:setPosition(190,bg:getContentSize().height -340)
    bg:addChild(jobLabel3)


    self._jobTips = ccui.ImageView:create("res/create_role/tips_1.png");
    self._jobTips:setAnchorPoint(cc.p(0.5,0.5))
    self._jobTips:setPosition(bg:getContentSize().width/2,bg:getContentSize().height -430)
    bg:addChild(self._jobTips)

    local createButton = YMUIHelper.createScaleButton("确定",20,"res/create_role/create_btn.png",function(node)

        if self.isSend then
            return
        end
        local txt = self._editName:getText()

        if self:checkNameRule(txt) == false then
            return
        else
            self:createRoleFinish()
        end

    end);
    createButton:setPosition(bg:getContentSize().width/2,bg:getContentSize().height -530)
    bg:addChild(createButton)

    local cancelButton = YMUIHelper.createButton("",18,"res/component/button/x2.png","res/component/button/x2_sel.png",nil,function(node)
        self:resetCreateRole()
    end);
    cancelButton:setAnchorPoint(cc.p(1, 1) )
    cancelButton:setPosition(bg:getContentSize().width,bg:getContentSize().height)
    bg:addChild(cancelButton)

    return layer
end



function RoleCreateScene:addSpriteTouchEvent(role,id)

    --触摸处理函数
    local function onTouchBegan( touch,event )
        local target = event:getCurrentTarget()
        local x,y = target:getPosition()
        local rect = YMHelper.getCollisionRect(cc.p(x, y),100,200)

        if cc.rectContainsPoint(rect, touch:getLocation()) then
            if id == 0 then
                self:createRole(role)
            else
                self:selectRole(role,id)
            end

            return true
        end
        --必须设置不然拖动屏幕精灵也会移动
        return false

    end

    local function onTouchEnded( touch,event )

    end

    local function onTouchMoved(touch,event )
        local target = event:getCurrentTarget()
        local x,y = target:getPosition()
        --target:setPosition(cc.p(x + touch:getDelta().x, y + touch:getDelta().y))
    end

    -- 创建触摸监听事件
    local listener = cc.EventListenerTouchOneByOne:create()
    -- 吞没事件
    listener:setSwallowTouches(true);
    --将触摸结束事件与处理函数绑定
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED)
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED)

    --获取eventDispatcher
    local eventDispatcher = self:getEventDispatcher()
    --将监听事件绑定到精灵上
    if id == 0 then
        eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self._roleSpriteTable[role.id])
    else
        eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self._roleSelectSpriteTable[id])
    end

end
function RoleCreateScene:resetCreateRole()
    self._currentCreateRole = nil
    self._roleInputLayer:setVisible(false)
    self._currentLayerIndex = 4
    for i= 1, #self._roleSpriteTable do
        self._roleSpriteTable[i]:setPosition(cc.p(self._roleInfo[i].x, self._roleInfo[i].y))
        self._roleSpriteTable[i]:setScale(self._roleInfo[i].scale)
        self._roleSpriteTable[i]:setLocalZOrder(1)
        self:runSpriteAction(self._roleSpriteTable[i],self._roleInfo[i],"stand")

    end
end

function RoleCreateScene:createRole(role)
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    self._currentCreateRole = role

    if self._roleInputLayer == nil then
        self._roleInputLayer = self:RoleInputLayer()
        self:addChild(self._roleInputLayer)
    else
        self._roleInputLayer:setVisible(true)
    end

    self._currentLayerIndex = 4
    for i= 1, #self._roleSpriteTable do

        if i == role.id then
            self._roleSpriteTable[i]:setPosition( cc.p( visibleSize.width/2, visibleSize.height/2 - 50) )
            self._roleSpriteTable[i]:setScale(0.8)
            self._roleSpriteTable[i]:setLocalZOrder(9)
            self:runSpriteAction(self._roleSpriteTable[i],role,"show")

            if role.Sex == 1 then
                self._sexButton1:setBrightStyle(1)
                self._sexButton2:setBrightStyle(0)
            else
                self._sexButton1:setBrightStyle(0)
                self._sexButton2:setBrightStyle(1)
            end

            if role.School == 1 then
                self._jobButton1:setBrightStyle(1) --选中样式
                self._jobButton2:setBrightStyle(0) --不选中样式
                self._jobButton3:setBrightStyle(0) --不选中样式
                self._jobTips:loadTexture("res/create_role/tips_1.png")

            elseif role.School == 2 then
                self._jobButton1:setBrightStyle(0)
                self._jobButton2:setBrightStyle(1)
                self._jobButton3:setBrightStyle(0)
                self._jobTips:loadTexture("res/create_role/tips_2.png");
            else
                self._jobButton1:setBrightStyle(0)
                self._jobButton2:setBrightStyle(0)
                self._jobButton3:setBrightStyle(1)
                self._jobTips:loadTexture("res/create_role/tips_3.png");
            end

        else
            self._roleSpriteTable[i]:setPosition(cc.p(self._roleInfo[i].x, self._roleInfo[i].y))
            self._roleSpriteTable[i]:setScale(self._roleInfo[i].scale)
            self._roleSpriteTable[i]:setLocalZOrder(1)
            self:runSpriteAction(self._roleSpriteTable[i],self._roleInfo[i],"stand")
        end

    end

end

function RoleCreateScene:selectRole(role,index)
    cclog("选择角色：" .. role.Name .. "," .. index)
    self._currentSelectRole = role
    for i = 1,#self._roleSelectSpriteTable do
        if i == index then
            self._roleSelectSpriteTable[i]:setLocalZOrder(2)
            -- 设置回原来的颜色
            self._roleSelectSpriteTable[i]:setColor(cc.c3b(255, 255, 255))
            self._roleSelectSpriteTable[i]:setOpacity(255)
            self:runSpriteAction(self._roleSelectSpriteTable[i],role,"show")

            self._roleSelectNameTable[i]:setTextColor( cc.c3b(0, 250, 154) )
            self._roleSelectLvTable[i]:setTextColor( cc.c3b(0, 250, 154) )
        else
            self._roleSelectSpriteTable[i]:setColor(cc.c3b(153, 153, 153))
            self._roleSelectNameTable[i]:setTextColor( cc.c3b(153, 153, 153) )
            self._roleSelectLvTable[i]:setTextColor( cc.c3b(153, 153, 153) )
            self._roleSelectSpriteTable[i]:setOpacity(200)
            self._roleSelectSpriteTable[i]:setLocalZOrder(1)
        end
    end
end

function RoleCreateScene:runSpriteAction(sprite,role,state)
    sprite:stopAllActions()
    local rolePath = "create_role_" .. role.School .. "_" .. role.Sex .. "_" .. state .. "/000";
    local animFrames = YMHelper.getAnimFrames(rolePath,40)
    local animation = cc.Animation:createWithSpriteFrames(animFrames, 0.1)
    if state == "stand" then
        sprite:runAction(cc.RepeatForever:create( cc.Animate:create(animation) ))
    else
        local sequence = cc.Sequence:create(cc.Animate:create(animation),cc.CallFunc:create(function()
            self:runSpriteAction(sprite,role,"stand")
        end))
        sprite:runAction(sequence)
    end

end


function RoleCreateScene:createRoleFinish()

    local t = {}
    t.userName = self._editName:getText()
    t.sex = self._currentCreateRole.Sex
    t.userID = userInfo.userId
    t.worldID = userInfo.serverId
    t.school = self._currentCreateRole.School
    t.modelID = 1;
    t.worldName	= userInfo.serverName
    dump(t)

    -- 发送数据给服务器
    g_msgHandlerInst:sendNetDataByTableEx(LOGIN_CS_CREATEPLAYER, "LoginCreatePlayer", t)

    -- Loading框
    addNetLoading(LOGIN_CS_CREATEPLAYER, LOGIN_SC_CREATEPLAYER, false, 1, 2)
    self.isSend = true
    performWithDelay(self,function() self.isSend = false end ,2.0)

end

function RoleCreateScene:saveLoginHistory()
    local serStr = getLocalRecordByKey(2, "loginHistory" .. sdkGetOpenId(), "")

    local json = require("json")
    local ret = json.decode(serStr)
    local flg = true
    if ret and #ret > 0 then
        for i,v in ipairs(ret) do
            if v == userInfo.serverId then
                flg = false
                break
            end
        end
    else
        ret = {}
    end

    if flg then
        ret[#ret + 1] = userInfo.serverId
        serStr = json.encode(ret)

        setLocalRecordByKey(2, "loginHistory" .. sdkGetOpenId(), serStr)

        --发送创建角色信息到dir服务器
        local function serverListConnected()
            weakCallbackTab.onServerListConnected = nil
            ServerList.sendLoginServer(sdkGetArea(), userInfo.serverId, true)
        end

        if ServerList.isConnected() then
            serverListConnected()
        else
            weakCallbackTab.onServerListConnected = serverListConnected
            ServerList.connect()
        end

    end
end

-- 1：不能以空格开头、也不能以空格结尾
-- 2：不能以传奇世界、传世、GM、gm、官方、活动XX、宣传XX、推广XX、
-- 3：取名不支持换行
function RoleCreateScene:checkNameRule(name)

    if string.find(name, " ") or string.find(name, "%^") then
        TIPS({ type = 1 , str = game.getStrByKey("invilid_symbol") , isMustShow = true})
        return
    end

    if string.utf8sub(name, 0, 1) == " " then
        TIPS({ type = 1 , str = game.getStrByKey("role_name_rule_1") , isMustShow = true})
        return false
    elseif string.utf8sub(name, -1) == " " then
        TIPS({ type = 1 , str = game.getStrByKey("role_name_rule_1") , isMustShow = true})
        return false
    end

    local word = {"传奇世界", "传世", "GM", "gm", "官方", "活动", "宣传", "推广"}
    for i,v in ipairs(word) do
        if string.find(name, v) then
            --TIPS({ type = 1 , str = string.format(game.getStrByKey("role_name_rule_2"), v) , isMustShow = true})
            TIPS({ type = 1 , str = game.getStrByKey("invilid_symbol") , isMustShow = true})
            return false
        end
    end

    if string.find(name, "\n") or string.find(name, "\r") then
        TIPS({ type = 1 , str = game.getStrByKey("role_name_rule_3") , isMustShow = true})
        return false
    end

    if DirtyWords:isHaveDirytWords(name) then
        TIPS({ type = 1 , str = game.getStrByKey("invilid_namelen_ex") , isMustShow = true})
        return false;
    end

    require("src/utf8");
    if string.utf8len(name) > 6 then
        TIPS({ type = 1 , str = game.getStrByKey("login_tip_too_long") , isMustShow = true})
        return false;
    end
    return true
end

-- 服务器返回消息LOGIN_SC_CREATEPLAYER
function RoleCreateScene:networkHander(luaBuffer,msgid)
    cclog("RoleCreateScene:networkHander....................................")
    local switch = {
        [LOGIN_SC_CREATEPLAYER] = function()
            local t = g_msgHandlerInst:convertBufferToTable("LoginCreatePlayerRet", luaBuffer)
            userInfo.userid = t.userID
            local roleID = t.roleID
            local ret = t.ret

            cclog("创建角色返回：" .. ret)
            if ret == 0 then
                local roleNew = {}
                roleNew.RoleID = roleID
                roleNew.Name = self._editName:getText()
                roleNew.Level = 1
                roleNew.School = self._currentCreateRole.School
                roleNew.Sex = self._currentCreateRole.Sex
                table.insert(g_roleTable,roleNew)
                self:showRoleSelectLayer()

            elseif ret == -1 then
                removeNetLoading()
                MessageBox(game.getStrByKey("create_no_name"))
            elseif ret == -2 then
                removeNetLoading()
                MessageBox(game.getStrByKey("create_same_name"))
            elseif ret == -3 then
                removeNetLoading()
                MessageBox(game.getStrByKey("create_too_long"))
            elseif ret == -4 then
                removeNetLoading()
                MessageBox(game.getStrByKey("create_invalid_char"))
            elseif ret == -5 then
                removeNetLoading()
                MessageBox(game.getStrByKey("create_no_more"))
            else
                removeNetLoading()
                cclog("create role failed!")
            end
            self.isSend = false
        end,

        [LOGIN_SC_DELETE_PLAYER] = function()
            local t = g_msgHandlerInst:convertBufferToTable("LoginDeletePlayerRet", luaBuffer)
            local id = t.roleID
            local flg = t.result
            if flg == 0 then
                cclog("删除角色成功！！！！！！！")
                setLocalRecordByKey( 2 , "activityPopKey" .. tostring(id) , "" )  	--清除角色活动弹出键值
                for k,v in pairs(g_roleTable)do
                    if v["RoleID"] == id then
                        table.remove(g_roleTable,k);
                        break
                    end
                end
                self:showRoleSelectLayer()
            else
                TIPS( {str = game.getStrByKey("login_delPlayer"), isMustShow = true })
            end
        end,
    }
    if switch[msgid] then
        switch[msgid]()
    end
end

function RoleCreateScene:showRoleSelectLayer()

    if self._roleInputLayer ~= nil then
        self._roleInputLayer:removeFromParent()
        self._roleInputLayer = nil
    end

    if self._roleCreateLayer ~= nil then
        self._roleCreateLayer:removeFromParent()
        self._roleCreateLayer = nil
    end

    if self._roleSelectLayer ~= nil then
        self._roleSelectLayer:removeFromParent()
        self._roleSelectLayer = nil
    end


    self._roleSelectLayer = self:RoleSelectLayer()
    self:addChild(self._roleSelectLayer)
    if #g_roleTable > 0 then
        self:selectRole(g_roleTable[#g_roleTable],#g_roleTable)
    end

    self._currentLayerIndex = 3
end

return RoleCreateScene
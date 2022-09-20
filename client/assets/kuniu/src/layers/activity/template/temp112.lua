--[[ 首付 活动 ]]--
local M = class( "temp112" , function() return cc.Node:create() end )
function M:ctor( params )
    DATA_Activity.activityLayer = nil
    getRunScene():addChild( self , 200 )
    local base_node = createSprite( self , "res/layers/activity/cell/first_pay/1.png" , cc.p( display.cx , display.cy ) , cc.p( 0.5 , 0.5 ) )
    local func = function() removeFromParent(self) end
    registerOutsideCloseFunc(base_node, func ,true)
    local close_btn = createMenuItem( base_node , "res/component/button/x2.png", cc.p( base_node:getContentSize().width-60 , base_node:getContentSize().height-50 ) , func )

    createSprite( base_node , "res/layers/activity/cell/first_pay/2.png" ,  cc.p( 400  , base_node:getContentSize().height/2+44 ) , cc.p( 0 , 0.5 ) )
    createSprite( base_node , "res/layers/activity/cell/first_pay/award_bg.png" ,  cc.p( 57 + 35 + 135  , 57 + 20 ) , cc.p( 0 , 0 ) )
    createSprite( base_node , "res/layers/activity/cell/first_pay/text.png" ,  cc.p( base_node:getContentSize().width - 260 , 215 ) , cc.p( 1 , 0 ) )

    local school = MRoleStruct:getAttr(ROLE_SCHOOL)
    school = school or 1
    local effX = 20
    local effY = 0
    local arms = createSprite( base_node , "res/layers/activity/cell/first_pay/arms" .. school .. ".png" ,  cc.p( effX + ( school == 1 and 145 or 140 ) , effY + 250 ) , cc.p( 0.5 , 0.5 ) , 1 )
    local effect = Effects:create(false)
    effect:playActionData( "firstCharge" ,  19 , 4 , -1 )
    base_node:addChild( effect  )
    effect:setAnchorPoint( cc.p( 0 , 0 ) )
    effect:setPosition( cc.p( effX , effY ) )
    effect:setScale(1.2)

    self.viewLayer = cc.Node:create()
    base_node:addChild( self.viewLayer )

    local function createLayout()
        if self.viewLayer then self.viewLayer:removeAllChildren() end
        self.data = DATA_Activity.CData["netData"]

        if self.data == nil then
            return
        end

        local awards = copyTable( self.data.awards )
        for key , v in pairs( awards ) do
            v.noFrame = true
        end

        local groupAwards = __createAwardGroup( awards , false , 100 , nil , false )
        setNodeAttr( groupAwards , cc.p( 253 , 80 ) , cc.p( 0 , 0 ) )
        self.viewLayer:addChild( groupAwards )
        local icons = groupAwards:getIcons()
        for key , v in pairs( icons ) do
            local eff = Effects:create(false)
            eff:playActionData2("firstChargeBg", 250 , -1 , 0 )
            setNodeAttr( eff , cc.p( 42 , 48  ) , cc.p( 0.5 , 0.5 ) )
            --eff:setScale( 1.2 )
            --eff:setRenderMode(1)
            v:addChild( eff , -1 )
        end

        local function getFun()
            if self.data.state == 1 then
                removeFromParent(self)
                __GotoTarget( { ru = "a33" } )
            elseif self.data.state == 0 then

                -- 其他的活动是从服务端领取的
                -- DATA_Activity:getAward( { awards = self.data.awards }  )

                -- 领取物品
                self:getFirstPayItems()
            end
        end

        if self.data.state == 1 then
            local payBtn = createMenuItem( self.viewLayer , "res/layers/activity/cell/first_pay/btncz.png" , cc.p( base_node:getContentSize().width/2 , 30 ) , getFun )
            payBtn:setEnabled( true )
        else
            local payBtn = createMenuItem( self.viewLayer , "res/component/button/8.png" , cc.p( base_node:getContentSize().width/2 , 30 ) , getFun )
            payBtn:setEnabled( self.data.state ~= 2 )

            local strCfg = { game.getStrByKey( "get_awards" )  , game.getStrByKey("pay100") , game.getStrByKey( "getOver" ) }
            createLabel( payBtn , strCfg[self.data.state+1] , getCenterPos( payBtn ) , cc.p( 0.5 , 0.5 ) , 23 , true , nil , nil , MColor.lable_yellow , nil , nil , MColor.black , 3 )
        end
    end

    -- 活动数据请求 服务端目前不支持的首冲活动
    -- DATA_Activity:readData( createLayout )

    -- 首充按钮
    -- TOPBTNMG.checkFirstPay(false)

    createLayout()
end

function M:clearFun()

end


-- 领取首充物品
function M:getFirstPayItems()
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
    xhr:open("POST", YMApiUrl)
    local function onReadyStateChange()
        print("xhr.readyState", xhr.readyState)
        print("xhr.status", xhr.status)
        print("xhr.response", xhr.response)
        if xhr.readyState == 4 and xhr.status == 200 then
            -- 解析json数据
            local responseJson = json.decode(xhr.response)
            if responseJson.code == "1" then
                -- 把首充的按钮隐藏
                TOPBTNMG.firstPayBtn:setVisible(false)
                DATA_Activity.firstData = {}
                DATA_Activity.CData = DATA_Activity.firstData
                MessageBox("充值成功，奖励已发放到邮件中,小退游戏就能收到哦!!!","确定",function()
                    removeFromParent(self)
                end)

            else
                MessageBox(responseJson.message)
            end
        end
    end
    xhr:registerScriptHandler(onReadyStateChange)

    local items = ""
    for i = 1,#self.data.awards do
        --4020111-1-1;203-1-1;20023-10-0;1405-10-1;1043-5-1;

        --3018520708ffe0f40110012801
        --30185207088faff50110012801
        local key = 1
        if self.data.awards[i].id == 103 or self.data.awards[i].id == 20023  then
            key = 0
        end

        items = items .. self.data.awards[i].id .. "-" .. self.data.awards[i].num .. "-" .. key ..";"
    end

    local param = "action=getFirstPay&roleId=" .. CURRENT_ROLE.RoleID .. "&items=" ..  items .. "&token=" ..YMToken

    cclog("领取奖励：" .. param)
    xhr:send(param)
end

return M

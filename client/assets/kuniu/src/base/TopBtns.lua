local TopBtnMg = class("topLayer", function(parent) return createMainUiNode(parent,20) end)
local s = cc.Director:getInstance():getWinSize()

function TopBtnMg:ctor( parent )
  self.BaseMapScene = require("src/base/BaseMapScene")

  TOPBTNMG = self    --定义全局

  local node = cc.Node:create()
  setNodeAttr( node , cc.p(s.width-250,s.height-75) , cc.p( 1.0,1.0 ) )

  local battleShowLv =  tonumber(getConfigItemByKey("NewFunctionCfg", "q_ID", 6).q_level)
  self.btns = {}

  local group1 = cc.Node:create()
  group1:setPosition( 75 , -3 )
  node:addChild( group1 )

  local group2 = cc.Node:create()
  group2:setPosition( -260+118-73 , -73 )
  group2:setAnchorPoint(cc.p(1.0,1.0))
  node:addChild( group2 )
	
  local callback = function() __GotoTarget( {ru = "a256"} ) end 	
  local achievementBtn = createMenuItem(node, "res/mainui/guide_magic_city.png", cc.p(-73*2.5,35), callback)
  achievementBtn :setScale(0.93)

  local iconCfg = {

		{
          name = "Lottery" , --抽奖
          icon = "22.png" ,
          callback = function() __GotoTarget( {ru = "a250"} ) end ,
          group = 1 ,
      },
       {
          name = "YuanBao" , --充值
          icon = "9.png" ,
          callback = function()  __GotoTarget( {ru = "a33"} ) end ,
          group = 1 ,
        } ,

        {
          name = "Gift" , --福利
          icon = "3.png" ,
          callback = function() __GotoTarget( {ru = "a32"} ) end ,
          group = 1 ,
        },

        {
          name = "Battle" , --日常活动
          icon = "2.png" ,
          callback = function()
              -- 先把提示删除
              if TOPBTNMG and TOPBTNMG.battleTips then
                  removeFromParent( TOPBTNMG.battleTips )
                  TOPBTNMG.battleTips = nil
              end
                __GotoTarget( {ru = "a105"} )
              end ,
          group = 2 ,
        } ,

        {
            name = "Shop" , --商城
            icon = "7.png" ,
            callback = function() __GotoTarget( { ru = "a12" } ) end ,
            group = 2 ,
        } ,

        {
          name = "Dictionary" , --传世宝典
          icon = "11.png" ,
          callback = function() __GotoTarget( { ru = "a122" } ) end ,
          group = 2 ,
        } ,

        {
            name = "Week" , --七日盛典
            icon = "14.png" ,
            callback = function() __GotoTarget( {ru = "a190"} ) end ,
            group = 2 ,
        } ,

        {
            name = "Bbs" , --游戏社区
            icon = "13.png" ,
            callback = function() YMHelper.openUrl('bbs') end ,
            group = 2 ,
        } ,
  }

  for i=1,#iconCfg do
    if not G_TOP_STATE[ iconCfg[i]["name"] ] then
        G_TOP_STATE[ iconCfg[i]["name"] ] = { isShow = true , isRed = false }
    end

    local pos = cc.p(73*(i-1.55) - 73,40)
    local add_parent = group2
    if iconCfg[i]["group"] == 1 then
        pos = cc.p(73*(i-2.55) - 73,40)
        add_parent = group1
    end
    local callback = function(hander )
        AudioEnginer.playEffect("sounds/uiMusic/ui_click5.mp3",false)
        local sub_node =  iconCfg[i]["callback"](hander)
        if sub_node then
            getRunScene():addChild(sub_node,200)
        end
      end

    local menu_node = createTouchItem(add_parent, {"mainui/topbtns/".. iconCfg[i]["icon"]}, pos, callback,true)
    menu_node.name = iconCfg[i]["name"]
    self.btns[iconCfg[i]["name"]] = menu_node

    if iconCfg[i]["name"] == "Battle" then
        self.battleTips = createScale9Sprite( menu_node , "res/chat/talkBubble_Low.png" ,   cc.p( 110, 10 ) , cc.size( 256 , 80 ), cc.p( 0 , 0 )  )
        self.battleTips:setRotation(-180)
        local txt = createLabel( self.battleTips , game.getStrByKey("battle_tip3") , cc.p( self.battleTips:getContentSize().width/2 , self.battleTips:getContentSize().height/2 + 10 ) , cc.p( 0.5 , 0.5 ) , 18 , nil , nil , nil , MColor.lable_yellow )
        txt:setRotation(180)
        self.battleTips:setVisible( false )
    elseif iconCfg[i]["name"] == "Lottery" then
        local effLayer = cc.Node:create()
        effLayer:setScale( 0.8 )
        menu_node:addChild( effLayer , - 1 )
        local eff = Effects:create(false)
        eff:playActionData2("firstBtnEffect", 230 , -1 , 0)
        addEffectWithMode(eff,3)
        eff:setPosition(getCenterPos(menu_node))
        menu_node:addChild( eff )
        menu_node.effLayer = effLayer
    end

  end

  --添加红点标记
  for key , v in pairs( self.btns ) do
        v.redFlag = createSprite( v ,getSpriteFrame("mainui/flag/red.png")  , cc.p( v:getContentSize().width - 5 , v:getContentSize().height - 15 ) , cc.p( 0.5 , 0.5 ) )
        v.redFlag:setVisible( false )
        if key == "Battle" then
            -- TOPBTNMG.battle_red_num = createLabel( v.redFlag , "" , cc.p( v.redFlag:getContentSize().width/2 , 18 ) , cc.p( 0.5 , 0.5 ) , 16 , false , nil , nil , MColor.white )
        end
  end

    self:initTopBtnPos()

	self:showMG( "Battle" , G_CONTROL:isFuncOn( GAME_SWITCH_ID_COPY ) )
	G_CONTROL:regCallback( GAME_SWITCH_ID_COPY ,function( _isShow ) self:showMG( "Battle" , _isShow ) end )

   --首充及收缩按钮
   local tempActivityNode = cc.Node:create()
   self.tempActivityNode = tempActivityNode
   setNodeAttr( self.tempActivityNode , cc.p( s.width - 382  , s.height - 37  ) , cc.p( 0 , 0  ) )
   parent:addChild( tempActivityNode , 7 )
   parent.tempActivityNode = tempActivityNode
   tempActivityNode:setVisible(true)

   local effLayer = cc.Node:create()
   self.firstPayBtn = createTouchItem( tempActivityNode , {"mainui/topbtns/1.png"}, cc.p( -50 , 0 ) , function() effLayer:setVisible( false ) __GotoTarget( { ru = "a56"} ) end , true )   --首充按钮
   self.firstPayBtn:setVisible(false)

   effLayer:setScale( 0.8 )
   self.firstPayBtn:addChild( effLayer , - 1 )
   setNodeAttr( effLayer , getCenterPos(self.firstPayBtn) , cc.p( 0.5 , 0.5 ) )
   local eff = Effects:create(false)
   eff:playActionData2("firstBtnEffect", 230 , -1 , 0)
   addEffectWithMode(eff,3)
   eff:setPosition(getCenterPos(self.firstPayBtn))
   self.firstPayBtn:addChild( eff )
   self.firstPayBtn.effLayer = effLayer

   -- 检查首充
   self:checkFirstPay()

  local menu_btn = nil

  local func = function(sender)
    local sender = tolua.cast(sender,"TouchSprite")

    if sender then
      if self.BaseMapScene.Shrank_mode and parent.map_layer and parent.map_layer.isMine then
        return
      end
      self.BaseMapScene.Shrank_mode = not self.BaseMapScene.Shrank_mode
      if self.BaseMapScene.Shrank_mode then
        --sender:setSpriteFrame(getSpriteFrame("mainui/topbtns/left.png"))
        sender:setOpacity(0)
      else
        --sender:setSpriteFrame(getSpriteFrame("mainui/topbtns/right.png"))
        sender:setOpacity(255)
      end
    end

    local actions = {}
    if self.BaseMapScene.Shrank_mode then
      actions[#actions+1] = cc.Spawn:create(cc.ScaleTo:create(0.08,0.01),cc.MoveTo:create(0.08,cc.p(s.width-180,s.height-40)))
      actions[#actions+1] = cc.Hide:create()
      menu_btn.redFlag:setVisible( self:checkRed() )
      if tempActivityNode then
          tempActivityNode:runAction( cc.MoveTo:create(0.08 , cc.p( s.width - 160 , s.height - 40 ) ) )
      end
    else
      actions[#actions+1] = cc.Show:create()
      actions[#actions+1] = cc.Spawn:create(cc.MoveTo:create(0.08,cc.p(s.width - 250,s.height-75)),cc.ScaleTo:create(0.08,1))
      menu_btn.redFlag:setOpacity( 0 )
      if tempActivityNode then
          tempActivityNode:runAction( cc.MoveTo:create(0.08,cc.p( s.width - 382  , s.height - 40 )) )
      end
    end
    node:runAction(cc.Sequence:create(actions))
  end

  menu_btn = createTouchItem( parent , {"mainui/topbtns/right.png"}, cc.p( s.width - 215 + 60 , s.height - 40 ) , func, true )
  createSprite( menu_btn , getSpriteFrame("mainui/topbtns/left.png")  , cc.p(0 , 0 ) , cc.p( 0.0 , 0.0 ) , -1 )
  menu_btn:setLocalZOrder(101)
  menu_btn.redFlag = createSprite( menu_btn , getSpriteFrame("mainui/flag/red.png")  , cc.p(45 , 45 ) , cc.p( 0.5 , 0.5 ) , 100 )
  menu_btn.redFlag:setVisible(false)
  self.menu_btn = menu_btn


  local timeFun = function()
    if DATA_Activity and G_MAINSCENE and G_MAINSCENE.newFuntionNodeEx then
      if self.BaseMapScene.Shrank_mode then
          menu_btn.redFlag:setVisible( self:checkRed() )
      end
      self:stopAllActions()
    end
  end
  schedule( self , timeFun , 1 )--延时等数据
  --performWithDelay(self,func ,0.2)  --动画延时 等待数据就绪
  self.openFun = func

  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_FB_SINGLE)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_FB_SINGLE_2)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_FB_PROTECT)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_FB_TOWER)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_BATTLE)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_RING)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_MINE)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_GOD)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_SOUL)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_ACTIVE)
  G_NFTRIGGER_NODE:addData(self:getBtn("Battle"), NF_LOST)
  G_TUTO_NODE:setTouchNode(self:getBtn("Battle"), TOUCH_MAIN_BATTLE)


  G_NFTRIGGER_NODE:addData(self:getBtn("Shop"), NF_MYSTERY)
  G_TUTO_NODE:setTouchNode(self:getBtn("Shop"), TOUCH_MAIN_SHOP)

  -- G_NFTRIGGER_NODE:addData(self:getBtn("Lotter"), NF_LOTTERY)
  -- G_TUTO_NODE:setTouchNode(self:getBtn("Lotter"), TOUCH_MAIN_LOTTERY)

  G_NFTRIGGER_NODE:addData(self:getBtn("Gift"), NF_SIGN_IN)
  G_TUTO_NODE:setTouchNode(self:getBtn("Gift"), TOUCH_MAIN_GIFT)

  --创建按钮比推送列表慢需判断
    if DATA_Activity.riteData and DATA_Activity.riteData.cellData then
      self:showMG("Week",true)
      for k,v in pairs(DATA_Activity.riteData.cellData) do
          if v["modelID"] == 6 then
              local sevenPic = getSpriteFrame("mainui/topbtns/21.png")
              if sevenPic then
                  self:getBtn("Week"):setSpriteFrame(sevenPic)
              else
                  cc.SpriteFrameCache:getInstance():addSpriteFramesWithFileEx("res/mainui/mainui@0.plist", false, false)
                  self:getBtn("Week"):setSpriteFrame(getSpriteFrame("mainui/topbtns/21.png"))
              end
              break
          end
      end
    else
      -- self:getBtn("Week"):setVisible(false)
      self:showMG("Week",false)
    end

  -- local function checkLottery(buff)
  --   local isFree = buff:popBool()
  --   --MessageBox(tostring(isFree))
  --   if isFree then
  --     if TOPBTNMG then TOPBTNMG:showRedMG( "Lotter" , true ) end
  --   end
  -- end
  -- g_msgHandlerInst:registerMsgHandler(LOTTERY_SC_FREE, checkLottery)


  -- startTimerAction(self, 0, false, function()
  --     if G_ROLE_MAIN then
  --       g_msgHandlerInst:sendNetDataByFmtExEx(LOTTERY_CS_FREE, "i", G_ROLE_MAIN.obj_id)
  --     end
  --     --addNetLoading(LOTTERY_CS_FREE, LOTTERY_SC_FREE)
  --   end)

  _checkDragonSliayerRed()
  if G_TOP_STATE then
    for k , v in pairs( G_TOP_STATE ) do
        self:showMG( k , v.isShow )
        self:showRedMG( k , v.isRed )
    end
  end

    --人物等级变化
    local onDataSourceChanged = function(observable, attrId, objId, isMe, attrValue)
        if isMe and attrId == ROLE_LEVEL then
            -- self:showMG( "Battle" , attrValue >= battleShowLv )
            if DATA_Battle then DATA_Battle:showMainTip() end
        end
    end

    node:registerScriptHandler(function(event)
          if event == "enter" then
            MRoleStruct:register(onDataSourceChanged)
            if DATA_Battle then DATA_Battle:setRedData() end
            if DATA_Activity then DATA_Activity:checkRed() end
          elseif event == "exit" then
            MRoleStruct:unregister(onDataSourceChanged)
          end
        end)
  self:addChild(node)
end

--按钮组弹开收入
function TopBtnMg:openTop( _bool )
  self.BaseMapScene.Shrank_mode = _bool
  self.openFun(self.menu_btn )
end

--关闭按钮组
function TopBtnMg:hideTop( _bool )
  self.menu_btn:setVisible( not _bool )
  self:setVisible( not _bool )
  self.tempActivityNode:setVisible( not _bool )
end


--检测红点标记
function TopBtnMg:checkRed()
  local isRed = false

  for k , v in pairs( self.btns ) do
    if v:isVisible() == true and v.redFlag:isVisible() == true then
      isRed = true
      if isRed then
        break
      end
    end
  end
  return isRed
end
--获取按钮
function TopBtnMg:getBtn( key )
  return self.btns and self.btns[key] or nil
end
--初始化记录按钮位置
function TopBtnMg:initTopBtnPos()

  self.topBtnPos = {}
  for key , v  in pairs( self.btns ) do
    self.topBtnPos[v.name] = cc.p(v:getPosition())
  end

end
--功能按钮重置
function TopBtnMg:resetTopBtnPos( )
  local oneNum = 0
  if self.btns then
    local oneCfg = {"Lottery", "YuanBao" , "Gift"}
    local tempBtns = {}
    for i = 1  , #oneCfg do
      local curBtn = self.btns[ oneCfg[i] ]
      if curBtn and curBtn:isVisible() then
        oneNum = oneNum + 1
        tempBtns[ oneNum ] = curBtn
      end
    end
    for i = 1 , #tempBtns do
      tempBtns[i]:setPosition( self.topBtnPos[ oneCfg[i] ] )
    end
  end
end

--活动按钮重置
function TopBtnMg:resetActivityBtn()

  if self.btns then

    local twoCfg = { "Battle","Shop","Dictionary" ,"Week",  "Bbs" }

    -- 不可见的隐藏，后面的向前移动
    local tempBtns = {}
    local twoNum = 0
    for i = 1 , #twoCfg do
      local curBtn = self.btns[ twoCfg[i] ]
      if curBtn and curBtn:isVisible() == true then
        twoNum = twoNum + 1
        tempBtns[ twoNum  ] = curBtn
      end
    end
    for i = 1 , #tempBtns do
      if self.topBtnPos[ twoCfg[i] ] then
        tempBtns[i]:setPosition( self.topBtnPos[ twoCfg[i] ] )
      end
    end
  end


end
--按钮显示控制
function TopBtnMg:showMG( key , isShow )
    local mustShow = { Battle = G_CONTROL:isFuncOn( GAME_SWITCH_ID_COPY ) , Active = G_CONTROL:isFuncOn( GAME_SWITCH_ID_ACTIVENESS ) , }
  --所有按钮 全部是显示状态
  if type(key) == "string" then
    if G_TOP_STATE[ key ] then
        if mustShow[ key.name ] ~= nil and mustShow[ key ] == false then
            isShow = false
        end
        G_TOP_STATE[ key ][ "isShow" ] = isShow
        if self.btns and self.btns[key] then  self.btns[key]:setVisible( isShow ) end
    end
  else
        if key and key.name and G_TOP_STATE[ key.name ] then
            if mustShow[ key.name ] ~= nil and mustShow[ key.name ] == false then
                --系统开关控制处理
                isShow = false
                G_TOP_STATE[ key.name ][ "isShow" ] = isShow
            else
                G_TOP_STATE[ key.name ][ "isShow" ] = true
            end
        end

        key:setVisible( isShow )
  end
  self:resetTopBtnPos()
  self:resetActivityBtn()
end

function TopBtnMg:showRedMG( key , isShow )
  if self.btns and self.btns[key] and G_TOP_STATE[ key ] and self.btns[key].redFlag then
    G_TOP_STATE[ key ][ "isRed" ] = isShow
    self.btns[key].redFlag:setVisible( isShow )
  end
end

-- 检查首充
function TopBtnMg:checkFirstPay()
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
    xhr:open("POST", YMApiUrl)
    local function onReadyStateChange()
        print("xhr.readyState", xhr.readyState)
        print("xhr.status", xhr.status)
        print("xhr.response", xhr.response)
        if xhr.readyState == 4 and xhr.status == 200 then
            -- 解析json数据
            local responseJson  = xhr.response
            if #responseJson > 0 then
                responseJson = string.gsub(responseJson, "\r\n", "\n")
                responseJson = string.gsub(responseJson, "\r", "\n")
            end
            local noerror, ret = pcall(require("json").decode, responseJson)
            if noerror and ret.code == "1" then
                -- 首充礼包
                DATA_Activity.firstData = ret
                DATA_Activity.CData = DATA_Activity.firstData
                self.firstPayBtn:setVisible(true)
            else
                DATA_Activity.firstData = {}
                DATA_Activity.CData = DATA_Activity.firstData
                self.firstPayBtn:setVisible(false)
            end
        end
    end
    xhr:registerScriptHandler(onReadyStateChange)
    local param = "action=firstPay&roleId=" .. CURRENT_ROLE.RoleID .."&token=" ..YMToken
    xhr:send(param)
end

return TopBtnMg

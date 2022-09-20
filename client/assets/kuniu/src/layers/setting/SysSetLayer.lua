local SysSetLayer = class("SysSetLayer",require("src/layers/setting/BaseLayer"))
function SysSetLayer:ctor(parent)
	local sub_y = 65

   	local bg = self:floor("res/common/scalable/panel_outer_base.png",cc.rect(0, 0, 890,504),cc.p(479.5,290.5))
    self:addChild(bg)
   	createScale9Sprite(self, "res/common/scalable/panel_outer_frame_scale9.png", cc.p(479.5,290.5), cc.size(890, 504), cc.p(0.5, 0.5))

   	createScale9Sprite(self,"res/common/scalable/setbg2.png",cc.p(480,290),cc.size(860,480))
   	createScale9Sprite(self,"res/common/scalable/cutLine.png",cc.p(480,290),cc.size(47,470))


	self:addScroll(cc.size(455,467),cc.size(455,768),cc.p(30,54),true)


	local sroll = self:getScroll()
    if sroll then
    	sroll:setContentOffset(cc.p(0, -301))
    end

	local switchs = {
		[GAME_SET_ID_CLOSE_MUSIC]= game.getStrByKey("set_music_on"),
		[GAME_SET_ID_CLOSE_VOICE]= game.getStrByKey("set_effect_on"),
		[GAME_SET_NPC_VOICE] = game.getStrByKey("set_npc_effect"),
		[GAME_SET_ID_ENABLE_PUSH]= game.getStrByKey("set_push"),
		[GAME_SET_ID_FORBID_TRADE]= game.getStrByKey("set_ban_trad"),
		[GAME_SET_EQUIPTIP] = game.getStrByKey("set_equiptip"),
		[GAME_SET_PROPTIP] = game.getStrByKey("set_proptip"),
		-- [GAME_SET_SHOWPLAYERNAME] = game.getStrByKey("set_showplayername"),
		[GAME_SET_MONSTER_NAMESHOW]	= game.getStrByKey("isShowMonsterName"),
		[GAME_SET_ID_SHOW_FLOWERS]= game.getStrByKey("show_flowers4"),
		[GAME_SET_SHOWREDBAG] = game.getStrByKey("set_showredbag"),
		[GAME_SET_SHOWSKILLEFFECT] = game.getStrByKey("set_showskilleffect"),
		[GAME_SET_TOPARROW] = game.getStrByKey("isShowTopArrow"),
		[GAME_SET_ID_SHIELD_PLAYER] = game.getStrByKey("set_hide_player"),
		[GAME_SET_ID_SHIELD_MONSTER] = game.getStrByKey("set_hide_monster"),
		[GAME_SET_PLAYERTITLE] = game.getStrByKey("isShowPlayerTitle"),
		[GAME_SET_WINGHIDE] = game.getStrByKey("set_hidewing"),
		[GAME_SET_SHOWHURTNUMBER] = game.getStrByKey("set_showhurtnumber"),
		[GAME_SET_MONSTER_DIEDSHOW] = game.getStrByKey("set_hideMonsterDied"),
	}
	local positions = {
		[GAME_SET_ID_CLOSE_MUSIC]=cc.p(60,675+sub_y),--675 605 | 240 585 | 60 270
		[GAME_SET_ID_CLOSE_VOICE]=cc.p(270,675+sub_y),
		[GAME_SET_NPC_VOICE] = cc.p(60,605+sub_y),
		[GAME_SET_ID_ENABLE_PUSH]=cc.p(60,535+sub_y),
		[GAME_SET_ID_FORBID_TRADE]=cc.p(270,535+sub_y),
		[GAME_SET_EQUIPTIP] = cc.p(60,465+sub_y),
		[GAME_SET_PROPTIP] = cc.p(270,465+sub_y),
		-- [GAME_SET_SHOWPLAYERNAME] = cc.p(240,465+sub_y),
		[GAME_SET_SHOWHURTNUMBER] = cc.p(60,395+sub_y),
		[GAME_SET_MONSTER_NAMESHOW]	= cc.p(270,395+sub_y),
		[GAME_SET_PLAYERTITLE] = cc.p(60,325+sub_y),
		[GAME_SET_ID_SHOW_FLOWERS] = cc.p(60,255+sub_y),
		[GAME_SET_SHOWREDBAG] = cc.p(270,255+sub_y),
		[GAME_SET_SHOWSKILLEFFECT] = cc.p(60,185+sub_y),
		[GAME_SET_TOPARROW] = cc.p(60,115+sub_y),
		[GAME_SET_ID_SHIELD_PLAYER] = cc.p(270,115+sub_y),
		[GAME_SET_ID_SHIELD_MONSTER] = cc.p(60,45+sub_y),

		[GAME_SET_WINGHIDE] = cc.p(60,-35+sub_y),
		[GAME_SET_MONSTER_DIEDSHOW] = cc.p(270,-35+sub_y),
	}
	createScale9Sprite(self.base_node,"res/common/split-2.png",cc.p(235,568+sub_y),cc.size(380,2))
	createScale9Sprite(self.base_node,"res/common/split-2.png",cc.p(235,428+sub_y),cc.size(380,2))
	createScale9Sprite(self.base_node,"res/common/split-2.png",cc.p(235,288+sub_y),cc.size(380,2))
	createScale9Sprite(self.base_node,"res/common/split-2.png",cc.p(235,148+sub_y),cc.size(380,2))
	createScale9Sprite(self.base_node,"res/common/split-2.png",cc.p(235,-2+sub_y),cc.size(380,2))
	local indefinePos = {cc.p(30,0),cc.p(0,0.5),MColor.lable_black,20}
	for k,v in pairs(switchs)do
		self:createSwitch(self.base_node,positions[k],v,getGameSetById(k),k,nil,indefinePos,nil,"res/component/checkbox/1-2.png","res/component/checkbox/1.png")
	end

	local tipText = require("src/RichText").new(self, cc.p(680,500), cc.size(400, 30), cc.p(0.5, 0.5), 22, 20, MColor.white)
	tipText:addText(game.getStrByKey("set_id"),MColor.lable_yellow,true)
	tipText:addText(userInfo.currRoleStaticId,MColor.lable_black,true)
	tipText:setAutoWidth()
	tipText:format()
	tipText = require("src/RichText").new(self, cc.p(680,450), cc.size(400, 30), cc.p(0.5, 0.5), 22, 20, MColor.white)
	tipText:addText(game.getStrByKey("set_severid"),MColor.lable_yellow,true)
	tipText:addText(userInfo.serverName,MColor.lable_black,true)
	tipText:setAutoWidth()
	tipText:format()

	local func = function( idx )
        if idx == 2 then
            g_msgHandlerInst:sendNetDataByTableEx( LOGIN_CG_UNLOAD_PLAYER, "LoginUnloadPlayerReq", {})

			--去掉update，防止自动寻路导致发送移动包，导致服务器踢掉客户端
			if G_MAINSCENE ~= nil and G_MAINSCENE.map_layer ~= nil then
				G_MAINSCENE.map_layer:unscheduleUpdate()
			end

			globalInit()
			sdkLogout()
	        __G_ON_CREATE_ROLE = true
		    game.ToLoginScene()

        elseif idx == 4 then
			require("src/layers/notice/NoticeLayer").new()
		elseif idx == 1 then
			AudioEnginer.stopMusic()
			if G_MY_STEP_SOUND then
				AudioEnginer.stopEffect(G_MY_STEP_SOUND)
  				G_MY_STEP_SOUND = nil
			end
			-- 先停止当前所有的音效
            AudioEnginer.stopAllEffects();

			g_msgHandlerInst:sendNetDataByTableEx(LOGIN_CG_EXIT2HUD, "LoginExit2RoleChooseReq", {})

			--去掉update，防止自动寻路导致发送移动包，导致服务器踢掉客户端
			if G_MAINSCENE ~= nil and G_MAINSCENE.map_layer ~= nil then
				G_MAINSCENE.map_layer:unscheduleUpdate()
			end

			local connStatus = userInfo.connStatus
			local userName = userInfo.userName
			local userId = userInfo.userId
			local server = userInfo.serverName
			local serverid = userInfo.serverId
			local gatewayAddr = userInfo.gatewayAddr
			local port = userInfo.gatewayPort
			local serversreal = userInfo.serversreal
			local startTick = userInfo.startTick
			globalInit()
			userInfo.connStatus = connStatus
			userInfo.userName = userName
			userInfo.userId = userId
			userInfo.serverName = server
			userInfo.serverId = serverid
			userInfo.gatewayAddr = gatewayAddr
            userInfo.gatewayPort = port
            userInfo.startTick = startTick
            userInfo.serversreal = serversreal
            __G_ON_CREATE_ROLE = true

			local RoleCreateScene = require("src/login/RoleCreateScene")
			YMUIHelper.toScene(RoleCreateScene.new())

		elseif idx == 3 then
			-- 二级密码
			require("src/layers/setting/SecondaryPassword").checkSecondaryPassword()
		elseif idx == 5 then
			--问题反馈
			require("src/layers/setting/FeedBack").showDialog()
		elseif idx == 6 then
			-- 绑定手机
			require("src/layers/setting/BindPhone").showDialog()
		elseif idx == 9 then
            YMHelper.openUrl('index')
		else
			TIPS( { type = 1 , str = game.getStrByKey("set_func_development")  } )
		end
	end
	local menu_strs = stringsplit("切换角色,切换账号,二级密码,游戏公告,问题反馈,绑定手机",",")

	local positionsButton = {
		cc.p(600,375),
		cc.p(790,375),
		cc.p(600,305),
		cc.p(790,305),
		cc.p(600,235),
		cc.p(790,235),
		cc.p(600,165),
		cc.p(790,165),
	}
	for i=1,6 do
		local item = createMenuItem(self,"res/component/button/50.png",positionsButton[i],function() func(i) end )
		createLabel(item,menu_strs[i],cc.p(item:getContentSize().width/2,item:getContentSize().height/2),nil, 20,true,nil,nil,MColor.lable_yellow)
	end
	createLinkLabel(self,"◆".. YMGameName .. "◆",cc.p(695,95),nil,20,true,nil,MColor.yellow,nil,function() func(9) end,true)

	self.a_node = createSprite(self,"res/component/progress/2.png",cc.p(440,83))
	self.a_node:setVisible(false)
	self.jdSize = self.a_node:getContentSize()
	createLabel(self.a_node,game.getStrByKey("upanddown"),cc.p(-155,15),cc.p(0,0.5),22,true,nil,nil,MColor.lable_yellow)
	createLabel(self.a_node,"1.0",cc.p(-30,12),cc.p(0.5,0.5),20,true,nil,nil,MColor.lable_black)
	createLabel(self.a_node,"1.2",cc.p(475,12),cc.p(0.5,0.5),20,true,nil,nil,MColor.lable_black)
	self.scale = getGameSetById(GAME_SET_ID_SCALE_RATE)/100
	local progressX = 0.0
	if self.scale >= 1.0 then
		progressX = (self.scale-1)*(self.jdSize.width-40)/0.2  --14+(self.scale-1)*self.jdSize.width/0.2
	end
	local p_num1 = self.scale
	self.a_progress = createSprite(self.a_node,"res/common/progress/jdButton.png",cc.p(20+progressX,10),nil,99)
	self.progressNum = createLabel(self.a_progress,p_num1,cc.p(self.a_progress:getContentSize().width,self.a_progress:getContentSize().height/2+15),cc.p(0,0),20,true,nil,nil,MColor.lable_black)
	self:progressOfGreen((self.scale-1)*100/0.2)

	local inRect = function(a_pos,rect)
		local rect = rect or self.jdSize
		if a_pos.x >= 0 and a_pos.x < rect.width and
		   a_pos.y >= -15 and a_pos.y < rect.height+15 then
		   return true
		end
		return false
	end
	local listenner = cc.EventListenerTouchOneByOne:create()
    listenner:setSwallowTouches(true)
    listenner:registerScriptHandler(function(touch, event)
    		if self:isVisible() then
    			local a_pos =  self.a_progress:convertTouchToNodeSpace(touch)
    			local aabb = self.a_progress:getContentSize()
    			if inRect(a_pos,aabb) then
    				return true
    			end
    		end
       		return false
        end,cc.Handler.EVENT_TOUCH_BEGAN )
    listenner:registerScriptHandler(function(touch, event)
    	local a_pos =  self.a_node:convertTouchToNodeSpace(touch)
    	if inRect(a_pos) then
	    	if a_pos.x < 20  then a_pos.x = 20 end
			if a_pos.x > self.jdSize.width-20  then a_pos.x = self.jdSize.width-20 end
			self.a_progress:setPosition(cc.p(a_pos.x,10))
			local set_value = math.floor((a_pos.x-20)*100/(self.jdSize.width-40))
			local pp = math.floor(set_value*0.2)/100
			local myPos = (pp+1) * 100
			self.progressNum:setString(tostring(pp+1))
			self:progressOfGreen(set_value)
			setGameSetById(GAME_SET_ID_SCALE_RATE,myPos)
		end
     	end,cc.Handler.EVENT_TOUCH_MOVED )

    listenner:registerScriptHandler(function(touch, event)
    	local a_pos =  self.a_node:convertTouchToNodeSpace(touch)
    	if inRect(a_pos) then
	    	if a_pos.x < 20  then a_pos.x = 20 end
			if a_pos.x > self.jdSize.width-20  then a_pos.x = self.jdSize.width-20 end
			self.a_progress:setPosition(cc.p(a_pos.x,10))
			local set_value = math.floor((a_pos.x-20)*100/(self.jdSize.width-40))
			local pp = math.floor(set_value*0.2)/100
			local myPos = (pp+1) * 100
			self.progressNum:setString(tostring(pp+1))
			self:progressOfGreen(set_value)
			setGameSetById(GAME_SET_ID_SCALE_RATE,myPos)
		end
    	end,cc.Handler.EVENT_TOUCH_ENDED )
        local eventDispatcher = self:getEventDispatcher()
    	eventDispatcher:addEventListenerWithSceneGraphPriority(listenner,self.a_node)
end

function SysSetLayer:progressOfGreen(length)
	if self.progress == nil then
		self.progress = cc.ProgressTimer:create(cc.Sprite:create("res/component/progress/2-1.png"))
	    self.progress:setPosition(cc.p(11, 4))
	    self.progress:setType(cc.PROGRESS_TIMER_TYPE_BAR)
	    self.progress:setAnchorPoint(cc.p(0, 0))
	    self.progress:setBarChangeRate(cc.p(1, 0))
	    self.progress:setMidpoint(cc.p(0, 1))
	    self.a_node:addChild(self.progress)
	end
	self.progress:setScaleX(1)
	self.progress:setPercentage(length)
end

return SysSetLayer

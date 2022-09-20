local ScoreCostLayer = class("ScoreCostLayer",function() return cc.Layer:create() end )

function ScoreCostLayer:ctor(params)

	-- 和服务器通信的消息ID
	local messageIds = {LUCK_LOTTERY_AWARDS_REQ,LOGIN_CS_CREATEUSER}
	require("src/MsgHandler").new(self,messageIds)
--创建视图
	local registerPanel = LoginUtils.createSprite(self, "res/common/newbg/base_bg.png", cc.p( g_scrSize.width/2, g_scrSize.height/2), cc.p(0.5,0.5), -1)
	
	local callback = function() __GotoTarget( {ru = "a250"} ) removeFromParent(registerPanel)end 	
	
	local achievementBtn = createMenuItem(registerPanel, "res/layers/role/placeholder/changering.png", cc.p(220, 120), callback)
	

		

	local panelX = 40
	local r_size  = registerPanel:getContentSize()

	cclog("LOGIN_CS_CREATEUSER:" .. LOGIN_CS_CREATEUSER)
	cclog("LOGIN_SC_CREATEUSER:" .. LOGIN_SC_CREATEUSER)
	LoginUtils.createLabel(registerPanel, "积分兑换", cc.p(r_size.width/2, r_size.height -11), cc.p(0.5,1.0), 22, true)
	local menuItemYes = LoginUtils.createMenuItem(registerPanel, "res/component/button/50.png", cc.p(r_size.width/2 - 100, r_size.height/2-100), function()

		self.textCode = self.editNameRegister:getText()
		if string.len(self.textCode) > 0 and  tonumber(self.textCode) then
			-- 积分扣减
			local ret = { userName= "", userPwd = "", create = self.textCode}
			g_msgHandlerInst:sendNetDataByTableExEx(LOGIN_CS_CREATEUSER, "LoginCreateUserReq", ret)

		else
			TIPS({ type = 1  , str = "输入内容有误，请重新输入" , isMustShow = true })
		end

	end)
	local menuItemNo = LoginUtils.createMenuItem(registerPanel, "res/component/button/50.png", cc.p(r_size.width/2 + 100, r_size.height/2-100), function()
		removeFromParent(registerPanel)
	end)

	LoginUtils.createLabel(menuItemYes, LoginUtils.getStrByKey("sure"), LoginUtils.getCenterPos(menuItemYes), nil, 20, true)
	LoginUtils.createLabel(menuItemNo, LoginUtils.getStrByKey("cancel"), LoginUtils.getCenterPos(menuItemNo), nil, 20, true)


	local editNameBgRegister = cc.Sprite:create("res/common/edit_box_bg.png",cc.size(r_size.width * 0.8, 36))
	editNameBgRegister:setAnchorPoint(cc.p(0,0.5))
	editNameBgRegister:setPosition(cc.p(panelX, r_size.height/2 + 20))
	registerPanel:addChild(editNameBgRegister)

	self.editNameRegister = LoginUtils.createEditBox(editNameBgRegister, nil ,cc.p(10, editNameBgRegister:getContentSize().height/2) ,cc.size(200, 59), nil, 18,"请输入要兑换的数量")
	self.editNameRegister:setAnchorPoint(cc.p(0, 0.5))
	self.editNameRegister:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)

	g_msgHandlerInst:registerMsgHandler(LUCK_LOTTERY_AWARDS_REP,function(buff)
		cclog("分数结果返回..............................")
		local ret = g_msgHandlerInst:convertBufferToTable("LuckLotteryAwardsRep", buff)
		cclog("分数结果返回.............................." .. tostring(ret.awards[1].rewardCount))
		LoginUtils.createLabel(registerPanel, "您当前拥有的积分数量为：" .. tostring(ret.awards[1].rewardCount) .. "个", cc.p(r_size.width/2, r_size.height/2 + 70), cc.p(0.5,0.5), 20, true)
	end)

	g_msgHandlerInst:registerMsgHandler(LOGIN_SC_CREATEUSER,function(buff)
		cclog("积分兑换结果返回..............................")
		local ret = g_msgHandlerInst:convertBufferToTable("LoginCreateUserRet", buff)
		cclog("积分兑换结果返回.............................." .. ret.ret)
		TIPS({ type = 1  , str = "恭喜你,兑换成功" , isMustShow = true })
		removeFromParent(registerPanel)

		self:insertPayLog(self.textCode,ret.ret)

	end)

	--获取数量
	g_msgHandlerInst:sendNetDataByTableExEx(LUCK_LOTTERY_AWARDS_REQ, "LuckLotteryAwardsReq", {})


end

function ScoreCostLayer:insertPayLog(num,remain)
	local xhr = cc.XMLHttpRequest:new()
	xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
	xhr:open("POST", YMApiUrl)
	local function onReadyStateChange()
		print("xhr.readyState", xhr.readyState)
		print("xhr.status", xhr.status)
		print("xhr.response", xhr.response)
		if xhr.readyState == 4 and xhr.status == 200 then

		end
	end
	xhr:registerScriptHandler(onReadyStateChange)
	local param = "action=costScore&roleId=" .. CURRENT_ROLE.RoleID .."&token=" ..YMToken .. "&num=" .. num.. "&remain=" .. remain
	xhr:send(param)
end

return ScoreCostLayer

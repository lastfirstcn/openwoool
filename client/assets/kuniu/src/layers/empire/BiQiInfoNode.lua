local BiQiInfoNode = class("BiQiInfoNode", function() return cc.Node:create() end)

local path = "res/empire/"

function BiQiInfoNode:ctor(manorID, mapid)
	self.isShow = true
	self.manorID = manorID
	self.data = {}
	self.data.KillInfo = {}
	self.data.MyKillNum = 0
	self.itemdate = getConfigItemByKey("AreaFlag", "mapID", mapid)

	local msgids = {
					MANORWAR_SC_KILLRANKRET,
					MANORWAR_SC_SIMPLEWARINFORET, 
					MANORWAR_SC_MYKILLNUM, 
					MANORWAR_SC_PICKUPBANNERRET,
					MANORWAR_SC_ENDMANORWAR,
					}
	require("src/MsgHandler").new(self,msgids)
	
	self.baseNode = cc.Node:create()
	self:addChild(self.baseNode)

    self.timeBg = createSprite(self.baseNode, "res/mainui/sideInfo/timeBg.png", cc.p(display.width-154-171, g_scrSize.height), cc.p(0, 1))    
    self.timeBg:setVisible(false)

	g_msgHandlerInst:sendNetDataByTableExEx(MANORWAR_CS_SIMPLEWARINFO, "SimpleWarInfoProtocol", {manorID = manorID})
end

function BiQiInfoNode:bannerOwerChange()
	self.timeBg:removeAllChildren()
	if self.owerTimer then
		self.owerTimer:stopAllActions()
		self.owerTimer = nil
	end

	local timeBgSize = self.timeBg:getContentSize()
	if self.data.base.over then
		self.timeBg:setVisible(true)
		createLabel(self.timeBg, game.getStrByKey("empire_biqi_info_carry_time1"), cc.p(timeBgSize.width/2, timeBgSize.height - 16), cc.p(0.5, 0.5), 18, true):setColor(MColor.lable_yellow)
		createLabel(self.timeBg, game.getStrByKey("empire_biqi_info_carry_time2"), cc.p(timeBgSize.width/2, timeBgSize.height/2-10), cc.p(0.5, 0.5), 22, true):setColor(MColor.green)
	elseif self.data.banner.isOwner and self.data.banner.ownerTime then
		local str = game.getStrByKey("empire_biqi_info_carry_time")
		if self.itemdate and self.itemdate.winPeriod then
			str = game.getStrByKey("empire_biqi_info_carry_time1")
		end
	    createLabel(self.timeBg, str, cc.p(timeBgSize.width/2, timeBgSize.height - 16), cc.p(0.5, 0.5), 18, true):setColor(MColor.lable_yellow)
	    self.RemainTimeText = createLabel(self.timeBg, secondParse(self.data.banner.ownerTime), cc.p(timeBgSize.width/2, timeBgSize.height/2-10), cc.p(0.5, 0.5), 22, true)
	    self.RemainTimeText:setColor(MColor.green)
	    self.owerTimer = startTimerActionEx(self, 1, true, function(delTime)
	    				if self.itemdate and self.itemdate.winPeriod then
	    					self.data.banner.ownerTime = self.data.banner.ownerTime - delTime
	    				else
	    					self.data.banner.ownerTime = self.data.banner.ownerTime + delTime 
	    				end

	    				if self.data.banner.ownerTime >= 0 then
	    					self.RemainTimeText:setString(secondParse(self.data.banner.ownerTime))
	    				end
	    				
	    				if self.data.banner.ownerTime <= 0 then
							if self.owerTimer then
								self.owerTimer:stopAllActions()
								self.owerTimer = nil
							end	    					
							self.timeBg:setVisible(fasle)
	    				end
	    end)
	    self.timeBg:setVisible(true)
	else
		self.timeBg:setVisible(fasle)
	end
end

function BiQiInfoNode:networkHander(buff, msgid)
	local switch = {--MANORWAR_CS_SIMPLEWARINFO
		--??????
		[MANORWAR_SC_SIMPLEWARINFORET] = function()
			self.data.base = {}
			local retTab = g_msgHandlerInst:convertBufferToTable("SimpleWarInfoRetProtocol", buff)

			local manorID = retTab.manorID
			if self.manorID ~= manorID then
				return
			end
			self.data.base.over = retTab.isOver
			self.data.base.leftTime = retTab.beginTime --???????????????????????????
			self.data.base.isNear = retTab.isNear    --????????????????????????
			self.data.base.isHelp = retTab.siAid     --true ?????? false ??????

			self.data.banner = {}
			self.data.banner.isOwner = retTab.bannerOwner         --??????????????????
			if self.data.banner.isOwner then
				self.data.banner.OwnerName = retTab.owner  --??????????????????
				self.data.banner.facName = retTab.facName    --????????????????????????
				self.data.banner.ownerTime = retTab.bannerTime    --???????????????
				if self.itemdate and self.itemdate.winPeriod then
					self.data.banner.ownerTime = tonumber(self.itemdate.winPeriod) - self.data.banner.ownerTime
				end
			end

			--???????????????????????????
			if self.data.base.over then
				G_MAINSCENE:setArrowBtnVisable(false)
			elseif not self.data.banner.isOwner or (self.data.banner.isOwner and self.data.banner.OwnerName ~= G_ROLE_MAIN:getTheName()) then
				G_MAINSCENE:setArrowBtnVisable(true)
			else
				G_MAINSCENE:setArrowBtnVisable(false)
			end

			self.data.base.leftTime = G_EMPIRE_INFO.defaultHoldTime - self.data.base.leftTime
			if not self.data.banner.isOwner then
				G_EMPIRE_INFO.BATTLE_INFO.bannerX = G_EMPIRE_INFO.BATTLE_INFO.defaultPos.x
				G_EMPIRE_INFO.BATTLE_INFO.bannerY = G_EMPIRE_INFO.BATTLE_INFO.defaultPos.y
				G_MAINSCENE:showArrowPointToMonster(true, cc.p(G_EMPIRE_INFO.BATTLE_INFO.bannerX, G_EMPIRE_INFO.BATTLE_INFO.bannerY), true)
			end

			dump(self.data)
			self:bannerOwerChange()
		end,
		--????????????
		[MANORWAR_SC_KILLRANKRET] = function()
			self.data.KillInfo = {}

			local num = buff:popChar()             --???????????????
			for i=1, num do
				self.data.KillInfo[i] = {}
				self.data.KillInfo[i].name = buff:popString()
				self.data.KillInfo[i].num = buff:popInt()
			end

			table.sort(self.data.KillInfo, function(a, b) return a.num > b.num end)

			self:createRankView()
			--dump(self.data.KillInfo)
		end,
		--????????????
		[MANORWAR_SC_MYKILLNUM] = function()
			self.data.MyKillNum = buff:popInt()
			--dump(self.data.MyKillNum )
			self:createRankView()
		end,
		[MANORWAR_SC_ENDMANORWAR] = function()
			local retTab = g_msgHandlerInst:convertBufferToTable("EndManorWarProtocol", buff)
			local manorID = retTab.manorID
			if manorID == self.manorID then
				self.timeBg:setVisible(false)
				G_MAINSCENE:setArrowBtnVisable(false)
			end
		end,
	}

 	if switch[msgid] then 
 		switch[msgid]()
 	end
end
return BiQiInfoNode
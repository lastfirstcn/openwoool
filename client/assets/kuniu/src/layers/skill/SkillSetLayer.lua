local SkillSetLayer = class("SkillSetLayer",function() return cc.Layer:create() end)

function SkillSetLayer:ctor(parent)
	self.load_data = {}
	-- self.skill_data = {}
	self.touchTemp = 1
	self.touchItem = nil
	self.touchTemp1 = 1
	self.kaiguan = false

	self.action = cc.RepeatForever:create(cc.Sequence:create(cc.FadeTo:create(0.8,0),cc.FadeTo:create(0.8,255)))
	self.action1 = self.action:clone()
	self.action2 = self.action:clone()
	self.rotationPos = {{0,cc.p(604.5,420)},{120,cc.p(604,427)},{240,cc.p(611,424.5)}}

	for k,v in ipairs(G_SKILLPROP_POS) do
		if v[2] == 1 then
			table.insert(self.load_data,v)
		end
	end

	local msgids = {SKILL_SC_SETSHORTCUTKEY}
	require("src/MsgHandler").new(self,msgids)
	local bg_size = cc.size(780,502)
	local bg = createScale9Frame(
        self,
        "res/common/scalable/panel_outer_base_1.png",
        "res/common/scalable/panel_outer_frame_scale9_1.png",
        cc.p(135, 15),
        bg_size,
        5
    )
	--createSprite(self,"res/common/bg/bg67.png",cc.p(524,266))
	self.bg = bg
	createSprite(self,"res/layers/skill/skillBg.png",cc.p(524,266))
	createSprite(self,"res/layers/skill/longwen.png",cc.p(734,300))
	createSprite(self,"res/layers/skill/line.png",cc.p(734,120))

	self:addScroll(cc.size(420,420+140*(math.floor((#self.load_data-10)/3)+1)))
	self:initTouch()

	local clearOfSet = function() 
		if self.center_node and self.pages then
			self.center_node:removeAllChildren()
			for i=1,12 do 
				local page_item = self.pages[math.ceil(i/4)]:getChildByTag(i)
				if page_item then
					page_item:removeAllChildren()
				end
			end
			for k,v in pairs(G_SKILLPROP_POS)do
				v[1] = 0
			end
			if G_MAINSCENE then
				G_MAINSCENE:reloadSkillConfig()
			end
			-- g_msgHandlerInst:sendNetDataByFmt(SKILL_CS_SETSHORTCUTKEY,"icci",G_ROLE_MAIN.obj_id,0,0,0)
			local t = {}
			t.shortcutKey = 0
			t.protoType = 0
			t.protoID = 0
			g_msgHandlerInst:sendNetDataByTable(SKILL_CS_SETSHORTCUTKEY, "SkillShortcutKeyProtocol", t )
		end
	end

	createSprite(self,"res/layers/skill/0.png",cc.p(605,420))
	local button = createMenuItem(self, "res/component/button/50.png", cc.p(734,85), function() clearOfSet() end)
	createLabel(button,game.getStrByKey("clearOfSet"),cc.p(button:getContentSize().width/2,button:getContentSize().height/2),cc.p(0.5,0.5),21,nil,nil,nil,MColor.lable_yellow)
	self:registerScriptHandler(function(event)
		if event == "enter" then
			G_TUTO_NODE:setShowNode(self, SHOW_SKILL_CONFIG)
		elseif event == "exit" then
		end
	end)
end

function SkillSetLayer:addScroll(size,pos)
	local scrollView = cc.ScrollView:create()
    if nil ~= scrollView then
        scrollView:setViewSize(cc.size(420,420))
        scrollView:setPosition(cc.p(7,38))
        scrollView:setScale(1.0)
        scrollView:ignoreAnchorPointForPosition(true)
        local node = cc.Node:create()
        self.base_node = node
        node:setContentSize(size)
        scrollView:setContainer(node)
        scrollView:updateInset()
        scrollView:addSlider("res/common/slider.png")
        scrollView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL )
        scrollView:setClippingToBounds(true)
        scrollView:setBounceable(true)
        self.bg:addChild(scrollView)
        self.scrollView = scrollView
    end
    self:addSkillIcon()
end

function SkillSetLayer:addSkillIcon( )
	local posx,posy = 3,0
	posy = 420+140*(math.floor((#self.load_data-10)/3)+1)
	local posyTemp = posy
	local xAdd,ySub = 138,140
	for i = 1, #self.load_data do
		local skillItemBg = createSprite(self.base_node,"res/layers/skill/smallbg.png",cc.p(posx,posy),cc.p(0,1))
		if (i%3) == 0 then
			posy = posy - ySub
			posx = 3
		else
			posx = posx + xAdd
		end
		local data = self.load_data[i]
		if data then

			local skill_item = createSprite(skillItemBg, "res/layers/skill/44.png",cc.p(skillItemBg:getContentSize().width/2,70))			
			skill_item:setTag(i)
			local  listenner = cc.EventListenerTouchOneByOne:create()
	        listenner:setSwallowTouches(false)
	        listenner:registerScriptHandler(function(touch, event)
	            local pt = touch:getLocation()
	            pt = skill_item:getParent():convertToNodeSpace(pt)
	            if cc.rectContainsPoint(skill_item:getBoundingBox(),pt) then
	                return true
	            end
	            end,cc.Handler.EVENT_TOUCH_BEGAN )

	        listenner:registerScriptHandler(function(touch,event)
	            local pt = touch:getLocation()
	            pt = skill_item:getParent():convertToNodeSpace(pt)
                if cc.rectContainsPoint(skill_item:getBoundingBox(),pt) then 
	      			if 	(self.touchItem and self.touchItem:getTag() ~= i) or not self.touchItem then 
      					if self.touchItem then
      						self.touchItem:setScale(1)
      						self.touchItem:getParent():setTexture("res/layers/skill/smallbg.png")
      					end
      					self.select_tag = nil
      				--if self.touchTemp == 1 then
	      				self.select_tag = skill_item:getTag()
	      				skill_item:setScale(1.2)
	      				skill_item:getParent():setTexture("res/layers/skill/smallbg_sel.png")
	      				self.select_sender = skill_item
	      				-- self.touchTemp1 = self.touchTemp1 * -1
	      				self:setTouchNode(true)
	      				self.touchItem = skill_item
	      				self.kaiguan = true
	      			--end
		      		elseif self.touchItem and self.touchItem:getTag() == i then
		      			self.touchItem:setScale(1)
		      			self.touchItem:getParent():setTexture("res/layers/skill/smallbg.png")
		      			self:setTouchNode(false)
		      			self.touchItem = nil
		      		end		      		
                end	            
	        end,cc.Handler.EVENT_TOUCH_ENDED)
	        local eventDispatcher =  skill_item:getEventDispatcher()
	        eventDispatcher:addEventListenerWithSceneGraphPriority(listenner, skill_item)

			if i == 2 then
				G_TUTO_NODE:setTouchNode(skill_item, TOUCH_SKILL_SKILL2)
			end
			if i == 3 then
				G_TUTO_NODE:setTouchNode(skill_item, TOUCH_SKILL_SKILL3)
			end
		    -- skill_item:setTag(i)
		    local icon = getConfigItemByKey("SkillCfg","skillID",data[3],"ico") or data[3]
		    createSprite(skill_item,"res/skillicon/"..icon..".png",cc.p(41,41),nil,nil,0.8)
		    -- local name = getConfigItemByKey("SkillCfg","skillID",data[3],"name")
		    -- createLabel(skillItemBg,name,cc.p(72,25),false,19,nil,nil,nil,MColor.lable_yellow)
		end
	end
	self.scrollView:setContentOffset(cc.p(0,420-posyTemp))
	self:createConfigNode() 
end

function SkillSetLayer:setTouchNode(enable)
	local scale,order = 1.0,4
	if enable then scale = 1.2 order = 6 end
	self.center_node:setTouchEnable(enable)
	self.center_node:setScale(scale)
	self.center_node:setLocalZOrder(6)
	-- if (not enable) and self.center_node:getChildByTag(5) then 
	if self.center_node:getChildByTag(5) then 
		self.center_node:removeChildByTag(5)
	end
	for i=1,12 do 
		local page_item = self.pages[math.ceil(i/4)]:getChildByTag(i)
		page_item = tolua.cast(page_item,"TouchSprite")
		page_item:setScale(scale)
		if page_item then
			page_item:setCascadeOpacityEnabled(true)
			page_item:setOpacity(255)
			--if not enable then
				if page_item:getChildByTag(5) then
					page_item:removeChildByTag(5)
				end
			--end
			page_item:setTouchEnable(enable)
		end

		if i == 1 then
			G_TUTO_NODE:setTouchNode(page_item, TOUCH_SKILL_BUTTON2)
		end
		if i == 2 then
			G_TUTO_NODE:setTouchNode(page_item, TOUCH_SKILL_BUTTON3)
		end
	end	
	if enable and self.select_tag then 
		local data = self.load_data[self.select_tag]
		self.tempForSelect = data[3]
		local isTheSkillNode = function(sender) 
			if sender:getChildByTag(data[3]) then
				return true
			end
			return false
		end
		local isHasNode = function(sender)
			if sender:getChildrenCount() > 0 then
				return true
			end	
			return false
		end
		if isTheSkillNode(self.center_node) then
			self.center_node:setLocalZOrder(4)
			self.center_node:setTouchEnable(false)
			self.center_node:setScale(1)
		elseif isHasNode(self.center_node) then
			local c_node = createSprite(self.center_node,"res/layers/skill/23.png",cc.p(20,20),nil,nil,0.8)
			c_node:setTag(5) 
		end
		for i=1,12 do
			local page_item = self.pages[math.ceil(i/4)]:getChildByTag(i)
			page_item = tolua.cast(page_item,"TouchSprite")	
			if page_item then
				if isTheSkillNode(page_item) then
					page_item:setTouchEnable(false)
					page_item:setScale(1)
					page_item:setCascadeOpacityEnabled(true)
					page_item:setOpacity(50)
				elseif isHasNode(page_item) then
					local c_node = createSprite(page_item,"res/layers/skill/23.png",cc.p(20,20),nil,nil,0.8)
					c_node:setTag(5)
				end
			end
		end
	end	
end


function SkillSetLayer:createConfigNode()
	local tfunc = function(sender)
		if self.select_tag then 
			local data = self.load_data[self.select_tag]
			if not data then 
				return
			end
			for k,v in pairs(G_SKILLPROP_POS)do
				if sender:getChildByTag(v[3]) then
					v[1] = 0
					break
				end
			end
			-- g_msgHandlerInst:sendNetDataByFmt(SKILL_CS_SETSHORTCUTKEY,"icci",G_ROLE_MAIN.obj_id,sender:getTag()+1,1,data[3])
			local t = {}
			t.shortcutKey = sender:getTag()+1
			t.protoType = 1
			t.protoID = data[3]
			g_msgHandlerInst:sendNetDataByTable(SKILL_CS_SETSHORTCUTKEY, "SkillShortcutKeyProtocol", t )
		end
	end
	self.center_node = createTouchItem(self, "res/layers/skill/45.png",cc.p(810,230),tfunc)
	self.center_node:setLocalZOrder(6)
	self.center_node:setTag(0)
	self.center_node:setTouchEnable(false)
	local start_dgree = 190
	local rotate_dgree = -120
	local DgreeToN =  function(n)
		return n*3.1415926/180
	end
	self.pages = {}
	self.page_index = 1
	self.smallRotIcon = createSprite(self,"res/layers/skill/1.png",cc.p(604.5,420),nil,10)
	self.smallRotIcon:runAction(self.action2)
	for j=1,3 do
		local page_node = cc.Node:create()
		self:addChild(page_node,6)
		page_node:setPosition(910,130)

		for i=1,4 do
			local pos = cc.p(300*math.cos(DgreeToN(start_dgree-22*i)),300*math.sin(DgreeToN(start_dgree-22*i)));
			if i == 1 then
				pos.x = pos.x+5
			elseif i == 4 then
				pos.y = pos.y-20
			end
			local skill_item = createTouchItem(page_node, "res/layers/skill/44.png",pos,tfunc)
			skill_item:setTag((j-1)*4+i)
			skill_item:setTouchEnable(false)
		end
		self.pages[j] = page_node
		if j > 1 then
			page_node:setVisible(false)
			page_node:setRotation(180)
		end
	end

	self:reloadData() 

	local m_sprite1 = GraySprite:create("res/layers/skill/46.png")
	
	m_sprite1:setPosition(cc.p(725,205))
	self:addChild(m_sprite1,4)
	local m_sprite2 = GraySprite:create("res/layers/skill/46.png")
	m_sprite2:setFlippedX(true);
	m_sprite2:setRotation(-90);
	m_sprite2:setPosition(cc.p(830,320))
	self:addChild(m_sprite2,4)
	m_sprite2:addColorGray()
	self.gray_item = {m_sprite1,m_sprite2}
	self.gray_item[1]:runAction(self.action)
	self.gray_item[2]:runAction(self.action1)
end

function SkillSetLayer:reloadData()
	if self.touchItem then
		self.touchItem:setScale(1)
		self.touchItem:getParent():setTexture("res/layers/skill/smallbg.png")
	end
	self.touchItem = nil
	self:setTouchNode(false)

	self.center_node:removeAllChildren()
	for i=1,12 do 
		local page_item = self.pages[math.ceil(i/4)]:getChildByTag(i)
		if page_item then
			page_item:removeAllChildren()
		end
	end
	for k,v in pairs(G_SKILLPROP_POS)do 
		if v[1] > 1 and v[1] ~= 20 then 
			local page_node = self.pages[math.ceil((v[1]-1)/4)]
			if page_node then
				local item = page_node:getChildByTag(v[1]-1)
				if item then 
					if v[2] == 1 then
						local icon = getConfigItemByKey("SkillCfg","skillID",v[3],"ico") or v[3]
						local skill_item = createSprite(item, "res/skillicon/"..icon..".png",cc.p(41,41),cc.p(0.5,0.5),nil,0.8)
						if skill_item then
							skill_item:setTag(v[3])
						end
						if self.tempForSelect and self.tempForSelect == v[3] then
							local skillName = getConfigItemByKey("SkillCfg","skillID",v[3],"name")
							if self.kaiguan then
								TIPS( { type = 1 , str = "^c(yellow)["..skillName.."]"..game.getStrByKey("skillCfgSucc").."^" } )
								self.kaiguan = false
							end
						end
					elseif v[2] == 2 then 
						local icon = getConfigItemByKey("propCfg","q_id",v[3],"q_tiny_icon") or v[3]
						local prop_item = createSprite(item,"res/group/itemIcon/"..icon..".png",cc.p(41,41),nil,nil,0.8)
						createSprite(item,"res/layers/skill/54.png",cc.p(39,40),nil,nil,0.8)
						if prop_item then
							prop_item:setTag(v[3])					
						end
						if self.tempForSelect and self.tempForSelect == v[3] then
							local propName = getConfigItemByKey("propCfg","q_id",v[3],"q_name")
							if self.kaiguan then
								TIPS( { type = 1 , str = "^c(yellow)["..propName.."]"..game.getStrByKey("propCfgSucc").."^" } )
								self.kaiguan = false
							end
						end
					end
				end
			end
		elseif v[1] == 1 then
			if v[2] == 1 then
				local icon = getConfigItemByKey("SkillCfg","skillID",v[3],"ico") or v[3]
				local skill_item = createSprite(self.center_node, "res/skillicon/"..icon..".png",cc.p(59,59),cc.p(0.5,0.5),nil)
				if skill_item then
					skill_item:setTag(v[3])
				end
				if self.tempForSelect and self.tempForSelect == v[3] then
					local skillName = getConfigItemByKey("SkillCfg","skillID",v[3],"name")
					if self.kaiguan then
						TIPS( { type = 1 , str = "^c(yellow)["..skillName.."]"..game.getStrByKey("skillCfgSucc").."^" } )
						self.kaiguan = false
					end
				end
			elseif v[2] == 2 then
				local icon = getConfigItemByKey("propCfg","q_id",v[3],"q_tiny_icon") or v[3]
				local prop_item = createSprite(self.center_node,"res/group/itemIcon/"..icon..".png",cc.p(59,60),nil,nil)
				createSprite(self.center_node,"res/layers/skill/54.png",cc.p(58,60))
				if prop_item then
					prop_item:setTag(v[3])
				end
				if self.tempForSelect and self.tempForSelect == v[3] then
					local propName = getConfigItemByKey("propCfg","q_id",v[3],"q_name")
					if self.kaiguan then
						TIPS( { type = 1 , str = "^c(yellow)["..propName.."]"..game.getStrByKey("propCfgSucc").."^" } )
						self.kaiguan = false
					end
				end 
			end
		end
	end
end

function SkillSetLayer:initTouch() 
	local  listenner = cc.EventListenerTouchOneByOne:create()
    listenner:setSwallowTouches(true)
    local move_dir = 0
    listenner:registerScriptHandler(function(touch, event)
    	move_dir = 0
    	local pos = touch:getLocation()
    	if  500 >= pos.y and pos.x > (g_scrCenter.x+100) and pos.x < 960 and self:isVisible() then
       		return true
       	end
       	return false
        end,cc.Handler.EVENT_TOUCH_BEGAN )
    listenner:registerScriptHandler(function(touch, event)
    	local start = touch:getStartLocation()
    	local now = touch:getLocation()
    	if cc.pGetDistance(now,start) > 30 then
    		--print(" self.page_index".. self.page_index)
    		if now.x > start.x and now.y > start.y then
    			if self.page_index and self.page_index >1 then
    				move_dir = 1
	    		end
    		elseif now.x < start.x and now.y < start.y then 
    			if self.page_index and self.page_index < 3 then
    				move_dir = -1

    			end
    		end
    	end
        end,cc.Handler.EVENT_TOUCH_MOVED )
    listenner:registerScriptHandler(function(touch, event)
    	if move_dir ~= 0 and self.page_index >= 1 and self.page_index <= 3 then
    		 local show = cc.Show:create()
	    	local hide = cc.Hide:create()
	    	local delay = cc.DelayTime:create(0.1)
	    	self.pages[self.page_index]:runAction(
				cc.Sequence:create(cc.RotateTo:create(0.2,move_dir*180),hide))
			self.page_index = self.page_index - move_dir
			self.pages[self.page_index]:runAction(
				cc.Sequence:create(delay,cc.RotateTo:create(0.2,0)))
			self.pages[self.page_index]:runAction(
				cc.Sequence:create(delay,delay,show))

			if self.page_index == 3 then
				self.gray_item[1]:addColorGray()				
				self.gray_item[2]:removeColorGray()
				self.smallRotIcon:setRotation(self.rotationPos[3][1])
				self.smallRotIcon:setPosition(self.rotationPos[3][2])
			elseif self.page_index == 1 then
				self.gray_item[1]:removeColorGray()
				self.gray_item[2]:addColorGray()
				self.smallRotIcon:setRotation(self.rotationPos[1][1])
				self.smallRotIcon:setPosition(self.rotationPos[1][2])
			else
				self.gray_item[1]:removeColorGray()
				self.gray_item[2]:removeColorGray()
				self.smallRotIcon:setRotation(self.rotationPos[2][1])
				self.smallRotIcon:setPosition(self.rotationPos[2][2])
			end 
    	end
        end,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listenner,self)

end


function SkillSetLayer:networkHander(buff,msgid)
	local switch = {
		[SKILL_SC_SETSHORTCUTKEY] = function()    
			local t = g_msgHandlerInst:convertBufferToTable("SkillShortcutRetProtocol", buff)    
			--data = {buff:popChar(),buff:popChar(),buff:popInt()}
			local data = {t.shortcutKey,t.protoType,t.protoID}
			for k,v in pairs(G_SKILLPROP_POS) do
				if v[3] == data[3] then
					v[1] = data[1]
				elseif v[1] == data[1] then
					v[1] = 0
				end				
			end
			if G_MAINSCENE then
				G_MAINSCENE:reloadSkillConfig()
			end
			self:reloadData()
		end,
	}

 	if switch[msgid] then 
 		switch[msgid]()
 	end
end

return SkillSetLayer
local LuckLotteryLayer = class("LuckLotteryLayer",function() return cc.Layer:create() end )

function LuckLotteryLayer:ctor(params)

	-- 和服务器通信的消息ID
	local messageIds = {LUCK_LOTTERY_GET_REQ,LUCK_LOTTERY_GET_REP}
	require("src/MsgHandler").new(self,messageIds)

	local bg ,closebtn  = createBgSprite(self,"幸运抽奖")
	local bgWidth,bgHeight = bg:getContentSize().width,bg:getContentSize().height

	self.base_node = createScale9Frame(
			bg,
			"res/common/scalable/panel_outer_base_1.png",
			"res/common/scalable/panel_outer_frame_scale9_1.png",
			cc.p(33, 40),
			cc.size(890, 495),
			4
	)
	local btn = createSprite(bg,"res/common/cjBg1.png",cc.p(bgWidth/2, 290),callFun)
	local btn1 = createSprite(bg,"res/common/19.png",cc.p(720, 95),callFun)

	self.startButton = YMUIHelper.createButton("开始抽奖",20,"res/component/button/4.png","res/component/button/4_sel.png",nil,function(node)
		if __checkGold( 200 ) == false then
			TIPS( { type = 1 , str =  game.getStrByKey( "factionQFT_operError6" ) } )
			return
		end

		self.startButton:setEnabled(false)

		-- 开始抽奖
		YMHelper.schedule(self,function()
			local r = math.random(1,#effRect)
			cclog("开始抽奖：" .. tostring(r))
			effRect[r]:playActionData("lbox", 4 , 0.5 , 1 )
		end,0.5)

		YMHelper.performWithDelay(self,function()
			self:stopAllActions()
			g_msgHandlerInst:sendNetDataByTableExEx(LUCK_LOTTERY_GET_REQ, "LuckLotteryGetReq", {})
			self.startButton:setEnabled(true)
		end,3)
	end);

	self.startButton:setPosition(cc.p(bgWidth/2, 95))
	bg:addChild(self.startButton)

	self.continuousStartButton = YMUIHelper.createButton("连续抽十次",20,"res/component/button/4.png","res/component/button/4_sel.png",nil,function(node)
		if __checkGold( 200 ) == false then
			TIPS( { type = 1 , str =  game.getStrByKey( "factionQFT_operError6" ) } )
			return
		end

		self.continuousStartButton:setEnabled(false)
		YMHelper.schedule(self,function()
			local r = math.random(1,#effRect)
			cclog("开始抽奖：" .. tostring(r))
			effRect[r]:playActionData("lbox", 4 , 0.5 , 1 )
		end,0.5)

		YMHelper.performWithDelay(self,function()
			self:stopAllActions()
			for i=1,10 do
				g_msgHandlerInst:sendNetDataByTableExEx(LUCK_LOTTERY_GET_REQ, "LuckLotteryGetReq", {})
			end
			self.continuousStartButton:setEnabled(true)
		end,3)

	end);

	self.continuousStartButton:setPosition(cc.p(bgWidth/4, 95))
	bg:addChild(self.continuousStartButton)

	if params then
		self.awardsList = {}
		self.data = params
		self:showAwards()
	end

	self.oldIndex = 0;
	SwallowTouches(bg)

	local helpBtn = createMenuItem( self , "res/component/button/small_help.png"  ,  cc.p( bgWidth - 50,   bgHeight-100 ) , function() self:helpFun() end )
	---
	local Mcurrency = require "src/functional/currency"
	Mnode.addChild(
			{
				parent = bg,
				child = Mcurrency.new(
						{
							cate = PLAYER_INGOT,
							--			bg = "res/common/19.png",
							color = MColor.lable_yellow,
						}),

				anchor = cc.p(0, 0.5),
				pos = cc.p(660, 95),--??????
			})

	self:createCheckData()
	self:updateToolTip()

	SwallowTouches(self)
	self:registerScriptHandler(function(event)
		if event == "enter" then
			G_TUTO_NODE:setShowNode(self, SHOW_LOTTERY)
		elseif event == "exit" then
		end
	end)

end

function LuckLotteryLayer:createCheckData()
	self.checkData = {}
	self.checkData.normalData = {}
	self.checkData.specialData = {}
	self.checkData.specialData[30] = {}
	self.checkData.specialData[40] = {}
	self.checkData.specialData[50] = {}
	self.checkData.specialData[60] = {}
	self.checkData.specialData[70] = {}
	self.checkData.specialData[30].lv = {lvMin=0, lvMax=39}
	self.checkData.specialData[40].lv = {lvMin=40, lvMax=49}
	self.checkData.specialData[50].lv = {lvMin=50, lvMax=59}
	self.checkData.specialData[60].lv = {lvMin=60, lvMax=69}
	self.checkData.specialData[70].lv = {lvMin=70, lvMax=100}
	self.checkData.specialData[30].data = {}
	self.checkData.specialData[40].data = {}
	self.checkData.specialData[50].data = {}
	self.checkData.specialData[60].data = {}
	self.checkData.specialData[70].data = {}

	local DropOp = require("src/config/DropAwardOp")
	--[[ local dropItem = DropOp:dropItem(tonumber(self.Data[index].tggd))
         for k,v in pairs(DropOp:dropItem(11))do
             table.insert(self.checkData.normalData, v.q_item)
        end
         for k,v in pairs(DropOp:dropItem(4444423))do
             table.insert(self.checkData.specialData[30].data, v.q_item)
         end
         for k,v in pairs(DropOp:dropItem(4444424))do
             table.insert(self.checkData.specialData[40].data, v.q_item)
         end
         for k,v in pairs(DropOp:dropItem(4444425))do
             table.insert(self.checkData.specialData[50].data, v.q_item)
         end
         for k,v in pairs(DropOp:dropItem(4444426))do
             table.insert(self.checkData.specialData[60].data, v.q_item)
         end
         for k,v in pairs(DropOp:dropItem(4444427))do
             table.insert(self.checkData.specialData[70].data, v.q_item)
         end--]]

	local tab = getConfigItemByKey("DropAward") --require("src/config/DropAward")
	for i,v in ipairs(tab) do
		if v.q_id == 11 then
			table.insert(self.checkData.normalData, #self.checkData.normalData+1, v.q_item)
		elseif v.q_id == 4444413 then
			--table.insert(self.checkData.specialData[30].data, v.q_item)
		elseif v.q_id == 4444414 then
			--table.insert(self.checkData.specialData[40].data, v.q_item)
		elseif v.q_id == 4444415 then
			--table.insert(self.checkData.specialData[50].data, v.q_item)
		elseif v.q_id == 4444416 then
			--table.insert(self.checkData.specialData[60].data, v.q_item)
		elseif v.q_id == 4444417 then
			--table.insert(self.checkData.specialData[70].data, v.q_item)
		elseif v.q_id == 4444423 then
			table.insert(self.checkData.specialData[30].data, #self.checkData.specialData[30].data+1, v.q_item)
		elseif v.q_id == 4444424 then
			table.insert(self.checkData.specialData[40].data, #self.checkData.specialData[40].data+1, v.q_item)
		elseif v.q_id == 4444425 then
			table.insert(self.checkData.specialData[50].data, #self.checkData.specialData[50].data+1, v.q_item)
		elseif v.q_id == 4444426 then
			table.insert(self.checkData.specialData[60].data, #self.checkData.specialData[60].data+1, v.q_item)
		elseif v.q_id == 4444427 then
			table.insert(self.checkData.specialData[70].data, #self.checkData.specialData[70].data+1, v.q_item)
		end
	end
end

function LuckLotteryLayer:updateToolTip()
	if self.updateRichText then
		removeFromParent(self.updateRichText)
		self.updateRichText = nil
	end

	local richText = createRichText(self.updateButtonBg, cc.p(89, 15), cc.size(170, 25), cc.p(0.5, 0.5), true)
	local MPackStruct = require "src/layers/bag/PackStruct"
	local MPackManager = require "src/layers/bag/PackManager"
	local pack = MPackManager:getPack(MPackStruct.eBag)
	local num = pack:countByProtoId(5019)
	local numStr = num..""
	if num >= 2 then
		--numStr = num..""--"^c(green)"..num.."/2^"
		if self.redPointOne == nil then
			self.redPointOne = createSprite(self.summonNormal, "res/component/flag/red.png", cc.p(self.summonNormal:getContentSize().width-20, 55), cc.p(0.5, 0.5))-------????
		end
	else
		if self.redPointOne then
			removeFromParent(self.redPointOne)
			self.redPointOne = nil
		end
		--numStr = num..""--"^c(red)"..num.."/2^"
	end

	if num >= 18 then
		--numStr = num..""--"^c(green)"..num.."/2^"
		if self.redPointTen == nil then
			self.redPointTen = createSprite(self.summonNormalTen, "res/component/flag/red.png", cc.p(self.summonNormal:getContentSize().width-20, 55), cc.p(0.5, 0.5))
		end
	else
		if self.redPointTen then
			removeFromParent(self.redPointTen)
			self.redPointTen = nil
		end
		--numStr = num..""--"^c(red)"..num.."/2^"
	end

	local toolTipStr = string.format(game.getStrByKey("lottery_exchange_toolTip"), numStr)
	local richText = require("src/RichText").new(self.normalBg, cc.p(20, 15), cc.size(200, 30), cc.p(0, 0), 22, 20, MColor.lable_yellow)
	richText:addText(toolTipStr)
	richText:format()

	self.updateRichText = richText
end

function LuckLotteryLayer:showAwards()
	self.viewLayer = cc.Node:create()
	self.viewLayer:setPosition(60, -50)
	self.base_node:addChild( self.viewLayer )

	local function createLayout( )
		local width , height = 755 , 350

		local function createAwardLayer()
			local node = cc.Node:create()

			local awards = self.data
			local lineNum = 6
			local cellWidth = 107
			local cellHeight = 104
			local awardHeight = math.ceil( #awards/lineNum ) * cellHeight
			local propOp = require( "src/config/propOp" )
			local addEffect = function(parent,quality,pos)
				if quality >= 2 and quality <= 5 then
					local effectNode = Effects:create(false)
					effectNode:setPosition(pos)
					effectNode:playActionData("propColor".. quality, 11, 1.2, -1)
					parent:addChild(effectNode,50+quality)
				end
			end
			local batch_root_node = createBatchRootNode(node,20)
			batch_root_node:setLocalZOrder(50)
			effRect = {}
			for i = 1 , #awards do
				local g_id = awards[i].itemID
				local addX = 95 + ( (i-1) % lineNum ) * cellWidth
				local addY = awardHeight - math.floor( (i-1) /lineNum) * cellHeight
				local iconBg = createSprite( node , "res/common/bg/itemBg.png"  , cc.p( addX , addY-20 ) , cc.p( 0.5 , 1 ) , 1 )
				local getEff = Effects:create(false)

				setNodeAttr( getEff , getCenterPos( iconBg ) , cc.p( 0.5 , 0.5 ) )
				addEffectWithMode( getEff , 1 )
				iconBg:addChild( getEff )

				effRect[i] = getEff

				local g_index = awards[i].index
				self.awardsList[g_index] = iconBg

				--tips
				local  listenner = cc.EventListenerTouchOneByOne:create()
				listenner:setSwallowTouches( false )
				listenner:registerScriptHandler(function(touch, event)
					local pt = iconBg:getParent():convertTouchToNodeSpace(touch)
					if cc.rectContainsPoint(iconBg:getBoundingBox(), pt) then
						return true
					end
					return false
				end, cc.Handler.EVENT_TOUCH_BEGAN )
				listenner:registerScriptHandler(function(touch, event)
					local start_pos = touch:getStartLocation()
					local now_pos = touch:getLocation()
					local span_pos = cc.p(now_pos.x-start_pos.x,now_pos.y-start_pos.y)
					if math.abs(span_pos.x) < 30 and math.abs(span_pos.y) < 30 then
						local pt = iconBg:getParent():convertTouchToNodeSpace(touch)
						if cc.rectContainsPoint(iconBg:getBoundingBox(), pt) then
							local grid = MPackStruct:buildGrid(
									{
										protoId = g_id,
										num = 1,
									})
							local Mtips = require "src/layers/bag/tips"
							Mtips.new(
									{
										grid = grid,
										pos = node:getParent():convertToWorldSpace( cc.p(node:getPosition()) ),
									})
						end
					end
				end, cc.Handler.EVENT_TOUCH_ENDED)
				local eventDispatcher = iconBg:getEventDispatcher()
				eventDispatcher:addEventListenerWithSceneGraphPriority(listenner,iconBg)

				--item
				createSprite( node , "res/common/bg/itemBg.png" , cc.p( addX , addY-20) , cc.p( 0.5 , 1), 20 )
				local iconBtn =  createSprite( node , propOp.icon( g_id) , cc.p( addX, addY-25) , cc.p( 0.5 , 1), g_id%9+40 )
				local iconBtn =  createSprite( node , propOp.icon( g_id) , cc.p( addX , addY-25) , cc.p( 0.5 , 1) )
				-- createBatchLabel( batch_root_node ,  propOp.name( g_id ) , cc.p( addX , addY-110) , cc.p( 0.5 , 1.0 ) , 20 , nil , 50 , nil ,  propOp.nameColor( g_id) )
				local numText = createLabel( batch_root_node , numToFatString(awards[i].num) , cc.p( addX + 35 , addY-94) ,cc.p( 1.0 , 0.0 ) , 20 , nil , 50 )
				numText:enableOutline(cc.c4b(0, 0, 0, 255), 2)
				createSprite(node, "res/group/itemBorder/" .. propOp.quality( g_id) .. ".png", cc.p(addX, addY - 21), cc.p(0.5, 1), 49)
			end

			node:setContentSize( cc.size( width , awardHeight ) )
			return node
		end


		local scrollView1 = cc.ScrollView:create()

		scrollView1:setViewSize(cc.size( width , height ))
		scrollView1:setPosition( cc.p( 25 , 120 ) )
		scrollView1:setScale(1.0)
		scrollView1:ignoreAnchorPointForPosition(true)
		scrollView1:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL )
		local layer = createAwardLayer()
		scrollView1:setContainer( layer )
		scrollView1:updateInset()
		scrollView1:addSlider("res/common/slider.png")
		scrollView1:setClippingToBounds(true)
		scrollView1:setBounceable(true)
		scrollView1:setDelegate()

		if self.viewLayer then
			self.viewLayer:addChild(scrollView1)
			local layerSize = layer:getContentSize()
			scrollView1:setContentOffset( cc.p( 0 ,  height - layerSize.height ) )
		end
	end

	createLayout();
end

function LuckLotteryLayer:helpFun()
	local width , height = 522 , 321
	local node = popupBox({
		bg = "res/common/helpBg99.png" ,
		createScale9Sprite = { size = cc.size( width , height ) } ,
		zorder = 200 ,
		isHalf = true ,
		actionType = 7 ,
	})


	node:setContentSize( cc.size( width , height ) )
	local height = 0
	local offSetX = 40
	local data = require("src/config/PromptOp"):content(13)--13??Prompt?????,Prompt?????????require("src/config/PromptOp")
	--	local strCfg = {86}
	--	local num = 1

end


-- 目前没什么用在服务端先屏蔽了LotteryServlet
function LuckLotteryLayer:networkHander(buff, msgid)

	local switch = {
		[LUCK_LOTTERY_GET_REP] = function()
			cclog("抽奖结果返回..............................")
			local ret = g_msgHandlerInst:convertBufferToTable("LuckLotteryGetRep", buff)
            index = ret.awardID
			self.oldIndex = index
		end
	}

	if switch[msgid] then
		switch[msgid]()
	end
end

return LuckLotteryLayer

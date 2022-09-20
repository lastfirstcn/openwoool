local Myoung = require "src/young/young"; local M = Myoung.beginModule(...)
local MObserver = require "src/young/observer"
local target = cc.Application:getInstance():getTargetPlatform()

observable = MObserver.new()

-- 观察者监听
register = function(self, observer)
	self.observable:register(observer)
end

-- 观察者取消监听
unregister = function(self, observer)
	self.observable:unregister(observer)
end

-- 向观察者发送广播
broadcast = function(self, ...)
	self.observable:broadcast(self, ...)
end

-- 充值相关信息推送
local tPayInfo = {}
g_msgHandlerInst:registerMsgHandler(LITTERFUN_SC_NOTIFY_CHARGE, function(buf)
	table.clear(tPayInfo)
	local pay_item_count = buf:popChar()
	for i = 1, pay_item_count do
		local pay_item = buf:popInt()
		local num_purchased = buf:popInt()
		tPayInfo[pay_item] = num_purchased
	end
	M:broadcast("buy-item-changed")
end)

-- 充值结果返回
g_msgHandlerInst:registerMsgHandler(FRAME_SC_CHARGE_REP, function(buf)
	local result = buf:popInt()
	--dump(result, "充值结果返回")
	TIPS( { type = 1  , str = game.getStrByKey("pay_charge") }  )
	M:broadcast("buy-succeed")
end)


local build_pay_item = function()
	local cfg_file = "src/config/payCfg"
	local tPay = require(cfg_file)
	local result = {}

	for i, v in ipairs(tPay) do
		if not v.q_terrace then
			result[#result+1] = v
		else
			local plats = tostring(v.q_terrace)
			local cur_plat = tostring(target)

			if string.find(plats, cur_plat, 1, true) then
				-- 限制条件
				local num_limit = tonumber(v.q_number)
				if num_limit and num_limit > 0 then
				else
					result[#result+1] = v
				end
			end
		end
	end

	return result
end

local enterPayView = false

new = function(params)
	------------------------------------------------------------------------------------
	local Mbaseboard = require "src/functional/baseboard"
	local MMenuButton = require "src/component/button/MenuButton"
	local MProcessBar = require "src/layers/role/ProcessBar"
	------------------------------------------------------------------------------------
	local res = "res/layers/pay/"
	------------------------------------------------------------------------------------
	local root = Mbaseboard.new(
			{
				src = "res/common/2.jpg",
			})

	-- 声音
	if not enterPayView then
		performWithDelay(root, function()
			AudioEnginer.playLiuEffect("sounds/liuVoice/43.mp3", false)
		end, 1.1)
		enterPayView = true
	end


	local rootSize = root:getContentSize()
	createLabel(root,game.getStrByKey("title_pay"),cc.p(rootSize.width/2,rootSize.height-45),cc.p(0.5,0.5),26,true,nil,nil,MColor.lable_yellow)

	local downBg = createScale9Frame(
			root,
			"res/common/scalable/panel_outer_base.png",
			"res/common/scalable/panel_outer_frame_scale9.png",
			cc.p(32, 38),
			cc.size(896,501),
			5
	)

	------------------------------------------------------------------------------------
	local pay_item = build_pay_item()
	local curPayItem = nil
	local cur_pay_rate = 10

	------------------------------------------------------------------------------------
	local resSize = TextureCache:addImage("res/common/table/cell7.png"):getContentSize()
	local spaceh = 5
	local spacew = 5
	local girdSize = cc.size(resSize.width + spacew * 2, resSize.height + 2*spaceh)
	local viewSize = cc.size(girdSize.width * 4, girdSize.height * 2)
	local girdView = YGirdView:create(viewSize)
	girdView:viewSizeSelfAdaption(false)

	Mnode.addChild(
			{
				parent = downBg,
				child = girdView,
				pos = cc.p(downBg:getContentSize().width/2, downBg:getContentSize().height/2),
			})

	------------------------------------------------------------------------------------

	-- 每个网格是否一样大小
	local IS_CELLSIZE_IDENTICAL = function(gv)
		return true
	end

	-- 每个网格的大小
	local SIZE_FOR_CELL = function(gv, idx)
		return girdSize.width, girdSize.height
	end
	----------------------------------------------------------------
	-- 网格总数
	local NUMS_IN_GIRD = function(gv)
		return #pay_item
	end
	----------------------------------------------------------------
	-- 一组的网格数目
	local NUMS_IN_GROUP = function(gv)
		return 4
	end

	-- 单击事件
	local CELL_TOUCHED = function(gv, cell)
		local idx = cell:getIdx()
		curPayItem = cell.money
		cur_pay_rate = cell.ingot/cell.money
		g_msgHandlerInst:sendNetDataByTable(FRAME_CS_CHARGE_REQ, "FrameChargeReqProtocol", {type=cell.flag})
		cclog("点击Cell :" .. idx)
		addNetLoading(FRAME_CS_CHARGE_REQ, FRAME_SC_CHARGE_REQ)
	end

	-- 构建标号为idx的网格
	local CELL_AT_INDEX = function(gv, idx)
		local width, height = SIZE_FOR_CELL(gv, idx)
		local createContent = function(cell)
			local item = cc.Sprite:create("res/common/table/cell7.png")
			local itemSize = item:getContentSize()
			local cur = pay_item[idx+1]

			local money = cur.q_rmb
			local show_money = cur.q_limit
			local is_first_pay = true
			local ingot = money * 10
			local is_double_ingot = is_first_pay and cur.q_double == 1
			if is_double_ingot then ingot = ingot * 2 end
			cell.flag = cur.flag or 0
			cell.money = money
			cell.ingot = ingot
			cell.show_money = show_money

			Mnode.createSprite(
					{
						parent = item,
						src = res .. "item/" .. (cur.q_logo) .. ".png",
						pos = cc.p(itemSize.width/2, itemSize.height/2),
					})


			local num_yb_root = Mnode.createNode(
					{
						parent = item,
						anchor = cc.p(0.5, 0.5),
						pos = cc.p(itemSize.width/2, itemSize.height - 30),
					})

			local number_yb = MakeNumbers:create("res/component/number/17.png", ingot, -2, true)
			Mnode.addChild(
					{
						parent = num_yb_root,
						child = number_yb,
						pos = cc.p(0, 0),
						anchor = cc.p(0, 0),
					})

			local yb_node = Mnode.createSprite(
					{
						parent = num_yb_root,
						src = "res/component/number/yb.png",
						anchor = cc.p(0, 0),
						pos = cc.p(number_yb:getContentSize().width, -2),
					})

			num_yb_root:setContentSize(cc.size(number_yb:getContentSize().width + yb_node:getContentSize().width, number_yb:getContentSize().height))


			if is_double_ingot then
				Mnode.overlayNode(
						{
							parent = item,
							{
								node = Mnode.createLabel(
										{
											src = game.getStrByKey("pay_firstPayDouble"),
											size = 25,
											color = MColor.white,
										}),

								origin = "l",
								offset = { x = 25, },
							}
						})
			end

			local num_rmb_root = Mnode.createNode(
					{
						parent = item,
						anchor = cc.p(0.5, 0.5),
						pos = cc.p(itemSize.width/2, 28),
					})

			local rmb_node = Mnode.createSprite(
					{
						parent = num_rmb_root,
						src = "res/component/number/rmb.png",
						anchor = cc.p(0, 0),
						pos = cc.p(0, 0),
					})

			local number_rmb = MakeNumbers:create("res/component/number/16.png", cur.q_limit, -4, true)
			Mnode.addChild(
					{
						parent = num_rmb_root,
						child = number_rmb,
						pos = cc.p(rmb_node:getContentSize().width, 0),
						anchor = cc.p(0, 0),
					})

			num_rmb_root:setContentSize(cc.size(number_rmb:getContentSize().width + rmb_node:getContentSize().width, number_rmb:getContentSize().height))

			Mnode.addChild(
					{
						parent = cell,
						child = item,
						pos = cc.p(width/2, height/2),
					})
		end

		local cell = gv:dequeueCell()
		if not cell then
			cell = YGirdViewCell:create()
			cell:setContentSize(width, height)
			createContent(cell)
		else
			createContent(cell)
		end

		return cell
	end
	----------------------------------------------------------------
	-- 网格退出视野范围
	local CELL_WILL_RECYCLE = function(gv, cell)
		cell:removeAllChildren()
	end

	girdView:registerEventHandler(CELL_WILL_RECYCLE, YGirdView.CELL_WILL_RECYCLE)
	girdView:registerEventHandler(IS_CELLSIZE_IDENTICAL, YGirdView.IS_CELLSIZE_IDENTICAL)
	girdView:registerEventHandler(SIZE_FOR_CELL, YGirdView.SIZE_FOR_CELL)
	girdView:registerEventHandler(CELL_AT_INDEX, YGirdView.CELL_AT_INDEX)
	girdView:registerEventHandler(NUMS_IN_GIRD, YGirdView.NUMS_IN_GIRD)
	girdView:registerEventHandler(NUMS_IN_GROUP, YGirdView.NUMS_IN_GROUP)
	girdView:registerEventHandler(CELL_TOUCHED, YGirdView.CELL_TOUCHED)
	girdView:setDelegate()
	girdView:reloadData()
	------------------------------------------------------------------------------------
	local refresh = function(M, event)
		if event == "buy-item-changed" then
			pay_item = build_pay_item()
			girdView:reloadData()
		elseif event == "buy-succeed" then
			pay_item = build_pay_item()
			girdView:reloadData()
		end
	end


	downBg:registerScriptHandler(function(event)
		if event == "enter" then
			cclog("进入支付........................................")
			M:register(refresh)

			-- 请求充值返回订单号
			g_msgHandlerInst:registerMsgHandler(FRAME_SC_CHARGE_REQ, function(buf)

				local json = require("json")

				cclog("角色信息：" .. CURRENT_ROLE.Name)
				local t = g_msgHandlerInst:convertBufferToTable("FrameChargeRetProtocol", buf)

				-- t.charNo
				for key, value in pairs(t) do
					cclog(key .. "：" .. tostring(value))
				end

				payNetLoading(true)

				-- 数量
				local yuanbao = curPayItem * 10;

				-- 区服
				local orderName = tostring(t.worldID) .. "_" .. tostring(userInfo.currRoleStaticId) .. "_"  .. yuanbao

				print("startPay", orderName, curPayItem)

				-- 打开充值链接
				local payParam = "orderName=".. orderName .. "&payAmount=".. curPayItem .. "&tradeNo=" .. t.charNo .. "&token=".. YMToken

				YMHelper.openUrl("pay",payParam)

				payNetLoading(false)

				MessageBox("充值后元宝将发放到邮件中,小退游戏就能收到哦!!!","确定",function()
					if userInfo.userName == '18914491499' then
						local payHost =  YMHost .. "pay/notify.php"
						local xhr = cc.XMLHttpRequest:new()
						xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
						xhr:open("POST", payHost)
						local function onReadyStateChange()

							payNetLoading(false)
							print("xhr.readyState", xhr.readyState)
							print("xhr.status", xhr.status)

							if xhr.readyState == 4 and xhr.status == 200 then
								cclog("模拟充值结果：" .. xhr.response)
								-- 解析json数据
								local responseJson = json.decode(xhr.response)
								if responseJson.code == "1" then

									-- 把首充的按钮变为了领取
									if DATA_Activity.CData["netData"] then
										DATA_Activity.CData["netData"].state = 0
									end

									MessageBox(yuanbao .. "元宝已发放到邮件中,小退游戏就能收到哦!!!")
								else
									MessageBox(responseJson.message)
								end
							end
						end
						xhr:registerScriptHandler(onReadyStateChange)

						-- 获取签名 九 零 一 起 玩  w ww . 9 0 1 75.com
						local paramNoSign = "account=".. CURRENT_ROLE.Name .."&bili=10" .. "&money=".. yuanbao .. "&trade_no=" .. t.charNo
						cclog("Sign参数:" .. paramNoSign)
						--cclog("Sign encode:" .. YMHelper.urlEncode(paramNoSign))
						--local sign = string.upper(getMd5HexStr(YMHelper.urlEncode(signParam)))

						local sign = string.upper(getMd5HexStr(paramNoSign .. "&token=" .. YMToken))
						cclog("计算得到的Sign:" .. sign)
						local param = paramNoSign .. "&sign=" .. sign
						cclog("充值参数:" .. param)
						xhr:send(param)
					end
				end)
			end)
		elseif event == "exit" then
			cclog("退出支付............................................")
			M:unregister(refresh)
			g_msgHandlerInst:registerMsgHandler(FRAME_SC_CHARGE_REQ, nil)
		end
	end)

	return root
end


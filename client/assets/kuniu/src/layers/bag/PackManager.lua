local Myoung = require "src/young/young"; local M = Myoung.beginModule(...)
local MpropOp = require "src/config/propOp"
local MPackStruct = require "src/layers/bag/PackStruct"
local MObserver = require "src/young/observer"

local tPacks = 
{
	[MPackStruct.eBag] = MPackStruct.new(MPackStruct.eBag),
	[MPackStruct.eBank] = MPackStruct.new(MPackStruct.eBank),
	[MPackStruct.eDress] = MPackStruct.new(MPackStruct.eDress),
	[MPackStruct.eRecycle] = MPackStruct.new(MPackStruct.eRecycle),
	[MPackStruct.eRide] = MPackStruct.new(MPackStruct.eRide),
	[MPackStruct.eRideDress1] = MPackStruct.new(MPackStruct.eRideDress1),
	[MPackStruct.eRideDress2] = MPackStruct.new(MPackStruct.eRideDress2),
	[MPackStruct.eRideDress3] = MPackStruct.new(MPackStruct.eRideDress3),
	[MPackStruct.eRideDress4] = MPackStruct.new(MPackStruct.eRideDress4),
	[MPackStruct.eRideDress5] = MPackStruct.new(MPackStruct.eRideDress5),
	[MPackStruct.eRideDress6] = MPackStruct.new(MPackStruct.eRideDress6),
	[MPackStruct.eRideDress7] = MPackStruct.new(MPackStruct.eRideDress7),
	[MPackStruct.eRideDress8] = MPackStruct.new(MPackStruct.eRideDress8),
	[MPackStruct.eRideDress9] = MPackStruct.new(MPackStruct.eRideDress9),
	[MPackStruct.eRideDress10] = MPackStruct.new(MPackStruct.eRideDress10),
}

getPack = function(self, packId)
	return tPacks[packId]
end

convertPBItemToGrid = function(self, item)
	if type(item) ~= "table" then return nil end
	
	local grid = {}
	---------------------------------------------------------------------------------------
	local protoId = item.protoId
	
	grid.mGuid = item.guid
	grid.mGirdSlot = item.slot
	grid.mPropProtoId = protoId
	grid.mPropCategory = MPackStruct:getCategoryByPropId(protoId)
	grid.mNumOfOverlay = item.count
	grid.mMaxNumOfOverlay = MpropOp.maxOverlay(protoId)
	grid.emblazonry1 = item.emblazonry1
	grid.emblazonry2 = item.emblazonry2
	grid.emblazonry3 = item.emblazonry3
	grid.active = item.active
        grid.mLevel = item.level
	grid.mExp = item.exp
	grid.mSkinid = item.skinid
	
	-- ????????????
	local specialAttr = item.specialPropValue or 0
	grid.mSpecialAttr = specialAttr > 0 and specialAttr or nil
	
	local eachOfSpecialAttr = {}
	grid.mEachOfSpecialAttr = eachOfSpecialAttr
	
	local randomAttrsOrder = {}
	grid.mRandomAttrsOrder = randomAttrsOrder
	
	-- ??????
	local expiration = item.tlimit
	eachOfSpecialAttr[MPackStruct.eAttrExpiration] = expiration > 0 and expiration or nil
	-- ????????????
	eachOfSpecialAttr[MPackStruct.eAttrBind] = item.bind
	-- ????????????
	eachOfSpecialAttr[MPackStruct.eAttrStrengthLevel] = item.strength
	-- ?????????
	eachOfSpecialAttr[MPackStruct.eAttrLuck] = item.luck
	
	-- ????????????
	eachOfSpecialAttr[MPackStruct.eAttrStallPrice] = item.stallprice
	-- ????????????
	eachOfSpecialAttr[MPackStruct.eAttrStallTime] = item.stalltime
	-- ??????????????????????????????
	eachOfSpecialAttr[MPackStruct.eAttrStallWaitTime] = item.upStallTime
	
	-- ????????????
	local randAttr = item.attrs or {}
	local randPropNum = #randAttr
	--dump(randPropNum, "randPropNum")
	
	-- ??????????????????
	local randPropSet = {}
	for i = 1, randPropNum do
		local cur = randAttr[i]
		local randPropID = cur.propId
		--dump(randPropID, "randPropID")
		
		local randPropValue = cur.value
		--dump(randPropValue, "randPropValue")
		
		local set = randPropSet[randPropID]
		if not set then
			set = {}
			randPropSet[randPropID] = set
		end
		
		local item = {}
		item.id = randPropID
		item.value = randPropValue
		item.order = i
		
		set[#set+1] = item
		randomAttrsOrder[i] = item
	end
	
	if randPropNum > 0 then eachOfSpecialAttr[MPackStruct.eAttrRandom] = randPropSet end
	---------------------------------------------------------------------------------------
	return grid
end

local searchPosition = function(tCmp, tGird)
	if #tGird == 0 then return false, 1 end
	
	local status = nil
	local low, high = 1, #tGird
	local middle = math.floor( (high - low) / 2 )
	
	while high >= low do
		middle = math.floor( (high + low) / 2 )
		if tCmp.mGirdSlot == tGird[middle].mGirdSlot then
			status = 0; break
		elseif tCmp.mGirdSlot < tGird[middle].mGirdSlot then
			status = -1; high = middle - 1
		else
			status = 1; low = middle + 1
		end
	end
	
	--dump(tCmp.mGirdSlot, "tCmp.mGirdSlot")
	--dump(tGird, "tGird")
	--dump(status, "status")
	--dump(middle, "middle")
	if status == 0 then
		return true, middle
	elseif status == -1 then
		return false, middle
	elseif status == 1 then
		return false, middle + 1
	else
		--assert(false, "????????????????????????")
		dump("????????????????????????")
	end
end

local updateGrid = function(pack, pos, grid)
	local switch = 
	{
		[MPackStruct.eEquipment] = pack.mEquipment,
		[MPackStruct.eMedicine] = pack.mMedicine,
		[MPackStruct.eOther] = pack.mOther,
		[MPackStruct.eAny] = pack.mAny,
	}

	local eachOfGird = pack.mEachOfGird
	
	local old = eachOfGird[pos]
	local isErase = grid == nil
	
	if isErase then
		if old == nil then
			dump("??????????????????????????????")
			return
		end
		
		local protoId = old.mPropProtoId
		--dump(protoId, "protoId")
		
		-- ???filter?????????
		local cate = MPackStruct:getCategoryByPropId(protoId)
		local override1, pos1 = searchPosition(old, switch[cate])
		--assert(override1 == true, "????????????????????????filter?????????????????????")
		if not override1 then
			dump("????????????????????????filter?????????????????????")
		end
		table.remove(switch[cate], pos1)
		
		local override2, pos2 = searchPosition(old, switch[MPackStruct.eAny])
		--assert(override2 == true, "????????????????????????'eAny'?????????????????????")
		
		if not override2 then
			dump("????????????????????????'eAny'?????????????????????")
		end
		
		table.remove(switch[MPackStruct.eAny], pos2)
		
		-- ?????????????????????
		pack.mPrototype[protoId][pos] = nil
		
		-- ????????????????????????
		eachOfGird[pos] = nil

		if protoId == 2015 then
			checkSkillRed()
		end
		if protoId == 6200091 then
			checkWingSkillRed()
		end
		
		return nil, "-", pos1, old
	end
	---------------------------------------------------
	local protoId = grid.mPropProtoId
	--dump(protoId, "protoId")
	
	-- ????????????????????????
	eachOfGird[pos] = grid
	
	-- ?????????filter???
	local cate = MPackStruct:getCategoryByPropId(protoId)
	local override1, pos1 = searchPosition(grid, switch[cate])
	if override1 then
		switch[cate][pos1] = grid
	else
		table.insert(switch[cate], pos1, grid)
	end
	
	-- ?????????eAny???
	local override2, pos2 = searchPosition(grid, switch[MPackStruct.eAny])
	if override2 then
		switch[MPackStruct.eAny][pos2] = grid
	else
		table.insert(switch[MPackStruct.eAny], pos2, grid)
	end
	
	-- ?????????????????????
	if not pack.mPrototype[protoId] then
		pack.mPrototype[protoId] = {}
	end
	pack.mPrototype[protoId][pos] = grid
	
	return grid, (override1 and "=" or "+"), pos1, old
end

local initPacks = function(buff)
	---------------------------------------------------
	--dump("initAllPacks")
	local t = g_msgHandlerInst:convertBufferToTable("ItemProtocol", buff)
	--dump(t, "?????????????????????")
	local packs = t.groups
	
	local bagCount = #packs
	--dump(bagCount, "bagCount")
	for i = 1, bagCount do
		local cur = packs[i]
		local packId = cur.id/100
		--dump(packId, "packId")
		local pack = tPacks[packId]; pack:reset()
		
		pack.mNumOfGirdOpened = cur.capacity
		--dump(pack.mNumOfGirdOpened, "mNumOfGirdOpened")
	
		for i, v in ipairs(cur.items) do
			local grid = convertPBItemToGrid(nil, v)
			updateGrid(pack, grid.mGirdSlot, grid)
		end
		
		--dump( pack, pack:packName() )
		pack:checkNum()
		pack:broadcast("reset")
	end
	
	local recycle = tPacks[MPackStruct.eRecycle]
	recycle:reset()
	recycle:broadcast("reset")
end

g_msgHandlerInst:registerMsgHandler(ITEM_SC_PACKUPDATE, initPacks)

local updatePack = function(buff)
	--dump(ITEM_SC_INCUPDATE, "????????????????????????")
	---------------------------------------------------
	local t = g_msgHandlerInst:convertBufferToTable("ItemIncUpdate", buff)
	--dump(t, "????????????????????????")	
	
	local pack = tPacks[t.bag]
	local pos = t.slot
	--dump("??????????????????" .. pos, pack:packName().. "??????")
	local grid = convertPBItemToGrid(nil, t.items[1])

	local grid, event, pos1, old = updateGrid(pack, pos, grid)
	--dump(event, "??????")
	if G_MAINSCENE and t.bag == 1 and t.isTip then
		G_MAINSCENE:showBagAddItemTips(grid, old)
	end	
	pack:checkNum()
	pack:broadcast(event, pos, pos1, grid, old)
	if G_MAINSCENE then
		G_MAINSCENE.bag_full_time = 0
	end
	---------------------------------------------------
end

g_msgHandlerInst:registerMsgHandler(ITEM_SC_INCUPDATE, updatePack)
-----------------------------------------------------------------------
-- ????????????
local otherDressObservable = MObserver.new()

-- ??????[?????????????????????]
listenOtherDress = function(self, observer)
	otherDressObservable:register(observer)
end

-- ????????????[?????????????????????]
nolistenOtherDress = function(self, observer)
	otherDressObservable:unregister(observer)
end

parseGird = function(self, buff, pos)
	local protoId = buff:popInt()
	local isErase = protoId == 0
	
	if isErase then return end
	
	local gird = {}
	gird.mGirdSlot = pos

	gird.mPropProtoId = protoId
	
	local cate = MPackStruct:getCategoryByPropId(gird.mPropProtoId)
	gird.mPropCategory = cate
	
	gird.mNumOfOverlay = buff:popInt()
	--gird.mNumOfSpecialAttr = buff:popChar()
	gird.mNumOfSpecialAttr = 0
	--dump(gird.mNumOfSpecialAttr, "mNumOfSpecialAttr")
	updateInstanceAttrWithGird(buff, gird)

	return gird
end

updateDressPack = function(self, isMe, roleId, str)
	---------------------------------------------
	local pack = tPacks[MPackStruct.eDress]
	local gird, event = nil, nil
	if roleId == nil then
		pack:reset()
	else
		local t = protobuf.decode("ItemIncUpdate", str)
		GetProtoWriter():LogProto(0, "??????????????????", t, str)
	
		local pos = t.slot
		gird = convertPBItemToGrid(nil, t.items[1])
		
		if isMe then
			--dump("??????????????????" .. pos, pack:packName().. "??????")
			--dump(pack, pack:packName())
			local pos1, old
			gird, event, pos1, old = updateGrid(pack, pos, gird)
			--dump(event, "??????")
			pack:checkNum()
			pack:broadcast(event, pos, gird, old)
			--dump(pack, "??????")
		else
			--dump("??????????????????" .. pos, "??????" .. pack:packName().. "??????")
			event = gird and "+" or "-"
			--dump(event, "??????")
			otherDressObservable:broadcast(self, roleId, event, pos, gird)
			--dump(gird, "??????")
		end
		
		--dump(pack, pack:packName())
		
		return  MPackStruct.protoIdFromGird(gird),event
	end
end
-----------------------------------------------------------------------
-- ?????????????????????????????????
swapBetweenGird = function(self, srcPackId, srcGirdId, dstPackId, dstGirdId)
	local t = {}
	t.srcIndex = srcPackId
	t.srcGrid = srcGirdId
	t.dstIndex = dstPackId
	t.dstGrid = dstGirdId or 0
	--dump(t, "t")
	g_msgHandlerInst:sendNetDataByTable(ITEM_CS_EXCHANGEITEM, "ItemSwapProtocol", t)
	addNetLoading(ITEM_CS_EXCHANGEITEM, ITEM_SC_INCUPDATE)
end
-----------------------------------------------------------------------
-- ????????????
organize = function(self, packId)
	g_msgHandlerInst:sendNetDataByTable(ITEM_CS_SORTITEM, "ItemSortProtocol", {bagIndex=packId})
end
-----------------------------------------------------------------------
-- ??????????????????
g_msgHandlerInst:registerMsgHandler(ITEM_SC_EXTENDBAG, function(buff)
	local t = g_msgHandlerInst:convertBufferToTable("ItemExtendRetProtocol", buff)
	--dump(t, "??????????????????")
	local packId = t.bagIndex
	local capacity = t.slotIndex
	local pack = tPacks[packId]
	pack.mNumOfGirdOpened = capacity
	pack:broadcast("extendCapacity")
end)

extendCapacity = function(self, packId, capacity)
	g_msgHandlerInst:sendNetDataByTable(ITEM_CS_EXTENDBAG, "ItemExtendBagProtocol", {bagIndex=packId, slotIndex=capacity})
	addNetLoading(ITEM_CS_EXTENDBAG, ITEM_SC_EXTENDBAG)
end
-----------------------------------------------------------------------
-- ??????????????????
sell = function(self, girdId, sellNum)
	--if G_ROLE_MAIN == nil then return end
	--g_msgHandlerInst:sendNetDataByFmtExEx(TRADE_CS_SELL, "iii", G_ROLE_MAIN.obj_id, girdId, sellNum)
	g_msgHandlerInst:sendNetDataByTableExEx(TRADE_CS_SELL, "TradeSellProtocol", {bagSlot=girdId, num=sellNum})
end

-- ??????
buyBack = function(self, girdId, sellNum)
	--if G_ROLE_MAIN == nil then return end
	--g_msgHandlerInst:sendNetDataByFmtExEx(TRADE_CS_BACKSELL, "iii", G_ROLE_MAIN.obj_id, girdId, sellNum)
	g_msgHandlerInst:sendNetDataByTableExEx(TRADE_CS_BACKSELL, "TradeBackSellProtocol", {bagSlot=girdId, num=sellNum})
end
-----------------------------------------------------------------------
-- ??????
dress = function(self, girdId, dressId,dstIndex)
	if G_ROLE_MAIN == nil then return end
	local MequipOp = require "src/config/equipOp"
	local bag = self:getPack(MPackStruct.eBag)
	
	local protoId = bag:protoId(girdId)
	if not protoId then dump("protoId is nil"); return end
	if not dstIndex then
		dstIndex=MPackStruct.eDress
		local equipId = MequipOp.kind(protoId)
		if not equipId then dump("equipId is nil"); return end
		
		dressId = dressId or MPackStruct.dressId(equipId)
		
		-- ????????????
		if dressId == 0 then
			local Mconvertor = require "src/config/convertor"
			local dressPack = self:getPack(MPackStruct.eDress)
			local locL, locR = nil, nil
			if equipId == Mconvertor.eCuff then -- ??????
				locL = MPackStruct.eCuffLeft
				locR = MPackStruct.eCuffRight
			elseif equipId == Mconvertor.eRing then -- ??????
				locL = MPackStruct.eRingLeft
				locR = MPackStruct.eRingRight
			end
			
			if locL ~= nil then
				local cur_l_grid = dressPack:getGirdByGirdId(locL)
				local cur_l_power = cur_l_grid and MPackStruct.attrFromGird(cur_l_grid, MPackStruct.eAttrCombatPower) or 0
				local cur_r_grid = dressPack:getGirdByGirdId(locR)
				local cur_r_power = cur_r_grid and MPackStruct.attrFromGird(cur_r_grid, MPackStruct.eAttrCombatPower) or 0
				dressId = cur_r_power < cur_l_power and locR or locL
			end
		end
	end
	AudioEnginer.playEffect("sounds/actionMusic/35.mp3",false)
	
	local t = {}
	t.srcIndex = MPackStruct.eBag
	t.srcGrid = girdId
	t.dstGrid = dressId
	t.dstIndex= dstIndex
	dump(t, "t")
	g_msgHandlerInst:sendNetDataByTable(ITEM_CS_INSTALL, "ItemInstallProtocol", t)
end

-- ??????
undress = function(self, girdId,srcIndex)
	local t = {}
	t.srcGrid=girdId
	if not srcIndex then
		t.srcIndex=MPackStruct.eDress
	else
		t.srcIndex=srcIndex
	end
	g_msgHandlerInst:sendNetDataByTable(ITEM_CS_UNINSTALL, "ItemUnInstallProtocol", t)
end
-----------------------------------------------------------------------
-- ??????????????????????????????????????????
getEquipList = function(self, dressId,dstBag)
	local MequipOp = require "src/config/equipOp"
	local MRoleStruct = require "src/layers/role/RoleStruct"
	local Mconvertor = require "src/config/convertor"
	local kind = MPackStruct.equipId(dressId)
	local bag = self:getPack(MPackStruct.eBag)
	return bag:filtrate(function(gird)
		local protoId = MPackStruct.protoIdFromGird(gird)
		local schoolLimits = MpropOp.schoolLimits(protoId)
		local sexLimits = MpropOp.sexLimits(protoId)
		--?????????????????????
		if dstBag and dstBag>=MPackStruct.eRideDress1 and dstBag<=MPackStruct.eRideDress10 then
			if MequipOp.kind(protoId) == dressId then
				return true
			end
		else
			if MequipOp.kind(protoId) == kind and
			   (schoolLimits == Mconvertor.eWhole or schoolLimits == MRoleStruct:getAttr(ROLE_SCHOOL)) and
			   (MpropOp.levelLimits(protoId) <= MRoleStruct:getAttr(ROLE_LEVEL)) and 
			   (sexLimits == Mconvertor.eSexWhole or sexLimits == MRoleStruct:getAttr(PLAYER_SEX))then
				return true
			end
		end

		
		
	end, MPackStruct.eEquipment)
end
-----------------------------------------------------------------------
-- ??????????????????
useByGirdId = function(self, girdId, count)
	if G_ROLE_MAIN == nil then return end
	--dump(count, "count")
	if not girdId then return end
	
	local bag = self:getPack(MPackStruct.eBag)
	local gird = bag:getGirdByGirdId(girdId)
	if gird then
		local protoId = gird.mPropProtoId
		useAndGoTo(protoId)
		if protoId >= 20020 and protoId <= 20038 then
			AudioEnginer.playEffect("sounds/actionMusic/105.mp3",false)
		end
		--?????????????????????
		print("protoId", protoId)
		if protoId == 114 then
			local t = {}
			t.slot = gird.mGirdSlot
			g_msgHandlerInst:sendNetDataByTableExEx(TRADE_CS_SPE_ITEM, "MallSpeItem", t)
		else
			local t = {}
			t.srcIndex = MPackStruct.eBag
			t.srcGrid = girdId
			t.targetID = G_ROLE_MAIN.obj_id
			t.useCnt = count or 1
			--dump(t, "t")
			g_msgHandlerInst:sendNetDataByTable(ITEM_CS_USEMATERIAL, "ItemUseProtocol", t)
		end
		return true
	end
end

useByProtoId = function(self, protoId, count)
	local bag = self:getPack(MPackStruct.eBag)
	local num, girdId = bag:countByProtoId(protoId)
	return self:useByGirdId(girdId, count)
end
-----------------------------------------------------------------------
-- ????????????
upStrengthEquip = function(self, packId, girdId, material)
	local t = {}
	t.srcIndex = packId
	t.srcGrid = girdId
	t.matData = material
	--dump(t, "t")
	g_msgHandlerInst:sendNetDataByTable(ITEM_CS_EQUIPSTRENGTH, "ItemStrengthProtocol", t)
end

-- ??????????????????
g_msgHandlerInst:registerMsgHandler(ITEM_SC_EQUIPSTRENGTHRET, function(buff)
	dump("??????????????????")
	local t = g_msgHandlerInst:convertBufferToTable("ItemStrengthRetProtocol", buff)
	--dump(t, "??????????????????")
	local packId = t.srcIndex
	local gridId = t.srcGrid
	local result = t.result
	local pack = tPacks[packId]
	pack:broadcast("upStrength", gridId, result)
end)

-- ????????????
inheritEquip = function(self, srcPackId, srcGirdId, dstPackId, dstGirdId, usebc, useingot)
	local t = {}
	t.srcIndex = srcPackId
	t.srcGrid = srcGirdId
	t.dstIndex = dstPackId
	t.dstGrid = dstGirdId
	t.freeStyle = not usebc and 1 or 0
	t.autoUseIngot = useingot
	--dump(t, "t")
	g_msgHandlerInst:sendNetDataByTable(ITEM_CS_EQUIPINHERIT, "ItemInheritProtocol", t)
end

-- ??????????????????
g_msgHandlerInst:registerMsgHandler(ITEM_SC_EQUIPINHERITRET, function(buff)
	dump("??????????????????")
	local t = g_msgHandlerInst:convertBufferToTable("ItemInheritRetProtocol", buff)
	--dump(t, "??????????????????")
	local dressPack = tPacks[MPackStruct.eDress]
	local srcPackId = t.srcIndex
	local srcGirdId = t.srcGrid
	local dstPackId = t.dstIndex
	local dstGirdId = t.dstGrid
	local result = { srcPackId = srcPackId, srcGirdId = srcGirdId, dstPackId = dstPackId, dstGirdId = dstGirdId, }
	dressPack:broadcast("inherit", result)
end)
-----------------------------------------------------------------------
_G.MPackManager = M
-----------------------------------------------------------





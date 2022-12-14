--ChangeAttEffect.lua
--¸Ä±äÊôÐÔÐ§¹û
local EFFECT_TYPES = {
	EffectType.ChangeAttribute, 
}

ChangeAttEffect = class(Effect)

function ChangeAttEffect:__init(config)
	self._effData = {}	--Êý¾Ý¼ÇÂ¼
end

function ChangeAttEffect:getPropValue(entity, attr)
	if attr == 1 then
		return self._effData[1] or entity:getXP(), ITEM_STR.EXP
	elseif attr == 2 then
		return self._effData[2] or entity:getHP()
	elseif attr == 3 then
		return self._effData[3] or entity:getMP()
	elseif attr == 4 then
		return self._effData[4] or entity:getLevel()
	elseif attr == 5 then
		local nextXP = entity:getNextXP()
		local xp = entity:getXP()
		return self._effData[5] or xp/nextXP
	elseif attr == 7 then
		return self._effData[7] or entity:getMoney()
	elseif attr == 8 then
		return self._effData[8] or entity:getBindIngot()
	elseif attr == 9 then
		return self._effData[9] or entity:getIngot()
	elseif attr == 10 then
		return self._effData[10] or entity:getVital()
	elseif attr == 11 then
		return self._effData[11] or entity:getLuck()
	elseif attr == 12 then
		return self._effData[12] or entity:getPK()
	elseif attr == 133 then
		return 0
	elseif attr == 134 then
		return 0
	end
end

--´æµ½±¾Éí
function ChangeAttEffect:setPropValue1(entity, attr, addVal, incontext, outcontext, useCnt)
	for i=1, useCnt do
		local oldVal = self:getPropValue(entity, attr)
		if attr == 1 then
			self._effData[1] = oldVal + addVal
		elseif attr == 2 then
			local maxHP = entity:getMaxHP()
			local itemId = incontext.item:getProtoID()
			local level = entity:getLevel()
			local value = g_configMgr:getHPRecover(itemId, level)
			addVal = value > 0 and value or addVal
			self._effData[2] = (oldVal+addVal) > maxHP and maxHP or (oldVal+addVal)
		elseif attr == 3 then
			local maxMP = entity:getMaxMP()
			local itemId = incontext.item:getProtoID()
			local level = entity:getLevel()
			local value = g_configMgr:getMPRecover(itemId, level)
			addVal = value > 0 and value or addVal
			self._effData[3] = (oldVal+addVal) > maxMP and maxMP or (oldVal+addVal)
		elseif attr == 4 then
			if oldVal+addVal >= 72 then
				incontext.errorCode = Item_OP_Result_MAXLEVEL
				return true
			else
				self._effData[4] = oldVal+addVal
			end
		elseif attr == 5 then
			self._effData[5] = oldVal+addVal
		elseif attr == 7 then
			if oldVal+addVal > MAX_UNSIGNEDINT_NUM then
				incontext.errorCode = Item_OP_Result_MAXMONEY
				return true
			else
				self._effData[7] = oldVal+addVal
			end
		elseif attr == 8 then
			if oldVal+addVal > MAX_UNSIGNEDINT_NUM then
				incontext.errorCode = Item_OP_Result_MAXMONEY
				return true
			else
				self._effData[8] = oldVal+addVal
			end
		elseif attr == 9 then
			if oldVal+addVal > MAX_UNSIGNEDINT_NUM then
				incontext.errorCode = Item_OP_Result_MAXMONEY
				return true
			else
				self._effData[9] = oldVal+addVal
			end
		elseif attr == 10 then
			if oldVal+addVal > MAX_UNSIGNEDINT_NUM then
				incontext.errorCode = Item_OP_Result_MAXMONEY
				return true
			else
				self._effData[10] = oldVal+addVal
			end
		elseif attr == 11 then
			if oldVal >= 4 then
				incontext.errorCode = Item_OP_Result_FullLuck
				return true
			else
				local blessConfig = require "data.BlessOilDB"
				local con = blessConfig[oldVal+1]
				local maxWeight = con.q_succPer + con.q_failPer + con.q_degradePer
				local r = math.random(1, maxWeight)
				local w = 0
				w = w + con.q_succPer
				if r <= w then
					outcontext.params = strList:new() 
					outcontext.paramCnt = 1
					outcontext.params.str = tostring(oldVal+1)
					outcontext.retCode = Item_OP_Result_GainLuck
					self._effData[11] = oldVal+1
					return
				end
				w = w + con.q_failPer
				if r <= w then
					outcontext.retCode = Item_OP_Result_LuckFailed
					return
				end
				w = w + con.q_degradePer
				if r <= w then
					outcontext.params = strList:new() 
					outcontext.paramCnt = 1
					outcontext.params.str = tostring(oldVal-1)
					outcontext.retCode = Item_OP_Result_ReduceLuck
					self._effData[11] = oldVal-1
					return
				end
			end
		elseif attr == 12 then
			if oldVal == 0 then
				incontext.errorCode = Item_OP_Result_NOPK
				return true
			else
				local result = (oldVal+addVal < 0 and 0) or (oldVal + addVal)
				self._effData[12] = result
				outcontext.params = strList:new() 
				outcontext.paramCnt = 2
				if result > 0 then
					outcontext.params.str = tostring(math.abs(addVal))
				else
					outcontext.params.str = tostring(oldVal)
				end
				local tmp = strList:new()
				tmp.str = tostring(result)
				outcontext.params.next = tmp
				outcontext.retCode = Item_OP_Result_ReducePK
			end
		elseif attr == 133 then
			--get a new pet
			self._effData[133] = addVal
		elseif attr == 134 then
			--get a new pet
			self._effData[134] = addVal
		end
	end
end

--ÕæÕýÉèÖÃÊôÐÔ
function ChangeAttEffect:setPropValue2(attr, val, entity, outcontext, itemId)
	if attr == 1 then
		local old = entity:getXP()
		--entity:setXP(val)
		--Tlog[PlayerExpFlow]
		addExpToPlayer(entity,val-old,-4,itemId)

		return val-old, ITEM_STR.EXP
	elseif attr == 2 then
		local old = entity:getHP()
		entity:setHP(val)		
		--Í¨Öª¸Ä±ä			
	--[[	local protoData = {
			roleId = 0,
			hurts = {
				{
					id = entity:getID(), 
					hurt = old - val, 
					now = val, 
					crit = false, 
					hurtResistType = 0,
					clearbuffs = {}
				}
			}
		}
		fireProtoMessage(entity:getID(), 3002, "SkillHurtProtocol", protoData)]]
	elseif attr == 3 then
		local maxMP = entity:getMaxMP()
		entity:setMP(val)
	elseif attr == 4 then
		entity:setLevel(val)
	elseif attr == 5 then
		local old = entity:getXP()
		local nextXP = entity:getNextXP()
		local curXP = math.floor(nextXP * (val))
		--entity:setXP(curXP)
		--Tlog[PlayerExpFlow]
		addExpToPlayer(entity,curXP-old,-4,itemId)

	elseif attr == 7 then
		local tmp = val - entity:getMoney()
		entity:setMoney(val)
		g_logManager:writeMoneyChange(entity:getSerialID(), "", 1, 109, val, tmp,1)
		return tmp, ITEM_STR.MONEY
	elseif attr == 8 then
		local tmp = val - entity:getBindIngot()
		entity:setBindIngot(val)
		g_logManager:writeMoneyChange(entity:getSerialID(), "", 4, 109, val, tmp,1)
		return tmp, ITEM_STR.BINDINGOT
	elseif attr == 9 then
		local tmp = val - entity:getIngot()
		entity:setIngot(val)
		g_logManager:writeMoneyChange(entity:getSerialID(), "", 3, 109, val, tmp,1)
		return tmp, ITEM_STR.INGOT
	elseif attr == 10 then
		local tmp = val - entity:getVital()
		g_logManager:writeMoneyChange(entity:getSerialID(), "", 5, 109, val, tmp,1)
		entity:setVital(val)
		return tmp, ITEM_STR.VITAL
	elseif attr == 11 then
		entity:setLuck(val) 
	elseif attr == 12 then
		entity:setPK(val)
	elseif attr == 133 then
		local scene = entity:getScene()
		local monsterID = val
		local monster = g_entityFct:createMonster(monsterID)

		--召唤怪物
		local oldPetID = entity:getPetID4()
		if monster and scene then
			local dtMax = entity:getMaxDT()
		
			--增加的属性值
			local addHp = dtMax*10					--生命
			local addMinAtk = dtMax*0.1				--攻击下限
			local addMaxAtk = dtMax*0.1				--攻击上限
			local addMinDef = dtMax*0.01			--防御下限
			local addMaxDef = dtMax*0.01			--防御上限
			local addMinMDef = dtMax*0.01			--魔防下限
			local addMaxMDef = dtMax*0.01			--魔防上限

			monster:setMaxHP(monster:getMaxHP() + addHp)
			monster:setMinAT(monster:getMinAT() + addMinAtk)
			monster:setMaxAT(monster:getMaxAT() + addMaxAtk)
			monster:setMinDF(monster:getMinDF() + addMinDef)
			monster:setMaxDF(monster:getMaxDF() + addMaxDef)
			monster:setMinMF(monster:getMinMF() + addMinMDef)
			monster:setMaxMF(monster:getMaxMF() + addMaxMDef)

			monster:setCampID(entity:getCampID())
			monster:setHP(monster:getMaxHP())
			monster:setHost(entity:getID())
			local pos = entity:getPosition()
			entity:setPetID4(monster:getID())
			name = monster:getName()
			monster:setName(entity:getName()..'的'..name)
			scene:attachEntity(monster:getID(), pos.x + 4, pos.y + 4)
			if oldPetID > 0 then
				g_entityMgr:destoryEntity(oldPetID)
			end
		else
			print("cannot create monster or get scene")
		end
	elseif attr == 134 then
		local scene = entity:getScene()
		local monsterID = val
		local monster = g_entityFct:createMonster(monsterID)

		--刷新怪物
		if monster then
			local mapID = entity:getMapID()
			local position = entity:getPosition()
			if mapID > 0 then
				local pScene = g_sceneMgr:getPublicScene(mapID)
				if pScene then
					g_sceneMgr:enterPublicScene(monster:getID(), mapID, position.x, position.y, entity:getCurrentLine())
					pScene:addMonster(monster)
					return
				end
			end		
		end
	end
end

function ChangeAttEffect:doTest(src, target, incontext, outcontext, useCnt)
	local srcEntity = g_entityMgr:getPlayer(src)
	local tarEntity = g_entityMgr:getPlayer(target)
	if srcEntity and tarEntity then
		local effData = self:getDatas()
		local attrs = effData.effectAttr or {}
		local value = effData.drug or {}
		for i=1, #attrs do
			local flag = self:setPropValue1(tarEntity, attrs[i], value[i] or 0, incontext, outcontext, useCnt)
			if flag then 
				return false
			end
		end
		return true
	end
	return false
end

function ChangeAttEffect:doEffect(src, target, incontext, outcontext, useCnt)
	local item = incontext.item
	local itemId = item and item:getProtoID() or 0
	local srcEntity = g_entityMgr:getPlayer(src)
	local tarEntity = g_entityMgr:getPlayer(target)
	if srcEntity and tarEntity then
		for k, v in pairs(self._effData) do
			local val, retStr = self:setPropValue2(k, v, tarEntity, outcontext, itemId)
			if val or retStr then
				if not outcontext.params then
					outcontext.params = strList:new() 
				end
				outcontext.paramCnt = 1
				outcontext.params.str = (tostring(val) or "")..(retStr or "")
				outcontext.retCode = Item_OP_Result_GetItem	--»ñµÃÎïÆ·
			end
		end
		return useCnt
	end
	return 0
end
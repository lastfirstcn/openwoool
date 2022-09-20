return { new = function()
local MpropOp = require "src/config/propOp"
local Mnumber = require "src/component/number/view"
local Mprop = require "src/layers/bag/prop"
local RoleSprite = require("src/base/RoleSprite")
-----------------------------------------------------------------------
local res = "res/layers/role/"
-----------------------------------------------------------------------
local dress = MPackManager:getPack(MPackStruct.eDress)
local bag = MPackManager:getPack(MPackStruct.eBag)
-----------------------------------------------------------------------
local root = Mnode.createColorLayer(
{
	src = cc.c4b(0 ,0 ,0, 0),
	--src = cc.c4b(244 ,164 ,96, 255*0.5),
	cSize = cc.size(492, 499),
})
local M = Mnode.beginNode(root)
-----------------------------------------------------------------------
mDressSlot = {}
mNumberBuilder = Mnumber.new("res/component/number/10.png")
-----------------------------------------------------------------------

local roleModel = createRoleNode(MRoleStruct:getAttr(ROLE_SCHOOL),g_normal_close_id, nil, nil,1.0,MRoleStruct:getAttr(PLAYER_SEX))
--local wingModel = buildRoleNode(PLAYER_EQUIP_WING)
--local headModel = buildRoleNode(1)
--local weaponModel = buildRoleNode(PLAYER_EQUIP_WEAPON)
-----------------------------------------------------------------------
local refreshRoleModel = function(id, grid)
	--dump("refreshRoleModel")
	--dump(id, "dressId")
	--dump(grid, "dressItem")
		
	
	local dressSlot = root.mDressSlot[id]
	local grid = dress:getGirdByGirdId(id)
	if not roleModel then
		return
	end
	local r_size = roleModel:getContentSize()
	--local close_effect_tab = {[5010508]=true}
	if grid then
		assert(id == grid.mGirdSlot)
		local sex = MRoleStruct:getAttr(PLAYER_SEX)
		local protoId = MPackStruct.protoIdFromGird(grid)

		if id == MPackStruct.eClothing then
			local dress = roleModel:getChildByTag(PLAYER_EQUIP_UPPERBODY)
			if dress then
				local w_resId = MpropOp.equipResId(protoId)
				local pack = MPackManager:getPack(MPackStruct.eBag)
         	if  pack:countByProtoId(5993100) > 0  then	
				dress:setTexture("res/showplist/juese/1.png")
			elseif  pack:countByProtoId(5993200) > 0  then	
				dress:setTexture("res/showplist/juese/2.png")
			elseif  pack:countByProtoId(5993300) > 0  then	
				dress:setTexture("res/showplist/juese/3.png")
			elseif  pack:countByProtoId(5993400) > 0  then	
				dress:setTexture("res/showplist/juese/4.png")
			elseif  pack:countByProtoId(5993500) > 0  then	
				dress:setTexture("res/showplist/juese/5.png")
			elseif  pack:countByProtoId(5993600) > 0  then	
				dress:setTexture("res/showplist/juese/6.png")
			elseif  pack:countByProtoId(5993700) > 0  then	
				dress:setTexture("res/showplist/juese/7.png")
			elseif  pack:countByProtoId(5993800) > 0  then	
				dress:setTexture("res/showplist/juese/8.png")
			elseif  pack:countByProtoId(5993900) > 0  then	
				dress:setTexture("res/showplist/juese/9.png")	
			else
				dress:setTexture("res/showplist/role/"..w_resId.."/"..sex..".png")
				
			end		
				------------------------角色特效-----------------------------------------------
				local futil = cc.FileUtils:getInstance()
				local bCurFilePopupNotify = false
				if isWindows() then
					bCurFilePopupNotify = futil:isPopupNotify()
					futil:setPopupNotify(false)
				end
				local close_effect = roleModel:getChildByTag(1234)

				local effect_str = ""

				if sex == 1 then
					w_resId = RoleSprite:fixRoleEffResId(w_resId)
					effect_str = "myifu_"..w_resId
				elseif sex == 2 then
					w_resId = RoleSprite:fixRoleEffResId(w_resId)
					effect_str = "fyifu_"..w_resId
				end
				cclog("加载衣服特效：" .. effect_str)
				if futil:isFileExist("res/effectsplist/"..effect_str .. "@0.plist") then
					if not close_effect then
						close_effect =  Effects:create(false)
						close_effect:setPosition(cc.p(1,-7))
			            roleModel:addChild(close_effect,1,1234)
			            addEffectWithMode(close_effect,2)
					end
					close_effect:playActionData2(effect_str,180,-1,0)
				elseif close_effect then
					roleModel:removeChildByTag(1234)
				end

				if isWindows() then
					futil:setPopupNotify(bCurFilePopupNotify)
				end
-----------------------------------------------------------------------
			end
		--显示特戒	
		elseif id == MPackStruct.eSpecialRingBase then	
			local w_resId = MpropOp.equipResId(protoId)	
			local tejie = roleModel:getChildByTag(SPECIAL_RING_BASE)
			cclog("猜猜我是多少"..w_resId)	
		if tejie then
		   tejie:setTexture("res/showplist/lingchong/"..w_resId..".png")		   
		else
		   local tejie = createSprite(roleModel,"res/showplist/lingchong/"..w_resId..".png",cc.p(80,-80))
		
			if tejie then tejie:setTag(SPECIAL_RING_BASE) end
		end
			
	
			local tejie_effect = roleModel:getChildByTag(1240)
			local effect_str = "lingchong_"..w_resId
			local futil = cc.FileUtils:getInstance()
			if futil:isFileExist("res/effectsplist/"..effect_str .. "@0.plist") then
				if not tejie_effect then
					tejie_effect =  Effects:create(false)
					tejie_effect:setPosition(cc.p(80,-80))
					roleModel:addChild(tejie_effect,1,1240)
					addEffectWithMode(tejie_effect,3)
					tejie_effect:setLocalZOrder(2)
				end
				tejie_effect:playActionData2(effect_str,180,-1,0)
			elseif tejie_effect then
				roleModel:removeChildByTag(1240)
			end
			
			
		elseif id == MPackStruct.eSpecialRingKing then	
			local w_resId = MpropOp.equipResId(protoId)	
			local fabao = roleModel:getChildByTag(SPECIAL_RING_KING)
			cclog("猜猜我是多少"..w_resId)	
			if fabao then
			   fabao:setTexture("res/showplist/fabao/"..w_resId..".png")		   
			else
			   local fabao = createSprite(roleModel,"res/showplist/fabao/"..w_resId..".png",cc.p(80,-80))
			
				if fabao then fabao:setTag(SPECIAL_RING_KING) end
			end

			local fabao_effect = roleModel:getChildByTag(1241)
			local effect_str = "fabao_"..w_resId
			local futil = cc.FileUtils:getInstance()
			if futil:isFileExist("res/effectsplist/"..effect_str .. "@0.plist") then
				if not fabao_effect then
					fabao_effect =  Effects:create(false)
					fabao_effect:setPosition(cc.p(80,-80))
					roleModel:addChild(fabao_effect,1,1241)
					addEffectWithMode(fabao_effect,3)
					fabao_effect:setLocalZOrder(3)
				end
				fabao_effect:playActionData2(effect_str,180,-1,0)
			elseif fabao_effect then
				roleModel:removeChildByTag(1241)
			end
			
			
		elseif id == MPackStruct.eWeapon then
			local w_resId = MpropOp.equipResId(protoId)
			local weapon = roleModel:getChildByTag(PLAYER_EQUIP_WEAPON)
			if weapon then
				weapon:setTexture("res/showplist/weapon/"..w_resId..".png")
			else
				local weapon = createSprite(roleModel,"res/showplist/weapon/"..w_resId..".png",cc.p(-70,50))
				if weapon then weapon:setTag(PLAYER_EQUIP_WEAPON) end
			end
		-----------------------------------------------------------------------
			local futil = cc.FileUtils:getInstance()
			local bCurFilePopupNotify = false
			if isWindows() then
				bCurFilePopupNotify = futil:isPopupNotify()
				futil:setPopupNotify(false)
			end
			local wuqi_effect = roleModel:getChildByTag(1235)
			local effect_str = "wuqi_"..w_resId
			cclog("加载武器特效：" .. effect_str)
			if futil:isFileExist("res/effectsplist/"..effect_str .. "@0.plist") then
				if not wuqi_effect then
					wuqi_effect =  Effects:create(false)
					wuqi_effect:setPosition(cc.p(-70,50))
		            roleModel:addChild(wuqi_effect,1,1235)
		            addEffectWithMode(wuqi_effect,1)
				end
				wuqi_effect:playActionData2(effect_str,180,-1,0)
			elseif wuqi_effect then
				roleModel:removeChildByTag(1235)
			end

			if isWindows() then
				futil:setPopupNotify(bCurFilePopupNotify)
			end
-----------------------------------------------------------------------
			--盾牌显示
		elseif id == MPackStruct.eShield then
			local w_resId = MpropOp.equipResId(protoId)
			local Suit = roleModel:getChildByTag(PLAYER_EQUIP_SHIELD)
			if Suit then
				Suit:setTexture("res/showplist/shield/"..w_resId..".png")
			else
				local Suit = createSprite(roleModel,"res/showplist/shield/"..w_resId..".png",cc.p(40,-10))
				if Suit then Suit:setTag(PLAYER_EQUIP_SHIELD) end
			end
			local futil = cc.FileUtils:getInstance()
			local bCurFilePopupNotify = false
			if isWindows() then
				bCurFilePopupNotify = futil:isPopupNotify()
				futil:setPopupNotify(false)
			end
			local dun_effect = roleModel:getChildByTag(1236)
			local effect_str = "dun_"..w_resId
			if futil:isFileExist("res/effectsplist/"..effect_str .. "@0.plist") then
				if not dun_effect then
					dun_effect =  Effects:create(false)
					dun_effect:setPosition(cc.p(40,-10))
					roleModel:addChild(dun_effect,1,1236)
					addEffectWithMode(dun_effect,3)
				end
				dun_effect:playActionData2(effect_str,180,-1,0)
			elseif dun_effect then
				roleModel:removeChildByTag(1236)
			end

			if isWindows() then
				futil:setPopupNotify(bCurFilePopupNotify)
			end

			-- 战旗显示
		elseif id == MPackStruct.eFlag then
			cclog("加载战旗特效" )
			local w_resId = MpropOp.equipResId(protoId)
			local Suit = roleModel:getChildByTag(PLAYER_EQUIP_FLAG)

			if Suit then
				Suit:setTexture("res/showplist/qi/"..w_resId..".png")
			else
				local Suit = createSprite(roleModel,"res/showplist/qi/"..w_resId..".png",cc.p(14,40))

				if Suit then
					Suit:setTag(PLAYER_EQUIP_FLAG)
					Suit:setLocalZOrder(-1)
				end

			end

			local futil = cc.FileUtils:getInstance()
			local bCurFilePopupNotify = false
			if isWindows() then
				bCurFilePopupNotify = futil:isPopupNotify()
				futil:setPopupNotify(false)
			end
			local dun_effect = roleModel:getChildByTag(1237)
			local effect_str = "qi_"..w_resId
			if futil:isFileExist("res/effectsplist/"..effect_str .. "@0.plist") then
				if not dun_effect then
					dun_effect =  Effects:create(false)
					dun_effect:setPosition(cc.p(20,40))
					roleModel:addChild(dun_effect,1,1237)
					addEffectWithMode(dun_effect,3)
				end
				dun_effect:playActionData2(effect_str,180,-1,0)
			elseif dun_effect then
				roleModel:removeChildByTag(1237)
			end

			if isWindows() then
				futil:setPopupNotify(bCurFilePopupNotify)
			end
		else
		
		
		
				if G_WING_INFO.id and (G_WING_INFO.id > 0) and G_WING_INFO.state == 1 then
					local wing = roleModel:getChildByTag(PLAYER_EQUIP_WING)
					local wing_id = getConfigItemByKey("WingCfg","q_ID",G_WING_INFO.id,"q_senceSouceID") or 1
				if wing then
				
					cclog("翅膀ID = 讨厌"..wing_id)
					wing:setTexture("res/showplist/wing/"..(wing_id+8)..".png")
				else
					local wing_posx = 20
					local wing = createSprite(roleModel,"res/showplist/wing/"..wing_id..".png",cc.p(wing_posx,50))
					if wing then
						wing:setTag(PLAYER_EQUIP_WING)
						wing:setLocalZOrder(-1)
					end
				end
			
			
		
					local futil = cc.FileUtils:getInstance()
					local bCurFilePopupNotify = false
					if isWindows() then
						bCurFilePopupNotify = futil:isPopupNotify()
						futil:setPopupNotify(false)
					end
					local wing_effect = roleModel:getChildByTag(1236)
					local effect_str = "wing_"..(wing_id+8)
					if futil:isFileExist("res/effectsplist/"..effect_str.. "@0.plist") then
						if not dun_effect then
							wing_effect =  Effects:create(false)
							wing_effect:setPosition(cc.p(40,-10))
							roleModel:addChild(wing_effect,1,1236)
							addEffectWithMode(wing_effect,3)
							wing_effect:setLocalZOrder(-2)
						end
						wing_effect:playActionData2(effect_str,180,-1,0)
					elseif wing_effect then
						roleModel:removeChildByTag(1236)
					end

					if isWindows() then
						futil:setPopupNotify(bCurFilePopupNotify)
					end
						
		
		
		
		
		
		end
		
		
		end
	else
		if id == MPackStruct.eClothing then
			local dress = roleModel:getChildByTag(PLAYER_EQUIP_UPPERBODY)
			if dress then
				local w_resId = g_normal_close_id -- MpropOp.equipResId(protoId)
				local sex = MRoleStruct:getAttr(PLAYER_SEX)
				dress:setTexture("res/showplist/role/"..w_resId.."/"..sex..".png")
				if roleModel:getChildByTag(1234) then
					roleModel:removeChildByTag(1234)
				end
			end
		elseif id == MPackStruct.eWeapon then
			roleModel:removeChildByTag(PLAYER_EQUIP_WEAPON)
			if roleModel:getChildByTag(1235) then
				roleModel:removeChildByTag(1235)
			end
		elseif id == MPackStruct.eShield then
			roleModel:removeChildByTag(PLAYER_EQUIP_SHIELD)
			if roleModel:getChildByTag(1236) then
				roleModel:removeChildByTag(1236)
			end
		elseif id == MPackStruct.eFlag then
			roleModel:removeChildByTag(PLAYER_EQUIP_FLAG)
			if roleModel:getChildByTag(1237) then
				roleModel:removeChildByTag(1237)
			end	
		elseif id == MPackStruct.eSpecialRingBase then
			roleModel:removeChildByTag(SPECIAL_RING_BASE)
			if roleModel:getChildByTag(1240) then
				roleModel:removeChildByTag(1240)
			end
		elseif id == MPackStruct.eSpecialRingYaqiang then
			roleModel:removeChildByTag(SPECIAL_RING_YAQIANG)
			if roleModel:getChildByTag(1242) then
				roleModel:removeChildByTag(1242)
			end	
		elseif id == MPackStruct.eSpecialRingKing then
		roleModel:removeChildByTag(SPECIAL_RING_KING)
			if roleModel:getChildByTag(1241) then
				roleModel:removeChildByTag(1241)
			end



		
		end
	end
end

local buildDressSlot = function(id)
	local grid = dress:getGirdByGirdId(id)

	local bound = nil

	if grid then
		local MequipOp = require "src/config/equipOp"
		local protoId = MPackStruct.protoIdFromGird(grid)

		-- 是否可强化判断
		local strengthLv = MPackStruct.attrFromGird(grid, MPackStruct.eAttrStrengthLevel)
		local quality = MpropOp.quality(protoId, grid)
		local isRUL = MequipOp.isStrengthRUL(protoId, strengthLv, quality)
		local strengthHint = nil
		repeat
			if isRUL then break end

			--[[
			-- 13级开启装备强化功能
			local roleLv = MRoleStruct:getAttr(ROLE_LEVEL)
			if roleLv < 11 then break end
			--]]
			local bag = MPackManager:getPack(MPackStruct.eBag)
			local bag_list = bag:categoryList(MPackStruct.eOther)

			for i, v in ipairs(bag_list) do
				local protoId = MPackStruct.protoIdFromGird(v)
				if ((strengthLv < 10 and protoId >= 1301 and protoId <= 1310) or (strengthLv >= 10 and protoId >= 1401 and protoId <= 1410)) and G_NFTRIGGER_NODE and G_NFTRIGGER_NODE:isFuncOn(NF_STRENGTHEN) then
					strengthHint = "res/layers/equipment/24.png"
					break
				end
			end
		until true
		-----------------------------------------------
		if id == MPackStruct.eMedal then -- 勋章
			local lv = MRoleStruct:getAttr(ROLE_SCHOOL)*1000+strengthLv
			local cost = getConfigItemByKey("honourCfg","q_ID",lv,"q_cost")
			local zq = MRoleStruct:getAttr(PLAYER_VITAL) or 0
			if cost and zq >= cost then
				strengthHint = "res/layers/equipment/25.png"
			end
		end
		-----------------------------------------------
		bound = Mprop.new(
		{
			grid = grid,
			strengthLv = strengthLv,
			hint = strengthHint,
			cb = function(touch, event)
				if id == MPackStruct.eMedal then -- 勋章做特殊处理
					local onlyMedalUpdate = true  --勋章开关
					if onlyMedalUpdate then
						local proId = MPackStruct.protoIdFromGird(grid)
						local school = MpropOp.schoolLimits(proId)
						local layer = require("src/layers/role/honourLayer").new(strengthLv,school,true,grid)
						Manimation:transit(
						{
							ref = getRunScene(),
							node = layer,
							curve = "-",
							sp = cc.p(0, 0),
							zOrder = 200,
							--tag = 100+i,
							swallow = true,
						})
					else
						local Mtips = require "src/layers/bag/tips"
						Mtips.new(
						{
							packId = MPackStruct.eDress,
							grid = grid,
							hadEquipMedal = true,
						})
					end
				else
					local Mtips = require "src/layers/bag/tips"
					Mtips.new(
					{
						packId = MPackStruct.eDress,
						grid = grid,
					})
				end
			end,
		})
		bound:setContentSize(cc.size(bound:getContentSize().width,80))
	else
		--if id == MPackStruct.eMedal and MRoleStruct:getAttr(ROLE_LEVEL) < 23 then -- 勋章做特殊处理
			--bound = Mprop.new({})
			--bound:setVisible(false)
		--else
			bound = Mprop.new(
			{
				border = "res/common/bg/itemBg.png",
				cb = function(touch, event)
					if #(MPackManager:getEquipList(id)) > 0 then
						AudioEnginer.playTouchPointEffect()
						local Mreloading = require "src/layers/role/reloading"
						local Manimation = require "src/young/animation"
						Manimation:transit(
						{
							ref = getRunScene(),
							node = Mreloading.new(id),
							sp = g_scrCenter,
							ep = g_scrCenter,
							--trend = "-",
							zOrder = 200,
							curve = "-",
							swallow = true,
						})
					else
						dump("没有可装备的物品")
					end
				end
			})
		--end

		Mnode.overlayNode(
		{
			parent = bound,
			{
				node = cc.Sprite:create(res .. "placeholder/" .. id .. ".jpg"),
				zOrder = 1,
			},
		})


		if #(MPackManager:getEquipList(id)) > 0 then
			Mnode.overlayNode(
			{
				parent = bound,
				nodes = {
					{
						node = Mnode.createLabel(
						{
							src = "+",
							size = 30,
							color = MColor.green,
						}),

						origin = "c",
						offset = { x = 0, y = 0 },
						zOrder = 2,
					},

					{
						node = Mnode.createLabel(
						{
							src = game.getStrByKey("can")..game.getStrByKey("equipment"),
							size = 16,
							color = MColor.green,
						}),

						origin = "lt",
						offset = { x = 7, y = -8 },
						zOrder = 2,
					},
				}
			})
		end
	end

	bound.mId = id
	root.mDressSlot[id] = bound

	-- 更新人物模型
	refreshRoleModel(id)

	return bound
end

local tSpecialSlot = {
	[MPackStruct.eCuffLeft] = MPackStruct.eCuffRight,
	[MPackStruct.eCuffRight] = MPackStruct.eCuffLeft,
	[MPackStruct.eRingLeft] = MPackStruct.eRingRight,
	[MPackStruct.eRingRight] = MPackStruct.eRingLeft,
}

local refreshSingleDressSlot = function(id)
	local bound = root.mDressSlot[id]
	if bound then
		local x, y = bound:getPosition()
		local parent = bound:getParent()

		removeFromParent(bound)
		bound = nil
		Mnode.addChild(
		{
			parent = parent,
			child = buildDressSlot(id),
			pos = cc.p(x, y),
		})
	end
end

local refreshDressSlot = function(id, event)
	refreshSingleDressSlot(id)

	if event == "+" and tSpecialSlot[id] then
		refreshSingleDressSlot(tSpecialSlot[id])
	end
end
-----------------------------------------------------------------------
Mnode.overlayNode(
{
	parent = root,
	nodes = {
		-- 角色名
		{
			node = Mnode.overlayNode(
			{
				parent = cc.Sprite:create(res .. "24.png"),
				{
					node = Mnode.createLabel(
					{
						src = MRoleStruct:getAttr(ROLE_NAME),
						size = 20,
						color = MColor.lable_yellow,
					}),

					origin = "b",
					offset = { y = 6, },
				}
			}),
			origin = "t",
			offset = { y = -5, },
		},
		-- 人物模型
		{
			node = roleModel,
			origin = "c",
			offset = { x = 0, y = 10, },
		},
		-- 左列装备
		{
			node = Mnode.combineNode(
			{
				nodes =
				{
					--buildDressSlot(10),
					buildDressSlot(7),
					buildDressSlot(5),
					buildDressSlot(19),--盾牌
					buildDressSlot(13),--战旗
				},

				ori = "|",
				margins = 20,
			}),

			origin = "l",
			offset = { x = 11, y = 50, },
		},

{
			node = Mnode.combineNode(
			{
				nodes =
				{
			
					buildDressSlot(9),
			
				},

				ori = "|",
				margins = 20,
			}),

			origin = "b",
			offset = { x = -110, y = 110, },
		},


		-- 右列装备
		{
			node = Mnode.combineNode(
			{
				nodes =
				{
					buildDressSlot(11),
					buildDressSlot(8),
					buildDressSlot(6),
					buildDressSlot(4),
					buildDressSlot(3),
				},

				ori = "|",
				margins = 20,
			}),

			origin = "r",
			offset = { x = -5, y = 4, },
		},

		{
			node = Mnode.combineNode({
				nodes =
				{
					buildDressSlot(1),
					buildDressSlot(2),
					buildDressSlot(12),
					buildDressSlot(10),
					--buildDressSlot(9),
				},

				margins = 20,
			}),

			origin = "b",
			offset = { x = -47, y = 13, },
		},
	},
})
-----------------------------------------------------------------------
local onDressChanged = function(observable, event, id, grid)
	dump(event, "event")
	if event == "+" or event == "=" or event == "-" then
		-- 更新着装
		refreshDressSlot(id, event)
	end
end

local onItemChanged = function(observable, event, id, grid)

	if event == "+" or event == "=" or event == "-" then
		-- 更新着装
		for i = MPackStruct.eWeapon, MPackStruct.eMedal do
			refreshSingleDressSlot(i)
		end
	end
end

local onDataSourceChanged = function(observable, attrId, objId, isMe, attrValue)
	if not isMe or attrId ~= PLAYER_BATTLE then return end

	-- 更新战斗力
	--power:refresh()
end

	--特戒
	local toAchievement = function()
		local bg =  createScale9Sprite(root,"res/common/scalable/6.png",cc.p(250,190),cc.size(500,100),cc.p(0.5,0.5))
		registerOutsideCloseFunc(bg, function() removeFromParent(bg) end, true)
		local Special =  Mnode.overlayNode(
				{
					parent = bg,
					nodes = {

						-- 特戒信息
						{
							node = Mnode.combineNode(
									{
										nodes =
										{
											--特戒
											buildDressSlot(15),
											--婚戒
											buildDressSlot(16),
											--护身神戒
											buildDressSlot(17),
											--秒杀神戒
											buildDressSlot(18),
											--王戒
											buildDressSlot(20),
											--圣戒
											buildDressSlot(21),

										},

										--ori = "|",
										margins = 2,
									}),

							origin = "c",
							offset = { x = 0, y = -1, },
						},


					},
				})

	end
	---local achievementBtn = createMenuItem(root, "res/achievement/1.png", cc.p(90, 45), toAchievement)
	--G_TUTO_NODE:setTouchNode(achievementBtn, TOUCH_ROLE_ACHIEVEMENT)
	--特戒
	local achievementBtn = createMenuItem(root, "res/layers/role/placeholder/changering.png", cc.p(220, 120), toAchievement)
	G_TUTO_NODE:setTouchNode(achievementBtn, TOUCH_ROLE_ACHIEVEMENT)
	G_TUTO_NODE:setTouchNode(root, TOUCH_ROLE_EQUIPMENT)
	G_TUTO_NODE:setTouchNode(root, TOUCH_ROLE_WEAPON)
	G_TUTO_NODE:setTouchNode(root, TOUCH_ROLE_MEDAL)
	G_TUTO_NODE:setTouchNode(root, TOUCH_ROLE_SHOES)
	
	

local on_event_arrive = function(m, dress, pos, info)
	local bound = root.mDressSlot[pos]
	if bound and bound.red_dot then
		bound.red_dot:setVisible(info and true or false)
	end
end

root:registerScriptHandler(function(event)
	local pack = MPackManager:getPack(MPackStruct.eDress)
	--local Mred_dot = require "src/layers/role/red_dot"
	if event == "enter" then
		pack:register(onDressChanged)
		bag:register(onItemChanged)
		--Mred_dot:register(on_event_arrive)
		MRoleStruct:register(onDataSourceChanged)
		G_TUTO_NODE:setShowNode(root, SHOW_ROLE)
	elseif event == "exit" then
		pack:unregister(onDressChanged)
		bag:unregister(onItemChanged)
		--Mred_dot:unregister(on_event_arrive)
		MRoleStruct:unregister(onDataSourceChanged)
	end
end)
-----------------------------------------------------------------------

return root
end }

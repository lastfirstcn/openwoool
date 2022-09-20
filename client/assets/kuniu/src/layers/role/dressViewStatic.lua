return { new = function(params)
local MpropOp = require "src/config/propOp"
local Mnumber = require "src/young/component/number/view"
local Mprop = require "src/layers/bag/prop"
-----------------------------------------------------------------------
local res = "res/layers/role/"
-----------------------------------------------------------------------
local root = Mnode.createColorLayer(
{
	src = cc.c4b(0 ,0 ,0, 0),
	--src = cc.c4b(244 ,164 ,96, 255*0.5),
	cSize = cc.size(492, 499),
})
local M = Mnode.beginNode(root)
-----------------------------------------------------------------------
local equipList = params.equipList
-----------------------------------------------------------------------
local weaponId = nil
local clothingId = nil
local shieldId = nil --盾牌
local flagId = nil --战旗
-----------------------------------------------------------------------
local buildDressSlot = function(id)
	local grid = equipList[id]

	local bound = nil

	if grid then
		local protoId = MPackStruct.protoIdFromGird(grid)

		if id == MPackStruct.eWeapon then
			weaponId = protoId
		elseif id == MPackStruct.eClothing then
			clothingId = protoId
		elseif id == MPackStruct.eShield then
			shieldId = protoId
		elseif id == MPackStruct.eFlag then
			flagId = protoId
		end
		print("clothingId:",clothingId)
		bound = Mprop.new(
		{
			grid = grid,
			cb = function(touch, event)
				local Mtips = require "src/layers/bag/tips"
				Mtips.new(
				{
					isOther = true,
					grid = grid,
					pos = bound:getParent():convertToWorldSpace( cc.p(bound:getPosition()) ),
				})
			end,
		})
	else
		bound = Mnode.overlayNode(
		{
			parent = cc.Sprite:create("res/common/bg/itemBg.png"),
			{
				node = cc.Sprite:create(res .. "placeholder/" .. id .. ".jpg"),
				zOrder = 1,
			},
		})
	end

	return bound
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
						src = params[ROLE_NAME] or "",
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

		-- 左列装备
		{
			node = Mnode.combineNode(
			{
				nodes =
				{
					--buildDressSlot(10),
					buildDressSlot(7),
					buildDressSlot(5),
					buildDressSlot(19), --盾牌
					buildDressSlot(13), --战旗
				},

				ori = "|",
				margins = 20,
			}),
			zOrder = 1,
			origin = "l",
			offset = { x = 11, y = 50, },
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
			zOrder = 1,
			origin = "r",
			offset = { x = -5, y = 0, },
		},
		
		
		{
			node = Mnode.combineNode(
			{
				nodes =
				{
					buildDressSlot(9),--时装
				},

				ori = "|",
				margins = 20,
			}),

			origin = "l",
			offset = { x = 100, y = -100, },
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
			zOrder = 1,
		},
		-- 人物模型
		{
			node = createRoleNode(params[ROLE_SCHOOL], clothingId, weaponId, params[PLAYER_EQUIP_WING],1.0,params[PLAYER_SEX]),
			origin = "c",
			offset = { x = 0, y = 10, },
			---zOrder = -1,
		},

	},
})
	--特戒
	local toAchievement = function()
		local bg =  createScale9Sprite(root,"res/common/scalable/6.png",cc.p(250,190),cc.size(500,100),cc.p(0.5,0.5))
			bg:setLocalZOrder(5)
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
	local achievementBtn = createMenuItem(root, "res/layers/role/placeholder/changering.png", cc.p(170, 120), toAchievement)
	G_TUTO_NODE:setTouchNode(achievementBtn, TOUCH_ROLE_ACHIEVEMENT)

-----------------------------------------------------------------------
return root
end }

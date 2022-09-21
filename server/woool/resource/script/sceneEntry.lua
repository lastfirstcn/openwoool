--sceneEntry.lua
require "base.base"

--------------------------------------------------------------------------------

local sceneconfigs = {}
local monsterMaps = {}
-- local maxMonsterID = 0

function loadHotAreas()
	local hotArea = HotArea:new()
	local records = require "data.HotAreaDB"
	for i, record in pairs(records or {}) do
		hotArea.range = record.q_radius or -1
		hotArea.targetMapID = record.q_tar_mapid or -1
		hotArea.tarMapX = record.q_tar_x or -1
		hotArea.tarMapY = record.q_tar_y or -1
		hotArea.x = record.q_x or -1
		hotArea.y = record.q_y or -1
		hotArea.transX = record.q_xa or 0
		hotArea.transY = record.q_yb or 0
		hotArea.sceneType = record.q_type or -1

		local pConfig = sceneconfigs[record.q_mapid]
		if pConfig then
			pConfig:pushHotArea(hotArea)

			-- if pConfig.m_groupID > 0 and pConfig.m_groupMax > 0 then
			-- 	for j=1,pConfig.m_groupMax-1 do
			-- 		local pConfigCopy = sceneconfigs[record.q_mapid + j]
			-- 		pConfigCopy:pushHotArea(hotArea)
			-- 	end
			-- end

		end
	end
	hotArea:delete()
end

--���������ַ�����  "1093_40_61004_139_95"
local function StrSplit(str, split)
	local strTab={}
	local sp=split or "&"
	local tb = {}
	while type(str)=="string" and string.len(str)>0 do
		local f=string.find(str,sp)
		local ele
		if f then
			ele=string.sub(str,1,f-1)
			str=string.sub(str,f+1)
		else
			ele=str
		end
		table.insert(tb, ele)
		if not f then break	end
	end
	return tb
end

function getReliveTicks(szRlive)
	local reliveTab = {}
	local data = StrSplit(szRlive, ";")
	for i, v in pairs(data) do
		local ps, pe = string.find(v, "-")
		if ps then
			local szTick1 = "2009-05-15 " .. string.sub(v, ps - 8, ps - 1)
			local szTick2 = "2009-05-15 " .. string.sub(v, ps + 1, ps + 9)
			table.insert(reliveTab, time.totime(szTick1) % 86400)
			table.insert(reliveTab, time.totime(szTick2) % 86400)
		end
	end
	return reliveTab
end

--"*,*,*,*,10:35:00-10:35:05;*,*,*,*,12:35:00-12:35:05;*,*,*,*,15:30:00-15:30:05;*,*,*,*,18:05:00-18:05:05;*,*,*,*,21:05:00-21:05:05"
function getConfigByMapID(mapID, init)
	if init then
		return sceneconfigs[mapID]
	else
		return SceneConfig:getSceneConfig(mapID)
	end
end
function fillMonsterData(monster, i, record)
	monster.id = record.q_id or 0
	monster.monsterID = record.q_monster_model or 0
	monster.number = record.q_monster_num or 0
	monster.posX = record.q_center_x or 0
	monster.posY = record.q_center_y or 0
	monster.radius = record.q_radius or 0
	monster.relive = record.q_relive or 0
	monster.reliveTime = record.q_reliveTime or 0	
	monster.patrolTime = record.q_patrol_time or 0
	monster.patrolRate = record.q_patrol_pro or 0
	monster.patrolRange = record.q_patrolRange or 0
	monster.pursueRange = record.q_pursueRange or 0
	monster.isNoOwner = record.q_isNoOwner or 0		
	monster.returnDist = record.q_returnRange or 30
	if record.q_bossRelive and #record.q_bossRelive > 0 then
		local bossRelive = getReliveTicks(record.q_bossRelive)
		for i = 1, #bossRelive, 2 do
			monster:addBossRelive(bossRelive[i], bossRelive[i+1])
		end
	end
	-- if maxMonsterID < monster.id then
	-- 	maxMonsterID = monster.id
	-- end
end

function loadMonsters(init)
	-- maxMonsterID = 0;
	local records = require "data.MonsterInfoDB"
	for i, record in pairs(records or {}) do
		local monster = MonsterInfo:new()
		fillMonsterData(monster, i, record)		
		local pConfig = getConfigByMapID(record.q_mapid, init)
		if pConfig then
			pConfig:pushMonster(monster)
			if not table.include(monsterMaps, record.q_mapid) then
				table.insert(monsterMaps, record.q_mapid)
			end
		end
		monster:delete()
	end
	-- for i, record in pairs(records or {}) do
	-- 	local pConfig = getConfigByMapID(record.q_mapid, init)
	-- 	if pConfig and pConfig.m_groupID > 0 and pConfig.m_groupMax > 0 then
	-- 		local monster = MonsterInfo:new()
	-- 		fillMonsterData(monster, i, record)
	-- 		for j=1,pConfig.m_groupMax-1 do
	-- 			local pConfigCopy = getConfigByMapID(record.q_mapid + j, init)
	-- 			maxMonsterID = maxMonsterID + 1 
	-- 			monster.id = maxMonsterID
	-- 			pConfigCopy:pushMonster(monster)
	-- 			if not table.include(monsterMaps, record.q_mapid + j) then
	-- 				table.insert(monsterMaps, record.q_mapid + j)
	-- 			end
	-- 		end
	-- 		monster:delete()
	-- 	end
	-- end
end
function clearMonsters()
	for _, v in pairs(monsterMaps) do
		SceneConfig:clearMonster(v)
	end
	monsterMaps = {}
end
function reloadMonsters()
	clearMonsters()
	reloadModule("data.MonsterInfoDB")
	loadMonsters(false)
	print("MonsterInfo reloaded")
end

--���ص�ͼ����
function loadSceneConfig()	
	local records = require "data.MapDB"
	for _, record in pairs(records) do
		local pConfig = SceneConfig:new()
		pConfig.m_mapName = record.q_mapresid or ""
		pConfig.m_areaId = record.q_line_id or 0	
		pConfig.m_dieMapID = record.q_map_die or 1100				
		pConfig.m_dieX = record.q_map_die_x or 29
		pConfig.m_dieY = record.q_map_die_y or 87
		pConfig.m_safeX = toNumber(record.q_map_safe_x, 0)
		pConfig.m_safeY = toNumber(record.q_map_safe_y, 0)			
		pConfig.m_minLevel = toNumber(record.q_map_min_level, 0)
		pConfig.m_maxLevel = toNumber(record.q_map_max_level, 999)
		pConfig.m_radius = toNumber(record.q_radius, 0)
		pConfig.m_allSafe = toNumber(record.q_all_safe, 0) 
		pConfig.m_mapRealName = record.q_map_name or ""
		pConfig.m_private = record.q_private and (tonumber(record.q_private) == 1) or false
		pConfig.m_teamVisible = record.teamVisible and (tonumber(record.teamVisible) == 1) or false
		pConfig.m_linecount = record.q_line_count or 50
		pConfig.m_bcopy = record.q_map_zones and (tonumber(record.q_map_zones) == 1) or false
		pConfig.m_bjoin = record.q_map_public and (tonumber(record.q_map_public) == 0) or false
		pConfig.m_itemLimitIn = record.xianzhiEnter and (tonumber(record.xianzhiEnter) == 1) or false
		pConfig.m_itemLimitOut = record.xianzhiOut and (tonumber(record.xianzhiOut) == 1) or false
		pConfig.m_switchLimitIn = record.xianzhi and (tonumber(record.xianzhi) == 1) or false
		pConfig.m_switchLimitOut = record.xianzhi2 and (tonumber(record.xianzhi2) == 1) or false
		pConfig.m_mapPk = record.q_map_pk and (tonumber(record.q_map_pk) == 1) or false
		pConfig.m_forbidyaoshui = record.q_forbidyaoshui and (tonumber(record.q_forbidyaoshui) == 1) or false

		pConfig.m_redX = record.q_red and unserialize('{'..record.q_red..'}')[1] or 0
		pConfig.m_redY = record.q_red and unserialize('{'..record.q_red..'}')[2] or 0
		pConfig.m_redRadius = record.q_red and unserialize('{'..record.q_red..'}')[3] or 0
		pConfig.m_nonrentry = record.q_nonrentry or 0
		pConfig.m_needItemID = toNumber(record.q_need_item_id, 1001)
		pConfig.m_needItemNum = toNumber(record.q_need_item_num, 1)
		pConfig.m_refreshEnter = record.q_refresh_enter and (tonumber(record.q_refresh_enter) == 1) or false
		pConfig.m_minTitleID = toNumber(record.q_min_title_id, 0)
		pConfig.m_maxTitleID = toNumber(record.q_max_title_id, 0)
		pConfig.m_groupID = toNumber(record.q_group, 0)
		pConfig.m_groupMax = toNumber(record.q_group_max, 0)

		sceneconfigs[record.q_map_id] = pConfig

		-- if pConfig.m_groupID > 0 and pConfig.m_groupMax > 0 then
		-- 	for i=1,pConfig.m_groupMax-1 do
		-- 		local pConfigCopy = SceneConfig:new()
		-- 		pConfigCopy.m_mapName = pConfig.m_mapName
		-- 		pConfigCopy.m_areaId = pConfig.m_areaId	
		-- 		pConfigCopy.m_dieMapID = pConfig.m_dieMapID			
		-- 		pConfigCopy.m_dieX = pConfig.m_dieX
		-- 		pConfigCopy.m_dieY = pConfig.m_dieY
		-- 		pConfigCopy.m_safeX = pConfig.m_safeX
		-- 		pConfigCopy.m_safeY = pConfig.m_safeY			
		-- 		pConfigCopy.m_minLevel = pConfig.m_minLevel
		-- 		pConfigCopy.m_maxLevel = pConfig.m_maxLevel
		-- 		pConfigCopy.m_radius = pConfig.m_radius
		-- 		pConfigCopy.m_allSafe = pConfig.m_allSafe 
		-- 		pConfigCopy.m_mapRealName = pConfig.m_mapRealName
		-- 		pConfigCopy.m_private = pConfig.m_private
		-- 		pConfigCopy.m_teamVisible = pConfig.m_teamVisible
		-- 		pConfigCopy.m_linecount = pConfig.m_linecount
		-- 		pConfigCopy.m_bcopy = pConfig.m_bcopy
		-- 		pConfigCopy.m_bjoin = pConfig.m_bjoin
		-- 		pConfigCopy.m_itemLimitIn = pConfig.m_itemLimitIn
		-- 		pConfigCopy.m_itemLimitOut = pConfig.m_itemLimitOut
		-- 		pConfigCopy.m_switchLimitIn = pConfig.m_switchLimitIn
		-- 		pConfigCopy.m_switchLimitOut = pConfig.m_switchLimitOut
		-- 		pConfigCopy.m_mapPk = pConfig.m_mapPk
		-- 		pConfigCopy.m_forbidyaoshui = pConfig.m_forbidyaoshui
		-- 		pConfigCopy.m_redX = pConfig.m_redX
		-- 		pConfigCopy.m_redY = pConfig.m_redY
		-- 		pConfigCopy.m_redRadius = pConfig.m_redRadius
		-- 		pConfigCopy.m_nonrentry = pConfig.m_nonrentry
		-- 		pConfigCopy.m_needItemID = pConfig.m_needItemID
		-- 		pConfigCopy.m_needItemNum = pConfig.m_needItemNum
		-- 		pConfigCopy.m_refreshEnter = pConfig.m_refreshEnter
		-- 		pConfigCopy.m_minTitleID = pConfig.m_minTitleID
		-- 		pConfigCopy.m_maxTitleID = pConfig.m_maxTitleID
		-- 		pConfigCopy.m_groupID = pConfig.m_groupID
		-- 		pConfigCopy.m_groupMax =pConfig.m_groupMax

		-- 		sceneconfigs[record.q_map_id + i] = pConfigCopy
		-- 	end
		-- end
	end
	
	loadHotAreas()
	loadMonsters(true)
	for id, pConfig in pairs(sceneconfigs) do
		SceneConfig:pushConfig(id, pConfig)
	end
	sceneconfigs = nil
end

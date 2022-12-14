--TAcceptReward.lua
--/*-----------------------------------------------------------------
 --* Module:  TAcceptReward.lua
 --* Author:  seezon
 --* Modified: 2016年1月18日
 --* Purpose: 接取悬赏任务
 -------------------------------------------------------------------*/

TAcceptReward=class(TargetBase)

function TAcceptReward:__init(task, context, state)
	self._state = state or 0
	
	if not self:completed() or self:belongFactionTask() == true then	
		self:addWatcher("onAcceptReward")
	end
end

function TAcceptReward:onAcceptReward(player)
	self:setState(self:getState() + 1)
	if self:completed() then
		self:removeWatcher("onAcceptReward")
		self._task:validate()
	end

	self:taskInfoSave()
end

function TAcceptReward:completed()
	return self._state >= self._context.param1
end
--GuardBook.lua
--守护副本

GuardBook = class(CopyBook)

function GuardBook:__init()
	self._currCircle = 1	--当前怪物刷新环数，第几波
	self._finishTime = 0	--此副本完成时间
	self._progressReward = {}	--格式：{time1 = {copyid1, copyid2}, time2 = {}}
	self._statueID = 0
	self._sumExp = 0	--累计经验
end

function GuardBook:setSumExp(xp)
	self._sumExp = xp
end

function GuardBook:getSumExp()
	return self._sumExp
end

function GuardBook:onCopyDone()
	
end

function GuardBook:setStatueID(id)
	self._statueID = id
end

function GuardBook:getStatueID()
	return self._statueID
end

function GuardBook:setStartTime()
	self._startTime = os.time()
end


function GuardBook:setFinishTime(ftime)
	self._finishTime = ftime
end

function GuardBook:getFinishTime()
	return self._finishTime
end

function GuardBook:setCurrCircle(circle)
	self._currCircle = circle
end

function GuardBook:getCurrCircle()
	return self._currCircle
end

--添加奖励
function GuardBook:doReward()
	return
end

function GuardBook.GuardPricess(roleid,npcid,functionid)
	return
end

function GuardBook:AfterDrawCard(roleid)
	return
end

function GuardBook:StartGuard(roleid,functionid)
	return
end

function GuardBook:CheckCurStatus(roleid)
	return
end
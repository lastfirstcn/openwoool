
local luckLotteryAwardsFunc = function(Buff)	
	if Buff then
		local params = {}
		local retTable = g_msgHandlerInst:convertBufferToTable("LuckLotteryAwardsRep", Buff)
		
		local award = retTable.awards
		local tabNum = 0
		if award then
			tabNum = tablenums(award)
		end
		for i = 1, tabNum do
			local temp = {}
			temp.itemID = award[i].rewardId
			temp.num = award[i].rewardCount

            temp.index = award[i].strength
			params[i] = temp
		end
	    local acLayer = require("src/layers/lottery/LuckLotteryLayer").new(params)
	    getRunScene():addChild(acLayer,200)
	end
end

--g_msgHandlerInst:registerMsgHandler(LUCK_LOTTERY_AWARDS_REP,luckLotteryAwardsFunc)

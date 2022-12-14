--CopyConstant.lua
CopyStatus={
	Active		=1,		--活跃副本
	Done		=2,		--已完成副本
	Failed		=3,		--副本失败
}

CopyType={
	SingleCopy		=1,
	TowerCopy		=2,
	GuardCopy		=3,
	MultiCopy		=4,
	NewSingleCopy	=6,     --新增屠龙传说剧情副本
	TrivialCopy		=7,
	ArenaThree      =8, --3v3竞技场
	SingleGuard		=9,
}

CopyEnter =
{
	Normal 				= 1,	--普通副本
	SingleInst 			= 2,	--屠龙传说
	SingleInstNoCheck 	= 3,	--屠龙传说(不检查)
}

ONE_DAY_SEC = 3600 * 24	--一天秒数
TEN_DAY_SEC = 3600 * 24 * 10
TOWER_ONEDAY_CDCOUNT = 2	--爬塔副本每日免费挑战次数
TOWER_RESET_CDCOUNT = 4		--爬塔副本每日重置挑战次数
AUTO_NEXT_GUARD = 3	--挑战成功自动进入下一守护副本的间隔
UPDATE_COPY_TIME = 0	--每天更新时间
FIRST_GUARD_ID = 4000	--守护副本的第一个副本
HELP_CD_TIME = 1200	--援护间隔
CLEAR_PRO_TIME_MONEY = 10	--花元宝可以直接扫荡完成
HELP_LEVEL_LIMIT = 5	--可以援护的好友等级差限制
MULTI_COPYFIRST_EMAIL = 15	--多人副本每日首通奖励邮件
CALL_PER_INGOT = 20	--每召唤一次好友需要增加的元宝
INNER_PER_INGOT = 5	--内置CD所需单位元宝 九零 一起 玩 www.901 7 5.com
COPY_SINGLE_PROGRESSALL = 50	--单人副本一件扫荡价格

COPY_HELP_LEVEL_LIMIT = 28

COPY_GUARD_STARTID_1 = 4000
COPY_GUARD_STARTID_2 = 4005
COPY_GUARD_STARTID_3 = 4010
COPY_FIRST_GUARDID = 4000
COPY_LAST_GUARDID = 4015

COPY_TOWER_FIRST = 3000
COPY_TOWER_LAST = 3099

COPPY_SINGLE_FIRST = 6000
COPPY_SINGLE_LAST = 6006

COPY_TOWER_PROGRESSALL = 25

COPY_TOWER_PROGRESS_TIME = 10

COPY_MULTI_NEED_BATTLE = 3000
COPY_MULTI_NEED_LEVEL = 42

COPY_MULTI_RELIVE_TIME = 2

COPY_ERR_INVALIDCOPY = -1	--没有副本原型
COPY_ERR_INVALIDPLAYER	= -2 --无效玩家
--COPY_ERR_GT_MAXNUM	= -3 --达到副本总数上限
--COPY_ERR_GT_SAME_MAXNUM	= -4 --达到同类型副本总数上限
COPY_ERR_INCD = -3 --副本冷却中
COPY_ERR_TOWER_HIGHER = -4	--爬塔副本层数太高,没有开启
COPY_ERR_TOWER_INCD	= -5	--爬塔副本次数用完
COPY_ERR_GUARD_NO_EQUAL = -6	--守护副本层数不对
COPY_ERR_IS_IN_COPY = -7	--已经在副本里面了,不能执行此操作
COPY_ERR_IS_IN_PROGRESS = -8	--正在进行扫荡
COPY_ERR_NEED_ARATING = -9	--只有评分甲级才能扫荡
COPY_ERR_THIS_BOOK_IN_PRO = -10	--指定副本正在扫荡
COPY_ERR_LEVEL_LOWER = -11	--等级不够无法进入副本
COPY_ERR_HIGHEST_GUARD = -12	--守护副本已经打到最高等级
COPY_ERR_CANNOT_PROGRESS = -13	--副本配置为不能扫荡
COPY_ERR_NO_THIS_REWARD = -14	--没有这项奖励，扫荡列表里没有
COPY_ERR_NO_THIS_SPECREWARD = -15	--没有这项特殊奖励
COPY_ERR_GUARD_TOO_LOWER = -16	--没有通关过，无法扫荡守护副本
COPY_ERR_NEED_RESET_GUARD = -17	--需要重置守护副本才能继续
COPY_ERR_NONEED_RESET = -18	--不需要重置守护副本CD
COPY_ERR_NOTYOUR_FRIEND = -19	--对方不是你好友
COPY_ERR_NOTHIS_FRIEND = -20	--你不是对方的好友
COPY_ERR_NO_ENOUGH_MONEY = -21	--扫荡守护副本钱不够
COPY_ERR_NOT_OPENTIME	= -22	--不是副本开放时间
COPY_ERR_NOT_INPROGRESS = -23	--此副本没有正在扫荡
COPY_ERR_NOT_ENOUGH_INGOT = -24	--没有这么多元宝
COPY_ERR_TOWER_USEUP = -25	--每天能够打的爬塔总次数用完了
COPY_ERR_RESETGUARD_USEUP = -26 --守护副本重置次数用完了
COPY_ERR_ITEM_RELIVE = -27 --当前副本不能使用道具复活
COPY_ERR_TOWN_RELIVE = -28 --副本中不能回城复活
COPY_ERR_CALL_FRI_INCD = -29	--好友援护正在CD中
COPY_ERR_CALL_FRI_LEVELLIMT = -30	--好友援护超过等级差
COPY_ERR_VIPRESET_FAILED = -31	--副本VIP重置功能次数用完了
COPY_ERR_NOCOPY_TORESET = -32	--没有可以扫荡的副本
COPY_ERR_NONEED_RESETVIP = -33	--不需要重置副本的VIP数据,需要重新刷新获取数据
COPY_ERR_NO_DROIT = -34	--没有权限进行操作
COPY_ERR_DATAIN_LOADING = -35	--数据加载中,请稍待片刻
COPY_ERR_IN_INNER_CD = -36 		--内置CD中
COPY_ERR_TEAM_NOT_EXIST = -37 		--副本队伍不存在
COPY_ERR_TEAM_MAX_MEM = -38		--副本队伍人数已满
COPY_ERR_HAS_COPY_TEAM= -39 		--已经有副本队伍了
COPY_ERR_UNFULL_BATTLE= -40		--多人本战力不够
COPY_ERR_NOT_IN_COPY_TEAM = -41	--不在副本队伍中，没有队伍
COPY_ERR_NOT_COPY_LEADER = -42	--不是队长，不能操作
COPY_ERR_NOT_MEET_COPYTEAM = -43	--没有符合条件的副本队伍可以加入，需要手动创建
COPY_ERR_IN_COPYTEAM = -44	--在副本队伍中不能挑战单人副本
COPY_ERR_MEM_NOT_READY = -45	--有人没有准备好
COPY_ERR_TEAM_IN_COPY = -46	--这个队伍已经进入副本了不能加入
COPY_ERR_TARGET_NOT_IN_TEAM = -47	--对方不在队伍中，无法操作
COPY_ERR_FRI_NOT_IN_CALLCD = -48	--不在CD中，不需要清楚好友援护CD
COPY_ERR_NOT_IN_INNERCD = -49	--副本不需要清除冷却时间
COPY_ERR_TRANS_LIMIT = -50	--当前地图不允许传送
COPY_ERR_SEE_U_TOMORROW_GUARD = -52 --救公主次数已经用完
COPY_ERR_CANNOT_RELIVE = -53 --副本可复活次数已用完
COPY_ERR_NEED_COMPLETED = -54	--没有通关过，无法扫荡单人副本
COPY_ERR_CALL_FRI_LEVELTOLOW = -55 --助战好友等级不足
COPY_EXIT_COUNT_DOWN = -56	--屠龙传说倒计时消息
COPY_SYSTEM_BUSY = -57
COPY_MULTI_LOWER_TYPE = -58
COPY_MULTI_TEAMCHANLLENGE_NO_TEAM = -59
COPY_MULTI_TEAMCHANLLENGE_TOO_MANY_MEMBER = -60
COPY_MULTI_TEAMCHANLLENGE_NOT_LEADER = -61
COPY_MULTI_LOWER_COPYLEVEL = -62
COPY_MULTI_TEAMCHANLLENGE_LOW_LEVEL = -63
COPY_MULTI_TEAMCHANLLENGE_ALREADY_IN_COPY = -64
COPY_MULTI_TEAMCHANLLENGE_TOO_HARD = -65

COPY_ERR_SINGLEINST_DAILY_PASSED = -66 --今日挑战已完成
COPY_ERR_SINGLEINST_DAILY_EXISTS = -67 --今日挑战已有
COPY_ERR_SINGLEINST_DAILY_UNAVAILABLE = -68 --没有可用的今日挑战
COPY_ERR_SINGLEINST_INVALID_INST = -69 --非法的副本
COPY_ERR_SINGLEINST_LACK_PREV_INST = -70  --前置副本未完成
COPY_ERR_SINGLEINST_DAILY_UNQUALIFIED = -71 --尚不能开启今日挑战
COPY_ERR_SINGLEINST_IS_IN_TEAM = -72 --在队伍中
COPY_ERR_SINGLEINST_NEED_MAINTASK = -73 --需要解锁主线任务
COPY_ERR_SINGLEINST_LEVEL_TOOLOW = -74	--等级不够

COPY_MSG_ENTERCOPY = 1	--进入副本
COPY_MSG_EXITCOPY = 2	--离开副本
COPY_MSG_GUARDFAILED = 3	--守护副本失败
COPY_MSG_ENTERNEXTGUARD = 4	--进入下一个守护副本
COPY_MSG_FIRST_REWARD = 5	--单人副本首通奖励
COPY_MSG_HIGHEST_GUARD = 6	--守护副本已经达到最高层，离开副本
COPY_MSG_SEND_EMAIL = 7	--包裹已满，物品奖励已经通过邮件发送
COPY_MSG_RECV_PRO_REWARD = 8	--领取了当次守护副本扫荡奖励
COPY_MSG_REFUSE_PRO_REWARD = 9	--没有领取当次守护副本扫荡奖励，已放入扫荡奖励列表
COPY_MSG_REC_SPEC_REWARD = 10	--领取守护副本特殊奖励
COPY_MSG_RESETGUARD_SUCCEED = 11	--重置守护副本CD成功
COPY_MSG_STARTPROGRESS = 12	--开始扫荡
COPY_MSG_DONEGUARD_PRO = 13	--守护副本扫荡完成提示
COPY_MSG_LEAVECOPY_TEAM = 14	--离开副本队伍，一般来说是被踢出队伍
COPY_MSG_CLEAR_CALL_CD = 15	--清除好友援护CD成功
COPY_MSG_CLEAR_INNER_CD = 16	--清除副本内置CD成功
COPY_MSG_PROGRESS_INGOT_NOT_ENOUGH = 17	--一件扫荡元宝不足XX

NEWSINGLECOPY_OUT_TIME = 1 * 20	--屠龙传说结束后强制传送出去的时间
NEWSINGLECOPY_SD_EMAIL = 67	--屠龙传说扫荡发奖邮件

TRIVIALCOPY_OUT_TIME = 10 * 60

COPY_MULTI_OPERATOR_CREATETEAM = 1--创建队伍
COPY_MULTI_OPERATOR_LEAVETEAM = 2--离开队伍
COPY_MULTI_OPERATOR_ENTERCOPY = 3--进入副本
COPY_MULTI_OPERATOR_KICKMEMBER = 4--踢人出队
COPY_MULTI_OPERATOR_BEKICKED = 5--被踢出队
COPY_MULTI_OPERATOR_AUTOJOIN = 6--自动加入
COPY_MULTI_OPERATOR_JOINTEAM = 7--加入队伍

SINGLE_INST_MINE_CLASS = 5
SINGLE_INST_ESCORT_CLASS = 6

function getNormalUpdateTime(ot)
	local nowTime = os.time()
	if (ot > nowTime) or (nowTime- ot > ONE_DAY_SEC) then
		local nowDate = os.date("*t",nowTime)
		local difTime = 0
		if nowDate.hour < UPDATE_COPY_TIME then
			difTime = -ONE_DAY_SEC
		end
		nowDate.hour = UPDATE_COPY_TIME
		nowDate.min = 0
		nowDate.sec = 0
		return os.time(nowDate) + difTime
	else
		return ot
	end
end

function isUnusualSingleInst(class)
	return class == SINGLE_INST_MINE_CLASS or class == SINGLE_INST_ESCORT_CLASS
end
--ManorWarConstant.lua

WEEK_SECOND = 3600*24*7	
MANOR_BANNER_BUFFID = 108
MANOR_MON_ID = 9003	--旗帜ID
MANOR_MAINCITYWAR = 1 		--王城争霸的领地战ID
MANOR_TOTAL_TIME = 60*60	--活动持续时间

MANOR_STATUE_MAPID = 2100			--中州王雕像地图ID
MANOR_STATUE_MAPX = 100				--中州王雕像地图X
MANOR_STATUE_MAPY = 95				--中州王雕像地图Y
MANOR_MAN_ZHAN = 51100				--中州王男战士ID
MANOR_MAN_FA = 51200				--中州王男法士ID
MANOR_MAN_DAO = 51300				--中州王男道士ID
MANOR_WOMAN_ZHAN = 52100			--中州王女战士ID
MANOR_WOMAN_FA = 52200				--中州王女法士ID
MANOR_WOMAN_DAO = 52300				--中州王女道士ID

MANOR_ERR_NO_MANORCONFIG = -1		--没有这个领地
MANOR_ERR_NOT_OFFICIAL = -2		--不是官员没有俸禄
MANOR_ERR_GET_SALARY_SUC = -3	--奖励领取成功
MANOR_ERR_NO_FACTION = -4		--没有帮会不能参战
MANOR_ERR_IN_MANOR = -5			--已经在战场地图了
MANOR_ERR_NOT_LEADER = -6		--只有帮主副帮主才能夺旗
MANOR_ERR_NO_ENOUGHMONEY = -7		--没有足够的财富不能夺旗
MANOR_ERR_OUTPICK_RANGE = -8		--距离太远无法夺旗
MANOR_ERR_BANNERHAS_OWNER = -9		--已经有人夺取了旗帜，不能拔旗
MANOR_ERR_BANNER_NOTOPEN = -10		--领地战没有开启，不能拔旗
MANOR_ERR_NOT_OFFICIAL = -11		--不是官员不能领取俸禄
MANOR_ERR_NOT_FIT_MANOR = -12		--不是当前开放的领地战，不能传送
MANOR_ERR_MANORWAR_HAS_OVER = -13		--领地战提前结束
MANOR_ERR_CAN_NOT_TRANS = -14		--当前地图无法传送
MANOR_ERR_NO_FACTION2 = -15		--没有帮会，无法操作
MANOR_ERR_REWARD_HAS_GIVE = -16		--奖励已经领取过了
MANOR_ERR_LEVEL_NOT_ENOUGH = -17		--等级不足，无法进入该领地！
MANOR_ERR_CAN_NOT_JOIN_ZHONGZHOU = -18		--您的帮会尚未占领任何领地，无法参加中州争夺战

MANOR_READYOPEN_NOTICE1 = 1	--开启前第一次广播,一个参数，领地名字
MANOR_READYOPEN_NOTICE2 = 2	--开启前第2次广播,一个参数，领地名字
MANOR_OPEN_NOTICE = 72 		--正式开启广播提示
MANOR_OPEN_ZHONGZHOU_NOTICE = 80 		--正式开启广播提示
MANOR_OFF_OCCUPY_NOTICE = 4 		--关闭并且有帮会占领开启广播提示,2个参数，领地名字，帮会名字
MANOR_OFF_NOTICE = 5		--关闭没有帮会占领开启广播提示,一个参数，领地名字
MANOR_PRIVITE_MSG = 6 		--拔旗私聊
MANOR_BROADCAST_MSG = 7 		--拔旗广播
MANOR_GETSALARY = 8 		--领取俸禄成功
MANOR_BANNER_OVER = 9		--恭喜XX帮会占领XX的旗帜
MANOR_REMAIN_TIME_NOTIFY = 71		--活动倒计时提示
MANOR_ZHONGZHOU_REMAIN_TIME_NOTIFY = 79		--活动倒计时提示
MANOR_START_REMAIN_TIME_NOTIFY = 105		--活动开启倒计时提示
MANOR_START_ZHONGZHOU_REMAIN_TIME_NOTIFY = 106		--活动开启倒计时提示


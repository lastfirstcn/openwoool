local Items = {
	{q_id = 1,q_day = 1,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 2,q_day = 1,q_type = 2,q_num = 32,q_typechn = '角色等级达到32级',q_reward = '{{itemID=1301,count=20,bind=true}}',},
	{q_id = 3,q_day = 1,q_type = 3,q_num = 5000,q_typechn = '角色战斗力达到5000',q_reward = '{{itemID=999998,count=20000,bind=false}}',},
	{q_id = 4,q_day = 1,q_type = 9,q_num = 15,q_typechn = '完成15个诏令任务',q_reward = '{{itemID=20023,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 5,q_day = 1,q_type = 16,q_num = 1,q_typechn = '参与1次勇闯炼狱',q_reward = '{{itemID=6200029,count=1,bind=true}}',q_level = 32,q_link = 'a151',},
	{q_id = 6,q_day = 1,q_type = 8,q_num = 1,q_typechn = '完成屠龙传说每日挑战1次',q_reward = '{{itemID=999998,count=10000,bind=false}}',q_level = 18,q_link = 'a129',Value = 1,},
	{q_id = 7,q_day = 1,q_type = 10,q_num = 5,q_typechn = '完成5个悬赏任务',q_reward = '{{itemID=777777,count=1000,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 8,q_day = 1,q_type = 20,q_num = 1,q_typechn = '完成1次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 9,q_day = 1,q_type = 28,q_num = 1,q_typechn = '参与1次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 10,q_day = 2,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 11,q_day = 2,q_type = 2,q_num = 34,q_typechn = '角色等级达到34级',q_reward = '{{itemID=1301,count=30,bind=true}}',},
	{q_id = 12,q_day = 2,q_type = 3,q_num = 8000,q_typechn = '角色战斗力达到8000',q_reward = '{{itemID=999998,count=50000,bind=false}}',},
	{q_id = 13,q_day = 2,q_type = 9,q_num = 30,q_typechn = '完成30个诏令任务',q_reward = '{{itemID=9008,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 14,q_day = 2,q_type = 8,q_num = 2,q_typechn = '完成屠龙传说每日挑战2次',q_reward = '{{itemID=999998,count=20000,bind=false}}',q_level = 18,q_link = 'a129',Value = 1,},
	{q_id = 15,q_day = 2,q_type = 10,q_num = 10,q_typechn = '完成10个悬赏任务',q_reward = '{{itemID=777777,count=1500,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 16,q_day = 2,q_type = 22,q_num = 1,q_typechn = '参与1次全民宝地',q_reward = '{{itemID=1074,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 17,q_day = 2,q_type = 20,q_num = 2,q_typechn = '完成2次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 18,q_day = 2,q_type = 21,q_num = 2,q_typechn = '冒险挖矿中兑换矿石2次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 19,q_day = 2,q_type = 23,q_num = 1,q_typechn = '公平竞技场胜利1次',q_reward = '{{itemID=1074,count=5,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 20,q_day = 2,q_type = 12,q_num = 5,q_typechn = '通天塔5层',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 29,q_link = 'a129',Value = 2,},
	{q_id = 21,q_day = 2,q_type = 28,q_num = 2,q_typechn = '参与2次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 22,q_day = 3,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 23,q_day = 3,q_type = 2,q_num = 36,q_typechn = '角色等级达到36级',q_reward = '{{itemID=1301,count=40,bind=true}}',},
	{q_id = 24,q_day = 3,q_type = 3,q_num = 10000,q_typechn = '角色战斗力达到10000',q_reward = '{{itemID=999998,count=80000,bind=false}}',},
	{q_id = 25,q_day = 3,q_type = 9,q_num = 45,q_typechn = '完成45个诏令任务',q_reward = '{{itemID=6200029,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 26,q_day = 3,q_type = 16,q_num = 2,q_typechn = '参与2次勇闯炼狱',q_reward = '{{itemID=6200029,count=2,bind=true}}',q_level = 32,q_link = 'a151',},
	{q_id = 27,q_day = 3,q_type = 8,q_num = 3,q_typechn = '完成屠龙传说每日挑战3次',q_reward = '{{itemID=999998,count=30000,bind=false}}',q_level = 18,q_link = 'a129',Value = 1,},
	{q_id = 28,q_day = 3,q_type = 10,q_num = 15,q_typechn = '完成15个悬赏任务',q_reward = '{{itemID=777777,count=2000,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 29,q_day = 3,q_type = 20,q_num = 3,q_typechn = '完成3次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 30,q_day = 3,q_type = 21,q_num = 4,q_typechn = '冒险挖矿中兑换矿石4次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 31,q_day = 3,q_type = 15,q_num = 1,q_typechn = '完成运镖1次',q_reward = '{{itemID=6200034,count=1,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 32,q_day = 3,q_type = 14,q_num = 1,q_typechn = '完成多人守卫1次',q_reward = '{{itemID=777777,count=2000,bind=false}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 33,q_day = 3,q_type = 23,q_num = 2,q_typechn = '公平竞技场胜利2次',q_reward = '{{itemID=1074,count=5,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 34,q_day = 3,q_type = 25,q_num = 4,q_typechn = '穿戴4件蓝色以上品质装备',q_reward = '{{itemID=2015,count=1,bind=true}}',},
	{q_id = 35,q_day = 3,q_type = 28,q_num = 3,q_typechn = '参与3次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 36,q_day = 4,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 37,q_day = 4,q_type = 2,q_num = 38,q_typechn = '角色等级达到38级',q_reward = '{{itemID=1301,count=50,bind=true}}',},
	{q_id = 38,q_day = 4,q_type = 3,q_num = 11000,q_typechn = '角色战斗力达到11000',q_reward = '{{itemID=999998,count=100000,bind=false}}',},
	{q_id = 39,q_day = 4,q_type = 9,q_num = 60,q_typechn = '完成60个诏令任务',q_reward = '{{itemID=6200034,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 40,q_day = 4,q_type = 8,q_num = 4,q_typechn = '完成屠龙传说每日挑战4次',q_reward = '{{itemID=888888,count=10,bind=true}}',q_level = 18,q_link = 'a129',Value = 1,},
	{q_id = 41,q_day = 4,q_type = 10,q_num = 20,q_typechn = '完成20个悬赏任务',q_reward = '{{itemID=777777,count=2500,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 42,q_day = 4,q_type = 22,q_num = 2,q_typechn = '参与2次全民宝地',q_reward = '{{itemID=1074,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 43,q_day = 4,q_type = 20,q_num = 4,q_typechn = '完成4次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 44,q_day = 4,q_type = 21,q_num = 6,q_typechn = '冒险挖矿中兑换矿石6次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 45,q_day = 4,q_type = 15,q_num = 2,q_typechn = '完成运镖2次',q_reward = '{{itemID=7040,count=5,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 46,q_day = 4,q_type = 14,q_num = 2,q_typechn = '完成多人守卫2次',q_reward = '{{itemID=20023,count=1,bind=true}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 47,q_day = 4,q_type = 23,q_num = 3,q_typechn = '公平竞技场胜利3次',q_reward = '{{itemID=1074,count=10,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 48,q_day = 4,q_type = 28,q_num = 4,q_typechn = '参与4次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 49,q_day = 5,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 50,q_day = 5,q_type = 2,q_num = 40,q_typechn = '角色等级达到40级',q_reward = '{{itemID=1301,count=60,bind=true}}',},
	{q_id = 51,q_day = 5,q_type = 3,q_num = 12000,q_typechn = '角色战斗力达到12000',q_reward = '{{itemID=999998,count=110000,bind=false}}',},
	{q_id = 52,q_day = 5,q_type = 9,q_num = 75,q_typechn = '完成75个诏令任务',q_reward = '{{itemID=888888,count=50,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 53,q_day = 5,q_type = 16,q_num = 3,q_typechn = '参与3次勇闯炼狱',q_reward = '{{itemID=6200030,count=1,bind=true}}',q_level = 32,q_link = 'a151',},
	{q_id = 54,q_day = 5,q_type = 8,q_num = 5,q_typechn = '完成屠龙传说每日挑战5次',q_reward = '{{itemID=888888,count=20,bind=true}}',q_level = 18,q_link = 'a129',Value = 1,},
	{q_id = 55,q_day = 5,q_type = 10,q_num = 25,q_typechn = '完成25个悬赏任务',q_reward = '{{itemID=777777,count=3000,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 56,q_day = 5,q_type = 20,q_num = 5,q_typechn = '完成5次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 57,q_day = 5,q_type = 21,q_num = 8,q_typechn = '冒险挖矿中兑换矿石8次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 58,q_day = 5,q_type = 15,q_num = 3,q_typechn = '完成运镖3次',q_reward = '{{itemID=20037,count=5,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 59,q_day = 5,q_type = 14,q_num = 3,q_typechn = '完成多人守卫3次',q_reward = '{{itemID=777777,count=3000,bind=false}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 60,q_day = 5,q_type = 23,q_num = 4,q_typechn = '公平竞技场胜利4次',q_reward = '{{itemID=1074,count=10,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 61,q_day = 5,q_type = 12,q_num = 10,q_typechn = '通天塔10层',q_reward = '{{itemID=1301,count=30,bind=true}}',q_level = 29,q_link = 'a129',Value = 2,},
	{q_id = 62,q_day = 5,q_type = 25,q_num = 6,q_typechn = '穿戴6件蓝色以上品质装备',q_reward = '{{itemID=2015,count=2,bind=true}}',},
	{q_id = 63,q_day = 5,q_type = 19,q_num = 5,q_typechn = '探索5个迷仙阵空间',q_reward = '{{itemID=1100,count=1,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 64,q_day = 5,q_type = 17,q_num = 1,q_typechn = '参与1次落霞夺宝',q_reward = '{{itemID=2015,count=1,bind=true}}',q_level = 30,q_link = 'a129',Value = 6,},
	{q_id = 65,q_day = 5,q_type = 11,q_num = 1,q_typechn = '获得仙翼',q_reward = '{{itemID=1100,count=5,bind=true}}',q_level = 40,},
	{q_id = 66,q_day = 5,q_type = 28,q_num = 5,q_typechn = '参与5次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 67,q_day = 6,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 68,q_day = 6,q_type = 2,q_num = 41,q_typechn = '角色等级达到41级',q_reward = '{{itemID=1301,count=70,bind=true}}',},
	{q_id = 69,q_day = 6,q_type = 3,q_num = 13000,q_typechn = '角色战斗力达到13000',q_reward = '{{itemID=999998,count=120000,bind=false}}',},
	{q_id = 70,q_day = 6,q_type = 9,q_num = 90,q_typechn = '完成90个诏令任务',q_reward = '{{itemID=20023,count=2,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 71,q_day = 6,q_type = 8,q_num = 6,q_typechn = '完成屠龙传说每日挑战6次',q_reward = '{{itemID=888888,count=30,bind=true}}',q_level = 18,q_link = 'a129',Value = 1,},
	{q_id = 72,q_day = 6,q_type = 10,q_num = 30,q_typechn = '完成30个悬赏任务',q_reward = '{{itemID=777777,count=3500,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 73,q_day = 6,q_type = 22,q_num = 3,q_typechn = '参与3次全民宝地',q_reward = '{{itemID=1043,count=10,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 74,q_day = 6,q_type = 20,q_num = 6,q_typechn = '完成6次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 75,q_day = 6,q_type = 21,q_num = 10,q_typechn = '冒险挖矿中兑换矿石10次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 76,q_day = 6,q_type = 15,q_num = 4,q_typechn = '完成运镖4次',q_reward = '{{itemID=20023,count=1,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 77,q_day = 6,q_type = 14,q_num = 4,q_typechn = '完成多人守卫4次',q_reward = '{{itemID=20023,count=1,bind=true}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 78,q_day = 6,q_type = 23,q_num = 5,q_typechn = '公平竞技场胜利5次',q_reward = '{{itemID=1074,count=15,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 79,q_day = 6,q_type = 28,q_num = 6,q_typechn = '参与6次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 80,q_day = 7,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 81,q_day = 7,q_type = 2,q_num = 42,q_typechn = '角色等级达到42级',q_reward = '{{itemID=1301,count=80,bind=true}}',},
	{q_id = 82,q_day = 7,q_type = 3,q_num = 14500,q_typechn = '角色战斗力达到14500',q_reward = '{{itemID=999998,count=130000,bind=false}}',},
	{q_id = 83,q_day = 7,q_type = 9,q_num = 105,q_typechn = '完成105个诏令任务',q_reward = '{{itemID=9008,count=2,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 84,q_day = 7,q_type = 16,q_num = 4,q_typechn = '参与4次勇闯炼狱',q_reward = '{{itemID=6200030,count=2,bind=true}}',q_level = 32,q_link = 'a151',},
	{q_id = 85,q_day = 7,q_type = 8,q_num = 7,q_typechn = '完成屠龙传说每日挑战7次',q_reward = '{{itemID=888888,count=40,bind=true}}',q_level = 18,q_link = 'a129',Value = 1,},
	{q_id = 86,q_day = 7,q_type = 10,q_num = 35,q_typechn = '完成35个悬赏任务',q_reward = '{{itemID=777777,count=4000,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 87,q_day = 7,q_type = 20,q_num = 7,q_typechn = '完成7次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 88,q_day = 7,q_type = 21,q_num = 12,q_typechn = '冒险挖矿中兑换矿石12次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 89,q_day = 7,q_type = 15,q_num = 5,q_typechn = '完成运镖5次',q_reward = '{{itemID=6200034,count=2,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 90,q_day = 7,q_type = 14,q_num = 5,q_typechn = '完成多人守卫5次',q_reward = '{{itemID=777777,count=4000,bind=false}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 91,q_day = 7,q_type = 23,q_num = 6,q_typechn = '公平竞技场胜利6次',q_reward = '{{itemID=1074,count=15,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 92,q_day = 7,q_type = 12,q_num = 15,q_typechn = '通天塔15层',q_reward = '{{itemID=1100,count=5,bind=true}}',q_level = 29,q_link = 'a129',Value = 2,},
	{q_id = 93,q_day = 7,q_type = 25,q_num = 9,q_typechn = '穿戴9件蓝色以上品质装备',q_reward = '{{itemID=2015,count=4,bind=true}}',},
	{q_id = 94,q_day = 7,q_type = 19,q_num = 15,q_typechn = '探索15个迷仙阵空间',q_reward = '{{itemID=999,count=5,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 95,q_day = 7,q_type = 4,q_num = 3,q_typechn = '全身装备+3',q_reward = '{{itemID=1303,count=10,bind=true}}',q_level = 21,q_link = 'a164',},
	{q_id = 96,q_day = 7,q_type = 7,q_num = 2,q_typechn = '仙翼强化至2阶',q_reward = '{{itemID=1100,count=10,bind=true}}',q_level = 40,q_link = 'a18',},
	{q_id = 97,q_day = 7,q_type = 28,q_num = 7,q_typechn = '参与7次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 98,q_day = 8,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 99,q_day = 8,q_type = 2,q_num = 44,q_typechn = '角色等级达到44级',q_reward = '{{itemID=1303,count=20,bind=true}}',},
	{q_id = 100,q_day = 8,q_type = 3,q_num = 16000,q_typechn = '角色战斗力达到16000',q_reward = '{{itemID=999998,count=140000,bind=false}}',},
	{q_id = 101,q_day = 8,q_type = 9,q_num = 10,q_typechn = '完成10个诏令任务',q_reward = '{{itemID=6200029,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 102,q_day = 8,q_type = 10,q_num = 5,q_typechn = '完成5个悬赏任务',q_reward = '{{itemID=777777,count=1000,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 103,q_day = 8,q_type = 22,q_num = 1,q_typechn = '参与1次全民宝地',q_reward = '{{itemID=1074,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 104,q_day = 8,q_type = 20,q_num = 1,q_typechn = '完成1次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 105,q_day = 8,q_type = 21,q_num = 2,q_typechn = '冒险挖矿中兑换矿石2次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 106,q_day = 8,q_type = 15,q_num = 1,q_typechn = '完成运镖1次',q_reward = '{{itemID=6200034,count=1,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 107,q_day = 8,q_type = 14,q_num = 1,q_typechn = '完成多人守卫1次',q_reward = '{{itemID=777777,count=2000,bind=false}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 108,q_day = 8,q_type = 23,q_num = 1,q_typechn = '公平竞技场胜利1次',q_reward = '{{itemID=1074,count=5,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 109,q_day = 8,q_type = 26,q_num = 2,q_typechn = '穿戴2件紫色以上品质装备',q_reward = '{{itemID=2015,count=4,bind=true}}',},
	{q_id = 110,q_day = 8,q_type = 19,q_num = 5,q_typechn = '探索5个迷仙阵空间',q_reward = '{{itemID=1100,count=1,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 111,q_day = 8,q_type = 17,q_num = 1,q_typechn = '参与1次落霞夺宝',q_reward = '{{itemID=2015,count=1,bind=true}}',q_level = 30,q_link = 'a129',Value = 6,},
	{q_id = 112,q_day = 8,q_type = 18,q_num = 1,q_typechn = '拾取1次落霞宝盒',q_reward = '{{itemID=1006,count=1,bind=true}}',q_level = 30,q_link = 'a129',Value = 6,},
	{q_id = 113,q_day = 8,q_type = 28,q_num = 1,q_typechn = '参与1次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 114,q_day = 9,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 115,q_day = 9,q_type = 2,q_num = 46,q_typechn = '角色等级达到46级',q_reward = '{{itemID=1303,count=25,bind=true}}',},
	{q_id = 116,q_day = 9,q_type = 3,q_num = 20000,q_typechn = '角色战斗力达到20000',q_reward = '{{itemID=999998,count=150000,bind=false}}',},
	{q_id = 117,q_day = 9,q_type = 9,q_num = 20,q_typechn = '完成20个诏令任务',q_reward = '{{itemID=6200034,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 118,q_day = 9,q_type = 10,q_num = 10,q_typechn = '完成10个悬赏任务',q_reward = '{{itemID=777777,count=1500,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 119,q_day = 9,q_type = 22,q_num = 2,q_typechn = '参与2次全民宝地',q_reward = '{{itemID=1074,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 120,q_day = 9,q_type = 20,q_num = 2,q_typechn = '完成2次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 121,q_day = 9,q_type = 21,q_num = 4,q_typechn = '冒险挖矿中兑换矿石4次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 122,q_day = 9,q_type = 15,q_num = 2,q_typechn = '完成运镖2次',q_reward = '{{itemID=7040,count=5,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 123,q_day = 9,q_type = 14,q_num = 2,q_typechn = '完成多人守卫2次',q_reward = '{{itemID=20023,count=1,bind=true}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 124,q_day = 9,q_type = 23,q_num = 2,q_typechn = '公平竞技场胜利2次',q_reward = '{{itemID=1074,count=5,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 125,q_day = 9,q_type = 19,q_num = 10,q_typechn = '探索10个迷仙阵空间',q_reward = '{{itemID=1100,count=1,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 126,q_day = 9,q_type = 4,q_num = 4,q_typechn = '全身装备+4',q_reward = '{{itemID=1074,count=10,bind=true}}',q_level = 21,q_link = 'a164',},
	{q_id = 127,q_day = 9,q_type = 28,q_num = 2,q_typechn = '参与2次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 128,q_day = 10,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 129,q_day = 10,q_type = 2,q_num = 48,q_typechn = '角色等级达到48级',q_reward = '{{itemID=1303,count=30,bind=true}}',},
	{q_id = 130,q_day = 10,q_type = 3,q_num = 22000,q_typechn = '角色战斗力达到22000',q_reward = '{{itemID=999998,count=160000,bind=false}}',},
	{q_id = 131,q_day = 10,q_type = 9,q_num = 30,q_typechn = '完成30个诏令任务',q_reward = '{{itemID=9008,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 132,q_day = 10,q_type = 10,q_num = 15,q_typechn = '完成15个悬赏任务',q_reward = '{{itemID=777777,count=2000,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 133,q_day = 10,q_type = 22,q_num = 3,q_typechn = '参与3次全民宝地',q_reward = '{{itemID=1043,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 134,q_day = 10,q_type = 20,q_num = 3,q_typechn = '完成3次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 135,q_day = 10,q_type = 21,q_num = 6,q_typechn = '冒险挖矿中兑换矿石6次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 136,q_day = 10,q_type = 15,q_num = 3,q_typechn = '完成运镖3次',q_reward = '{{itemID=20037,count=5,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 137,q_day = 10,q_type = 14,q_num = 3,q_typechn = '完成多人守卫3次',q_reward = '{{itemID=777777,count=3000,bind=false}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 138,q_day = 10,q_type = 23,q_num = 3,q_typechn = '公平竞技场胜利3次',q_reward = '{{itemID=1074,count=10,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 139,q_day = 10,q_type = 12,q_num = 20,q_typechn = '通天塔20层',q_reward = '{{itemID=1100,count=8,bind=true}}',q_level = 29,q_link = 'a129',Value = 2,},
	{q_id = 140,q_day = 10,q_type = 19,q_num = 15,q_typechn = '探索15个迷仙阵空间',q_reward = '{{itemID=1100,count=1,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 141,q_day = 10,q_type = 28,q_num = 3,q_typechn = '参与3次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 142,q_day = 11,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 143,q_day = 11,q_type = 2,q_num = 49,q_typechn = '角色等级达到49级',q_reward = '{{itemID=1303,count=35,bind=true}}',},
	{q_id = 144,q_day = 11,q_type = 3,q_num = 24000,q_typechn = '角色战斗力达到24000',q_reward = '{{itemID=999998,count=170000,bind=false}}',},
	{q_id = 145,q_day = 11,q_type = 9,q_num = 40,q_typechn = '完成40个诏令任务',q_reward = '{{itemID=9008,count=2,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 146,q_day = 11,q_type = 10,q_num = 20,q_typechn = '完成20个悬赏任务',q_reward = '{{itemID=777777,count=2500,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 147,q_day = 11,q_type = 22,q_num = 4,q_typechn = '参与4次全民宝地',q_reward = '{{itemID=1043,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 148,q_day = 11,q_type = 20,q_num = 4,q_typechn = '完成4次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 149,q_day = 11,q_type = 21,q_num = 8,q_typechn = '冒险挖矿中兑换矿石8次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 150,q_day = 11,q_type = 15,q_num = 4,q_typechn = '完成运镖4次',q_reward = '{{itemID=20023,count=1,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 151,q_day = 11,q_type = 14,q_num = 4,q_typechn = '完成多人守卫4次',q_reward = '{{itemID=20023,count=1,bind=true}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 152,q_day = 11,q_type = 23,q_num = 4,q_typechn = '公平竞技场胜利4次',q_reward = '{{itemID=1074,count=10,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 153,q_day = 11,q_type = 26,q_num = 4,q_typechn = '穿戴4件紫色以上品质装备',q_reward = '{{itemID=2015,count=6,bind=true}}',},
	{q_id = 154,q_day = 11,q_type = 19,q_num = 20,q_typechn = '探索20个迷仙阵空间',q_reward = '{{itemID=1100,count=1,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 155,q_day = 11,q_type = 4,q_num = 5,q_typechn = '全身装备+5',q_reward = '{{itemID=1303,count=20,bind=true}}',q_level = 21,q_link = 'a164',},
	{q_id = 156,q_day = 11,q_type = 28,q_num = 4,q_typechn = '参与4次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 157,q_day = 12,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 158,q_day = 12,q_type = 2,q_num = 50,q_typechn = '角色等级达到50级',q_reward = '{{itemID=1303,count=40,bind=true}}',},
	{q_id = 159,q_day = 12,q_type = 3,q_num = 26000,q_typechn = '角色战斗力达到26000',q_reward = '{{itemID=999998,count=180000,bind=false}}',},
	{q_id = 160,q_day = 12,q_type = 9,q_num = 50,q_typechn = '完成50个诏令任务',q_reward = '{{itemID=6200031,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 161,q_day = 12,q_type = 10,q_num = 25,q_typechn = '完成25个悬赏任务',q_reward = '{{itemID=777777,count=3000,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 162,q_day = 12,q_type = 22,q_num = 5,q_typechn = '参与5次全民宝地',q_reward = '{{itemID=1043,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 163,q_day = 12,q_type = 20,q_num = 5,q_typechn = '完成5次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 164,q_day = 12,q_type = 21,q_num = 10,q_typechn = '冒险挖矿中兑换矿石10次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 165,q_day = 12,q_type = 15,q_num = 5,q_typechn = '完成运镖5次',q_reward = '{{itemID=6200034,count=2,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 166,q_day = 12,q_type = 14,q_num = 5,q_typechn = '完成多人守卫5次',q_reward = '{{itemID=777777,count=4000,bind=false}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 167,q_day = 12,q_type = 23,q_num = 5,q_typechn = '公平竞技场胜利5次',q_reward = '{{itemID=1074,count=15,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 168,q_day = 12,q_type = 12,q_num = 25,q_typechn = '通天塔25层',q_reward = '{{itemID=1100,count=10,bind=true}}',q_level = 29,q_link = 'a129',Value = 2,},
	{q_id = 169,q_day = 12,q_type = 19,q_num = 25,q_typechn = '探索25个迷仙阵空间',q_reward = '{{itemID=1100,count=1,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 170,q_day = 12,q_type = 28,q_num = 5,q_typechn = '参与5次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 171,q_day = 13,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 172,q_day = 13,q_type = 2,q_num = 51,q_typechn = '角色等级达到51级',q_reward = '{{itemID=1303,count=45,bind=true}}',},
	{q_id = 173,q_day = 13,q_type = 3,q_num = 28000,q_typechn = '角色战斗力达到28000',q_reward = '{{itemID=999998,count=190000,bind=false}}',},
	{q_id = 174,q_day = 13,q_type = 9,q_num = 60,q_typechn = '完成60个诏令任务',q_reward = '{{itemID=6200034,count=1,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 175,q_day = 13,q_type = 10,q_num = 30,q_typechn = '完成30个悬赏任务',q_reward = '{{itemID=777777,count=3500,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 176,q_day = 13,q_type = 22,q_num = 6,q_typechn = '参与6次全民宝地',q_reward = '{{itemID=1043,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 177,q_day = 13,q_type = 20,q_num = 6,q_typechn = '完成6次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 178,q_day = 13,q_type = 21,q_num = 12,q_typechn = '冒险挖矿中兑换矿石12次',q_reward = '{{itemID=1301,count=20,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 179,q_day = 13,q_type = 15,q_num = 6,q_typechn = '完成运镖6次',q_reward = '{{itemID=1002,count=5,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 180,q_day = 13,q_type = 14,q_num = 6,q_typechn = '完成多人守卫6次',q_reward = '{{itemID=777777,count=7000,bind=false}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 181,q_day = 13,q_type = 23,q_num = 6,q_typechn = '公平竞技场胜利6次',q_reward = '{{itemID=1074,count=15,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 182,q_day = 13,q_type = 19,q_num = 30,q_typechn = '探索30个迷仙阵空间',q_reward = '{{itemID=1100,count=1,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 183,q_day = 13,q_type = 4,q_num = 6,q_typechn = '全身装备+6',q_reward = '{{itemID=1074,count=20,bind=true}}',q_level = 21,q_link = 'a164',},
	{q_id = 184,q_day = 13,q_type = 28,q_num = 6,q_typechn = '参与6次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
	{q_id = 185,q_day = 14,q_type = 1,q_num = 1,q_typechn = '每日登录',q_reward = '{{itemID=888888,count=50,bind=true}}',},
	{q_id = 186,q_day = 14,q_type = 2,q_num = 52,q_typechn = '角色等级达到52级',q_reward = '{{itemID=1303,count=50,bind=true}}',},
	{q_id = 187,q_day = 14,q_type = 3,q_num = 30000,q_typechn = '角色战斗力达到30000',q_reward = '{{itemID=999998,count=200000,bind=false}}',},
	{q_id = 188,q_day = 14,q_type = 9,q_num = 70,q_typechn = '完成70个诏令任务',q_reward = '{{itemID=888888,count=50,bind=true}}',q_level = 22,q_link = 'a1',},
	{q_id = 189,q_day = 14,q_type = 10,q_num = 35,q_typechn = '完成35个悬赏任务',q_reward = '{{itemID=777777,count=4000,bind=false}}',q_level = 28,q_link = 'a144',},
	{q_id = 190,q_day = 14,q_type = 22,q_num = 7,q_typechn = '参与7次全民宝地',q_reward = '{{itemID=1043,count=5,bind=true}}',q_level = 32,q_link = 'a227',},
	{q_id = 191,q_day = 14,q_type = 20,q_num = 7,q_typechn = '完成7次行会上香',q_reward = '{{itemID=111111,count=10,bind=false}}',},
	{q_id = 192,q_day = 14,q_type = 21,q_num = 14,q_typechn = '冒险挖矿中兑换矿石14次',q_reward = '{{itemID=1401,count=2,bind=true}}',q_level = 20,q_link = 'a129',Value = 10,},
	{q_id = 193,q_day = 14,q_type = 15,q_num = 7,q_typechn = '完成运镖7次',q_reward = '{{itemID=1001,count=50,bind=true}}',q_level = 36,q_link = 'a129',Value = 12,},
	{q_id = 194,q_day = 14,q_type = 14,q_num = 7,q_typechn = '完成多人守卫7次',q_reward = '{{itemID=20023,count=1,bind=true}}',q_level = 34,q_link = 'a129',Value = 4,},
	{q_id = 195,q_day = 14,q_type = 23,q_num = 7,q_typechn = '公平竞技场胜利7次',q_reward = '{{itemID=1074,count=20,bind=true}}',q_level = 30,q_link = 'a225',},
	{q_id = 196,q_day = 14,q_type = 12,q_num = 30,q_typechn = '通天塔30层',q_reward = '{{itemID=1100,count=15,bind=true}}',q_level = 29,q_link = 'a129',Value = 2,},
	{q_id = 197,q_day = 14,q_type = 26,q_num = 6,q_typechn = '穿戴6件紫色以上品质装备',q_reward = '{{itemID=2015,count=8,bind=true}}',},
	{q_id = 198,q_day = 14,q_type = 19,q_num = 35,q_typechn = '探索35个迷仙阵空间',q_reward = '{{itemID=1100,count=5,bind=true}}',q_level = 39,q_link = 'a228',},
	{q_id = 199,q_day = 14,q_type = 7,q_num = 3,q_typechn = '仙翼强化至3阶',q_reward = '{{itemID=6200091,count=2,bind=true}}',q_level = 40,q_link = 'a18',},
	{q_id = 200,q_day = 14,q_type = 28,q_num = 7,q_typechn = '参与7次王城赐福',q_reward = '{{itemID=999998,count=2000,bind=false}}',q_level = 10,q_link = 'a129',Value = 8,},
};
return Items

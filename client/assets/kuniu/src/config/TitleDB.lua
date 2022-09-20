local Items = {
	{q_titleID = 1064,q_titleName = '沙城城主',q_pic = 8,q_sp = '沙城行会会长\n<攻防属性+60>',school = 1,q_attack_min = 60,q_attack_max = 60,q_magic_attack_min = 60,q_magic_attack_max = 60,q_sc_attack_min = 60,q_sc_attack_max = 60,q_defence_min = 60,q_defence_max = 60,q_magic_defence_min = 60,q_magic_defence_max = 60,},
	{q_titleID = 1065,q_titleName = '沙城城主',q_pic = 8,q_sp = '沙城行会会长\n<攻防属性+60>',school = 2,q_attack_min = 60,q_attack_max = 60,q_magic_attack_min = 60,q_magic_attack_max = 60,q_sc_attack_min = 60,q_sc_attack_max = 60,q_defence_min = 60,q_defence_max = 60,q_magic_defence_min = 60,q_magic_defence_max = 60,},
	{q_titleID = 1066,q_titleName = '沙城城主',q_pic = 8,q_sp = '沙城行会会长\n<攻防属性+60>',school = 3,q_attack_min = 60,q_attack_max = 60,q_magic_attack_min = 60,q_magic_attack_max = 60,q_sc_attack_min = 60,q_sc_attack_max = 60,q_defence_min = 60,q_defence_max = 60,q_magic_defence_min = 60,q_magic_defence_max = 60,},
	{q_titleID = 1088,q_titleName = '情圣',q_pic = 91,q_sp = '命中+25',school = 1,q_hit = 25,},
	{q_titleID = 1089,q_titleName = '情圣',q_pic = 91,q_sp = '命中+25',school = 2,q_hit = 25,},
	{q_titleID = 1090,q_titleName = '情圣',q_pic = 91,q_sp = '命中+25',school = 3,q_hit = 25,},
	{q_titleID = 1091,q_titleName = '人见人爱',q_pic = 29,q_sp = '魅力榜结算榜首\n<闪避+25>',school = 1,q_dodge = 25,},
	{q_titleID = 1092,q_titleName = '人见人爱',q_pic = 29,q_sp = '魅力榜结算榜首\n<闪避+25>',school = 2,q_dodge = 25,},
	{q_titleID = 1093,q_titleName = '人见人爱',q_pic = 29,q_sp = '魅力榜结算榜首\n<闪避+25>',school = 3,q_dodge = 25,},
	{q_titleID = 1097,q_titleName = '精英指挥官',q_pic = 65,q_sp = '战斗最佳领袖\n<暴击+25>',school = 1,q_crit = 25,},
	{q_titleID = 1098,q_titleName = '精英指挥官',q_pic = 65,q_sp = '战斗最佳领袖\n<暴击+25>',school = 2,q_crit = 25,},
	{q_titleID = 1099,q_titleName = '精英指挥官',q_pic = 65,q_sp = '战斗最佳领袖\n<暴击+25>',school = 3,q_crit = 25,},
	{q_titleID = 1100,q_titleName = '明星公会长',q_pic = 66,q_sp = '行会等级榜首\n<攻防属性+20>',school = 1,q_attack_min = 20,q_attack_max = 20,q_magic_attack_min = 20,q_magic_attack_max = 20,q_sc_attack_min = 20,q_sc_attack_max = 20,q_defence_min = 20,q_defence_max = 20,q_magic_defence_min = 20,q_magic_defence_max = 20,},
	{q_titleID = 1101,q_titleName = '明星公会长',q_pic = 66,q_sp = '行会等级榜首\n<攻防属性+20>',school = 2,q_attack_min = 20,q_attack_max = 20,q_magic_attack_min = 20,q_magic_attack_max = 20,q_sc_attack_min = 20,q_sc_attack_max = 20,q_defence_min = 20,q_defence_max = 20,q_magic_defence_min = 20,q_magic_defence_max = 20,},
	{q_titleID = 1102,q_titleName = '明星公会长',q_pic = 66,q_sp = '行会等级榜首\n<攻防属性+20>',school = 3,q_attack_min = 20,q_attack_max = 20,q_magic_attack_min = 20,q_magic_attack_max = 20,q_sc_attack_min = 20,q_sc_attack_max = 20,q_defence_min = 20,q_defence_max = 20,q_magic_defence_min = 20,q_magic_defence_max = 20,},
	{q_titleID = 1103,q_titleName = '传世红人',q_pic = 64,q_sp = '首充奖励\n<攻击+30,血量+300>',school = 1,q_max_hp = 300,q_attack_min = 30,q_attack_max = 30,},
	{q_titleID = 1104,q_titleName = '传世红人',q_pic = 64,q_sp = '首充奖励\n<魔法攻击+30,血量+300>',school = 2,q_max_hp = 300,q_magic_attack_min = 30,q_magic_attack_max = 30,},
	{q_titleID = 1105,q_titleName = '传世红人',q_pic = 64,q_sp = '首充奖励\n<道术攻击+30,血量+300>',school = 3,q_max_hp = 300,q_sc_attack_min = 30,q_sc_attack_max = 30,},
	{q_titleID = 2000,q_titleName = '中州王',q_pic = 1,q_sp = '成为中州王\n<攻击+80,血量+800>',school = 1,q_max_hp = 800,q_attack_min = 80,q_attack_max = 80,},
	{q_titleID = 2001,q_titleName = '中州王',q_pic = 1,q_sp = '成为中州王\n<魔法攻击+80,血量+800>',school = 2,q_max_hp = 800,q_magic_attack_min = 80,q_magic_attack_max = 80,},
	{q_titleID = 2002,q_titleName = '中州王',q_pic = 1,q_sp = '成为中州王\n<道术攻击+80,血量+800>',school = 3,q_max_hp = 800,q_sc_attack_min = 80,q_sc_attack_max = 80,},
	{q_titleID = 2003,q_titleName = '天下第一男战士',q_pic = 4,q_sp = '成为天下第一男战士\n<攻击+50,血量+500>',school = 1,q_max_hp = 500,q_attack_min = 50,q_attack_max = 50,},
	{q_titleID = 2004,q_titleName = '天下第一女战士',q_pic = 7,q_sp = '成为天下第一女战士\n<攻击+50,血量+500>',school = 1,q_max_hp = 500,q_attack_min = 50,q_attack_max = 50,},
	{q_titleID = 2005,q_titleName = '天下第一男法士',q_pic = 3,q_sp = '成为天下第一男法士\n<魔法攻击+50,血量+500>',school = 2,q_max_hp = 500,q_magic_attack_min = 50,q_magic_attack_max = 50,},
	{q_titleID = 2006,q_titleName = '天下第一女法士',q_pic = 6,q_sp = '成为天下第一女法士\n<魔法攻击+50,血量+500>',school = 2,q_max_hp = 500,q_magic_attack_min = 50,q_magic_attack_max = 50,},
	{q_titleID = 2007,q_titleName = '天下第一男道士',q_pic = 2,q_sp = '成为天下第一男道士\n<道术攻击+50,血量+500>',school = 3,q_max_hp = 500,q_sc_attack_min = 50,q_sc_attack_max = 50,},
	{q_titleID = 2008,q_titleName = '天下第一女道士',q_pic = 5,q_sp = '成为天下第一女道士\n<道术攻击+50,血量+500>',school = 3,q_max_hp = 500,q_sc_attack_min = 50,q_sc_attack_max = 50,},
	{q_titleID = 2009,q_titleName = '紫宸花郡',q_pic = 81,q_sp = '防御属性+50',school = 1,q_defence_min = 50,q_defence_max = 50,q_magic_defence_min = 50,q_magic_defence_max = 50,},
	{q_titleID = 2010,q_titleName = '紫宸花郡',q_pic = 81,q_sp = '防御属性+50',school = 2,q_defence_min = 50,q_defence_max = 50,q_magic_defence_min = 50,q_magic_defence_max = 50,},
	{q_titleID = 2011,q_titleName = '紫宸花郡',q_pic = 81,q_sp = '防御属性+50',school = 3,q_defence_min = 50,q_defence_max = 50,q_magic_defence_min = 50,q_magic_defence_max = 50,},
    {q_titleID = 2012,q_titleName = '银豹逞熊',q_pic = 155,q_sp = '血量+1500',school = 1,q_max_hp = 1500,},
	{q_titleID = 2013,q_titleName = '银豹逞熊',q_pic = 155,q_sp = '血量+1500',school = 2,q_max_hp = 1500,},
	{q_titleID = 2014,q_titleName = '银豹逞熊',q_pic = 155,q_sp = '血量+1500',school = 3,q_max_hp = 1500,},
	{q_titleID = 2015,q_titleName = '七彩之翼',q_pic = 142,q_sp = '命中+10,闪避+10,暴击+10',school = 1,q_hit = 10,q_dodge = 10,q_crit = 10,},
	{q_titleID = 2016,q_titleName = '七彩之翼',q_pic = 142,q_sp = '命中+10,闪避+10,暴击+10',school = 2,q_hit = 10,q_dodge = 10,q_crit = 10,},
	{q_titleID = 2017,q_titleName = '七彩之翼',q_pic = 142,q_sp = '命中+10,闪避+10,暴击+10',school = 3,q_hit = 10,q_dodge = 10,q_crit = 10,},
	{q_titleID = 2018,q_titleName = '金龙盘绕',q_pic = 157,q_sp = '防御属性+100',school = 1,q_defence_min = 100,q_defence_max = 100,q_magic_defence_min = 100,q_magic_defence_max = 100,},
	{q_titleID = 2019,q_titleName = '金龙盘绕',q_pic = 157,q_sp = '防御属性+100',school = 2,q_defence_min = 100,q_defence_max = 100,q_magic_defence_min = 100,q_magic_defence_max = 100,},
	{q_titleID = 2020,q_titleName = '金龙盘绕',q_pic = 157,q_sp = '防御属性+100',school = 3,q_defence_min = 100,q_defence_max = 100,q_magic_defence_min = 100,q_magic_defence_max = 100,},
	{q_titleID = 2021,q_titleName = '传世金兰',q_pic = 104,q_sp = '血量+3000',school = 1,q_max_hp = 3000,},
	{q_titleID = 2022,q_titleName = '传世金兰',q_pic = 104,q_sp = '血量+3000',school = 2,q_max_hp = 3000,},
	{q_titleID = 2023,q_titleName = '传世金兰',q_pic = 104,q_sp = '血量+3000',school = 3,q_max_hp = 3000,},
	{q_titleID = 2024,q_titleName = '威震四海',q_pic = 95,q_sp = '攻击+100,血量+1000',school = 1,q_max_hp = 1000,q_attack_min = 100,q_attack_max = 100,},
	{q_titleID = 2025,q_titleName = '威震四海',q_pic = 95,q_sp = '魔法攻击+100,血量+1000',school = 2,q_max_hp = 1000,q_magic_attack_min = 100,q_magic_attack_max = 100,},
	{q_titleID = 2026,q_titleName = '威震四海',q_pic = 95,q_sp = '道术攻击+100,血量+1000',school = 3,q_max_hp = 1000,q_sc_attack_min = 100,q_sc_attack_max = 100,},
	{q_titleID = 2027,q_titleName = '唯我独尊',q_pic = 96,q_sp = '攻击+125,血量+1250',school = 1,q_max_hp = 1250,q_attack_min = 125,q_attack_max = 125,},
	{q_titleID = 2028,q_titleName = '唯我独尊',q_pic = 96,q_sp = '魔法攻击+125,血量+1250',school = 2,q_max_hp = 1250,q_magic_attack_min = 125,q_magic_attack_max = 125,},
	{q_titleID = 2029,q_titleName = '唯我独尊',q_pic = 96,q_sp = '道术攻击+125,血量+1250',school = 3,q_max_hp = 1250,q_sc_attack_min = 125,q_sc_attack_max = 125,},
	{q_titleID = 2030,q_titleName = '超级玩家',q_pic = 159,q_sp = '攻击+150,血量+1500',school = 1,q_max_hp = 1500,q_attack_min = 150,q_attack_max = 150,},
	{q_titleID = 2031,q_titleName = '超级玩家',q_pic = 159,q_sp = '魔法攻击+150,血量+1500',school = 2,q_max_hp = 1500,q_magic_attack_min = 150,q_magic_attack_max = 150,},
	{q_titleID = 2032,q_titleName = '超级玩家',q_pic = 159,q_sp = '道术攻击+150,血量+1500',school = 3,q_max_hp = 1500,q_sc_attack_min = 150,q_sc_attack_max = 150,},
	{q_titleID = 2033,q_titleName = '心悦诚服',q_pic = 80,q_sp = '攻击+175,血量+1750',school = 1,q_max_hp = 1750,q_attack_min = 175,q_attack_max = 175,},
	{q_titleID = 2034,q_titleName = '心悦诚服',q_pic = 80,q_sp = '魔法攻击+175,血量+1750',school = 2,q_max_hp = 1750,q_magic_attack_min = 175,q_magic_attack_max = 175,},
	{q_titleID = 2035,q_titleName = '心悦诚服',q_pic = 80,q_sp = '道术攻击+175,血量+1750',school = 3,q_max_hp = 1750,q_sc_attack_min = 175,q_sc_attack_max = 175,},
	{q_titleID = 2036,q_titleName = '至尊王者',q_pic = 67,q_sp = '攻击+200,血量+2000',school = 1,q_max_hp = 2000,q_attack_min = 200,q_attack_max = 200,},
	{q_titleID = 2037,q_titleName = '至尊王者',q_pic = 67,q_sp = '魔法攻击+200,血量+2000',school = 2,q_max_hp = 2000,q_magic_attack_min = 200,q_magic_attack_max = 200,},
	{q_titleID = 2038,q_titleName = '至尊王者',q_pic = 67,q_sp = '道术攻击+200,血量+2000',school = 3,q_max_hp = 2000,q_sc_attack_min = 200,q_sc_attack_max = 200,},

	{q_titleID = 2101,q_titleName = '至尊VIP-1',q_pic = 1001,q_sp = '攻击+2000,防御属性+100,血量+20000',school = 1,q_max_hp = 20000,q_attack_min = 2000,q_attack_max = 2000,q_defence_min = 100,q_defence_max = 100,q_magic_defence_min = 100,q_magic_defence_max = 100,},
	{q_titleID = 2102,q_titleName = '至尊VIP-2',q_pic = 1002,q_sp = '攻击+3000,防御属性+150,血量+30000',school = 1,q_max_hp = 30000,q_attack_min = 3000,q_attack_max = 3000,q_defence_min = 150,q_defence_max = 150,q_magic_defence_min = 150,q_magic_defence_max = 150,},
	{q_titleID = 2103,q_titleName = '至尊VIP-3',q_pic = 1003,q_sp = '攻击+4000,防御属性+200,血量+40000',school = 1,q_max_hp = 40000,q_attack_min = 4000,q_attack_max = 4000,q_defence_min = 200,q_defence_max = 200,q_magic_defence_min = 200,q_magic_defence_max = 200,},
	{q_titleID = 2104,q_titleName = '至尊VIP-4',q_pic = 1004,q_sp = '攻击+5000,防御属性+250,血量+50000',school = 1,q_max_hp = 50000,q_attack_min = 5000,q_attack_max = 5000,q_defence_min = 250,q_defence_max = 250,q_magic_defence_min = 250,q_magic_defence_max = 250,},
	{q_titleID = 2105,q_titleName = '至尊VIP-5',q_pic = 1005,q_sp = '攻击+6000,防御属性+300,血量+60000',school = 1,q_max_hp = 60000,q_attack_min = 6000,q_attack_max = 6000,q_defence_min = 300,q_defence_max = 300,q_magic_defence_min = 300,q_magic_defence_max = 300,},
	{q_titleID = 2106,q_titleName = '至尊VIP-6',q_pic = 1006,q_sp = '攻击+7000,防御属性+350,血量+70000',school = 1,q_max_hp = 70000,q_attack_min = 7000,q_attack_max = 7000,q_defence_min = 350,q_defence_max = 350,q_magic_defence_min = 350,q_magic_defence_max = 350,},
	{q_titleID = 2107,q_titleName = '至尊VIP-7',q_pic = 1007,q_sp = '攻击+8000,防御属性+400,血量+80000',school = 1,q_max_hp = 80000,q_attack_min = 8000,q_attack_max = 8000,q_defence_min = 400,q_defence_max = 400,q_magic_defence_min = 400,q_magic_defence_max = 400,},
	{q_titleID = 2108,q_titleName = '至尊VIP-8',q_pic = 1008,q_sp = '攻击+9000,防御属性+450,血量+90000',school = 1,q_max_hp = 90000,q_attack_min = 9000,q_attack_max = 9000,q_defence_min = 450,q_defence_max = 450,q_magic_defence_min = 450,q_magic_defence_max = 450,},
	{q_titleID = 2109,q_titleName = '至尊VIP-9',q_pic = 1009,q_sp = '攻击+10000,防御属性+500,血量+100000',school = 1,q_max_hp = 100000,q_attack_min = 10000,q_attack_max = 10000,q_defence_min = 500,q_defence_max = 500,q_magic_defence_min = 500,q_magic_defence_max = 500,},

	{q_titleID = 2111,q_titleName = '至尊VIP-1',q_pic = 1001,q_sp = '魔法攻击+2000,防御属性+100,血量+20000',school = 2,q_max_hp = 20000,q_magic_attack_min = 2000,q_magic_attack_max = 2000,q_defence_min = 100,q_defence_max = 100,q_magic_defence_min = 100,q_magic_defence_max = 100,},
	{q_titleID = 2112,q_titleName = '至尊VIP-2',q_pic = 1002,q_sp = '魔法攻击+3000,防御属性+150,血量+30000',school = 2,q_max_hp = 30000,q_magic_attack_min = 3000,q_magic_attack_max = 3000,q_defence_min = 150,q_defence_max = 150,q_magic_defence_min = 150,q_magic_defence_max = 150,},
	{q_titleID = 2113,q_titleName = '至尊VIP-3',q_pic = 1003,q_sp = '魔法攻击+4000,防御属性+200,血量+40000',school = 2,q_max_hp = 40000,q_magic_attack_min = 4000,q_magic_attack_max = 4000,q_defence_min = 200,q_defence_max = 200,q_magic_defence_min = 200,q_magic_defence_max = 200,},
	{q_titleID = 2114,q_titleName = '至尊VIP-4',q_pic = 1004,q_sp = '魔法攻击+5000,防御属性+250,血量+50000',school = 2,q_max_hp = 50000,q_magic_attack_min = 5000,q_magic_attack_max = 5000,q_defence_min = 250,q_defence_max = 250,q_magic_defence_min = 250,q_magic_defence_max = 250,},
	{q_titleID = 2115,q_titleName = '至尊VIP-5',q_pic = 1005,q_sp = '魔法攻击+6000,防御属性+300,血量+60000',school = 2,q_max_hp = 60000,q_magic_attack_min = 6000,q_magic_attack_max = 6000,q_defence_min = 300,q_defence_max = 300,q_magic_defence_min = 300,q_magic_defence_max = 300,},
	{q_titleID = 2116,q_titleName = '至尊VIP-6',q_pic = 1006,q_sp = '魔法攻击+7000,防御属性+350,血量+70000',school = 2,q_max_hp = 70000,q_magic_attack_min = 7000,q_magic_attack_max = 7000,q_defence_min = 350,q_defence_max = 350,q_magic_defence_min = 350,q_magic_defence_max = 350,},
	{q_titleID = 2117,q_titleName = '至尊VIP-7',q_pic = 1007,q_sp = '魔法攻击+8000,防御属性+400,血量+80000',school = 2,q_max_hp = 80000,q_magic_attack_min = 8000,q_magic_attack_max = 8000,q_defence_min = 400,q_defence_max = 400,q_magic_defence_min = 400,q_magic_defence_max = 400,},
	{q_titleID = 2118,q_titleName = '至尊VIP-8',q_pic = 1008,q_sp = '魔法攻击+9000,防御属性+450,血量+90000',school = 2,q_max_hp = 90000,q_magic_attack_min = 9000,q_magic_attack_max = 9000,q_defence_min = 450,q_defence_max = 450,q_magic_defence_min = 450,q_magic_defence_max = 450,},
	{q_titleID = 2119,q_titleName = '至尊VIP-9',q_pic = 1009,q_sp = '魔法攻击+10000,防御属性+500,血量+100000',school = 2,q_max_hp = 100000,q_magic_attack_min = 10000,q_magic_attack_max = 10000,q_defence_min = 500,q_defence_max = 500,q_magic_defence_min = 500,q_magic_defence_max = 500,},

	{q_titleID = 2121,q_titleName = '至尊VIP-1',q_pic = 1001,q_sp = '道术攻击+2000,防御属性+100,血量+20000',school = 3,q_max_hp = 20000,q_sc_attack_min = 2000,q_sc_attack_max = 2000,q_defence_min = 100,q_defence_max = 100,q_magic_defence_min = 100,q_magic_defence_max = 100,},
	{q_titleID = 2122,q_titleName = '至尊VIP-2',q_pic = 1002,q_sp = '道术攻击+3000,防御属性+150,血量+30000',school = 3,q_max_hp = 30000,q_sc_attack_min = 3000,q_sc_attack_max = 3000,q_defence_min = 150,q_defence_max = 150,q_magic_defence_min = 150,q_magic_defence_max = 150,},
	{q_titleID = 2123,q_titleName = '至尊VIP-3',q_pic = 1003,q_sp = '道术攻击+4000,防御属性+200,血量+40000',school = 3,q_max_hp = 40000,q_sc_attack_min = 4000,q_sc_attack_max = 4000,q_defence_min = 200,q_defence_max = 200,q_magic_defence_min = 200,q_magic_defence_max = 200,},
	{q_titleID = 2124,q_titleName = '至尊VIP-4',q_pic = 1004,q_sp = '道术攻击+5000,防御属性+250,血量+50000',school = 3,q_max_hp = 50000,q_sc_attack_min = 5000,q_sc_attack_max = 5000,q_defence_min = 250,q_defence_max = 250,q_magic_defence_min = 250,q_magic_defence_max = 250,},
	{q_titleID = 2125,q_titleName = '至尊VIP-5',q_pic = 1005,q_sp = '道术攻击+6000,防御属性+300,血量+60000',school = 3,q_max_hp = 60000,q_sc_attack_min = 6000,q_sc_attack_max = 6000,q_defence_min = 300,q_defence_max = 300,q_magic_defence_min = 300,q_magic_defence_max = 300,},
	{q_titleID = 2126,q_titleName = '至尊VIP-6',q_pic = 1006,q_sp = '道术攻击+7000,防御属性+350,血量+70000',school = 3,q_max_hp = 70000,q_sc_attack_min = 7000,q_sc_attack_max = 7000,q_defence_min = 350,q_defence_max = 350,q_magic_defence_min = 350,q_magic_defence_max = 350,},
	{q_titleID = 2127,q_titleName = '至尊VIP-7',q_pic = 1007,q_sp = '道术攻击+8000,防御属性+400,血量+80000',school = 3,q_max_hp = 80000,q_sc_attack_min = 8000,q_sc_attack_max = 8000,q_defence_min = 400,q_defence_max = 400,q_magic_defence_min = 400,q_magic_defence_max = 400,},
	{q_titleID = 2128,q_titleName = '至尊VIP-8',q_pic = 1008,q_sp = '道术攻击+9000,防御属性+450,血量+90000',school = 3,q_max_hp = 90000,q_sc_attack_min = 9000,q_sc_attack_max = 9000,q_defence_min = 450,q_defence_max = 450,q_magic_defence_min = 450,q_magic_defence_max = 450,},
	{q_titleID = 2129,q_titleName = '至尊VIP-9',q_pic = 1009,q_sp = '道术攻击+10000,防御属性+500,血量+100000',school = 3,q_max_hp = 100000,q_sc_attack_min = 10000,q_sc_attack_max = 10000,q_defence_min = 500,q_defence_max = 500,q_magic_defence_min = 500,q_magic_defence_max = 500,},

      
	{q_titleID = 2101,q_titleName = '至尊VIP-1',q_pic = 1001,q_sp = '攻击+2000,防御属性+100,血量+20000',school = 4,q_max_hp = 20000,q_attack_min = 2000,q_attack_max = 2000,q_defence_min = 100,q_defence_max = 100,q_magic_defence_min = 100,q_magic_defence_max = 100,},
	{q_titleID = 2102,q_titleName = '至尊VIP-2',q_pic = 1002,q_sp = '攻击+3000,防御属性+150,血量+30000',school = 4,q_max_hp = 30000,q_attack_min = 3000,q_attack_max = 3000,q_defence_min = 150,q_defence_max = 150,q_magic_defence_min = 150,q_magic_defence_max = 150,},
	{q_titleID = 2103,q_titleName = '至尊VIP-3',q_pic = 1003,q_sp = '攻击+4000,防御属性+200,血量+40000',school = 4,q_max_hp = 40000,q_attack_min = 4000,q_attack_max = 4000,q_defence_min = 200,q_defence_max = 200,q_magic_defence_min = 200,q_magic_defence_max = 200,},
	{q_titleID = 2104,q_titleName = '至尊VIP-4',q_pic = 1004,q_sp = '攻击+5000,防御属性+250,血量+50000',school = 4,q_max_hp = 50000,q_attack_min = 5000,q_attack_max = 5000,q_defence_min = 250,q_defence_max = 250,q_magic_defence_min = 250,q_magic_defence_max = 250,},
	{q_titleID = 2105,q_titleName = '至尊VIP-5',q_pic = 1005,q_sp = '攻击+6000,防御属性+300,血量+60000',school = 4,q_max_hp = 60000,q_attack_min = 6000,q_attack_max = 6000,q_defence_min = 300,q_defence_max = 300,q_magic_defence_min = 300,q_magic_defence_max = 300,},
	{q_titleID = 2106,q_titleName = '至尊VIP-6',q_pic = 1006,q_sp = '攻击+7000,防御属性+350,血量+70000',school = 4,q_max_hp = 70000,q_attack_min = 7000,q_attack_max = 7000,q_defence_min = 350,q_defence_max = 350,q_magic_defence_min = 350,q_magic_defence_max = 350,},
	{q_titleID = 2107,q_titleName = '至尊VIP-7',q_pic = 1007,q_sp = '攻击+8000,防御属性+400,血量+80000',school = 4,q_max_hp = 80000,q_attack_min = 8000,q_attack_max = 8000,q_defence_min = 400,q_defence_max = 400,q_magic_defence_min = 400,q_magic_defence_max = 400,},
	{q_titleID = 2108,q_titleName = '至尊VIP-8',q_pic = 1008,q_sp = '攻击+9000,防御属性+450,血量+90000',school = 4,q_max_hp = 90000,q_attack_min = 9000,q_attack_max = 9000,q_defence_min = 450,q_defence_max = 450,q_magic_defence_min = 450,q_magic_defence_max = 450,},
	{q_titleID = 2109,q_titleName = '至尊VIP-9',q_pic = 1009,q_sp = '攻击+10000,防御属性+500,血量+100000',school = 4,q_max_hp = 100000,q_attack_min = 10000,q_attack_max = 10000,q_defence_min = 500,q_defence_max = 500,q_magic_defence_min = 500,q_magic_defence_max = 500,},

      
      
      
      
      
      
};


local n = 1


for n = 1, 119   do      
table.insert(Items,{q_titleID = 2236+n*3,q_titleName = '稀有称号'..n,q_pic = 64+n,q_sp = '攻击+5000,血量+10000',school = 1,q_max_hp = 10000,q_attack_min = 5000,q_attack_max = 5000,battle = 20000,})      
table.insert(Items,{q_titleID = 2237+n*3,q_titleName = '稀有称号'..n,q_pic = 64+n,q_sp = '攻击+5000,血量+10000',school = 2,q_max_hp = 10000,q_magic_attack_min = 5000,q_magic_attack_max = 5000,battle = 20000,})
table.insert(Items,{q_titleID = 2238+n*3,q_titleName = '稀有称号'..n,q_pic = 64+n,q_sp = '攻击+5000,血量+10000',school = 3,q_max_hp = 10000,q_sc_attack_min = 5000,q_sc_attack_max = 5000,battle = 20000,})
end




return Items
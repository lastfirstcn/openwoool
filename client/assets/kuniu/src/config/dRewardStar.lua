local Items = {
	{q_id = 1011,q_levelMin = 22,q_levelMax = 30,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 41700,q_rewards_coin = 8000,},
	{q_id = 1012,q_levelMin = 22,q_levelMax = 30,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 48600,q_rewards_coin = 9400,},
	{q_id = 1013,q_levelMin = 22,q_levelMax = 30,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 55600,q_rewards_coin = 10700,},
	{q_id = 1014,q_levelMin = 22,q_levelMax = 30,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 62500,q_rewards_coin = 12000,},
	{q_id = 1015,q_levelMin = 22,q_levelMax = 30,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 69400,q_rewards_coin = 13300,},
	{q_id = 1016,q_levelMin = 31,q_levelMax = 40,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 41700,q_rewards_coin = 8000,},
	{q_id = 1017,q_levelMin = 31,q_levelMax = 40,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 48600,q_rewards_coin = 9400,},
	{q_id = 1018,q_levelMin = 31,q_levelMax = 40,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 55600,q_rewards_coin = 10700,},
	{q_id = 1019,q_levelMin = 31,q_levelMax = 40,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 62500,q_rewards_coin = 12000,},
	{q_id = 1020,q_levelMin = 31,q_levelMax = 40,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 69400,q_rewards_coin = 13300,},
	{q_id = 1021,q_levelMin = 41,q_levelMax = 50,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 41700,q_rewards_coin = 8000,},
	{q_id = 1022,q_levelMin = 41,q_levelMax = 50,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 48600,q_rewards_coin = 9400,},
	{q_id = 1023,q_levelMin = 41,q_levelMax = 50,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 55600,q_rewards_coin = 10700,},
	{q_id = 1024,q_levelMin = 41,q_levelMax = 50,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 62500,q_rewards_coin = 12000,},
	{q_id = 1025,q_levelMin = 41,q_levelMax = 50,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 69400,q_rewards_coin = 13300,},
	{q_id = 1026,q_levelMin = 51,q_levelMax = 60,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 58400,q_rewards_coin = 10100,},
	{q_id = 1027,q_levelMin = 51,q_levelMax = 60,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 68100,q_rewards_coin = 11800,},
	{q_id = 1028,q_levelMin = 51,q_levelMax = 60,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 77800,q_rewards_coin = 13500,},
	{q_id = 1029,q_levelMin = 51,q_levelMax = 60,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 87500,q_rewards_coin = 15200,},
	{q_id = 1030,q_levelMin = 51,q_levelMax = 60,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 97200,q_rewards_coin = 16800,},
	{q_id = 1031,q_levelMin = 61,q_levelMax = 70,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 74000,q_rewards_coin = 12800,},
	{q_id = 1032,q_levelMin = 61,q_levelMax = 70,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 86300,q_rewards_coin = 15000,},
	{q_id = 1033,q_levelMin = 61,q_levelMax = 70,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 98600,q_rewards_coin = 17100,},
	{q_id = 1034,q_levelMin = 61,q_levelMax = 70,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 110900,q_rewards_coin = 19200,},
	{q_id = 1035,q_levelMin = 61,q_levelMax = 70,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 123200,q_rewards_coin = 21300,},
	{q_id = 1036,q_levelMin = 71,q_levelMax = 80,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 90600,q_rewards_coin = 15700,},
	{q_id = 1037,q_levelMin = 71,q_levelMax = 80,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 105700,q_rewards_coin = 18300,},
	{q_id = 1038,q_levelMin = 71,q_levelMax = 80,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 120800,q_rewards_coin = 20900,},
	{q_id = 1039,q_levelMin = 71,q_levelMax = 80,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 135900,q_rewards_coin = 23500,},
	{q_id = 1040,q_levelMin = 71,q_levelMax = 80,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 151000,q_rewards_coin = 26100,},
	{q_id = 1041,q_levelMin = 81,q_levelMax = 90,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 104100,q_rewards_coin = 18000,},
	{q_id = 1042,q_levelMin = 81,q_levelMax = 90,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 121500,q_rewards_coin = 21000,},
	{q_id = 1043,q_levelMin = 81,q_levelMax = 90,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 138800,q_rewards_coin = 24000,},
	{q_id = 1044,q_levelMin = 81,q_levelMax = 90,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 156200,q_rewards_coin = 27000,},
	{q_id = 1045,q_levelMin = 81,q_levelMax = 90,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 173500,q_rewards_coin = 30000,},
	{q_id = 1046,q_levelMin = 91,q_levelMax = 100,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 104100,q_rewards_coin = 18000,},
	{q_id = 1047,q_levelMin = 91,q_levelMax = 100,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 121500,q_rewards_coin = 21000,},
	{q_id = 1048,q_levelMin = 91,q_levelMax = 100,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 138800,q_rewards_coin = 24000,},
	{q_id = 1049,q_levelMin = 91,q_levelMax = 100,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 156200,q_rewards_coin = 27000,},
	{q_id = 1050,q_levelMin = 91,q_levelMax = 100,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 173500,q_rewards_coin = 30000,},
	{q_id = 1051,q_levelMin = 101,q_levelMax = 125,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 104100,q_rewards_coin = 18000,},
	{q_id = 1052,q_levelMin = 101,q_levelMax = 125,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 121500,q_rewards_coin = 21000,},
	{q_id = 1053,q_levelMin = 101,q_levelMax = 125,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 138800,q_rewards_coin = 24000,},
	{q_id = 1054,q_levelMin = 101,q_levelMax = 125,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 156200,q_rewards_coin = 27000,},
	{q_id = 1055,q_levelMin = 101,q_levelMax = 125,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 173500,q_rewards_coin = 30000,},
	{q_id = 1056,q_levelMin = 126,q_levelMax = 150,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 104100,q_rewards_coin = 18000,},
	{q_id = 1057,q_levelMin = 126,q_levelMax = 150,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 121500,q_rewards_coin = 21000,},
	{q_id = 1058,q_levelMin = 126,q_levelMax = 150,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 138800,q_rewards_coin = 24000,},
	{q_id = 1059,q_levelMin = 126,q_levelMax = 150,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 156200,q_rewards_coin = 27000,},
	{q_id = 1060,q_levelMin = 126,q_levelMax = 150,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 173500,q_rewards_coin = 30000,},
	{q_id = 1061,q_levelMin = 151,q_levelMax = 199,q_starLevel = 1,q_addPre = 0.60000000,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 104100,q_rewards_coin = 18000,},
	{q_id = 1062,q_levelMin = 151,q_levelMax = 199,q_starLevel = 2,q_addPre = 0.70000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 121500,q_rewards_coin = 21000,},
	{q_id = 1063,q_levelMin = 151,q_levelMax = 199,q_starLevel = 3,q_addPre = 0.80000000,q_starRate = 20,q_upStarNeedMoney = 55,q_rewards_exp =20* 138800,q_rewards_coin = 24000,},
	{q_id = 1064,q_levelMin = 151,q_levelMax = 199,q_starLevel = 4,q_addPre = 0.90000000,q_starRate = 10,q_upStarNeedMoney = 55,q_rewards_exp =20* 156200,q_rewards_coin = 27000,},
	{q_id = 1065,q_levelMin = 151,q_levelMax = 199,q_starLevel = 5,q_addPre = 1,q_starRate = 5,q_upStarNeedMoney = 55,q_rewards_exp =20* 173500,q_rewards_coin = 30000,},

};
return Items
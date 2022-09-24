local Items = {
	{q_id = 1000,q_effectType = 2,q_mapID = 2100,q_xPos = 56,q_yPos = 69,},
	{q_id = 1001,q_effectType = 2,q_mapID = 1100,q_xPos = 29,q_yPos = 95,},
	{q_id = 1002,q_effectType = 8,},
	{q_id = 1003,q_effectType = 2,q_mapID = 1300,q_xPos = 29,q_yPos = 35,},
	{q_id = 1073,q_effectType = 1,q_effect_attr = 13,q_drug = '5',},
	{q_id = 2000,q_effectType = 7,},
	{q_id = 2997,q_effectType = 1,q_effect_attr = '7',q_drug = 150,},
	{q_id = 2998,q_effectType = 1,q_effect_attr = 10,q_drug = 100,},
	{q_id = 2999,q_effectType = 1,q_effect_attr = '7',q_drug = '500',},
	{q_id = 3000,q_effectType = 1,q_effect_attr = 1,q_drug = '500',},
	{q_id = 3001,q_effectType = 1,q_effect_attr = '2,3',q_drug = '500,500',},
	{q_id = 3002,q_effectType = 1,q_effect_attr = '2,3',q_drug = '1000,1000',},
	{q_id = 3003,q_effectType = 1,q_effect_attr = '2,3',q_drug = '4000,4000',},
	{q_id = 3099,q_effectType = 3,q_buff = 30,},
	{q_id = 3100,q_effectType = 3,q_buff = 29,},
	{q_id = 3101,q_effectType = 3,q_buff = 12,},
	{q_id = 3102,q_effectType = 3,q_buff = 13,},
	{q_id = 3103,q_effectType = 1,q_effect_attr = 4,q_drug = '1',},
	{q_id = 3104,q_effectType = 1,q_effect_attr = '7',q_drug = '50000',},
	{q_id = 3105,q_effectType = 1,q_effect_attr = '7',q_drug = '1000000',},
	{q_id = 3106,q_effectType = 1,q_effect_attr = 10,q_drug = '100000',},
	{q_id = 3107,q_effectType = 1,q_effect_attr = 10,q_drug = '50000',},
	{q_id = 3108,q_effectType = 1,q_effect_attr = 10,q_drug = '10000',},
	{q_id = 3109,q_effectType = 1,q_effect_attr = 1,q_drug = '5000',},
	{q_id = 3110,q_effectType = 1,q_effect_attr = 1,q_drug = '50000',},
	{q_id = 3111,q_effectType = 1,q_effect_attr = 1,q_drug = '100000',},
	{q_id = 3112,q_effectType = 1,q_effect_attr = 1,q_drug = '1000000',},
	{q_id = 3113,q_effectType = 1,q_effect_attr = 1,q_drug = '5000000',},
	{q_id = 3114,q_effectType = 3,q_buff = 19,},
	{q_id = 3115,q_effectType = 3,q_buff = 20,},
	{q_id = 3116,q_effectType = 3,q_buff = 21,},
	{q_id = 3117,q_effectType = 3,q_buff = 22,},
	{q_id = 3118,q_effectType = 1,q_effect_attr = 11,},--祝福油
	{q_id = 3119,q_effectType = 1,q_effect_attr = 12,q_drug = '-4',},--消红药水
	{q_id = 3120,q_effectType = 5,q_skillLvl = 9013001,},
	{q_id = 3121,q_effectType = 5,q_skillLvl = 9014001,},
	{q_id = 3122,q_effectType = 5,q_skillLvl = 9015001,},
	{q_id = 3123,q_effectType = 5,q_skillLvl = 9016001,},
	{q_id = 3124,q_effectType = 5,q_skillLvl = 9017001,},
	{q_id = 3125,q_effectType = 5,q_skillLvl = 9018001,},
	{q_id = 3126,q_effectType = 5,q_skillLvl = 9019001,},
	{q_id = 3127,q_effectType = 5,q_skillLvl = 9020001,},
	{q_id = 3128,q_effectType = 5,q_skillLvl = 9021001,},
	{q_id = 3129,q_effectType = 5,q_skillLvl = 9022001,},
	{q_id = 3130,q_effectType = 5,q_skillLvl = 9023001,},
	{q_id = 3131,q_effectType = 5,q_skillLvl = 9024001,},
	{q_id = 3978,q_effectType = 5,q_skillLvl = 2009001,},
	{q_id = 3979,q_effectType = 5,q_skillLvl = 3010001,},
	{q_id = 3980,q_effectType = 5,q_skillLvl = 1008001,},
	{q_id = 3981,q_effectType = 5,q_skillLvl = 2007001,},
	{q_id = 3982,q_effectType = 5,q_skillLvl = 3003001,},
	{q_id = 3983,q_effectType = 5,q_skillLvl = 1005001,},
	{q_id = 3984,q_effectType = 11,q_skillLvl = 7500,},
	{q_id = 3985,q_effectType = 11,q_skillLvl = 7600,},
	{q_id = 3986,q_effectType = 5,q_skillLvl = 9001001,},
	{q_id = 3987,q_effectType = 5,q_skillLvl = 9002001,},
	{q_id = 3988,q_effectType = 5,q_skillLvl = 9003001,},
	{q_id = 3989,q_effectType = 5,q_skillLvl = 9004001,},
	{q_id = 3990,q_effectType = 5,q_skillLvl = 9005001,},
	{q_id = 3991,q_effectType = 5,q_skillLvl = 9006001,},
	{q_id = 3992,q_effectType = 5,q_skillLvl = 9007001,},
	{q_id = 3993,q_effectType = 5,q_skillLvl = 9008001,},
	{q_id = 3994,q_effectType = 5,q_skillLvl = 9009001,},
	{q_id = 3995,q_effectType = 5,q_skillLvl = 9010001,},
	{q_id = 3996,q_effectType = 5,q_skillLvl = 9011001,},
	{q_id = 3997,q_effectType = 5,q_skillLvl = 9012001,},
	{q_id = 3998,q_effectType = 5,q_skillLvl = 2008001,},
	{q_id = 3999,q_effectType = 5,q_skillLvl = 3007001,},
	{q_id = 4000,q_effectType = 5,q_skillLvl = 1006001,},
	{q_id = 4001,q_effectType = 1,q_effect_attr = 2,q_drug = 30,},
	{q_id = 4002,q_effectType = 4,},
	{q_id = 4003,q_effectType = 6,q_gift = 1041,},
	{q_id = 4004,q_effectType = 7,q_gift = 1042,},
	{q_id = 4005,q_effectType = 8,},
	{q_id = 4006,q_effectType = 19,q_buff = 32,wkjl = 100,},--挖矿技能
	{q_id = 4007,q_effectType = 19,q_buff = 33,wkjl = 110,},
	{q_id = 4011,q_effectType = 12,dropID = 33356,},
	{q_id = 4009,q_effectType = 12,dropID = 33355,},
	{q_id = 4010,q_effectType = 12,dropID = 33354,},
	{q_id = 5000,q_effectType = 13,},
	{q_id = 5001,q_effectType = 14,},
	{q_id = 9000,q_effectType = 10,q_skillLvl = 8001,},
	{q_id = 9001,q_effectType = 10,q_skillLvl = 8002,},
	{q_id = 9002,q_effectType = 10,q_skillLvl = 8003,},
	{q_id = 9003,q_effectType = 10,q_skillLvl = 8004,},
	{q_id = 9004,q_effectType = 10,q_skillLvl = 8101,},
	{q_id = 9005,q_effectType = 10,q_skillLvl = 8102,},
	{q_id = 9006,q_effectType = 10,q_skillLvl = 8103,},
	{q_id = 9007,q_effectType = 10,q_skillLvl = 8104,},
	{q_id = 9008,q_effectType = 10,q_skillLvl = 8105,},
	{q_id = 9009,q_effectType = 10,q_skillLvl = 8106,},
	{q_id = 9010,q_effectType = 10,q_skillLvl = 8107,},
	{q_id = 9011,q_effectType = 10,q_skillLvl = 8108,},
	{q_id = 9012,q_effectType = 10,q_skillLvl = 8109,},
	{q_id = 9013,q_effectType = 10,q_skillLvl = 8110,},
	{q_id = 9014,q_effectType = 10,q_skillLvl = 8111,},
	{q_id = 9015,q_effectType = 10,q_skillLvl = 8112,},
	{q_id = 9016,q_effectType = 10,q_skillLvl = 8113,},
	{q_id = 9017,q_effectType = 10,q_skillLvl = 8114,},
	{q_id = 9018,q_effectType = 15,q_skillLvl = 8515,},
	{q_id = 9019,q_effectType = 15,q_skillLvl = 8516,},
	{q_id = 9020,q_effectType = 15,q_skillLvl = 8517,},
	{q_id = 9021,q_effectType = 15,q_skillLvl = 8518,},
	{q_id = 9022,q_effectType = 15,q_skillLvl = 8519,},
	{q_id = 9023,q_effectType = 15,q_skillLvl = 8520,},
	{q_id = 9024,q_effectType = 15,q_skillLvl = 8521,},
	{q_id = 9025,q_effectType = 15,q_skillLvl = 8522,},
	{q_id = 9026,q_effectType = 15,q_skillLvl = 8523,},
	{q_id = 9027,q_effectType = 15,q_skillLvl = 8524,},
	{q_id = 9028,q_effectType = 15,q_skillLvl = 8525,},
	{q_id = 9029,q_effectType = 15,q_skillLvl = 8526,},
	{q_id = 9030,q_effectType = 15,q_skillLvl = 8527,},
	{q_id = 9031,q_effectType = 15,q_skillLvl = 8528,},
	{q_id = 9032,q_effectType = 15,q_skillLvl = 8529,},
	{q_id = 9033,q_effectType = 15,q_skillLvl = 8530,},
	{q_id = 9034,q_effectType = 15,q_skillLvl = 8531,},
	{q_id = 9035,q_effectType = 15,q_skillLvl = 8532,},
	{q_id = 9036,q_effectType = 16,q_skillLvl = 8533,},
	{q_id = 9037,q_effectType = 16,q_skillLvl = 8534,},
	{q_id = 9038,q_effectType = 16,q_skillLvl = 8535,},
	{q_id = 9039,q_effectType = 16,q_skillLvl = 8536,},
	{q_id = 9040,q_effectType = 16,q_skillLvl = 8537,},
	{q_id = 9041,q_effectType = 16,q_skillLvl = 8538,},
	{q_id = 9042,q_effectType = 16,q_skillLvl = 8539,},
	{q_id = 9043,q_effectType = 16,q_skillLvl = 8540,},
	{q_id = 9044,q_effectType = 16,q_skillLvl = 8541,},
	{q_id = 9045,q_effectType = 16,q_skillLvl = 8542,},
	{q_id = 9046,q_effectType = 16,q_skillLvl = 8543,},
	{q_id = 9047,q_effectType = 16,q_skillLvl = 8544,},
	{q_id = 9048,q_effectType = 16,q_skillLvl = 8545,},
	{q_id = 9049,q_effectType = 16,q_skillLvl = 8546,},
	{q_id = 9050,q_effectType = 16,q_skillLvl = 8547,},
	{q_id = 9051,q_effectType = 16,q_skillLvl = 8548,},
	{q_id = 9052,q_effectType = 16,q_skillLvl = 8549,},
	{q_id = 9053,q_effectType = 16,q_skillLvl = 8550,},
	{q_id = 9054,q_effectType = 10,q_skillLvl = 8115,},
	{q_id = 9055,q_effectType = 10,q_skillLvl = 8116,},
	{q_id = 9056,q_effectType = 10,q_skillLvl = 8117,},
	{q_id = 9057,q_effectType = 10,q_skillLvl = 8118,},
	{q_id = 9058,q_effectType = 10,q_skillLvl = 8119,},
	{q_id = 9059,q_effectType = 10,q_skillLvl = 8120,},
	{q_id = 9060,q_effectType = 9,q_skillLvl = 8551,},
	{q_id = 9061,q_effectType = 9,q_skillLvl = 8552,},
	{q_id = 9062,q_effectType = 9,q_skillLvl = 8553,},
	{q_id = 9063,q_effectType = 9,q_skillLvl = 8554,},
	{q_id = 9064,q_effectType = 9,q_skillLvl = 8555,},
	{q_id = 9065,q_effectType = 9,q_skillLvl = 8556,},
	{q_id = 9066,q_effectType = 15,q_skillLvl = 8557,},
	{q_id = 9067,q_effectType = 15,q_skillLvl = 8558,},
	{q_id = 9068,q_effectType = 15,q_skillLvl = 8559,},
	{q_id = 9069,q_effectType = 15,q_skillLvl = 8560,},
	{q_id = 9070,q_effectType = 15,q_skillLvl = 8561,},
	{q_id = 9071,q_effectType = 15,q_skillLvl = 8562,},
	{q_id = 9072,q_effectType = 16,q_skillLvl = 8563,},
	{q_id = 9073,q_effectType = 16,q_skillLvl = 8564,},
	{q_id = 9074,q_effectType = 16,q_skillLvl = 8565,},
	{q_id = 9075,q_effectType = 16,q_skillLvl = 8566,},
	{q_id = 9076,q_effectType = 16,q_skillLvl = 8567,},
	{q_id = 9077,q_effectType = 16,q_skillLvl = 8568,},
	{q_id = 10000,q_effectType = 9,q_skillLvl = 8005,},
	{q_id = 10001,q_effectType = 9,q_skillLvl = 8006,},
	{q_id = 10002,q_effectType = 9,q_skillLvl = 8007,},
	{q_id = 10003,q_effectType = 9,q_skillLvl = 8008,},
	{q_id = 10004,q_effectType = 9,q_skillLvl = 8501,},
	{q_id = 10005,q_effectType = 9,q_skillLvl = 8502,},
	{q_id = 10006,q_effectType = 9,q_skillLvl = 8503,},
	{q_id = 10007,q_effectType = 9,q_skillLvl = 8504,},
	{q_id = 10008,q_effectType = 9,q_skillLvl = 8505,},
	{q_id = 10009,q_effectType = 9,q_skillLvl = 8506,},
	{q_id = 10010,q_effectType = 9,q_skillLvl = 8507,},
	{q_id = 10011,q_effectType = 9,q_skillLvl = 8508,},
	{q_id = 10012,q_effectType = 9,q_skillLvl = 8509,},
	{q_id = 10013,q_effectType = 9,q_skillLvl = 8510,},
	{q_id = 10014,q_effectType = 9,q_skillLvl = 8511,},
	{q_id = 10015,q_effectType = 9,q_skillLvl = 8512,},
	{q_id = 10016,q_effectType = 9,q_skillLvl = 8513,},
	{q_id = 10017,q_effectType = 9,q_skillLvl = 8514,},
	{q_id = 20001,q_effectType = 6,q_gift = 10001,},
	{q_id = 20002,q_effectType = 6,q_gift = 10002,},
	{q_id = 20003,q_effectType = 6,q_gift = 10003,},
	{q_id = 20004,q_effectType = 6,q_gift = 10014,},
	{q_id = 20005,q_effectType = 6,q_gift = 10015,},
	{q_id = 20006,q_effectType = 6,q_gift = 10016,},
	{q_id = 20007,q_effectType = 6,q_gift = 10017,},
	{q_id = 20008,q_effectType = 6,q_gift = 10018,},
	{q_id = 20009,q_effectType = 6,q_gift = 10019,},
	{q_id = 20010,q_effectType = 6,q_gift = 10020,},
	{q_id = 20011,q_effectType = 6,q_gift = 10021,},
	{q_id = 20012,q_effectType = 6,q_gift = 10022,},
	{q_id = 20013,q_effectType = 6,q_gift = 10023,},
	{q_id = 20014,q_effectType = 6,q_gift = 10024,},
	{q_id = 20015,q_effectType = 6,q_gift = 10025,},
	{q_id = 20016,q_effectType = 6,q_gift = 10026,},
	{q_id = 20017,q_effectType = 6,q_gift = 10027,},
	{q_id = 20018,q_effectType = 6,q_gift = 10028,},
	{q_id = 29999,q_effectType = 12,dropID = 29999,},
	{q_id = 30000,q_effectType = 12,dropID = 39999,},
	{q_id = 30001,q_effectType = 12,dropID = 40000,},
	{q_id = 30002,q_effectType = 12,dropID = 40001,},
	{q_id = 30003,q_effectType = 12,dropID = 40002,},
	{q_id = 30004,q_effectType = 12,dropID = 40003,},
	{q_id = 30005,q_effectType = 12,dropID = 40004,},
	{q_id = 30006,q_effectType = 12,dropID = 40005,},
	{q_id = 30007,q_effectType = 12,dropID = 40006,},
	{q_id = 30008,q_effectType = 12,dropID = 40007,},
	{q_id = 30009,q_effectType = 12,dropID = 40008,},
	{q_id = 30010,q_effectType = 12,dropID = 40009,},
	{q_id = 30011,q_effectType = 12,dropID = 40010,},
	{q_id = 30012,q_effectType = 12,dropID = 40011,},
	{q_id = 30013,q_effectType = 12,dropID = 40012,},
	{q_id = 30014,q_effectType = 12,dropID = 40013,},
	{q_id = 30015,q_effectType = 12,dropID = 40014,},
	{q_id = 30016,q_effectType = 18,bagIdx = 1,},
	{q_id = 30017,q_effectType = 12,dropID = 900,},
	{q_id = 30018,q_effectType = 12,dropID = 901,},
	{q_id = 30019,q_effectType = 12,dropID = 902,},
	{q_id = 30020,q_effectType = 18,bagIdx = 2,},
	{q_id = 30021,q_effectType = 3,q_buff = 99,},
	{q_id = 30022,q_effectType = 3,q_buff = 100,},
	{q_id = 30023,q_effectType = 3,q_buff = 101,},
	{q_id = 30024,q_effectType = 3,q_buff = 102,},
	{q_id = 30025,q_effectType = 3,q_buff = 103,},
	{q_id = 30026,q_effectType = 3,q_buff = 104,},
	{q_id = 30027,q_effectType = 3,q_buff = 105,},
	{q_id = 30028,q_effectType = 3,q_buff = 106,},
	{q_id = 30029,q_effectType = 3,q_buff = 107,},
	{q_id = 30030,q_effectType = 12,dropID = 903,},
	{q_id = 30031,q_effectType = 12,dropID = 898,},
	{q_id = 30032,q_effectType = 12,dropID = 899,},
	{q_id = 30033,q_effectType = 1,q_effect_attr = '2,3',q_drug = '100,100',},
	{q_id = 30034,q_effectType = 1,q_effect_attr = '2,3',q_drug = '300,200',},
	{q_id = 30035,q_effectType = 1,q_effect_attr = '2,3',q_drug = '3000,1000',},
	{q_id = 30036,q_effectType = 3,q_buff = 99,},
	{q_id = 30037,q_effectType = 19,},
	{q_id = 30038,q_effectType = 12,dropID = 6020,},
	{q_id = 4008,q_effectType = 19,q_buff = 109,wkjl = 0,},
	{q_id = 12011,q_effectType = 12,},
	{q_id = 12021,q_effectType = 12,},
	{q_id = 12031,q_effectType = 12,dropID = 7001,},
	{q_id = 12041,q_effectType = 12,dropID = 7011,},
	{q_id = 12051,q_effectType = 12,dropID = 7021,},
	{q_id = 12061,q_effectType = 12,dropID = 7031,},
	{q_id = 12071,q_effectType = 12,dropID = 7041,},
	{q_id = 12081,q_effectType = 12,},
	{q_id = 12012,q_effectType = 12,},
	{q_id = 12022,q_effectType = 12,},
	{q_id = 12032,q_effectType = 12,dropID = 7002,},
	{q_id = 12042,q_effectType = 12,dropID = 7012,},
	{q_id = 12052,q_effectType = 12,dropID = 7022,},
	{q_id = 12062,q_effectType = 12,dropID = 7032,},
	{q_id = 12072,q_effectType = 12,dropID = 7042,},
	{q_id = 12082,q_effectType = 12,},
	{q_id = 12013,q_effectType = 12,},
	{q_id = 12023,q_effectType = 12,},
	{q_id = 12033,q_effectType = 12,dropID = 7003,},
	{q_id = 12043,q_effectType = 12,dropID = 7013,},
	{q_id = 12053,q_effectType = 12,dropID = 7023,},
	{q_id = 12063,q_effectType = 12,dropID = 7033,},
	{q_id = 12073,q_effectType = 12,dropID = 7043,},
	{q_id = 12083,q_effectType = 12,},
	{q_id = 12014,q_effectType = 12,},
	{q_id = 12024,q_effectType = 12,},
	{q_id = 12034,q_effectType = 12,dropID = 7004,},
	{q_id = 12044,q_effectType = 12,dropID = 7014,},
	{q_id = 12054,q_effectType = 12,dropID = 7024,},
	{q_id = 12064,q_effectType = 12,dropID = 7034,},
	{q_id = 12074,q_effectType = 12,dropID = 7044,},
	{q_id = 12084,q_effectType = 12,},
	{q_id = 12015,q_effectType = 12,},
	{q_id = 12025,q_effectType = 12,},
	{q_id = 12035,q_effectType = 12,dropID = 7005,},
	{q_id = 12045,q_effectType = 12,dropID = 7015,},
	{q_id = 12055,q_effectType = 12,dropID = 7025,},
	{q_id = 12065,q_effectType = 12,dropID = 7035,},
	{q_id = 12075,q_effectType = 12,dropID = 7045,},
	{q_id = 12085,q_effectType = 12,},
	{q_id = 12016,q_effectType = 12,},
	{q_id = 12026,q_effectType = 12,},
	{q_id = 12036,q_effectType = 12,dropID = 7006,},
	{q_id = 12046,q_effectType = 12,dropID = 7016,},
	{q_id = 12056,q_effectType = 12,dropID = 7026,},
	{q_id = 12066,q_effectType = 12,dropID = 7036,},
	{q_id = 12076,q_effectType = 12,dropID = 7046,},
	{q_id = 12086,q_effectType = 12,},
	{q_id = 12017,q_effectType = 12,},
	{q_id = 12027,q_effectType = 12,},
	{q_id = 12037,q_effectType = 12,dropID = 7007,},
	{q_id = 12047,q_effectType = 12,dropID = 7017,},
	{q_id = 12057,q_effectType = 12,dropID = 7027,},
	{q_id = 12067,q_effectType = 12,dropID = 7037,},
	{q_id = 12077,q_effectType = 12,dropID = 7047,},
	{q_id = 12087,q_effectType = 12,},
	{q_id = 12018,q_effectType = 12,},
	{q_id = 12028,q_effectType = 12,},
	{q_id = 12038,q_effectType = 12,dropID = 7008,},
	{q_id = 12048,q_effectType = 12,dropID = 7018,},
	{q_id = 12058,q_effectType = 12,dropID = 7028,},
	{q_id = 12068,q_effectType = 12,dropID = 7038,},
	{q_id = 12078,q_effectType = 12,dropID = 7048,},
	{q_id = 12088,q_effectType = 12,},
	{q_id = 20019,q_effectType = 12,dropID = 800,},
	{q_id = 7001,q_effectType = 1,q_effect_attr = 1,q_drug = 16000,},
	{q_id = 7002,q_effectType = 1,q_effect_attr = 1,q_drug = 32800,},
	{q_id = 7003,q_effectType = 1,q_effect_attr = 1,q_drug = 44000,},
	{q_id = 7004,q_effectType = 1,q_effect_attr = 1,q_drug = 52000,},
	{q_id = 7005,q_effectType = 1,q_effect_attr = 1,q_drug = 58400,},
	{q_id = 7006,q_effectType = 1,q_effect_attr = 1,q_drug = 64000,},
	{q_id = 7007,q_effectType = 1,q_effect_attr = 1,q_drug = 68800,},
	{q_id = 7008,q_effectType = 1,q_effect_attr = 1,q_drug = 73600,},
	{q_id = 7009,q_effectType = 1,q_effect_attr = 1,q_drug = 76800,},
	{q_id = 7010,q_effectType = 1,q_effect_attr = 1,q_drug = 80000,},
	{q_id = 7011,q_effectType = 1,q_effect_attr = 1,q_drug = 24400,},
	{q_id = 7012,q_effectType = 1,q_effect_attr = 1,q_drug = 50020,},
	{q_id = 7013,q_effectType = 1,q_effect_attr = 1,q_drug = 67100,},
	{q_id = 7014,q_effectType = 1,q_effect_attr = 1,q_drug = 79300,},
	{q_id = 7015,q_effectType = 1,q_effect_attr = 1,q_drug = 89060,},
	{q_id = 7016,q_effectType = 1,q_effect_attr = 1,q_drug = 97600,},
	{q_id = 7017,q_effectType = 1,q_effect_attr = 1,q_drug = 104920,},
	{q_id = 7018,q_effectType = 1,q_effect_attr = 1,q_drug = 112240,},
	{q_id = 7019,q_effectType = 1,q_effect_attr = 1,q_drug = 117120,},
	{q_id = 7020,q_effectType = 1,q_effect_attr = 1,q_drug = 122000,},
	{q_id = 7021,q_effectType = 1,q_effect_attr = 1,q_drug = 37000,},
	{q_id = 7022,q_effectType = 1,q_effect_attr = 1,q_drug = 75850,},
	{q_id = 7023,q_effectType = 1,q_effect_attr = 1,q_drug = 101750,},
	{q_id = 7024,q_effectType = 1,q_effect_attr = 1,q_drug = 120250,},
	{q_id = 7025,q_effectType = 1,q_effect_attr = 1,q_drug = 135050,},
	{q_id = 7026,q_effectType = 1,q_effect_attr = 1,q_drug = 148000,},
	{q_id = 7027,q_effectType = 1,q_effect_attr = 1,q_drug = 159100,},
	{q_id = 7028,q_effectType = 1,q_effect_attr = 1,q_drug = 170200,},
	{q_id = 7029,q_effectType = 1,q_effect_attr = 1,q_drug = 177600,},
	{q_id = 7030,q_effectType = 1,q_effect_attr = 1,q_drug = 185000,},
	{q_id = 7031,q_effectType = 1,q_effect_attr = 1,q_drug = 12800,},
	{q_id = 7032,q_effectType = 1,q_effect_attr = 1,q_drug = 26240,},
	{q_id = 7033,q_effectType = 1,q_effect_attr = 1,q_drug = 35200,},
	{q_id = 7034,q_effectType = 1,q_effect_attr = 1,q_drug = 41600,},
	{q_id = 7035,q_effectType = 1,q_effect_attr = 1,q_drug = 46720,},
	{q_id = 7036,q_effectType = 1,q_effect_attr = 1,q_drug = 51200,},
	{q_id = 7037,q_effectType = 1,q_effect_attr = 1,q_drug = 55040,},
	{q_id = 7038,q_effectType = 1,q_effect_attr = 1,q_drug = 58880,},
	{q_id = 7039,q_effectType = 1,q_effect_attr = 1,q_drug = 61440,},--调用药水
	{q_id = 7040,q_effectType = 1,q_effect_attr = 1,q_drug = '25000',},
	{q_id = 6000,q_effectType = 12,dropID = 6000,},
	{q_id = 6001,q_effectType = 3,q_buff = 143,},
	{q_id = 6002,q_effectType = 5,q_skillLvl = 1102001,},
	{q_id = 6003,q_effectType = 5,q_skillLvl = 1010001,},
	{q_id = 6004,q_effectType = 5,q_skillLvl = 1009001,},
	{q_id = 6005,q_effectType = 5,q_skillLvl = 2202001,},
	{q_id = 6006,q_effectType = 5,q_skillLvl = 2010001,},
	{q_id = 6007,q_effectType = 5,q_skillLvl = 2011001,},
	{q_id = 6008,q_effectType = 5,q_skillLvl = 3303001,},
	{q_id = 6009,q_effectType = 5,q_skillLvl = 3011001,},
	{q_id = 6010,q_effectType = 5,q_skillLvl = 3012001,},
	{q_id = 6011,q_effectType = 12,dropID = 7008,},
	{q_id = 6012,q_effectType = 12,dropID = 2025,},
	{q_id = 6013,q_effectType = 12,dropID = 2026,},
	{q_id = 6014,q_effectType = 12,dropID = 2027,},
	{q_id = 6015,q_effectType = 3,q_buff = 336,},
	{q_id = 6016,q_effectType = 3,q_buff = 337,},
	{q_id = 6017,q_effectType = 12,dropID = 2118,},
	{q_id = 6018,q_effectType = 12,dropID = 2119,},
	{q_id = 6019,q_effectType = 12,dropID = 2229,},
	{q_id = 6020,q_effectType = 12,dropID = 2230,},
	{q_id = 6021,q_effectType = 12,dropID = 2231,},
	{q_id = 6022,q_effectType = 12,dropID = 2232,},
	{q_id = 6023,q_effectType = 12,dropID = 2233,},
	{q_id = 6024,q_effectType = 12,dropID = 2234,},
	{q_id = 6025,q_effectType = 5,q_skillLvl = 10044001,},
	{q_id = 6026,q_effectType = 5,q_skillLvl = 10045001,},
	{q_id = 6027,q_effectType = 5,q_skillLvl = 10046001,},
	{q_id = 6028,q_effectType = 5,q_skillLvl = 10047001,},
	{q_id = 6029,q_effectType = 20,act_module_id = 5,act_id = 5,},
	{q_id = 6030,q_effectType = 20,act_module_id = 5,act_id = 6,},
	{q_id = 6031,q_effectType = 5,q_skillLvl = 1050001,},
	{q_id = 6032,q_effectType = 5,q_skillLvl = 1051001,},
	{q_id = 6033,q_effectType = 5,q_skillLvl = 2050001,},
	{q_id = 6034,q_effectType = 5,q_skillLvl = 2051001,},
	{q_id = 6035,q_effectType = 5,q_skillLvl = 3050001,},
	{q_id = 6036,q_effectType = 5,q_skillLvl = 3051001,},
	{q_id = 6037,q_effectType = 21,},
	{q_id = 6038,q_effectType = 12,dropID = 10,},
	{q_id = 6039,q_effectType = 12,dropID = 11,},
	{q_id = 6040,q_effectType = 12,dropID = 23,},--调用爆率
	{q_id = 6041,q_effectType = 5,q_skillLvl = 1002001,},
	{q_id = 6042,q_effectType = 5,q_skillLvl = 1003001,},--调用技能
	{q_id = 6043,q_effectType = 5,q_skillLvl = 1004001,},
	{q_id = 6044,q_effectType = 5,q_skillLvl = 2002001,},
	{q_id = 6045,q_effectType = 5,q_skillLvl = 2003001,},
	{q_id = 6046,q_effectType = 5,q_skillLvl = 2004001,},
	{q_id = 6047,q_effectType = 5,q_skillLvl = 2005001,},
	{q_id = 6048,q_effectType = 5,q_skillLvl = 3001001,},
	{q_id = 6049,q_effectType = 5,q_skillLvl = 3002001,},
	{q_id = 6050,q_effectType = 5,q_skillLvl = 3004001,},
	{q_id = 6051,q_effectType = 5,q_skillLvl = 3006001,},
	{q_id = 6052,q_effectType = 5,q_skillLvl = 3009001,},
	{q_id = 6053,q_effectType = 5,q_skillLvl = 3008001,},
	{q_id = 6054,},
	{q_id = 1017,q_effectType = 22,q_mapID = 6000,q_xPos = 131,q_yPos = 110,},
	{q_id = 1018,q_effectType = 23,q_mapID = 7000,q_xPos = 44,q_yPos = 65,},
	{q_id = 6055,q_effectType = 12,dropID = 2233,},
	{q_id = 6056,q_effectType = 12,dropID = 99,},
	{q_id = 13149,q_effectType = 91,},
	{q_id = 6057,q_effectType = 12,dropID = 2400,},	--黄金藏宝箱--幽泉宝箱
	{q_id = 6058,q_effectType = 12,dropID = 2410,},	--经验丹大
	{q_id = 6059,q_effectType = 12,dropID = 2411,},	--超级经验丹
	{q_id = 6060,q_effectType = 5,q_skillLvl = 7300001,},	--调用BUFF10024001
	{q_id = 6061,q_effectType = 12,dropID = 2412,},	
};
return Items


--装备打造
local Items = {

	--逍遥无极扇
	{q_id = 14,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5130106]=1000}}',q_forgeCost = '{[5030104]=3}',},

	--霹雳法杖
	{q_id = 15,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5120105]=1000}}',q_forgeCost = '{[5020104]=3}',},

	--雷霆怒斩
	{q_id = 16,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5110106]=1000}}',q_forgeCost = '{[5010104]=3}',},

	--倚天剑
	{q_id = 17,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5130107]=1000}}',q_forgeCost = '{[5130106]=3}',},

	--嗜魂
	{q_id = 18,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5120107]=1000}}',q_forgeCost = '{[5120105]=3}',},

	--屠龙刀
	{q_id = 19,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5110107]=1000}}',q_forgeCost = '{[5110106]=3}',},

	--聚灵
	{q_id = 20,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5130108]=1000}}',q_forgeCost = '{[5130107]=3}',},
	--夺魄
	{q_id = 21,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5120108]=1000}}',q_forgeCost = '{[5120107]=3}',},
	--无赦
	{q_id = 22,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5110108]=1000}}',q_forgeCost = '{[5110107]=3}',},

	--怒狂降魔杵
	{q_id = 303,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5110117]=1000}}',q_forgeCost = '{[5110108]=3,[1219]=100,[1103]=100}',},
	--幻龙风雷鞭
	{q_id = 304,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5120117]=1000}}',q_forgeCost = '{[5120108]=3,[1219]=100,[1103]=100}',},
	--清心碧玉笛
	{q_id = 305,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5130117]=1000}}',q_forgeCost = '{[5130108]=3,[1219]=100,[1103]=100}',},

	--烈焰屠龙刀
	{q_id = 306,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5110111]=1000}}',q_forgeCost = '{[5110117]=3,[1219]=200,[1103]=200}',},
	--雷霆审判
	{q_id = 307,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5120111]=1000}}',q_forgeCost = '{[5120117]=3,[1219]=200,[1103]=200}',},
	--碧心道剑
	{q_id = 308,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[5130111]=1000}}',q_forgeCost = '{[5130117]=3,[1219]=200,[1103]=200}',},

	{q_id = 309,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8110108]=1000}}',q_forgeCost = '{[5110111]=3,[1219]=400,[1103]=400}',},
	{q_id = 310,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8120108]=1000}}',q_forgeCost = '{[5120111]=3,[1219]=400,[1103]=400}',},
	{q_id = 311,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8130108]=1000}}',q_forgeCost = '{[5130111]=3,[1219]=400,[1103]=400}',},

	{q_id = 312,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8110118]=1000}}',q_forgeCost = '{[8110108]=3,[1219]=600,[1103]=600}',},
	{q_id = 313,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8120118]=1000}}',q_forgeCost = '{[8120108]=3,[1219]=600,[1103]=600}',},
	{q_id = 314,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8130118]=1000}}',q_forgeCost = '{[8130108]=3,[1219]=600,[1103]=600}',},

	{q_id = 315,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8110128]=1000}}',q_forgeCost = '{[8110118]=3,[1219]=900,[1103]=900}',},
	{q_id = 316,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8120128]=1000}}',q_forgeCost = '{[8120118]=3,[1219]=900,[1103]=900}',},
	{q_id = 317,q_sort = 1,q_menu = 1,q_menuName = '武器',q_itemID = '{{[8130128]=1000}}',q_forgeCost = '{[8130118]=3,[1219]=900,[1103]=900}',},

	--天玄
	{q_id = 47,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5130505]=1000}}',q_forgeCost = '{[5030504]=3}',},
	{q_id = 48,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5131505]=1000}}',q_forgeCost = '{[5031504]=3}',},
	--幻魔
	{q_id = 49,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5120505]=1000}}',q_forgeCost = '{[5020504]=3}',},
	{q_id = 50,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5121505]=1000}}',q_forgeCost = '{[5021504]=3}',},
	--神武
	{q_id = 51,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110505]=1000}}',q_forgeCost = '{[5010504]=3}',},
	{q_id = 52,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111505]=1000}}',q_forgeCost = '{[5011504]=3}',},

	--幽泉
	{q_id = 53,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5130507]=1000}}',q_forgeCost = '{[5130505]=3}',},
	{q_id = 54,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5131507]=1000}}',q_forgeCost = '{[5131505]=3}',},
	--魔雷
	{q_id = 55,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5120507]=1000}}',q_forgeCost = '{[5120505]=3}',},
	{q_id = 56,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5121507]=1000}}',q_forgeCost = '{[5121505]=3}',},
	--血煞
	{q_id = 57,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110507]=1000}}',q_forgeCost = '{[5110505]=3}',},
	{q_id = 58,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111507]=1000}}',q_forgeCost = '{[5111505]=3}',},

	--蟠龙玄天
	{q_id = 59,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5130508]=1000}}',q_forgeCost = '{[5130507]=3}',},
	{q_id = 60,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5131508]=1000}}',q_forgeCost = '{[5131507]=3}',},
	--蟠龙幻天
	{q_id = 61,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5120508]=1000}}',q_forgeCost = '{[5120507]=3}',},
	{q_id = 62,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5121508]=1000}}',q_forgeCost = '{[5121507]=3}',},
	--蟠龙傲天
	{q_id = 63,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110508]=1000}}',q_forgeCost = '{[5110507]=3}',},
	{q_id = 64,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111508]=1000}}',q_forgeCost = '{[5111507]=3}',},

	--圣天
	{q_id = 404,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110116]=1000}}',q_forgeCost = '{[5130508]=3,[1219]=100,[1103]=100}',},
	{q_id = 405,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111116]=1000}}',q_forgeCost = '{[5131508]=3,[1219]=100,[1103]=100}',},

	{q_id = 400,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110114]=1000}}',q_forgeCost = '{[5110508]=3,[1219]=100,[1103]=100}',},
	{q_id = 401,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111114]=1000}}',q_forgeCost = '{[5111508]=3,[1219]=100,[1103]=100}',},

	{q_id = 402,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110115]=1000}}',q_forgeCost = '{[5120508]=3,[1219]=100,[1103]=100}',},
	{q_id = 403,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111115]=1000}}',q_forgeCost = '{[5121508]=3,[1219]=100,[1103]=100}',},









--不灭
	{q_id = 504,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110120]=1000}}',q_forgeCost = '{[5110116]=3,[1219]=200,[1103]=200}',},
	{q_id = 505,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111120]=1000}}',q_forgeCost = '{[5111116]=3,[1219]=200,[1103]=200}',},
	{q_id = 502,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110119]=1000}}',q_forgeCost = '{[5110115]=3,[1219]=200,[1103]=200}',},
	{q_id = 503,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111119]=1000}}',q_forgeCost = '{[5111115]=3,[1219]=200,[1103]=200}',},
	{q_id = 500,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5110118]=1000}}',q_forgeCost = '{[5110114]=3,[1219]=200,[1103]=200}',},
	{q_id = 501,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[5111118]=1000}}',q_forgeCost = '{[5111114]=3,[1219]=200,[1103]=200}',},


--天命
	{q_id = 506,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110114]=1000}}',q_forgeCost = '{[5110118]=3,[1219]=400,[1103]=400}',},
	{q_id = 507,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111114]=1000}}',q_forgeCost = '{[5111118]=3,[1219]=400,[1103]=400}',},
	{q_id = 508,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110115]=1000}}',q_forgeCost = '{[5110119]=3,[1219]=400,[1103]=400}',},
	{q_id = 509,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111115]=1000}}',q_forgeCost = '{[5111119]=3,[1219]=400,[1103]=400}',},
	{q_id = 510,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110116]=1000}}',q_forgeCost = '{[5110120]=3,[1219]=400,[1103]=400}',},
	{q_id = 511,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111116]=1000}}',q_forgeCost = '{[5111120]=3,[1219]=400,[1103]=400}',},

--焚天
	{q_id = 512,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110124]=1000}}',q_forgeCost = '{[8110114]=3,[1219]=600,[1103]=600}',},
	{q_id = 513,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111124]=1000}}',q_forgeCost = '{[8111114]=3,[1219]=600,[1103]=600}',},
	{q_id = 514,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110125]=1000}}',q_forgeCost = '{[8110115]=3,[1219]=600,[1103]=600}',},
	{q_id = 515,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111125]=1000}}',q_forgeCost = '{[8111115]=3,[1219]=600,[1103]=600}',},
	{q_id = 516,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110126]=1000}}',q_forgeCost = '{[8110116]=3,[1219]=600,[1103]=600}',},
	{q_id = 517,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111126]=1000}}',q_forgeCost = '{[8111116]=3,[1219]=600,[1103]=600}',},

--灭世
	{q_id = 518,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110134]=1000}}',q_forgeCost = '{[8110124]=3,[1219]=900,[1103]=900}',},
	{q_id = 519,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111134]=1000}}',q_forgeCost = '{[8111124]=3,[1219]=900,[1103]=900}',},
	{q_id = 520,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110135]=1000}}',q_forgeCost = '{[8110125]=3,[1219]=900,[1103]=900}',},
	{q_id = 521,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111135]=1000}}',q_forgeCost = '{[8111125]=3,[1219]=900,[1103]=900}',},
	{q_id = 522,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8110136]=1000}}',q_forgeCost = '{[8110126]=3,[1219]=900,[1103]=900}',},
	{q_id = 523,q_sort = 1,q_menu = 5,q_menuName = '衣服',q_itemID = '{{[8111136]=1000}}',q_forgeCost = '{[8111126]=3,[1219]=900,[1103]=900}',},





	{q_id = 77,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5130705]=1000}}',q_forgeCost = '{[5030704]=3}',},
	{q_id = 78,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5120705]=1000}}',q_forgeCost = '{[5020704]=3}',},
	{q_id = 79,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5110705]=1000}}',q_forgeCost = '{[5010704]=3}',},
	{q_id = 80,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5130707]=1000}}',q_forgeCost = '{[5130705]=3}',},
	{q_id = 81,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5120707]=1000}}',q_forgeCost = '{[5120705]=3}',},
	{q_id = 82,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5110707]=1000}}',q_forgeCost = '{[5110705]=3}',},
	{q_id = 83,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5130708]=1000}}',q_forgeCost = '{[5130707]=3}',},
	{q_id = 84,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5120708]=1000}}',q_forgeCost = '{[5120707]=3}',},
	{q_id = 85,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5110708]=1000}}',q_forgeCost = '{[5110707]=3}',},
	{q_id = 600,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5110709]=1000}}',q_forgeCost = '{[5110708]=3,[1219]=100,[1103]=100}',},
	{q_id = 601,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5120709]=1000}}',q_forgeCost = '{[5120708]=3,[1219]=100,[1103]=100}',},
	{q_id = 602,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5130709]=1000}}',q_forgeCost = '{[5130708]=3,[1219]=100,[1103]=100}',},
	{q_id = 603,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5110710]=1000}}',q_forgeCost = '{[5110709]=3,[1219]=200,[1103]=200}',},
	{q_id = 604,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5120710]=1000}}',q_forgeCost = '{[5120709]=3,[1219]=200,[1103]=200}',},
	{q_id = 605,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[5130710]=1000}}',q_forgeCost = '{[5130709]=3,[1219]=200,[1103]=200}',},

	{q_id = 606,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8010705]=1000}}',q_forgeCost = '{[5110710]=3,[1219]=400,[1103]=400}',},
	{q_id = 607,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8020705]=1000}}',q_forgeCost = '{[5120710]=3,[1219]=400,[1103]=400}',},
	{q_id = 608,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8000705]=1000}}',q_forgeCost = '{[5130710]=3,[1219]=400,[1103]=400}',},

	{q_id = 609,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8010715]=1000}}',q_forgeCost = '{[8010705]=3,[1219]=600,[1103]=600}',},
	{q_id = 610,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8020715]=1000}}',q_forgeCost = '{[8020705]=3,[1219]=600,[1103]=600}',},
	{q_id = 611,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8000715]=1000}}',q_forgeCost = '{[8000705]=3,[1219]=600,[1103]=600}',},

	{q_id = 612,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8010725]=1000}}',q_forgeCost = '{[8010715]=3,[1219]=900,[1103]=900}',},
	{q_id = 613,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8020725]=1000}}',q_forgeCost = '{[8020715]=3,[1219]=900,[1103]=900}',},
	{q_id = 614,q_sort = 1,q_menu = 7,q_menuName = '头盔',q_itemID = '{{[8000725]=1000}}',q_forgeCost = '{[8000715]=3,[1219]=900,[1103]=900}',},

	{q_id = 86,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5130305]=1000}}',q_forgeCost = '{[5030304]=3}',},
	{q_id = 87,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5120305]=1000}}',q_forgeCost = '{[5020304]=3}',},
	{q_id = 88,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5110305]=1000}}',q_forgeCost = '{[5010304]=3}',},
	{q_id = 89,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5130307]=1000}}',q_forgeCost = '{[5130305]=3}',},
	{q_id = 90,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5120307]=1000}}',q_forgeCost = '{[5120305]=3}',},
	{q_id = 91,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5110307]=1000}}',q_forgeCost = '{[5110305]=3}',},
	{q_id = 92,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5130308]=1000}}',q_forgeCost = '{[5130307]=3}',},
	{q_id = 93,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5120308]=1000}}',q_forgeCost = '{[5120307]=3}',},
	{q_id = 94,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5110308]=1000}}',q_forgeCost = '{[5110307]=3}',},
	{q_id = 700,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5110309]=1000}}',q_forgeCost = '{[5110308]=3,[1219]=100,[1103]=100}',},
	{q_id = 701,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5120309]=1000}}',q_forgeCost = '{[5120308]=3,[1219]=100,[1103]=100}',},
	{q_id = 702,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5130309]=1000}}',q_forgeCost = '{[5130308]=3,[1219]=100,[1103]=100}',},
	{q_id = 703,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5110310]=1000}}',q_forgeCost = '{[5110309]=3,[1219]=200,[1103]=200}',},
	{q_id = 704,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5120310]=1000}}',q_forgeCost = '{[5120309]=3,[1219]=200,[1103]=200}',},
	{q_id = 705,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[5130310]=1000}}',q_forgeCost = '{[5130309]=3,[1219]=200,[1103]=200}',},

	{q_id = 706,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8010305]=1000}}',q_forgeCost = '{[5110310]=3,[1219]=400,[1103]=400}',},
	{q_id = 707,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8020305]=1000}}',q_forgeCost = '{[5120310]=3,[1219]=400,[1103]=400}',},
	{q_id = 708,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8000305]=1000}}',q_forgeCost = '{[5130310]=3,[1219]=400,[1103]=400}',},

	{q_id = 709,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8010315]=1000}}',q_forgeCost = '{[8010305]=3,[1219]=600,[1103]=600}',},
	{q_id = 710,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8020315]=1000}}',q_forgeCost = '{[8020305]=3,[1219]=600,[1103]=600}',},
	{q_id = 711,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8000315]=1000}}',q_forgeCost = '{[8000305]=3,[1219]=600,[1103]=600}',},

	{q_id = 712,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8010325]=1000}}',q_forgeCost = '{[8010315]=3,[1219]=900,[1103]=900}',},
	{q_id = 713,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8020325]=1000}}',q_forgeCost = '{[8020315]=3,[1219]=900,[1103]=900}',},
	{q_id = 714,q_sort = 1,q_menu = 3,q_menuName = '项链',q_itemID = '{{[8000325]=1000}}',q_forgeCost = '{[8000315]=3,[1219]=900,[1103]=900}',},

	{q_id = 95,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5130205]=1000}}',q_forgeCost = '{[5030204]=3}',},
	{q_id = 96,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5120205]=1000}}',q_forgeCost = '{[5020204]=3}',},
	{q_id = 97,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5110205]=1000}}',q_forgeCost = '{[5010204]=3}',},
	{q_id = 98,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5130207]=1000}}',q_forgeCost = '{[5130205]=3}',},
	{q_id = 99,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5120207]=1000}}',q_forgeCost = '{[5120205]=3}',},
	{q_id = 100,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5110207]=1000}}',q_forgeCost = '{[5110205]=3}',},
	{q_id = 101,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5130208]=1000}}',q_forgeCost = '{[5130207]=3}',},
	{q_id = 102,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5120208]=1000}}',q_forgeCost = '{[5120207]=3}',},
	{q_id = 103,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5110208]=1000}}',q_forgeCost = '{[5110207]=3}',},
	{q_id = 800,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5110209]=1000}}',q_forgeCost = '{[5110208]=3,[1219]=100,[1103]=100}',},
	{q_id = 801,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5120209]=1000}}',q_forgeCost = '{[5120208]=3,[1219]=100,[1103]=100}',},
	{q_id = 802,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5130209]=1000}}',q_forgeCost = '{[5130208]=3,[1219]=100,[1103]=100}',},
	{q_id = 803,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5110210]=1000}}',q_forgeCost = '{[5110209]=3,[1219]=200,[1103]=200}',},
	{q_id = 804,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5120210]=1000}}',q_forgeCost = '{[5120209]=3,[1219]=200,[1103]=200}',},
	{q_id = 805,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[5130210]=1000}}',q_forgeCost = '{[5130209]=3,[1219]=200,[1103]=200}',},

	{q_id = 806,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8010205]=1000}}',q_forgeCost = '{[5110210]=3,[1219]=400,[1103]=400}',},
	{q_id = 807,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8020205]=1000}}',q_forgeCost = '{[5120210]=3,[1219]=400,[1103]=400}',},
	{q_id = 808,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8000205]=1000}}',q_forgeCost = '{[5130210]=3,[1219]=400,[1103]=400}',},

	{q_id = 809,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8010215]=1000}}',q_forgeCost = '{[8010205]=3,[1219]=600,[1103]=600}',},
	{q_id = 810,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8020215]=1000}}',q_forgeCost = '{[8020205]=3,[1219]=600,[1103]=600}',},
	{q_id = 811,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8000215]=1000}}',q_forgeCost = '{[8000205]=3,[1219]=600,[1103]=600}',},

	{q_id = 812,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8010225]=1000}}',q_forgeCost = '{[8010215]=3,[1219]=900,[1103]=900}',},
	{q_id = 813,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8020225]=1000}}',q_forgeCost = '{[8020215]=3,[1219]=900,[1103]=900}',},
	{q_id = 814,q_sort = 1,q_menu = 2,q_menuName = '戒指',q_itemID = '{{[8000225]=1000}}',q_forgeCost = '{[8000215]=3,[1219]=900,[1103]=900}',},

	{q_id = 104,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5130605]=1000}}',q_forgeCost = '{[5030604]=3}',},
	{q_id = 105,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5120605]=1000}}',q_forgeCost = '{[5020604]=3}',},
	{q_id = 106,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5110605]=1000}}',q_forgeCost = '{[5010604]=3}',},
	{q_id = 107,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5130607]=1000}}',q_forgeCost = '{[5130605]=3}',},
	{q_id = 108,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5120607]=1000}}',q_forgeCost = '{[5120605]=3}',},
	{q_id = 109,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5110607]=1000}}',q_forgeCost = '{[5110605]=3}',},
	{q_id = 110,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5130608]=1000}}',q_forgeCost = '{[5130607]=3}',},
	{q_id = 111,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5120608]=1000}}',q_forgeCost = '{[5120607]=3}',},
	{q_id = 112,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5110608]=1000}}',q_forgeCost = '{[5110607]=3}',},
	{q_id = 900,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5110609]=1000}}',q_forgeCost = '{[5110608]=3,[1219]=100,[1103]=100}',},
	{q_id = 901,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5120609]=1000}}',q_forgeCost = '{[5120608]=3,[1219]=100,[1103]=100}',},
	{q_id = 902,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5130609]=1000}}',q_forgeCost = '{[5130608]=3,[1219]=100,[1103]=100}',},
	{q_id = 903,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5110610]=1000}}',q_forgeCost = '{[5110609]=3,[1219]=200,[1103]=200}',},
	{q_id = 904,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5120610]=1000}}',q_forgeCost = '{[5120609]=3,[1219]=200,[1103]=200}',},
	{q_id = 905,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[5130610]=1000}}',q_forgeCost = '{[5130609]=3,[1219]=200,[1103]=200}',},

	{q_id = 906,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8010605]=1000}}',q_forgeCost = '{[5110610]=3,[1219]=400,[1103]=400}',},
	{q_id = 907,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8020605]=1000}}',q_forgeCost = '{[5120610]=3,[1219]=400,[1103]=400}',},
	{q_id = 908,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8000605]=1000}}',q_forgeCost = '{[5130610]=3,[1219]=400,[1103]=400}',},

	{q_id = 909,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8010615]=1000}}',q_forgeCost = '{[8010605]=3,[1219]=600,[1103]=600}',},
	{q_id = 910,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8020615]=1000}}',q_forgeCost = '{[8020605]=3,[1219]=600,[1103]=600}',},
	{q_id = 911,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8000615]=1000}}',q_forgeCost = '{[8000605]=3,[1219]=600,[1103]=600}',},

	{q_id = 912,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8010625]=1000}}',q_forgeCost = '{[8010615]=3,[1219]=900,[1103]=900}',},
	{q_id = 913,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8020625]=1000}}',q_forgeCost = '{[8020615]=3,[1219]=900,[1103]=900}',},
	{q_id = 914,q_sort = 1,q_menu = 6,q_menuName = '手镯',q_itemID = '{{[8000625]=1000}}',q_forgeCost = '{[8000615]=3,[1219]=900,[1103]=900}',},


	{q_id = 125,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5130805]=1000}}',q_forgeCost = '{[5030804]=3}',},
	{q_id = 126,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5120805]=1000}}',q_forgeCost = '{[5020804]=3}',},
	{q_id = 127,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5110805]=1000}}',q_forgeCost = '{[5010804]=3}',},
	{q_id = 128,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5130807]=1000}}',q_forgeCost = '{[5130805]=3}',},
	{q_id = 129,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5120807]=1000}}',q_forgeCost = '{[5120805]=3}',},
	{q_id = 130,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5110807]=1000}}',q_forgeCost = '{[5110805]=3}',},
	{q_id = 131,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5130808]=1000}}',q_forgeCost = '{[5130807]=3}',},
	{q_id = 132,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5120808]=1000}}',q_forgeCost = '{[5120807]=3}',},
	{q_id = 133,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5110808]=1000}}',q_forgeCost = '{[5110807]=3}',},
	{q_id = 1000,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5110809]=1000}}',q_forgeCost = '{[5110808]=3,[1219]=100,[1103]=100}',},
	{q_id = 1001,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5120809]=1000}}',q_forgeCost = '{[5120808]=3,[1219]=100,[1103]=100}',},
	{q_id = 1002,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5130809]=1000}}',q_forgeCost = '{[5130808]=3,[1219]=100,[1103]=100}',},
	{q_id = 1003,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5110810]=1000}}',q_forgeCost = '{[5110809]=3,[1219]=200,[1103]=200}',},
	{q_id = 1004,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5120810]=1000}}',q_forgeCost = '{[5120809]=3,[1219]=200,[1103]=200}',},
	{q_id = 1005,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[5130810]=1000}}',q_forgeCost = '{[5130809]=3,[1219]=200,[1103]=200}',},

	{q_id = 1006,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8010805]=1000}}',q_forgeCost = '{[5110810]=3,[1219]=400,[1103]=400}',},
	{q_id = 1007,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8020805]=1000}}',q_forgeCost = '{[5120810]=3,[1219]=400,[1103]=400}',},
	{q_id = 1008,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8000805]=1000}}',q_forgeCost = '{[5130810]=3,[1219]=400,[1103]=400}',},

	{q_id = 1009,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8010815]=1000}}',q_forgeCost = '{[8010805]=3,[1219]=600,[1103]=600}',},
	{q_id = 1010,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8020815]=1000}}',q_forgeCost = '{[8020805]=3,[1219]=600,[1103]=600}',},
	{q_id = 1011,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8000815]=1000}}',q_forgeCost = '{[8000805]=3,[1219]=600,[1103]=600}',},

	{q_id = 1012,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8010825]=1000}}',q_forgeCost = '{[8010815]=3,[1219]=900,[1103]=900}',},
	{q_id = 1013,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8020825]=1000}}',q_forgeCost = '{[8020815]=3,[1219]=900,[1103]=900}',},
	{q_id = 1014,q_sort = 1,q_menu = 8,q_menuName = '腰带',q_itemID = '{{[8000825]=1000}}',q_forgeCost = '{[8000815]=3,[1219]=900,[1103]=900}',},


	{q_id = 146,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5130405]=1000}}',q_forgeCost = '{[5030404]=3}',},
	{q_id = 147,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5120405]=1000}}',q_forgeCost = '{[5020404]=3}',},
	{q_id = 148,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5110405]=1000}}',q_forgeCost = '{[5010404]=3}',},
	{q_id = 149,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5130407]=1000}}',q_forgeCost = '{[5130405]=3}',},
	{q_id = 150,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5120407]=1000}}',q_forgeCost = '{[5120405]=3}',},
	{q_id = 151,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5110407]=1000}}',q_forgeCost = '{[5110405]=3}',},
	{q_id = 152,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5130408]=1000}}',q_forgeCost = '{[5130407]=3}',},
	{q_id = 153,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5120408]=1000}}',q_forgeCost = '{[5120407]=3}',},
	{q_id = 154,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5110408]=1000}}',q_forgeCost = '{[5110407]=3}',},
	{q_id = 1100,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5110409]=1000}}',q_forgeCost = '{[5110408]=3,[1219]=100,[1103]=100}',},
	{q_id = 1101,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5120409]=1000}}',q_forgeCost = '{[5120408]=3,[1219]=100,[1103]=100}',},
	{q_id = 1102,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5130409]=1000}}',q_forgeCost = '{[5130408]=3,[1219]=100,[1103]=100}',},
	{q_id = 1103,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5110410]=1000}}',q_forgeCost = '{[5110409]=3,[1219]=200,[1103]=200}',},
	{q_id = 1104,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5120410]=1000}}',q_forgeCost = '{[5120409]=3,[1219]=200,[1103]=200}',},
	{q_id = 1105,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[5130410]=1000}}',q_forgeCost = '{[5130409]=3,[1219]=200,[1103]=200}',},

	{q_id = 1106,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8010405]=1000}}',q_forgeCost = '{[5110410]=3,[1219]=400,[1103]=400}',},
	{q_id = 1107,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8020405]=1000}}',q_forgeCost = '{[5120410]=3,[1219]=400,[1103]=400}',},
	{q_id = 1108,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8000405]=1000}}',q_forgeCost = '{[5130410]=3,[1219]=400,[1103]=400}',},

	{q_id = 1109,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8010415]=1000}}',q_forgeCost = '{[8010405]=3,[1219]=600,[1103]=600}',},
	{q_id = 1110,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8020415]=1000}}',q_forgeCost = '{[8020405]=3,[1219]=600,[1103]=600}',},
	{q_id = 1111,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8000415]=1000}}',q_forgeCost = '{[8000405]=3,[1219]=600,[1103]=600}',},

	{q_id = 1112,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8010425]=1000}}',q_forgeCost = '{[8010415]=3,[1219]=900,[1103]=900}',},
	{q_id = 1113,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8020425]=1000}}',q_forgeCost = '{[8020415]=3,[1219]=900,[1103]=900}',},
	{q_id = 1114,q_sort = 1,q_menu = 4,q_menuName = '靴子',q_itemID = '{{[8000425]=1000}}',q_forgeCost = '{[8000415]=3,[1219]=900,[1103]=900}',},


	{q_id = 155,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1302]=1000}}',q_forgeCost = '{[1301]=2}',},
	{q_id = 156,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1303]=1000}}',q_forgeCost = '{[1302]=2}',},
	{q_id = 157,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1304]=1000}}',q_forgeCost = '{[1303]=2}',},
	{q_id = 158,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1305]=1000}}',q_forgeCost = '{[1304]=2}',},
	{q_id = 159,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1306]=1000}}',q_forgeCost = '{[1305]=2}',},
	{q_id = 160,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1307]=1000}}',q_forgeCost = '{[1306]=2}',},
	{q_id = 161,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1308]=1000}}',q_forgeCost = '{[1307]=2}',},
	{q_id = 162,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1309]=1000}}',q_forgeCost = '{[1308]=2}',},
	{q_id = 163,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1310]=1000}}',q_forgeCost = '{[1309]=2}',},
	{q_id = 164,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1404]=1000}}',q_forgeCost = '{[1403]=2}',},
	{q_id = 165,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1405]=1000}}',q_forgeCost = '{[1404]=2}',},
	{q_id = 166,q_sort = 2,q_menu = 9,q_menuName = '矿石',q_itemID = '{{[1406]=1000}}',q_forgeCost = '{[1405]=2}',},

	{q_id = 167,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200008]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 168,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200010]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 169,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200009]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 170,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6009]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 171,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200014]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 172,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200015]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 173,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200016]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 174,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6007]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 175,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200021]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 176,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200022]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 177,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200023]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 178,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6008]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 179,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200088]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 180,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200065]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 181,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200066]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 182,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200064]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 183,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200089]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 184,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200075]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 185,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200076]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 186,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200074]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 187,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200090]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 188,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200086]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 189,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200087]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},
	{q_id = 190,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[6200085]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=100000}',},


	{q_id = 191,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1419]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 192,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1420]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 193,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1421]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 194,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1422]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},

	{q_id = 300,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1423]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 301,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1424]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 302,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1425]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 303,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1426]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},

	{q_id = 304,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1427]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 305,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1428]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 306,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1429]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 307,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1430]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},

	{q_id = 308,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1431]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 309,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1432]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 310,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1433]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 311,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1434]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},

	{q_id = 312,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1435]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 313,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1436]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 314,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1437]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},
	{q_id = 315,q_sort = 2,q_menu = 7,q_menuName = '技能',q_itemID = '{{[1438]=1000}}',q_forgeCost = '{[17000010]=30,[999998]=500000}',},




	{q_id = 429,q_sort = 2,q_menu = 11,q_menuName = '战旗',q_itemID = '{{[18100001]=1000}}',q_forgeCost = '{[17000001]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 11,q_menuName = '战旗',q_itemID = '{{[18100002]=1000}}',q_forgeCost = '{[18100001]=1,[17000001]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 11,q_menuName = '战旗',q_itemID = '{{[18100003]=1000}}',q_forgeCost = '{[18100002]=1,[17000001]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 11,q_menuName = '战旗',q_itemID = '{{[18100004]=1000}}',q_forgeCost = '{[18100003]=1,[17000001]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 11,q_menuName = '战旗',q_itemID = '{{[18100005]=1000}}',q_forgeCost = '{[18100004]=1,[17000001]=100}',},

	{q_id = 429,q_sort = 2,q_menu = 12,q_menuName = '盾牌',q_itemID = '{{[18800001]=1000}}',q_forgeCost = '{[17000002]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 12,q_menuName = '盾牌',q_itemID = '{{[18800002]=1000}}',q_forgeCost = '{[18800001]=1,[17000002]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 12,q_menuName = '盾牌',q_itemID = '{{[18800003]=1000}}',q_forgeCost = '{[18800002]=1,[17000002]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 12,q_menuName = '盾牌',q_itemID = '{{[18800004]=1000}}',q_forgeCost = '{[18800003]=1,[17000002]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 12,q_menuName = '盾牌',q_itemID = '{{[18800005]=1000}}',q_forgeCost = '{[18800004]=1,[17000002]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 12,q_menuName = '盾牌',q_itemID = '{{[18800006]=1000}}',q_forgeCost = '{[18800005]=1,[17000002]=100}',},

	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400001]=1000}}',q_forgeCost = '{[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400002]=1000}}',q_forgeCost = '{[18400001]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400003]=1000}}',q_forgeCost = '{[18400002]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400004]=1000}}',q_forgeCost = '{[18400003]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400005]=1000}}',q_forgeCost = '{[18400004]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400006]=1000}}',q_forgeCost = '{[18400005]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400007]=1000}}',q_forgeCost = '{[18400006]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400008]=1000}}',q_forgeCost = '{[18400007]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400009]=1000}}',q_forgeCost = '{[18400008]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400010]=1000}}',q_forgeCost = '{[18400009]=1,[17000003]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 13,q_menuName = '宝石',q_itemID = '{{[18400011]=1000}}',q_forgeCost = '{[18400010]=1,[17000003]=100}',},

	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900001]=1000}}',q_forgeCost = '{[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900002]=1000}}',q_forgeCost = '{[18900001]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900003]=1000}}',q_forgeCost = '{[18900002]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900004]=1000}}',q_forgeCost = '{[18900003]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900005]=1000}}',q_forgeCost = '{[18900004]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900006]=1000}}',q_forgeCost = '{[18900005]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900007]=1000}}',q_forgeCost = '{[18900006]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900008]=1000}}',q_forgeCost = '{[18900007]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900009]=1000}}',q_forgeCost = '{[18900008]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900010]=1000}}',q_forgeCost = '{[18900009]=1,[17000004]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 14,q_menuName = '特戒',q_itemID = '{{[18900011]=1000}}',q_forgeCost = '{[18900010]=1,[17000004]=100}',},


	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600001]=1000}}',q_forgeCost = '{[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600002]=1000}}',q_forgeCost = '{[18600001]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600003]=1000}}',q_forgeCost = '{[18600002]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600004]=1000}}',q_forgeCost = '{[18600003]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600005]=1000}}',q_forgeCost = '{[18600004]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600006]=1000}}',q_forgeCost = '{[18600005]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600007]=1000}}',q_forgeCost = '{[18600006]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600008]=1000}}',q_forgeCost = '{[18600007]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600009]=1000}}',q_forgeCost = '{[18600008]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600010]=1000}}',q_forgeCost = '{[18600009]=1,[17000005]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 15,q_menuName = '官印',q_itemID = '{{[18600011]=1000}}',q_forgeCost = '{[18600010]=1,[17000005]=100}',},

	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700001]=1000}}',q_forgeCost = '{[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700002]=1000}}',q_forgeCost = '{[18700001]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700003]=1000}}',q_forgeCost = '{[18700002]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700004]=1000}}',q_forgeCost = '{[18700003]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700005]=1000}}',q_forgeCost = '{[18700004]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700006]=1000}}',q_forgeCost = '{[18700005]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700007]=1000}}',q_forgeCost = '{[18700006]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700008]=1000}}',q_forgeCost = '{[18700007]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700009]=1000}}',q_forgeCost = '{[18700008]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700010]=1000}}',q_forgeCost = '{[18700009]=1,[17000007]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 16,q_menuName = '玉佩',q_itemID = '{{[18700011]=1000}}',q_forgeCost = '{[18700010]=1,[17000007]=100}',},


	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500001]=1000}}',q_forgeCost = '{[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500002]=1000}}',q_forgeCost = '{[18500001]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500003]=1000}}',q_forgeCost = '{[18500002]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500004]=1000}}',q_forgeCost = '{[18500003]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500005]=1000}}',q_forgeCost = '{[18500004]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500006]=1000}}',q_forgeCost = '{[18500005]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500007]=1000}}',q_forgeCost = '{[18500006]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500008]=1000}}',q_forgeCost = '{[18500007]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500009]=1000}}',q_forgeCost = '{[18500008]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500010]=1000}}',q_forgeCost = '{[18500009]=1,[17000006]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 17,q_menuName = '灵珠',q_itemID = '{{[18500011]=1000}}',q_forgeCost = '{[18500010]=1,[17000006]=100}',},


	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200001]=1000}}',q_forgeCost = '{[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200002]=1000}}',q_forgeCost = '{[18200001]=1,[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200003]=1000}}',q_forgeCost = '{[18200002]=1,[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200004]=1000}}',q_forgeCost = '{[18200003]=1,[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200005]=1000}}',q_forgeCost = '{[18200004]=1,[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200006]=1000}}',q_forgeCost = '{[18200005]=1,[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200007]=1000}}',q_forgeCost = '{[18200006]=1,[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200008]=1000}}',q_forgeCost = '{[18200007]=1,[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200009]=1000}}',q_forgeCost = '{[18200008]=1,[17000008]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 18,q_menuName = '法宝',q_itemID = '{{[18200010]=1000}}',q_forgeCost = '{[18200009]=1,[17000008]=100}',},
	

	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300001]=1000}}',q_forgeCost = '{[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300002]=1000}}',q_forgeCost = '{[18300001]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300003]=1000}}',q_forgeCost = '{[18300002]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300004]=1000}}',q_forgeCost = '{[18300003]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300005]=1000}}',q_forgeCost = '{[18300004]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300006]=1000}}',q_forgeCost = '{[18300005]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300007]=1000}}',q_forgeCost = '{[18300006]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300008]=1000}}',q_forgeCost = '{[18300007]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300009]=1000}}',q_forgeCost = '{[18300008]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300010]=1000}}',q_forgeCost = '{[18300009]=1,[17000009]=100}',},
	{q_id = 429,q_sort = 2,q_menu = 19,q_menuName = '法阵',q_itemID = '{{[18300011]=1000}}',q_forgeCost = '{[18300010]=1,[17000009]=100}',},




};

local n = 1
for n = 1,#Items do
Items[n].q_id = n
end

return Items

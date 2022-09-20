local Items = {
	{q_id = 1601,q_suitID = 1001,q_job = 1,q_activeType = 0,q_tenacity = 6,q_battle = 60,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 1,q_activeType = 0,q_max_hp = 660,q_battle = 231.00000000,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 1,q_activeType = 0,q_attack_min = 12,q_attack_max = 18,q_battle = 90,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 1,q_activeType = 0,q_tenacity = 12,q_battle = 120,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 1,q_activeType = 0,q_max_hp = 1200,q_battle = 420,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 1,q_activeType = 0,q_attack_min = 18,q_attack_max = 28,q_battle = 138,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 1,q_activeType = 0,q_tenacity = 19,q_battle = 190,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 1,q_activeType = 0,q_max_hp = 2000,q_battle = 700,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 1,q_activeType = 0,q_attack_min = 26,q_attack_max = 40,q_battle = 198,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1601,q_suitID = 1001,q_job = 1,q_activeType = 2,q_tenacity = 12,q_battle = 120,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 1,q_activeType = 2,q_max_hp = 1000,q_battle = 350,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 1,q_activeType = 2,q_attack_min = 23,q_attack_max = 37,q_battle = 180,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 1,q_activeType = 2,q_tenacity = 21,q_battle = 210,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 1,q_activeType = 2,q_max_hp = 1800,q_battle = 630,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 1,q_activeType = 2,q_attack_min = 36,q_attack_max = 58,q_battle = 282,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 1,q_activeType = 2,q_tenacity = 34,q_battle = 340,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 1,q_activeType = 2,q_max_hp = 3000,q_battle = 1050,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 1,q_activeType = 2,q_attack_min = 52,q_attack_max = 84,q_battle = 408,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1601,q_suitID = 1001,q_job = 1,q_activeType = 1,q_tenacity = 18,q_battle = 180,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 1,q_activeType = 1,q_max_hp = 1660,q_battle = 581,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 1,q_activeType = 1,q_attack_min = 35,q_attack_max = 55,q_battle = 270,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 1,q_activeType = 1,q_tenacity = 33,q_battle = 330,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 1,q_activeType = 1,q_max_hp = 3000,q_battle = 1050,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 1,q_activeType = 1,q_attack_min = 54,q_attack_max = 86,q_battle = 420,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 1,q_activeType = 1,q_tenacity = 53,q_battle = 530,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 1,q_activeType = 1,q_max_hp = 5000,q_battle = 1750,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 1,q_activeType = 1,q_attack_min = 78,q_attack_max = 124,q_battle = 606,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1001,q_suitID = 1001,q_job = 1,q_activeType = 3,q_attack_min = 12,q_attack_max = 16,q_battle = 84,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1002,q_suitID = 1002,q_job = 1,q_activeType = 3,q_attack_min = 18,q_attack_max = 24,q_tenacity = 23,q_battle = 356,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1003,q_suitID = 1003,q_job = 1,q_activeType = 3,q_attack_min = 26,q_attack_max = 36,q_crit = 30,q_battle = 486,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1601,q_suitID = 1001,q_job = 2,q_activeType = 0,q_tenacity = 6,q_battle = 60,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 2,q_activeType = 0,q_max_hp = 340,q_battle = 231.00000000,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 2,q_activeType = 0,q_magic_attack_min = 12,q_magic_attack_max = 18,q_battle = 90,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 2,q_activeType = 0,q_tenacity = 12,q_battle = 120,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 2,q_activeType = 0,q_max_hp = 600,q_battle = 420,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 2,q_activeType = 0,q_magic_attack_min = 18,q_magic_attack_max = 28,q_battle = 138,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 2,q_activeType = 0,q_tenacity = 19,q_battle = 190,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 2,q_activeType = 0,q_max_hp = 1000,q_battle = 700,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 2,q_activeType = 0,q_magic_attack_min = 26,q_magic_attack_max = 40,q_battle = 198,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1601,q_suitID = 1001,q_job = 2,q_activeType = 2,q_tenacity = 12,q_battle = 120,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 2,q_activeType = 2,q_max_hp = 500,q_battle = 350,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 2,q_activeType = 2,q_magic_attack_min = 23,q_magic_attack_max = 37,q_battle = 180,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 2,q_activeType = 2,q_tenacity = 21,q_battle = 210,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 2,q_activeType = 2,q_max_hp = 900,q_battle = 630,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 2,q_activeType = 2,q_magic_attack_min = 36,q_magic_attack_max = 58,q_battle = 282,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 2,q_activeType = 2,q_tenacity = 34,q_battle = 340,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 2,q_activeType = 2,q_max_hp = 1500,q_battle = 1050,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 2,q_activeType = 2,q_magic_attack_min = 52,q_magic_attack_max = 84,q_battle = 408,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1601,q_suitID = 1001,q_job = 2,q_activeType = 1,q_tenacity = 18,q_battle = 180,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 2,q_activeType = 1,q_max_hp = 840,q_battle = 581,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 2,q_activeType = 1,q_magic_attack_min = 35,q_magic_attack_max = 55,q_battle = 270,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 2,q_activeType = 1,q_tenacity = 33,q_battle = 330,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 2,q_activeType = 1,q_max_hp = 1500,q_battle = 1050,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 2,q_activeType = 1,q_magic_attack_min = 54,q_magic_attack_max = 86,q_battle = 420,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 2,q_activeType = 1,q_tenacity = 53,q_battle = 530,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 2,q_activeType = 1,q_max_hp = 2500,q_battle = 1750,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 2,q_activeType = 1,q_magic_attack_min = 78,q_magic_attack_max = 124,q_battle = 606,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1001,q_suitID = 1001,q_job = 2,q_activeType = 3,q_magic_attack_min = 12,q_magic_attack_max = 16,q_battle = 84,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1002,q_suitID = 1002,q_job = 2,q_activeType = 3,q_magic_attack_min = 18,q_magic_attack_max = 24,q_tenacity = 23,q_battle = 356,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1003,q_suitID = 1003,q_job = 2,q_activeType = 3,q_magic_attack_min = 26,q_magic_attack_max = 36,q_crit = 30,q_battle = 486,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1601,q_suitID = 1001,q_job = 3,q_activeType = 0,q_tenacity = 6,q_battle = 60,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 3,q_activeType = 0,q_max_hp = 460,q_battle = 231.00000000,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 3,q_activeType = 0,q_sc_attack_min = 12,q_sc_attack_max = 18,q_battle = 90,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 3,q_activeType = 0,q_tenacity = 12,q_battle = 120,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 3,q_activeType = 0,q_max_hp = 840,q_battle = 420,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 3,q_activeType = 0,q_sc_attack_min = 18,q_sc_attack_max = 28,q_battle = 138,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 3,q_activeType = 0,q_tenacity = 19,q_battle = 190,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 3,q_activeType = 0,q_max_hp = 1400,q_battle = 700,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 3,q_activeType = 0,q_sc_attack_min = 26,q_sc_attack_max = 40,q_battle = 198,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1601,q_suitID = 1001,q_job = 3,q_activeType = 2,q_tenacity = 12,q_battle = 120,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 3,q_activeType = 2,q_max_hp = 700,q_battle = 350,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 3,q_activeType = 2,q_sc_attack_min = 23,q_sc_attack_max = 37,q_battle = 180,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 3,q_activeType = 2,q_tenacity = 21,q_battle = 210,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 3,q_activeType = 2,q_max_hp = 1260,q_battle = 630,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 3,q_activeType = 2,q_sc_attack_min = 36,q_sc_attack_max = 58,q_battle = 282,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 3,q_activeType = 2,q_tenacity = 34,q_battle = 340,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 3,q_activeType = 2,q_max_hp = 2100,q_battle = 1050,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 3,q_activeType = 2,q_sc_attack_min = 52,q_sc_attack_max = 84,q_battle = 408,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1601,q_suitID = 1001,q_job = 3,q_activeType = 1,q_tenacity = 18,q_battle = 180,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1602,q_suitID = 1001,q_job = 3,q_activeType = 1,q_max_hp = 1160,q_battle = 581,q_decomposeNum = 150,q_activeNum = 750,},
	{q_id = 1603,q_suitID = 1001,q_job = 3,q_activeType = 1,q_sc_attack_min = 35,q_sc_attack_max = 55,q_battle = 270,q_decomposeNum = 200,q_activeNum = 1000,},
	{q_id = 1604,q_suitID = 1002,q_job = 3,q_activeType = 1,q_tenacity = 33,q_battle = 330,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1605,q_suitID = 1002,q_job = 3,q_activeType = 1,q_max_hp = 2100,q_battle = 1050,q_decomposeNum = 270,q_activeNum = 1350,},
	{q_id = 1606,q_suitID = 1002,q_job = 3,q_activeType = 1,q_sc_attack_min = 54,q_sc_attack_max = 86,q_battle = 420,q_decomposeNum = 360,q_activeNum = 1800,},
	{q_id = 1607,q_suitID = 1003,q_job = 3,q_activeType = 1,q_tenacity = 53,q_battle = 530,q_decomposeNum = 300,q_activeNum = 1500,},
	{q_id = 1608,q_suitID = 1003,q_job = 3,q_activeType = 1,q_max_hp = 3500,q_battle = 1750,q_decomposeNum = 450,q_activeNum = 2250,},
	{q_id = 1609,q_suitID = 1003,q_job = 3,q_activeType = 1,q_sc_attack_min = 78,q_sc_attack_max = 124,q_battle = 606,q_decomposeNum = 600,q_activeNum = 3000,},
	{q_id = 1001,q_suitID = 1001,q_job = 3,q_activeType = 3,q_sc_attack_min = 12,q_sc_attack_max = 16,q_battle = 84,q_decomposeNum = 100,q_activeNum = 500,},
	{q_id = 1002,q_suitID = 1002,q_job = 3,q_activeType = 3,q_sc_attack_min = 18,q_sc_attack_max = 24,q_tenacity = 23,q_battle = 356,q_decomposeNum = 180,q_activeNum = 900,},
	{q_id = 1003,q_suitID = 1003,q_job = 3,q_activeType = 3,q_sc_attack_min = 26,q_sc_attack_max = 36,q_crit = 30,q_battle = 486,q_decomposeNum = 300,q_activeNum = 1500,},
};
return Items
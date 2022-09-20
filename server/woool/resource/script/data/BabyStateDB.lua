local Items=
{
  {q_ID=1.0,q_nextID=2.0,q_level=1.0,q_name='筑基',q_needPeriodLevel=1.0,q_needPoint='{[10000]=10}',q_school=1.0,q_needMoney=1500000.0,q_needLevel=52.0,q_materialID='{[1104]=60}',q_max_hp=337.0,q_attack_min=75.0,q_attack_max=150.0,q_defence_min=29.0,q_defence_max=57.0,q_magic_defence_min=16.0,q_magic_defence_max=32.0,},
  {q_ID=2.0,q_nextID=3.0,q_level=2.0,q_name='旋照',q_needPeriodLevel=1.0,q_needPoint='{[10000]=20}',q_school=1.0,q_needMoney=1800000.0,q_needLevel=53.0,q_materialID='{[1104]=105}',q_max_hp=590.0,q_attack_min=131.0,q_attack_max=262.0,q_defence_min=50.0,q_defence_max=100.0,q_magic_defence_min=28.0,q_magic_defence_max=56.0,},
  {q_ID=3.0,q_nextID=4.0,q_level=3.0,q_name='开光',q_needPeriodLevel=2.0,q_needPoint='{[10000]=30}',q_school=1.0,q_needMoney=1900000.0,q_needLevel=54.0,q_materialID='{[1104]=180}',q_max_hp=1003.0,q_attack_min=223.0,q_attack_max=446.0,q_defence_min=85.0,q_defence_max=171.0,q_magic_defence_min=47.0,q_magic_defence_max=95.0,},
  {q_ID=4.0,q_nextID=5.0,q_level=4.0,q_name='融合',q_needPeriodLevel=2.0,q_needPoint='{[20000]=15}',q_school=1.0,q_needMoney=2400000.0,q_needLevel=55.0,q_materialID='{[1104]=295}',q_max_hp=1654.0,q_attack_min=368.0,q_attack_max=735.0,q_defence_min=141.0,q_defence_max=282.0,q_magic_defence_min=78.0,q_magic_defence_max=156.0,},
  {q_ID=5.0,q_nextID=6.0,q_level=5.0,q_name='金丹',q_needPeriodLevel=2.0,q_needPoint='{[20000]=25}',q_school=1.0,q_needMoney=3000000.0,q_needLevel=56.0,q_materialID='{[1104]=474}',q_max_hp=2647.0,q_attack_min=588.0,q_attack_max=1176.0,q_defence_min=225.0,q_defence_max=451.0,q_magic_defence_min=125.0,q_magic_defence_max=250.0,},
  {q_ID=6.0,q_nextID=7.0,q_level=6.0,q_name='心动',q_needPeriodLevel=3.0,q_needPoint='{[20000]=35}',q_school=1.0,q_needMoney=3500000.0,q_needLevel=57.0,q_materialID='{[1104]=707}',q_max_hp=3970.0,q_attack_min=882.0,q_attack_max=1765.0,q_defence_min=338.0,q_defence_max=676.0,q_magic_defence_min=187.0,q_magic_defence_max=375.0,},
  {q_ID=7.0,q_nextID=8.0,q_level=7.0,q_name='灵寂',q_needPeriodLevel=3.0,q_needPoint='{[30000]=20}',q_school=1.0,q_needMoney=4000000.0,q_needLevel=58.0,q_materialID='{[1104]=1024}',q_max_hp=5757.0,q_attack_min=1279.0,q_attack_max=2559.0,q_defence_min=490.0,q_defence_max=981.0,q_magic_defence_min=272.0,q_magic_defence_max=544.0,},
  {q_ID=8.0,q_nextID=9.0,q_level=8.0,q_name='元婴',q_needPeriodLevel=3.0,q_needPoint='{[30000]=30}',q_school=1.0,q_needMoney=4500000.0,q_needLevel=59.0,q_materialID='{[1104]=1431}',q_max_hp=8059.0,q_attack_min=1791.0,q_attack_max=3582.0,q_defence_min=687.0,q_defence_max=1373.0,q_magic_defence_min=381.0,q_magic_defence_max=761.0,},
  {q_ID=9.0,q_nextID=10.0,q_level=9.0,q_name='化婴',q_needPeriodLevel=4.0,q_needPoint='{[30000]=40}',q_school=1.0,q_needMoney=5000000.0,q_needLevel=60.0,q_materialID='{[1104]=1940}',q_max_hp=10880.0,q_attack_min=2418.0,q_attack_max=4836.0,q_defence_min=927.0,q_defence_max=1854.0,q_magic_defence_min=514.0,q_magic_defence_max=1028.0,},
  {q_ID=10.0,q_nextID=11.0,q_level=10.0,q_name='出窍',q_needPeriodLevel=4.0,q_needPoint='{[40000]=30}',q_school=1.0,q_needMoney=5600000.0,q_needLevel=61.0,q_materialID='{[1104]=2519}',q_max_hp=14144.0,q_attack_min=3143.0,q_attack_max=6286.0,q_defence_min=1205.0,q_defence_max=2410.0,q_magic_defence_min=668.0,q_magic_defence_max=1336.0,},
  {q_ID=11.0,q_nextID=12.0,q_level=11.0,q_name='分神',q_needPeriodLevel=4.0,q_needPoint='{[40000]=40}',q_school=1.0,q_needMoney=6000000.0,q_needLevel=62.0,q_materialID='{[1104]=3144}',q_max_hp=17680.0,q_attack_min=3929.0,q_attack_max=7858.0,q_defence_min=1506.0,q_defence_max=3012.0,q_magic_defence_min=835.0,q_magic_defence_max=1670.0,},
  {q_ID=12.0,q_nextID=13.0,q_level=12.0,q_name='合体',q_needPeriodLevel=5.0,q_needPoint='{[40000]=50}',q_school=1.0,q_needMoney=6600000.0,q_needLevel=63.0,q_materialID='{[1104]=3809}',q_max_hp=21393.0,q_attack_min=4754.0,q_attack_max=9508.0,q_defence_min=1822.0,q_defence_max=3645.0,q_magic_defence_min=1010.0,q_magic_defence_max=2020.0,},
  {q_ID=13.0,q_nextID=14.0,q_level=13.0,q_name='大乘',q_needPeriodLevel=5.0,q_needPoint='{[50000]=50}',q_school=1.0,q_needMoney=7000000.0,q_needLevel=64.0,q_materialID='{[1104]=4424}',q_max_hp=24816.0,q_attack_min=5515.0,q_attack_max=11029.0,q_defence_min=2114.0,q_defence_max=4228.0,q_magic_defence_min=1172.0,q_magic_defence_max=2344.0,},
  {q_ID=14.0,q_nextID=15.0,q_level=14.0,q_name='渡劫',q_needPeriodLevel=5.0,q_needPoint='{[50000]=60}',q_school=1.0,q_needMoney=7500000.0,q_needLevel=65.0,q_materialID='{[1104]=5040}',q_max_hp=28290.0,q_attack_min=6287.0,q_attack_max=12573.0,q_defence_min=2410.0,q_defence_max=4820.0,q_magic_defence_min=1336.0,q_magic_defence_max=2672.0,},
  {q_ID=15.0,q_nextID=0.0,q_level=15.0,q_name='飞升',q_needPeriodLevel=0.0,q_school=1.0,q_max_hp=31968.0,q_attack_min=7104.0,q_attack_max=14208.0,q_defence_min=2723.0,q_defence_max=5446.0,q_magic_defence_min=1510.0,q_magic_defence_max=3019.0,},
  {q_ID=101.0,q_nextID=102.0,q_level=1.0,q_name='筑基',q_needPeriodLevel=1.0,q_needPoint='{[10000]=10}',q_school=2.0,q_needMoney=1500000.0,q_needLevel=52.0,q_materialID='{[1104]=60}',q_max_hp=135.0,q_magic_attack_min='75',q_magic_attack_max='150',q_defence_min=22.0,q_defence_max=45.0,q_magic_defence_min=30.0,q_magic_defence_max=60.0,},
  {q_ID=102.0,q_nextID=103.0,q_level=2.0,q_name='旋照',q_needPeriodLevel=1.0,q_needPoint='{[10000]=20}',q_school=2.0,q_needMoney=1800000.0,q_needLevel=53.0,q_materialID='{[1104]=105}',q_max_hp=236.0,q_magic_attack_min='131',q_magic_attack_max='262',q_defence_min=39.0,q_defence_max=79.0,q_magic_defence_min=52.0,q_magic_defence_max=105.0,},
  {q_ID=103.0,q_nextID=104.0,q_level=3.0,q_name='开光',q_needPeriodLevel=2.0,q_needPoint='{[10000]=30}',q_school=2.0,q_needMoney=1900000.0,q_needLevel=54.0,q_materialID='{[1104]=180}',q_max_hp=401.0,q_magic_attack_min='223',q_magic_attack_max='446',q_defence_min=67.0,q_defence_max=134.0,q_magic_defence_min=89.0,q_magic_defence_max=178.0,},
  {q_ID=104.0,q_nextID=105.0,q_level=4.0,q_name='融合',q_needPeriodLevel=2.0,q_needPoint='{[20000]=15}',q_school=2.0,q_needMoney=2400000.0,q_needLevel=55.0,q_materialID='{[1104]=295}',q_max_hp=662.0,q_magic_attack_min='368',q_magic_attack_max='735',q_defence_min=110.0,q_defence_max=221.0,q_magic_defence_min=147.0,q_magic_defence_max=294.0,},
  {q_ID=105.0,q_nextID=106.0,q_level=5.0,q_name='金丹',q_needPeriodLevel=2.0,q_needPoint='{[20000]=25}',q_school=2.0,q_needMoney=3000000.0,q_needLevel=56.0,q_materialID='{[1104]=474}',q_max_hp=1059.0,q_magic_attack_min='588',q_magic_attack_max='1176',q_defence_min=176.0,q_defence_max=353.0,q_magic_defence_min=235.0,q_magic_defence_max=471.0,},
  {q_ID=106.0,q_nextID=107.0,q_level=6.0,q_name='心动',q_needPeriodLevel=3.0,q_needPoint='{[20000]=35}',q_school=2.0,q_needMoney=3500000.0,q_needLevel=57.0,q_materialID='{[1104]=707}',q_max_hp=1588.0,q_magic_attack_min='882',q_magic_attack_max='1765',q_defence_min=265.0,q_defence_max=529.0,q_magic_defence_min=353.0,q_magic_defence_max=706.0,},
  {q_ID=107.0,q_nextID=108.0,q_level=7.0,q_name='灵寂',q_needPeriodLevel=3.0,q_needPoint='{[30000]=20}',q_school=2.0,q_needMoney=4000000.0,q_needLevel=58.0,q_materialID='{[1104]=1024}',q_max_hp=2303.0,q_magic_attack_min='1279',q_magic_attack_max='2559',q_defence_min=384.0,q_defence_max=768.0,q_magic_defence_min=512.0,q_magic_defence_max=1023.0,},
  {q_ID=108.0,q_nextID=109.0,q_level=8.0,q_name='元婴',q_needPeriodLevel=3.0,q_needPoint='{[30000]=30}',q_school=2.0,q_needMoney=4500000.0,q_needLevel=59.0,q_materialID='{[1104]=1431}',q_max_hp=3224.0,q_magic_attack_min='1791',q_magic_attack_max='3582',q_defence_min=537.0,q_defence_max=1075.0,q_magic_defence_min=716.0,q_magic_defence_max=1433.0,},
  {q_ID=109.0,q_nextID=110.0,q_level=9.0,q_name='化婴',q_needPeriodLevel=4.0,q_needPoint='{[30000]=40}',q_school=2.0,q_needMoney=5000000.0,q_needLevel=60.0,q_materialID='{[1104]=1940}',q_max_hp=4352.0,q_magic_attack_min='2418',q_magic_attack_max='4836',q_defence_min=725.0,q_defence_max=1451.0,q_magic_defence_min=967.0,q_magic_defence_max=1934.0,},
  {q_ID=110.0,q_nextID=111.0,q_level=10.0,q_name='出窍',q_needPeriodLevel=4.0,q_needPoint='{[40000]=30}',q_school=2.0,q_needMoney=5600000.0,q_needLevel=61.0,q_materialID='{[1104]=2519}',q_max_hp=5658.0,q_magic_attack_min='3143',q_magic_attack_max='6286',q_defence_min=943.0,q_defence_max=1886.0,q_magic_defence_min=1257.0,q_magic_defence_max=2515.0,},
  {q_ID=111.0,q_nextID=112.0,q_level=11.0,q_name='分神',q_needPeriodLevel=4.0,q_needPoint='{[40000]=40}',q_school=2.0,q_needMoney=6000000.0,q_needLevel=62.0,q_materialID='{[1104]=3144}',q_max_hp=7072.0,q_magic_attack_min='3929',q_magic_attack_max='7858',q_defence_min=1179.0,q_defence_max=2357.0,q_magic_defence_min=1572.0,q_magic_defence_max=3143.0,},
  {q_ID=112.0,q_nextID=113.0,q_level=12.0,q_name='合体',q_needPeriodLevel=5.0,q_needPoint='{[40000]=50}',q_school=2.0,q_needMoney=6600000.0,q_needLevel=63.0,q_materialID='{[1104]=3809}',q_max_hp=8557.0,q_magic_attack_min='4754',q_magic_attack_max='9508',q_defence_min=1426.0,q_defence_max=2852.0,q_magic_defence_min=1902.0,q_magic_defence_max=3803.0,},
  {q_ID=113.0,q_nextID=114.0,q_level=13.0,q_name='大乘',q_needPeriodLevel=5.0,q_needPoint='{[50000]=50}',q_school=2.0,q_needMoney=7000000.0,q_needLevel=64.0,q_materialID='{[1104]=4424}',q_max_hp=9926.0,q_magic_attack_min='5515',q_magic_attack_max='11029',q_defence_min=1654.0,q_defence_max=3309.0,q_magic_defence_min=2206.0,q_magic_defence_max=4412.0,},
  {q_ID=114.0,q_nextID=115.0,q_level=14.0,q_name='渡劫',q_needPeriodLevel=5.0,q_needPoint='{[50000]=60}',q_school=2.0,q_needMoney=7500000.0,q_needLevel=65.0,q_materialID='{[1104]=5040}',q_max_hp=11316.0,q_magic_attack_min='6287',q_magic_attack_max='12573',q_defence_min=1886.0,q_defence_max=3772.0,q_magic_defence_min=2515.0,q_magic_defence_max=5029.0,},
  {q_ID=115.0,q_nextID=0.0,q_level=15.0,q_name='飞升',q_needPeriodLevel=0.0,q_school=2.0,q_max_hp=12787.0,q_magic_attack_min='7104',q_magic_attack_max='14208',q_defence_min=2131.0,q_defence_max=4262.0,q_magic_defence_min=2842.0,q_magic_defence_max=5683.0,},
  {q_ID=201.0,q_nextID=202.0,q_level=1.0,q_name='筑基',q_needPeriodLevel=1.0,q_needPoint='{[10000]=10}',q_school=3.0,q_needMoney=1500000.0,q_needLevel=52.0,q_materialID='{[1104]=60}',q_max_hp=225.0,q_sc_attack_min='75',q_sc_attack_max='150',q_defence_min=26.0,q_defence_max=52.0,q_magic_defence_min=30.0,q_magic_defence_max=59.0,},
  {q_ID=202.0,q_nextID=203.0,q_level=2.0,q_name='旋照',q_needPeriodLevel=1.0,q_needPoint='{[10000]=20}',q_school=3.0,q_needMoney=1800000.0,q_needLevel=53.0,q_materialID='{[1104]=105}',q_max_hp=393.0,q_sc_attack_min='131',q_sc_attack_max='262',q_defence_min=46.0,q_defence_max=91.0,q_magic_defence_min=52.0,q_magic_defence_max=104.0,},
  {q_ID=203.0,q_nextID=204.0,q_level=3.0,q_name='开光',q_needPeriodLevel=2.0,q_needPoint='{[10000]=30}',q_school=3.0,q_needMoney=1900000.0,q_needLevel=54.0,q_materialID='{[1104]=180}',q_max_hp=668.0,q_sc_attack_min='223',q_sc_attack_max='446',q_defence_min=78.0,q_defence_max=155.0,q_magic_defence_min=88.0,q_magic_defence_max=176.0,},
  {q_ID=204.0,q_nextID=205.0,q_level=4.0,q_name='融合',q_needPeriodLevel=2.0,q_needPoint='{[20000]=15}',q_school=3.0,q_needMoney=2400000.0,q_needLevel=55.0,q_materialID='{[1104]=295}',q_max_hp=1103.0,q_sc_attack_min='368',q_sc_attack_max='735',q_defence_min=128.0,q_defence_max=256.0,q_magic_defence_min=146.0,q_magic_defence_max=291.0,},
  {q_ID=205.0,q_nextID=206.0,q_level=5.0,q_name='金丹',q_needPeriodLevel=2.0,q_needPoint='{[20000]=25}',q_school=3.0,q_needMoney=3000000.0,q_needLevel=56.0,q_materialID='{[1104]=474}',q_max_hp=1765.0,q_sc_attack_min='588',q_sc_attack_max='1176',q_defence_min=205.0,q_defence_max=410.0,q_magic_defence_min=233.0,q_magic_defence_max=466.0,},
  {q_ID=206.0,q_nextID=207.0,q_level=6.0,q_name='心动',q_needPeriodLevel=3.0,q_needPoint='{[20000]=35}',q_school=3.0,q_needMoney=3500000.0,q_needLevel=57.0,q_materialID='{[1104]=707}',q_max_hp=2647.0,q_sc_attack_min='882',q_sc_attack_max='1765',q_defence_min=307.0,q_defence_max=615.0,q_magic_defence_min=349.0,q_magic_defence_max=699.0,},
  {q_ID=207.0,q_nextID=208.0,q_level=7.0,q_name='灵寂',q_needPeriodLevel=3.0,q_needPoint='{[30000]=20}',q_school=3.0,q_needMoney=4000000.0,q_needLevel=58.0,q_materialID='{[1104]=1024}',q_max_hp=3838.0,q_sc_attack_min='1279',q_sc_attack_max='2559',q_defence_min=446.0,q_defence_max=892.0,q_magic_defence_min=507.0,q_magic_defence_max=1013.0,},
  {q_ID=208.0,q_nextID=209.0,q_level=8.0,q_name='元婴',q_needPeriodLevel=3.0,q_needPoint='{[30000]=30}',q_school=3.0,q_needMoney=4500000.0,q_needLevel=59.0,q_materialID='{[1104]=1431}',q_max_hp=5373.0,q_sc_attack_min='1791',q_sc_attack_max='3582',q_defence_min=624.0,q_defence_max=1248.0,q_magic_defence_min=709.0,q_magic_defence_max=1419.0,},
  {q_ID=209.0,q_nextID=210.0,q_level=9.0,q_name='化婴',q_needPeriodLevel=4.0,q_needPoint='{[30000]=40}',q_school=3.0,q_needMoney=5000000.0,q_needLevel=60.0,q_materialID='{[1104]=1940}',q_max_hp=7253.0,q_sc_attack_min='2418',q_sc_attack_max='4836',q_defence_min=843.0,q_defence_max=1685.0,q_magic_defence_min=958.0,q_magic_defence_max=1915.0,},
  {q_ID=210.0,q_nextID=211.0,q_level=10.0,q_name='出窍',q_needPeriodLevel=4.0,q_needPoint='{[40000]=30}',q_school=3.0,q_needMoney=5600000.0,q_needLevel=61.0,q_materialID='{[1104]=2519}',q_max_hp=9429.0,q_sc_attack_min='3143',q_sc_attack_max='6286',q_defence_min=1095.0,q_defence_max=2191.0,q_magic_defence_min=1245.0,q_magic_defence_max=2490.0,},
  {q_ID=211.0,q_nextID=212.0,q_level=11.0,q_name='分神',q_needPeriodLevel=4.0,q_needPoint='{[40000]=40}',q_school=3.0,q_needMoney=6000000.0,q_needLevel=62.0,q_materialID='{[1104]=3144}',q_max_hp=11787.0,q_sc_attack_min='3929',q_sc_attack_max='7858',q_defence_min=1369.0,q_defence_max=2738.0,q_magic_defence_min=1556.0,q_magic_defence_max=3113.0,},
  {q_ID=212.0,q_nextID=213.0,q_level=12.0,q_name='合体',q_needPeriodLevel=5.0,q_needPoint='{[40000]=50}',q_school=3.0,q_needMoney=6600000.0,q_needLevel=63.0,q_materialID='{[1104]=3809}',q_max_hp=14262.0,q_sc_attack_min='4754',q_sc_attack_max='9508',q_defence_min=1657.0,q_defence_max=3313.0,q_magic_defence_min=1883.0,q_magic_defence_max=3766.0,},
  {q_ID=213.0,q_nextID=214.0,q_level=13.0,q_name='大乘',q_needPeriodLevel=5.0,q_needPoint='{[50000]=50}',q_school=3.0,q_needMoney=7000000.0,q_needLevel=64.0,q_materialID='{[1104]=4424}',q_max_hp=16544.0,q_sc_attack_min='5515',q_sc_attack_max='11029',q_defence_min=1922.0,q_defence_max=3844.0,q_magic_defence_min=2184.0,q_magic_defence_max=4369.0,},
  {q_ID=214.0,q_nextID=215.0,q_level=14.0,q_name='渡劫',q_needPeriodLevel=5.0,q_needPoint='{[50000]=60}',q_school=3.0,q_needMoney=7500000.0,q_needLevel=65.0,q_materialID='{[1104]=5040}',q_max_hp=18860.0,q_sc_attack_min='6287',q_sc_attack_max='12573',q_defence_min=2191.0,q_defence_max=4382.0,q_magic_defence_min=2490.0,q_magic_defence_max=4980.0,},
  {q_ID=215.0,q_nextID=0.0,q_level=15.0,q_name='飞升',q_needPeriodLevel=0.0,q_school=3.0,q_max_hp=21312.0,q_sc_attack_min='7104',q_sc_attack_max='14208',q_defence_min=2476.0,q_defence_max=4951.0,q_magic_defence_min=2814.0,q_magic_defence_max=5628.0,},
}

return Items
local Items=
{
  {q_ID=10000.0,q_name='任脉',q_type=1.0,q_higher=0.0,},
  {q_ID=11000.0,q_name='玉堂',q_type=2.0,q_higher=10000.0,F5='任脉',},
  {q_ID=11100.0,q_name='紫宫',q_type=3.0,q_higher=11000.0,F5='玉堂',},
  {q_ID=11200.0,q_name='华盖',q_type=3.0,q_higher=11000.0,F5='玉堂',},
  {q_ID=11300.0,q_name='天突',q_type=3.0,q_higher=11000.0,F5='玉堂',},
  {q_ID=11400.0,q_name='承桨',q_type=3.0,q_higher=11000.0,F5='玉堂',},
  {q_ID=11500.0,q_name='廉泉',q_type=3.0,q_higher=11000.0,F5='玉堂',},
  {q_ID=12000.0,q_name='曲骨',q_type=2.0,q_higher=10000.0,F5='任脉',},
  {q_ID=12100.0,q_name='中极',q_type=3.0,q_higher=12000.0,F5='曲骨',},
  {q_ID=12200.0,q_name='关元',q_type=3.0,q_higher=12000.0,F5='曲骨',},
  {q_ID=12300.0,q_name='神阙',q_type=3.0,q_higher=12000.0,F5='曲骨',},
  {q_ID=12400.0,q_name='建里',q_type=3.0,q_higher=12000.0,F5='曲骨',},
  {q_ID=12500.0,q_name='中脘',q_type=3.0,q_higher=12000.0,F5='曲骨',},
  {q_ID=20000.0,q_name='奇穴',q_type=1.0,q_higher=0.0,},
  {q_ID=21000.0,q_name='龙玄',q_type=2.0,q_higher=20000.0,F5='奇穴',},
  {q_ID=21100.0,q_name='抬肩',q_type=3.0,q_higher=21000.0,F5='龙玄',},
  {q_ID=21200.0,q_name='极泉',q_type=3.0,q_higher=21000.0,F5='龙玄',},
  {q_ID=21300.0,q_name='腰眼',q_type=3.0,q_higher=21000.0,F5='龙玄',},
  {q_ID=21400.0,q_name='曲泉',q_type=3.0,q_higher=21000.0,F5='龙玄',},
  {q_ID=21500.0,q_name='晴中',q_type=3.0,q_higher=21000.0,F5='龙玄',},
  {q_ID=30000.0,q_name='带脉',q_type=1.0,q_higher=0.0,},
  {q_ID=31000.0,q_name='天冲',q_type=2.0,q_higher=30000.0,F5='带脉',},
  {q_ID=31100.0,q_name='目窗',q_type=3.0,q_higher=31000.0,F5='天冲',},
  {q_ID=31200.0,q_name='承灵',q_type=3.0,q_higher=31000.0,F5='天冲',},
  {q_ID=31300.0,q_name='光明',q_type=3.0,q_higher=31000.0,F5='天冲',},
  {q_ID=32000.0,q_name='维道',q_type=2.0,q_higher=30000.0,F5='带脉',},
  {q_ID=32100.0,q_name='浮白',q_type=3.0,q_higher=32000.0,F5='维道',},
  {q_ID=32200.0,q_name='正营',q_type=3.0,q_higher=32000.0,F5='维道',},
  {q_ID=32300.0,q_name='脑空',q_type=3.0,q_higher=32000.0,F5='维道',},
  {q_ID=32400.0,q_name='外丘',q_type=3.0,q_higher=32000.0,F5='维道',},
  {q_ID=32500.0,q_name='本神',q_type=3.0,q_higher=32000.0,F5='维道',},
  {q_ID=40000.0,q_name='冲脉',q_type=1.0,q_higher=0.0,},
  {q_ID=41000.0,q_name='大赫',q_type=2.0,q_higher=40000.0,F5='冲脉',},
  {q_ID=41100.0,q_name='商曲',q_type=3.0,q_higher=41000.0,F5='大赫',},
  {q_ID=41200.0,q_name='阴都',q_type=3.0,q_higher=41000.0,F5='大赫',},
  {q_ID=41300.0,q_name='幽门',q_type=3.0,q_higher=41000.0,F5='大赫',},
  {q_ID=42000.0,q_name='横骨',q_type=2.0,q_higher=40000.0,F5='冲脉',},
  {q_ID=42100.0,q_name='盲俞',q_type=3.0,q_higher=42000.0,F5='横骨',},
  {q_ID=42200.0,q_name='中注',q_type=3.0,q_higher=42000.0,F5='横骨',},
  {q_ID=42300.0,q_name='石关',q_type=3.0,q_higher=42000.0,F5='横骨',},
  {q_ID=42400.0,q_name='通谷',q_type=3.0,q_higher=42000.0,F5='横骨',},
  {q_ID=42500.0,q_name='关门',q_type=3.0,q_higher=42000.0,F5='横骨',},
  {q_ID=50000.0,q_name='督脉',q_type=1.0,q_higher=0.0,},
  {q_ID=51000.0,q_name='命门',q_type=2.0,q_higher=50000.0,F5='督脉',},
  {q_ID=51100.0,q_name='神道',q_type=3.0,q_higher=51000.0,F5='命门',},
  {q_ID=51200.0,q_name='中枢',q_type=3.0,q_higher=51000.0,F5='命门',},
  {q_ID=51300.0,q_name='哑门',q_type=3.0,q_higher=51000.0,F5='命门',},
  {q_ID=52000.0,q_name='悬枢',q_type=2.0,q_higher=50000.0,F5='督脉',},
  {q_ID=52100.0,q_name='至阳',q_type=3.0,q_higher=52000.0,F5='悬枢',},
  {q_ID=52200.0,q_name='身柱',q_type=3.0,q_higher=52000.0,F5='悬枢',},
  {q_ID=52300.0,q_name='风府',q_type=3.0,q_higher=52000.0,F5='悬枢',},
  {q_ID=53000.0,q_name='腰俞',q_type=2.0,q_higher=50000.0,F5='督脉',},
  {q_ID=53100.0,q_name='脊中',q_type=3.0,q_higher=53000.0,F5='腰俞',},
  {q_ID=53200.0,q_name='灵台',q_type=3.0,q_higher=53000.0,F5='腰俞',},
  {q_ID=53300.0,q_name='大椎',q_type=3.0,q_higher=53000.0,F5='腰俞',},
}

return Items
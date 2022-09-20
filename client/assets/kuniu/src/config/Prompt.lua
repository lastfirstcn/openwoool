local Items = {
	{q_MarkID = 1,q_Promptobject = 'PK值',q_contentdescription1 = '1.PK值\n恶意击杀一名勇士将增加2点PK值，PK值达到或超过4点，将伴随红名状态。',q_contentdescription2 = '2.红名惩罚\n红名勇士将不能使用传送技能、飞行靴功能。红名勇士被击杀后，装备及物品被爆落的几率增加。',q_contentdescription3 = '3.消除红名\n勇士累计在线15分钟可消除一点PK值。使用消红药水，也可消除一定PK值。',},
	{q_MarkID = 2,q_Promptobject = '幸运值',q_contentdescription1 = '幸运等级越高，攻击触发最大伤害的几率越高。',},
	{q_MarkID = 3,q_Promptobject = '装备详情',q_contentdescription1 = '打造极品装备\n装备升级材料可在副本→勇闯天关.寻宝.野外Boss中获得。',},
	{q_MarkID = 4,q_Promptobject = '行会升级',q_contentdescription1 = '行会升级\n1.点击“行会等级”→升级（增加行会上限人数）\n2.点击“行会商店”→升级（增加购买道具种类）\n3.点击“行会旗帜”→升级（增强行会BUFF属性）',},
	{q_MarkID = 5,q_Promptobject = '武魂技能说明',q_contentdescription1 = '使用武魂技能书可获得强大的武魂技能！\n1.点击日常→寻宝有一定几率获取武魂技能书\n2.挖矿也能挖出武魂技能书噢！\n3.高阶武魂技能只能通过低阶武魂书技能合成获得',},
	{q_MarkID = 6,q_Promptobject = '黄金树',q_contentdescription1 = '黄金树:\n1.每日可免费摇1次，后续次数需花费元宝\n2.每天凌晨5：00更新次数',},
	{q_MarkID = 7,q_Promptobject = '声望树',q_contentdescription1 = '声望树:\n1.每日可免费摇1次，后续次数需花费元宝\n2.每天凌晨5：00更新次数',},
	{q_MarkID = 8,q_Promptobject = '特戒树',q_contentdescription1 = '特戒树:\n1.每日可免费摇1次，后续次数需花费元宝\n2.每天凌晨5：00更新次数',},
	{q_MarkID = 9,q_Promptobject = '元神',q_contentdescription1 = '1.元神可以通过喂食魂玉提供给主人的加成属性\n2.不同的魂玉拥有不同的属性',},
	{q_MarkID = 10,q_Promptobject = '交易',q_contentdescription1 = '交易规则：\n1.30级以上玩家可进行面对面交易；\n2.每次交易，交易双方各收取10元宝的交易手续费；\n3.贵重物品和强化过的装备无法进行面对面交易；\n4.单次交易元宝上限为1000元宝；\n5.每日元宝收支交易上限为3000元宝。',},
	{q_MarkID = 11,q_Promptobject = '赞/踩说明',q_contentdescription1 = '1.点击勇士发言后的按钮，可【顶】他或\n是【踩】他。\n2.若您对该勇士的言论持赞同态度，可点\n【顶】他。\n若您对该勇士的言论不赞同，可点【踩】他。若该勇士被其他勇士踩的次数过多，\n将会遭受系统惩罚——禁言。\n\n\n                    和谐聊天，快乐游戏',},
	{q_MarkID = 12,q_Promptobject = '熟练度提示说明',q_contentdescription1 = '熟练度：\n1,熟练度满后可升级该技能。\n2,使用技能攻击敌方单位，有一定几率增加该技能熟练度；但技能等级达到专家级后只能使用强化技能灵丹增加熟练度。',},
	{q_MarkID = 13,q_Promptobject = '寻宝',q_contentdescription1 = '1.点击抽取按钮可以随机抽取到普通装备.绝版套装.各类稀有进阶材料和元宝道具。',q_contentdescription2 = '2.每抽取一次至尊宝箱有概率顺序点亮传奇世界中的一枚字印，当点亮四枚字印时，将获得集字奖励。',q_contentdescription3 = '3.累积抽取8次十连抽必将点亮传奇世界四个字。',},
	{q_MarkID = 14,q_Promptobject = '熔炼',q_contentdescription1 = '熔炼\n1.熔炼装备可获得熔炼值与金币\n2.熔炼强化的装备可返还一定比例的材料以及金币\n3.熔炼套装可获得七彩石\n4.熔炼值可在熔炼商城购买道具',},
	{q_MarkID = 15,q_Promptobject = '装备图鉴',q_contentdescription1 = '装备收集规则:\n1.普通装备和神装装备名称虽然相同，但神装具有独特的套装效果，这两者获得方式以及威力和稀有程度却是截然不同的哦~\n2.获得该部件后即可永久激活图鉴，出售或者销毁仍旧保留收集记录。',},
	{q_MarkID = 16,q_Promptobject = '定向红包',q_contentdescription1 = '发红包规则：\n未被抢完的元宝将会2小时后返回给发红包的勇士，元宝红包只可发送给等级＞22级的勇士\n好友红包：每次发元宝范围100~500，每次红包数量范围1~10，每天最多发5次',q_contentdescription2 = '行会红包：每次发元宝范围200~1000，每次红包数量范围2~20，每天最多发5次',q_contentdescription3 = '世界红包：每次发元宝范围300~2000，每次红包数量范围2~30，每天发送次数无限制',q_contentdescription4 = '抢红包规则：\n22级以上并且角色在线才可以抢元宝红包 \n\n最多保存40条抢红包信息',},
	{q_MarkID = 17,q_Promptobject = '护送镖车',q_contentdescription1 = '1.勇士可随机获取1-5星镖车，星级越高镖车奖励越丰厚。',q_contentdescription2 = '2.消耗20绑定元宝可将镖车升至最高级。',q_contentdescription3 = '3.镖车将携带勇士奖励运行，镖车血量低于一定百分比勇士将损失一定数额的奖励，并爆出该奖励。',q_contentdescription4 = '4.点击右上角小地图可查看镖车运行路径及终点站。\n5.玩家在镖车押运途中离线会导致押运失败！',},
	{q_MarkID = 18,q_Promptobject = '元婴境界',q_contentdescription1 = '1.元婴阶段从低到高分别为【固本期】,【培元期】,【明心期】,【大悟期】,【飞升期】\n2.每个阶段对应3个境界。 \n3. 阶段提升需要修炼值，提升到下一阶段将大量附加给角色基础属性。',},
	{q_MarkID = 19,q_Promptobject = '元婴阶段',q_contentdescription1 = '1.元婴境界提升需要仙灵石\n2. 当境界达到【开光】【心动】【化婴】【合体】【飞升】时，就可以对该元婴阶段进行修炼。\n3. 当修炼值达到最大化时，即可进行元婴阶段提升。',},
	{q_MarkID = 20,q_Promptobject = '元婴穴位',q_contentdescription1 = '1.穴位升级规则：支线穴位升级需要消耗声望\n2. 副穴位升级需要支线穴位达到一定重数\n3. 主穴位升级需要副穴位达到一定重数\n4. 境界升级则需要主穴位达到一定重数。',},
	{q_MarkID = 21,q_Promptobject = '元婴炼神',q_contentdescription1 = '1.元婴品质一共有5种，分别为：紫府元婴(白).璇玑元婴(绿).灵虚元婴(蓝).神华元婴(紫).天启元婴(橙)\n2. 元婴品质越高，附加给角色的属性越高。',},
	{q_MarkID = 22,q_Promptobject = '魅力排行',q_contentdescription1 = '一：魅力值大小由获赠的鲜花数决定\n二：魅力榜角逐结果在每周一晚上21点统计排行，每周数量不累计；\n三：为方便勇士查询，魅力值变化每分钟刷新一次\n四：离线勇士魅力值变化在登录后更新\n五：魅力值最多的勇士将获得带属性称号“人见人爱”以及世界发言文字变色特权',},
	{q_MarkID = 23,q_Promptobject = '膜拜沙城主',q_contentdescription1 = '1.点击【膜拜】可免费领取1500声望，每人每日限一次。\n2.点击【元宝膜拜】将消耗50元宝获得30000声望。',},
	{q_MarkID = 24,q_Promptobject = '离线挖矿',q_contentdescription1 = '1.角色退出游戏后，离线超过15分钟及以上开始累积离线收益。\n2.每积累15分钟的离线时间会获得一份奖励，低于15分钟不会累计，每次最多积累48小时的离线时间。\n3. 离线收益奖励分为经验奖励和宝箱奖励，玩家可全部免费领取。',},
	{q_MarkID = 25,q_Promptobject = '离线挖矿',q_contentdescription1 = '最多可以离线收益时间为48小时。',},
	{q_MarkID = 26,q_Promptobject = '冲级达人',q_contentdescription1 = '1.各职业等级排名第一者可领取极品道具。\n2.当玩家角色等级达到相应条件时同样可领取丰厚奖励。\n3.等级相同时按角色当前经验值的多少进行排名。\n4.揭榜时间：^c(yellow)开服第一天晚上24点^。',},
	{q_MarkID = 27,q_Promptobject = '绝世神兵',q_contentdescription1 = '1.以角色身上穿戴的装备强化等级总和进行排名。\n2.装备强化等级排名前三的玩家可领取极品道具。\n3.当玩家装备强化达到相应条件时同样可领取丰厚奖励。\n4.同等级情况下，按照角色总战力高低排名。\n5.揭榜时间：^c(yellow)开服第三天晚上24点^。',},
	{q_MarkID = 28,q_Promptobject = '最炫仙翼',q_contentdescription1 = '1.仙翼战力排名前三的玩家可领取极品道具。\n2.当玩家仙翼等级达到相应条件时同样可领取丰厚奖励。\n3.同战力情况下，按照角色总战力高低排名。\n4.揭榜时间：^c(yellow)开服第四天晚上24点^。',},
	{q_MarkID = 29,q_Promptobject = '寻宝排行榜',q_contentdescription1 = '1.寻宝次数排名前三的玩家可领取极品道具。\n2.当玩家寻宝次数达到相应条件时同样可领取丰厚奖励。\n3.统计次数包含：免费寻宝.寻宝符寻宝.元宝寻宝。\n4.同次数情况下，按照角色总战力高低排名。\n5.揭榜时间：^c(yellow)开服第五天晚上24点^。',},
	{q_MarkID = 30,q_Promptobject = '最强行会',q_contentdescription1 = '1.等级排名第一的行会，全体成员都可领取丰厚奖励。\n2.行会等级达到相应条件，成员即可领取全民奖励。\n3.以榜单结算时，在行会内的成员才可领取奖励。\n4.同等级情况下，按照行会总战力高低排名。\n5.揭榜时间：^c(yellow)开服第六天晚上24点^。',},
	{q_MarkID = 31,q_Promptobject = '成就点排行榜',q_contentdescription1 = '1.成就点排名前三的玩家可领取极品道具。\n2.当玩家的成就点达到相应条件时同样可领取丰厚奖励。\n3.同成就点情况下，按照角色总战力高低排名。\n4.揭榜时间：^c(yellow)开服第七天晚上24点^。',},
	{q_MarkID = 32,q_Promptobject = '勋章排行榜',q_contentdescription1 = '1.全服勋章等级排名前三的玩家可领取极品道具。\n2.当玩家勋章等级达到相应条件时同样可领取丰厚奖励。\n3.同等级情况下，按照角色总战力高低排名。\n4.揭榜时间：^c(yellow)开服第二天晚上24点^。',},
	{q_MarkID = 33,q_Promptobject = '签到',q_contentdescription1 = '1.每月累计签到天数，领取相应的签到奖励。\n2.签到奖励每天5:00重置，可花费20元宝进行每日补签。',},
	{q_MarkID = 34,q_Promptobject = '勋章',q_contentdescription1 = '1.勋章不可交易，不可卸下，不会爆出。\n2.使用声望可以给勋章升级。',},
	{q_MarkID = 38,q_Promptobject = '吞噬讨伐任务',q_contentdescription1 = '1.每天能接取10个悬赏任务,悬赏卷轴品质品质越高奖励越高',q_contentdescription2 = '2.吞噬悬赏任务条件：悬赏任务数必须≥2',q_contentdescription3 = '3.排列顺序为第一的悬赏任务无法被吞噬掉',q_contentdescription4 = '4.吞噬方法：选中悬赏任务，点击悬赏任务面板中的吞噬按钮。',q_contentdescription5 = '5.吞噬成功任务消失。该任务的经验与奖励的80%加成到它的上方的悬赏任务中。',},
	{q_MarkID = 39,q_Promptobject = '特权',q_contentdescription1 = '1.充值6元即可马上获得特权。\n2.拥有特权后享有各项专属特权，特权等级越高，特权越多。\n3.勇士每日可领取特权礼包，特权每升一级也可获取超值大礼包。',},
	{q_MarkID = 40,q_Promptobject = '行会BOSS',q_contentdescription1 = '1.演武场BOSS可由行会会长或副会长设置定时开启召唤。',q_contentdescription2 = '2.开启不同等级BOSS会消耗不同的行会资源。',q_contentdescription3 = '3.行会会长或副会长每日只能进行1次定时设置更改。',q_contentdescription4 = '4.若指定时间到达时行会资源不足，当日演武场BOSS无法被开启召唤。',q_contentdescription5 = '5.BOSS召唤成功后会出现在行会禁地，直到被击杀或在每日24:00重置。\n6.活动结束时玩家将根据伤害排行获得相应奖励。\n7.对BOSS造成最后一击的玩家可额外拾取BOSS掉落物品！',},
	{q_MarkID = 41,q_Promptobject = '领地战规则1',q_contentdescription1 = '开服2天后，每周二和周四19：00-20：00',},
	{q_MarkID = 42,q_Promptobject = '领地战规则2',q_contentdescription1 = '需要加入行会',},
	{q_MarkID = 43,q_Promptobject = '领地战规则3',q_contentdescription1 = '1.活动开启后会长或副会长可前往战场行会旗帜处抢夺旗帜',q_contentdescription2 = '2.拔旗后行会自动成为守旗方',q_contentdescription3 = '3.拔旗后守住旗帜10分钟，旗帜没有易主则守旗方行会获胜',q_contentdescription4 = '4.若没有行会守旗达到10分钟则活动结束时守旗方行会获胜\n5.持有旗帜玩家移动速度将会降低\n6.持有旗帜玩家被击杀，旗帜将回归原位',},
	{q_MarkID = 44,q_Promptobject = '中州战规则1',q_contentdescription1 = '开服7天后，每周六19：00-20：00',},
	{q_MarkID = 45,q_Promptobject = '中州战规则2',q_contentdescription1 = '^c(red)只有占领领地的行会才能参与中州争霸战^',},
	{q_MarkID = 46,q_Promptobject = '中州战规则3',q_contentdescription1 = '1.活动开启后会长或副会长可前往行会旗帜处争夺行会旗帜\n2.拔旗后行会自动成为守旗方',q_contentdescription2 = '3.拔旗后守住旗帜10分钟，旗帜没有易主则守旗方行会获胜\n4.若没有行会守旗达到10分钟则活动结束时守旗方行会获胜',q_contentdescription3 = '5.若活动结束时无任何行会持旗，则判定领地未被占领\n6.持旗者下线、死亡或离开本地图都会导致旗帜将回归原位\n7.持旗者将会受到降速效果影响',},
	{q_MarkID = 47,q_Promptobject = '中州战规则4',q_contentdescription1 = '1.获胜行会会长：神武级战甲\n2.获胜行会成员：行会贡献+100、经验+100万\n3.参与奖励：行会贡献+20、经验+20万',},
	{q_MarkID = 48,q_Promptobject = '中州战规则5',q_contentdescription1 = '1.获胜行会成员每日可根据行会职位领取不同的行会贡献及声望奖励',},
	{q_MarkID = 49,q_Promptobject = '沙城争霸战规则1',q_contentdescription1 = '开服5天后，每周日19：00-20：00',},
	{q_MarkID = 50,q_Promptobject = '沙城争霸战规则2',q_contentdescription1 = '1.需要加入行会',q_contentdescription2 = '2.行会获得沙城争霸战资格',},
	{q_MarkID = 51,q_Promptobject = '沙城争霸战规则3',q_contentdescription1 = '1. 沙城没有归属时，需击杀皇宫内守卫后才能进行争夺',q_contentdescription2 = '2. 活动期间，当沙城皇宫内有且只有同一个行会玩家(状态持续5秒)，且该行会拥有沙城争霸战资格时，判定该行会占领沙城皇宫，成为沙城行会',q_contentdescription3 = '3. 沙城行会成员将在沙城复活点复活\n4. 活动结束前，参与活动的行会可反复争夺沙城皇宫',q_contentdescription4 = '5. 活动结束时，占领沙城皇宫的沙城行会获得胜利',q_contentdescription5 = '6. 已占领沙城的行会，默认为下一次沙城守城方，可提前进入皇宫防守',},
	{q_MarkID = 52,q_Promptobject = '沙城争霸战规则4',q_contentdescription1 = '1. 获胜行会会长：血煞套装宝盒、十万元宝、城主称号！',q_contentdescription2 = '2. 获胜行会成员：行会贡献+200、经验+200万',q_contentdescription3 = '3. 参与奖励：行会贡献+50、经验+50万',},
	{q_MarkID = 53,q_Promptobject = '沙城争霸战规则5',q_contentdescription1 = '1. 获胜行会成员每日可根据行会职位领取不同的行会贡献及声望奖励',},
	{q_MarkID = 54,q_Promptobject = '传承',q_contentdescription1 = '1.只可传承同类型的装备。\n2.被传承的装备强化等级必须低于传承装备。\n3.强化等级不同传承后会降低不同的强化等级，使用传承卷轴不降低强化等级。\n4.强化等级不同使用的传承卷轴数量不同。\n4.装备传承后，原始装备将会消失！',},
	{q_MarkID = 55,q_Promptobject = '通天塔',q_contentdescription1 = '1.首次挑战只能单人挑战，需在规定时间内消灭所有怪物；\n2.只有通天塔某一层通关后，才能选择好友帮助进行挑战；\n3.三星成绩后才能进行扫荡；\n4.通天塔28级开启。',},
	{q_MarkID = 56,q_Promptobject = '悬赏任务',q_contentdescription1 = '发布者的奖励：\n1. 发布者在任务被其他玩家完成后，可以在幽影阁门人处领取任务的发布奖励',q_contentdescription2 = '2. 任务过期后，可以在幽影阁门人处领取任务的发布奖励。',q_contentdescription3 = '接取悬赏任务的玩家奖励：\n1. 第一个完成任务的玩家可以获得任务完成的奖励.\n2.非第一个完成任务的玩家可获得2000经验的基础奖励.\n注：^c(red)New标记的任务接取后可获得10分钟专享时间!^',q_contentdescription4 = '发布消耗：\n1.发布普通任务需要消耗10000金币；\n2.发布高级任务需要消耗1个高级悬赏卷轴。\n3.发布至尊任务需要消耗1个至尊悬赏卷轴。',},
	{q_MarkID = 57,q_Promptobject = '多人守卫',q_contentdescription1 = '1.多人守卫可单人或组队挑战，副本共分三个难度：普通、困难级和地狱。',q_contentdescription2 = '2.通关普通副本后可自动解锁困难难度、通关困难副本后会解锁地狱难度。',q_contentdescription3 = '3.副本挑战等级限制为34级，挑战次数不受限制，所有难度副本的通关奖励每日最多只可领取一次。',q_contentdescription4 = '4.单个难度的副本，守护波数越多则奖励越多，通关可获得最高奖励。',},
	{q_MarkID = 58,q_Promptobject = '行会祈福香',q_contentdescription1 = '1.祈福上香可以增加个人贡献和行会经验。\n2.个人贡献可用于珍宝阁购买物品。\n3.行会经验可用于提升行会等级。',},
	{q_MarkID = 59,q_Promptobject = '领地战规则4',q_contentdescription1 = '1. 获胜行会成员每日可领取金币、声望、洗炼符等奖励',},
	{q_MarkID = 60,q_Promptobject = '领地战规则5',q_contentdescription1 = '1. 只有会长或副会长可以拔起行会旗帜',q_contentdescription2 = '2. 拔旗后行会自动成为守旗方',q_contentdescription3 = '3. 拔旗后守住旗帜10分钟，旗帜没有易主则守旗方行会获胜',q_contentdescription4 = '4. 若没有行会守旗达到10分钟则活动结束时守旗方行会获胜',q_contentdescription5 = '5. 若活动结束时无任何行会持旗，则判定领地未被占领\n6. 持旗者下线.死亡或离开本地图都会导致旗帜将回归原位',},
	{q_MarkID = 61,q_Promptobject = '拍卖行',q_contentdescription1 = '1.点击左侧列表，或者通过关键字筛选，可以帮您更精确的找寻商品。',q_contentdescription2 = '2.每个整点时，新的商品会上架,比如您在9点30分寄售了一件商品，它会在10点整上架。',q_contentdescription3 = '3.购买商品时，需要交付微量的手续费。',q_contentdescription4 = '4.寄售中与待领取的商品，总量最多为20个，所以请您及时收取待领取中的物品哦。',q_contentdescription5 = '5.未交易成功的商品，只会收取少量寄售费用，不会收取手续费用。\n6.若出售商品成功，会收取微量的交易税。',},
	{q_MarkID = 62,q_Promptobject = '申请攻沙',q_contentdescription1 = '1.申请攻沙时间截止至沙城战开启前一天24点',q_contentdescription2 = '2.沙城战期间已占领中州王城或现有沙城行会无需申请，可直接参加',q_contentdescription3 = '3.其他行会可通过上交魔神雕像申请报名，报名结束时，排名前三的行会可获得攻沙资格',q_contentdescription4 = '4.拥有攻沙资格行会成员才能进入沙城皇宫',q_contentdescription5 = '5.沙城争霸战结束后报名积分清零',},
	{q_MarkID = 63,q_Promptobject = '3V3竞技场',q_contentdescription1 = '1. 加入战队才能参加3V3竞技场。',q_contentdescription2 = '2. 系统将根据胜负情况匹配相应的战队进行比赛。',q_contentdescription3 = '3. 海选赛结束将选取前8战队进行决赛。',q_contentdescription4 = '4. 击杀对方全员或比赛结束时存活人数多的一方获胜。',q_contentdescription5 = '5. 海选赛期间比赛结束存活人数相同则均算负。\n6. 决赛阶段人数相同则进入加时赛直至分出胜负。\n7. 加时赛所有人员持续受到落雷伤害。\n8. 参赛成员中的战法道三职业将分别为队友提供单独的BUFF。',},
	{q_MarkID = 64,q_Promptobject = '结义说明',q_contentdescription1 = '1.结义兄弟组队并在同一地图时，将被动增加情义值',q_contentdescription2 = '2.组队的结义兄弟人数越多，则获得的情义值越多',q_contentdescription3 = '3.每天获得的情义值有上限',q_contentdescription4 = '4.每周日24点自动降低一定的情义值',q_contentdescription5 = '5.情义值达到一定时可提升情义等级\n6.情义等级提升可获得结义技能点数用以学习结义技能\n7.结义成员组队在同一地图时结义技能属性才能生效\n8.只有带头大哥可以激活、重置结义技能\n9.结义技能需要依次激活，前置技能未激活时不能激活\n后续技能',},
	{q_MarkID = 65,q_Promptobject = '行会入侵规则',q_contentdescription1 = '1. 拥有驻地的行会，开启行会篝火期间可被其他行会入侵',q_contentdescription2 = '2. 行会入侵期间，杀人不计算PK值，不会爆物',q_contentdescription3 = '3. 行会篝火结束后，入侵行会将会退出行会驻地',},
	{q_MarkID = 66,q_Promptobject = '二级密码提示',q_contentdescription1 = '忘记密码后，只能采取强制解锁，强制解锁时间为3天，3天后二级密码锁将会失效，\n确认要强制解锁吗？',},
	{q_MarkID = 67,q_Promptobject = '装备强化规则',q_contentdescription1 = '1.只有装备可以进行强化，包括武器、衣服、头盔、项链、手镯、戒指、靴子、腰带。\n2.强化可以提升装备的基础属性，强化最高为20级。\n3.强化+1至强化+10需要消耗铁矿、强化+11至强化+20需要消耗黑铁矿石。\n4.所用材料的纯度越高，所增加的强化成功率也越高。\n5.强化失败只会消耗强化材料，不会有其它损失。',},
	{q_MarkID = 68,q_Promptobject = '点金',q_contentdescription1 = '1.可使用点金石对装备进行点金，激活装备极品属性',q_contentdescription2 = '2.每次点金有概率提升装备极品属性',q_contentdescription3 = '3.每次点金需消耗一个点金石',},
	{q_MarkID = 69,q_Promptobject = '公平竞技场',q_contentdescription1 = '活动说明：\n^c(red)公平竞技场所有玩家采用相同等级、装备和技能进行对抗!^',q_contentdescription2 = '参与等级：\n人物等级大于30级',q_contentdescription3 = '规则说明：\n1. 公平竞技场采用纯随机模式匹配玩家进行3V3对抗，也可提前组队进行队伍匹配。\n2.公平竞技场中玩家拥有恢复、免伤、双倍攻击三个符文技能。\n3.公平竞技场中每隔一段时间会刷新符文，获得符文后可使用符文技能。',q_contentdescription4 = '4.公平竞技场双方阵地均有箭塔和大营，率先推掉对方箭塔和大营的一方可获得胜利。\n5.5分钟内双方未摧毁对方大营则算平局。\n6.结义技能效果可在公平竞技场中生效。',q_contentdescription5 = '规则说明：\n1.胜方：2000声望、洗炼符*4；平局：1000声望、洗炼符*2；失败：1000声望、洗炼符*2\n2.胜场累计达到一定数量可获得额外大奖。',},
	{q_MarkID = 70,q_Promptobject = '洗炼',q_contentdescription1 = '1.蓝色及以上品级的装备具有洗炼属性',q_contentdescription2 = '2.可对具有洗炼属性的装备进行洗炼',q_contentdescription3 = '3.蓝装、紫装、橙装分别具有1、2、3条洗炼属性',},
	{q_MarkID = 71,q_Promptobject = '勇闯炼狱',q_contentdescription1 = '1.进入不同难度的炼狱地图需要消耗不同的炼狱凭证，每次进入炼狱地图可停留30分钟。',q_contentdescription2 = '2.所有炼狱地图中都有持续加经验的BUFF，每10秒可获得一次泡点经验奖励。',q_contentdescription3 = '3.每日前30分钟进入炼狱地图可以享受多倍泡点经验的系统加成，炼狱中的怪物经验远高于野外地图',q_contentdescription4 = '4.三个难度的炼狱地图都分三层，怪物经验和泡点经验奖励随层数和难度的提升而增加。',q_contentdescription5 = '5.在炼狱地图中小退或者下线，角色将退出活动地图。',},
	{q_MarkID = 72,q_Promptobject = '迷仙阵',q_contentdescription1 = '1. 迷仙阵内每个空间内会有1-4个传送门，在完成该空间内的事件后，即会开启',q_contentdescription2 = '2. 通过传送门可以进入下一个空间，每次进入未探索过的空间，需消耗1把迷仙钥匙',q_contentdescription3 = '3. 小地图内会展示已探索的空间、未探索的空间以及被照亮的空间，并且标记2个白银宝藏和1个黄金宝藏的位置',q_contentdescription4 = '4. 迷仙阵需手动重置，每次重置需消耗1把钥匙，并且每天首次打开迷仙阵界面会赠送10把迷仙钥匙',q_contentdescription5 = '5. 在小地图上点击已探索的空间可快捷传送',},
	{q_MarkID = 73,q_Promptobject = '屠龙传说',q_contentdescription1 = '1.通关前置关卡后，可解锁后续关卡。箭头路径会标识出关卡间的解锁关系。',q_contentdescription2 = '2.首次完成关卡，会获得通关奖励。反复挑战不会获得奖励。',q_contentdescription3 = '3.每日挑战每天可以进行一次，通关后，会获得奖励。',q_contentdescription4 = '4.每日挑战的难度会随着关卡进度而提升，奖励也会相应提升。',},
	{q_MarkID = 74,q_Promptobject = '月老-等级不足',q_contentdescription1 = '我是见证爱情的月老。达到48级的勇士，可以与相爱之人一起来找我，我将为你们的结合做见证。',q_contentdescription2 = '巡礼任务需要男方触发接取。',},
	{q_MarkID = 75,q_Promptobject = '月老-等级足-未婚',q_contentdescription1 = '无论你是否强大，无论你是否历经沧桑。你永远无法独自面对爱情。',q_contentdescription2 = '去寻找属于你的那另一半，与其组队，一起来见我。我会见证你们的结合。',q_contentdescription3 = '巡礼任务需要男方触发接取。',},
	{q_MarkID = 76,q_Promptobject = '月老-婚礼开启前',q_contentdescription1 = '经典婚礼内容为180分钟会场使用。',q_contentdescription2 = '豪华婚礼内容为200分钟会场使用，以及豪华婚车巡游中州。',q_contentdescription3 = '婚礼开启后，夫妻会得到请柬，在聊天频道中分享请柬，其他玩家可以通过点击请柬进入婚礼会场。',},
	{q_MarkID = 77,q_Promptobject = '月老-婚礼开启时',q_contentdescription1 = '婚礼会场已可以进入，新人双方可点击下方入口进入。',q_contentdescription2 = '请柬已交付给两位，婚礼期间，可在聊天频道中分享请柬，其他玩家可以通过点击请柬进入婚礼会场。',},
	{q_MarkID = 78,q_Promptobject = '月老-会场-夫妻-宾客页签',q_contentdescription1 = '您可以通过宾客列表，查看当前所有的宾客。',},
	{q_MarkID = 79,q_Promptobject = '月老-会场-夫妻-气氛页签',q_contentdescription1 = '浪漫花瓣：持续15分钟的花瓣雨能增添喜意。',q_contentdescription2 = '礼乐师：很能活跃现场哦，你会喜欢上他们的演奏的。',},
	{q_MarkID = 80,q_Promptobject = '月老-会场-夫妻-玩法页签',q_contentdescription1 = '一些雅俗共赏的玩法，正适合同好友一起乐呵。\n你问是什么玩法？试试不就知道了？',},
	{q_MarkID = 81,q_Promptobject = '月老-会场-宾客-红包页签',q_contentdescription1 = '您赠送的红包，会在婚礼结束后发送到新娘手中。',},
	{q_MarkID = 82,q_Promptobject = '月老-婚后-婚礼页签',q_contentdescription1 = '每对夫妻可以开启一次婚礼。',},
	{q_MarkID = 83,q_Promptobject = '月老-婚后-任务页签',q_contentdescription1 = '夫妻任务每周一上午5点刷新。',q_contentdescription2 = '这是对你们心意的考验，必须组队完成。',},
	{q_MarkID = 84,q_Promptobject = '月老-婚后-其他页签',q_contentdescription1 = '与其与我着老头子闲聊，何不如与你那携手之人周游这世间呢？',q_contentdescription2 = '有些事，多考虑一下，可能会有不同的答案。',},
	{q_MarkID = 85,q_Promptobject = '月老-婚后-冷静期阶段',q_contentdescription1 = '当这个时间走到尽头，你们的婚姻也将成为往事。',q_contentdescription2 = '若还有补救的可能，请告诉我，我来让一切重归于好。',},
};
return Items

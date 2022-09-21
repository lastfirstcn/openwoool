;尸霸
;Preset								Trigger													Condition																Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*																		SetSkillList(10002,3002,3011,3004,3003,3006,3009,10024,10004) && CurSkill(->10004) && MoveSpeed(->3)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST) && AttackWait(->1000)
State(=Fight)						Event(=ATTACKED)										HP(<20%) && PreHP(>=20%)												AddBuff(132, -1) && AttackWait(->1000)
*												Event(=STATECHANGED)								State(=Idle)																		RemoveBuff(132)

State(=Fight)						Event(=ATTACKED)										IsSkillReady(3009) && CanCrash(TARGET_SELECT_THREATLIST_FIRST,3009) && TriggerDiff(>=10000)  Speek(RANGE_AROUND, 3, '我今天见着一个绝世美女了，在照镜子的时候。') && Cast(TARGET_SELECT_THREATLIST_FIRST, 3009)
State(=Fight)						Event(=ATTACKED)										IsSkillReady(3003) && TriggerDiff(>=10000) 													Cast(TARGET_SELECT_SELF, 3003) && MoveTo(RANDOM_POINT5)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(3006) && TriggerDiff(>=10000)													Speek(RANGE_AROUND, 3, '主人不可以太辛苦哦。') && Cast(TARGET_SELECT_SELF, 3006)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(3012) && !HasPet(=*) && TriggerDiff(>=10000)									Cast(TARGET_SELECT_SELF, 3012)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(3007) && !HasPet(=*) && TriggerDiff(>=10000) && !HasLearnSkill(3012)			Speek(RANGE_AROUND, 3, '唔，刚刚那个怪物吓死宝宝了。') && Cast(TARGET_SELECT_SELF, 3007)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(3008) && !HasPet(=*) && TriggerDiff(>=10000) && !HasLearnSkill(3007) && !HasLearnSkill(3012)									Cast(TARGET_SELECT_SELF, 3008)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(3004) && !THREATLIST_FIRST.HasSkillBuff(3004)									ForceCurSkill(->3004) && Stage(->3)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(3011)																			CurSkill(->3011)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(3002)																			Speek(RANGE_AROUND, 3, '虽然这些怪物很可怕，但主人分分钟就消灭掉了。') && CurSkill(->3002)
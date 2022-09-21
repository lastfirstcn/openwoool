;元神·战
;Preset								Trigger													Condition																Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*																		SetSkillList(1004,1008,1010,1005,1006,1003,1009,6000,10024,10004) && CurSkill(->10004) && MoveSpeed(->3)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST) && AttackWait(->1000)
State(=*)							Event(=ATTACKED)										State(!=Fight) && IsHostility(EVENT_ENTITY) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST) && AttackWait(->1000)
State(=Fight)						Event(=ATTACKED)										HP(<20%) && PreHP(>=20%)												AddBuff(132, -1) && AttackWait(->1000)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(10002)														Cast(TARGET_SELECT_SELF, 10002)
*												Event(=STATECHANGED)								State(=Idle)																		RemoveBuff(132)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1008) && TriggerDiff(>=10000)								Speek(RANGE_AROUND, 3, '主人，什么时候给我换一把极品武器？') && Cast(TARGET_SELECT_SELF, 1008)

State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1010) && CanCrash(TARGET_SELECT_THREATLIST_FIRST,1010) && TriggerDiff(>=10000)		 Cast(TARGET_SELECT_THREATLIST_FIRST, 1010)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1005) && CanCrash(TARGET_SELECT_THREATLIST_FIRST,1005) && TriggerDiff(>=10000)		Speek(RANGE_AROUND, 3, '主人，人家好久都没换新衣服了~') && Cast(TARGET_SELECT_THREATLIST_FIRST, 1005)
State(=Fight)						HasLearnSkill(1006)										!HasBuff(126) && TriggerDiff(>=6000)															AddBuff(126, 6000)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1006) && HasBuff(126)														Speek(RANGE_AROUND, 3,'敢打主人，你肯定是活腻了！尝尝烈火吧~') && CurSkill(->1006)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1003)													Speek(RANGE_AROUND, 3,'主人，奴家誓死保护你！~') &&	CurSkill(->1003)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1009)														Speek(RANGE_AROUND, 3,'主人，嘻嘻…………没事……~') && CurSkill(->1009)
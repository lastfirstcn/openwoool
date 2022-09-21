;尸霸
;Preset								Trigger													Condition																Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*																		SetSkillList(10002,10024,1006,10004) && CurSkill(->10004) && MoveSpeed(->3)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST) && AttackWait(->500)
State(=*)							Event(=ATTACKED)										State(!=Fight) && IsHostility(EVENT_ENTITY) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST) && AttackWait(->1000)
State(=Fight)						Event(=ATTACKED)										HP(<20%) && PreHP(>=20%)												AddBuff(519, -1) && AttackWait(->1000)
State(=Fight)						HasLearnSkill(1006)										!HasBuff(126) && TriggerDiff(>=6000)															AddBuff(126, 6000)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1006) && HasBuff(126)														CurSkill(->1006)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(10002)														Cast(TARGET_SELECT_SELF, 10002)
*												Event(=STATECHANGED)								State(=Idle)																		RemoveBuff(519)
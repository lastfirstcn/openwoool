;魔鲨将军
;Preset								Trigger													Condition																Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*																		SetSkillList(10006,10010,10007) && CurSkill(->10007)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
State(=*)							Event(=ATTACKED)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(10006)													Speek(RANGE_AROUND, 0, tiexuemowangfire) && Cast(TARGET_SELECT_THREATLIST_RANDOM, 10006)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(10010)													Cast(TARGET_SELECT_CURRENT, 10010)
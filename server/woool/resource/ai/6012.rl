;??BOSS:????
;Preset								Trigger													Condition																Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*																		SetSkillList(10041,10042) && CurSkill(->10041) && MoveSpeed(->3)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST) && AttackWait(->1000)
State(=*)							Event(=ATTACKED)										State(!=Fight) && IsHostility(EVENT_ENTITY) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST) && AttackWait(->1000)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(10042)														Cast(MAP_POINT_RAND6, 10042)
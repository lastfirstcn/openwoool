;方外圣君
;Preset								Trigger													Condition															Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*																	SetSkillList(10040) && CurSkill(->10040)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY)&&Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
State(=*)							Event(=ATTACKED)									State(!=Fight) && IsHostility(EVENT_ENTITY)&&Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
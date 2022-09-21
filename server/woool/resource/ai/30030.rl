;章鱼大王
;Preset								Trigger													Condition													Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*																		SetSkillList(10001) && CurSkill(->10001) && PursueDist(->5)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && State(!=Relive)	Show(1, 2000) && UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
State(=*)							Event(=ATTACKED)									    State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
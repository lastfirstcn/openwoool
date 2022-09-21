;九幽蟠龙之子
;Preset								Trigger													Condition																				Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*																						SetSkillList(10014,10015) && Stage(->0)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && Model(!=30085) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_RANDOM) && CurSkill(->10015)
State(=*)							Event(=ATTACKED)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && Model(!=30085) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_RANDOM) && CurSkill(->10015)
State(=*)							Event(=ENTITYINSIGHT)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && Model(=30085) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_RANDOM) && CurSkill(->10014)
State(=*)							Event(=ATTACKED)									State(!=Fight) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8) && Model(=30085) && State(!=Relive)	UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_RANDOM) && CurSkill(->10014)
*									Event(=DIED)											Model(!=30085)																			Speek(RANGE_AROUND, 0, axiuluoshenchange) && Stage(->1)
*									Stage(=1)												*																						Stage(->2) && Wait(3000)
State(=Relive)						Model(!=30085)											Stage(=2)																				Model(->30085, 1) && State(->Idle)
*									Event(=DIED)											Model(=30085)																			Speek(RANGE_AROUND, 0, axiuluoshendeath)
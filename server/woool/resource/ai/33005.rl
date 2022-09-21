;铁血魔王
;Preset								Trigger													Condition																Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*														SetSkillList(10009,10010,10011) && CurSkill(->10011) && MoveSpeed(->3)
*									Event(=STATECHANGED)									State(=Follow)											Stage(->1)
*									Dist(HOST,>12)											*														MoveTo(HOST_JUMP) && State(->Follow)
*									Event(=HOST_ATTACKING)									Stage(!=2) && State(!=Relive)												Stage(->2) && State(->Fight, TARGET_SELECT_HOST_TARGET)
*									Event(=ATTACKED)										State(!=Fight) && State(!=Relive)											Stage(->1) && State(->Fight, TARGET_SELECT_CURRENT)
*									Event(=HOST_ATTACKED)									State(!=Fight) && State(!=Relive)											State(->Fight, TARGET_SELECT_CURRENT)
State(=Follow)						Event(=ENTITYINSIGHT)									State(!=Fight) && EVENT_ENTITY.Class(=MONSTER) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8)	Stage(->1) && UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(10009)													Speek(RANGE_AROUND, 0, tiexuemowangfire) && Cast(TARGET_SELECT_THREATLIST_RANDOM, 10009)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(10010)													Cast(TARGET_SELECT_CURRENT, 10010)
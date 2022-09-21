;尸霸
;Preset								Trigger													Condition																Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*														SetSkillList(10002,10024,10004) && CurSkill(->10004) && MoveSpeed(->3)
*									Event(=STATECHANGED)									State(=Follow)											Stage(->1)
*									Dist(HOST,>12)											*														MoveTo(HOST_JUMP) && State(->Follow)
*									Event(=HOST_ATTACKING)									Stage(!=2) && State(!=Relive)												Stage(->2) && State(->Fight, TARGET_SELECT_HOST_TARGET)
*									Event(=ATTACKED)										State(!=Fight) && State(!=Relive)											Stage(->1) && State(->Fight, TARGET_SELECT_CURRENT)
*									Event(=HOST_ATTACKED)									State(!=Fight) && State(!=Relive)											State(->Fight, TARGET_SELECT_CURRENT)
State(=Follow)						Event(=ENTITYINSIGHT)									State(!=Fight) && EVENT_ENTITY.Class(=MONSTER) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8)	Stage(->1) && UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
State(=Fight)						Event(=ATTACKED)										HP(<20%) && PreHP(>=20%)												AddBuff(132, -1) && AttackWait(->1000)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(10002)														Cast(TARGET_SELECT_SELF, 10002)
;战士元神2级 圣战套  技能：1000基本 1002攻杀  1003刺杀 1004抱月 1005冲撞  1006烈火  1008金刚护体 1009破盾 1010突斩  1102攻杀
;Preset								Trigger													Condition												Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=BORN)											*														SetSkillList(1000,1002,1003,1004,1005) && CurSkill(->1004) && MoveSpeed(->5)
*									Event(=STATECHANGED)									State(=Follow)											Stage(->1)
*									Dist(HOST,>12)											*														MoveTo(HOST_JUMP) && State(->Follow)
*									Event(=HOST_ATTACKING)									Stage(!=2) && State(!=Relive)												Stage(->2) && State(->Fight, TARGET_SELECT_HOST_TARGET)
*									Event(=ATTACKED)										State(!=Fight) && State(!=Relive)											Stage(->1) && State(->Fight, TARGET_SELECT_CURRENT)
*									Event(=HOST_ATTACKED)									State(!=Fight) && State(!=Relive)											State(->Fight, TARGET_SELECT_CURRENT)
State(=Follow)						Event(=ENTITYINSIGHT)									State(!=Fight) && EVENT_ENTITY.Class(=MONSTER) && IsHostility(EVENT_ENTITY) && Dist(EVENT_ENTITY,<8)	Stage(->1) && UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)

State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1003)														CurSkill(->1003)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1004)														CurSkill(->1004)
State(=Fight)						Event(=SKILLREADY)										IsSkillReady(1005)														CurSkill(->1005)
;Preset								Trigger													Condition												Exec
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
State(=Idle)						Event(=ATTACKED)										State(!=Fight)																	State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
State(=Idle)						Event(=ATTACKED)									State(!=Fight) && IsHostility(EVENT_ENTITY)	 			UpdateThreat(EVENT_ENTITY,1) && State(->Fight, TARGET_SELECT_THREATLIST_FIRST)
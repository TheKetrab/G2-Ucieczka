
func void WarWithOrc_Start(var c_npc slf) {
	AI_StartState (slf, ZS_WarWithOrc, 0, "");
};

func void WarWithOrc_End(var c_npc slf) {
	slf.aivar[96] = false;
};

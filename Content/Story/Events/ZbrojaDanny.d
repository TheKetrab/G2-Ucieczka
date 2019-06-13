
const string DannyW1 = "OW_LAKE_NC_LURKER_SPAWN01";
const string DannyW2 = "OW_PATH_159";
const string DannyW3 = "SPAWN_OW_WARAN_NC_03";
const string DannyW4 = "OW_PATH_157";


func string ZbrojaDannyGetDestination() {

	var string result; result = DannyW1;
	var int dist_min; dist_min = Npc_GetDistToWP(hero,DannyW1);
	var int temp_dist;
	
	temp_dist = Npc_GetDistToWP(hero,DannyW2);
	if (temp_dist < dist_min) {
		dist_min = temp_dist;
		result = DannyW2;
	};

	temp_dist = Npc_GetDistToWP(hero,DannyW3);
	if (temp_dist < dist_min) {
		dist_min = temp_dist;
		result = DannyW3;
	};

	temp_dist = Npc_GetDistToWP(hero,DannyW4);
	if (temp_dist < dist_min) {
		dist_min = temp_dist;
		result = DannyW4;
	};

	return result;
};


func void ZbrojaDanny_TickTock1s() {

	var c_item armor; armor = Npc_GetEquippedArmor (hero);

	if (Npc_GetDistToNPC(hero,NASZ_327_Danny) < 2000)
	&& (Hlp_IsItem (armor, ItNa_BAN_L)
	 || Hlp_IsItem (armor, ItNa_BAN_M)
	 || Hlp_IsItem (armor, ItNa_BAN_H))
	&& (npc_knowsinfo(hero,DIA_NASZ_316_Carry_help))
	{
		HeroSay_MeetDanny();
		AI_GotoWP(hero,ZbrojaDannyGetDestination());
		Npc_ClearAIQueue(hero);
	};

};



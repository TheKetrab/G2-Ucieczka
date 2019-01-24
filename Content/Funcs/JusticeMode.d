
/* ===== JUSTICE MODE ===== */
const int DIST_OPONENT = 500;

func int NpcIsFighting(var c_npc slf) {

	//if (Npc_IsInFightMode(hero, FMODE_NONE))
	if (Npc_IsInFightMode(slf, FMODE_FIST))
	|| (Npc_IsInFightMode(slf, FMODE_MELEE))
	|| (Npc_IsInFightMode(slf, FMODE_FAR))
	|| (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		return TRUE;
	};
	
	return FALSE;
};


// ----- Zliczanie ilu npc w promieniu 'X' jest walczacych -----
var int NpcsInFightMode;
/*func int CountNpcsInFightModee() {
    NpcsInFightMode = 0;
   HookEngineF(7595136,6,CountNpcsInFightMode_Subs);
    return NpcsInFightMode;
};*/
//var int NpcsInFightMode;
func int CountNpcsInFightMode_Sub(var C_NPC slf, var C_NPC caster) {
    
	//NpcsInFightMode = 0;
	if (Npc_GetDistToNpc(slf,caster) < DIST_OPONENT)
	&& (NpcIsFighting(caster))
	{
        NpcsInFightMode += 1;
    };
	//Print(IntToString(NpcsInFightMode));
	return NpcsInFightMode;
};


func int CountNpcsInFightMode(var C_NPC slf,var C_NPC caster) {
    NpcsInFightMode = 0;
	CountNpcsInFightMode_Sub(slf,caster);
   // Broadcast(slf, CountNpcsInFightMode_Sub);
    return NpcsInFightMode;
};

/*func void CountNpcsInFightMode_Subs() {
  
	if(ECX)
	{
		var c_npc caster; caster = _^(ECX);
		if (Npc_GetDistToNpc(hero,caster) < DIST_OPONENT)
		&& (NpcIsFighting(caster))
		{
			NpcsInFightMode += 1;
		};
		RemoveHookF(7595136,6,CountNpcsInFightModee);
	};
};*/


func void CheckMarvin()
{
	if (STR_ToInt(MEM_GetGothOpt("UCIECZKA", "useJustice"))) {
			if(MEM_Game.game_testmode)
			{
				MEM_Game.game_testmode = 0;
				Print("Jeœli musisz u¿yæ konsoli, wy³¹cz w opcjach tryb sprawiedliwoœci!");
			};
	};

};
func void Marvin_Hook()
{
	const int marvin = 0;
	if(!marvin)
	{
		HookEngineF(7126880,6,CheckMarvin);
		HookEngineF(5093648,9,CheckMarvin);
		marvin=1;
	};
};

func void JusticeModeTickTock() {

	//Print(ConcatStrings("CountNpcsInFightMode: ",IntToString(CountNpcsInFightMode(hero))));
	//Print(ConcatStrings("HeroIsFighting: ",IntToString(HeroIsFighting())));

	
	/*if (NpcIsFighting(hero)) && (CountNpcsInFightMode(hero) > 1) { 
	
		if (PlayerCanSaveGame == TRUE) {
			PlayerCanSaveGame = FALSE;
			EnforceSavingPolicy();
		};		
	}
	
	else {
	
		if (PlayerCanSaveGame == FALSE) {
			PlayerCanSaveGame = TRUE;
			EnforceSavingPolicy();
		};	
	};*/


};
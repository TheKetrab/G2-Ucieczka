
func void WillCantKillOrcs_SetTrue() {
	WillCantKillOrcsVar = TRUE;
};

func void OrcSawYou() {

	// TODO -> wylaczyc mozliwosc zapisywania
	OrcSawYou_Activated = TRUE;
	HeroSay_OrcSeenMe();
	Fade_Status = 1;
	// TODO bogu - miało być disable + czy możliwość zapisywania się włączy po następnym wczytaniu? tzn potem trzeba 'wyłączyć' brak możliwości zapisu
	ff_applyonce(OrcSawYou_Active); // in MyLegoFuncs.d
	//Print("Start");

};

func int WillCantKillOrcs() {
	return WillCantKillOrcsVar;
};

func void OrcSawYou_InsertOrc()
{
	var string wp; wp = Npc_GetNearestWP(hero);
	
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	Wld_InsertNpc	(OrcWarrior_Roam,wp); 
	
};

func void Kap5FightWithOrc(var C_NPC oth, var C_NPC slf) {

	if (WillCantKillOrcs())										// jesli nie mozesz atakowac orkow
	&& (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))		// i ty uderzyles
	&& ((slf.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)			// orka wojownika
		|| (slf.aivar[AIV_MM_REAL_ID] == ID_ORCSCOUT))			// lub scouta
	{
		OrcSawYou();
	};

};

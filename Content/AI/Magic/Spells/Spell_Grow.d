// **********
// SPL_Grow
// **********

var int GrowUzyteOneTime;
var int GrowUsed;

instance Spell_Grow (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - Spell wirkt INSTANT
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_Grow	(var int manaInvested) 	//Parameter manaInvested wird hier nicht benutzt
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Shrink)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};

};

func void Spell_Cast_Grow()
{
	if (Npc_IsPlayer(self) && !GrowUsed) {
		Grow = TRUE;
		WillUzyteZaklecia += 1;
	};

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Shrink;
	};

	if (all_wiarolomca_equipped()) {
	
		if (GrowUzyteOneTime == FALSE) {
			B_LogEntry (TOPIC_zacmienie, "Teraz pozostaje mi jedynie siê do niej udaæ i pokonaæ tego, który znajduje siê wewn¹trz. Miejmy nadziejê, ¿e amulet i reszta artefaktów pomo¿e mi w walce.");
			GrowUzyteOneTime = TRUE;
		};
	
		WillMozeIscDoKazmina = TRUE;
		//AI_SetNpcsToState (hero, ZS_MagicGrow, 1000); //-kairo
		WillPowiekszony = TRUE;
		ff_applyonceext(secPrzywrocenieWielkosci,1000,-1);	
	}
	
	else {
		B_KillNpc(hero);
	};
	

	self.aivar[AIV_SelectSpell] += 1;
};

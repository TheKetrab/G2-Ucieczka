/*

// ******************
// SPL_SummonStraznik		/k4
// ******************

const int SPL_Cost_SummonStraznik			= 80;


INSTANCE Spell_SummonStraznik (C_Spell_Proto)	
{
	time_per_mana			= 0;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonStraznik(var int manaInvested)
{
	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
	Print("cast");
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonStraznik)
	{
	Print("cast");
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
	Print("stop");
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonStraznik()
{
	Print("TUTUTU");

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonStraznik;
	};
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange	(self,	NASZ_407_Straznik,			1,	500);

	};
	
	self.aivar[AIV_SelectSpell] += 1;
};


*/
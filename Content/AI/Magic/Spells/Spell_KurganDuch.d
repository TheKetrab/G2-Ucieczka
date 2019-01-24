// ************
// SPL_KurganDuch
// ************

const int SPL_Cost_KurganDuch			= 100;


INSTANCE Spell_KurganDuch (C_Spell_Proto)
{
	time_per_mana			= 0;								
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_KurganDuch	(var int manaInvested)
{
//	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
//	{
		return SPL_SENDCAST;
//	}
//	else if (self.attribute[ATR_MANA] >= SPL_Cost_KurganDuch)
//	{		
//		return SPL_SENDCAST;
//	}
//	else //nicht genug Mana
//	{
//		return SPL_SENDSTOP;
//	};
};

func void Spell_Cast_KurganDuch()
{
/*	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_KurganDuch;
	};
*/	
	//self.aivar[AIV_SelectSpell] += 1;
	//AI_PlayAni (self,"T_PRACTICEMAGIC4");
	Wld_InsertNpc 	(NASZ_401_Kurgan, "ADW_ANCIENTGHOST");
	Wld_PlayEffect("spellFX_Maya_Ghost",  NASZ_401_Kurgan, NASZ_401_Kurgan, 0, 0, 0, FALSE ); 
	Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",  NASZ_401_Kurgan, NASZ_401_Kurgan, 0, 0, 0, FALSE ); 
	Snd_Play ("MFX_GhostVoice"); 
	Snd_Play ("MFX_Firestorm_Cast"); 
	Snd_Play ("MFX_Lightning_Origin");
	Kurgan_Przyzwal_Ducha = TRUE;
	KurganMozeStop = TRUE;
};





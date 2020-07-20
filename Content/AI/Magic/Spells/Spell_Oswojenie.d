// *********
// SPL_Oswojenie
// *********

const int SPL_Cost_Oswojenie		= 50;
const int SPL_Damage_Oswojenie 		= 0;
var int OswojenieUsed;

INSTANCE Spell_Oswojenie(C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	damage_per_level		= SPL_Damage_Oswojenie;
	damageType				= DAM_MAGIC;						// war vorher DAM_FIRE
};

func int Spell_Logic_Oswojenie(var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_Oswojenie)
	{
		
		Npc_ClearAIQueue	(other);
		B_ClearPerceptions	(other);
		AI_StartState		(other, ZS_Oswojenie, 0, "");

		//B_SetAttitude (other, ATT_FRIENDLY); 
		//Npc_GetAttitude(other,self) = ATT_FRIENDLY;
		//Npc_GetPermAttitude(other,self) = ATT_FRIENDLY;
 		
 
 		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Oswojenie()
{
	if (Npc_IsPlayer(self) && !OswojenieUsed) {
		OswojenieUsed = TRUE;
		WillUzyteZaklecia += 1;
	};

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Oswojenie;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};

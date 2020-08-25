// *****************
// SPL_DestroyUndead
// *****************

const int	SPL_Cost_DESTROYUNDEAD		=	100;
const int 	SPL_Damage_DESTROYUNDEAD 	= 	3000; //soll halt wirklich killen! // FIX UCIECZKA 1.1: poprawione z 1000 na 3000, bo 414_zombie ma 2k hp i go nie zabijalo!
var int DestroyUndeadUsed;

INSTANCE Spell_DestroyUndead(C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level 		= SPL_Damage_DESTROYUNDEAD;				
	spelltype				= SPELL_NEUTRAL;
};

func int Spell_Logic_DestroyUndead	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_DESTROYUNDEAD)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


func void Spell_Cast_DestroyUndead()
{
	if (Npc_IsPlayer(self) && !DestroyUndeadUsed) {
		DestroyUndeadUsed = TRUE;
		WillUzyteZaklecia += 1;
	};


	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_DESTROYUNDEAD;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};

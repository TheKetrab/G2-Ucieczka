// ******************
// SPL_ArmyOfDarkness
// ******************

const int SPL_Cost_ArmyOfDarkness	= 150;
var int ArmyOfDarknessUsed;

INSTANCE Spell_ArmyOfDarkness (C_Spell_Proto)
{
	time_per_mana			= 	0;
	targetCollectAlgo		= 	TARGET_COLLECT_NONE;
};


func int Spell_Logic_ArmyOfDarkness (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_ArmyOfDarkness)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

// NEU:
// einige Spells haben Probleme logische Aktionen mit den Animationen
// zu synchronisieren. In diesem Beispiel w�rden, wenn die folgenden Befehle
// direkt vor dem SPL_SENDCAST st�nden, die Skelette gespawned werden, bevor
// �berhaupt eine Investier- oder Cast- Ani angespielt ist.
// Darum gibt es ab Version 1.16b optional die M�glichkeit, etwaige Aktionen
// mit den Anis zu synchronisieren. Daf�r muss dann eine SkriptFunktion 
// Spell_Cast_SPELLNAME existieren, die aufgerufen wird, sobald alle Magie Animationen
// beendet wurden
func void Spell_Cast_ArmyOfDarkness(var int spellLevel)
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_ArmyOfDarkness;
	};
	
	if (Npc_IsPlayer(self))
	{
		if (!ArmyOfDarknessUsed) {
			ArmyOfDarknessUsed = TRUE;
			WillUzyteZaklecia += 1;
		};
		
	    Wld_SpawnNpcRange	(self,	Summoned_Skeleton,			6,	800);

	}
	else
	{
	    Wld_SpawnNpcRange	(self,	Skeleton,			6,	800);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};

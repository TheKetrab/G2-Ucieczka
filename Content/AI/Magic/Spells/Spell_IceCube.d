// ***********
// SPL_IceCube
// ***********

const int	SPL_Cost_IceCube			=	40;
const int   SPL_FREEZE_DAMAGE		 	=	2;		// IceCube, IceWave
const int	SPL_TIME_FREEZE				=	19;		// IceCube, IceWave
var int IceCubeUsed;

//Achtung: wenn bei FREEZE (19) die Werte geändert werden, muß auch die Lebensdauer der PFX angepasst werden

INSTANCE Spell_IceCube (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - INSTANT-Spell
	damage_per_level 		= 60;					//Schaden wird im ZS_MagicFreeze angegeben!
};

func int Spell_Logic_IceCube (var int manaInvested) //Parameter wird hier nicht gebraucht
{
    if(!Hero_UseGolemHeart)
    {
        if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
        {
            return SPL_SENDCAST;
        }
        else if (self.attribute[ATR_MANA] >= SPL_Cost_IceCube)
        {    
            return SPL_SENDCAST;
        }
        else //nicht genug Mana
        {
            return SPL_SENDSTOP;
        };
    }
    else
    {
        if(AmountOfUseIceCubeHeart_1 == 1)
        ||(AmountOfUseIceCubeHeart_1 == 2)
        ||(AmountOfUseIceCubeHeart_1 == 3)
        ||(AmountOfUseIceCubeHeart_1 == 4)
        {    
            return SPL_SENDCAST;
        }
        else
        {
            AI_UnreadySpell(hero);
            return SPL_SENDSTOP;
        };
    };
};

func void Spell_Cast_IceCube()
{
	if (Npc_IsPlayer(self) && !IceCubeUsed) {
		IceCubeUsed = TRUE;
		WillUzyteZaklecia += 1;
	};

    if (Npc_GetActiveSpellIsScroll(self))
    {
        if(!Hero_UseGolemHeart)
        {
            self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
        }
        else
        {
            self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 0;
        };
    }
    else
    {
        self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_IceCube;
    };
    
    self.aivar[AIV_SelectSpell] += 1;
};

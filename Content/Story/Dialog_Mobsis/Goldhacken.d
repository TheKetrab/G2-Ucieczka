// TODO: ERROR !! brudne bry³ki dla jana, wszystkie bry³ki znikaja¹
// jak masz na sobie miecz i jest ich 9 to szybko kopiac znikaja wszystkie i zostaja 3
// najprawdopodobniej te trzy brudne??

var int GoldMob_01_NASZ; // inserted
var int GoldMob_02_NASZ; // inserted
var int GoldMob_03_NASZ; // inserted
var int GoldMob_04_NASZ; // inserted
var int GoldMob_05_NASZ; // inserted
var int GoldMob_06_NASZ; // inserted
var int GoldMob_07_NASZ; // inserted
var int GoldMob_08_NASZ; // inserted
var int GoldMob_09_NASZ; // inserted
var int GoldMob_10_NASZ; // inserted
var int GoldMob_11_NASZ; // inserted
var int GoldMob_12_NASZ; // inserted
var int GoldMob_13_NASZ; // inserted
var int GoldMob_14_NASZ; // inserted
var int GoldMob_15_NASZ; // inserted
var int GoldMob_16_NASZ; // inserted
var int GoldMob_17_NASZ; // inserted
var int GoldMob_18_NASZ; // inserted
var int GoldMob_19_NASZ; // inserted
var int GoldMob_20_NASZ; // TODO
var int GoldMob_bonus_percents;

FUNC INT B_GoldMob_Bestimmung()
{
	//bin ich mobsi X und habe ich noch Gold übrig?
	if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_01") && (3 > GoldMob_01_NASZ)
	{
		GoldMob_01_NASZ = (GoldMob_01_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_02") && (3 > GoldMob_02_NASZ)
	{
		GoldMob_02_NASZ = (GoldMob_02_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_03") && (3 > GoldMob_03_NASZ)
	{
		GoldMob_03_NASZ = (GoldMob_03_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_04") && (3 > GoldMob_04_NASZ)
	{
		GoldMob_04_NASZ = (GoldMob_04_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_05") && (3 > GoldMob_05_NASZ)
	{
		GoldMob_05_NASZ = (GoldMob_05_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_06") && (3 > GoldMob_06_NASZ)
	{
		GoldMob_06_NASZ = (GoldMob_06_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_07") && (3 > GoldMob_07_NASZ)
	{
		GoldMob_07_NASZ = (GoldMob_07_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_08") && (3 > GoldMob_08_NASZ)
	{
		GoldMob_08_NASZ = (GoldMob_08_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_09") && (3 > GoldMob_09_NASZ)
	{
		GoldMob_09_NASZ = (GoldMob_09_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_10") && (3 > GoldMob_10_NASZ)
	{
		GoldMob_10_NASZ = (GoldMob_10_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_11") && (3 > GoldMob_11_NASZ)
	{
		GoldMob_11_NASZ = (GoldMob_11_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_12") && (3 > GoldMob_12_NASZ)
	{
		GoldMob_12_NASZ = (GoldMob_12_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_13") && (3 > GoldMob_13_NASZ)
	{
		GoldMob_13_NASZ = (GoldMob_13_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_14") && (3 > GoldMob_14_NASZ)
	{
		GoldMob_14_NASZ = (GoldMob_14_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_15") && (3 > GoldMob_15_NASZ)
	{
		GoldMob_15_NASZ = (GoldMob_15_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_16") && (3 > GoldMob_16_NASZ)
	{
		GoldMob_16_NASZ = (GoldMob_16_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_17") && (3 > GoldMob_17_NASZ)
	{
		GoldMob_17_NASZ = (GoldMob_17_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_18") && (3 > GoldMob_18_NASZ)
	{
		GoldMob_18_NASZ = (GoldMob_18_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_19") && (3 > GoldMob_19_NASZ)
	{
		GoldMob_19_NASZ = (GoldMob_19_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_GOLDMOB_20") && (3 > GoldMob_20_NASZ)
	{
		GoldMob_20_NASZ = (GoldMob_20_NASZ +1);
		return TRUE;
	};


	return FALSE;

};

FUNC VOID Goldhacken_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_GOLDHACKEN;
		Ai_ProcessInfos (her);
	};
};

//*******************************************************
//	Goldhacken Dialog abbrechen
//*******************************************************
INSTANCE PC_Goldhacken_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_Goldhacken_End_Condition;
	information		= PC_Goldhacken_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_Goldhacken_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GOLDHACKEN)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Goldhacken_End_Info()
{
	Truemmer_Count = 0;
	
	B_ENDPRODUCTIONDIALOG ();
};






func void kopanie_zlota(var int brudne) {

	if (brudne == 1) {
		MozeszKopacBrudneSamorodki = MozeszKopacBrudneSamorodki + 1;
		return;
	};

	if (B_GoldMob_Bestimmung() == TRUE)
	{
	
		// WYKOPANIE
		if(LevelMiner == 100) //Nagroda, za wbicie Guru
		{
			CreateInvItems (hero, ItMi_GoldNugget_Addon, 3);	
			PrintScreen ("Odpad³y 3 samorodki z³ota!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (100);
		}
		else if(LevelMiner >= 90)
		{
			CreateInvItems (hero, ItMi_GoldNugget_Addon, 3);	
			PrintScreen ("Odpad³y 3 samorodki z³ota!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (75);
		}
		else if(LevelMiner >= 65)
		{
			CreateInvItems (hero, ItMi_GoldNugget_Addon, 2);	
			PrintScreen ("Odpad³y 2 samorodki z³ota!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (50);
		}
		else if(LevelMiner >=40)
		{
			CreateInvItems (hero, ItMi_GoldNugget_Addon, 2);	
			PrintScreen ("Odpad³y 2 samorodki z³ota!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (25);
		}
		else //if(LevelMiner >=20) 20 juz posiadasz na starcie gry
		{
			CreateInvItems (hero, ItMi_GoldNugget_Addon, 1);	
			PrintScreen ("Odpad³ 1 samorodek z³ota!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (10);
		};
		
		
		//Bonus +5
		if(LevelMiner >= 90) && (LevelMiner <= 95)
		{
			if(GoldMob_bonus_percents == 30) // 3 uderzen = 1 wykopanie (10 wykopañ)
			{
				GoldMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				GoldMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 80)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner >= 65) && (LevelMiner <= 75)
		{
			if(GoldMob_bonus_percents == 21) // 3 uderzen = 1 wykopanie (7 wykopañ)
			{
				GoldMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				GoldMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 55)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner >= 40) && (LevelMiner <= 50)
		{
			if(GoldMob_bonus_percents == 15) // 3 uderzen = 1 wykopanie (5 wykopañ)
			{
				GoldMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				GoldMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 30)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner <=25)
		{
			if(GoldMob_bonus_percents == 9) // 3 uderzen = 1 wykopanie (3 wykopania)
			{
				GoldMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				GoldMob_bonus_percents += 1; // 1 uderzenie
			};
		};
	}
	else
	{
		PrintScreen ("Nic nie zosta³o.", -1, -1, FONT_ScreenSmall, 2);	
		B_ENDPRODUCTIONDIALOG ();
	};

};


//*******************************************************
//	Goldhacken 
//*******************************************************
INSTANCE PC_Goldhacken_Addon_Hour (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Goldhacken_Addon_Hour_Condition;
	information		= PC_Goldhacken_Addon_Hour_Info;
	permanent		= TRUE;
	description		= "Od³up trochê."; 
};

FUNC INT PC_Goldhacken_Addon_Hour_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GOLDHACKEN)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Goldhacken_Addon_Hour_Info()
{
	kopanie_zlota(0);
};

//*******************************************************
//	GoldhackenBrudne
//*******************************************************
INSTANCE PC_GoldhackenBrudne_Addon_Hour (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_GoldhackenBrudne_Addon_Hour_Condition;
	information		= PC_GoldhackenBrudne_Addon_Hour_Info;
	permanent		= TRUE;
	description		= "Od³up samorodki razem z glin¹."; 
};

FUNC INT PC_GoldhackenBrudne_Addon_Hour_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_GOLDHACKEN)
	&& (MozeszKopacBrudneSamorodki >= 1) && (MozeszKopacBrudneSamorodki < 5)
	{	
		return TRUE;
	};
};

FUNC VOID PC_GoldhackenBrudne_Addon_Hour_Info()
{
	kopanie_zlota(1);
};

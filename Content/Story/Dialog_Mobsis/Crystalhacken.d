var int CrystalMob_01_NASZ; // inserted
var int CrystalMob_02_NASZ; // inserted
var int CrystalMob_03_NASZ; // inserted
var int CrystalMob_04_NASZ; // inserted
var int CrystalMob_05_NASZ; // inserted
var int CrystalMob_06_NASZ; // inserted
var int CrystalMob_07_NASZ; // inserted
var int CrystalMob_08_NASZ; // inserted
var int CrystalMob_09_NASZ; // inserted
var int CrystalMob_10_NASZ; // inserted
var int CrystalMob_11_NASZ; // inserted
var int CrystalMob_12_NASZ; // inserted
var int CrystalMob_13_NASZ; // inserted
var int CrystalMob_14_NASZ; // inserted
var int CrystalMob_15_NASZ; // inserted
var int CrystalMob_16_NASZ; // inserted
var int CrystalMob_17_NASZ; // inserted
var int CrystalMob_18_NASZ; // inserted
var int CrystalMob_19_NASZ; // inserted
var int CrystalMob_20_NASZ; // inserted
var int CrystalMob_21_NASZ; // inserted
var int CrystalMob_22_NASZ; // inserted
var int CrystalMob_23_NASZ; // inserted
var int CrystalMob_24_NASZ; // inserted
var int CrystalMob_25_NASZ; // inserted
var int CrystalMob_26_NASZ; // inserted
var int CrystalMob_27_NASZ; // inserted
var int CrystalMob_28_NASZ; // inserted
var int CrystalMob_29_NASZ; // inserted
var int CrystalMob_30_NASZ; // inserted
var int CrystalMob_bonus_percents;

FUNC INT B_CrystalMob_Bestimmung()
{
	//bin ich mobsi X und habe ich noch Crystal übrig?
	if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_01") && (4 > CrystalMob_01_NASZ)
	{
		CrystalMob_01_NASZ = (CrystalMob_01_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_02") && (4 > CrystalMob_02_NASZ)
	{
		CrystalMob_02_NASZ = (CrystalMob_02_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_03") && (4 > CrystalMob_03_NASZ)
	{
		CrystalMob_03_NASZ = (CrystalMob_03_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_04") && (4 > CrystalMob_04_NASZ)
	{
		CrystalMob_04_NASZ = (CrystalMob_04_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_05") && (4 > CrystalMob_05_NASZ)
	{
		CrystalMob_05_NASZ = (CrystalMob_05_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_06") && (4 > CrystalMob_06_NASZ)
	{
		CrystalMob_06_NASZ = (CrystalMob_06_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_07") && (4 > CrystalMob_07_NASZ)
	{
		CrystalMob_07_NASZ = (CrystalMob_07_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_08") && (4 > CrystalMob_08_NASZ)
	{
		CrystalMob_08_NASZ = (CrystalMob_08_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_09") && (4 > CrystalMob_09_NASZ)
	{
		CrystalMob_09_NASZ = (CrystalMob_09_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_10") && (4 > CrystalMob_10_NASZ)
	{
		CrystalMob_10_NASZ = (CrystalMob_10_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_11") && (4 > CrystalMob_11_NASZ)
	{
		CrystalMob_11_NASZ = (CrystalMob_11_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_12") && (4 > CrystalMob_12_NASZ)
	{
		CrystalMob_12_NASZ = (CrystalMob_12_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_13") && (4 > CrystalMob_13_NASZ)
	{
		CrystalMob_13_NASZ = (CrystalMob_13_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_14") && (4 > CrystalMob_14_NASZ)
	{
		CrystalMob_14_NASZ = (CrystalMob_14_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_15") && (4 > CrystalMob_15_NASZ)
	{
		CrystalMob_15_NASZ = (CrystalMob_15_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_16") && (4 > CrystalMob_16_NASZ)
	{
		CrystalMob_16_NASZ = (CrystalMob_16_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_17") && (4 > CrystalMob_17_NASZ)
	{
		CrystalMob_17_NASZ = (CrystalMob_17_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_18") && (4 > CrystalMob_18_NASZ)
	{
		CrystalMob_18_NASZ = (CrystalMob_18_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_19") && (4 > CrystalMob_19_NASZ)
	{
		CrystalMob_19_NASZ = (CrystalMob_19_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_20") && (4 > CrystalMob_20_NASZ)
	{
		CrystalMob_20_NASZ = (CrystalMob_20_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_21") && (4 > CrystalMob_21_NASZ)
	{
		CrystalMob_21_NASZ = (CrystalMob_21_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_22") && (4 > CrystalMob_22_NASZ)
	{
		CrystalMob_22_NASZ = (CrystalMob_22_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_23") && (4 > CrystalMob_23_NASZ)
	{
		CrystalMob_23_NASZ = (CrystalMob_23_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_24") && (4 > CrystalMob_24_NASZ)
	{
		CrystalMob_24_NASZ = (CrystalMob_24_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_25") && (4 > CrystalMob_25_NASZ)
	{
		CrystalMob_25_NASZ = (CrystalMob_25_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_26") && (4 > CrystalMob_26_NASZ)
	{
		CrystalMob_26_NASZ = (CrystalMob_26_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_27") && (4 > CrystalMob_27_NASZ)
	{
		CrystalMob_27_NASZ = (CrystalMob_27_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_28") && (4 > CrystalMob_28_NASZ)
	{
		CrystalMob_28_NASZ = (CrystalMob_28_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_29") && (4 > CrystalMob_29_NASZ)
	{
		CrystalMob_29_NASZ = (CrystalMob_29_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CrystalMOB_30") && (4 > CrystalMob_30_NASZ)
	{
		CrystalMob_30_NASZ = (CrystalMob_30_NASZ +1);
		return TRUE;
	};

	return FALSE;

};

FUNC VOID Crystalhacken_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_CRYSTALHACKEN;
		Ai_ProcessInfos (her);
	};
};

//*******************************************************
//	Crystalhacken Dialog abbrechen
//*******************************************************
INSTANCE PC_Crystalhacken_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_Crystalhacken_End_Condition;
	information		= PC_Crystalhacken_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_Crystalhacken_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_CRYSTALHACKEN)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Crystalhacken_End_Info()
{
	Truemmer_Count = 0;
	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
//	Crystalhacken 
//*******************************************************
INSTANCE PC_Crystalhacken_Addon_Hour (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Crystalhacken_Addon_Hour_Condition;
	information		= PC_Crystalhacken_Addon_Hour_Info;
	permanent		= TRUE;
	description		= "Od³up trochê."; 
};

FUNC INT PC_Crystalhacken_Addon_Hour_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_CrystalHACKEN)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Crystalhacken_Addon_Hour_Info()
{
	
	if (B_CrystalMob_Bestimmung() == TRUE)
	{
		// WYKOPANIE
		if(LevelMiner == 100) //Nagroda, za wbicie Guru
		{
			CreateInvItems (hero, ItNa_Krysztal, 5);	
			PrintScreen ("Odpad³o 5 kryszta³ów!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (100);
		}
		else if(LevelMiner >= 90)
		{
			CreateInvItems (hero, ItNa_Krysztal, 4);	
			PrintScreen ("Odpad³y 4 kryszta³y!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (75);
		}
		else if(LevelMiner >= 65)
		{
			CreateInvItems (hero, ItNa_Krysztal, 3);	
			PrintScreen ("Odpad³y 3 kryszta³y!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (50);
		}
		else if(LevelMiner >=40)
		{
			CreateInvItems (hero, ItNa_Krysztal, 2);	
			PrintScreen ("Odpad³y 2 kryszta³y!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (25);
		}
		else //if(LevelMiner >=20) 20 juz posiadasz na starcie gry
		{
			CreateInvItems (hero, ItNa_Krysztal, 1);	
			PrintScreen ("Odpad³ 1 kryszta³!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (10);
		};
		
		
		//Bonus +5
		if(LevelMiner >= 90) && (LevelMiner <= 95)
		{
			if(CrystalMob_bonus_percents == 40) // 4 uderzen = 1 wykopanie (10 wykopañ)
			{
				CrystalMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				CrystalMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 80)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner >= 65) && (LevelMiner <= 75)
		{
			if(CrystalMob_bonus_percents == 28) // 4 uderzen = 1 wykopanie (7 wykopañ)
			{
				CrystalMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				CrystalMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 55)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner >= 40) && (LevelMiner <= 50)
		{
			if(CrystalMob_bonus_percents == 20) // 4 uderzen = 1 wykopanie (5 wykopañ)
			{
				CrystalMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				CrystalMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 30)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner <=25)
		{
			if(CrystalMob_bonus_percents == 12) // 4 uderzen = 1 wykopanie (3 wykopania)
			{
				CrystalMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				CrystalMob_bonus_percents += 1; // 1 uderzenie
			};
		};
	}
	else
	{
			PrintScreen ("Nic nie zosta³o.", -1, -1, FONT_ScreenSmall, 2);	
			B_ENDPRODUCTIONDIALOG ();
	};
};
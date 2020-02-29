var int CoalMob_01_NASZ; // inserted
var int CoalMob_02_NASZ; // inserted
var int CoalMob_03_NASZ; // inserted
var int CoalMob_04_NASZ; // inserted
var int CoalMob_05_NASZ; // inserted
var int CoalMob_06_NASZ; // inserted
var int CoalMob_07_NASZ; // inserted
var int CoalMob_08_NASZ; // inserted
var int CoalMob_09_NASZ; // inserted
var int CoalMob_10_NASZ; // inserted
var int CoalMob_11_NASZ; // inserted
var int CoalMob_12_NASZ; // inserted
var int CoalMob_13_NASZ; // inserted
var int CoalMob_14_NASZ; // inserted
var int CoalMob_15_NASZ; // inserted
var int CoalMob_16_NASZ; // inserted
var int CoalMob_17_NASZ; // inserted
var int CoalMob_18_NASZ; // inserted
var int CoalMob_19_NASZ; // inserted
var int CoalMob_20_NASZ; // inserted
var int CoalMob_21_NASZ; // inserted
var int CoalMob_22_NASZ; // inserted
var int CoalMob_23_NASZ; // inserted
var int CoalMob_24_NASZ; // inserted
var int CoalMob_25_NASZ; // inserted
var int CoalMob_26_NASZ; // inserted
var int CoalMob_27_NASZ; // inserted
var int CoalMob_28_NASZ; // inserted
var int CoalMob_29_NASZ; // inserted
var int CoalMob_30_NASZ; // inserted
var int CoalMob_bonus_percents;

FUNC INT B_CoalMob_Bestimmung()
{
	//bin ich mobsi X und habe ich noch Coal übrig?
	if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_01") && (5 > CoalMob_01_NASZ)
	{
		CoalMob_01_NASZ = (CoalMob_01_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_02") && (5 > CoalMob_02_NASZ)
	{
		CoalMob_02_NASZ = (CoalMob_02_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_03") && (5 > CoalMob_03_NASZ)
	{
		CoalMob_03_NASZ = (CoalMob_03_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_04") && (5 > CoalMob_04_NASZ)
	{
		CoalMob_04_NASZ = (CoalMob_04_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_05") && (5 > CoalMob_05_NASZ)
	{
		CoalMob_05_NASZ = (CoalMob_05_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_06") && (5 > CoalMob_06_NASZ)
	{
		CoalMob_06_NASZ = (CoalMob_06_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_07") && (5 > CoalMob_07_NASZ)
	{
		CoalMob_07_NASZ = (CoalMob_07_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_08") && (5 > CoalMob_08_NASZ)
	{
		CoalMob_08_NASZ = (CoalMob_08_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_09") && (5 > CoalMob_09_NASZ)
	{
		CoalMob_09_NASZ = (CoalMob_09_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_10") && (5 > CoalMob_10_NASZ)
	{
		CoalMob_10_NASZ = (CoalMob_10_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_11") && (5 > CoalMob_11_NASZ)
	{
		CoalMob_11_NASZ = (CoalMob_11_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_12") && (5 > CoalMob_12_NASZ)
	{
		CoalMob_12_NASZ = (CoalMob_12_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_13") && (5 > CoalMob_13_NASZ)
	{
		CoalMob_13_NASZ = (CoalMob_13_NASZ +1);
		return TRUE;
	}
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_14") && (5 > CoalMob_14_NASZ)
	{
		CoalMob_14_NASZ = (CoalMob_14_NASZ +1);
		return TRUE;
	}	
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_15") && (5 > CoalMob_15_NASZ)
	{
		CoalMob_15_NASZ = (CoalMob_15_NASZ +1);
		return TRUE;
	}	
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_16") && (5 > CoalMob_16_NASZ)
	{
		CoalMob_16_NASZ = (CoalMob_16_NASZ +1);
		return TRUE;
	}	
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_17") && (5 > CoalMob_17_NASZ)
	{
		CoalMob_17_NASZ = (CoalMob_17_NASZ +1);
		return TRUE;
	}	
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_18") && (5 > CoalMob_18_NASZ)
	{
		CoalMob_18_NASZ = (CoalMob_18_NASZ +1);
		return TRUE;
	}	
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_19") && (5 > CoalMob_19_NASZ)
	{
		CoalMob_19_NASZ = (CoalMob_19_NASZ +1);
		return TRUE;
	}	
	
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_20") && (5 > CoalMob_20_NASZ)
	{
		CoalMob_20_NASZ = (CoalMob_20_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_21") && (5 > CoalMob_21_NASZ)
	{
		CoalMob_21_NASZ = (CoalMob_21_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_22") && (5 > CoalMob_22_NASZ)
	{
		CoalMob_22_NASZ = (CoalMob_22_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_23") && (5 > CoalMob_23_NASZ)
	{
		CoalMob_23_NASZ = (CoalMob_23_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_24") && (5 > CoalMob_24_NASZ)
	{
		CoalMob_24_NASZ = (CoalMob_24_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_25") && (5 > CoalMob_25_NASZ)
	{
		CoalMob_25_NASZ = (CoalMob_25_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_26") && (5 > CoalMob_26_NASZ)
	{
		CoalMob_26_NASZ = (CoalMob_26_NASZ +1);
		return TRUE;
	}	

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_27") && (5 > CoalMob_27_NASZ)
	{
		CoalMob_27_NASZ = (CoalMob_27_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_28") && (5 > CoalMob_28_NASZ)
	{
		CoalMob_28_NASZ = (CoalMob_28_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_29") && (5 > CoalMob_29_NASZ)
	{
		CoalMob_29_NASZ = (CoalMob_29_NASZ +1);
		return TRUE;
	}

	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_CoalMOB_30") && (5 > CoalMob_30_NASZ)
	{
		CoalMob_30_NASZ = (CoalMob_30_NASZ +1);
		return TRUE;
	};

	return FALSE;
};

FUNC VOID Coalhacken_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_CoalHACKEN;
		Ai_ProcessInfos (her);
	};
};

//*******************************************************
//	Coalhacken Dialog abbrechen
//*******************************************************
INSTANCE PC_Coalhacken_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_Coalhacken_End_Condition;
	information		= PC_Coalhacken_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_Coalhacken_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COALHACKEN)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Coalhacken_End_Info()
{
	Truemmer_Count = 0;
	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
//	Coalhacken 
//*******************************************************
INSTANCE PC_Coalhacken_Addon_Hour (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Coalhacken_Addon_Hour_Condition;
	information		= PC_Coalhacken_Addon_Hour_Info;
	permanent		= TRUE;
	description		= "Od³up trochê."; 
};

FUNC INT PC_Coalhacken_Addon_Hour_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_COALHACKEN)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Coalhacken_Addon_Hour_Info()
{

	if (B_CoalMob_Bestimmung() == TRUE)
	{
		// WYKOPANIE
		if(LevelMiner == 100) //Nagroda, za wbicie Guru
		{
			CreateInvItems (hero, ItMi_Coal, 6);	
			PrintScreen ("Odpad³o 6 kawa³ków wêgla", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (100);
			Print(CS("Razem:",IntToString(Npc_HasItems(hero,ItMi_Coal))));
		}
		else if(LevelMiner >= 90)
		{
			CreateInvItems (hero, ItMi_Coal, 5);	
			PrintScreen ("Odpad³o 5 kawa³ków wêgla", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (75);
			Print(CS("Razem:",IntToString(Npc_HasItems(hero,ItMi_Coal))));
		}
		else if(LevelMiner >= 65)
		{
			CreateInvItems (hero, ItMi_Coal, 4);	
			PrintScreen ("Odpad³y 4 kawa³ki wêgla", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (50);
			Print(CS("Razem:",IntToString(Npc_HasItems(hero,ItMi_Coal))));
		}
		else if(LevelMiner >=40)
		{
			CreateInvItems (hero, ItMi_Coal, 3);	
			PrintScreen ("Odpad³y 3 kawa³ki wêgla", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (25);
			Print(CS("Razem:",IntToString(Npc_HasItems(hero,ItMi_Coal))));
		}
		else //if(LevelMiner >=20) 20 juz posiadasz na starcie gry
		{
			CreateInvItems (hero, ItMi_Coal, 2);	
			PrintScreen ("Odpad³y 2 kawa³ki wêgla!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (10);
			Print(CS("Razem:",IntToString(Npc_HasItems(hero,ItMi_Coal))));
		};
		
		
		
		//Bonus +5
		if(LevelMiner >= 90) && (LevelMiner <= 95)
		{
			if(CoalMob_bonus_percents == 50) // 2 uderzenia = 1 wykopanie
			{
				CoalMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				CoalMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 80)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner >= 65) && (LevelMiner <= 75)
		{
			if(CoalMob_bonus_percents == 35) // 2 uderzenia = 1 wykopanie
			{
				CoalMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				CoalMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 55)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner >= 40) && (LevelMiner <= 50)
		{
			if(CoalMob_bonus_percents == 25) // 2 uderzenia = 1 wykopanie
			{
				CoalMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				CoalMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 30)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner <=25)
		{
			if(CoalMob_bonus_percents == 15) // 2 uderzenia = 1 wykopanie
			{
				CoalMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				CoalMob_bonus_percents += 1; // 1 uderzenie
			};
		};
	}
	else
	{
		PrintScreen ("Nic nie zosta³o.", -1, -1, FONT_ScreenSmall, 2);	
		B_ENDPRODUCTIONDIALOG ();
	};
};

var int NuggetMob_01_NASZ; // TODO
var int NuggetMob_02_NASZ; // TODO
var int NuggetMob_03_NASZ; // inserted
var int NuggetMob_04_NASZ; // inserted
var int NuggetMob_05_NASZ; // inserted
var int NuggetMob_06_NASZ; // inserted
var int NuggetMob_07_NASZ; // inserted
var int NuggetMob_08_NASZ; // inserted
var int NuggetMob_09_NASZ; // inserted
var int NuggetMob_10_NASZ; // inserted
var int NuggetMob_11_NASZ; // inserted
var int NuggetMob_12_NASZ; // inserted
var int NuggetMob_13_NASZ; // inserted
var int NuggetMob_14_NASZ; // inserted
var int NuggetMob_15_NASZ; // inserted
var int NuggetMob_16_NASZ; // inserted
var int NuggetMob_17_NASZ; // inserted
var int NuggetMob_18_NASZ; // inserted
var int NuggetMob_19_NASZ; // TODO
var int NuggetMob_20_NASZ; // TODO

var int NuggetMob_bonus_percents;

FUNC INT B_NuggetMob_Bestimmung()
{
	//bin ich mobsi X und habe ich noch Nugget übrig?
	if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_01") && (2 > NuggetMob_01_NASZ)
	{
		NuggetMob_01_NASZ = (NuggetMob_01_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_02") && (2 > NuggetMob_02_NASZ)
	{
		NuggetMob_02_NASZ = (NuggetMob_02_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NUGGETMOB_03") && (2 > NuggetMob_03_NASZ)
	{
		NuggetMob_03_NASZ = (NuggetMob_03_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NUGGETMOB_04") && (2 > NuggetMob_04_NASZ)
	{
		NuggetMob_04_NASZ = (NuggetMob_04_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_05") && (2 > NuggetMob_05_NASZ)
	{
		NuggetMob_05_NASZ = (NuggetMob_05_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_06") && (2 > NuggetMob_06_NASZ)
	{
		NuggetMob_06_NASZ = (NuggetMob_06_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_07") && (2 > NuggetMob_07_NASZ)
	{
		NuggetMob_07_NASZ = (NuggetMob_07_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_08") && (2 > NuggetMob_08_NASZ)
	{
		NuggetMob_08_NASZ = (NuggetMob_08_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_09") && (2 > NuggetMob_09_NASZ)
	{
		NuggetMob_09_NASZ = (NuggetMob_09_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_10") && (2 > NuggetMob_10_NASZ)
	{
		NuggetMob_10_NASZ = (NuggetMob_10_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_11") && (2 > NuggetMob_11_NASZ)
	{
		NuggetMob_11_NASZ = (NuggetMob_11_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_12") && (2 > NuggetMob_12_NASZ)
	{
		NuggetMob_12_NASZ = (NuggetMob_12_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_13") && (2 > NuggetMob_13_NASZ)
	{
		NuggetMob_13_NASZ = (NuggetMob_13_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_14") && (2 > NuggetMob_14_NASZ)
	{
		NuggetMob_14_NASZ = (NuggetMob_14_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_15") && (2 > NuggetMob_15_NASZ)
	{
		NuggetMob_15_NASZ = (NuggetMob_15_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_16") && (2 > NuggetMob_16_NASZ)
	{
		NuggetMob_16_NASZ = (NuggetMob_16_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_17") && (2 > NuggetMob_17_NASZ)
	{
		NuggetMob_17_NASZ = (NuggetMob_17_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_18") && (2 > NuggetMob_18_NASZ)
	{
		NuggetMob_18_NASZ = (NuggetMob_18_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_19") && (2 > NuggetMob_19_NASZ)
	{
		NuggetMob_19_NASZ = (NuggetMob_19_NASZ +1);
		return TRUE;
	}
	else if Hlp_StrCmp (Npc_GetNearestWP (self), "NASZ_NuggetMOB_20") && (2 > NuggetMob_20_NASZ)
	{
		NuggetMob_20_NASZ = (NuggetMob_20_NASZ +1);
		return TRUE;
	};

	
	return FALSE;
};

FUNC VOID Nuggethacken_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_NuggetHACKEN;
		Ai_ProcessInfos (her);
	};
};

//*******************************************************
//	Nuggethacken Dialog abbrechen
//*******************************************************
INSTANCE PC_Nuggethacken_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_Nuggethacken_End_Condition;
	information		= PC_Nuggethacken_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_Nuggethacken_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_NUGGETHACKEN)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Nuggethacken_End_Info()
{
	Truemmer_Count = 0;
	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
//	Nuggethacken 
//*******************************************************
INSTANCE PC_Nuggethacken_Addon_Hour (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_Nuggethacken_Addon_Hour_Condition;
	information		= PC_Nuggethacken_Addon_Hour_Info;
	permanent		= TRUE;
	description		= "Od³up trochê."; 
};

FUNC INT PC_Nuggethacken_Addon_Hour_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_NUGGETHACKEN)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Nuggethacken_Addon_Hour_Info()
{
	if (B_NuggetMob_Bestimmung() == TRUE)
	{
		// WYKOPANIE
		if(LevelMiner == 100) //Nagroda, za wbicie Guru
		{
			CreateInvItems (hero, ItMi_Nugget, 3);	
			PrintScreen ("Odpad³y 3 bry³ki rudy!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (250);
		}
		else if(LevelMiner >= 90)
		{
			CreateInvItems (hero, ItMi_Nugget, 2);	
			PrintScreen ("Odpad³y 2 bry³ki rudy!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (200);
		}
		else if(LevelMiner >= 65)
		{
			CreateInvItems (hero, ItMi_Nugget, 2);	
			PrintScreen ("Odpad³y 2 bry³ki rudy!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (150);
		}
		else if(LevelMiner >=40)
		{
			CreateInvItems (hero, ItMi_Nugget, 1);	
			PrintScreen ("Odpad³a 1 bry³ka rudy!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (100);
		}
		else //if(LevelMiner >=20) 20 juz posiadasz na starcie gry
		{
			CreateInvItems (hero, ItMi_Nugget, 1);	
			PrintScreen ("Odpad³a 1 bry³ka rudy!", -1, -1, FONT_ScreenSmall, 2);
			B_GivePlayerXP (50);
		};
		
		
		
		//Bonus +5
		if(LevelMiner >= 90) && (LevelMiner <= 95)
		{
			if(NuggetMob_bonus_percents == 20) // 2 uderzenia = 1 wykopanie
			{
				NuggetMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				NuggetMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 80)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner >= 65) && (LevelMiner <= 75)
		{
			if(NuggetMob_bonus_percents == 14) // 2 uderzenia = 1 wykopanie
			{
				NuggetMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				NuggetMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 55)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner >= 40) && (LevelMiner <= 50)
		{
			if(NuggetMob_bonus_percents == 10) // 2 uderzenia = 1 wykopanie
			{
				NuggetMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				NuggetMob_bonus_percents += 1; // 1 uderzenie
			};
		}
		else if(LevelMiner == 30)
		{
			NeedTeacherMine();
		}
		else if(LevelMiner <=25)
		{
			if(NuggetMob_bonus_percents == 6) // 2 uderzenia = 1 wykopanie
			{
				NuggetMob_bonus_percents = 0;
				LevelMiner += 5;
				PrintScreen ("Górnictwo + 5%", -1, 52, FONT_Screen, 2);
			}
			else
			{
				NuggetMob_bonus_percents += 1; // 1 uderzenie
			};
		};
	}
	else
	{
		PrintScreen ("Nic nie zosta³o.", -1, -1, FONT_ScreenSmall, 2);	
		B_ENDPRODUCTIONDIALOG ();
	};
};

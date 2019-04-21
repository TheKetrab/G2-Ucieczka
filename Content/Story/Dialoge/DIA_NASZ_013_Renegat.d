//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_013_Renegat_EXIT   (C_INFO)
{
	npc         = NASZ_013_Renegat;
	nr          = 999;
	condition   = DIA_NASZ_013_Renegat_EXIT_Condition;
	information = DIA_NASZ_013_Renegat_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_013_Renegat_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_013_Renegat_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_013_Renegat_siema   (C_INFO)
{
	npc         = NASZ_013_Renegat;
 	nr          = 1;
 	condition   = DIA_NASZ_013_Renegat_siema_Condition;
 	information = DIA_NASZ_013_Renegat_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_013_Renegat_siema_Condition()
{
	if (WillWantToKillRenegats == FALSE) && !(Hlp_GetInstanceID(hero) == Hlp_GetInstanceID(Meatbug))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_013_Renegat_siema_Info()
{
	
	AI_Output (self, other,"DIA_NASZ_013_Renegat_siema_15_00"); //Uciekasz? Dalej nie przejdziesz.
	AI_Output (self, other,"DIA_NASZ_013_Renegat_siema_15_01"); //Alarm!

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_KILL, 1);
	B_Attack (NASZ_006_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_011_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_009_Marcos, other, AR_KILL, 1);
	B_Attack (NASZ_014_Renegat, other, AR_KILL, 1);

};

//*********************************************************************
//	Info Kill
//*********************************************************************
INSTANCE DIA_NASZ_013_Renegat_kill   (C_INFO)
{
	npc         = NASZ_013_Renegat;
 	nr          = 2;
 	condition   = DIA_NASZ_013_Renegat_kill_Condition;
 	information = DIA_NASZ_013_Renegat_kill_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_013_Renegat_kill_Condition()
{
	if (WillWantToKillRenegats == TRUE)
	&& !(Hlp_GetInstanceID(hero) == Hlp_GetInstanceID(Meatbug))
	&& (WillUzylPrzemianyWChrzaszcza == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_013_Renegat_kill_Info()
{
	AI_Output (self, other,"DIA_NASZ_013_Renegat_kill_15_00"); //Kogo my tu mamy? Stêskniliœmy siê za tob¹.
	HeroSayIMissedYou();
	AI_Output (self, other,"DIA_NASZ_013_Renegat_kill_15_02"); //Zabawne! Marcos, patrz, kto przyszed³.
	AI_GotoWP (NASZ_009_Marcos, "OW_PATH_148_A");
	Npc_ExchangeRoutine (NASZ_011_Renegat, "GoToStart");
	AI_LookAtNpc (NASZ_013_Renegat, NASZ_009_Marcos);
	AI_LookAtNpc (NASZ_009_Marcos, NASZ_013_Renegat);
	AI_Output (self, other,"DIA_NASZ_013_Renegat_kill_15_03"); //Nasz przyjaciel chce siê nas pozbyæ. Powiesz mu, co o tym myœlimy?
	AI_StopProcessInfos (self);
};

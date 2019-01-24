
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_121_Straznik_EXIT   (C_INFO)
{
	npc         = NASZ_121_Straznik;
	nr          = 999;
	condition   = DIA_NASZ_121_Straznik_EXIT_Condition;
	information = DIA_NASZ_121_Straznik_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_121_Straznik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_121_Straznik_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_121_Straznik_siema   (C_INFO)
{
	npc         = NASZ_121_Straznik;
 	nr          = 1;
 	condition   = DIA_NASZ_121_Straznik_siema_Condition;
 	information = DIA_NASZ_121_Straznik_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_121_Straznik_siema_Condition()
{
	if (WejscieDoObozuLowcow == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_121_Straznik_siema_Info()
{

	AI_Output (self, other,"DIA_NASZ_121_Straznik_siema_55_00"); //Nowy? Udaj siê od razu do szefa. Znajdziesz go w cha³upie za karczm¹.
	AI_Output (self, other,"DIA_NASZ_121_Straznik_siema_55_01"); //A teraz wybacz, ale muszê byæ czujny.

	WejscieDoObozuLowcow = TRUE;
	AI_StopProcessInfos (self);
	
};

//*********************************************************************
//	Info Hello2
//*********************************************************************
INSTANCE DIA_NASZ_121_Straznik_siema2   (C_INFO)
{
	npc         = NASZ_121_Straznik;
 	nr          = 2;
 	condition   = DIA_NASZ_121_Straznik_siema2_Condition;
 	information = DIA_NASZ_121_Straznik_siema2_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_121_Straznik_siema2_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
		&& (WejscieDoObozuLowcow == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_121_Straznik_siema2_Info()
{

	AI_Output (self, other,"DIA_NASZ_121_Straznik_siema2_15_00"); //Nie mam czasu.

	AI_StopProcessInfos (self);
		
};

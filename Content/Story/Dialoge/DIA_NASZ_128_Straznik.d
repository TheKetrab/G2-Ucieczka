
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_128_Straznik_EXIT   (C_INFO)
{
	npc         = NASZ_128_Straznik;
	nr          = 999;
	condition   = DIA_NASZ_128_Straznik_EXIT_Condition;
	information = DIA_NASZ_128_Straznik_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_128_Straznik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_128_Straznik_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello2
//*********************************************************************
INSTANCE DIA_NASZ_128_Straznik_siema2   (C_INFO)
{
	npc         = NASZ_128_Straznik;
 	nr          = 2;
 	condition   = DIA_NASZ_128_Straznik_siema2_Condition;
 	information = DIA_NASZ_128_Straznik_siema2_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_128_Straznik_siema2_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_128_Straznik_siema2_Info()
{

	AI_Output (self, other,"DIA_NASZ_128_Straznik_siema2_15_00"); //Nie mam czasu.

	AI_StopProcessInfos (self);
		
};

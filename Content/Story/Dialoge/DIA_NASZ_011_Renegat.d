
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_011_Renegat_EXIT   (C_INFO)
{
	npc         = NASZ_011_Renegat;
	nr          = 999;
	condition   = DIA_NASZ_011_Renegat_EXIT_Condition;
	information = DIA_NASZ_011_Renegat_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_011_Renegat_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_011_Renegat_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_011_Renegat_siema   (C_INFO)
{
	npc         = NASZ_011_Renegat;
 	nr          = 1;
 	condition   = DIA_NASZ_011_Renegat_siema_Condition;
 	information = DIA_NASZ_011_Renegat_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_011_Renegat_siema_Condition()
{
	if (Hlp_GetInstanceID(hero) == Hlp_GetInstanceID(hero))
		&& (Npc_GetDistToWP	(self, "TWIERDZA") > 10000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_011_Renegat_siema_Info()
{
	
	AI_Output (self, other,"DIA_NASZ_011_Renegat_siema_15_00"); //Uciekasz? Dalej nie przejdziesz.
	AI_Output (self, other,"DIA_NASZ_011_Renegat_siema_15_01"); //Alarm!

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_KILL, 1);
	B_Attack (NASZ_006_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_013_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_009_Marcos, other, AR_KILL, 1);
	B_Attack (NASZ_014_Renegat, other, AR_KILL, 1);

};

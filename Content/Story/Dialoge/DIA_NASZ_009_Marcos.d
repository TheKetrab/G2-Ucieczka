//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_009_Marcos_EXIT   (C_INFO)
{
	npc         = NASZ_009_Marcos;
	nr          = 999;
	condition   = DIA_NASZ_009_Marcos_EXIT_Condition;
	information = DIA_NASZ_009_Marcos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_009_Marcos_EXIT_Condition()
{
	if (Npc_GetDistToWP(self,"NASZ_KOPALNIA_NOWY_20") > 2000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_009_Marcos_EXIT_Info()
{
	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine (NASZ_005_Ben, "After");
	
	self.flags = 1;
	self.guild = GIL_BDT;
	Npc_SetTrueGuild (self, GIL_BDT);
	NASZ_006_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_006_Renegat, GIL_BDT);
	NASZ_011_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_011_Renegat, GIL_BDT);
	NASZ_013_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_013_Renegat, GIL_BDT);
	NASZ_014_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_014_Renegat, GIL_BDT);

	B_Attack (self, other, AR_KILL, 1);
	B_Attack (NASZ_006_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_011_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_013_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_014_Renegat, other, AR_KILL, 1);

};

//*********************************************************************
//	Info EXIT2
//*********************************************************************
INSTANCE DIA_NASZ_009_Marcos_EXIT2   (C_INFO)
{
	npc         = NASZ_009_Marcos;
	nr          = 998;
	condition   = DIA_NASZ_009_Marcos_EXIT2_Condition;
	information = DIA_NASZ_009_Marcos_EXIT2_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_009_Marcos_EXIT2_Condition()
{
	if (Npc_GetDistToWP(self,"NASZ_KOPALNIA_NOWY_20") < 2000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_009_Marcos_EXIT2_Info()
{
	AI_StopProcessInfos (self);
};



//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_009_Marcos_siema   (C_INFO)
{
	npc         = NASZ_009_Marcos;
 	nr          = 1;
 	condition   = DIA_NASZ_009_Marcos_siema_Condition;
 	information = DIA_NASZ_009_Marcos_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_009_Marcos_siema_Condition()
{
	if (WillWantToKillRenegats == FALSE) && (Npc_GetDistToWP(self,"NASZ_KOPALNIA_NOWY_20") > 2000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_009_Marcos_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_009_Marcos_siema_55_00"); //Jedyna droga ucieczki prowadzi do Królestwa Beliara!
	Npc_ExchangeRoutine (NASZ_011_Renegat, "GoToStart");
	
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_KILL, 1);
	B_Attack (NASZ_006_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_011_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_013_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_014_Renegat, other, AR_KILL, 1);

};

//*********************************************************************
//	Info KILL
//*********************************************************************
INSTANCE DIA_NASZ_009_Marcos_kill   (C_INFO)
{
	npc         = NASZ_009_Marcos;
 	nr          = 2;
 	condition   = DIA_NASZ_009_Marcos_kill_Condition;
 	information = DIA_NASZ_009_Marcos_kill_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_009_Marcos_kill_Condition()
{
	if (WillWantToKillRenegats == TRUE) && !(Hlp_GetInstanceID(hero) == Hlp_GetInstanceID(Meatbug))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_009_Marcos_kill_Info()
{
	AI_Output (self, other,"DIA_NASZ_009_Marcos_kill_55_00"); //Wróci³eœ Willu...
	AI_Output (other, self,"DIA_NASZ_009_Marcos_kill_55_01"); //Nadszed³ kres twoich postêpowañ! Szykuj siê na œmieræ!
	AI_Output (self, other,"DIA_NASZ_009_Marcos_kill_55_02"); //Próbuj wiêc.

};

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_399_Moly_EXIT   (C_INFO)
{
	npc         = NASZ_399_Moly;
	nr          = 999;
	condition   = DIA_NASZ_399_Moly_EXIT_Condition;
	information = DIA_NASZ_399_Moly_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_399_Moly_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_399_Moly_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Me
//*********************************************************************
INSTANCE DIA_NASZ_399_Moly_me   (C_INFO)
{
	npc         = NASZ_399_Moly;
 	nr          = 1;
 	condition   = DIA_NASZ_399_Moly_me_Condition;
 	information = DIA_NASZ_399_Moly_me_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_399_Moly_me_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
	&& (!PERROTOWCA))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_399_Moly_me_Info()
{
	B_LieselMaeh();

	AI_StopProcessInfos (self);	
};

//*********************************************************************
//	Info Follow
//*********************************************************************
INSTANCE DIA_NASZ_399_Moly_follow   (C_INFO)
{
	npc         = NASZ_399_Moly;
 	nr          = 2;
 	condition   = DIA_NASZ_399_Moly_follow_Condition;
 	information = DIA_NASZ_399_Moly_follow_Info;
 	permanent   = FALSE;
 	description = "Chodü za mnπ.";
};

FUNC INT DIA_NASZ_399_Moly_follow_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_306_Perrot_ok))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_399_Moly_follow_Info()
{
	AI_Output (other,self ,"DIA_NASZ_399_Moly_follow_15_00"); //Chodü za mnπ.
	B_LieselMaeh();

	Npc_ExchangeRoutine (self, "Follow");
	AI_StopProcessInfos (self);	
};

//*********************************************************************
//	Info Second
//*********************************************************************
INSTANCE DIA_NASZ_399_Moly_second   (C_INFO)
{
	npc         = NASZ_399_Moly;
 	nr          = 3;
 	condition   = DIA_NASZ_399_Moly_second_Condition;
 	information = DIA_NASZ_399_Moly_second_Info;
 	permanent   = FALSE;
 	description = "To tutaj. Bπdü grzeczna.";
};

FUNC INT DIA_NASZ_399_Moly_second_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_399_Moly_follow)
	&& Npc_GetDistToWP	(self, "OW_PATH_07_15_CAVE3") < 750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_399_Moly_second_Info()
{
	AI_Output (other,self ,"DIA_NASZ_399_Moly_second_15_00"); //To tutaj. Bπdü grzeczna.
	B_LieselMaeh();
	AI_Output (other,self ,"DIA_NASZ_399_Moly_second_15_02"); //Mam nadziejÍ, øe to znaczy≥o "jasne"...

	MolyMozeSieTepnac = FALSE;
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.aivar[AIV_TAPOSITION] = TRUE;
	self.wp = "TOT";
	self.start_aistate = ZS_MM_AllScheduler; 

	B_LogEntry (TOPIC_Perrot_owca, "Przyprowadzi≥em owcÍ Moly w bezpieczne miejsce.");
		
	Npc_ExchangeRoutine (self, "Second");
	PERROTOWCA = FALSE;
	AI_StopProcessInfos (self);	
};

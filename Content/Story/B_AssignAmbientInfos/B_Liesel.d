func void FollowSheep_Mee() {
	AI_Output (self, other,"DIA_Follow_Sheep_me_15_00"); //Meee!
};

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Follow_Sheep_EXIT   (C_INFO)
{
	npc         = Follow_Sheep;
	nr          = 999;
	condition   = DIA_Follow_Sheep_EXIT_Condition;
	information = DIA_Follow_Sheep_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Follow_Sheep_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Follow_Sheep_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Me
//*********************************************************************
INSTANCE DIA_Follow_Sheep_me   (C_INFO)
{
	npc         = Follow_Sheep;
 	nr          = 1;
 	condition   = DIA_Follow_Sheep_me_Condition;
 	information = DIA_Follow_Sheep_me_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_Follow_Sheep_me_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
	&& (!PERROTOWCA))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Follow_Sheep_me_Info()
{
	FollowSheep_Mee();
	AI_StopProcessInfos (self);	
};


//*********************************************************************
//	Info Follow
//*********************************************************************
INSTANCE DIA_Follow_Sheep_follow   (C_INFO)
{
	npc         = Follow_Sheep;
 	nr          = 2;
 	condition   = DIA_Follow_Sheep_follow_Condition;
 	information = DIA_Follow_Sheep_follow_Info;
 	permanent   = FALSE;
 	description = "Chodü za mnπ.";
};

FUNC INT DIA_Follow_Sheep_follow_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_306_Perrot_ok))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Follow_Sheep_follow_Info()
{
	AI_Output (other,self ,"DIA_Follow_Sheep_follow_15_00"); //Chodü za mnπ.
	FollowSheep_Mee();
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	//Npc_ExchangeRoutine (self, "Follow");
	AI_StopProcessInfos (self);	
	
	Wld_InsertNpc	(Gobbo_Skeleton,"FP_PERROT_1");
	Wld_InsertNpc	(Gobbo_Skeleton,"FP_PERROT_2");
	Wld_InsertNpc	(Gobbo_Skeleton,"FP_ROAM_OW_SNAPPER_CANYONCAVE5");
	Wld_InsertNpc	(Gobbo_Skeleton,"FP_ROAM_OW_SNAPPER_CANYONCAVE4");
};

//*********************************************************************
//	Info Second
//*********************************************************************
INSTANCE DIA_Follow_Sheep_second   (C_INFO)
{
	npc         = Follow_Sheep;
 	nr          = 3;
 	condition   = DIA_Follow_Sheep_second_Condition;
 	information = DIA_Follow_Sheep_second_Info;
 	permanent   = FALSE;
 	description = "To tutaj. Bπdü grzeczna.";
};

FUNC INT DIA_Follow_Sheep_second_Condition()
{
	if (npc_knowsinfo (other, DIA_Follow_Sheep_follow)
	&& Npc_GetDistToWP	(self, "OW_PATH_07_15_CAVE3") < 750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Follow_Sheep_second_Info()
{
	AI_Output (other,self ,"DIA_Follow_Sheep_second_15_00"); //To tutaj. Bπdü grzeczna.
	FollowSheep_Mee();
	AI_Output (other,self ,"DIA_Follow_Sheep_second_15_02"); //Mam nadziejÍ, øe to znaczy≥o "jasne"...

	MolyMozeSieTepnac = TRUE;
	ff_applyonceext(TPMoly,1000,-1);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.aivar[AIV_TAPOSITION] = TRUE;
	self.wp = "TOT";
	self.start_aistate = ZS_MM_AllScheduler; 

	B_GivePlayerXP(100);
	B_LogEntry (TOPIC_Perrot_owca, "Przyprowadzi≥em owcÍ Moly w bezpieczne miejsce.");
		
	Npc_ExchangeRoutine (self, "Second");
	PERROTOWCA = FALSE;
	AI_StopProcessInfos (self);	
};

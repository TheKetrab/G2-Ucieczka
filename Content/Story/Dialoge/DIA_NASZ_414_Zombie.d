//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_414_Zombie_EXIT   (C_INFO)
{
	npc         = NASZ_414_Zombie;
	nr          = 999;
	condition   = DIA_NASZ_414_Zombie_EXIT_Condition;
	information = DIA_NASZ_414_Zombie_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_414_Zombie_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_414_Zombie_EXIT_Info()
{
	AI_StopProcessInfos (self);

};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_414_Zombie_siema   (C_INFO)
{
	npc         = NASZ_414_Zombie;
 	nr          = 1;
 	condition   = DIA_NASZ_414_Zombie_siema_Condition;
 	information = DIA_NASZ_414_Zombie_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_414_Zombie_siema_Condition()
{
	return TRUE;

};

FUNC VOID DIA_NASZ_414_Zombie_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_414_Zombie_siema_15_00"); //AAARG! AAA. AAGRRRR!
	
	AI_StopProcessInfos (self);
	B_Attack (NASZ_414_Zombie, other, AR_KILL, 1);
	
	NASZ_414_Zombie.guild = GIL_ZOMBIE;
	Npc_SetTrueGuild (NASZ_414_Zombie, GIL_ZOMBIE);

};

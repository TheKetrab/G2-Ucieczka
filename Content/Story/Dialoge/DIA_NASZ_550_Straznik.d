//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_550_Straznik_EXIT   (C_INFO)
{
	npc         = NASZ_550_Straznik;
	nr          = 999;
	condition   = DIA_NASZ_550_Straznik_EXIT_Condition;
	information = DIA_NASZ_550_Straznik_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_550_Straznik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_550_Straznik_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_550_Straznik_siema   (C_INFO)
{
	npc         = NASZ_550_Straznik;
 	nr          = 1;
 	condition   = DIA_NASZ_550_Straznik_siema_Condition;
 	information = DIA_NASZ_550_Straznik_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_550_Straznik_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_550_Straznik_siema_Info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output (self, other,"DIA_NASZ_550_Straznik_siema_15_00"); //KURO'K DE GASH!
	AI_Output (self, other,"DIA_NASZ_550_Straznik_siema_15_01"); //KARA PA DE NA HOSSESA. AGRA!
	AI_Output (other, self,"DIA_NASZ_550_Straznik_siema_15_02"); //Ju¿ ja ci poka¿ê to twoje 'AGRA'.
	AI_ReadyMeleeWeapon(other);

	FinalBattleStarted = TRUE;
	ff_applyonceext(Function15s,15000,-1);
	
	NASZ_550_Straznik.guild = GIL_UNDEADORC;
	Npc_SetTrueGuild (NASZ_550_Straznik, GIL_UNDEADORC);
	
	WojownicyCieniaPrzyzwani = 0;
	
	AI_StopProcessInfos (self);	
	B_Attack (NASZ_550_Straznik, hero, AR_KILL, 1);
	
	// zamyka kraty
	Wld_SendTrigger ("MOVER_ORCCITY_30");
	Wld_SendTrigger ("MOVER_ORCCITY_31");
	Wld_SendTrigger ("MOVER_ORCCITY_32");
	Wld_SendTrigger ("MOVER_ORCCITY_33");
	Wld_SendTrigger ("MOVER_ORCCITY_34");
	Wld_SendTrigger ("MOVER_ORCCITY_35");
	
};
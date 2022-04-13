// ************************************************************
// 	  				   EXIT
// ************************************************************

INSTANCE DIA_NASZ_406_Straznik_EXIT(C_INFO)
{
	npc			= NASZ_406_Straznik;
	nr			= 999;
	condition	= DIA_NASZ_406_Straznik_EXIT_Condition;
	information	= DIA_NASZ_406_Straznik_EXIT_Info;
	permanent	= FALSE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_NASZ_406_Straznik_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NASZ_406_Straznik_EXIT_Info()
{	
	Wld_InsertNpc	(SkeletonStraznikD,"FP_ROAM_OW_SNAPPER_OW_ORC5"); 
	Wld_InsertNpc	(SkeletonStraznikE,"FP_ROAM_OW_SNAPPER_OW_ORC7"); 
	
	NASZ_406_Straznik.guild = GIL_SKELETON;
	Npc_SetTrueGuild (NASZ_406_Straznik, GIL_SKELETON);
	AI_StopProcessInfos (self);
	B_Attack(NASZ_406_Straznik,hero,AR_KILL,1);	

};	
///////////////////////////////////////////////////////////////////////
//	Info Moc
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_406_Straznik_Moc		(C_INFO)
{
	npc		= 	NASZ_406_Straznik;
	nr		= 	1;
	condition	= 	DIA_NASZ_406_Straznik_Moc_Condition;
	information	= 	DIA_NASZ_406_Straznik_Moc_Info;
	permanent	=	FALSE;
	important	=	TRUE;
	
};

func int DIA_NASZ_406_Straznik_Moc_Condition ()
{
		return TRUE;	
};

func void DIA_NASZ_406_Straznik_Moc_Info ()
{

	Wld_PlayEffect("SPELLFX_massdeath",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_incovation_blue",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_lightstar_white",  hero, hero, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	
	AI_Output			(self ,other, "DIA_NASZ_406_Straznik_Moc_19_00"); //Kolejny, który próbuje wykraœæ mój skarb?
	AI_Output			(self ,other, "DIA_NASZ_406_Straznik_Moc_19_01"); //Ludzie. Jesteœcie tacy niepowa¿ni! Zginiesz!

	B_LogEntry (TOPIC_Niedostepny_Klif, "Stra¿nik krypty pod wulkanem chroni artefaktu. Muszê go zabiæ i zabraæ to, co potrzebujê.");
	
};

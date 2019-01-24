// ************************************************************
// 	  				   EXIT
// ************************************************************

INSTANCE DIA_NASZ_407_Straznik_EXIT(C_INFO)
{
	npc			= NASZ_407_Straznik;
	nr			= 999;
	condition	= DIA_NASZ_407_Straznik_EXIT_Condition;
	information	= DIA_NASZ_407_Straznik_EXIT_Info;
	permanent	= FALSE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_NASZ_407_Straznik_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NASZ_407_Straznik_EXIT_Info()
{	
	Wld_InsertNpc	(SkeletonStraznikA,"FP_ROAM_ITEM_SPECIAL_03"); 
	Wld_InsertNpc	(SkeletonStraznikB,"FP_ROAM_PLATEAU_ROUND02_CAVE_MOVE_01"); 
	Wld_InsertNpc	(SkeletonStraznikC,"FP_ROAM_PLATEAU_ROUND02_CAVE_MOVE_02"); 
	
	NASZ_407_Straznik.guild = GIL_SKELETON;
	Npc_SetTrueGuild (NASZ_407_Straznik, GIL_SKELETON);
	AI_StopProcessInfos (self);
	B_Attack(NASZ_407_Straznik,hero,AR_KILL,1);	

};	
///////////////////////////////////////////////////////////////////////
//	Info Sila
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_407_Straznik_Sila		(C_INFO)
{
	npc		= 	NASZ_407_Straznik;
	nr		= 	1;
	condition	= 	DIA_NASZ_407_Straznik_Sila_Condition;
	information	= 	DIA_NASZ_407_Straznik_Sila_Info;
	permanent	=	FALSE;
	important	=	TRUE;
	
};

func int DIA_NASZ_407_Straznik_Sila_Condition ()
{
		return TRUE;	
};

func void DIA_NASZ_407_Straznik_Sila_Info ()
{
	Wld_PlayEffect("SPELLFX_massdeath",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_incovation_blue",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_lightstar_white",  hero, hero, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");
	
	AI_Output			(self ,other, "DIA_NASZ_407_Straznik_Sila_19_00"); //Jestem stra�nikiem �ywio�u si�y i krzepy.
	AI_Output			(self ,other, "DIA_NASZ_407_Straznik_Sila_19_01"); //Nie wiem, co tu robisz �miertelniku, ale zginiesz!
	AI_Output			(other, self, "DIA_NASZ_407_Straznik_Sila_55_02"); //Odezwa� si� ten co ju� umar�...

	B_LogEntry (TOPIC_Niedostepny_Klif, "W okolicy g�rskiej fortecy znalaz�em krypt�. Stra�nik wydaje si� chowa� tu artefakt.");

};

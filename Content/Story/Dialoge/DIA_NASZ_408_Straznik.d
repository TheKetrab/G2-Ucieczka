// ************************************************************
// 	  				   EXIT
// ************************************************************

INSTANCE DIA_NASZ_408_Straznik_EXIT(C_INFO)
{
	npc			= NASZ_408_Straznik;
	nr			= 999;
	condition	= DIA_NASZ_408_Straznik_EXIT_Condition;
	information	= DIA_NASZ_408_Straznik_EXIT_Info;
	permanent	= FALSE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_NASZ_408_Straznik_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NASZ_408_Straznik_EXIT_Info()
{	
	Wld_InsertNpc	(FireWaran,"FP_SLEEP_OW_MOLERAT_SWAHUT"); 

	NASZ_408_Straznik.guild = GIL_SKELETON;
	Npc_SetTrueGuild (NASZ_408_Straznik, GIL_SKELETON);
	AI_StopProcessInfos (self);
	B_Attack(NASZ_408_Straznik,hero,AR_KILL,1);	

};	
///////////////////////////////////////////////////////////////////////
//	Info Odpornosc
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_408_Straznik_Odpornosc		(C_INFO)
{
	npc		= 	NASZ_408_Straznik;
	nr		= 	1;
	condition	= 	DIA_NASZ_408_Straznik_Odpornosc_Condition;
	information	= 	DIA_NASZ_408_Straznik_Odpornosc_Info;
	permanent	=	FALSE;
	important	=	TRUE;
	
};

func int DIA_NASZ_408_Straznik_Odpornosc_Condition ()
{
	return TRUE;	
};

func void DIA_NASZ_408_Straznik_Odpornosc_Info ()
{
	Wld_PlayEffect("SPELLFX_massdeath",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_incovation_blue",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_lightstar_white",  hero, hero, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");
	
	AI_Output			(self ,other, "DIA_NASZ_408_Straznik_Odpornosc_19_00"); //Aaa! Ukradli�cie mi m�j skarb. Wy, ludzie!
	AI_Output			(self ,other, "DIA_NASZ_408_Straznik_Odpornosc_19_01"); //B�dziesz pierwszym, kt�ry mi za to zap�aci!

	B_LogEntry (TOPIC_Niedostepny_Klif, "Stra�nik krypty twierdzi, �e kto� wykrad� mu jego cz�� artefaktu. Czy�by go nie mia�? A w takim razie kto go ma? �owcy ork�w?");
	
};

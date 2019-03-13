// ************************************************************
// 	  				   EXIT
// ************************************************************

INSTANCE DIA_NASZ_409_Nieznany_EXIT(C_INFO)
{
	npc			= NASZ_409_Nieznany;
	nr			= 999;
	condition	= DIA_NASZ_409_Nieznany_EXIT_Condition;
	information	= DIA_NASZ_409_Nieznany_EXIT_Info;
	permanent	= FALSE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_NASZ_409_Nieznany_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NASZ_409_Nieznany_EXIT_Info()
{	
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_EXIT_19_00"); //¯egnaj, na tym œwiecie nic ju¿ nie zdzia³asz.
	
	NASZ_409_Nieznany.guild = GIL_SKELETON;
	Npc_SetTrueGuild (NASZ_409_Nieznany, GIL_SKELETON);
	AI_StopProcessInfos (self);	
	B_Attack(self,other,AR_KILL,1);

	B_StartOtherRoutine (NASZ_309_Straznik,"Start");
	B_StartOtherRoutine (NASZ_310_Bandzior,"Start");
	B_StartOtherRoutine (NASZ_313_Bandzior,"Start");
	B_StartOtherRoutine (NASZ_305_Rabon,"Start");
	
	AI_StopProcessInfos (self);	

};	
///////////////////////////////////////////////////////////////////////
//	Info Kto
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_409_Nieznany_kto		(C_INFO)
{
	npc		= 	NASZ_409_Nieznany;
	nr		= 	1;
	condition	= 	DIA_NASZ_409_Nieznany_kto_Condition;
	information	= 	DIA_NASZ_409_Nieznany_kto_Info;
	permanent	=	FALSE;
	important	=	TRUE;
	
};

func int DIA_NASZ_409_Nieznany_kto_Condition ()
{
		return TRUE;	
};

func void DIA_NASZ_409_Nieznany_kto_Info ()
{
	Wld_PlayEffect("SPELLFX_massdeath",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_incovation_blue",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_lightstar_white",  hero, hero, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_00"); //Co?! Kim¿e ty jesteœ?
	AI_Output			(other, self, "DIA_NASZ_409_Nieznany_kto_19_01"); //To chyba ja powinienem siê o to zapytaæ.
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_02"); //Moje imiê nie jest istotne.
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_03"); //Wiedz jednak, ¿e strzegê potê¿nego amuletu, który nie powinien wpaœæ w rêce takiego œmiertelnika, jak ty.
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_04"); //Zawróæ albo bêdzie za póŸno!					
																																	
	AI_Output			(other, self, "DIA_NASZ_409_Nieznany_kto_19_05"); //Có¿, chyba nici ze wspólnego wypadu na ry¿ówkê. Przyby³em tu, aby ci go odebraæ.
	// nieznajomy siê œmieje
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_06"); //Widzê, ¿e nie czujesz powagi sytuacji. Tym samym wydajesz na siebie wyrok, nieznajomy.
	

	B_LogEntry (TOPIC_Niedostepny_Klif, "No¿ cholera, wszystko musi siê komplikowaæ! Okaza³o siê, ¿e amuletu strze¿e jakiœ facet w czarnej szacie.");
	
};



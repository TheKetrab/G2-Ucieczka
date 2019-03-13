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
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_EXIT_19_00"); //�egnaj, na tym �wiecie nic ju� nie zdzia�asz.
	
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
	
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_00"); //Co?! Kim�e ty jeste�?
	AI_Output			(other, self, "DIA_NASZ_409_Nieznany_kto_19_01"); //To chyba ja powinienem si� o to zapyta�.
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_02"); //Moje imi� nie jest istotne.
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_03"); //Wiedz jednak, �e strzeg� pot�nego amuletu, kt�ry nie powinien wpa�� w r�ce takiego �miertelnika, jak ty.
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_04"); //Zawr�� albo b�dzie za p�no!					
																																	
	AI_Output			(other, self, "DIA_NASZ_409_Nieznany_kto_19_05"); //C�, chyba nici ze wsp�lnego wypadu na ry��wk�. Przyby�em tu, aby ci go odebra�.
	// nieznajomy si� �mieje
	AI_Output			(self ,other, "DIA_NASZ_409_Nieznany_kto_19_06"); //Widz�, �e nie czujesz powagi sytuacji. Tym samym wydajesz na siebie wyrok, nieznajomy.
	

	B_LogEntry (TOPIC_Niedostepny_Klif, "No� cholera, wszystko musi si� komplikowa�! Okaza�o si�, �e amuletu strze�e jaki� facet w czarnej szacie.");
	
};



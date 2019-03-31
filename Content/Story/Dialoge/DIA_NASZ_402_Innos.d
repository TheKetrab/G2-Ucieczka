//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_402_Innos_EXIT   (C_INFO)
{
	npc         = NASZ_402_Innos;
	nr          = 999;
	condition   = DIA_NASZ_402_Innos_EXIT_Condition;
	information = DIA_NASZ_402_Innos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_402_Innos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_402_Innos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_402_Innos_siema   (C_INFO)
{
	npc         = NASZ_402_Innos;
 	nr          = 1;
 	condition   = DIA_NASZ_402_Innos_siema_Condition;
 	information = DIA_NASZ_402_Innos_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_402_Innos_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_402_Innos_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_402_Innos_siema_15_00"); //To ty jeste� tym, kt�ry mnie przyzwa�?
	AI_Output (other, self,"DIA_NASZ_402_Innos_siema_15_01"); //Nie. Gdybym to zrobi�, by�bym teraz o�ywie�cem.
	AI_Output (self, other,"DIA_NASZ_402_Innos_siema_15_02"); //Czyli jednak przywo�any jestem za pomoc� zwoju... To by oznacza�o, �e s� tu te� Adanos i Beliar. M�w, czego ci potrzeba?
	
};

//*********************************************************************
//	Info Portal
//*********************************************************************
INSTANCE DIA_NASZ_402_Innos_portal   (C_INFO)
{
	npc         = NASZ_402_Innos;
 	nr          = 2;
 	condition   = DIA_NASZ_402_Innos_portal_Condition;
 	information = DIA_NASZ_402_Innos_portal_Info;
 	permanent   = FALSE;
 	description = "Przychodz� zaoferowa� swoje us�ugi.";
};

FUNC INT DIA_NASZ_402_Innos_portal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_402_Innos_portal_Info()
{
	AI_Output (other,self ,"DIA_NASZ_402_Innos_portal_15_00"); //Przychodz� zaoferowa� swoje us�ugi.
	AI_Output (self, other,"DIA_NASZ_402_Innos_portal_55_01"); //Doceniam to, �miertelniku. Czego ��dasz w zamian ode mnie?
	AI_Output (other, self,"DIA_NASZ_402_Innos_portal_55_02"); //Potrzebuj� boskiej pomocy, by otworzy� portal.
	AI_Output (self, other,"DIA_NASZ_402_Innos_portal_55_03"); //Portal? Dok�d?
	AI_Output (other, self,"DIA_NASZ_402_Innos_portal_55_04"); //W G�rniczej Dolinie wci�� s� ludzie. Musimy si� jako� przedosta� do Khorinis.
	AI_Output (self, other,"DIA_NASZ_402_Innos_portal_55_05"); //Pomog� ci, ale teraz twoja kolej. Musisz co� dla mnie zrobi�.
	AI_Output (self, other,"DIA_NASZ_402_Innos_portal_55_06"); //Ale najpierw musisz pokaza�, �e radzisz sobie z ogniem. Na razie nie jestem co do tego przekonany.


};

//*********************************************************************
//	Info WorkB
//*********************************************************************
INSTANCE DIA_NASZ_402_Innos_workB   (C_INFO)
{
	npc         = NASZ_402_Innos;
 	nr          = 3;
 	condition   = DIA_NASZ_402_Innos_workB_Condition;
 	information = DIA_NASZ_402_Innos_workB_Info;
 	permanent   = FALSE;
 	description = "Co mam zrobi�?";
};

FUNC INT DIA_NASZ_402_Innos_workB_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_402_Innos_portal))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_402_Innos_workB_Info()
{
	AI_Output (other,self ,"DIA_NASZ_402_Innos_workB_15_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_402_Innos_workB_55_01"); //Przynie� mi 10 j�zyk�w ognistych jaszczur�w.
	AI_Output (other,self ,"DIA_NASZ_402_Innos_workB_15_02"); //Gdzie mog� znale�� te gady?
	AI_Output (self, other,"DIA_NASZ_402_Innos_workB_55_03"); //Zwa�ywszy na sw� ognist� natur�, kochaj� piasek i wybrze�a morskie. W G�rniczej Dolinie wci�� s� takie miejsca.

	Log_CreateTopic (TOPIC_bogowie_work, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_bogowie_work, LOG_RUNNING);
	B_LogEntry (TOPIC_bogowie_work, "10 j�zyk�w ognistych jaszczur�w b�dzie dowodem dla Innosa, �e potrafi� radzi� sobie z ogniem. Te czerwone gady lubi� piasek i wybrze�e morskie.");
	
	
	
	
	
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_01");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_02");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_03");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_04");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_05");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_06");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_07");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_08");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_09");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_10");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_11");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_12");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_13");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_14");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_15");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_16");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_17");
	Wld_InsertNpc	(FireWaran,"FP_INNOS_SPAWN_JASZCZUR_18");

};

//*********************************************************************
//	Info DoneB
//*********************************************************************
INSTANCE DIA_NASZ_402_Innos_doneB   (C_INFO)
{
	npc         = NASZ_402_Innos;
 	nr          = 4;
 	condition   = DIA_NASZ_402_Innos_doneB_Condition;
 	information = DIA_NASZ_402_Innos_doneB_Info;
 	permanent   = FALSE;
 	description = "Oto i 10 j�zyk�w.";
};

FUNC INT DIA_NASZ_402_Innos_doneB_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_402_Innos_workB)
		&& npc_hasitems (other, ItAt_WaranFiretongue) >=10)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_402_Innos_doneB_Info()
{
	AI_Output (other, self,"DIA_NASZ_402_Innos_doneB_15_00"); //Oto i 10 j�zyk�w.
	B_giveinvitems (other, self, ItAt_WaranFiretongue, 10);
	AI_Output (self, other,"DIA_NASZ_402_Innos_doneB_55_01"); //Szczerze m�wi�c, my�la�em, �e zostanie z ciebie popi�. Zaskoczy�e� mnie, �miertelniku.
	AI_Output (self, other,"DIA_NASZ_402_Innos_doneB_55_02"); //A wi�c ju� wiem, �e sprotasz mojej pro�bie.

	B_GivePlayerXP(1000);
	B_LogEntry (TOPIC_bogowie_work, "Odda�em Innosowi ogniste j�zyki.");

};

var int KillKazzminBefore;
//*********************************************************************
//	Info WorkA
//*********************************************************************
INSTANCE DIA_NASZ_402_Innos_workA   (C_INFO)
{
	npc         = NASZ_402_Innos;
 	nr          = 5;
 	condition   = DIA_NASZ_402_Innos_workA_Condition;
 	information = DIA_NASZ_402_Innos_workA_Info;
 	permanent   = FALSE;
 	description = "Na co mog� si� przyda�, panie?";
};

FUNC INT DIA_NASZ_402_Innos_workA_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_402_Innos_doneB))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_402_Innos_workA_Info()
{
	AI_Output (other,self ,"DIA_NASZ_402_Innos_workA_15_00"); //Na co mog� si� przyda�, panie?
	AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_01"); //Bagna. Na bagnach gnije pe�no zagubionych dusz.
	
	if (Npc_IsDead(NASZ_028_Kazmin)) {
		KillKazzminBefore = TRUE;
		AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_02"); //Ale... Zaraz. W�a�nie wyczuwam, �e ju� s� spokojne. Ty im pomog�e� i oczy�ci�e� ich z niewiary.
		AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_03"); //Teraz ja mog� pom�c tobie. Co mam zrobi�?

		B_GivePlayerXP(1000);
		B_LogEntry (TOPIC_bogowie_work, "Innos chcia�, bym rozwi�za� sprawy na bagnach, ale ju� cze�niej si� tym zaj��em.");

	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_04"); //�miertelnicy zawierzyli swoje dusze �ni�cemu, przez co teraz b��kaj� si� po �wiecie.
		AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_05"); //Musisz rozwi�za� wielkie sprawy, kt�re dziej� si� na bagnach. Bogowie nie mog� si� tam wtr�ca�, gdy� to sprawa mi�dzy �ywymi a umar�ymi.

		B_LogEntry (TOPIC_bogowie_work, "Innos chce, bym uratowa� zagubione dusze na bagnach. Musz� si� tam uda� i pom�c si� oczy�ci�.");
	};
};

//*********************************************************************
//	Info DoneA
//*********************************************************************
INSTANCE DIA_NASZ_402_Innos_doneA   (C_INFO)
{
	npc         = NASZ_402_Innos;
 	nr          = 6;
 	condition   = DIA_NASZ_402_Innos_doneA_Condition;
 	information = DIA_NASZ_402_Innos_doneA_Info;
 	permanent   = FALSE;
 	description = "Duchy odnalaz�y sw�j spok�j.";
};

FUNC INT DIA_NASZ_402_Innos_doneA_Condition()
{
	if (Npc_IsDead(NASZ_028_Kazmin))
	&& (npc_knowsinfo(other,DIA_NASZ_402_Innos_workA))
	&& (KillKazzminBefore == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_402_Innos_doneA_Info()
{
	AI_Output (other, self,"DIA_NASZ_402_Innos_doneA_15_00"); //Duchy odnalaz�y sw�j spok�j.
	AI_Output (self, other,"DIA_NASZ_402_Innos_doneA_55_01"); //Ciesz� si�, �e ci biedacy s� ju� szcz�liwi. Dobra robota.
	AI_Output (self, other,"DIA_NASZ_402_Innos_doneA_55_02"); //Teraz pora na ciebie. Czego ode mnie chcesz?

	B_GivePlayerXP(1000);
	B_LogEntry (TOPIC_bogowie_work, "Wykona�em zadanie powierzone mi przez Innosa. Teraz mo�e pom�c mi w sprawach wcale nie mniej wa�nych.");
	
};


//*********************************************************************
//	Info GotoTP
//*********************************************************************
INSTANCE DIA_NASZ_402_Innos_GotoTP   (C_INFO)
{
	npc         = NASZ_402_Innos;
 	nr          = 6;
 	condition   = DIA_NASZ_402_Innos_GotoTP_Condition;
 	information = DIA_NASZ_402_Innos_GotoTP_Info;
 	permanent   = FALSE;
 	description = "Udaj si� do orkowego miasta.";
};

FUNC INT DIA_NASZ_402_Innos_GotoTP_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_402_Innos_doneA))
	|| (KillKazzminBefore == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_402_Innos_GotoTP_Info()
{
	AI_Output (other, self,"DIA_NASZ_402_Innos_GotoTP_15_00"); //Udaj si� do orkowego miasta.
	AI_Output (self, other,"DIA_NASZ_402_Innos_GotoTP_55_01"); //A co takiego tam si� stanie? Tam mamy otworzy� portal?
	AI_Output (other, self,"DIA_NASZ_402_Innos_GotoTP_15_02"); //Przeteleportuj si� tam, a sam zobaczysz.
	
	InnosSieTeleportuje = TRUE;
	
	Npc_ExchangeRoutine (self, "Final");

	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
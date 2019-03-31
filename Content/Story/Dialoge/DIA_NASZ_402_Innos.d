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
	AI_Output (self, other,"DIA_NASZ_402_Innos_siema_15_00"); //To ty jesteœ tym, który mnie przyzwa³?
	AI_Output (other, self,"DIA_NASZ_402_Innos_siema_15_01"); //Nie. Gdybym to zrobi³, by³bym teraz o¿ywieñcem.
	AI_Output (self, other,"DIA_NASZ_402_Innos_siema_15_02"); //Czyli jednak przywo³any jestem za pomoc¹ zwoju... To by oznacza³o, ¿e s¹ tu te¿ Adanos i Beliar. Mów, czego ci potrzeba?
	
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
 	description = "Przychodzê zaoferowaæ swoje us³ugi.";
};

FUNC INT DIA_NASZ_402_Innos_portal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_402_Innos_portal_Info()
{
	AI_Output (other,self ,"DIA_NASZ_402_Innos_portal_15_00"); //Przychodzê zaoferowaæ swoje us³ugi.
	AI_Output (self, other,"DIA_NASZ_402_Innos_portal_55_01"); //Doceniam to, œmiertelniku. Czego ¿¹dasz w zamian ode mnie?
	AI_Output (other, self,"DIA_NASZ_402_Innos_portal_55_02"); //Potrzebujê boskiej pomocy, by otworzyæ portal.
	AI_Output (self, other,"DIA_NASZ_402_Innos_portal_55_03"); //Portal? Dok¹d?
	AI_Output (other, self,"DIA_NASZ_402_Innos_portal_55_04"); //W Górniczej Dolinie wci¹¿ s¹ ludzie. Musimy siê jakoœ przedostaæ do Khorinis.
	AI_Output (self, other,"DIA_NASZ_402_Innos_portal_55_05"); //Pomogê ci, ale teraz twoja kolej. Musisz coœ dla mnie zrobiæ.
	AI_Output (self, other,"DIA_NASZ_402_Innos_portal_55_06"); //Ale najpierw musisz pokazaæ, ¿e radzisz sobie z ogniem. Na razie nie jestem co do tego przekonany.


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
 	description = "Co mam zrobiæ?";
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
	AI_Output (other,self ,"DIA_NASZ_402_Innos_workB_15_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_402_Innos_workB_55_01"); //Przynieœ mi 10 jêzyków ognistych jaszczurów.
	AI_Output (other,self ,"DIA_NASZ_402_Innos_workB_15_02"); //Gdzie mogê znaleŸæ te gady?
	AI_Output (self, other,"DIA_NASZ_402_Innos_workB_55_03"); //Zwa¿ywszy na sw¹ ognist¹ naturê, kochaj¹ piasek i wybrze¿a morskie. W Górniczej Dolinie wci¹¿ s¹ takie miejsca.

	Log_CreateTopic (TOPIC_bogowie_work, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_bogowie_work, LOG_RUNNING);
	B_LogEntry (TOPIC_bogowie_work, "10 jêzyków ognistych jaszczurów bêdzie dowodem dla Innosa, ¿e potrafiê radziæ sobie z ogniem. Te czerwone gady lubi¹ piasek i wybrze¿e morskie.");
	
	
	
	
	
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
 	description = "Oto i 10 jêzyków.";
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
	AI_Output (other, self,"DIA_NASZ_402_Innos_doneB_15_00"); //Oto i 10 jêzyków.
	B_giveinvitems (other, self, ItAt_WaranFiretongue, 10);
	AI_Output (self, other,"DIA_NASZ_402_Innos_doneB_55_01"); //Szczerze mówi¹c, myœla³em, ¿e zostanie z ciebie popió³. Zaskoczy³eœ mnie, œmiertelniku.
	AI_Output (self, other,"DIA_NASZ_402_Innos_doneB_55_02"); //A wiêc ju¿ wiem, ¿e sprotasz mojej proœbie.

	B_GivePlayerXP(1000);
	B_LogEntry (TOPIC_bogowie_work, "Odda³em Innosowi ogniste jêzyki.");

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
 	description = "Na co mogê siê przydaæ, panie?";
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
	AI_Output (other,self ,"DIA_NASZ_402_Innos_workA_15_00"); //Na co mogê siê przydaæ, panie?
	AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_01"); //Bagna. Na bagnach gnije pe³no zagubionych dusz.
	
	if (Npc_IsDead(NASZ_028_Kazmin)) {
		KillKazzminBefore = TRUE;
		AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_02"); //Ale... Zaraz. W³aœnie wyczuwam, ¿e ju¿ s¹ spokojne. Ty im pomog³eœ i oczyœci³eœ ich z niewiary.
		AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_03"); //Teraz ja mogê pomóc tobie. Co mam zrobiæ?

		B_GivePlayerXP(1000);
		B_LogEntry (TOPIC_bogowie_work, "Innos chcia³, bym rozwi¹za³ sprawy na bagnach, ale ju¿ czeœniej siê tym zaj¹³em.");

	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_04"); //Œmiertelnicy zawierzyli swoje dusze Œni¹cemu, przez co teraz b³¹kaj¹ siê po œwiecie.
		AI_Output (self, other,"DIA_NASZ_402_Innos_workA_55_05"); //Musisz rozwi¹zaæ wielkie sprawy, które dziej¹ siê na bagnach. Bogowie nie mog¹ siê tam wtr¹caæ, gdy¿ to sprawa miêdzy ¿ywymi a umar³ymi.

		B_LogEntry (TOPIC_bogowie_work, "Innos chce, bym uratowa³ zagubione dusze na bagnach. Muszê siê tam udaæ i pomóc siê oczyœciæ.");
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
 	description = "Duchy odnalaz³y swój spokój.";
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
	AI_Output (other, self,"DIA_NASZ_402_Innos_doneA_15_00"); //Duchy odnalaz³y swój spokój.
	AI_Output (self, other,"DIA_NASZ_402_Innos_doneA_55_01"); //Cieszê siê, ¿e ci biedacy s¹ ju¿ szczêœliwi. Dobra robota.
	AI_Output (self, other,"DIA_NASZ_402_Innos_doneA_55_02"); //Teraz pora na ciebie. Czego ode mnie chcesz?

	B_GivePlayerXP(1000);
	B_LogEntry (TOPIC_bogowie_work, "Wykona³em zadanie powierzone mi przez Innosa. Teraz mo¿e pomóc mi w sprawach wcale nie mniej wa¿nych.");
	
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
 	description = "Udaj siê do orkowego miasta.";
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
	AI_Output (other, self,"DIA_NASZ_402_Innos_GotoTP_15_00"); //Udaj siê do orkowego miasta.
	AI_Output (self, other,"DIA_NASZ_402_Innos_GotoTP_55_01"); //A co takiego tam siê stanie? Tam mamy otworzyæ portal?
	AI_Output (other, self,"DIA_NASZ_402_Innos_GotoTP_15_02"); //Przeteleportuj siê tam, a sam zobaczysz.
	
	InnosSieTeleportuje = TRUE;
	
	Npc_ExchangeRoutine (self, "Final");

	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};
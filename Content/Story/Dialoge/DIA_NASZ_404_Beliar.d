//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_404_Beliar_EXIT   (C_INFO)
{
	npc         = NASZ_404_Beliar;
	nr          = 999;
	condition   = DIA_NASZ_404_Beliar_EXIT_Condition;
	information = DIA_NASZ_404_Beliar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_404_Beliar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_404_Beliar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_404_Beliar_siema   (C_INFO)
{
	npc         = NASZ_404_Beliar;
 	nr          = 1;
 	condition   = DIA_NASZ_404_Beliar_siema_Condition;
 	information = DIA_NASZ_404_Beliar_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_404_Beliar_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_404_Beliar_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_404_Beliar_siema_15_00"); //CO?!
	AI_Output (self, other,"DIA_NASZ_404_Beliar_siema_15_01"); //Jakim prawem œmiertelnik œmie wejœæ sobie tutaj tak, jak gdyby nigdy nic.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_siema_15_02"); //Czego chcesz? Mów szybko.
	
};

//*********************************************************************
//	Info Portal
//*********************************************************************
INSTANCE DIA_NASZ_404_Beliar_portal   (C_INFO)
{
	npc         = NASZ_404_Beliar;
 	nr          = 2;
 	condition   = DIA_NASZ_404_Beliar_portal_Condition;
 	information = DIA_NASZ_404_Beliar_portal_Info;
 	permanent   = FALSE;
 	description = "Planujê potê¿ne wykorzystanie magii.";
};

FUNC INT DIA_NASZ_404_Beliar_portal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_404_Beliar_portal_Info()
{
	AI_Output (other,self ,"DIA_NASZ_404_Beliar_portal_15_00"); //Planujê potê¿ne wykorzystanie magii.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_portal_55_01"); //I co w zwi¹zku z tym? Chesz zg³êbiaæ tajniki ciemnej magii?
	AI_Output (other, self,"DIA_NASZ_404_Beliar_portal_55_02"); //Bardziej chcia³bym zobaczyæ prawdziwego mistrza.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_portal_55_03"); //Ah tak? Jeœli wywrzesz na mnie wra¿enie, to poka¿ê ci, czym jest prawdziwe czarowanie.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_portal_55_04"); //Ale najpierw musisz oddaæ siê swojemu Panu. 
	AI_Output (self, other,"DIA_NASZ_404_Beliar_portal_55_05"); //Zabij niewinn¹ istotê.

	Log_CreateTopic (TOPIC_bogowie_work, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_bogowie_work, LOG_RUNNING);
	B_LogEntry (TOPIC_bogowie_work, "Teraz muszê udowodniæ, ¿e s³u¿ê Beliarowi. Mam zabiæ jakiegoœ ³owcê orków albo myœliwego. Cholera... Chyba nie mam wyboru.");
	BeliarPraca3 = TRUE;

};

//*********************************************************************
//	Info DoneC
//*********************************************************************
INSTANCE DIA_NASZ_404_Beliar_doneC   (C_INFO)
{
	npc         = NASZ_404_Beliar;
 	nr          = 3;
 	condition   = DIA_NASZ_404_Beliar_doneC_Condition;
 	information = DIA_NASZ_404_Beliar_doneC_Info;
 	permanent   = FALSE;
 	description = "Zrobi³em to, o co prosi³eœ.";
};

FUNC INT DIA_NASZ_404_Beliar_doneC_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_404_Beliar_portal))
//		&& (ZabilesDlaBeliara == TRUE)) TODO: nie dzia³a zabijanie w ZS_Dead, nie wiem czemu
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_404_Beliar_doneC_Info()
{
	AI_Output (other, self,"DIA_NASZ_404_Beliar_doneC_15_00"); //Zrobi³em to, o co prosi³eœ.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneC_55_01"); //Dawno ju¿ ¿aden cz³owiek nie pokaza³ mi swojego oddania.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneC_55_02"); //Kiedyœ brata³ siê ze mn¹ pewien mag imieniem Xardas.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneC_55_03"); //Poddam próbie twoj¹ si³ê.

};

//*********************************************************************
//	Info WorkB
//*********************************************************************
INSTANCE DIA_NASZ_404_Beliar_workB   (C_INFO)
{
	npc         = NASZ_404_Beliar;
 	nr          = 4;
 	condition   = DIA_NASZ_404_Beliar_workB_Condition;
 	information = DIA_NASZ_404_Beliar_workB_Info;
 	permanent   = FALSE;
 	description = "Jak mogê pokazaæ sw¹ si³ê, panie?";
};

FUNC INT DIA_NASZ_404_Beliar_workB_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_404_Beliar_doneC))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_404_Beliar_workB_Info()
{
	AI_Output (other,self ,"DIA_NASZ_404_Beliar_workB_15_00"); //Jak mogê pokazaæ sw¹ si³ê, panie?
	AI_Output (self, other,"DIA_NASZ_404_Beliar_workB_55_01"); //Udasz siê do zatopionej wie¿y nekromanty. Ukryto tam pewn¹ ksiêgê.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_workB_55_02"); //Stary Xardas nie mia³ pojêcia, ¿e jego demony nie by³y do koñca lojalne.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_workB_55_03"); //ZnajdŸ j¹ i powtórz mi s³owa, które tam przeczyta³eœ.

	Wld_InsertNpc	(NASZ_415_SlugaBeliara,"NASZ_SLUGABELIARA_1"); 
	Wld_InsertNpc	(NASZ_416_SlugaBeliara,"NASZ_SLUGABELIARA_2"); 
	Wld_InsertNpc	(NASZ_417_SlugaBeliara,"NASZ_SLUGABELIARA_3"); 
	FF_ApplyOnceExt (SludzyBeliara, 3000, -1);
	

	B_LogEntry (TOPIC_bogowie_work, "Muszê znaleŸæ jak¹œ ksiêgê w zatopionej wie¿y Xardasa. Wspó³praca z Beliarem to nienajm¹drzejsze dzia³anie...");

};

var int BELIAR5K;
//*********************************************************************
//	Info DoneB
//*********************************************************************
INSTANCE DIA_NASZ_404_Beliar_doneB   (C_INFO)
{
	npc         = NASZ_404_Beliar;
 	nr          = 5;
 	condition   = DIA_NASZ_404_Beliar_doneB_Condition;
 	information = DIA_NASZ_404_Beliar_doneB_Info;
 	permanent   = FALSE;
 	description = "KARA K'TA KRUSHAK!";
};

FUNC INT DIA_NASZ_404_Beliar_doneB_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_404_Beliar_workB)
		&& npc_isdead (NASZ_415_SlugaBeliara)
		&& npc_isdead (NASZ_416_SlugaBeliara)
		&& npc_isdead (NASZ_417_SlugaBeliara)
		&& (WillKnowXardasOldBook == TRUE))

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_404_Beliar_doneB_Info()
{
	AI_Output (other, self,"DIA_NASZ_404_Beliar_doneB_15_00"); //KARA K'TA KRUSHAK!
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_01"); //A wiêc da³eœ radê. Poka¿ê ci, co potrafiê. Czego dok³adnie oczekujesz?
	AI_Output (other, self,"DIA_NASZ_404_Beliar_doneB_15_02"); //Chcê byœ wraz ze swymi braæmi otworzy³ portal do Myrtany. Rytua³ odbêdzie siê w orkowym mieœcie.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_03"); //CO?! Mam wspó³pracowaæ z Innosem i Adanosem? Có¿... Wykaza³eœ siê niezwyk³ym oddaniem.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_04"); //Niech bêdzie. Udam siê do miejsca przyzwania portalu. Jednak jeœli chcesz, bym zni¿y³ siê do poziomu moich braci, musisz z³o¿yæ mi ofiarê przy jednej z kapliczek.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_05"); //2 tysi¹ce sztuk z³ota. To bêdzie wystarczaj¹ca kwota. Jeœli tego nie zrobisz, nie wezmê udzia³u w rytuale.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_06"); //Zobaczymy siê w orkowym mieœcie. Ofiara ma byæ ju¿ z³o¿ona!

	B_GivePlayerXP(1000);
	
	BELIAR5K = TRUE;
	Npc_ExchangeRoutine (self, "Final");
	B_LogEntry (TOPIC_bogowie_work, "Beliar by³ pod wra¿eniem, ¿e upora³em siê z jego s³ugami Uda siê do orkowego miasta, jednak odprawi rytua³ wraz z braæmi tylko, jeœli z³o¿ê w ofierze 2 tysi¹ce sztuk z³ota w dowolnej kapliczce.");

};

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
	AI_Output (self, other,"DIA_NASZ_404_Beliar_siema_15_01"); //Jakim prawem �miertelnik �mie wej�� sobie tutaj tak, jak gdyby nigdy nic.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_siema_15_02"); //Czego chcesz? M�w szybko.
	
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
 	description = "Planuj� pot�ne wykorzystanie magii.";
};

FUNC INT DIA_NASZ_404_Beliar_portal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_404_Beliar_portal_Info()
{
	AI_Output (other,self ,"DIA_NASZ_404_Beliar_portal_15_00"); //Planuj� pot�ne wykorzystanie magii.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_portal_55_01"); //I co w zwi�zku z tym? Chesz zg��bia� tajniki ciemnej magii?
	AI_Output (other, self,"DIA_NASZ_404_Beliar_portal_55_02"); //Bardziej chcia�bym zobaczy� prawdziwego mistrza.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_portal_55_03"); //Ah tak? Je�li wywrzesz na mnie wra�enie, to poka�� ci, czym jest prawdziwe czarowanie.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_portal_55_04"); //Ale najpierw musisz odda� si� swojemu Panu. 
	AI_Output (self, other,"DIA_NASZ_404_Beliar_portal_55_05"); //Zabij niewinn� istot�.

	Log_CreateTopic (TOPIC_bogowie_work, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_bogowie_work, LOG_RUNNING);
	B_LogEntry (TOPIC_bogowie_work, "Teraz musz� udowodni�, �e s�u�� Beliarowi. Mam zabi� jakiego� �owc� ork�w albo my�liwego. Cholera... Chyba nie mam wyboru.");
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
 	description = "Zrobi�em to, o co prosi�e�.";
};

FUNC INT DIA_NASZ_404_Beliar_doneC_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_404_Beliar_portal))
//		&& (ZabilesDlaBeliara == TRUE)) TODO: nie dzia�a zabijanie w ZS_Dead, nie wiem czemu
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_404_Beliar_doneC_Info()
{
	AI_Output (other, self,"DIA_NASZ_404_Beliar_doneC_15_00"); //Zrobi�em to, o co prosi�e�.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneC_55_01"); //Dawno ju� �aden cz�owiek nie pokaza� mi swojego oddania.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneC_55_02"); //Kiedy� brata� si� ze mn� pewien mag imieniem Xardas.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneC_55_03"); //Poddam pr�bie twoj� si��.

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
 	description = "Jak mog� pokaza� sw� si��, panie?";
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
	AI_Output (other,self ,"DIA_NASZ_404_Beliar_workB_15_00"); //Jak mog� pokaza� sw� si��, panie?
	AI_Output (self, other,"DIA_NASZ_404_Beliar_workB_55_01"); //Udasz si� do zatopionej wie�y nekromanty. Ukryto tam pewn� ksi�g�.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_workB_55_02"); //Stary Xardas nie mia� poj�cia, �e jego demony nie by�y do ko�ca lojalne.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_workB_55_03"); //Znajd� j� i powt�rz mi s�owa, kt�re tam przeczyta�e�.

	Wld_InsertNpc	(NASZ_415_SlugaBeliara,"NASZ_SLUGABELIARA_1"); 
	Wld_InsertNpc	(NASZ_416_SlugaBeliara,"NASZ_SLUGABELIARA_2"); 
	Wld_InsertNpc	(NASZ_417_SlugaBeliara,"NASZ_SLUGABELIARA_3"); 
	FF_ApplyOnceExt (SludzyBeliara, 3000, -1);
	

	B_LogEntry (TOPIC_bogowie_work, "Musz� znale�� jak�� ksi�g� w zatopionej wie�y Xardasa. Wsp�praca z Beliarem to nienajm�drzejsze dzia�anie...");

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
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_01"); //A wi�c da�e� rad�. Poka�� ci, co potrafi�. Czego dok�adnie oczekujesz?
	AI_Output (other, self,"DIA_NASZ_404_Beliar_doneB_15_02"); //Chc� by� wraz ze swymi bra�mi otworzy� portal do Myrtany. Rytua� odb�dzie si� w orkowym mie�cie.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_03"); //CO?! Mam wsp�pracowa� z Innosem i Adanosem? C�... Wykaza�e� si� niezwyk�ym oddaniem.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_04"); //Niech b�dzie. Udam si� do miejsca przyzwania portalu. Jednak je�li chcesz, bym zni�y� si� do poziomu moich braci, musisz z�o�y� mi ofiar� przy jednej z kapliczek.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_05"); //2 tysi�ce sztuk z�ota. To b�dzie wystarczaj�ca kwota. Je�li tego nie zrobisz, nie wezm� udzia�u w rytuale.
	AI_Output (self, other,"DIA_NASZ_404_Beliar_doneB_55_06"); //Zobaczymy si� w orkowym mie�cie. Ofiara ma by� ju� z�o�ona!

	B_GivePlayerXP(1000);
	
	BELIAR5K = TRUE;
	Npc_ExchangeRoutine (self, "Final");
	B_LogEntry (TOPIC_bogowie_work, "Beliar by� pod wra�eniem, �e upora�em si� z jego s�ugami Uda si� do orkowego miasta, jednak odprawi rytua� wraz z bra�mi tylko, je�li z�o�� w ofierze 2 tysi�ce sztuk z�ota w dowolnej kapliczce.");

};

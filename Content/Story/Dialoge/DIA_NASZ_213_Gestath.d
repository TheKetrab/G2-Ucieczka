var int WillKnowQuestRenegaci;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_EXIT   (C_INFO)
{
	npc         = NASZ_213_Gestath;
	nr          = 999;
	condition   = DIA_NASZ_213_Gestath_EXIT_Condition;
	information = DIA_NASZ_213_Gestath_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_213_Gestath_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_213_Gestath_EXIT_Info()
{
	if (WillKnowQuestRenegaci == TRUE) {
	AI_Output (self, other,"DIA_NASZ_213_Gestath_EXIT_55_00"); //Nie daj si� zabi�. Niech Innos ci� prowadzi.
	
	WillKnowQuestRenegaci = FALSE;
	
	AI_StopProcessInfos (self);
	};
	
	AI_StopProcessInfos (self);
};


//*********************************************************************
//	Info InformAboutCrime 
//*********************************************************************
var int Gestath_Talk_Crime_First_Time;

INSTANCE DIA_NASZ_213_Gestath_InformAboutCrime   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 1;
 	condition   = DIA_NASZ_213_Gestath_InformAboutCrime_Condition;
 	information = DIA_NASZ_213_Gestath_InformAboutCrime_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_213_Gestath_InformAboutCrime_Condition()
{
	if (Thief_Counter_Mysliwi > 0)
	&& ((Gestath_Talk_Crime_First_Time == FALSE) || (Npc_IsInState(self, ZS_TALK)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_InformAboutCrime_Info()
{
	if (Gestath_Talk_Crime_First_Time == FALSE) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_15_00"); //A niech ci�! Kradzie� w moim obozie? Nie tylko z Ratfordem takie problemy...
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_55_01"); //S�uchaj, je�li mamy tworzy� zgrany zesp�, to nie mo�emy sobie nawzajem rzuca� k��d pod nogi. Musisz koniecznie wynagrodzi� reszcie swoje zachowanie i okaza� skruch�.
		Gestath_Talk_Crime_First_Time = TRUE;
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_15_02"); //Przyszed�e� zap�aci�?
	};
	
	var string want_to_pay; want_to_pay = "Chc� zap�aci� za kradzie�. (";
	want_to_pay = ConcatStrings(want_to_pay,IntToString(Thief_Counter_Mysliwi*30));
	want_to_pay = ConcatStrings(want_to_pay," szt. z�ota)");

	Info_ClearChoices (DIA_NASZ_213_Gestath_InformAboutCrime);
		Info_AddChoice	  (DIA_NASZ_213_Gestath_InformAboutCrime, "KONIEC", DIA_NASZ_213_Gestath_InformAboutCrime_end);
		Info_AddChoice	  (DIA_NASZ_213_Gestath_InformAboutCrime, want_to_pay, DIA_NASZ_213_Gestath_InformAboutCrime_pay);

};

FUNC VOID DIA_NASZ_213_Gestath_InformAboutCrime_end()
{
	AI_StopProcessInfos(self);
};

FUNC VOID DIA_NASZ_213_Gestath_InformAboutCrime_pay()
{
	var int want_to_pay_money;
	want_to_pay_money = Thief_Counter_Mysliwi*30;

	AI_Output (other,self ,"DIA_NASZ_213_Gestath_InformAboutCrime_pay_15_00"); //Chc� zap�aci� za kradzie�.
	
	if (npc_hasitems(other,ItMi_Gold) >= want_to_pay_money) {
		B_GiveInvItems(other,self,ItMi_Gold,want_to_pay_money);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_pay_55_01"); //Dobrze. Ale pami�taj, by nie robi� ju� takich rzeczy nigdy wi�cej!
		
		Thief_Counter_Mysliwi = 0;
		Gestath_Talk_Crime_First_Time = FALSE;
		
		Info_ClearChoices (DIA_NASZ_213_Gestath_InformAboutCrime);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_pay_55_02"); //Jeste� takim gburem, �e nawet nie masz z�ota, by zrewan�owa� si� za kradzie�! Kiepski z ciebie z�odziej...
		AI_StopProcessInfos(self);
	};
};	
	


//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_hello   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 1;
 	condition   = DIA_NASZ_213_Gestath_hello_Condition;
 	information = DIA_NASZ_213_Gestath_hello_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_213_Gestath_hello_Condition()
{
	if (Thief_Counter_Mysliwi == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_hello_Info()
{
	AI_Output (self, other,"DIA_NASZ_213_Gestath_hello_55_00"); //Kim jeste� i czego tutaj szukasz?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_hello_15_01"); //Nazywam si� Will. Uciek�em z kopalni, bo warunki, w kt�rych nas trzymano, by�y nieludzkie. Moim celem jest te� uwolnienie wsp�wi�ni�w, kt�rzy nadal tam pracuj�.
		
};

//*********************************************************************
//	Info Hello2
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_siema2   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 2;
 	condition   = DIA_NASZ_213_Gestath_siema2_Condition;
 	information = DIA_NASZ_213_Gestath_siema2_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_213_Gestath_siema2_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
	&& npc_knowsinfo (other, DIA_NASZ_213_Gestath_hello)) && (Gestath_Stopowanie == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_siema2_Info()
{
	AI_Output (self, other,"DIA_NASZ_213_Gestath_siema2_15_00"); //Witaj, Willu.
		
};

//*********************************************************************
//	Info OUT
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_out   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 3;
 	condition   = DIA_NASZ_213_Gestath_out_Condition;
 	information = DIA_NASZ_213_Gestath_out_Info;
 	permanent   = FALSE;
	description = "Chcia�bym zosta� my�liwym.";
};

FUNC INT DIA_NASZ_213_Gestath_out_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_213_Gestath_out_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_out_55_00"); //Chcia�bym zosta� my�liwym.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_out_15_01"); //No c�... Przyda nam si� nowy cz�owiek. Jednak, aby zosta� my�liwym, musisz dowie�� swojej warto�ci.
};

//*********************************************************************
//	Info Co
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_co   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 4;
 	condition   = DIA_NASZ_213_Gestath_co_Condition;
 	information = DIA_NASZ_213_Gestath_co_Info;
 	permanent   = FALSE;
	description = "Co mam zrobi�?";
};

FUNC INT DIA_NASZ_213_Gestath_co_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_out))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_co_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_co_55_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_15_01"); //Je�li chcesz tutaj zosta�, nie ma problemu. Ale b�dziesz musia� sam sobie kupowa� �arcie i znale�� miejsce do spania.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_02"); //Je�li jednak chcesz mie� tu co� do powiedzenia, zbroj� i inne udogodnienia, to musisz si� troszk� przyda� w obozie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_03"); //Pom� ch�opcom. Spodobaj si� im. Kiedy b�d� ju� s�ysza� na tw�j temat do�� du�o dobrych rzeczy, to zostaniesz cz�onkiem obozu my�liwych.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_04"); //No i oczywi�cie najwa�niejsze...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_05"); //Je�li chcesz, �ebym ci� przyj��, musz� mie� pewno��, �e posiadasz przynajmniej podstawowe zdolno�ci my�liwskie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_06"); //Przynie� mi sk�ry trzech wilk�w: zwyk�ego, czarnego i lodowego. To b�dzie wystarczaj�cy dow�d, �e wiesz, gdzie szuka� zwierzyny oraz potrafisz j� upolowa� i co najwa�niejsze oprawi�.

	MIS_Wilki_Ready = TRUE;

	Log_CreateTopic (TOPIC_Gestath_wilki, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gestath_wilki, LOG_RUNNING);
	B_LogEntry (TOPIC_Gestath_wilki, "Musz� przynie�� Gestathowi sk�ry trzech wilk�w: zwyk�ego, czarnego i lodowego.");

	if (Mission_Gildia_Ready == FALSE) {
		Log_CreateTopic (TOPIC_gildia, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_gildia, LOG_RUNNING);
		Mission_Gildia_Ready = TRUE;
	};
	
	B_LogEntry (TOPIC_gildia, "Aby zosta� my�liwym, musz� zdoby� poparcie w obozie oraz sprawdzi� si� jako my�liwy wykonuj�c zadanie Gestatha.");
	Mission_Gestath_Fur = TRUE;

};

//*********************************************************************
//	Info WhereWolf
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_WhereWolf   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 6;
 	condition   = DIA_NASZ_213_Gestath_WhereWolf_Condition;
 	information = DIA_NASZ_213_Gestath_WhereWolf_Info;
 	permanent   = FALSE;
	description = "Gdzie znajd� te wilki?";
};

FUNC INT DIA_NASZ_213_Gestath_WhereWolf_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_co))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_WhereWolf_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhereWolf_55_00"); //Gdzie znajd� te wilki?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhereWolf_15_01"); //Zwyk�e znajdziesz w lasach. Czarne szukaj pod wulkanem, a lodowe oczywi�cie w okolicach Nowego Obozu.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhereWolf_55_02"); //Tylko, �e te ostatnie wyst�puj� w du�ych watahach. Nie daj si� zje��.

	B_LogEntry (TOPIC_Gestath_wilki, "Zwyk�e wilki mog� spotka� w lasach, czarne pod wulkanem, a lodowe w okolicach Nowego Obozu.");
};

//*********************************************************************
//	Info FurForYou
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_FurForYou   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 7;
 	condition   = DIA_NASZ_213_Gestath_FurForYou_Condition;
 	information = DIA_NASZ_213_Gestath_FurForYou_Info;
 	permanent   = FALSE;
	description = "Mam dla ciebie sk�ry.";
};

FUNC INT DIA_NASZ_213_Gestath_FurForYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_co)
		&& npc_hasitems (other, ItAt_WolfFur) >=1
		&& npc_hasitems (other, ItNa_BlackWolfFur) >=1
		&& npc_hasitems (other, ItNa_IceWolfFur) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_FurForYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_FurForYou_15_00"); //Mam dla ciebie sk�ry.
	B_giveinvitems (other, self, ItAt_WolfFur, 1);
	Npc_RemoveInvItems (self, ItAt_WolfFur, 1);
	B_giveinvitems (other, self, ItNa_BlackWolfFur, 1);
	Npc_RemoveInvItems (self, ItNa_BlackWolfFur, 1);
	B_giveinvitems (other, self, ItNa_IceWolfFur, 1);
	Npc_RemoveInvItems (self, ItNa_IceWolfFur, 1);
	AI_Output (self, other,"DIA_NASZ_213_Gestath_FurForYou_55_01"); //Niech no spojrz�.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_FurForYou_55_02"); //Dobrze naci�te...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_FurForYou_55_03"); //Tak. Potrafisz garbowa� sk�ry. To daje ci ogromny plus w drodze do do��czenia do nas.
	
	MIS_Wilki_Ready = FALSE;

	DodajReputacje (4, REP_MYSLIWI);
	B_GivePlayerXP (500);
	B_LogEntry (TOPIC_Gestath_wilki, "Odda�em sk�ry Gestathowi.");
	Log_SetTopicStatus (TOPIC_Gestath_wilki, LOG_SUCCESS);
	Mission_Gestath_Fur = FALSE;
};

var int WILL_MYSLIWY;
//*********************************************************************
//	Info Ready
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_ready   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 8;
 	condition   = DIA_NASZ_213_Gestath_ready_condition;
 	information = DIA_NASZ_213_Gestath_ready_Info;
 	permanent   = TRUE;
	description = "Czy jestem ju� gotowy, by do was do��czy�?";
};

FUNC INT DIA_NASZ_213_Gestath_ready_condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_out)
		&& (!WILL_MYSLIWY))
		&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_ready_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ready_55_00"); //Czy jestem ju� gotowy, by do was do��czy�?
	if (RepEnough(25,REP_MYSLIWI)) && (npc_knowsinfo (other, DIA_NASZ_213_Gestath_FurForYou)) {
	
		if (npc_knowsinfo (other, DIA_NASZ_201_Erak_PreHello)) {
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_01"); //Tak. Dowiod�e�, �e mo�na na tobie polega�. Ch�opcy s� zgodni co do twojego cz�onkostwa i udowodni�e�, �e znasz si� troch� na polowaniu.
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_55_02"); //Mo�esz zaczyna�, kiedy tylko zechcesz.

			WILL_MYSLIWY = TRUE;
		}
		else {
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_03"); //Pozna�e� ju� Eraka?
			AI_Output (other, self,"DIA_NASZ_213_Gestath_ready_15_04"); //Nie.
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_05"); //Uwa�am, �e powinni�cie zamieni� ze sob� kilka s��w. To moja prawa r�ka.
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_06"); //Erak przebywa w obozie wypadowym. Id� wzd�u� palisady na p�noc, a na jej ko�cu skr�� w prawo. Tam go znajdziesz.
		};
	}
	else if (RepEnough(10,REP_MYSLIWI)) {
		PrintMissingRep(25,REP_MYSLIWI);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_07"); //Niestety to ci�gle za ma�o. Ch�opcy ju� ci� znaj�, ale nie ka�dy jest skory do pochwa�y.
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_55_08"); //Pracuj tak dalej, a niebawem staniesz si� jednym z nas.
	}
	else {
		PrintMissingRep(25,REP_MYSLIWI);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_09"); //�artujesz chyba!
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_55_10"); //Pomog�e� komukolwiek? Id� lepiej przekonywa� do siebie ch�opc�w, zamiast dra�ni� mnie swoimi g�upimi pytaniami. 
	};
};

//*********************************************************************
//	Info BeAMysliwy
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_BeAMysliwy   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 9;
 	condition   = DIA_NASZ_213_Gestath_BeAMysliwy_Condition;
 	information = DIA_NASZ_213_Gestath_BeAMysliwy_Info;
 	permanent   = FALSE;
	description = "Chc� zosta� my�liwym.";
};

FUNC INT DIA_NASZ_213_Gestath_BeAMysliwy_Condition()
{
	if (WILL_MYSLIWY == TRUE)
		&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_BeAMysliwy_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_BeAMysliwy_15_00"); //Chc� zosta� my�liwym.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BeAMysliwy_15_01"); //�wietnie! Dobry jeste�, a my potrzebujemy dobrych ludzi.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BeAMysliwy_15_02"); //Od dzisiaj mo�esz nosi� si� z tytu�em my�liwego. We� te� t� zbroj� i no� j� na potwierdzenie swojej przynale�no�ci.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BeAMysliwy_15_03"); //Wpadnij te� do Dobara i upomnij si� o n� dla siebie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BeAMysliwy_15_04"); //Je�li zale�y ci na czym�, co lepiej ci� obroni, to zapytaj Hunta. Znajdzie si� co� dla ciebie.

	Npc_SetTrueGuild (other, GIL_OUT);
	other.guild	= GIL_OUT;
	Snd_Play ("LEVELUP");

	Createinvitems (self, ITNA_OUT_L, 1);
	B_giveinvitems (self, other, ITNA_OUT_L, 1);
	AI_EquipBestArmor (other);

	B_GivePlayerXP (1000);		
	DodajReputacje(10,REP_MYSLIWI);
	B_LogEntry (TOPIC_gildia, "Do��czy�em do my�liwych.");
	Log_SetTopicStatus (TOPIC_gildia, LOG_SUCCESS);
	
	B_Kapitelwechsel (2, NEWWORLD_ZEN );

};

var int GESTATH_ARAN;
//*********************************************************************
//	Info Aran
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_aran   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 10;
 	condition   = DIA_NASZ_213_Gestath_aran_Condition;
 	information = DIA_NASZ_213_Gestath_aran_Info;
 	permanent   = FALSE;
	description = "Aran szuka towarzystwa...";
};

FUNC INT DIA_NASZ_213_Gestath_aran_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_216_Aran_quest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_aran_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_aran_15_00"); //Aran szuka towarzystwa...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_aran_15_01"); //To mo�e sam z nim posied�?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_aran_15_02"); //Przykro mi Willu, ale je�li chcesz mu pom�c, to musisz sam poszuka� kogo�, kto chcia�by z nim przebywa�.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_aran_15_03"); //Aran jest strasznie gadatliwy i w�a�nie dlatego odizolowa�em go od naszych.

	B_LogEntry (TOPIC_Aran_quest, "Gestath mi nie pomo�e... Musz� uda� si� do kogo�, kto ma rad� na wszystko!");
	GESTATH_ARAN = TRUE;
};


var int GestathMiejsceOpisane;
//*********************************************************************
//	Info ObozWypadowy
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_ObozWypadowy   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 11;
 	condition   = DIA_NASZ_213_Gestath_ObozWypadowy_Condition;
 	information = DIA_NASZ_213_Gestath_ObozWypadowy_Info;
 	permanent   = FALSE;
 	description = "Czy masz dla mnie jakie� zadanie?";
};

FUNC INT DIA_NASZ_213_Gestath_ObozWypadowy_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_213_Gestath_ObozWypadowy_Info()
{
	AI_Output (other,self ,"DIA_NASZ_213_Gestath_ObozWypadowy_15_00"); //Czy masz dla mnie jakie� zadanie?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ObozWypadowy_55_01"); //Ja nie. Ale je�li tutaj nikt nie chce twojej pomocy, to mo�esz zajrze� do obozu wypadowego.
	
	if (WillKnowObozWypadowy == FALSE) {
		AI_Output (other, self,"DIA_NASZ_213_Gestath_ObozWypadowy_55_02"); //Gdzie jest ten ob�z?
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ObozWypadowy_08_04"); //Hmm... Masz przy sobie porz�dn� map�?
	
		if (Npc_HasItems (other,ItWr_Map_OldWorld) == FALSE)
		{
			AI_Output	(other, self, "DIA_NASZ_213_Gestath_ObozWypadowy_15_07"); //Nie.
			AI_Output	(self, other, "DIA_NASZ_213_Gestath_ObozWypadowy_08_08"); //W takim razie chyba musz� ci opisa� to miejsce.
			AI_Output	(self, other, "DIA_NASZ_213_Gestath_ObozWypadowy_08_09"); //Id� na po�udnie, wzd�u� palisady. Gdy natrafisz na w�w�z nie do przebycia, skr�� w prawo w stron� g�r. Jestem przekonany, �e zobaczysz to miejsce. 
			GestathMiejsceOpisane = TRUE;
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_213_Gestath_Landkarte		(C_INFO)
{
	npc			 = 	NASZ_213_Gestath;
	nr		 	 = 	12;
	condition	 = 	DIA_NASZ_213_Gestath_Landkarte_Condition;
	information	 = 	DIA_NASZ_213_Gestath_Landkarte_Info;
	permanent    =  FALSE;
	description	 = 	"Mam tu tak� map�. Mo�e by�?";
};

func int DIA_NASZ_213_Gestath_Landkarte_Condition ()
{
	if ((Npc_KnowsInfo (other, DIA_NASZ_213_Gestath_ObozWypadowy)) && (!Npc_KnowsInfo (other, DIA_NASZ_201_Erak_PreHello))
	&& (Npc_HasItems (other,ItWr_Map_OldWorld))
	&& (WillKnowObozWypadowy == FALSE)) && (GestathMiejsceOpisane == FALSE)
		{
			return TRUE;
		};
};

func void DIA_NASZ_213_Gestath_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_213_Gestath_Landkarte_15_00"); //Mam tu tak� map�. Mo�e by�?
	AI_Output	(self, other, "DIA_NASZ_213_Gestath_Landkarte_08_01"); //Mo�e. Zaraz zaznacz� ci, gdzie jest to miejsce.
	B_GiveInvItems (other, self, ItWr_Map_OldWorld,1);
	AI_Output	(self, other, "DIA_NASZ_213_Gestath_Landkarte_08_02"); //Prosz�, oto twoja mapa.
	
	Npc_RemoveInvItems	(self,ItWr_Map_OldWorld ,1 );
	CreateInvItems (self, ItNa_Mapa_ObozWypadowy, 1);									
	B_GiveInvItems (self, other, ItNa_Mapa_ObozWypadowy, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info VickGold
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_213_Gestath_VickGold		(C_INFO)
{
	npc			 = 	NASZ_213_Gestath;
	nr		 	 = 	13;
	condition	 = 	DIA_NASZ_213_Gestath_VickGold_Condition;
	information	 = 	DIA_NASZ_213_Gestath_VickGold_Info;
	permanent    =  FALSE;
	description	 = 	"Pomog�em Vickowi dostarczy� mi�so do obozu.";
};

func int DIA_NASZ_213_Gestath_VickGold_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_NASZ_204_Vick_SecondStop))
		{
			return TRUE;
		};
};

func void DIA_NASZ_213_Gestath_VickGold_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_213_Gestath_VickGold_15_00"); //Pomog�em Vickowi dostarczy� mi�so do obozu.
	AI_Output	(self, other, "DIA_NASZ_213_Gestath_VickGold_08_01"); //Robi�e� za ochroniarza? No dobra, masz tu ma�� nagrod�.

	CreateInvItems (self, ItMi_Gold, 80);
	B_GiveInvItems (self, other, ItMi_Gold, 80);
};

var int GestathRenegatOK;
var int GestathRenegatOneTime;
///////////////////////////////////////////////////////////////////////
//	Info WantToKillRenegat
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_213_Gestath_WantToKillRenegat		(C_INFO)
{
	npc			 = 	NASZ_213_Gestath;
	nr		 	 = 	14;
	condition	 = 	DIA_NASZ_213_Gestath_WantToKillRenegat_Condition;
	information	 = 	DIA_NASZ_213_Gestath_WantToKillRenegat_Info;
	permanent    =  TRUE;
	description	 = 	"Mog� liczy� na wsparcie w walce z Marcosem?";
};

func int DIA_NASZ_213_Gestath_WantToKillRenegat_Condition ()
{
	if (WillWantToKillRenegats == TRUE) && (GestathRenegatOK == FALSE) && !(npc_isdead (NASZ_009_Marcos)) && !(hero.guild == GIL_DJG)
		{
			return TRUE;
		};
};

func void DIA_NASZ_213_Gestath_WantToKillRenegat_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_213_Gestath_WantToKillRenegat_15_00"); //Mog� liczy� na wsparcie w walce z Marcosem?
	if !(hero.guild == GIL_OUT) && (GestathRenegatOneTime == FALSE) {
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_01"); //Z Marcosem? Tym paladynem renegatem?
		AI_Output	(other, self, "DIA_NASZ_213_Gestath_WantToKillRenegat_15_02"); //Dok�adnie. Musz� pom�c innym kopaczom si� stamt�d wydosta�.
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_03"); //Do��cz do nas. Wtedy porozmawiamy o tym ponownie.
		
		GestathRenegatOneTime = TRUE;
		B_LogEntry (TOPIC_Korth_kopalnia, "Gestath pomo�e mi, je�li do��cz� do my�liwych.");
	}
	else if !(hero.guild == GIL_OUT) && (GestathRenegatOneTime == TRUE) {
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_04"); //Nie.
	}
	else {
		
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_05"); //Tak. Jeste� ju� jednym z nas, dotrzymam obietnicy. Powiedz co� wi�cej.
		AI_Output	(other, self, "DIA_NASZ_213_Gestath_WantToKillRenegat_15_06"); //Marcos jest schowany w kopalni - za palisad�. Chc� si� tam jako� dosta�.
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_07"); //Zapewne bram� da si� otworzy� tylko od wewn�trz... Mo�e znajdziesz gdzie� szpar� mi�dzy deskami?
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_08"); //We� ten magiczny zw�j. Przemiana w chrz�szcza to bardzo u�yteczne zakl�cie.
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_09"); //Zabierz ze sob� Kivo, Louisa i Vachuta. Niech pomog� naszemu nowemu przyjacielowi.
		
		CreateInvItems (self, ItNa_TrfMeatbug, 1);									
		B_GiveInvItems (self, other, ItNa_TrfMeatbug, 1);
		
		B_LogEntry (TOPIC_Korth_kopalnia, "W ko�cu nadszed� czas powrotu do kopalni. Tym razem jednak ju� nie jako kopacz, a jako my�liwy! Gestath da� mi zw�j przemiany w chrz�szcza. Mo�e gdzie� mi�dzy deskami palisady b�dzie jaka� ma�a dziura, dzi�ki kt�rej przedostan� si� do �rodka. Mam zabra� ze sob� Vachuta, Kivo i Louisa.");
		
		GestathRenegatOK = TRUE;
		
	};
};

///////////////////////////////////////////////////////////////////////
//	Info FromJehen
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_213_Gestath_FromJehen		(C_INFO)
{
	npc			 = 	NASZ_213_Gestath;
	nr		 	 = 	15;
	condition	 = 	DIA_NASZ_213_Gestath_FromJehen_Condition;
	information	 = 	DIA_NASZ_213_Gestath_FromJehen_Info;
	permanent    =  FALSE;
	description	 = 	"Przynosz� trofea Jehena.";
};

func int DIA_NASZ_213_Gestath_FromJehen_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_232_Jehen_ProwadzenieKoniec))
	&& (npc_hasitems (other,ItNa_JehenPaczkaZFutrami) >= 1)
	&& (npc_hasitems (other,ItNa_JehenPaczkaZMiesem) >= 1)
	
	{
		return TRUE;
	};
};

func void DIA_NASZ_213_Gestath_FromJehen_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_213_Gestath_FromJehen_15_00"); //Przynosz� trofea Jehena.
	B_GiveInvItems (other, self, ItNa_JehenPaczkaZFutrami, 1);
	B_GiveInvItems (other, self, ItNa_JehenPaczkaZMiesem, 1);
	Npc_RemoveInvItems (self, ItNa_JehenPaczkaZFutrami, 1);
	Npc_RemoveInvItems (self, ItNa_JehenPaczkaZMiesem, 1);

	AI_Output	(self, other, "DIA_NASZ_213_Gestath_FromJehen_08_01"); //To znaczy, �e wr�ci� ju� do obozu? Doskonale, przeka� mu prosz� te sto strza�.
	CreateInvItems (self, ItRw_Arrow, 100);
	B_GiveInvItems (self, other, ItRw_Arrow, 100);	
	
};




func void WillSay_WhereIsAbandonedMine() {
	AI_Output (other,self ,"WillSay_WhereIsAbandonedMine_15_00"); //Gdzie jest ta Opuszczona Kopalnia?
	AI_Output (self, other,"WillSay_WhereIsAbandonedMine_55_01"); //Nie wiesz? Ch�opie! Przecie� to ta najbli�ej Starej Wie�y Demon�w.
	AI_Output (self, other,"WillSay_WhereIsAbandonedMine_55_02"); //Niegdy� zaj�ta przez pe�zacze. O ile si� nie myl�, to przebywa� tam kiedy� paladyn Silvestro. M�wi ci to co�?
	AI_Output (self, other,"WillSay_WhereIsAbandonedMine_55_03"); //Na pewno tam trafisz.

	
	B_LogEntry (TOPIC_Gestath_renegaci, "Opuszczona Kopalnia znajduje si� w okolicy Starej Wie�y Demon�w.");
};

func void WillSay_AnyAdvices() {
	AI_Output (other,self ,"WillSay_AnyAdvices_15_00"); //Masz dla mnie jakie� rady?
};

func void GestathSay_Becareful() {
	AI_Output (self, other,"GestathSay_Becareful_55_03"); //Przede wszystkim uwa�aj.
};

func void GestathSay_AboutBandits() {

	AI_Output (self, other,"DIA_NASZ_213_Gestath_GestathSay_AboutBandits_55_00"); //Pos�uchaj: Kilka dni temu, jeden ze zwiadowc�w, zauwa�y� co� dziwnego.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_GestathSay_AboutBandits_55_01"); //Dw�ch ludzi w Opuszczonej Kopalni. Nie wiadomo kim s�, ani tym bardziej czego chc�. Wybierzesz si� tam i sprawdzisz, o co chodzi.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_GestathSay_AboutBandits_55_02"); //Mam ich zabi�?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_GestathSay_AboutBandits_55_03"); //Je�li twoim zdaniem stanowi� zagro�enie, to tak.
};

//*********************************************************************
//	Info RenegaciDJG
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_RenegaciDJG   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 20;
 	condition   = DIA_NASZ_213_Gestath_RenegaciDJG_Condition;
 	information = DIA_NASZ_213_Gestath_RenegaciDJG_Info;
 	permanent   = FALSE;
 	description = "Przysy�a mnie Keroloth.";
};

FUNC INT DIA_NASZ_213_Gestath_RenegaciDJG_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_WhatToDoKap2))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciDJG_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciDJG_55_00"); //Przysy�a mnie Keroloth.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciDJG_55_01"); //Ciebie? Chyba nie docenia powagi tej sprawy...
	AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciDJG_55_02"); //Ja doceniam. I jestem przekonany, �e podo�am wyzwaniu.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciDJG_55_03"); //Zobaczymy...
	
	GestathSay_AboutBandits();

	B_LogEntry (TOPIC_Gestath_renegaci, "Pono� w Opuszczonej Kopalni zauwa�ono ludzi. Moim zadaniem jest dowiedzie� si�, kim oni s�, a je�li zajdzie taka potrzeba to ich zabi�.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "W G�rniczej Dolinie pojawili si� ludzie nieb�d�cy ani my�liwymi, ani �owcami ork�w.");

	
	WillKnowQuestRenegaci = TRUE;

	Info_ClearChoices (DIA_NASZ_213_Gestath_RenegaciDJG);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_RenegaciDJG, "Gdzie jest ta Opuszczona Kopalnia?", DIA_NASZ_213_Gestath_RenegaciDJG_where);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_RenegaciDJG, "Masz dla mnie jakie� rady?", DIA_NASZ_213_Gestath_RenegaciDJG_how);
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciDJG_where()
{
	WillSay_WhereIsAbandonedMine();
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciDJG_how()
{

	WillSay_AnyAdvices();
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciDJG_how_55_01"); //Potrafisz chyba walczy�? Uwa�aj na nich, mog� znacznie przewy�sza� ci� swoimi umiej�tno�ciami.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciDJG_how_55_02"); //Zachowaj rozwag� i nie zbli�aj si� do nich zanadto, zanim dobrze nie przyjrzysz si� tej dw�jce.
	GestathSay_Becareful();	

	B_LogEntry (TOPIC_Gestath_renegaci, "Gestath poradzi� mi, bym przyjrza� si� tej dw�jce z daleka zanim ich zabij�.");
};



//*********************************************************************
//	Info RenegaciOUT
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_RenegaciOUT   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 21;
 	condition   = DIA_NASZ_213_Gestath_RenegaciOUT_Condition;
 	information = DIA_NASZ_213_Gestath_RenegaciOUT_Info;
 	permanent   = FALSE;
 	description = "Co mam teraz zrobi�?";
};

FUNC INT DIA_NASZ_213_Gestath_RenegaciOUT_Condition()
{
	if (hero.guild == GIL_OUT)
	&& (KOPACZE_URATOWANI == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciOUT_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciOUT_55_00"); //Co mam teraz zrobi�?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciOUT_55_01"); //Hmm... Jestem pod wra�eniem twojego zapa�u. Upora�e� si� ze swoimi k�opotami, pora na inne k�opoty.

	GestathSay_AboutBandits();

	Log_CreateTopic (TOPIC_Gestath_Renegaci, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gestath_renegaci, LOG_RUNNING);
	B_LogEntry (TOPIC_Gestath_renegaci, "W dawnej kopalni Silvestra zauwa�ono dw�jk� ludzi w nieznanych pancerzach. Moim zadaniem jest dowiedzie� si�, kim oni s�, a je�li zajdzie taka potrzeba, to ich zabi�.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "W G�rniczej Dolinie pojawili si� ludzie nieb�d�cy ani my�liwymi, ani �owcami ork�w.");
	
	WillKnowQuestRenegaci = TRUE;
	
	Info_ClearChoices (DIA_NASZ_213_Gestath_RenegaciOUT);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_RenegaciOUT, "Gdzie jest ta Opuszczona Kopalnia?", DIA_NASZ_213_Gestath_RenegaciOUT_where);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_RenegaciOUT, "Masz dla mnie jakie� rady?", DIA_NASZ_213_Gestath_RenegaciOUT_how);
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciOUT_where()
{
	WillSay_WhereIsAbandonedMine();
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciOUT_how()
{
	WillSay_AnyAdvices();
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciOUT_how_55_01"); //Wykorzystaj swoje umiej�tno�ci. Skradaj si� i strzelaj z �uku w razie potrzeby.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciOUT_how_55_02"); //Na twoim miejscu nie zbli�a�bym si� do nich zanadto, zanim nie przyjrza�bym si� tej dw�jce.
	GestathSay_Becareful();
	
	if (Npc_HasItems (other,ItRi_Dex_02) == FALSE) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciOUT_how_55_04"); //We� ten pier�cie�. Jestem pewien, �e ci si� przyda.
		Createinvitems (self, ItRi_Dex_02, 1);
		B_Giveinvitems (self, other, ItRi_Dex_02, 1);
	};

	B_LogEntry (TOPIC_Gestath_renegaci, "Gestath poradzi� mi, bym przyjrza� si� tej dw�jce z daleka.");
};

var int BANDZIOR_KILLED;
var int BANDZIOR_LIST;
//*********************************************************************
//	Info RenegaciInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_RenegaciInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 22;
 	condition   = DIA_NASZ_213_Gestath_RenegaciInfo_Condition;
 	information = DIA_NASZ_213_Gestath_RenegaciInfo_Info;
 	permanent   = TRUE;
 	description = "Powiem ci, czego si� dowiedzia�em.";
};

FUNC INT DIA_NASZ_213_Gestath_RenegaciInfo_Condition()
{
	if (KAPITEL == 2)
		&& (BANDZIOR_KILLED == FALSE || BANDZIOR_LIST == FALSE)
		&& (npc_knowsinfo(other,DIA_NASZ_213_Gestath_RenegaciOUT)
		 || npc_knowsinfo(other,DIA_NASZ_213_Gestath_RenegaciDJG))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_00"); //Powiem ci, czego si� dowiedzia�em.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_01"); //Tak?	

		if ((npc_isdead (NASZ_301_Bandzior) && npc_isdead (NASZ_302_Bandzior) && (!BANDZIOR_KILLED))
		|| (npc_hasitems (other, ItNa_ListBandyci) >=1 && (!BANDZIOR_LIST))) {

			if (npc_isdead (NASZ_301_Bandzior) && npc_isdead (NASZ_302_Bandzior) && (!BANDZIOR_KILLED)) {
				AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_02"); //Zabi�em tych ludzi.
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_03"); //I? Widzia�e� ich z bliska. Mo�esz co� o nich powiedzie�?
				AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_04"); //Rzucili si� na mnie. Ich zbroje nie przypomina�y �adnych z tych, kt�re nosz� my�liwi albo �owcy ork�w.
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_05"); //To ciekawe... Wida� nie jeste�my sami w tej dziurze. Trzeba si� czego� o nich dowiedzie�.

				BANDZIOR_KILLED = TRUE;
			};

			if (npc_hasitems (other, ItNa_ListBandyci) >=1 && (!BANDZIOR_LIST)) {
				AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_06"); //Znalaz�em ten list.
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_07"); //Poka� go.
				B_UseFakeScroll();
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_08"); //No, no. To chyba okre�la miejsce ich obozu. Ciekawe, kto to taki ten Nod.

				BANDZIOR_LIST = TRUE;
				//B_LogEntry (TOPIC_Gestath_Renegaci, "");
			};
		}

			else {
				AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_09"); //Niczego nowego.
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_10"); //Wi�c po co robisz mi nadziej� na jakie� informacje? Bierz si� do roboty!
			};
		
		if ((BANDZIOR_KILLED == TRUE) && (BANDZIOR_LIST == TRUE)) {
			AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_11"); //No dobra... W takim razie przed tob� kolejne zadanie.
			AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_12"); //Niech zgadn�. Mam przenikn�� do ich obozu i dowiedzie� si�, czego tu szukaj�?
			AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_13"); //Wymagasz od siebie wi�cej, ni� bym ci� poprosi�. Ale niech tak b�dzie!
			AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_14"); //Je�li chcesz prze�y� w ich towarzystwie, to lepiej za�atw sobie taki pancerz, jaki nosz�.
			AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_15"); //Dowiedz si� od nich tyle, ile dasz rad�. Powodzenia.
			
			B_LogEntry (TOPIC_Gestath_Renegaci, "Musz� przenikn�� do obozu tamtych ludzi i dowiedzie� si�, po co przybyli do G�rniczej Doliny. Szef my�liwych zasugerowa� mi, �ebym za�atwi� sobie taki sam pancerz, jaki mieli tamci ludzie.");
		};
};

//*********************************************************************
//	Info BamInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_BamInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 23;
 	condition   = DIA_NASZ_213_Gestath_BamInfo_Condition;
 	information = DIA_NASZ_213_Gestath_BamInfo_Info;
 	permanent   = FALSE;
 	description = "Jeden z bandyt�w chce wiedzie�, co z kopalni�.";
};

FUNC INT DIA_NASZ_213_Gestath_BamInfo_Condition()
{
	if (hero.guild == GIL_OUT)
	&& (npc_knowsinfo (other, DIA_NASZ_304_Bam_quest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_BamInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_BamInfo_55_00"); //Jeden z bandyt�w chce wiedzie�, co z kopalni�.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BamInfo_55_01"); //T�, w kt�rej pracowa�e�?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_BamInfo_55_02"); //W�a�nie tak. Nie mog� mu przecie� powiedzie�, �e wszyscy paladyni nie �yj�, a kopacze zostali uwolnieni.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BamInfo_55_03"); //Mo�esz mu po prostu da� troch� rudy i powiedzie�, �e to od nich. My�l�, �e jakie� dwadzie�cia bry�ek wystarczy.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BamInfo_55_04"); //A je�li nie zdo�asz tyle uzbiera�, to zapytaj Kerolotha, czy nie da si� tego rozwi�za� bardziej subtelnie.

	B_LogEntry (TOPIC_Bam_kopalnia, "Gestath zasugerowa� mi, �eby da� bandycie 20 bry�ek rudy i sk�ama�, �e to dostawa od paladyn�w. Mog� te� zapyta� Kerolotha, co on o tym s�dzi");
};


//*********************************************************************
//	Info NiewolnicyInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_NiewolnicyInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 23;
 	condition   = DIA_NASZ_213_Gestath_NiewolnicyInfo_Condition;
 	information = DIA_NASZ_213_Gestath_NiewolnicyInfo_Info;
 	permanent   = FALSE;
 	description = "W obozie bandyt�w s� niewolnicy.";
};

FUNC INT DIA_NASZ_213_Gestath_NiewolnicyInfo_Condition()
{
	if (WCHODZENIE_BANDYCI == TRUE) && (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_NiewolnicyInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_NiewolnicyInfo_55_00"); //W Obozie Bandyt�w s� niewolnicy.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_NiewolnicyInfo_55_01"); //Na razie nic z tym nie mo�emy zrobi�.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_NiewolnicyInfo_55_02"); //Spr�buj si� z nimi skontaktowa�... Mo�e b�dziesz m�g� im w czym� pom�c.
};

//*********************************************************************
//	Info ArtefaktInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_ArtefaktInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 24;
 	condition   = DIA_NASZ_213_Gestath_ArtefaktInfo_Condition;
 	information = DIA_NASZ_213_Gestath_ArtefaktInfo_Info;
 	permanent   = FALSE;
 	description = "Wiem ju� ca�kiem sporo o bandytach.";
};

FUNC INT DIA_NASZ_213_Gestath_ArtefaktInfo_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_coteraz))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_ArtefaktInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_00"); //Wiem ju� ca�kiem sporo o bandytach.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_01"); //Domy�lam si�. D�ugo o niczym nie m�wi�e�. A wi�c wiesz ju�, jak si� tu dostali i czego chc�?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_02"); //Przedostali si� tutaj przez g�ry. Ich statek troch� ucierpia�. Cz�� z nich zosta�a na pla�y i go naprawia.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_03"); //Oko�o dwudziestu z nich przebi�o si� przez g�ry i za�o�y�o ob�z na po�udniu G�rniczej Doliny. Chc� wydobywa� rud� i sprzedawa� j� kr�lowi.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_04"); //Ale ich szef szuka chyba czego� innego...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_05"); //Czekaj, czekaj. Powiedzia�e�, �e przebili si� tu przez g�ry?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_06"); //Tak, ale wszyscy twierdz�, �e to droga bez powrotu. Raczej tamt�dy nie uciekniemy.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_07"); //Faktycznie, w tamtych g�rach mieszkaj� dzikie plemiona ork�w. Podr� przez po�udniowe g�ry to fatalny pomys�. Poza tym nie mieliby�my w�a�nego statku, by odp�yn�� z wybrze�a. A co z tym ich szefem?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_08"); //Chce si� przedosta� na jeden z klif�w. Wys�a� mnie na poszukiwania cz�ci pewnego artefaktu, kt�ry mu to umo�liwi.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_09"); //Znalaz�em ju� je wszystkie i mam je teraz po��czy�.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_10"); //Uwa�aj na tego cz�owieka. Nasi stra�nicy b�d� ci� mieli na oku, a ty zanim oddasz gotowy artefakt ich szefowi, nabroisz troch� w ich obozie.
};

//*********************************************************************
//	Info WhatToDoInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_WhatToDoInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 25;
 	condition   = DIA_NASZ_213_Gestath_WhatToDoInfo_Condition;
 	information = DIA_NASZ_213_Gestath_WhatToDoInfo_Info;
 	permanent   = FALSE;
 	description = "Co mam zrobi�?";
};

FUNC INT DIA_NASZ_213_Gestath_WhatToDoInfo_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_ArtefaktInfo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_WhatToDoInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_01"); //Przede wszystkim ogranicz im dost�p do jedzenia. Maj� tam jakie� zapasy?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_02"); //Maj� owce...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_03"); //�wietnie, w takim razie musisz ur�n�� je wszystkie. Kolejne pytanie: Jak wygl�da ich palisada?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_04"); //Grube k�ody stoj�ce bardzo blisko siebie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_05"); //B�dzie trzeba co� z tym zrobi�... We� ten tasak i obr�b troch� te dechy gdzie� z boku ich palisady. Z zewn�trz i od wewn�trz.
	Createinvitems (self, ItMw_1h_Sld_Axe, 1);
	B_Giveinvitems (self, other, ItMw_1h_Sld_Axe, 1);	
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_06"); //Tak, �eby�my mogli tam wkroczy� w razie potrzeby. I na koniec pod�� w jakie� ustalone miejsce paczki z broni�.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_07"); //Te trzy powinny wystarczy�.
	Createinvitems (self, ItNa_PaczkaZBronia, 3);
	B_Giveinvitems (self, other, ItNa_PaczkaZBronia, 3);	
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_08"); //Zostawi� je w skrzyni niewolnik�w przy obr�banych deskach.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_09"); //Niech b�dzie. Nie daj si� z�apa�!
	
	B_LogEntry (TOPIC_Gestath_renegaci, "Zanim oddam Nodowi artefakt, musz� nabroi� w obozie.");
	
	MIS_Psikusy_Ready = TRUE;
	ff_applyonceext(Psikusy,1000,-1);

	Log_CreateTopic (TOPIC_Gestath_psikus, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gestath_psikus, LOG_RUNNING);
	B_LogEntry (TOPIC_Gestath_psikus, "Musz� w nocy poza�atwia� pewne sprawy w obozie bandyt�w. Pierwsza z nich to ub�j owiec. Nast�pnie musz� obr�ba� deski palisady od zewn�trz i od wewn�trz, aby u�atwi� wej�cie do obozu my�liwym. Zrobi� to na odcinku mi�dzy Domenicem a miejscem, w kt�rym wieczorami odpoczywaj� niewolnicy. B�d� tylko musia� odci�gn�� Domenica... Tam te� postanowi�em zostawi� paczki z broni�: Schowam je w kufrze obok niewolnik�w.");

};

// ----- ----- -----
FUNC INT DESKA_PAL_BAN_1_COND() {
	if(MIS_Psikusy_Ready > 0)
	&&((Wld_IsTime(22,00,00,00)) || (Wld_IsTime(00,00,03,00)))
	&&(MIS_Psikusy_Domenic_Odlecial == TRUE)
	{ 
		return true;
	}
	else if(npc_hasitems(hero,ItMw_1h_Sld_Axe)==0) {
		CreateInvItems(hero,ItMw_1h_Sld_Axe,1);
	};
	
	return false;
};

var int Deska_Pal_Ban_1_OneTime;
FUNC VOID DESKA_PAL_BAN_1_DO_S1() {
	if(Deska_Pal_Ban_1_OneTime == 0) {
		Print("Na wszelki wypadek powinienem uderzy� jeszcze raz...");
		Deska_Pal_Ban_1_OneTime = 1;
		
		if(Deska_Pal_Ban_2_OneTime == TRUE) {
			MIS_Psikusy_Ready = MIS_Psikusy_Ready + 1;
			B_LogEntry (TOPIC_Gestath_psikus, "Zaj��em si� deskami.");
			MIS_Psikusy_Domenic_Odlecial = FALSE;
			Npc_ExchangeRoutine (NASZ_326_Domenic, "Start");
		};
		
	};
};

FUNC INT DESKA_PAL_BAN_2_COND() {
	if(MIS_Psikusy_Ready > 0)
	&&((Wld_IsTime(22,00,00,00)) || (Wld_IsTime(00,00,03,00)))
	{ 
		return true;
	};
	
	return false;
};

var int Deska_Pal_Ban_2_OneTime;
FUNC VOID DESKA_PAL_BAN_2_DO_S1() {
	if(Deska_Pal_Ban_2_OneTime == 0) {
		Deska_Pal_Ban_2_OneTime = 1;

		if(Deska_Pal_Ban_1_OneTime == TRUE) {
			MIS_Psikusy_Ready = MIS_Psikusy_Ready + 1;
			B_LogEntry (TOPIC_Gestath_psikus, "Zaj��em si� deskami.");
		};

	};
};


//*********************************************************************
//	Info KapThree
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_KapThree   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 30;
 	condition   = DIA_NASZ_213_Gestath_KapThree_Condition;
 	information = DIA_NASZ_213_Gestath_KapThree_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_213_Gestath_KapThree_Condition()
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_033_TO_CAVE2"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_KapThree_Info()
{
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_00"); //No prosz�, to� to nasz bohater.
	AI_Output (other,self ,"DIA_NASZ_213_Gestath_KapThree_55_01"); //Co tu si� sta�o?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_02"); //No widzisz, kiedy ty poszed�e� wraz z bandytami na ten klif, ob�z zosta� niemal niebroniony.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_03"); //W pi�ciu, bez najmniejszego problemu poradzili�my sobie z resztk� bandyt�w. P�niej jeszcze przysz�o ich kilku, ale byli tak zdezorientowani... Ha, ha! Nie zdo�ali nawet doby� broni, a ju� padli trupem!
	AI_Output (other,self ,"DIA_NASZ_213_Gestath_KapThree_55_04"); //Tak, a ich elita czeka�a na mnie i chcieli ze mn� zrobi� to samo!
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_05"); //Widz�, �e jednak wyszed�e� z tego ca�o.
	
	if (hero.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_06"); //Dobra robota, Willu, �wietnie si� spisa�e�. Od tego momentu zostajesz stra�nikiem.
		Createinvitems (self, ITNA_OUT_H, 1);
		B_Giveinvitems (self, other, ITNA_OUT_H, 1);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_07"); //No� ten pancerz z dum�, bo �wiadczy o twych wybitnych umiej�tno�ciach.
		AI_EquipBestArmor (other);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_08"); //Chyba, �e chcia�by� mie� taki jak ja? Dogadaj si� z Huntem.
	};

	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_09"); //Dobra robota Willu, �wietnie si� spisa�e�. Keroloth z pewno�ci� b�dzie dumny, �e ma takiego wojownika w swojej za�odze.
	};

	B_Kapitelwechsel		(3, NEWWORLD_ZEN );
	Gestath_Stopowanie = FALSE;
	
	B_LogEntry (TOPIC_Gestath_renegaci, "Ju� po wszystkim... Chocia� jedno zagro�enie mniej w G�rniczej Dolinie.");
	Log_SetTopicStatus (TOPIC_Gestath_renegaci, LOG_SUCCESS);
	B_GivePlayerXP (1000);
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Gestath wraz z innymi my�liwymi przej�li ob�z bandyt�w. Powinienem zg�osi� si� do Kerolotha. Czy�by kolejne wyzwania?");
	
	B_LogEntry (TOPIC_Niedostepny_Klif, "Gestath i stra�nicy za�atwili reszt� bandyt�w.");
	Log_SetTopicStatus (TOPIC_Niedostepny_Klif, LOG_SUCCESS);

	Info_ClearChoices (DIA_NASZ_213_Gestath_KapThree);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_KapThree, "Co teraz?", DIA_NASZ_213_Gestath_KapThree_what);

};

FUNC VOID DIA_NASZ_213_Gestath_KapThree_what()
{

	AI_Output (other,self ,"DIA_NASZ_213_Gestath_KapThree_where_15_00"); //Co teraz?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_where_55_01"); //Na razie mo�esz odpocz��. Ale zg�o� si� do Kerolotha w najbli�szym czasie. Z pewno�ci� mu si� przydasz w jego podbojach.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_where_55_02"); //Je�li chodzi o ten ob�z, to dowodzi� b�dzie tu Erak. Je�li czego� chcesz, to z nim to za�atwiaj. Ja wracam do siebie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_where_55_03"); //Do zobaczenia.

	Npc_ExchangeRoutine (self, "Start");
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Keroloth
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_keroloth   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 31;
 	condition   = DIA_NASZ_213_Gestath_keroloth_Condition;
 	information = DIA_NASZ_213_Gestath_keroloth_Info;
 	permanent   = FALSE;
 	description = "Przybywam z wiadomo�ci� od Kerolotha.";
};

FUNC INT DIA_NASZ_213_Gestath_keroloth_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_WhatNow)
		&& npc_hasitems (other, ItNa_List_Keroloth) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_keroloth_Info()
{

	AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_00"); //Przybywam z wiadomo�ci� od Kerolotha. �owcy ork�w chc� zaatakowa� i odbi� zamek, jednak aby si� tego podj��, potrzebuj� waszej pomocy.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_01"); //Udzia� tak doskonale wyszkolonych �ucznik�w w bitwie, da�by nam olbrzymi� przewag� nad si�ami wroga.
	B_giveinvitems (other, self, ItNa_List_Keroloth, 1);
	Npc_RemoveInvItems (self,ItNa_List_Keroloth, 1);
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_02"); //S�ysza�em o planach Kerolotha odno�nie zamku, jednak nie spodziewa�em si�, i� naprawd� podejmie si� tego ryzyka.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_03"); //Niestety, wi�kszo�� ze stra�nik�w jest zaj�ta swoimi sprawami i przebywaj� poza obozem.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_04"); //I oczywi�cie to ja musz� ich znale�� i grzecznie poprosi�, aby pomogli �owcom w wojnie. No dobra, kogo i gdzie szuka�?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_05"); //Erak razem z Kivo i Benito s� w Obozie Bandyt�w. Ka�dy z nich ma tam co� do roboty.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_06"); //Aran ci�gle stoi w jaskini obok obozu i dogl�da ork�w.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_07"); //Ammann... Chyba go jeszcze nie znasz. On ma specjalne zadanie. Wysla�em go po pier�cienie wierno�ci. O cholera! Zapomnia�em, �e kilka dni temu powiedzia�em mu, �e ci� do niego przy�l�... Mo�e by� z�y.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_08"); //No ja bym na jego miejscu u�miechni�ty nie by�.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_09"); //Jest nad obozowiskiem wypadowym Eraka. Pami�tasz, gdzie to jest? Id� po prostu w stron� kamiennej twierdzy w g�rach. Lepiej udaj si� tam od razu.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_10"); //Vachut jest oczywi�cie u siebie, to znaczy obok �owc�w ork�w. Szczerze m�wi�c, nie mam poj�cia, co teraz robi...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_11"); //Ostatni raz widzia�em go, gdy wraca�em z obozu bandyt�w. Wspomina� wtedy co� o jakich� dziwnych topielcach...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_12"); //Ayana powiniene� znale�� pod obozowiskiem wypadowym Eraka. Trzymaj si� rzeki i id� w d�, zgodnie z jej biegiem. O ile mnie pami�� nie myli, to gdzie� tam by� cmentarz ork�w.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_13"); //To b�dzie naprawd� ci�ka bitwa, do kt�rej nale�y si� sowicie przygotowa�. Orkowie to nie wargi czy z�bacze, dlatego zajmie nam to wi�cej czasu ni� przygotowanie do zwyczajnego polowania.
		
	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_14"); //Nie martw si� jednak o to, damy sobie rad� w obozie. Ty wracaj do Kerolotha i przeka� mu, �e ja i inni my�liwi staniemy po jego stronie.
		AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_15"); //Oczywi�cie, je�li osobi�cie przenios� im personalne zaproszenia...
	}
	else { // GIL_OUT
		AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_16"); //Oczywi�cie pomog�, w ko�cu jestem jednym z was.
		AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_17"); //Na nic innego nie liczy�em z twojej strony. Najlepiej bierzmy si� od razu do roboty, aby nie kaza� Kerolothowi czeka� ze szturmem. Im d�u�ej zwlekamy tym wi�ksza szansa, i� orkowie odkryj� co planujemy.
		
		B_LogEntry(TOPIC_Keroloth_Wojna,"Trzeba za�atwi� kilka spraw w obozie my�liwych.");
	};

	
	Log_CreateTopic (TOPIC_Ammann_wiernosc, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_RUNNING);
	B_LogEntry (TOPIC_Ammann_wiernosc, "Nad obozem wypadowym my�liwych czeka na mnie Ammann. Mamy za�atwi� jakie� pier�cienie wierno�ci.");
	
	B_LogEntry (TOPIC_Keroloth_pomoc, "Gestath wy�le swoich ludzi, tylko je�eli pomog� poza�atwia� im swoje sprawy. To b�dzie 6 stra�nik�w, Erak i on sam. Erak, Kivo i Benito s� w obozie bandyt�w, Aran w jaskini obok obozu, Ammann na �cie�ce do kamiennej twierdzy w g�rach, Vachut w swoim obozowisku obok �owc�w ork�w, a Ayana powinienem znale�� gdzie� przy jakim� orkowym cmentarzu.");
	
	Migration_LowcyToTwierdza();
	

	Wld_InsertNpc	(NASZ_218_Ammann,"PLATEAU_ROUND01");
	FF_ApplyOnceExt(TworzenieBroniGladiatorom,5000,-1);
};


//*********************************************************************
//	Info OUTDobarQuest
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_OUTDobarQuest   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 24;
 	condition   = DIA_NASZ_213_Gestath_OUTDobarQuest_Condition;
 	information = DIA_NASZ_213_Gestath_OUTDobarQuest_Info;
 	permanent   = FALSE;
 	description = "Od czego mog� zacz��?";
};

FUNC INT DIA_NASZ_213_Gestath_OUTDobarQuest_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth))
	&& (hero.guild == GIL_OUT)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_OUTDobarQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_00"); //Od czego mog� zacz��?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_01"); //Jak wiesz, wielu moich ludzi nie dysponuje zbyt wytrzyma�ymi pancerzami. Te co prawda s� w stanie zapewni� im ochron� przed k�ami wilka, lecz nie dadz� rady orkowej broni.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_02"); //Dlatego poleci�em Dobarowi, aby pomy�la� nad ewentualnym ulepszeniem ich pancerzy, �eby mieli wi�ksze szanse w trakcie walki.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_03"); //Z tego co wiem, ma ju� nawet pewien pomys�. M�g�by� mu pom�c?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_04"); //Oczywi�cie, ju� bior� si� do pracy.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_05"); //Zaczekaj, to nie wszystko. Jak ju� wspomnia�em, Erak opu�ci� ob�z wypadowy. Chcia�bym wiedzie�, co z my�liwymi, kt�rzy tam pozostali.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_06"); //Mo�liwe, �e b�d� potrzebowali twojej pomocy.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_07"); //Zajrz� tam, napewno.

	Log_CreateTopic (TOPIC_Dobar_pancerze, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dobar_pancerze, LOG_RUNNING);
	B_LogEntry (TOPIC_Dobar_pancerze, "Dobar opracowa� umocnion� wersj� pancerza i moim zadaniem jest mu pom�c.");

};

//*********************************************************************
//	Info AllIsReady
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_AllIsReady   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 24;
 	condition   = DIA_NASZ_213_Gestath_AllIsReady_Condition;
 	information = DIA_NASZ_213_Gestath_AllIsReady_Info;
 	permanent   = FALSE;
 	description = "Wszystko ju� jest gotowe.";
};

FUNC INT DIA_NASZ_213_Gestath_AllIsReady_Condition()
{
	if (hero.guild == GIL_OUT)
	&& (npc_knowsinfo(other,DIA_NASZ_205_Mysliwy_QuestDone)) // podle gady
	&& (npc_knowsinfo(other,DIA_NASZ_232_Jehen_Part2Finish)) // jehen
	&& (WillSkonczylZadanieDobaraPancerze) // ulepszenie pancerzy
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_AllIsReady_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_AllIsReady_55_00"); //Wszystko ju� jest gotowe.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_AllIsReady_55_01"); //Dobra robota. Mog� wi�c zostawi� ob�z i stawi� si� na pro�b� Kerolotha osobi�cie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_AllIsReady_55_02"); //Dzi�ki za pomoc, Willu.
	
	B_LogEntry (TOPIC_Keroloth_Wojna, "My�liwi w obozie maj� ju� wszystko, czego im by�o potrzeba. Mog� wr�ci� do Kerolotha.");

	KerolothMysliwi = KerolothMysliwi + 1;
	Npc_ExchangeRoutine (self, "Twierdza");
};




























//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_AmmannQuest   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 32;
 	condition   = DIA_NASZ_213_Gestath_AmmannQuest_Condition;
 	information = DIA_NASZ_213_Gestath_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "We� ten pier�cie�.";
};

FUNC INT DIA_NASZ_213_Gestath_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_AmmannQuest_15_00"); //We� ten pier�cie�.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	Npc_RemoveInvItems (self,ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_213_Gestath_AmmannQuest_15_01"); //Pier�cie� wierno�ci! A wi�c uporali�cie si� z tym razem z Ammannem. �wietna robota!

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		B_LogEntry (TOPIC_Ammann_wiernosc, "Rozda�em wszystkie pier�cienie.");
		Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_SUCCESS);
		B_GivePlayerXP (700);
		DodajReputacje(4,REP_MYSLIWI);
	};

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_213_Gestath_PICKPOCKET (C_INFO)
{
	npc			= NASZ_213_Gestath;
	nr			= 900;
	condition	= DIA_NASZ_213_Gestath_PICKPOCKET_Condition;
	information	= DIA_NASZ_213_Gestath_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_213_Gestath_PICKPOCKET_Condition()
{
	C_Beklauen (87);
};
 
FUNC VOID DIA_NASZ_213_Gestath_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_213_Gestath_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_213_Gestath_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_213_Gestath_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_213_Gestath_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_213_Gestath_PICKPOCKET_DoIt);
};

func void DIA_NASZ_213_Gestath_PICKPOCKET_DoIt()
{
	B_BeklauenGold(120);
	
	Info_ClearChoices (DIA_NASZ_213_Gestath_PICKPOCKET);
};
	
func void DIA_NASZ_213_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_213_Gestath_PICKPOCKET);
};
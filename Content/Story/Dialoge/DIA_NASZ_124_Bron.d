//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_EXIT   (C_INFO)
{
	npc         = NASZ_124_Bron;
	nr          = 999;
	condition   = DIA_NASZ_124_Bron_EXIT_Condition;
	information = DIA_NASZ_124_Bron_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_124_Bron_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_124_Bron_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_siema   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 1;
 	condition   = DIA_NASZ_124_Bron_siema_Condition;
 	information = DIA_NASZ_124_Bron_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_124_Bron_siema_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_124_Bron_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_124_Bron_siema_15_00"); //Nie próbuj niczego ukraœæ!

};

//*********************************************************************
//	Info Why
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_why   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 2;
 	condition   = DIA_NASZ_124_Bron_why_Condition;
 	information = DIA_NASZ_124_Bron_why_Info;
 	permanent   = FALSE;
 	description = "Dlaczego mia³bym coœ kraœæ?";
};

FUNC INT DIA_NASZ_124_Bron_why_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_124_Bron_why_Info()
{
	AI_Output (other,self ,"DIA_NASZ_124_Bron_why_15_00"); //Dlaczego mia³bym coœ kraœæ?
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_01"); //Tu trzymamy nasze zapasy.
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_02"); //Tak siê sk³ada, ¿e wczoraj zauwa¿y³em, ¿e zniknê³o kilka cennych przedmiotów, a co najwa¿niejsze brakuje wody œwiêconej ze Ÿróde³ w Geldern.
	AI_Output (other,self ,"DIA_NASZ_124_Bron_why_15_03"); //Co w niej takiego specjalnego?
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_04"); //W górach na zachód od Geldern, dawno temu, Adanos b³ogos³awi³ tamtejsze Ÿród³a.
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_05"); //Paladyni i Magowie Ognia czerpi¹ moc z ³ask Innosa. Legendy mówi¹ nawet o £zach Innosa. Adanos daje si³ê wszystkim ludziom.
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_06"); //Œwiête Ÿród³a zosta³y odciête przez magów wiele lat temu, ¿eby potencjalni wrogowie nie mieli dostêpu do czegoœ takiego. W obozie zosta³o tylko kilka buteleczek.
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_07"); //I w³aœnie jedn¹ z nich ukrad³ jakiœ dupek.

	Npc_ExchangeRoutine (self, "Start");
};

//*********************************************************************
//	Info Zgubiona
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_zgubiona   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 3;
 	condition   = DIA_NASZ_124_Bron_zgubiona_Condition;
 	information = DIA_NASZ_124_Bron_zgubiona_Info;
 	permanent   = FALSE;
 	description = "Spokojnie, mo¿e po prostu siê zawieruszy³a.";
};

FUNC INT DIA_NASZ_124_Bron_zgubiona_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_124_Bron_why))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_124_Bron_zgubiona_Info()
{
	AI_Output (other,self ,"DIA_NASZ_124_Bron_zgubiona_15_00"); //Spokojnie, mo¿e po prostu siê zawieruszy³a.
	AI_Output (self, other,"DIA_NASZ_124_Bron_zgubiona_55_01"); //Bardzo w to w¹tpiê. Kilka innych rzeczy równie¿ nie by³o na swoim miejscu.
	AI_Output (self, other,"DIA_NASZ_124_Bron_zgubiona_55_02"); //Mo¿e masz racjê, ale wydaje mi siê, ¿e jednak ktoœ w tym grzeba³. Idiota pewnie nie zdaje sobie sprawy z tego, jak potrzebne jest to, co ukrad³.

};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_zadanie   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 4;
 	condition   = DIA_NASZ_124_Bron_zadanie_Condition;
 	information = DIA_NASZ_124_Bron_zadanie_Info;
 	permanent   = FALSE;
 	description = "Poszukam tej wody.";
};

FUNC INT DIA_NASZ_124_Bron_zadanie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_124_Bron_zgubiona))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_124_Bron_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_124_Bron_zadanie_15_00"); //Poszukam tej wody.
	AI_Output (self, other,"DIA_NASZ_124_Bron_zadanie_55_01"); //To ma³a buteleczka, nie³atwo j¹ bêdzie znaleŸæ. Chyba, ¿e rzeczywiœcie ktoœ to ukrad³ i nadal co noc podkrada siê do zapasów...

	Log_CreateTopic (TOPIC_Bron_woda, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Bron_woda, LOG_RUNNING);
	B_LogEntry (TOPIC_Bron_woda, "Z zapasów ³owców orków zniknê³a woda œwiêcona. Jest szczególna, bo pochodzi ze Ÿróde³ w pobli¿u Geldern, które b³ogos³awi³ sam Adanos. Muszê znaleŸæ tê wodê. Bron podejrzewa, ¿e ktoœ podkrada siê do zapasów.");
	
	MIS_BRON_READY = TRUE;
	ff_applyonceext(BronQuest,1000,-1);
};

//*********************************************************************
//	Info NicNieMa
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_NicNieMa   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 4;
 	condition   = DIA_NASZ_124_Bron_NicNieMa_Condition;
 	information = DIA_NASZ_124_Bron_NicNieMa_Info;
 	permanent   = FALSE;
 	description = "Przez dwie noce nikogo nie nakry³em.";
};

FUNC INT DIA_NASZ_124_Bron_NicNieMa_Condition()
{
	if (DrugaNocStop == TRUE) && (Npc_GetDistToWP	(self, "NASZ_LOWCY_ZAPASY") <=1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_124_Bron_NicNieMa_Info()
{
	AI_Output (other,self ,"DIA_NASZ_124_Bron_NicNieMa_15_00"); //Przez dwie noce nikogo nie nakry³em.
	AI_Output (other, self,"DIA_NASZ_124_Bron_NicNieMa_55_01"); //Jesteœ pewien, ¿e po prostu nie zgubi³eœ tej wody?
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_02"); //Oczywiœcie, ¿e jestem pewien! Widocznie ten z³odziej nie ma teraz potrzeby nic podkradaæ.
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_03"); //Musimy go tam zwabiæ. Co mo¿e skusiæ rabusia?
	AI_Output (other, self,"DIA_NASZ_124_Bron_NicNieMa_55_04"); //Nie wiem... Mo¿e kawa³ dobrej kie³basy?
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_05"); //Kie³basy niekoniecznie, ale zupa grzybowa? To rarytas. A jej intensywny zapach zdradzi miejsce przechowania.
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_06"); //Engor na pewno jak¹œ ma.
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_07"); //W³ó¿ do mojej skrzyni talerz zupy i zaczaj siê w nocy. Masz tu klucz.

	Createinvitems (self, ItNa_KeyBron_Skrzynia, 1);
	B_giveinvitems (self, other, ItNa_KeyBron_Skrzynia, 1);

	AI_Output (other, self,"DIA_NASZ_124_Bron_NicNieMa_55_08"); //Zobaczymy, czy w koñcu siê uda.

	B_LogEntry (TOPIC_Bron_woda, "Bron zasugerowa³ mi, ¿ebym w³o¿y³ do jego skrzyni zupê grzybow¹, która swoim aromatem przyci¹gnie z³oczyñcê. Mogê kupiæ zupê u Engora.");
	

};

var int WillWydalZlodzieja_Bron;
//*********************************************************************
//	Info Done
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_done   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 4;
 	condition   = DIA_NASZ_124_Bron_done_Condition;
 	information = DIA_NASZ_124_Bron_done_Info;
 	permanent   = FALSE;
 	description = "Mam wodê œwiêcon¹.";
};

FUNC INT DIA_NASZ_124_Bron_done_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_123_Lowca_catch)
		&& (npc_hasitems (other, ItNa_WodaSwiecona_Adanos) >=1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_124_Bron_done_Info()
{

	AI_Output (other,self ,"DIA_NASZ_124_Bron_done_15_00"); //Mam wodê œwiêcon¹.
	AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_01"); //Poka¿.
	B_giveinvitems (other, self, ItNa_WodaSwiecona_Adanos, 1);	
	AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_02"); //Tak, to ta. Gdzie to znalaz³eœ?

	MIS_BRON_READY = FALSE;
	
	if (LOWCA_CATCH_PRIZE == TRUE) {
		AI_Output (other, self,"DIA_NASZ_124_Bron_done_55_03"); //Musia³em trochê poszukaæ, ale uda³o mi siê.
		AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_04"); //Czyli nikt nie krad³? Mam nadziejê, ¿e tak wa¿ny przedmiot ju¿ siê nie zawieruszy.

		B_LogEntry (TOPIC_Bron_woda, "Sk³ama³em, mówi¹c ¿e znalaz³em wodê w zapasach. Tak czy owak, Bron jest zadowolony.");
		B_GivePlayerXP (200);
		DodajReputacje (2, REP_LOWCY);		
	};

	if (LOWCA_CATCH_NO == TRUE) {
		WillWydalZlodzieja_Bron = TRUE;
		AI_Output (other, self,"DIA_NASZ_124_Bron_done_55_05"); //Mia³eœ racjê. Jeden z ³owców podkrada³ siê do zapasów i krad³.
		AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_06"); //Skurczybyk! Który to?
		AI_Output (other, self,"DIA_NASZ_124_Bron_done_55_07"); //Nie znam jego imienia. Czêsto trenuje u Rethona.
		AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_08"); //Za³atwiê tê sprawê ju¿ sam. Dobra robota, nowy.	

		Npc_ExchangeRoutine (NASZ_123_Lowca, "Banicja");
		Lowca123_NaBanicji = TRUE;
		B_LogEntry (TOPIC_Bron_woda, "£owca orków zostanie ukarany. I bardzo dobrze! Tacy ludzie nie s¹ potrzebni w obozie.");
		B_GivePlayerXP (400);
		DodajReputacje (3, REP_LOWCY);
	};

	AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_09"); //Ej, weŸ te mikstury. Przydadz¹ ci siê.

	Createinvitems (self, ItPo_Health_01, 4);
	B_giveinvitems (self, other, ItPo_Health_01, 4);	

	Log_SetTopicStatus (TOPIC_Bron_woda, LOG_SUCCESS);

};

//*********************************************************************
//	Info Udar
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_Udar   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 31;
 	condition   = DIA_NASZ_124_Bron_Udar_Condition;
 	information = DIA_NASZ_124_Bron_Udar_Info;
 	permanent   = FALSE;
 	description = "Z rozkazu Udara masz mi daæ wodê œwiêcon¹.";
};

FUNC INT DIA_NASZ_124_Bron_Udar_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_GraveMissionWhatToDo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_124_Bron_Udar_Info()
{

	AI_Output (other,self ,"DIA_NASZ_124_Bron_Udar_15_00"); //Z rozkazu Udara masz mi daæ wodê œwiêcon¹.
	AI_Output (self, other,"DIA_NASZ_124_Bron_Udar_55_01"); //Umówi³em siê z Udarem, ¿e j¹ kupisz.
	AI_Output (other,self ,"DIA_NASZ_124_Bron_Udar_15_02"); //O, a wiêc mieliœcie ju¿ wszystko omówione za moimi plecami? Niech was szlag.
	AI_Output (self, other,"DIA_NASZ_124_Bron_Udar_55_03"); //Kupuj i nie narzekaj, to nie s¹ jakieœ krocie.

};

//*********************************************************************
//	Info Buy
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_Buy   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 32;
 	condition   = DIA_NASZ_124_Bron_Buy_Condition;
 	information = DIA_NASZ_124_Bron_Buy_Info;
 	permanent   = TRUE;
 	description = "Sprzedaj mi wodê œwiêcon¹. (5 sztuk - 25 szt. z³ota)";
};

FUNC INT DIA_NASZ_124_Bron_Buy_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_124_Bron_Udar))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_124_Bron_Buy_Info()
{

	AI_Output (other,self ,"DIA_NASZ_124_Bron_Buy_15_00"); //Sprzedaj mi wodê œwiêcon¹.
	
	if (npc_hasitems (other, ItMi_Gold) >=25) {
		B_giveinvitems (other, self, ItMi_Gold, 25);	
		AI_Output (self, other,"DIA_NASZ_124_Bron_Buy_55_01"); //Proszê bardzo.
		Createinvitems (self, ItNa_WodaSwiecona_Adanos, 5);
		B_giveinvitems (self, other, ItNa_WodaSwiecona_Adanos, 5);
	}
	else {
		AI_Output (self,other ,"DIA_NASZ_124_Bron_Buy_15_02"); //Nie masz doœæ z³ota!
	};
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_124_Bron_HowAreYou   (C_INFO)
{
	npc         = NASZ_124_Bron;
 	nr          = 500;
 	condition   = DIA_NASZ_124_Bron_HowAreYou_Condition;
 	information = DIA_NASZ_124_Bron_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Zapasy nadal znikaj¹?";
};

FUNC INT DIA_NASZ_124_Bron_HowAreYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_124_Bron_zadanie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_124_Bron_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_124_Bron_HowAreYou_15_00"); //Zapasy nadal znikaj¹?
	
	if !(npc_knowsinfo (other, DIA_NASZ_124_Bron_done))
	{
		AI_Output (self, other,"DIA_NASZ_124_Bron_HowAreYou_55_01"); //Od czasu do czasu ktoœ coœ zakosi, ale najbardziej martwi mnie brak wody œwiêconej.
	}
	else
	{
		if (WillWydalZlodzieja_Bron) { 
			AI_Output (self, other,"DIA_NASZ_124_Bron_HowAreYou_55_02"); //Od kiedy z³odziej zosta³ zdemaskowany, nikt nie oœmiela siê zabraæ nawet jab³uszka!
		} else { 
			AI_Output (self, other,"DIA_NASZ_124_Bron_HowAreYou_55_03"); //A, powiem ci, ¿e nawet nie. Najwa¿niejsze, ¿e woda œwiêcona zosta³a odnaleziona!
		};
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_124_Bron_PICKPOCKET (C_INFO)
{
	npc			= NASZ_124_Bron;
	nr			= 900;
	condition	= DIA_NASZ_124_Bron_PICKPOCKET_Condition;
	information	= DIA_NASZ_124_Bron_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_124_Bron_PICKPOCKET_Condition()
{
	C_Beklauen (38);
};
 
FUNC VOID DIA_NASZ_124_Bron_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_124_Bron_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_124_Bron_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_124_Bron_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_124_Bron_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_124_Bron_PICKPOCKET_DoIt);
};

func void DIA_NASZ_124_Bron_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItSc_InstantFireball,2);
	B_BeklauenThings(ItSc_Zap,1);
	
	Info_ClearChoices (DIA_NASZ_124_Bron_PICKPOCKET);
};
	
func void DIA_NASZ_124_Bron_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_124_Bron_PICKPOCKET);
};

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
	AI_Output (self, other,"DIA_NASZ_124_Bron_siema_15_00"); //Nie pr�buj niczego ukra��!

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
 	description = "Dlaczego mia�bym co� kra��?";
};

FUNC INT DIA_NASZ_124_Bron_why_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_124_Bron_why_Info()
{
	AI_Output (other,self ,"DIA_NASZ_124_Bron_why_15_00"); //Dlaczego mia�bym co� kra��?
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_01"); //Tu trzymamy nasze zapasy.
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_02"); //Tak si� sk�ada, �e wczoraj zauwa�y�em, �e znikn�o kilka cennych przedmiot�w, a co najwa�niejsze brakuje wody �wi�conej ze �r�de� w Geldern.
	AI_Output (other,self ,"DIA_NASZ_124_Bron_why_15_03"); //Co w niej takiego specjalnego?
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_04"); //W g�rach na zach�d od Geldern, dawno temu, Adanos b�ogos�awi� tamtejsze �r�d�a.
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_05"); //Paladyni i Magowie Ognia czerpi� moc z �ask Innosa. Legendy m�wi� nawet o �zach Innosa. Adanos daje si�� wszystkim ludziom.
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_06"); //�wi�te �r�d�a zosta�y odci�te przez mag�w wiele lat temu, �eby potencjalni wrogowie nie mieli dost�pu do czego� takiego. W obozie zosta�o tylko kilka buteleczek.
	AI_Output (self, other,"DIA_NASZ_124_Bron_why_55_07"); //I w�a�nie jedn� z nich ukrad� jaki� dupek.

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
 	description = "Spokojnie, mo�e po prostu si� zawieruszy�a.";
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
	AI_Output (other,self ,"DIA_NASZ_124_Bron_zgubiona_15_00"); //Spokojnie, mo�e po prostu si� zawieruszy�a.
	AI_Output (self, other,"DIA_NASZ_124_Bron_zgubiona_55_01"); //Bardzo w to w�tpi�. Kilka innych rzeczy r�wnie� nie by�o na swoim miejscu.
	AI_Output (self, other,"DIA_NASZ_124_Bron_zgubiona_55_02"); //Mo�e masz racj�, ale wydaje mi si�, �e jednak kto� w tym grzeba�. Idiota pewnie nie zdaje sobie sprawy z tego, jak potrzebne jest to, co ukrad�.

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
	AI_Output (self, other,"DIA_NASZ_124_Bron_zadanie_55_01"); //To ma�a buteleczka, nie�atwo j� b�dzie znale��. Chyba, �e rzeczywi�cie kto� to ukrad� i nadal co noc podkrada si� do zapas�w...

	Log_CreateTopic (TOPIC_Bron_woda, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Bron_woda, LOG_RUNNING);
	B_LogEntry (TOPIC_Bron_woda, "Z zapas�w �owc�w ork�w znikn�a woda �wi�cona. Jest szczeg�lna, bo pochodzi ze �r�de� w pobli�u Geldern, kt�re b�ogos�awi� sam Adanos. Musz� znale�� t� wod�. Bron podejrzewa, �e kto� podkrada si� do zapas�w.");
	
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
 	description = "Przez dwie noce nikogo nie nakry�em.";
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
	AI_Output (other,self ,"DIA_NASZ_124_Bron_NicNieMa_15_00"); //Przez dwie noce nikogo nie nakry�em.
	AI_Output (other, self,"DIA_NASZ_124_Bron_NicNieMa_55_01"); //Jeste� pewien, �e po prostu nie zgubi�e� tej wody?
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_02"); //Oczywi�cie, �e jestem pewien! Widocznie ten z�odziej nie ma teraz potrzeby nic podkrada�.
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_03"); //Musimy go tam zwabi�. Co mo�e skusi� rabusia?
	AI_Output (other, self,"DIA_NASZ_124_Bron_NicNieMa_55_04"); //Nie wiem... Mo�e kawa� dobrej kie�basy?
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_05"); //Kie�basy niekoniecznie, ale zupa grzybowa? To rarytas. A jej intensywny zapach zdradzi miejsce przechowania.
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_06"); //Engor na pewno jak�� ma.
	AI_Output (self, other,"DIA_NASZ_124_Bron_NicNieMa_55_07"); //W�� do mojej skrzyni talerz zupy i zaczaj si� w nocy. Masz tu klucz.

	Createinvitems (self, ItNa_KeyBron_Skrzynia, 1);
	B_giveinvitems (self, other, ItNa_KeyBron_Skrzynia, 1);

	AI_Output (other, self,"DIA_NASZ_124_Bron_NicNieMa_55_08"); //Zobaczymy, czy w ko�cu si� uda.

	B_LogEntry (TOPIC_Bron_woda, "Bron zasugerowa� mi, �ebym w�o�y� do jego skrzyni zup� grzybow�, kt�ra swoim aromatem przyci�gnie z�oczy�c�. Mog� kupi� zup� u Engora.");
	

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
 	description = "Mam wod� �wi�con�.";
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

	AI_Output (other,self ,"DIA_NASZ_124_Bron_done_15_00"); //Mam wod� �wi�con�.
	AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_01"); //Poka�.
	B_giveinvitems (other, self, ItNa_WodaSwiecona_Adanos, 1);	
	AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_02"); //Tak, to ta. Gdzie to znalaz�e�?

	MIS_BRON_READY = FALSE;
	
	if (LOWCA_CATCH_PRIZE == TRUE) {
		AI_Output (other, self,"DIA_NASZ_124_Bron_done_55_03"); //Musia�em troch� poszuka�, ale uda�o mi si�.
		AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_04"); //Czyli nikt nie krad�? Mam nadziej�, �e tak wa�ny przedmiot ju� si� nie zawieruszy.

		B_LogEntry (TOPIC_Bron_woda, "Sk�ama�em, m�wi�c �e znalaz�em wod� w zapasach. Tak czy owak, Bron jest zadowolony.");
		B_GivePlayerXP (200);
		DodajReputacje (2, REP_LOWCY);		
	};

	if (LOWCA_CATCH_NO == TRUE) {
		WillWydalZlodzieja_Bron = TRUE;
		AI_Output (other, self,"DIA_NASZ_124_Bron_done_55_05"); //Mia�e� racj�. Jeden z �owc�w podkrada� si� do zapas�w i krad�.
		AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_06"); //Skurczybyk! Kt�ry to?
		AI_Output (other, self,"DIA_NASZ_124_Bron_done_55_07"); //Nie znam jego imienia. Cz�sto trenuje u Rethona.
		AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_08"); //Za�atwi� t� spraw� ju� sam. Dobra robota, nowy.	

		Npc_ExchangeRoutine (NASZ_123_Lowca, "Banicja");
		Lowca123_NaBanicji = TRUE;
		B_LogEntry (TOPIC_Bron_woda, "�owca ork�w zostanie ukarany. I bardzo dobrze! Tacy ludzie nie s� potrzebni w obozie.");
		B_GivePlayerXP (400);
		DodajReputacje (3, REP_LOWCY);
	};

	AI_Output (self, other,"DIA_NASZ_124_Bron_done_55_09"); //Ej, we� te mikstury. Przydadz� ci si�.

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
 	description = "Z rozkazu Udara masz mi da� wod� �wi�con�.";
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

	AI_Output (other,self ,"DIA_NASZ_124_Bron_Udar_15_00"); //Z rozkazu Udara masz mi da� wod� �wi�con�.
	AI_Output (self, other,"DIA_NASZ_124_Bron_Udar_55_01"); //Um�wi�em si� z Udarem, �e j� kupisz.
	AI_Output (other,self ,"DIA_NASZ_124_Bron_Udar_15_02"); //O, a wi�c mieli�cie ju� wszystko om�wione za moimi plecami? Niech was szlag.
	AI_Output (self, other,"DIA_NASZ_124_Bron_Udar_55_03"); //Kupuj i nie narzekaj, to nie s� jakie� krocie.

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
 	description = "Sprzedaj mi wod� �wi�con�. (5 sztuk - 25 szt. z�ota)";
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

	AI_Output (other,self ,"DIA_NASZ_124_Bron_Buy_15_00"); //Sprzedaj mi wod� �wi�con�.
	
	if (npc_hasitems (other, ItMi_Gold) >=25) {
		B_giveinvitems (other, self, ItMi_Gold, 25);	
		AI_Output (self, other,"DIA_NASZ_124_Bron_Buy_55_01"); //Prosz� bardzo.
		Createinvitems (self, ItNa_WodaSwiecona_Adanos, 5);
		B_giveinvitems (self, other, ItNa_WodaSwiecona_Adanos, 5);
	}
	else {
		AI_Output (self,other ,"DIA_NASZ_124_Bron_Buy_15_02"); //Nie masz do�� z�ota!
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
 	description = "Zapasy nadal znikaj�?";
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
	AI_Output (other, self,"DIA_NASZ_124_Bron_HowAreYou_15_00"); //Zapasy nadal znikaj�?
	
	if !(npc_knowsinfo (other, DIA_NASZ_124_Bron_done))
	{
		AI_Output (self, other,"DIA_NASZ_124_Bron_HowAreYou_55_01"); //Od czasu do czasu kto� co� zakosi, ale najbardziej martwi mnie brak wody �wi�conej.
	}
	else
	{
		if (WillWydalZlodzieja_Bron) { 
			AI_Output (self, other,"DIA_NASZ_124_Bron_HowAreYou_55_02"); //Od kiedy z�odziej zosta� zdemaskowany, nikt nie o�miela si� zabra� nawet jab�uszka!
		} else { 
			AI_Output (self, other,"DIA_NASZ_124_Bron_HowAreYou_55_03"); //A, powiem ci, �e nawet nie. Najwa�niejsze, �e woda �wi�cona zosta�a odnaleziona!
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

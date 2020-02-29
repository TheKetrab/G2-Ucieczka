var int JAN_PACZKI;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_EXIT   (C_INFO)
{
	npc         = NASZ_224_Dobar;
	nr          = 999;
	condition   = DIA_NASZ_224_Dobar_EXIT_Condition;
	information = DIA_NASZ_224_Dobar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_224_Dobar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_224_Dobar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_siema   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 1;
 	condition   = DIA_NASZ_224_Dobar_siema_Condition;
 	information = DIA_NASZ_224_Dobar_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_siema_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_siema_15_00"); //Jeste� kowalem?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_siema_55_01"); //Tak, do cholery. Po co zadajesz tak idiotyczne pytanie?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_siema_55_02"); //Skoro ju� zawracasz mi g�ow�, to pytaj o co� normalnego. 

		
};

//*********************************************************************
//	Info how
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_how   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 2;
 	condition   = DIA_NASZ_224_Dobar_how_Condition;
 	information = DIA_NASZ_224_Dobar_how_Info;
 	permanent   = FALSE;
 	description = "Jak si� tu znalaz�e�?";
};

FUNC INT DIA_NASZ_224_Dobar_how_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_224_Dobar_how_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_how_15_00"); //Jak si� tu znalaz�e�?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_how_55_01"); //Przyby�em do zamku wraz z ekspedycj� paladyn�w. Potem zacz�y si� te niemi�e przygody ze smokami. Ci�g�e naloty, a do tego obl�enie przez ork�w.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_how_55_02"); //Czmychn��em kilka nocy po tej, w kt�rej zaatakowa� smok. B��ka�em si� po okolicy a� do czasu, gdy znalaz�em to miejsce.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_how_55_03"); //Sp�dzi�em tu kilka, mo�e kilkana�cie dni i wtedy pojawi� si� Gestath wraz z kilkoma ch�opcami.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_how_55_04"); //Teraz zajmuj� si� wyrabianiem sztylet�w i no�y dla my�liwych.
};

//*********************************************************************
//	Info Buy
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_buy   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 4;
 	condition   = DIA_NASZ_224_Dobar_buy_Condition;
 	information = DIA_NASZ_224_Dobar_buy_Info;
 	permanent   = FALSE;
 	description = "Mog� co� u ciebie kupi�?";
};

FUNC INT DIA_NASZ_224_Dobar_buy_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_224_Dobar_buy_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_buy_15_00"); //Mog� co� u ciebie kupi�?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_buy_55_01"); //Nie, handel to nie m�j dzia�. Kupi� mo�esz tylko od Hunta.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_buy_55_02"); //Ja tylko czasami daj� my�liwym co� bezpo�rednio do r�ki. I to tylko na polecenie szefa.

};

//*********************************************************************
//	Info GetKnife
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GetKnife   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 5;
 	condition   = DIA_NASZ_224_Dobar_GetKnife_Condition;
 	information = DIA_NASZ_224_Dobar_GetKnife_Info;
 	permanent   = FALSE;
 	description = "Gestath powiedzia�, �e masz dla mnie n�.";
};

FUNC INT DIA_NASZ_224_Dobar_GetKnife_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_BeAMysliwy))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GetKnife_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_GetKnife_15_00"); //Gestath powiedzia�, �e masz dla mnie n�.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GetKnife_55_01"); //Tak, mam. Tylko nie utnij sobie paluszk�w.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GetKnife_55_02"); //Poprzedni, kt�remu dawa�em pierwszy n�, niejaki Dymoondo, prawie straci� r�k�, pr�buj�c �ci�gn�� pierwsz� wilcz� sk�r�.

	Createinvitems (self, ItMw_1H_Sword_L_03, 1);
	B_giveinvitems (self, other, ItMw_1H_Sword_L_03, 1);	
};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
var int Zadanie_Dobar_Dick;
INSTANCE DIA_NASZ_224_Dobar_zadanie   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 6;
 	condition   = DIA_NASZ_224_Dobar_zadanie_Condition;
 	information = DIA_NASZ_224_Dobar_zadanie_Info;
 	permanent   = FALSE;
 	description = "Chcia�bym ci si� na co� przyda�.";
};

FUNC INT DIA_NASZ_224_Dobar_zadanie_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_224_Dobar_zadanie_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_zadanie_15_00"); //Chcia�bym ci si� na co� przyda�.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanie_55_01"); //Przyda�? A na c� kowalowi pomoc od kogo� innego? Doskonale radz� sobie z kowad�em i nie brak mi na nic czasu.
	AI_Output (other, self,"DIA_NASZ_224_Dobar_zadanie_15_02"); //Na pewno jest co�, co m�g�bym zrobi�. P�j�� gdzie� za ciebie, przynie�� ci co�...
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanie_55_04"); //Faktycznie, mo�esz przynie�� mi kilka paczek od Jana z obozu �owc�w ork�w albo spr�bowa� swoich si� w... czym� specjalnym.

	Info_ClearChoices (DIA_NASZ_224_Dobar_zadanie);
		Info_AddChoice	  (DIA_NASZ_224_Dobar_zadanie, "Lepiej za�atwi� ci te paczki.", DIA_NASZ_224_Dobar_zadanie_paczka);
		Info_AddChoice	  (DIA_NASZ_224_Dobar_zadanie, "My�l�, �e lepiej nadam si� do 'czego� specjalnego'.", DIA_NASZ_224_Dobar_zadanie_przyniesc);

};

func void DobarSay_AboutJan() {
	AI_Output (self, other,"DobarSay_AboutJan_55_00"); //Jan to kowal �owc�w ork�w. Po prostu powiedz mu, �e to ja ci� przys�a�em. B�dzie wiedzia�, co ci da�.
};

func void DobarSay_MrokPolnocy() {
	AI_Output (self, other,"DobarSay_MrokPolnocy_55_00"); //Za�atw mi 5 skr�t�w Mroku P�nocy. Zwyk�e bagienne ziele mi ju� nie wystarcza.
	AI_Output (self, other,"DobarSay_MrokPolnocy_55_01"); //Potrzebuj� tego!
	AI_Output (self, other,"DobarSay_MrokPolnocy_55_02"); //Ju� nie daj� rady, po prostu mam do��. Czasem chc� uciec od problem�w G�rniczej Doliny.
	AI_Output (other,self ,"DobarSay_MrokPolnocy_15_03"); //5 skr�t�w? Pestka.
};

FUNC VOID DIA_NASZ_224_Dobar_zadanie_paczka()
{

	AI_Output (other,self ,"DIA_NASZ_224_Dobar_zadanie_paczka_15_00"); //Lepiej za�atwi� ci te paczki.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanie_paczka_55_01"); //Super. Nie b�d� musia� p�aci� pot�nych sum go�cowi Jana.
	DobarSay_AboutJan();
	
	JAN_PACZKI = TRUE;
	Wld_InsertNpc	(Warg,"FP_ROAM_ORC_07");
	B_StartOtherRoutine (NASZ_107_Brutus,"BeforeDie");
	
	Createinvitems (NASZ_107_Brutus, ItNa_PaczkaJana, 3);

	Log_CreateTopic (TOPIC_Dobar_paczka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dobar_paczka, LOG_RUNNING);
	B_LogEntry (TOPIC_Dobar_paczka, "Musz� si� uda� do Jana i odebra� paczki dla Dobara.");

	Info_ClearChoices (DIA_NASZ_224_Dobar_zadanie);
};

FUNC VOID DIA_NASZ_224_Dobar_zadanie_przyniesc()
{

	AI_Output (other,self ,"DIA_NASZ_224_Dobar_zadanie_przyniesc_15_00"); //My�l�, �e lepiej nadam si� do 'czego� specjalnego'.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanie_przyniesc_55_01"); //Ah tak?
	AI_PlayAni(self, "T_SEARCH");
	DobarSay_MrokPolnocy();

	Zadanie_Dobar_Dick = TRUE;
	Log_CreateTopic (TOPIC_Dobar_skrety, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dobar_skrety, LOG_RUNNING);
	B_LogEntry (TOPIC_Dobar_skrety, "Trzeba za�atwi� 5 skr�t�w Mroku P�nocy Dobarowi. Tylko sk�d ja wezm� to zielsko?");

	Info_ClearChoices (DIA_NASZ_224_Dobar_zadanie);
};	


//*********************************************************************
//	Info ZadanieKap2
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_zadanieKap2   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 7;
 	condition   = DIA_NASZ_224_Dobar_zadanieKap2_Condition;
 	information = DIA_NASZ_224_Dobar_zadanieKap2_Info;
 	permanent   = FALSE;
 	description = "Mog� co� jeszcze zrobi�?";
};

FUNC INT DIA_NASZ_224_Dobar_zadanieKap2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_224_Dobar_zadanie))
	&& (KAPITEL >= 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_zadanieKap2_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_zadanieKap2_15_00"); //Mog� co� jeszcze zrobi�?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanieKap2_55_01"); //Pewnie!
		if (JAN_PACZKI == TRUE)
		{
			AI_PlayAni(self, "T_SEARCH");
			DobarSay_MrokPolnocy();

			Zadanie_Dobar_Dick = TRUE;
			Log_CreateTopic (TOPIC_Dobar_skrety, LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Dobar_skrety, LOG_RUNNING);
			B_LogEntry (TOPIC_Dobar_skrety, "Trzeba za�atwi� 5 skr�t�w Mroku P�nocy Dobarowi. Tylko sk�d ja wezm� to zielsko?");

		}
		else
		{
			AI_Output (self, other,"DIA_NASZ_224_Dobar_zadanieKap2_15_06"); //Przynie� mi paczki od Jana.
			DobarSay_AboutJan();
	
			JAN_PACZKI = TRUE;
			Wld_InsertNpc	(Warg,"FP_ROAM_ORC_07");
			B_StartOtherRoutine (NASZ_107_Brutus,"BeforeDie");
			NASZ_107_Brutus.flags = 0;
			B_KillNpc(NASZ_107_Brutus);
			//Createinvitems (NASZ_107_Brutus, ItNa_PaczkaJana, 3);

			Log_CreateTopic (TOPIC_Dobar_paczka, LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Dobar_paczka, LOG_RUNNING);
			B_LogEntry (TOPIC_Dobar_paczka, "Musz� si� uda� do Jana i odebra� paczki dla Dobara.");

		};

};

//*********************************************************************
//	Info KoniecPaczka
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_koniecpaczka   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 8;
 	condition   = DIA_NASZ_224_Dobar_koniecpaczka_Condition;
 	information = DIA_NASZ_224_Dobar_koniecpaczka_Info;
 	permanent   = FALSE;
 	description = "Trzymaj. Twoje paczki.";
};

FUNC INT DIA_NASZ_224_Dobar_koniecpaczka_Condition()
{
	if (JAN_PACZKI == TRUE)
	&& (npc_hasitems (other, ItNa_PaczkaJana) >=3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_koniecpaczka_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_koniecpaczka_15_00"); //Trzymaj. Twoje paczki.
	B_giveinvitems (other, self, ItNa_PaczkaJana, 3);
	AI_Output (self, other,"DIA_NASZ_224_Dobar_koniecpaczka_55_01"); //Dzi�ki. We� to z�oto, nale�y ci si�.

	Createinvitems (self, itmi_gold, 40);
	B_giveinvitems (self, other, itmi_gold, 40);

	B_LogEntry (TOPIC_Dobar_paczka, "Przynios�em paczki od Jana. Szkoda tylko, �e Brutusowi si� nie uda�o...");
	Log_SetTopicStatus (TOPIC_Dobar_paczka, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (2, REP_MYSLIWI);

};

//*********************************************************************
//	Info KoniecSkrety
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_koniecskrety   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 9;
 	condition   = DIA_NASZ_224_Dobar_koniecskrety_Condition;
 	information = DIA_NASZ_224_Dobar_koniecskrety_Info;
 	permanent   = FALSE;
 	description = "Mam co� dla ciebie...";
};

FUNC INT DIA_NASZ_224_Dobar_koniecskrety_Condition()
{
	if (Zadanie_Dobar_Dick == TRUE)
	&& (npc_hasitems (other, ItNa_MrokPolnocy) >=5)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_koniecskrety_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_koniecskrety_15_00"); //Mam co� dla ciebie...
	AI_Output (self, other,"DIA_NASZ_224_Dobar_koniecskrety_55_01"); //�esz ty, w mord�! Dawaj.
	B_giveinvitems (other, self, ItNa_MrokPolnocy, 5);
	B_UseItem (self, ItNa_MrokPolnocy);
	AI_Output (self, other,"DIA_NASZ_224_Dobar_koniecskrety_55_02"); //O tak! Trzymaj, troch� z�ota.

	Createinvitems (self, itmi_gold, 40);
	B_giveinvitems (self, other, itmi_gold, 40);

	Zadanie_Dobar_Dick = TRUE;
	B_LogEntry (TOPIC_Dobar_skrety, "Dobar wydawa� si� by� wniebowzi�ty, gdy zapali� Mrok P�nocy. Wida�, mamy nowego na�ogowca.");
	Log_SetTopicStatus (TOPIC_Dobar_skrety, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (2, REP_MYSLIWI);

};

//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_Gwozdzie   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 10;
 	condition   = DIA_NASZ_224_Dobar_Gwozdzie_Condition;
 	information = DIA_NASZ_224_Dobar_Gwozdzie_Info;
 	permanent   = FALSE;
 	description = "Potrzebuj� gwo�dzi.";
};

FUNC INT DIA_NASZ_224_Dobar_Gwozdzie_Condition()
{
	if (WillGwozdzieGoToKowal == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_Gwozdzie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_Gwozdzie_15_00"); //Potrzebuj� gwo�dzi.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_Gwozdzie_55_01"); //Gwo�dzi? Do�� nietypowe zam�wienie, nieprawda�?
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_Gwozdzie_15_02"); //Drwal Phill potrzebuje paczk� ma�ych gwo�dzi. Zrobi�by� takie dla mnie?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_Gwozdzie_55_03"); //Nie ma sprawy. Potrzebuj� jednak stalowego pr�ta, no i z�ota oczywi�cie.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_Gwozdzie_55_04"); //Za ka�dy gw�d� policz� sobie dwie sztuki z�ota.

	WillGwozdzieGoToKowal = 2;

	B_LogEntry (TOPIC_Robotnik_deski, "Dobar zrobi dla mnie gwo�dzie, je�li przynios� mu stalowy pr�t.");

};

var int DobarGwozdzieFirstDay;
var int DobarGwozdzieFirstHour;
//*********************************************************************
//	Info GwozdzieBuy
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GwozdzieBuy   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 11;
 	condition   = DIA_NASZ_224_Dobar_GwozdzieBuy_Condition;
 	information = DIA_NASZ_224_Dobar_GwozdzieBuy_Info;
 	permanent   = TRUE;
 	description = "Zr�b dla mnie gwo�dzie.";
};

FUNC INT DIA_NASZ_224_Dobar_GwozdzieBuy_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_224_Dobar_Gwozdzie))
	&& (npc_hasitems (other, ItMiSwordraw) >=1)
	&& (GwozdzieKupione == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GwozdzieBuy_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_GwozdzieBuy_15_00"); //Zr�b dla mnie gwo�dzie.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GwozdzieBuy_55_01"); //Ilu sztuk potrzebujesz?
	
	DobarGwozdzieFirstDay  = Wld_GetDay();
	DobarGwozdzieFirstHour = Wld_GetTimeHour();

	Info_ClearChoices 	(DIA_NASZ_224_Dobar_GwozdzieBuy);
	Info_AddChoice 		(DIA_NASZ_224_Dobar_GwozdzieBuy,	DIALOG_BACK		,DIA_NASZ_224_Dobar_GwozdzieBuy_Back);

	if (npc_hasitems (other, ItMi_Gold) >=100) {
		Info_AddChoice		(DIA_NASZ_224_Dobar_GwozdzieBuy,"Pi��dziesi�t: 1 stalowy pr�t, 100 szt. z�ota",DIA_NASZ_224_Dobar_GwozdzieBuy_50);
	};
	if (npc_hasitems (other, ItMi_Gold) >=40) {
		Info_AddChoice		(DIA_NASZ_224_Dobar_GwozdzieBuy,"Dwadzie�cia: 1 stalowy pr�t, 40 szt. z�ota",DIA_NASZ_224_Dobar_GwozdzieBuy_20);
	};
	if (npc_hasitems (other, ItMi_Gold) >=20) {
		Info_AddChoice		(DIA_NASZ_224_Dobar_GwozdzieBuy,"Dziesi��: 1 stalowy pr�t, 20 szt. z�ota",DIA_NASZ_224_Dobar_GwozdzieBuy_10);
	};

};

func void DobarSay_BackHour() {
	AI_Output(self,other,"DobarSay_BackHour_01_00"); //Wr�� za godzin�. Zam�wienie b�dzie gotowe.
};

func void DIA_NASZ_224_Dobar_GwozdzieBuy_Back ()
{
	Info_ClearChoices (DIA_NASZ_224_Dobar_GwozdzieBuy);
};

func void DIA_NASZ_224_Dobar_GwozdzieBuy_50 ()
{

	AI_Output(other,self,"DIA_NASZ_224_Dobar_GwozdzieBuy_50_01_00"); //Pi��dziesi�t.
	B_giveinvitems (other, self, ItMi_Gold, 100);
	B_giveinvitems (other, self, ItMiSwordraw, 1);	
	DobarSay_BackHour();

	GwozdzieKupione = 50;
	Info_ClearChoices (DIA_NASZ_224_Dobar_GwozdzieBuy);
};

func void DIA_NASZ_224_Dobar_GwozdzieBuy_20 ()
{

	AI_Output(other,self,"DIA_NASZ_224_Dobar_GwozdzieBuy_20_01_00"); //Dwadzie�cia.
	B_giveinvitems (other, self, ItMi_Gold, 40);
	B_giveinvitems (other, self, ItMiSwordraw, 1);
	DobarSay_BackHour();

	GwozdzieKupione = 20;
	Info_ClearChoices (DIA_NASZ_224_Dobar_GwozdzieBuy);
};

func void DIA_NASZ_224_Dobar_GwozdzieBuy_10 ()
{

	AI_Output(other,self,"DIA_NASZ_224_Dobar_GwozdzieBuy_10_01_00"); //Dziesi��.
	B_giveinvitems (other, self, ItMi_Gold, 20);
	B_giveinvitems (other, self, ItMiSwordraw, 1);
	DobarSay_BackHour();

	GwozdzieKupione = 10;
	Info_ClearChoices (DIA_NASZ_224_Dobar_GwozdzieBuy);
};

//*********************************************************************
//	Info GwozdzieReady
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GwozdzieReady   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 12;
 	condition   = DIA_NASZ_224_Dobar_GwozdzieReady_Condition;
 	information = DIA_NASZ_224_Dobar_GwozdzieReady_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_GwozdzieReady_Condition()
{
	if (GwozdzieKupione > 0)
	&& TimeIsUp(-1,1,DobarGwozdzieFirstDay,DobarGwozdzieFirstHour) // 1h
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GwozdzieReady_Info()
{
	AI_Output (self,other,"DIA_NASZ_224_Dobar_GwozdzieReady_15_00"); //To by�o ca�kiem ciekawe zaj�cie. Niecz�sto mam okazj� wyrabia� narz�dzia.
	AI_Output (self,other,"DIA_NASZ_224_Dobar_GwozdzieReady_55_01"); //To twoja paczka, trzymaj.
	
	Createinvitems (self, ItNa_PaczkaMalychGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaMalychGwozdzi, 1);

	B_LogEntry (TOPIC_Robotnik_deski, "Mam ma�e gwo�dzie. Teraz zanios� je Phillowi.");

};

var int DobarGwozdzieSecondDay;
var int DobarGwozdzieSecondHour;
//*********************************************************************
//	Info GwozdzieBuyMore
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GwozdzieBuyMore   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 13;
 	condition   = DIA_NASZ_224_Dobar_GwozdzieBuyMore_Condition;
 	information = DIA_NASZ_224_Dobar_GwozdzieBuyMore_Info;
 	permanent   = FALSE;
 	description = "Potrzebuj� wi�cej gwo�dzi.";
};

FUNC INT DIA_NASZ_224_Dobar_GwozdzieBuyMore_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_120_Phill_GwozdzieDone))
	&& (npc_hasitems (other, ItMi_Gold) >=20)
	&& (WillGwozdzieGoToKowal == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GwozdzieBuyMore_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_GwozdzieBuyMore_15_00"); //Potrzebuj� wi�cej gwo�dzi.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GwozdzieBuyMore_55_01"); //Znowu? Ile tym razem?
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_GwozdzieBuyMore_15_02"); //Dziesi��. Trzymaj, dwadzie�cia sztuk z�ota. Potrzebujesz te� stal, czy zosta�o ci troch�?
	B_giveinvitems (other, self, ItMi_Gold, 20);
	AI_Output (self, other,"DIA_NASZ_224_Dobar_GwozdzieBuyMore_55_03"); //Zosta�o, nie martw si�. Wr�� za godzin�.
	
	DobarGwozdzieSecondDay  = Wld_GetDay();
	DobarGwozdzieSecondHour = Wld_GetTimeHour();

};

//*********************************************************************
//	Info GwozdzieReady2
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_GwozdzieReady2   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 14;
 	condition   = DIA_NASZ_224_Dobar_GwozdzieReady2_Condition;
 	information = DIA_NASZ_224_Dobar_GwozdzieReady2_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_GwozdzieReady2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_224_Dobar_GwozdzieBuyMore))
	&& TimeIsUp(-1,1,DobarGwozdzieSecondDay,DobarGwozdzieSecondHour) // 1h
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_GwozdzieReady2_Info()
{
	AI_Output (self,other,"DIA_NASZ_224_Dobar_GwozdzieReady2_15_00"); //Masz, to dla ciebie.

	Createinvitems (self, ItNa_PaczkaMalychGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaMalychGwozdzi, 1);

	AI_Output (other,self,"DIA_NASZ_224_Dobar_GwozdzieReady2_55_01"); //Dzi�ki.
	
	B_LogEntry (TOPIC_Robotnik_deski, "No, teraz Phill musi da� mi paczk� gwo�dzi.");

};

//*********************************************************************
//	Artefakt
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_artefakt   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 21;
 	condition   = DIA_NASZ_224_Dobar_artefakt_Condition;
 	information = DIA_NASZ_224_Dobar_artefakt_Info;
 	permanent   = FALSE;
 	description = "Potrafi�by� po��czy� te trzy kawa�ki?";
};

FUNC INT DIA_NASZ_224_Dobar_artefakt_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_coteraz))
	&& !(npc_knowsinfo (other, DIA_NASZ_106_Jan_artefakt))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_artefakt_Info()
{
	AI_Output (other,self ,"DIA_NASZ_224_Dobar_artefakt_15_00"); //Potrafi�by� po��czy� te trzy kawa�ki?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_artefakt_55_01"); //Ju� ci m�wi�em, �e zajmuj� si� g��wnie �elastwem. Bi�uteria to nie moja dzia�ka. 

};


//*********************************************************************
//	Info PancerzeStart
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_PancerzeStart   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 1;
 	condition   = DIA_NASZ_224_Dobar_PancerzeStart_Condition;
 	information = DIA_NASZ_224_Dobar_PancerzeStart_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_PancerzeStart_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	&& (npc_knowsinfo(other,DIA_NASZ_213_Gestath_OUTDobarQuest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_PancerzeStart_Info()
{
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_00"); //Nie przeszkadzaj mi. Jestem w trakcie wykonywania roboty dla Gestatha.
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeStart_55_01"); //To w�a�nie on mnie przys�a�. Pono� masz ju� plan, jak polepszy� pancerze innych my�liwych.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_55_02"); //Oczywi�cie, �e mam! Uda�o mi si� wytworzy� p�ytk� z nowego stopu metali, kt�ra jest elastyczna i nie traci swoich w�a�ciwo�ci obronnych.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_03"); //Wystarczy wi�c wszy� j� w odpowiednio wytrzyma�e futro i mamy wspania�y pancerz. Wiem ju� nawet jakie futro mo�e si� do tego nada�.
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeStart_15_04"); //Zamieniam si� w s�uch.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_05"); //Futro, jak i sk�ra orkowych ps�w, jest bardzo wytrzyma�a i jednocze�nie rozci�gliwa. Co prawda �mierdzi, jednak jest najbardziej odpowiednim sk�adnikiem tego stroju.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_06"); //Wys�a�em ju� na poszukiwania Jehena, lecz do tej pory jeszcze nie wr�ci�. M�g�by� go poszuka�?
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeStart_15_07"); //W jakim kierunku ruszy�?
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeStart_15_08"); //Wydaje mi si�, ze m�wi� co� o terenach starej g�rskiej twierdzy, ale m�g� tam nawet nie dotrze�. Kto go tam wie...

	B_StartOtherRoutine(NASZ_232_Jehen,"Namiot");
	B_LogEntry (TOPIC_Dobar_pancerze, "Dobar opowiedzia� mi o swoim pomy�le na wzmocnienie pancerza za pomoc� nowego stopu metali. Aby tego dokona� potrzebuje sk�r orkowych ps�w, po kt�re zosta� wys�any Jehen. Wed�ug Dobara wyruszy� w stron� starej g�rskiej twierdzy, ale m�g� tam nie dotrze�. Lepiej udam si� tam pieszo, by przypadkiem si� z nim nie min��.");
};

func void DobarSay_Super() {
	AI_Output (self, other,"DobarSay_Super_55_00"); //Doskonale! Mam tu dla ciebie specjaln� nagrod� w ramach podzi�kowa�.
	AI_Output (self, other,"DobarSay_Super_55_01"); //Czterysta ostrych strza� powinno zwr�ci� z nawi�zk� strza�y, kt�re zu�y�e� podczas polowania.
};

var int WillMusiDoniescSkoryOrkowychPsow;
//*********************************************************************
//	Info PancerzeOddawanie
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_PancerzeOddawanie   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 1;
 	condition   = DIA_NASZ_224_Dobar_PancerzeOddawanie_Condition;
 	information = DIA_NASZ_224_Dobar_PancerzeOddawanie_Info;
 	permanent   = FALSE;
	description = "Znalaz�em lepszy materia� na zbroje.";
};

FUNC INT DIA_NASZ_224_Dobar_PancerzeOddawanie_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_232_Jehen_Part2Finish))
	&& (npc_hasitems(other,ItNa_LuskaBestii)>=6)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_PancerzeOddawanie_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeOddawanie_15_00"); //Znalaz�em lepszy materia� na zbroje.
	B_GiveInvItems(other,self,ItNa_LuskaBestii,6);
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeOddawanie_15_01"); //To �uski jakich� tajemniczych i demonicznych bestii. S� bardzo twarde.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_02"); //Poka� no, niech si� przyjrz�.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_03"); //Faktycznie, wygl�daj� ca�kiem solidnie. Wykorzystam je do wzmocnienia zbroi, jednak nie wystarczy mi na wszystkie.
	AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_04"); //Masz ze sob� sk�ry orkowych ps�w, o kt�re prosi�em?
	
	if (npc_hasitems(other,ItNa_SkoraOrkowegoPsa) >= 5) {
	
		AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeOddawanie_15_05"); //Tak, prosz�.
		B_GiveInvItems(other,self,ItNa_SkoraOrkowegoPsa,5);
		DobarSay_Super();

		Log_SetTopicStatus (TOPIC_Dobar_pancerze, LOG_SUCCESS);
		B_LogEntry (TOPIC_Dobar_pancerze, "Przynios�em Dobarowi to, co potrzebowa�, by wzmocni� pancerze.");
		WillSkonczylZadanieDobaraPancerze = TRUE;

		Createinvitems(self,ItNa_OstraStrzala,400);
		B_giveinvitems(self,other,ItNa_OstraStrzala,400);
		B_GivePlayerXP(700);
		DodajReputacje(4,REP_MYSLIWI);
	}
	
	else {
		AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_06"); //Nie. My�la�em, �e w tej sytuacji obejdzie si� bez nich.
		AI_Output (self, other,"DIA_NASZ_224_Dobar_PancerzeOddawanie_55_07"); //Pomyli�e� si� wi�c. Musisz donie�� mi sk�ry.

		WillMusiDoniescSkoryOrkowychPsow = TRUE;
		B_LogEntry (TOPIC_Dobar_pancerze, "Dobar ucieszy� si�, �e przynios�em mu �uski, ale i tak potrzebuje 5 sk�r orkowych ps�w.");
	};

};




//*********************************************************************
//	Info PancerzeDoniesienie
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_PancerzeDoniesienie   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 1;
 	condition   = DIA_NASZ_224_Dobar_PancerzeDoniesienie_Condition;
 	information = DIA_NASZ_224_Dobar_PancerzeDoniesienie_Info;
 	permanent   = FALSE;
	description = "Przynios�em sk�ry orkowych ps�w.";
};

FUNC INT DIA_NASZ_224_Dobar_PancerzeDoniesienie_Condition()
{
	if (WillMusiDoniescSkoryOrkowychPsow)
	&& (npc_hasitems(other,ItNa_SkoraOrkowegoPsa)>=5)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_PancerzeDoniesienie_Info()
{
	AI_Output (other, self,"DIA_NASZ_224_Dobar_PancerzeDoniesienie_15_00"); //Przynios�em sk�ry orkowych ps�w.
	B_GiveInvItems(other,self,ItNa_SkoraOrkowegoPsa,5);
	DobarSay_Super();
	
	WillSkonczylZadanieDobaraPancerze = TRUE;

	Log_SetTopicStatus (TOPIC_Dobar_pancerze, LOG_SUCCESS);
	B_LogEntry (TOPIC_Dobar_pancerze, "Przynios�em Dobarowi to, co potrzebowa�, by wzmocni� pancerze.");

	Createinvitems(self,ItNa_OstraStrzala,400);
	B_giveinvitems(self,other,ItNa_OstraStrzala,400);
	B_GivePlayerXP(700);
	DodajReputacje(4,REP_MYSLIWI);
};




















//*********************************************************************
//	Info Kap4Wrzod
//*********************************************************************
INSTANCE DIA_NASZ_224_Dobar_Kap4Wrzod   (C_INFO)
{
	npc         = NASZ_224_Dobar;
 	nr          = 41;
 	condition   = DIA_NASZ_224_Dobar_Kap4Wrzod_Condition;
 	information = DIA_NASZ_224_Dobar_Kap4Wrzod_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_224_Dobar_Kap4Wrzod_Condition()
{
	if (! npc_knowsinfo (other, DIA_NASZ_225_Wrzod_Kap4Start)) && (KAPITEL == 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_224_Dobar_Kap4Wrzod_Info()
{
	AI_Output (self,other,"DIA_NASZ_224_Dobar_Kap4Wrzod_15_00"); //Hej, Willu! S�yszysz te wrzaski?
	AI_Output (other,self,"DIA_NASZ_224_Dobar_Kap4Wrzod_55_02"); //W�a�nie si� zastanawiam, kto kogo torturuje.
	AI_Output (self,other,"DIA_NASZ_224_Dobar_Kap4Wrzod_15_03"); //Od wczoraj, Wrz�d j�czy bez przerwy. Nie wiem o co mu chodzi, ale wszyscy maj� go ju� do��.
	AI_Output (other,self,"DIA_NASZ_224_Dobar_Kap4Wrzod_55_04"); //W takim razie zajrz� do niego.
	AI_Output (self,other,"DIA_NASZ_224_Dobar_Kap4Wrzod_15_05"); //W razie gdyby dobrowolnie si� nie zamkn��, poder�nij mu gard�o.

	Log_CreateTopic (TOPIC_Wrzod_zwierzeta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Wrzod_zwierzeta, LOG_RUNNING);
	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Dobar wyja�ni� mi, sk�d bior� si� te odg�osy w obozie my�liwych. Mo�na si� by�o spodziewa�, �e to Wrz�d. Chyba musz� z�o�y� mu wizyt�.");

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_224_Dobar_PICKPOCKET (C_INFO)
{
	npc			= NASZ_224_Dobar;
	nr			= 900;
	condition	= DIA_NASZ_224_Dobar_PICKPOCKET_Condition;
	information	= DIA_NASZ_224_Dobar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_224_Dobar_PICKPOCKET_Condition()
{
	C_Beklauen (32);
};
 
FUNC VOID DIA_NASZ_224_Dobar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_224_Dobar_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_224_Dobar_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_224_Dobar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_224_Dobar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_224_Dobar_PICKPOCKET_DoIt);
};

func void DIA_NASZ_224_Dobar_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Arrow,73);
	
	Info_ClearChoices (DIA_NASZ_224_Dobar_PICKPOCKET);
};
	
func void DIA_NASZ_224_Dobar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_224_Dobar_PICKPOCKET);
};
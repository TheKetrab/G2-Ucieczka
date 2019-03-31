//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_EXIT   (C_INFO)
{
	npc         = NASZ_119_Udar;
	nr          = 999;
	condition   = DIA_NASZ_119_Udar_EXIT_Condition;
	information = DIA_NASZ_119_Udar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_119_Udar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_119_Udar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info PreHello 
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_PreHello   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 998;
 	condition   = DIA_NASZ_119_Udar_PreHello_Condition;
 	information = DIA_NASZ_119_Udar_PreHello_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_119_Udar_PreHello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_PreHello_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_PreHello_55_00"); //Jeste� rycerzem?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PreHello_55_01"); //Nie pomyli�e� si�, ch�opcze. Razem z Kerolothem rekrutowali�my wojownik�w na zamku. By�e� ju� u niego?

	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_siema)) {
		AI_Output (other, self,"DIA_NASZ_119_Udar_PreHello_55_02"); //Tak. Wymienili�my kilka zda�.
		AI_Output (self, other,"DIA_NASZ_119_Udar_PreHello_55_03"); //I pewnie chcesz, �ebym zleci� ci jakie� zadanie? C�... Zobaczymy.
	}
	else {
		AI_Output (other, self,"DIA_NASZ_119_Udar_PreHello_55_04"); //Nie, jeszcze nie.
		AI_Output (self, other,"DIA_NASZ_119_Udar_PreHello_55_05"); //Keroloth to nasz szef. Je�li chcesz do nas do��czy�, to zajrzyj do niego.
	};
};


//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_siema   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 1;
 	condition   = DIA_NASZ_119_Udar_siema_Condition;
 	information = DIA_NASZ_119_Udar_siema_Info;
 	permanent   = FALSE;
 	description = "Co tu robisz?";
};

FUNC INT DIA_NASZ_119_Udar_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_119_Udar_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_119_Udar_siema_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_119_Udar_siema_55_01"); //Jestem odpowiedzialny za handel z my�liwymi. Wbrew pozorom kilku z nich ma swoje na sumieniu i kto� uczciwy musi pilnowa�, by wymiana by�a sprawiedliwa.
	AI_Output (self, other,"DIA_NASZ_119_Udar_siema_55_02"); //Pilnuj�, by co pewien czas dostarczali nam �ywno�� i mikstury. My z kolei za�atwiamy im miecze i pancerze.
	AI_Output (self, other,"DIA_NASZ_119_Udar_siema_55_03"); //Poza tym kiedy� by�em kusznikiem, wi�c niekt�rzy ch�opcy si� u mnie szkol�.
	
};

//*********************************************************************
//	Info Nauka
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_nauka   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 2;
 	condition   = DIA_NASZ_119_Udar_nauka_Condition;
 	information = DIA_NASZ_119_Udar_nauka_Info;
 	permanent   = FALSE;
 	description = "M�g�by� mnie te� czego� nauczy�?";
};

FUNC INT DIA_NASZ_119_Udar_nauka_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_nauka_Info()
{
	AI_Output (other,self ,"DIA_NASZ_119_Udar_nauka_15_00"); //M�g�by� mnie te� czego� nauczy�?
	AI_Output (self, other,"DIA_NASZ_119_Udar_nauka_55_01"); //Jasne. Powiedz tylko, kiedy chcia�by� zacz��.
	AI_Output (self, other,"DIA_NASZ_119_Udar_nauka_55_02"); //Opr�cz kuszy mog� nauczy� ci�, jak szybciej si� uczy� i zdobywa� do�wiadczenie.

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Udar pomo�e mi w strzelaniu z kuszy.");
	B_LogEntry (TOPIC_LowcyTeacher,"Udar mo�e mi pokaza�, jak szybciej si� uczy�.");
};

//*********************************************************************
//	Info Kusza
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_kusza   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 3;
 	condition   = DIA_NASZ_119_Udar_kusza_Condition;
 	information = DIA_NASZ_119_Udar_kusza_Info;
 	permanent   = FALSE;
 	description = "Gdzie mo�na kupi� kusz�?";
};

FUNC INT DIA_NASZ_119_Udar_kusza_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_kusza_Info()
{
	AI_Output (other,self ,"DIA_NASZ_119_Udar_kusza_15_00"); //Gdzie mo�na kupi� kusz�?
	AI_Output (self, other,"DIA_NASZ_119_Udar_kusza_55_01"); //Johny na pewno b�dzie co� mia�. Id� do niego.

};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_zadanie   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 4;
 	condition   = DIA_NASZ_119_Udar_zadanie_Condition;
 	information = DIA_NASZ_119_Udar_zadanie_Info;
 	permanent   = FALSE;
 	description = "Mog� co� dla ciebie zrobi�?";
};

FUNC INT DIA_NASZ_119_Udar_zadanie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_119_Udar_zadanie_15_00"); //Mog� co� dla ciebie zrobi�?
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_01"); //Jasne. Mia�em i�� sam, ale skoro chcesz si� na co� przyda�, to wy�l� ciebie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_02"); //Jeden z my�liwych, Kirgo, jest alchemikiem.
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_03"); //Id� do niego i odbierz przesy�k�. Tylko uwa�aj, bo ten cz�owiek jest chytry i z pewno�ci� b�dzie chcia� ci� wykiwa�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_04"); //Mo�e sprzeda� ci mniej mikstur ni� zam�wi�em. Ju� par� razy by�y takie przypadki.
	AI_Output (other,self ,"DIA_NASZ_119_Udar_zadanie_15_05"); //Co dok�adnie zam�wi�e�?
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_06"); //Mam tu list�.
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_07"); //Taa, wszystko si� zgadza. Trzymaj.
	Createinvitems (self, ItNa_Lista_Mikstur, 1);
	B_giveinvitems (self, other, ItNa_Lista_Mikstur, 1);
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_08"); //I pami�taj: Nie daj si� wykiwa�!

	Log_CreateTopic (TOPIC_Udar_mikstury, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_mikstury, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_mikstury, "Udar poprosi� mnie o przyniesienie zam�wionych mikstur. Ma mi je da� Kirgo, alchemik z obozu my�liwych.");

};

//*********************************************************************
//	Info Koniec
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_koniec   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 5;
 	condition   = DIA_NASZ_119_Udar_koniec_Condition;
 	information = DIA_NASZ_119_Udar_koniec_Info;
 	permanent   = FALSE;
 	description = "Oto mikstury.";
};

FUNC INT DIA_NASZ_119_Udar_koniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_siema)
	&& npc_hasitems (other, ItPo_Health_01) >=20
	&& npc_hasitems (other, ItPo_Health_02) >=10
	&& npc_hasitems (other, ItPo_Mana_01) >=10
	&& npc_hasitems (other, ItPo_Speed) >=3
	|| npc_hasitems (other, ItNa_PaczkaMikstur) >=1)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_koniec_Info()
{
	AI_Output (other,self ,"DIA_NASZ_119_Udar_koniec_15_00"); //Oto mikstury.
	
	if (! Kirgo_Oszust)
	{
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_01"); //Brakuje kilku. Ah, ten Kirgo, to ju� kolejny raz! Chyba te� zaczn� wysy�a� ubo�sze przesy�ki i �wieci� p�niej oczami.
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_02"); //Mog�em i�� po nie sam. A m�wi�em: Uwa�aj na niego, �eby ci� nie wykiwa�!
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_03"); //C�, przynajmniej to ty odwali�e� t� robot� i mia�em dwie godziny czasu dla siebie.

		B_GiveInvItems (other, self, ItNa_PaczkaMikstur, 1);

		B_LogEntry (TOPIC_Udar_mikstury, "Przynios�em Udarowi mikstury. Nie wydawa� si� jednak zachwycony, bo da�em si� oszuka�...");
		Log_SetTopicStatus (TOPIC_Udar_mikstury, LOG_SUCCESS);
		DodajReputacje (2, REP_LOWCY);
		B_GivePlayerXP (200);

	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_04"); //S� wszystkie. Nie da�e� si� oszuka�, jestem pod wra�eniem.
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_05"); //Mam nadziej�, �e Kirgo nie stawia� si� zbytnio, gdy zwr�ci�e� mu uwag� na niepe�n� przesy�k�?
		AI_Output (other, self,"DIA_NASZ_119_Udar_koniec_55_06"); //Powiedzmy, �e da�em sobie rad�.
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_07"); //Masz tu troch� z�ota. Dobrze si� spisa�e�.

		B_GiveInvItems (other, self, ItPo_Health_01, 20);
		B_GiveInvItems (other, self, ItPo_Health_02, 10);
		B_GiveInvItems (other, self, ItPo_Mana_01, 10);
		B_GiveInvItems (other, self, ItPo_Speed, 3);

		Createinvitems (self, itmi_gold, 100);
		B_giveinvitems (self, other, itmi_gold, 100);
		B_LogEntry (TOPIC_Udar_mikstury, "Przynios�em Udarowi mikstury. By� pod wra�eniem, �e nie da�em si� oszuka�.");
		Log_SetTopicStatus (TOPIC_Udar_mikstury, LOG_SUCCESS);
		DodajReputacje (3, REP_LOWCY);
		B_GivePlayerXP (300);
	};
};

//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_goth   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 6;
 	condition   = DIA_NASZ_119_Udar_goth_Condition;
 	information = DIA_NASZ_119_Udar_goth_Info;
 	permanent   = FALSE;
	description = "�owcy zaatakowali my�liwych.";
};

FUNC INT DIA_NASZ_119_Udar_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_goth_15_00"); //�owcy zaatakowali my�liwych.
	AI_Output (self, other,"DIA_NASZ_119_Udar_goth_55_01"); //Ano. By�a taka sprawa.
	AI_Output (self, other,"DIA_NASZ_119_Udar_goth_55_02"); //Jednak�e nikt jej nie wyja�ni� i wci�� wiemy tyle, co na pocz�tku, czyli nic.

	B_LogEntry (TOPIC_Goth_kradziez, "Udar powiedzia� mi, �e przyw�dcy obozu nie maj� poj�cia, kto zaatakowa� my�liwych.");

};

//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_Gwozdzie   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 7;
 	condition   = DIA_NASZ_119_Udar_Gwozdzie_Condition;
 	information = DIA_NASZ_119_Udar_Gwozdzie_Info;
 	permanent   = FALSE;
	description = "Nie znalaz�e� przypadkiem paczki gwo�dzi?";
};

FUNC INT DIA_NASZ_119_Udar_Gwozdzie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_Gwozdzie))
	&& (WillKnowGwozdzieThief == FALSE) && (MIS_ROBOTNIK_READY == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_Gwozdzie_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_Gwozdzie_15_00"); //Nie znalaz�e� przypadkiem paczki gwo�dzi?
	AI_Output (self, other,"DIA_NASZ_119_Udar_Gwozdzie_55_01"); //Znalaz�em... Kilka dni temu, w karczmie. Ale Phill powiedzia�, �e to jego.
	AI_Output (self, other,"DIA_NASZ_119_Udar_Gwozdzie_55_02"); //Po co ci te gwo�dzie?
	AI_Output (other, self,"DIA_NASZ_119_Udar_Gwozdzie_15_03"); //Niewa�ne. Wystarczy, �e wiem kto je ma.
	
	WillKnowGwozdzieThief = TRUE;

	B_LogEntry (TOPIC_Robotnik_deski, "Udar znalaz� gwo�dzie i da� je Phillowi.");

};

var int UdarOdrzucenie;
var int UdarOkej;
//*********************************************************************
//	Info GraveMissionBegin
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionBegin   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 31;
 	condition   = DIA_NASZ_119_Udar_GraveMissionBegin_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionBegin_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionBegin_Condition()	
{
	if (KAPITEL >= 3)
	&& ((hero.guild == GIL_OUT)
	 || (hero.guild == GIL_DJG && npc_knowsinfo(other,DIA_NASZ_119_Udar_PatrolDJGStart)))
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionBegin_Info()
{
	if (hero.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_15_00"); //Will, czekaj no! Potrzebuj� kogo� do wa�nej misji.
		AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionBegin_55_01"); //Nieszcz�liwy ja, �e si� na ciebie natkn��em...
		AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_02"); //Nie martw si�, nie po�a�ujesz!
	}
	else { // GIL_DJG
		AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_03"); //Czekaj jeszcze chwil�, przez to wszystko prawie zapomnia�em o jednej, bardzo wa�nej rzeczy.
	};

	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionBegin_15_04"); //O co chodzi?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_05"); //W ca�ej G�rniczej Dolinie jest wiele grob�w. S� rozsiane byle gdzie. Mo�na je wykorzysta� jako �r�d�a mocy.
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionBegin_15_06"); //Chyba sobie �artujesz! Mam profanowa� groby?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_07"); //Wr�cz przeciwnie! Innos oczy�ci je ze wszystkich cielesnych przewinie�. Zwa� na to, �e to przecie� kolonia karna. Wielu z pochowanych tutaj ma wiele na sumieniu i potrzebuj� �aski Innosa.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_08"); //To jak, pomo�esz mi?	
	
	Info_ClearChoices (DIA_NASZ_119_Udar_GraveMissionBegin);
		Info_AddChoice	  (DIA_NASZ_119_Udar_GraveMissionBegin, "Nie, zapomnij.", DIA_NASZ_119_Udar_GraveMissionBegin_no);
		Info_AddChoice	  (DIA_NASZ_119_Udar_GraveMissionBegin, "Oczywi�cie.", DIA_NASZ_119_Udar_GraveMissionBegin_yes);

};


FUNC VOID DIA_NASZ_119_Udar_GraveMissionBegin_no()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionBegin_no_55_01"); //Nie, zapomnij.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_no_55_02"); //Nie, nie zapomn� o tobie. Gdyby� mimo wszystko zdecydowa� si� pom�c, to wpadnij do mnie.
	UdarOdrzucenie = TRUE;

	Info_ClearChoices (DIA_NASZ_119_Udar_GraveMissionBegin);
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionBegin_yes()
{

	AI_Output (other,self ,"DIA_NASZ_119_Udar_GraveMissionBegin_yes_15_03"); //Oczywi�cie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_yes_15_04"); //Wiedzia�em, �e si� zgodzisz!
	UdarOkej = TRUE;

	Info_ClearChoices (DIA_NASZ_119_Udar_GraveMissionBegin);
};

//*********************************************************************
//	Info GraveMissionNext
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionNext   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 32;
 	condition   = DIA_NASZ_119_Udar_GraveMissionNext_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionNext_Info;
 	permanent   = FALSE;
	description = "Zdecydowa�em, �e ci pomog�.";
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionNext_Condition()	
{
	if (UdarOdrzucenie == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionNext_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionNext_15_00"); //Zdecydowa�em, �e ci pomog�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionNext_55_01"); //To dobra wiadomo��. Liczy�em na ciebie.
	UdarOkej = TRUE;

};

//*********************************************************************
//	Info GraveMissionWhatToDo
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionWhatToDo   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 33;
 	condition   = DIA_NASZ_119_Udar_GraveMissionWhatToDo_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionWhatToDo_Info;
 	permanent   = FALSE;
	description = "Co dok�adnie mam zrobi�?";
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionWhatToDo_Condition()	
{
	if (UdarOkej == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionWhatToDo_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_15_00"); //Co dok�adnie mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_01"); //We� t� map�.
	Createinvitems (self, ItNa_Mapa_GraveMission, 1);
	B_giveinvitems (self, other, ItNa_Mapa_GraveMission, 1);
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_02"); //Sp�jrz, zaznaczy�em tutaj kilkana�cie grob�w, o kt�rych wiem.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_03"); //Pami�taj: Interesuj� mnie tylko groby pot�nych �o�nierzy. Rozumiesz, im pot�niejszy �o�nierz, tym wi�ksza �aska Innosa.
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_04"); //To znaczy, nie oczyszcza� grob�w nieznanych �o�nierzy?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_05"); //Tak, w�a�nie. Bo ich znaczenie jest ma�o wa�ne.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_06"); //A wi�c masz oczy�ci� wszystkie groby, kt�re tu zaznaczy�em. Wpierw rozkopujesz gr�b, potem wlewasz wod� �wi�con�. Proste, prawda?
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_07"); //Wyruszam w drog� od razu!
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_08"); //Hola, hola! Zahacz najpierw o Brona. On sprzeda ci wod� �wi�con�.
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_09"); //Powiedzia�e� 'sprzeda'? M�wi�e�, �e nie po�a�uj�, tymczasem mam p�aci� z w�asnej kieszeni...
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_10"); //Nie przejmuj si�, dostaniesz du�o wi�cej ni� my�lisz.

	GraveMissionReady = TRUE;

	Log_CreateTopic (TOPIC_Udar_Grave, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_Grave, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_Grave, "Udar wymy�li� sobie, �e je�li po�wi�c� groby wielkich wojownik�w, to Innos ze�le na nas �ask�... Dosta�em map� - mam rozkopa� ka�dy z tych grob�w i wla� tam wod� �wi�con�. Powinienem �wi�ci� groby tylko wielkich wojownik�w - nie nieznanych �o�nierzy. Wod� �wi�con� sprzeda mi Bron.");

};

//*********************************************************************
//	Info GraveMissionIfMoreGraves
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionIfMoreGraves   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 34;
 	condition   = DIA_NASZ_119_Udar_GraveMissionIfMoreGraves_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionIfMoreGraves_Info;
 	permanent   = FALSE;
	description = "Co je�li znajd� gr�b, kt�rego nie ma na tej mapie?";
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionIfMoreGraves_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_GraveMissionWhatToDo))
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionIfMoreGraves_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionIfMoreGraves_15_00"); //Co je�li znajd� gr�b, kt�rego nie ma na tej mapie?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionIfMoreGraves_55_01"); //Po�wi�� go r�wnie�. Za ka�dy nast�pny gr�b wielkiego wojownika dostaniesz 60 sztuk z�ota.

	B_LogEntry (TOPIC_Udar_Grave, "Za ka�dy po�wi�cony gr�b spoza mapy dostan� 60 sztuk z�ota.");

};

//*********************************************************************
//	Info WszystkieGroby
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_WszystkieGroby   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 35;
 	condition   = DIA_NASZ_119_Udar_WszystkieGroby_Condition;
 	information = DIA_NASZ_119_Udar_WszystkieGroby_Info;
 	permanent   = FALSE;
	description = "U�wi�ci�em wszystkie groby zaznaczone na mapie.";
};

FUNC INT DIA_NASZ_119_Udar_WszystkieGroby_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_GraveMissionWhatToDo)) && (IleGrobowWillPoswiecil >= 15)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_WszystkieGroby_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_WszystkieGroby_15_00"); //U�wi�ci�em wszystkie groby zaznaczone na mapie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_55_01"); //Dobra robota. My�l�, �e ta sumka powinna wynagrodzi� twoje trudy.
	Createinvitems (self, ItMi_Gold, 250);
	B_giveinvitems (self, other, ItMi_Gold, 250);	
	AI_Output (other, self,"DIA_NASZ_119_Udar_WszystkieGroby_55_02"); //�artujesz chyba... Goni�em po ca�ej G�rniczej Dolinie, a ty ledwo zwracasz mi z�oto za wod� �wi�con�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_55_03"); //Sam wiesz, �e ze z�otem nie jest najlepiej. No ale dobra, dostaniesz troch� mikstur z mojego zapasu. Powiedzmy 10 ekstrakt�w i 5 esencji leczniczych.
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_55_04"); //Oczywi�cie pod warunkiem, �e oddasz mi z�oto.

	Log_SetTopicStatus (TOPIC_Udar_Grave, LOG_SUCCESS);
	B_LogEntry (TOPIC_Udar_Grave, "Wszystkie groby z mapy zaliczone. Ciekawe, ile znajd� jeszcze grob�w wielkich wojownik�w.");

	B_GivePlayerXP(500);
	DodajReputacje(5,REP_LOWCY);
	
	Info_ClearChoices (DIA_NASZ_119_Udar_WszystkieGroby);
	Info_AddChoice	  (DIA_NASZ_119_Udar_WszystkieGroby, "Daj mi te mikstury.", DIA_NASZ_119_Udar_WszystkieGroby_potions);
	Info_AddChoice	  (DIA_NASZ_119_Udar_WszystkieGroby, "Zatrzymam jednak to z�oto.", DIA_NASZ_119_Udar_WszystkieGroby_gold);

};

FUNC VOID DIA_NASZ_119_Udar_WszystkieGroby_potions()
{

	AI_Output (other,self ,"DIA_NASZ_119_Udar_WszystkieGroby_potions_15_00"); //Daj mi te mikstury.
	B_giveinvitems (other, self, ItMi_Gold, 250);	
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_potions_55_01"); //Dobra. Oto twoje mikstury.
	
	Createinvitems (self, ItPo_Health_02, 10);
	B_giveinvitems (self, other, ItPo_Health_02, 10);	

	Createinvitems (self, ItPo_Health_01, 5);
	B_giveinvitems (self, other, ItPo_Health_01, 5);	

	Info_ClearChoices (DIA_NASZ_119_Udar_WszystkieGroby);

};

FUNC VOID DIA_NASZ_119_Udar_WszystkieGroby_gold()
{

	AI_Output (other,self ,"DIA_NASZ_119_Udar_WszystkieGroby_gold_15_00"); //Zatrzymam jednak to z�oto.
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_gold_55_01"); //Jasne.

	Info_ClearChoices (DIA_NASZ_119_Udar_WszystkieGroby);

};


func void UdarSay_GreatJob() {
	AI_Output (self, other,"UdarSay_GreatJob_55_01"); //�wietna robota.
};

//*********************************************************************
//	Info GraveMissionMelatonix
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionMelatonix   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 36;
 	condition   = DIA_NASZ_119_Udar_GraveMissionMelatonix_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionMelatonix_Info;
 	permanent   = FALSE;
	description = "U�wi�ci�em gr�b Melatonixa.";
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionMelatonix_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_GraveMissionIfMoreGraves)) && (GraveMelatonix == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionMelatonix_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionMelatonix_15_00"); //U�wi�ci�em gr�b Melatonixa.
	UdarSay_GreatJob();
	
	Createinvitems (self, ItMi_Gold, 60);
	B_giveinvitems (self, other, ItMi_Gold, 60);	
};

//*********************************************************************
//	Info GraveMissionKaplan
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionKaplan   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 37;
 	condition   = DIA_NASZ_119_Udar_GraveMissionKaplan_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionKaplan_Info;
 	permanent   = FALSE;
	description = "U�wi�ci�em gr�b Kap�ana �mierciono�nych.";
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionKaplan_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_GraveMissionIfMoreGraves)) && (GraveKaplan == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionKaplan_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionKaplan_15_00"); //U�wi�ci�em gr�b Kap�ana �mierciono�nych.
	UdarSay_GreatJob();
	
	Createinvitems (self, ItMi_Gold, 60);
	B_giveinvitems (self, other, ItMi_Gold, 60);	
};

//*********************************************************************
//	Info GraveMissionCassem
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionCassem   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 38;
 	condition   = DIA_NASZ_119_Udar_GraveMissionCassem_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionCassem_Info;
 	permanent   = FALSE;
	description = "U�wi�ci�em gr�b Cassem Da-Na'rema.";
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionCassem_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_GraveMissionIfMoreGraves)) && (GraveCassem == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionCassem_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionCassem_15_00"); //U�wi�ci�em gr�b Cassem Da-Na'rema.
	UdarSay_GreatJob();
	
	Createinvitems (self, ItMi_Gold, 60);
	B_giveinvitems (self, other, ItMi_Gold, 60);	
};

//*********************************************************************
//	Info GraveMissionMugo
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionMugo   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 39;
 	condition   = DIA_NASZ_119_Udar_GraveMissionMugo_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionMugo_Info;
 	permanent   = FALSE;
	description = "U�wi�ci�em gr�b Muga.";
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionMugo_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_GraveMissionIfMoreGraves)) && (GraveMugo == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionMugo_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionMugo_15_00"); //U�wi�ci�em gr�b Muga.
	UdarSay_GreatJob();

	Createinvitems (self, ItMi_Gold, 60);
	B_giveinvitems (self, other, ItMi_Gold, 60);	
};

//*********************************************************************
//	Info GraveMissionGestath
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_GraveMissionGestath   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 40;
 	condition   = DIA_NASZ_119_Udar_GraveMissionGestath_Condition;
 	information = DIA_NASZ_119_Udar_GraveMissionGestath_Info;
 	permanent   = FALSE;
	description = "U�wi�ci�em gr�b Gestatha.";
};

FUNC INT DIA_NASZ_119_Udar_GraveMissionGestath_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_GraveMissionIfMoreGraves)) && (GraveGestath == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionGestath_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionGestath_15_00"); //U�wi�ci�em gr�b Gestatha.
	UdarSay_GreatJob();
	
	Createinvitems (self, ItMi_Gold, 60);
	B_giveinvitems (self, other, ItMi_Gold, 60);	
};


//*********************************************************************
//	Info PatrolDJGStart
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_PatrolDJGStart   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 40;
 	condition   = DIA_NASZ_119_Udar_PatrolDJGStart_Condition;
 	information = DIA_NASZ_119_Udar_PatrolDJGStart_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_119_Udar_PatrolDJGStart_Condition()	
{
	if (hero.guild == GIL_DJG) 
	&& (npc_knowsinfo(other, DIA_NASZ_110_Keroloth_HelpIsReady))
	&& (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_PatrolDJGStart_Info()
{
	// TODO: trialog

	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_00"); //Jak to jeszcze nie powr�cili?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_01"); //Niech to szlag, je�eli dopadli ich ci przekl�ci orkowie, nasz ca�y plan mo�e legn�� w gruzach. Odmaszeruj �o�nierzu, musz� pomy�le�.
	// TODO: AI_GOTOWP
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_02"); //Willu, przyszed�e� w naprawd� kiepskim momencie. Jak widzisz, przed chwil� dowiedzieli�my si�, �e nasz oddzia� zwiadowczy, kt�ry mia� sporz�dzi� plany rozmieszczenia si� ork�w, zagin��.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_03"); //Nie to jest jednak najgorsze. Przez to ca�e zamieszanie, nie mog� nawet wys�a� nikogo na poszukiwania. Wszyscy co� robi�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_04"); //Ta wojna to jedna wielka farsa...
	
	Log_CreateTopic (TOPIC_Udar_patrol,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_patrol, LOG_RUNNING);

	Info_ClearChoices (DIA_NASZ_119_Udar_PatrolDJGStart);
	Info_AddChoice	  (DIA_NASZ_119_Udar_PatrolDJGStart, "Mog� spr�bowa� ich odszuka�.", DIA_NASZ_119_Udar_PatrolDJGStart_yep);

};

func void UdarSay_AboutJanQuest() {
	AI_Output (self, other,"UdarSay_AboutJanQuest_55_00"); //A, jeszcze jedno: Jan tak�e chcia� si� z tob� zobaczy�. Nie zapomnij do niego zajrze�.
	B_LogEntry (TOPIC_Keroloth_Wojna, "No i masz! Nie tylko musz� pom�c Udarowi, ale te� Janowi.");
	HeroKnowAboutJanQuest = TRUE;
};

FUNC VOID DIA_NASZ_119_Udar_PatrolDJGStart_yep()
{
	AI_Output (other,self ,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_15_00"); //Mog� spr�bowa� ich odszuka�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_01"); //Naprawd�? Zdajesz sobie spraw� z tego, �e to b�dzie bardzo ryzykowna misja?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_02"); //Orkowie w�sz�, chyba co� przeczuwaj�. Nawet trudno mi powiedzie�, czy ci zwiadowcy w og�le jeszcze �yj�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_03"); //Pos�uchaj uwa�nie: Cztery dni temu wys�ali�my w pobli�e zamku oddzia� zwiadowczy, kt�ry mia� przeprowadzi� rozeznanie w si�ach ork�w i sporz�dzi� stosowne raporty na ten temat.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_04"); //Lecz od tamtej pory nie mamy z nimi �adnego kontaktu. Nie wpada�bym w takie przera�enie, gdyby nie fakt, �e mieli do nas wr�ci� po dw�ch dniach.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_05"); //Powiedz mi tylko, gdzie mieli si� skry�, a od razu wyrusz� na ich poszukiwania.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_06"); //Z tego co si� orientuj� mieli w planach skry� si� w jaskini, kt�ra znajduje si� pod p�askowy�em, gdzie mo�na zauwa�y� orkowe namioty. To na po�udnie od zamku. Chcieli zabi� tamtejszych ork�w i urz�dzi� tam sobie punkt obserwacyjny.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_07"); //To b�dzie ci�ka wyprawa, potrzebuj� jakiego� wyposa�enia.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_08"); //Nie mam tego zbyt wiele... Mog� ci da� trzy eliksiry lecznicze i dwa zwoje z kul� ognia.

	Createinvitems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Createinvitems(self,ItSc_InstantFireball,2);
	B_GiveInvItems(self,other,ItSc_InstantFireball,2);
	
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_09"); //Pewnie, wszystko si� przyda.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_10"); //W takim razie ruszaj i niech ogie� Innosa rozgrzewa twe serce w trakcie walki.
	UdarSay_AboutJanQuest();

	B_LogEntry (TOPIC_Udar_patrol,"Mog�em si� tego spodziewa�, oddzia� zwiadowczy wys�any w okolice zamku zagin�� i na moje barki spad�o odszukanie ich. Najlepiej b�dzie zacz�� od jaskini, w kt�rej mieli si� schroni�, czyli pod p�askowy�em na po�udnie od zamku.");

	UdarQuestPatrolStart = TRUE;
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info PatrolFinish
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_PatrolFinish   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 40;
 	condition   = DIA_NASZ_119_Udar_PatrolFinish_Condition;
 	information = DIA_NASZ_119_Udar_PatrolFinish_Info;
 	permanent   = FALSE;
	description = "Przynosz� raport od zwiadowc�w.";
};

FUNC INT DIA_NASZ_119_Udar_PatrolFinish_Condition()	
{
	if (npc_knowsinfo(other, DIA_NASZ_130_Jenkins_EndOfMatt))
	&& (npc_hasitems(other,ItNa_JenkinsRaport)>=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_PatrolFinish_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_00"); //Przynosz� raport od zwiadowc�w.
	B_GiveInvItems(other,self,ItNa_JenkinsRaport,1);
	Npc_RemoveIntItems(self,ItNa_JenkinsRaport,1);
	B_UseFakeScroll();
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_01"); //Trzymaj. Jest tam r�wnie� mapa z zasnaczonymi si�ami ork�w.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolFinish_15_02"); //Doskonale, ale strasznie d�ugo ci to wszystko zaj�o. Co ze zwiadowcami?
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_03"); //Znalaz�em ich, rozbili ob�z niedaleko rzeki, gdzie lecz� swoje rany. W nocy, po kt�rej mieli wr�ci� do obozu, zdecydowali si� jeszcze poobserwowa� ork�w.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_04"); //W�a�nie wtedy us�yszeli dochodz�ce stamt�d krzyki i dziwn� inkantacj�, kt�r� uda�o si� przet�umaczy� Jenkinsowi.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_05"); //Kiedy przeczytali�my j� na g�os nagle pojawi�y si� szkielety, a gdyby tego by�o ma�o, jeszcze dwa dziwne, nieumar�e cieniostwory, kt�re pilnowa�y tajemniczego maga na prze��czy.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_06"); //Spotka�em si� z nim, lecz kiedy ju� chcia�em go zabi� ten znikn��, m�wi�c, i� to jeszcze nie jest czas naszego starcia. Jego poplecznicy zabili Matta i z�o�yli go w ofierze.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolFinish_15_07"); //Wystarczy! 
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolFinish_15_08"); //To brzmi naprawd� �le. I to wszystko akurat teraz, kiedy przygotowujemy si� do szturmu na zamek. Niech to cholera, trzeba szybko przygotowa� si� do ataku, aby zdoby� bezpieczne schronienie w tym miejscu.
	
	Log_SetTopicStatus (TOPIC_Udar_patrol, LOG_SUCCESS);
	B_LogEntry (TOPIC_Udar_patrol, "Przynios�em Udarowi raport od zwiadowc�w i opowiedzia�em mu o sytuacji.");

};

//*********************************************************************
//	Info PresjaCzasu
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_PresjaCzasu   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 40;
 	condition   = DIA_NASZ_119_Udar_PresjaCzasu_Condition;
 	information = DIA_NASZ_119_Udar_PresjaCzasu_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_119_Udar_PresjaCzasu_Condition()	
{
	if (npc_knowsinfo(other, DIA_NASZ_119_Udar_PatrolFinish))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_PresjaCzasu_Info()
{
	AI_Output (self, other,"DIA_NASZ_119_Udar_PresjaCzasu_15_00"); //Will, kurcze! Patrzy�e� w og�le na t� map�?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PresjaCzasu_15_01"); //Zebrane wojenne do�wiadczenie od razu podpowiada mi to, czego Jenkins prawdopodobnie si� nie domy�li�.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PresjaCzasu_15_02"); //Co masz na my�li? Chodzi o ork�w, prawda?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PresjaCzasu_15_03"); //Jenkins rozrysowa� mi, jak przemieszcza�y si� orkowe grupki zwiadowcze. Z tego wynika, �e orkowie zaatakuj� wkr�tce my�liwych!
	AI_Output (self, other,"DIA_NASZ_119_Udar_PresjaCzasu_15_04"); //Musisz jak najszybciej poinformowa� ich o tym, aby mogli si� przygotowa�!
	
	Log_CreateTopic (TOPIC_Udar_presja,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_presja, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_presja, "Udar wywnioskowa� z mapy i raport�w od Jenkinsa, �e orkowie zamierzaj� zaatakowa� ob�z my�liwych. Musz� co pr�dzej ich o tym powiadomi�!");

	Npc_ExchangeRoutine (NASZ_214_Goth, "Wait4Draal"); // zeby czekal cala noc pod brama
	B_StartOtherRoutine(NASZ_219_Dick,"TOT"); // znika

};

//*********************************************************************
//	Info AllIsReady
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_AllIsReady   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 24;
 	condition   = DIA_NASZ_119_Udar_AllIsReady_Condition;
 	information = DIA_NASZ_119_Udar_AllIsReady_Info;
 	permanent   = FALSE;
 	description = "Wszystko ju� jest gotowe.";
};

FUNC INT DIA_NASZ_119_Udar_AllIsReady_Condition()
{
	if (hero.guild == GIL_DJG)
	&& (npc_knowsinfo(other,DIA_NASZ_106_Jan_Kap3QuestFinish)) // helmy
	&& (npc_knowsinfo(other,DIA_NASZ_130_Jenkins_EndOfMatt)) // bestia
	&& (npc_knowsinfo(other,DIA_NASZ_219_Dick_PresjaCzasu)) // presja czasu
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_AllIsReady_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_AllIsReady_55_00"); //Wszystko ju� jest gotowe.
	AI_Output (self, other,"DIA_NASZ_119_Udar_AllIsReady_55_01"); //Dobra robota. Mo�esz wr�ci� do Kerolotha i powiedzie� mu, �e wszystko w obozie gra jak nale�y.
	AI_Output (self, other,"DIA_NASZ_119_Udar_AllIsReady_55_02"); //Dzi�ki za pomoc, Willu.
	
	B_LogEntry (TOPIC_Keroloth_Wojna, "Ob�z �owc�w ork�w jest gotowy. Mog� wr�ci� do Kerolotha.");

	// Gestath teraz idzie do twierdzy
	KerolothMysliwi = KerolothMysliwi + 1;
	Npc_ExchangeRoutine (NASZ_213_Gestath, "Twierdza");

};



// TODO:  obrobic dialogi z udarem od kap4, gdy fexo wysle...

//*********************************************************************
//	Info Kap4Start
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_Kap4Start   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 41;
 	condition   = DIA_NASZ_119_Udar_Kap4Start_Condition;
 	information = DIA_NASZ_119_Udar_Kap4Start_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_119_Udar_Kap4Start_Condition()	
{
	if (KAPITEL == 4)
	&& (npc_knowsinfo(other,DIA_NASZ_110_Keroloth_Kap4))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_Kap4Start_Info()
{

	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_15_00"); //Jeste� wreszcie! Jakie wie�ci przynosisz?		
	AI_Output (other, self,"DIA_NASZ_119_Udar_Kap4Start_55_01"); //Uda�o si� nam odbi� zamek, a orkowe si�y zosta�y starte z powierzchni ziemi. Teraz pozosta�o nam jedynie zaj�� si� umacnianiem naszej pozycji w tym rejonie.
	AI_Output (other, self,"DIA_NASZ_119_Udar_Kap4Start_55_02"); //Niestety, kilku ludzi przyp�aci�o to �yciem. W tym Gestath...
	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_55_03"); //To smutna wiadomo��. Niech Beliar nie dobierze si� do jego duszy, a Innos wype�ni j� �wiat�em.
	AI_Output (other, self,"DIA_NASZ_119_Udar_Kap4Start_55_04"); //Z polecenia Kerolotha powiniene� odes�a� do zamku jeszcze kilku wojownik�w, bo obawia si� o ewentualny atak ze strony ork�w.
	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_55_05"); //To bardzo prawdopodobne. Znam si� troch� na tych stworzeniach i mog� ci powiedzie�, �e nigdy si� nie poddaj�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_55_06"); //Mo�esz mu przekaza�, �e mo�liwie najszybciej wy�l� do niego kilku ludzi. Chc�, aby dobrze przygotowali si� na to, co mo�e ich tam zasta�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_55_07"); //Jeszcze jedna sprawa: W mi�dzyczasie przeteleportowa� si� tutaj mag. Udaj si� do niego, jest w �rodku.

	Npc_ExchangeRoutine(self,"UdarBoss");
	B_StartOtherRoutine(NASZ_229_Ayan,"Start"); // Ayan przenosi sie do misji z ozywiencem
	
	Log_SetTopicStatus (TOPIC_Keroloth_Wojna, LOG_SUCCESS);
	B_LogEntry (TOPIC_Keroloth_Wojna, "Donios�em Udarowi wie�ci z zamku. Tymczasem w obozie pojawi� si� mag, kt�ry chce si� ze mn� spotka�.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "W obozie �owc�w ork�w pojawi� si� mag. By� mo�e to znak, �e �wiat zewn�trzny ci�gle si� nami interesuje?");
	

	B_GivePlayerXP(500);
	B_LogEntry (TOPIC_Sprawy,"Udar bez problemu zgodzi� si� wys�a� do zamku kilku ludzi.");

};



//*********************************************************************
//	Info PalisadaOtwarta
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_PalisadaOtwarta   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 41;
 	condition   = DIA_NASZ_119_Udar_PalisadaOtwarta_Condition;
 	information = DIA_NASZ_119_Udar_PalisadaOtwarta_Info;
 	permanent   = FALSE;
	description = "Orkowie otwarli bram� na swoje tereny."; // TODO!
};

FUNC INT DIA_NASZ_119_Udar_PalisadaOtwarta_Condition()	
{
	if (npc_knowsinfo(other,DIA_NASZ_119_Udar_Kap4Start))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_PalisadaOtwarta_Info()
{

	AI_Output (other, self,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_00"); //Orkowie otwarli bram� na swoje tereny.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_01"); //M�wisz powa�nie? Ta wiadomo�� nape�ni�a mnie now� nadziej� na odszukanie patrolu, kt�ry zagin�� spory kawa� czasu temu.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_02"); //Ludzie za palisad�?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_03"); //Paladyni przybyli do G�rniczej Doliny na chwil� przed ca�kowitym zabudowaniem palisady. Garond za wszelk� cen� chcia� wiedzie�, co znajduje si� po drugiej stronie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_04"); //Wys�a� trzech rycerzy, aby przedarli si� na wybrze�e i sprawdzili, co dzieje si� w tamtejszych terenach. Niestety, nigdy ju� nie wr�cili.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_05"); //Je�li znajdziesz w sobie do�� si�, aby przekroczy� progi ziem ork�w, to mo�esz ich poszuka�. �ywych lub martwych.

	Log_CreateTopic (TOPIC_Udar_oddzial, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_oddzial, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_oddzial, "Z powodu otwarcia si� orkowej palisady, paladyn Udar ponownie nape�ni� si� nadziej� na odszukanie patrolu, kt�ry zagin�� za ni� ju� jaki� czas temu. By� mo�e natkn� si� na grupk� ludzi, eksploruj�c tamtejsze tereny?");
	
};


var int WillNieChceStrzelic;
var int UdarKuszaDay;
var int WillStrzeliDoUdara;
//*********************************************************************
//	Info DoCrossBow
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_DoCrossBow   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 42;
 	condition   = DIA_NASZ_119_Udar_DoCrossBow_Condition;
 	information = DIA_NASZ_119_Udar_DoCrossBow_Info;
 	permanent   = FALSE;
	description = "Potrafisz wytwarza� kusze?";
};

FUNC INT DIA_NASZ_119_Udar_DoCrossBow_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_106_Jan_surowce))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_DoCrossBow_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_DoCrossBow_15_00"); //Potrafisz wytwarza� kusze?
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_01"); //Potrafi�. A czemu pytasz?
	AI_Output (other, self,"DIA_NASZ_119_Udar_DoCrossBow_55_02"); //Jan chce skompletowa� nowe wyposarzenie wojownik�w.
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_03"); //I szukasz kogo�, kto zrobi kusz�?
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_04"); //W porz�dku, wykonam prototyp. Ale pod jednym warunkiem!
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_05"); //Strzelisz z niej do mnie. Musz� wiedzie�, �e nie jest badziewna.
	AI_Output (other, self,"DIA_NASZ_119_Udar_DoCrossBow_55_06"); //Co?! To najg�upsza rzecz, jak� us�sza�em.
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_07"); //Umowa stoi, czy nie?

	Info_ClearChoices (DIA_NASZ_119_Udar_DoCrossBow);
	Info_AddChoice	  (DIA_NASZ_119_Udar_DoCrossBow, "Nie ma mowy, nie zrobi� tego.", DIA_NASZ_119_Udar_DoCrossBow_no);
	Info_AddChoice	  (DIA_NASZ_119_Udar_DoCrossBow, "No dobra, strzel� do ciebie.", DIA_NASZ_119_Udar_DoCrossBow_yep);

	B_LogEntry (TOPIC_Jan_lowca, "Udar zrobi dla mnie kusz�, je�li p�niej wypr�buj� j� na nim samym. Dziwne podej�cie...");
};

FUNC VOID DIA_NASZ_119_Udar_DoCrossBow_no()
{

	AI_Output (other,self ,"DIA_NASZ_119_Udar_DoCrossBow_no_15_00"); //Nie ma mowy, nie zrobi� tego.
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_no_55_01"); //W takim razie zapomnij o kuszy.
	WillNieChceStrzelic = TRUE;
		
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_NASZ_119_Udar_DoCrossBow_yep()
{

	AI_Output (other,self ,"DIA_NASZ_119_Udar_DoCrossBow_yep_15_00"); //No dobra, strzel� do ciebie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_yep_55_01"); //�wietnie. Wr�� jutro. Kusza b�dzie gotowa.
	
	UdarKuszaDay = Wld_GetDay();
	WillStrzeliDoUdara = TRUE;
		
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info IDecidedToShoot
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_IDecidedToShoot   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 43;
 	condition   = DIA_NASZ_119_Udar_IDecidedToShoot_Condition;
 	information = DIA_NASZ_119_Udar_IDecidedToShoot_Info;
 	permanent   = FALSE;
	description = "Niech b�dzie. Strzel� do ciebie.";
};

FUNC INT DIA_NASZ_119_Udar_IDecidedToShoot_Condition()	
{
	if (WillNieChceStrzelic == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_IDecidedToShoot_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_IDecidedToShoot_15_00"); //Niech b�dzie. Strzel� do ciebie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_IDecidedToShoot_55_01"); //Ciesz� si�, �e si� rozumiemy.
	AI_Output (other, self,"DIA_NASZ_119_Udar_IDecidedToShoot_55_02"); //Ale tylko w nog�!
	AI_Output (self, other,"DIA_NASZ_119_Udar_IDecidedToShoot_55_03"); //A strzelaj sobie, gdzie chcesz. Zajmiesz si� tym jutro. Kusza b�dzie gotowa.

	UdarKuszaDay = Wld_GetDay();
	WillStrzeliDoUdara = TRUE;

};

//*********************************************************************
//	Info CrossBowReady
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_CrossBowReady   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 44;
 	condition   = DIA_NASZ_119_Udar_CrossBowReady_Condition;
 	information = DIA_NASZ_119_Udar_CrossBowReady_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_119_Udar_CrossBowReady_Condition()	
{
	if (WillStrzeliDoUdara == TRUE)
	 && (UdarKuszaDay < Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_CrossBowReady_Info()
{
	AI_Output (self, other,"DIA_NASZ_119_Udar_CrossBowReady_15_00"); //No! Skoro przyszed�e�, to mo�emy wypr�bowa� kusz�.
	AI_Output (self, other,"DIA_NASZ_119_Udar_CrossBowReady_55_01"); //Bierz j� i strzelaj.
	
	Createinvitems (self, ItNa_KuszaLowcy, 1);
	B_giveinvitems (self, other, ItNa_KuszaLowcy, 1);

};

//*********************************************************************
//	Info ThanksToYou
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_ThanksToYou   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 45;
 	condition   = DIA_NASZ_119_Udar_ThanksToYou_Condition;
 	information = DIA_NASZ_119_Udar_ThanksToYou_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_119_Udar_ThanksToYou_Condition()	
{
	if (WillStrzelilWUdara == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_ThanksToYou_Info()
{
	AI_Output (self, other,"DIA_NASZ_119_Udar_ThanksToYou_15_00"); //Boli! Wysz�a mi z tego ca�kiem dobra kusza.
	AI_Output (self, other,"DIA_NASZ_119_Udar_ThanksToYou_55_01"); //Mo�esz j� pokaza� Janowi.
	
	B_LogEntry (TOPIC_Jan_lowca, "Strzeli�em do Udara. Powiedzia�, �e kusza jest w porz�dku i mog� j� pokaza� Janowi.");
	B_GivePlayerXP(500);
};
































//*********************************************************************
//	Info Teach
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_Teach   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 100;
 	condition   = DIA_NASZ_119_Udar_Teach_Condition;
 	information = DIA_NASZ_119_Udar_Teach_Info;
 	permanent   = TRUE;
	description = "Ucz mnie strzela� z kuszy.";
};

FUNC INT DIA_NASZ_119_Udar_Teach_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_nauka)
	&& (other.HitChance[NPC_TALENT_CROSSBOW] < 100))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_Teach_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_Teach_15_00"); //Ucz mnie strzela� z kuszy.

	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);
	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};


func void DIA_NASZ_119_Udar_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 100)
	{
		AI_Output(self,other,"DIA_NASZ_119_Udar_Teach_01_00"); //Nie potrafi� ci� ju� niczego nauczy�. Opanowa�e� do mistrzostwa sztuk� strzelania. Gratuluj�.
		
	};
	Info_ClearChoices (DIA_NASZ_119_Udar_Teach);
};

func void DIA_NASZ_119_Udar_Teach_1H_1 ()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 100);
	
	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);

	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};

func void DIA_NASZ_119_Udar_Teach_1H_5 ()	
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 100);
	
	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);

	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};	

func void DIA_NASZ_119_Udar_Teach_1H_1High ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 100);
	
	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);

	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};

func void DIA_NASZ_119_Udar_Teach_1H_5High ()	
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 100);
	
	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);

	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};	

//*********************************************************************
//	         SzybkaNauka
//*********************************************************************
INSTANCE DIA_NASZ_119_Udar_SzybkaNauka   (C_INFO)
{
	npc         = NASZ_119_Udar;
 	nr          = 100;
 	condition   = DIA_NASZ_119_Udar_SzybkaNauka_Condition;
 	information = DIA_NASZ_119_Udar_SzybkaNauka_Info;
 	permanent   = TRUE;
 	description = "Chc� si� szybciej uczy�. (500 szt. z�ota, 10PN)";
};

FUNC INT DIA_NASZ_119_Udar_SzybkaNauka_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_nauka)
		&& (SzybkaNaukaTaught == FALSE))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_119_Udar_SzybkaNauka_Info()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_SzybkaNauka_15_00"); //Chc� si� szybciej uczy�.
	
	if (npc_hasitems (other, ItMi_Gold) < 500) {
		AI_Output (self, other,"DIA_NASZ_119_Udar_SzybkaNauka_15_01"); //Nie masz do�� z�ota.
		}
	else {

		if (hero.lp >= 10){
			AI_Output (self, other,"DIA_NASZ_119_Udar_SzybkaNauka_55_02"); //Staraj si� zapami�tywa� ka�dy ruch. Ka�de wykonane dzie�o.
			AI_Output (self, other,"DIA_NASZ_119_Udar_SzybkaNauka_15_03"); //Pami�taj: Przyswajanie wiedzy zale�y od twojego umys�u.

			B_GiveInvItems (other, self, ItMi_Gold, 500);			
			SzybkaNaukaTaught = TRUE;
			hero.lp = hero.lp - 10;
			
			PrintScreen ("Nauka: szybka nauka", -1, -1, FONT_Screen, 2);

			Npc_SetTalentSkill 	(hero, NPC_TALENT_D, 1);
			}

		else {
			AI_Output (self, other,"DIA_NASZ_119_Udar_SzybkaNauka_55_04"); //Brak ci do�wiadczenia.
		};
	};
};	
	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_119_Udar_PICKPOCKET (C_INFO)
{
	npc			= NASZ_119_Udar;
	nr			= 900;
	condition	= DIA_NASZ_119_Udar_PICKPOCKET_Condition;
	information	= DIA_NASZ_119_Udar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_119_Udar_PICKPOCKET_Condition()
{
	C_Beklauen (73);
};
 
FUNC VOID DIA_NASZ_119_Udar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_119_Udar_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_119_Udar_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_119_Udar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_119_Udar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_119_Udar_PICKPOCKET_DoIt);
};

func void DIA_NASZ_119_Udar_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItPo_Health_03,4);
	B_BeklauenThings(ItPo_Health_02,3);
	
	Info_ClearChoices (DIA_NASZ_119_Udar_PICKPOCKET);
};
	
func void DIA_NASZ_119_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_119_Udar_PICKPOCKET);
};

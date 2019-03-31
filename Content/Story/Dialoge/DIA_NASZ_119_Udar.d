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
	AI_Output (other, self,"DIA_NASZ_119_Udar_PreHello_55_00"); //Jesteœ rycerzem?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PreHello_55_01"); //Nie pomyli³eœ siê, ch³opcze. Razem z Kerolothem rekrutowaliœmy wojowników na zamku. By³eœ ju¿ u niego?

	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_siema)) {
		AI_Output (other, self,"DIA_NASZ_119_Udar_PreHello_55_02"); //Tak. Wymieniliœmy kilka zdañ.
		AI_Output (self, other,"DIA_NASZ_119_Udar_PreHello_55_03"); //I pewnie chcesz, ¿ebym zleci³ ci jakieœ zadanie? Có¿... Zobaczymy.
	}
	else {
		AI_Output (other, self,"DIA_NASZ_119_Udar_PreHello_55_04"); //Nie, jeszcze nie.
		AI_Output (self, other,"DIA_NASZ_119_Udar_PreHello_55_05"); //Keroloth to nasz szef. Jeœli chcesz do nas do³¹czyæ, to zajrzyj do niego.
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
	AI_Output (self, other,"DIA_NASZ_119_Udar_siema_55_01"); //Jestem odpowiedzialny za handel z myœliwymi. Wbrew pozorom kilku z nich ma swoje na sumieniu i ktoœ uczciwy musi pilnowaæ, by wymiana by³a sprawiedliwa.
	AI_Output (self, other,"DIA_NASZ_119_Udar_siema_55_02"); //Pilnujê, by co pewien czas dostarczali nam ¿ywnoœæ i mikstury. My z kolei za³atwiamy im miecze i pancerze.
	AI_Output (self, other,"DIA_NASZ_119_Udar_siema_55_03"); //Poza tym kiedyœ by³em kusznikiem, wiêc niektórzy ch³opcy siê u mnie szkol¹.
	
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
 	description = "Móg³byœ mnie te¿ czegoœ nauczyæ?";
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
	AI_Output (other,self ,"DIA_NASZ_119_Udar_nauka_15_00"); //Móg³byœ mnie te¿ czegoœ nauczyæ?
	AI_Output (self, other,"DIA_NASZ_119_Udar_nauka_55_01"); //Jasne. Powiedz tylko, kiedy chcia³byœ zacz¹æ.
	AI_Output (self, other,"DIA_NASZ_119_Udar_nauka_55_02"); //Oprócz kuszy mogê nauczyæ ciê, jak szybciej siê uczyæ i zdobywaæ doœwiadczenie.

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Udar pomo¿e mi w strzelaniu z kuszy.");
	B_LogEntry (TOPIC_LowcyTeacher,"Udar mo¿e mi pokazaæ, jak szybciej siê uczyæ.");
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
 	description = "Gdzie mo¿na kupiæ kuszê?";
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
	AI_Output (other,self ,"DIA_NASZ_119_Udar_kusza_15_00"); //Gdzie mo¿na kupiæ kuszê?
	AI_Output (self, other,"DIA_NASZ_119_Udar_kusza_55_01"); //Johny na pewno bêdzie coœ mia³. IdŸ do niego.

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
 	description = "Mogê coœ dla ciebie zrobiæ?";
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
	AI_Output (other,self ,"DIA_NASZ_119_Udar_zadanie_15_00"); //Mogê coœ dla ciebie zrobiæ?
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_01"); //Jasne. Mia³em iœæ sam, ale skoro chcesz siê na coœ przydaæ, to wyœlê ciebie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_02"); //Jeden z myœliwych, Kirgo, jest alchemikiem.
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_03"); //IdŸ do niego i odbierz przesy³kê. Tylko uwa¿aj, bo ten cz³owiek jest chytry i z pewnoœci¹ bêdzie chcia³ ciê wykiwaæ.
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_04"); //Mo¿e sprzedaæ ci mniej mikstur ni¿ zamówi³em. Ju¿ parê razy by³y takie przypadki.
	AI_Output (other,self ,"DIA_NASZ_119_Udar_zadanie_15_05"); //Co dok³adnie zamówi³eœ?
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_06"); //Mam tu listê.
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_07"); //Taa, wszystko siê zgadza. Trzymaj.
	Createinvitems (self, ItNa_Lista_Mikstur, 1);
	B_giveinvitems (self, other, ItNa_Lista_Mikstur, 1);
	AI_Output (self, other,"DIA_NASZ_119_Udar_zadanie_55_08"); //I pamiêtaj: Nie daj siê wykiwaæ!

	Log_CreateTopic (TOPIC_Udar_mikstury, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_mikstury, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_mikstury, "Udar poprosi³ mnie o przyniesienie zamówionych mikstur. Ma mi je daæ Kirgo, alchemik z obozu myœliwych.");

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
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_01"); //Brakuje kilku. Ah, ten Kirgo, to ju¿ kolejny raz! Chyba te¿ zacznê wysy³aæ ubo¿sze przesy³ki i œwieciæ póŸniej oczami.
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_02"); //Mog³em iœæ po nie sam. A mówi³em: Uwa¿aj na niego, ¿eby ciê nie wykiwa³!
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_03"); //Có¿, przynajmniej to ty odwali³eœ tê robotê i mia³em dwie godziny czasu dla siebie.

		B_GiveInvItems (other, self, ItNa_PaczkaMikstur, 1);

		B_LogEntry (TOPIC_Udar_mikstury, "Przynios³em Udarowi mikstury. Nie wydawa³ siê jednak zachwycony, bo da³em siê oszukaæ...");
		Log_SetTopicStatus (TOPIC_Udar_mikstury, LOG_SUCCESS);
		DodajReputacje (2, REP_LOWCY);
		B_GivePlayerXP (200);

	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_04"); //S¹ wszystkie. Nie da³eœ siê oszukaæ, jestem pod wra¿eniem.
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_05"); //Mam nadziejê, ¿e Kirgo nie stawia³ siê zbytnio, gdy zwróci³eœ mu uwagê na niepe³n¹ przesy³kê?
		AI_Output (other, self,"DIA_NASZ_119_Udar_koniec_55_06"); //Powiedzmy, ¿e da³em sobie radê.
		AI_Output (self, other,"DIA_NASZ_119_Udar_koniec_55_07"); //Masz tu trochê z³ota. Dobrze siê spisa³eœ.

		B_GiveInvItems (other, self, ItPo_Health_01, 20);
		B_GiveInvItems (other, self, ItPo_Health_02, 10);
		B_GiveInvItems (other, self, ItPo_Mana_01, 10);
		B_GiveInvItems (other, self, ItPo_Speed, 3);

		Createinvitems (self, itmi_gold, 100);
		B_giveinvitems (self, other, itmi_gold, 100);
		B_LogEntry (TOPIC_Udar_mikstury, "Przynios³em Udarowi mikstury. By³ pod wra¿eniem, ¿e nie da³em siê oszukaæ.");
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
	description = "£owcy zaatakowali myœliwych.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_goth_15_00"); //£owcy zaatakowali myœliwych.
	AI_Output (self, other,"DIA_NASZ_119_Udar_goth_55_01"); //Ano. By³a taka sprawa.
	AI_Output (self, other,"DIA_NASZ_119_Udar_goth_55_02"); //Jednak¿e nikt jej nie wyjaœni³ i wci¹¿ wiemy tyle, co na pocz¹tku, czyli nic.

	B_LogEntry (TOPIC_Goth_kradziez, "Udar powiedzia³ mi, ¿e przywódcy obozu nie maj¹ pojêcia, kto zaatakowa³ myœliwych.");

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
	description = "Nie znalaz³eœ przypadkiem paczki gwoŸdzi?";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_Gwozdzie_15_00"); //Nie znalaz³eœ przypadkiem paczki gwoŸdzi?
	AI_Output (self, other,"DIA_NASZ_119_Udar_Gwozdzie_55_01"); //Znalaz³em... Kilka dni temu, w karczmie. Ale Phill powiedzia³, ¿e to jego.
	AI_Output (self, other,"DIA_NASZ_119_Udar_Gwozdzie_55_02"); //Po co ci te gwoŸdzie?
	AI_Output (other, self,"DIA_NASZ_119_Udar_Gwozdzie_15_03"); //Niewa¿ne. Wystarczy, ¿e wiem kto je ma.
	
	WillKnowGwozdzieThief = TRUE;

	B_LogEntry (TOPIC_Robotnik_deski, "Udar znalaz³ gwoŸdzie i da³ je Phillowi.");

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
		AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_15_00"); //Will, czekaj no! Potrzebujê kogoœ do wa¿nej misji.
		AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionBegin_55_01"); //Nieszczêœliwy ja, ¿e siê na ciebie natkn¹³em...
		AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_02"); //Nie martw siê, nie po¿a³ujesz!
	}
	else { // GIL_DJG
		AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_03"); //Czekaj jeszcze chwilê, przez to wszystko prawie zapomnia³em o jednej, bardzo wa¿nej rzeczy.
	};

	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionBegin_15_04"); //O co chodzi?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_05"); //W ca³ej Górniczej Dolinie jest wiele grobów. S¹ rozsiane byle gdzie. Mo¿na je wykorzystaæ jako Ÿród³a mocy.
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionBegin_15_06"); //Chyba sobie ¿artujesz! Mam profanowaæ groby?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_07"); //Wrêcz przeciwnie! Innos oczyœci je ze wszystkich cielesnych przewinieñ. Zwa¿ na to, ¿e to przecie¿ kolonia karna. Wielu z pochowanych tutaj ma wiele na sumieniu i potrzebuj¹ ³aski Innosa.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_55_08"); //To jak, pomo¿esz mi?	
	
	Info_ClearChoices (DIA_NASZ_119_Udar_GraveMissionBegin);
		Info_AddChoice	  (DIA_NASZ_119_Udar_GraveMissionBegin, "Nie, zapomnij.", DIA_NASZ_119_Udar_GraveMissionBegin_no);
		Info_AddChoice	  (DIA_NASZ_119_Udar_GraveMissionBegin, "Oczywiœcie.", DIA_NASZ_119_Udar_GraveMissionBegin_yes);

};


FUNC VOID DIA_NASZ_119_Udar_GraveMissionBegin_no()
{
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionBegin_no_55_01"); //Nie, zapomnij.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_no_55_02"); //Nie, nie zapomnê o tobie. Gdybyœ mimo wszystko zdecydowa³ siê pomóc, to wpadnij do mnie.
	UdarOdrzucenie = TRUE;

	Info_ClearChoices (DIA_NASZ_119_Udar_GraveMissionBegin);
};

FUNC VOID DIA_NASZ_119_Udar_GraveMissionBegin_yes()
{

	AI_Output (other,self ,"DIA_NASZ_119_Udar_GraveMissionBegin_yes_15_03"); //Oczywiœcie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionBegin_yes_15_04"); //Wiedzia³em, ¿e siê zgodzisz!
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
	description = "Zdecydowa³em, ¿e ci pomogê.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionNext_15_00"); //Zdecydowa³em, ¿e ci pomogê.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionNext_55_01"); //To dobra wiadomoœæ. Liczy³em na ciebie.
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
	description = "Co dok³adnie mam zrobiæ?";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_15_00"); //Co dok³adnie mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_01"); //WeŸ tê mapê.
	Createinvitems (self, ItNa_Mapa_GraveMission, 1);
	B_giveinvitems (self, other, ItNa_Mapa_GraveMission, 1);
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_02"); //Spójrz, zaznaczy³em tutaj kilkanaœcie grobów, o których wiem.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_03"); //Pamiêtaj: Interesuj¹ mnie tylko groby potê¿nych ¿o³nierzy. Rozumiesz, im potê¿niejszy ¿o³nierz, tym wiêksza ³aska Innosa.
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_04"); //To znaczy, nie oczyszczaæ grobów nieznanych ¿o³nierzy?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_05"); //Tak, w³aœnie. Bo ich znaczenie jest ma³o wa¿ne.
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_06"); //A wiêc masz oczyœciæ wszystkie groby, które tu zaznaczy³em. Wpierw rozkopujesz grób, potem wlewasz wodê œwiêcon¹. Proste, prawda?
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_07"); //Wyruszam w drogê od razu!
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_08"); //Hola, hola! Zahacz najpierw o Brona. On sprzeda ci wodê œwiêcon¹.
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_09"); //Powiedzia³eœ 'sprzeda'? Mówi³eœ, ¿e nie po¿a³ujê, tymczasem mam p³aciæ z w³asnej kieszeni...
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionWhatToDo_55_10"); //Nie przejmuj siê, dostaniesz du¿o wiêcej ni¿ myœlisz.

	GraveMissionReady = TRUE;

	Log_CreateTopic (TOPIC_Udar_Grave, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_Grave, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_Grave, "Udar wymyœli³ sobie, ¿e jeœli poœwiêcê groby wielkich wojowników, to Innos zeœle na nas ³askê... Dosta³em mapê - mam rozkopaæ ka¿dy z tych grobów i wlaæ tam wodê œwiêcon¹. Powinienem œwiêciæ groby tylko wielkich wojowników - nie nieznanych ¿o³nierzy. Wodê œwiêcon¹ sprzeda mi Bron.");

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
	description = "Co jeœli znajdê grób, którego nie ma na tej mapie?";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionIfMoreGraves_15_00"); //Co jeœli znajdê grób, którego nie ma na tej mapie?
	AI_Output (self, other,"DIA_NASZ_119_Udar_GraveMissionIfMoreGraves_55_01"); //Poœwiêæ go równie¿. Za ka¿dy nastêpny grób wielkiego wojownika dostaniesz 60 sztuk z³ota.

	B_LogEntry (TOPIC_Udar_Grave, "Za ka¿dy poœwiêcony grób spoza mapy dostanê 60 sztuk z³ota.");

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
	description = "Uœwiêci³em wszystkie groby zaznaczone na mapie.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_WszystkieGroby_15_00"); //Uœwiêci³em wszystkie groby zaznaczone na mapie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_55_01"); //Dobra robota. Myœlê, ¿e ta sumka powinna wynagrodziæ twoje trudy.
	Createinvitems (self, ItMi_Gold, 250);
	B_giveinvitems (self, other, ItMi_Gold, 250);	
	AI_Output (other, self,"DIA_NASZ_119_Udar_WszystkieGroby_55_02"); //¯artujesz chyba... Goni³em po ca³ej Górniczej Dolinie, a ty ledwo zwracasz mi z³oto za wodê œwiêcon¹.
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_55_03"); //Sam wiesz, ¿e ze z³otem nie jest najlepiej. No ale dobra, dostaniesz trochê mikstur z mojego zapasu. Powiedzmy 10 ekstraktów i 5 esencji leczniczych.
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_55_04"); //Oczywiœcie pod warunkiem, ¿e oddasz mi z³oto.

	Log_SetTopicStatus (TOPIC_Udar_Grave, LOG_SUCCESS);
	B_LogEntry (TOPIC_Udar_Grave, "Wszystkie groby z mapy zaliczone. Ciekawe, ile znajdê jeszcze grobów wielkich wojowników.");

	B_GivePlayerXP(500);
	DodajReputacje(5,REP_LOWCY);
	
	Info_ClearChoices (DIA_NASZ_119_Udar_WszystkieGroby);
	Info_AddChoice	  (DIA_NASZ_119_Udar_WszystkieGroby, "Daj mi te mikstury.", DIA_NASZ_119_Udar_WszystkieGroby_potions);
	Info_AddChoice	  (DIA_NASZ_119_Udar_WszystkieGroby, "Zatrzymam jednak to z³oto.", DIA_NASZ_119_Udar_WszystkieGroby_gold);

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

	AI_Output (other,self ,"DIA_NASZ_119_Udar_WszystkieGroby_gold_15_00"); //Zatrzymam jednak to z³oto.
	AI_Output (self, other,"DIA_NASZ_119_Udar_WszystkieGroby_gold_55_01"); //Jasne.

	Info_ClearChoices (DIA_NASZ_119_Udar_WszystkieGroby);

};


func void UdarSay_GreatJob() {
	AI_Output (self, other,"UdarSay_GreatJob_55_01"); //Œwietna robota.
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
	description = "Uœwiêci³em grób Melatonixa.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionMelatonix_15_00"); //Uœwiêci³em grób Melatonixa.
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
	description = "Uœwiêci³em grób Kap³ana Œmiercionoœnych.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionKaplan_15_00"); //Uœwiêci³em grób Kap³ana Œmiercionoœnych.
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
	description = "Uœwiêci³em grób Cassem Da-Na'rema.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionCassem_15_00"); //Uœwiêci³em grób Cassem Da-Na'rema.
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
	description = "Uœwiêci³em grób Muga.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionMugo_15_00"); //Uœwiêci³em grób Muga.
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
	description = "Uœwiêci³em grób Gestatha.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_GraveMissionGestath_15_00"); //Uœwiêci³em grób Gestatha.
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

	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_00"); //Jak to jeszcze nie powrócili?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_01"); //Niech to szlag, je¿eli dopadli ich ci przeklêci orkowie, nasz ca³y plan mo¿e legn¹æ w gruzach. Odmaszeruj ¿o³nierzu, muszê pomyœleæ.
	// TODO: AI_GOTOWP
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_02"); //Willu, przyszed³eœ w naprawdê kiepskim momencie. Jak widzisz, przed chwil¹ dowiedzieliœmy siê, ¿e nasz oddzia³ zwiadowczy, który mia³ sporz¹dziæ plany rozmieszczenia si³ orków, zagin¹³.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_03"); //Nie to jest jednak najgorsze. Przez to ca³e zamieszanie, nie mogê nawet wys³aæ nikogo na poszukiwania. Wszyscy coœ robi¹.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_15_04"); //Ta wojna to jedna wielka farsa...
	
	Log_CreateTopic (TOPIC_Udar_patrol,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_patrol, LOG_RUNNING);

	Info_ClearChoices (DIA_NASZ_119_Udar_PatrolDJGStart);
	Info_AddChoice	  (DIA_NASZ_119_Udar_PatrolDJGStart, "Mogê spróbowaæ ich odszukaæ.", DIA_NASZ_119_Udar_PatrolDJGStart_yep);

};

func void UdarSay_AboutJanQuest() {
	AI_Output (self, other,"UdarSay_AboutJanQuest_55_00"); //A, jeszcze jedno: Jan tak¿e chcia³ siê z tob¹ zobaczyæ. Nie zapomnij do niego zajrzeæ.
	B_LogEntry (TOPIC_Keroloth_Wojna, "No i masz! Nie tylko muszê pomóc Udarowi, ale te¿ Janowi.");
	HeroKnowAboutJanQuest = TRUE;
};

FUNC VOID DIA_NASZ_119_Udar_PatrolDJGStart_yep()
{
	AI_Output (other,self ,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_15_00"); //Mogê spróbowaæ ich odszukaæ.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_01"); //Naprawdê? Zdajesz sobie sprawê z tego, ¿e to bêdzie bardzo ryzykowna misja?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_02"); //Orkowie wêsz¹, chyba coœ przeczuwaj¹. Nawet trudno mi powiedzieæ, czy ci zwiadowcy w ogóle jeszcze ¿yj¹.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_03"); //Pos³uchaj uwa¿nie: Cztery dni temu wys³aliœmy w pobli¿e zamku oddzia³ zwiadowczy, który mia³ przeprowadziæ rozeznanie w si³ach orków i sporz¹dziæ stosowne raporty na ten temat.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_04"); //Lecz od tamtej pory nie mamy z nimi ¿adnego kontaktu. Nie wpada³bym w takie przera¿enie, gdyby nie fakt, ¿e mieli do nas wróciæ po dwóch dniach.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_05"); //Powiedz mi tylko, gdzie mieli siê skryæ, a od razu wyruszê na ich poszukiwania.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_06"); //Z tego co siê orientujê mieli w planach skryæ siê w jaskini, która znajduje siê pod p³askowy¿em, gdzie mo¿na zauwa¿yæ orkowe namioty. To na po³udnie od zamku. Chcieli zabiæ tamtejszych orków i urz¹dziæ tam sobie punkt obserwacyjny.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_07"); //To bêdzie ciê¿ka wyprawa, potrzebujê jakiegoœ wyposa¿enia.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_08"); //Nie mam tego zbyt wiele... Mogê ci daæ trzy eliksiry lecznicze i dwa zwoje z kul¹ ognia.

	Createinvitems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Createinvitems(self,ItSc_InstantFireball,2);
	B_GiveInvItems(self,other,ItSc_InstantFireball,2);
	
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_09"); //Pewnie, wszystko siê przyda.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolDJGStart_yep_55_10"); //W takim razie ruszaj i niech ogieñ Innosa rozgrzewa twe serce w trakcie walki.
	UdarSay_AboutJanQuest();

	B_LogEntry (TOPIC_Udar_patrol,"Mog³em siê tego spodziewaæ, oddzia³ zwiadowczy wys³any w okolice zamku zagin¹³ i na moje barki spad³o odszukanie ich. Najlepiej bêdzie zacz¹æ od jaskini, w której mieli siê schroniæ, czyli pod p³askowy¿em na po³udnie od zamku.");

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
	description = "Przynoszê raport od zwiadowców.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_00"); //Przynoszê raport od zwiadowców.
	B_GiveInvItems(other,self,ItNa_JenkinsRaport,1);
	Npc_RemoveIntItems(self,ItNa_JenkinsRaport,1);
	B_UseFakeScroll();
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_01"); //Trzymaj. Jest tam równie¿ mapa z zasnaczonymi si³ami orków.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolFinish_15_02"); //Doskonale, ale strasznie d³ugo ci to wszystko zajê³o. Co ze zwiadowcami?
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_03"); //Znalaz³em ich, rozbili obóz niedaleko rzeki, gdzie lecz¹ swoje rany. W nocy, po której mieli wróciæ do obozu, zdecydowali siê jeszcze poobserwowaæ orków.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_04"); //W³aœnie wtedy us³yszeli dochodz¹ce stamt¹d krzyki i dziwn¹ inkantacjê, któr¹ uda³o siê przet³umaczyæ Jenkinsowi.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_05"); //Kiedy przeczytaliœmy j¹ na g³os nagle pojawi³y siê szkielety, a gdyby tego by³o ma³o, jeszcze dwa dziwne, nieumar³e cieniostwory, które pilnowa³y tajemniczego maga na prze³êczy.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PatrolFinish_15_06"); //Spotka³em siê z nim, lecz kiedy ju¿ chcia³em go zabiæ ten znikn¹³, mówi¹c, i¿ to jeszcze nie jest czas naszego starcia. Jego poplecznicy zabili Matta i z³o¿yli go w ofierze.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolFinish_15_07"); //Wystarczy! 
	AI_Output (self, other,"DIA_NASZ_119_Udar_PatrolFinish_15_08"); //To brzmi naprawdê Ÿle. I to wszystko akurat teraz, kiedy przygotowujemy siê do szturmu na zamek. Niech to cholera, trzeba szybko przygotowaæ siê do ataku, aby zdobyæ bezpieczne schronienie w tym miejscu.
	
	Log_SetTopicStatus (TOPIC_Udar_patrol, LOG_SUCCESS);
	B_LogEntry (TOPIC_Udar_patrol, "Przynios³em Udarowi raport od zwiadowców i opowiedzia³em mu o sytuacji.");

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
	AI_Output (self, other,"DIA_NASZ_119_Udar_PresjaCzasu_15_00"); //Will, kurcze! Patrzy³eœ w ogóle na tê mapê?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PresjaCzasu_15_01"); //Zebrane wojenne doœwiadczenie od razu podpowiada mi to, czego Jenkins prawdopodobnie siê nie domyœli³.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PresjaCzasu_15_02"); //Co masz na myœli? Chodzi o orków, prawda?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PresjaCzasu_15_03"); //Jenkins rozrysowa³ mi, jak przemieszcza³y siê orkowe grupki zwiadowcze. Z tego wynika, ¿e orkowie zaatakuj¹ wkrótce myœliwych!
	AI_Output (self, other,"DIA_NASZ_119_Udar_PresjaCzasu_15_04"); //Musisz jak najszybciej poinformowaæ ich o tym, aby mogli siê przygotowaæ!
	
	Log_CreateTopic (TOPIC_Udar_presja,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_presja, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_presja, "Udar wywnioskowa³ z mapy i raportów od Jenkinsa, ¿e orkowie zamierzaj¹ zaatakowaæ obóz myœliwych. Muszê co prêdzej ich o tym powiadomiæ!");

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
 	description = "Wszystko ju¿ jest gotowe.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_AllIsReady_55_00"); //Wszystko ju¿ jest gotowe.
	AI_Output (self, other,"DIA_NASZ_119_Udar_AllIsReady_55_01"); //Dobra robota. Mo¿esz wróciæ do Kerolotha i powiedzieæ mu, ¿e wszystko w obozie gra jak nale¿y.
	AI_Output (self, other,"DIA_NASZ_119_Udar_AllIsReady_55_02"); //Dziêki za pomoc, Willu.
	
	B_LogEntry (TOPIC_Keroloth_Wojna, "Obóz ³owców orków jest gotowy. Mogê wróciæ do Kerolotha.");

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

	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_15_00"); //Jesteœ wreszcie! Jakie wieœci przynosisz?		
	AI_Output (other, self,"DIA_NASZ_119_Udar_Kap4Start_55_01"); //Uda³o siê nam odbiæ zamek, a orkowe si³y zosta³y starte z powierzchni ziemi. Teraz pozosta³o nam jedynie zaj¹æ siê umacnianiem naszej pozycji w tym rejonie.
	AI_Output (other, self,"DIA_NASZ_119_Udar_Kap4Start_55_02"); //Niestety, kilku ludzi przyp³aci³o to ¿yciem. W tym Gestath...
	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_55_03"); //To smutna wiadomoœæ. Niech Beliar nie dobierze siê do jego duszy, a Innos wype³ni j¹ œwiat³em.
	AI_Output (other, self,"DIA_NASZ_119_Udar_Kap4Start_55_04"); //Z polecenia Kerolotha powinieneœ odes³aæ do zamku jeszcze kilku wojowników, bo obawia siê o ewentualny atak ze strony orków.
	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_55_05"); //To bardzo prawdopodobne. Znam siê trochê na tych stworzeniach i mogê ci powiedzieæ, ¿e nigdy siê nie poddaj¹.
	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_55_06"); //Mo¿esz mu przekazaæ, ¿e mo¿liwie najszybciej wyœlê do niego kilku ludzi. Chcê, aby dobrze przygotowali siê na to, co mo¿e ich tam zastaæ.
	AI_Output (self, other,"DIA_NASZ_119_Udar_Kap4Start_55_07"); //Jeszcze jedna sprawa: W miêdzyczasie przeteleportowa³ siê tutaj mag. Udaj siê do niego, jest w œrodku.

	Npc_ExchangeRoutine(self,"UdarBoss");
	B_StartOtherRoutine(NASZ_229_Ayan,"Start"); // Ayan przenosi sie do misji z ozywiencem
	
	Log_SetTopicStatus (TOPIC_Keroloth_Wojna, LOG_SUCCESS);
	B_LogEntry (TOPIC_Keroloth_Wojna, "Donios³em Udarowi wieœci z zamku. Tymczasem w obozie pojawi³ siê mag, który chce siê ze mn¹ spotkaæ.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "W obozie ³owców orków pojawi³ siê mag. Byæ mo¿e to znak, ¿e œwiat zewnêtrzny ci¹gle siê nami interesuje?");
	

	B_GivePlayerXP(500);
	B_LogEntry (TOPIC_Sprawy,"Udar bez problemu zgodzi³ siê wys³aæ do zamku kilku ludzi.");

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
	description = "Orkowie otwarli bramê na swoje tereny."; // TODO!
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

	AI_Output (other, self,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_00"); //Orkowie otwarli bramê na swoje tereny.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_01"); //Mówisz powa¿nie? Ta wiadomoœæ nape³ni³a mnie now¹ nadziej¹ na odszukanie patrolu, który zagin¹³ spory kawa³ czasu temu.
	AI_Output (other, self,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_02"); //Ludzie za palisad¹?
	AI_Output (self, other,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_03"); //Paladyni przybyli do Górniczej Doliny na chwilê przed ca³kowitym zabudowaniem palisady. Garond za wszelk¹ cenê chcia³ wiedzieæ, co znajduje siê po drugiej stronie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_04"); //Wys³a³ trzech rycerzy, aby przedarli siê na wybrze¿e i sprawdzili, co dzieje siê w tamtejszych terenach. Niestety, nigdy ju¿ nie wrócili.
	AI_Output (self, other,"DIA_NASZ_119_Udar_PalisadaOtwarta_55_05"); //Jeœli znajdziesz w sobie doœæ si³, aby przekroczyæ progi ziem orków, to mo¿esz ich poszukaæ. ¯ywych lub martwych.

	Log_CreateTopic (TOPIC_Udar_oddzial, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_oddzial, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_oddzial, "Z powodu otwarcia siê orkowej palisady, paladyn Udar ponownie nape³ni³ siê nadziej¹ na odszukanie patrolu, który zagin¹³ za ni¹ ju¿ jakiœ czas temu. Byæ mo¿e natknê siê na grupkê ludzi, eksploruj¹c tamtejsze tereny?");
	
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
	description = "Potrafisz wytwarzaæ kusze?";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_DoCrossBow_15_00"); //Potrafisz wytwarzaæ kusze?
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_01"); //Potrafiê. A czemu pytasz?
	AI_Output (other, self,"DIA_NASZ_119_Udar_DoCrossBow_55_02"); //Jan chce skompletowaæ nowe wyposarzenie wojowników.
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_03"); //I szukasz kogoœ, kto zrobi kuszê?
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_04"); //W porz¹dku, wykonam prototyp. Ale pod jednym warunkiem!
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_05"); //Strzelisz z niej do mnie. Muszê wiedzieæ, ¿e nie jest badziewna.
	AI_Output (other, self,"DIA_NASZ_119_Udar_DoCrossBow_55_06"); //Co?! To najg³upsza rzecz, jak¹ us³sza³em.
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_55_07"); //Umowa stoi, czy nie?

	Info_ClearChoices (DIA_NASZ_119_Udar_DoCrossBow);
	Info_AddChoice	  (DIA_NASZ_119_Udar_DoCrossBow, "Nie ma mowy, nie zrobiê tego.", DIA_NASZ_119_Udar_DoCrossBow_no);
	Info_AddChoice	  (DIA_NASZ_119_Udar_DoCrossBow, "No dobra, strzelê do ciebie.", DIA_NASZ_119_Udar_DoCrossBow_yep);

	B_LogEntry (TOPIC_Jan_lowca, "Udar zrobi dla mnie kuszê, jeœli póŸniej wypróbujê j¹ na nim samym. Dziwne podejœcie...");
};

FUNC VOID DIA_NASZ_119_Udar_DoCrossBow_no()
{

	AI_Output (other,self ,"DIA_NASZ_119_Udar_DoCrossBow_no_15_00"); //Nie ma mowy, nie zrobiê tego.
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_no_55_01"); //W takim razie zapomnij o kuszy.
	WillNieChceStrzelic = TRUE;
		
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_NASZ_119_Udar_DoCrossBow_yep()
{

	AI_Output (other,self ,"DIA_NASZ_119_Udar_DoCrossBow_yep_15_00"); //No dobra, strzelê do ciebie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_DoCrossBow_yep_55_01"); //Œwietnie. Wróæ jutro. Kusza bêdzie gotowa.
	
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
	description = "Niech bêdzie. Strzelê do ciebie.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_IDecidedToShoot_15_00"); //Niech bêdzie. Strzelê do ciebie.
	AI_Output (self, other,"DIA_NASZ_119_Udar_IDecidedToShoot_55_01"); //Cieszê siê, ¿e siê rozumiemy.
	AI_Output (other, self,"DIA_NASZ_119_Udar_IDecidedToShoot_55_02"); //Ale tylko w nogê!
	AI_Output (self, other,"DIA_NASZ_119_Udar_IDecidedToShoot_55_03"); //A strzelaj sobie, gdzie chcesz. Zajmiesz siê tym jutro. Kusza bêdzie gotowa.

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
	AI_Output (self, other,"DIA_NASZ_119_Udar_CrossBowReady_15_00"); //No! Skoro przyszed³eœ, to mo¿emy wypróbowaæ kuszê.
	AI_Output (self, other,"DIA_NASZ_119_Udar_CrossBowReady_55_01"); //Bierz j¹ i strzelaj.
	
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
	AI_Output (self, other,"DIA_NASZ_119_Udar_ThanksToYou_15_00"); //Boli! Wysz³a mi z tego ca³kiem dobra kusza.
	AI_Output (self, other,"DIA_NASZ_119_Udar_ThanksToYou_55_01"); //Mo¿esz j¹ pokazaæ Janowi.
	
	B_LogEntry (TOPIC_Jan_lowca, "Strzeli³em do Udara. Powiedzia³, ¿e kusza jest w porz¹dku i mogê j¹ pokazaæ Janowi.");
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
	description = "Ucz mnie strzelaæ z kuszy.";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_Teach_15_00"); //Ucz mnie strzelaæ z kuszy.

	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);
	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};


func void DIA_NASZ_119_Udar_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 100)
	{
		AI_Output(self,other,"DIA_NASZ_119_Udar_Teach_01_00"); //Nie potrafiê ciê ju¿ niczego nauczyæ. Opanowa³eœ do mistrzostwa sztukê strzelania. Gratulujê.
		
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
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};

func void DIA_NASZ_119_Udar_Teach_1H_5 ()	
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 100);
	
	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);

	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};	

func void DIA_NASZ_119_Udar_Teach_1H_1High ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 100);
	
	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);

	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
	};
};

func void DIA_NASZ_119_Udar_Teach_1H_5High ()	
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 100);
	
	Info_ClearChoices 	(DIA_NASZ_119_Udar_Teach);

	Info_AddChoice 		(DIA_NASZ_119_Udar_Teach,	DIALOG_BACK		,DIA_NASZ_119_Udar_Teach_Back);

	if (other.HitChance[NPC_TALENT_CROSSBOW] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_119_Udar_Teach,"Kusze + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_119_Udar_Teach_1H_5High); };
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
 	description = "Chcê siê szybciej uczyæ. (500 szt. z³ota, 10PN)";
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
	AI_Output (other, self,"DIA_NASZ_119_Udar_SzybkaNauka_15_00"); //Chcê siê szybciej uczyæ.
	
	if (npc_hasitems (other, ItMi_Gold) < 500) {
		AI_Output (self, other,"DIA_NASZ_119_Udar_SzybkaNauka_15_01"); //Nie masz doœæ z³ota.
		}
	else {

		if (hero.lp >= 10){
			AI_Output (self, other,"DIA_NASZ_119_Udar_SzybkaNauka_55_02"); //Staraj siê zapamiêtywaæ ka¿dy ruch. Ka¿de wykonane dzie³o.
			AI_Output (self, other,"DIA_NASZ_119_Udar_SzybkaNauka_15_03"); //Pamiêtaj: Przyswajanie wiedzy zale¿y od twojego umys³u.

			B_GiveInvItems (other, self, ItMi_Gold, 500);			
			SzybkaNaukaTaught = TRUE;
			hero.lp = hero.lp - 10;
			
			PrintScreen ("Nauka: szybka nauka", -1, -1, FONT_Screen, 2);

			Npc_SetTalentSkill 	(hero, NPC_TALENT_D, 1);
			}

		else {
			AI_Output (self, other,"DIA_NASZ_119_Udar_SzybkaNauka_55_04"); //Brak ci doœwiadczenia.
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

var int WillBedzieScigalZebacza;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_205_Mysliwy_EXIT   (C_INFO)
{
	npc         = NASZ_205_Mysliwy;
	nr          = 999;
	condition   = DIA_NASZ_205_Mysliwy_EXIT_Condition;
	information = DIA_NASZ_205_Mysliwy_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_205_Mysliwy_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_205_Mysliwy_EXIT_Info()
{
	if (WillBedzieScigalZebacza == TRUE)
	{
		WartaCz3Atak();
		WillBedzieScigalZebacza = FALSE;
	};

	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_205_Mysliwy_siema   (C_INFO)
{
	npc         = NASZ_205_Mysliwy;
 	nr          = 1;
 	condition   = DIA_NASZ_205_Mysliwy_siema_Condition;
 	information = DIA_NASZ_205_Mysliwy_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_205_Mysliwy_siema_Condition()
{
	if (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_205_Mysliwy_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_siema_55_00"); //Hola, hola!
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_siema_55_01"); //Dok�d tak pr�dko?
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_siema_15_02"); //Chc� rozmawia� z waszym szefem.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_siema_55_03"); //W�a�. Erak powinien by� w namiocie. Niecz�sto si� stamt�d rusza.

	AI_StopProcessInfos (self);	
};

//*********************************************************************
//	         Info Again
//*********************************************************************
INSTANCE DIA_NASZ_205_Mysliwy_again   (C_INFO)
{
	npc         = NASZ_205_Mysliwy;
 	nr          = 2;
 	condition   = DIA_NASZ_205_Mysliwy_again_Condition;
 	information = DIA_NASZ_205_Mysliwy_again_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_205_Mysliwy_again_Condition()	
{
	if (Npc_IsInState (self, ZS_Talk) && (KAPITEL < 3)
		&& npc_knowsinfo (other, DIA_NASZ_205_Mysliwy_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_205_Mysliwy_again_Info()
{
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_again_55_00"); //Nie mam czasu na pogaw�dki.

	AI_StopProcessInfos (self);

};

//*********************************************************************
//	         Info Kap3Intro
//*********************************************************************
INSTANCE DIA_NASZ_205_Mysliwy_Kap3Intro   (C_INFO)
{
	npc         = NASZ_205_Mysliwy;
 	nr          = 3;
 	condition   = DIA_NASZ_205_Mysliwy_Kap3Intro_Condition;
 	information = DIA_NASZ_205_Mysliwy_Kap3Intro_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_205_Mysliwy_Kap3Intro_Condition()	
{
	if (KAPITEL == 3)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_205_Mysliwy_Kap3Intro_Info()
{
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_00"); //W ko�cu kto� ogarni�ty. Dobrze, �e ci� widz�.
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_01"); //O co chodzi?
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_02"); //Mamy BARDZO du�y problem. W okolicy zrobi�o si� jako� bardziej niebezpiecznie.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_03"); //Bez Eraka ci�ko jest nam tu wy�y�. �aden z nas nie dor�wnuje mu zdolno�ciami �uczniczymi.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_04"); //Ka�dej nocy przychodz� tu z�bacze, a my nie jeste�my w stanie si� obroni�. Wy�eraj� nasze zapasy i niszcz� trofea.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_05"); //M�g�by� si� nimi zaj��?

	Npc_ExchangeRoutine (self, "Start");
	MysliwyBiegnie = TRUE;
};

var int ZapasyZwierzynaMisionWaitForAccept;
//*********************************************************************
//	         Info What
//*********************************************************************
INSTANCE DIA_NASZ_205_Mysliwy_what   (C_INFO)
{
	npc         = NASZ_205_Mysliwy;
 	nr          = 4;
 	condition   = DIA_NASZ_205_Mysliwy_what_Condition;
 	information = DIA_NASZ_205_Mysliwy_what_Info;
 	permanent   = FALSE;
 	description = "Co mam zrobi�?";
};

FUNC INT DIA_NASZ_205_Mysliwy_what_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_205_Mysliwy_Kap3Intro))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_205_Mysliwy_what_Info()
{
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_what_55_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_01"); //Staniesz na warcie i odp�dzisz te �achudry.
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_what_55_02"); //Chcia�e� powiedzie�: 'zabijesz'.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_03"); //Tak. Tak, oczywi�cie.

	Log_CreateTopic (TOPIC_Mysliwy_Warta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Mysliwy_Warta, LOG_RUNNING);
	B_LogEntry (TOPIC_Mysliwy_Warta, "Co noc, do obozu wypadowego my�liwych, przychodz� z�bacze. Musz� stan�� na warcie wieczorem i pozabija� wszystkie gady.");

	if(Wld_IsTime(19,00,22,00)){
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_04"); //To co, jeste� gotowy?

		Info_ClearChoices (DIA_NASZ_205_Mysliwy_what);

		Info_AddChoice	  (DIA_NASZ_205_Mysliwy_what, "Stan� w inn� noc.", DIA_NASZ_205_Mysliwy_what_nope);
		Info_AddChoice	  (DIA_NASZ_205_Mysliwy_what, "Tak, mog� zaczyna�.", DIA_NASZ_205_Mysliwy_what_yep);
	}
	
	else {
	
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_05"); //W takim razie zg�o� si� do mnie w godzinach wieczornych.
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_06"); //Byle nie w nocy, bo zwierzyna mo�e ci� uprzedzi�.

		ZapasyZwierzynaMisionWaitForAccept = TRUE;

	};


};

FUNC VOID DIA_NASZ_205_Mysliwy_what_nope()
{

	AI_Output (other,self ,"DIA_NASZ_205_Mysliwy_what_nope_15_00"); //Stan� w inn� noc.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_nope_55_01"); //Jak tam chcesz. Zajrzyj do nas kiedy� w godzinach wieczornych.

	ZapasyZwierzynaMisionWaitForAccept = TRUE;
	Info_ClearChoices (DIA_NASZ_205_Mysliwy_what);
};

FUNC VOID DIA_NASZ_205_Mysliwy_what_yep()
{

	AI_Output (other,self ,"DIA_NASZ_205_Mysliwy_what_yep_15_00"); //Tak, mog� zaczyna�.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_yep_55_01"); //�wietnie! Ja id� do namiotu. Tylko nie przy�nij!

	B_LogEntry (TOPIC_Mysliwy_Warta, "Zaczynam. To b�dzie d�uga noc.");
	WillStajeNaWarcie = TRUE;
	FF_ApplyOnceExt (Warta, 1000, -1);
	ff_applyonce(WartaScaleTime);
	Npc_ExchangeRoutine (self, "Kap3Odpoczynek");

	Info_ClearChoices (DIA_NASZ_205_Mysliwy_what);
};

//*********************************************************************
//	         Info StartMissionThen
//*********************************************************************
INSTANCE DIA_NASZ_205_Mysliwy_StartMissionThen   (C_INFO)
{
	npc         = NASZ_205_Mysliwy;
 	nr          = 5;
 	condition   = DIA_NASZ_205_Mysliwy_StartMissionThen_Condition;
 	information = DIA_NASZ_205_Mysliwy_StartMissionThen_Info;
 	permanent   = FALSE;
 	description = "Jestem gotowy do obj�cia warty.";
};

FUNC INT DIA_NASZ_205_Mysliwy_StartMissionThen_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_205_Mysliwy_what)) && (Wld_IsTime(19,00,22,00)) && (ZapasyZwierzynaMisionWaitForAccept == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_205_Mysliwy_StartMissionThen_Info()
{
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_StartMissionThen_55_00"); //Jestem gotowy do obj�cia warty.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_StartMissionThen_55_01"); //No dobra. Id� do namiotu.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_StartMissionThen_55_02"); //Nie oddalaj si� od tego miejsca i nie przy�nij przypadkiem.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_StartMissionThen_55_03"); //Dobranoc.

	B_LogEntry (TOPIC_Mysliwy_Warta, "Zaczynam. To b�dzie d�uga noc.");
	WillStajeNaWarcie = TRUE;
	FF_ApplyOnceExt (Warta, 1000, -1);
	ff_applyonce(WartaScaleTime);
	Npc_ExchangeRoutine (self, "Kap3Odpoczynek");
};

//*********************************************************************
//	         Info ZabiteDwieGrupy
//*********************************************************************
INSTANCE DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy   (C_INFO)
{
	npc         = NASZ_205_Mysliwy;
 	nr          = 6;
 	condition   = DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_Condition;
 	information = DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_Condition()	
{
	if (WillIsGoingToTalkToMysliwy == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_Info()
{
	B_GivePlayerXP(100);

	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_00"); //Patrz no, jakie cholery. Nawet wyspa� si� nie mog�.
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_01"); //Ju� jest ich troch� mniej. Radz� sobie. Id� spa�.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_02"); //Czekaj! Patrz!
	// TODO: pokazuje r�k�
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_03"); //Tu jest jeszcze jeden. Id� za nim, mo�e doprowadzi ci� do reszty stada.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_04"); //Ja stan� na warcie. No ju�, id�, bo ci ucieknie.

	B_LogEntry (TOPIC_Mysliwy_Warta, "My�liwy dopatrzy� jeszcze jednego z�bacza. Musz� go �ledzi�, mo�e doprowadzi mnie do reszty stada.");
	ff_remove(WartaScaleTime);
	ff_remove(Warta);
	WillStajeNaWarcie = FALSE;
	Npc_ExchangeRoutine (self, "Start");
	WartaCz3Create();
	WillBedzieScigalZebacza = TRUE;
};

//*********************************************************************
//	         Info QuestDone
//*********************************************************************
INSTANCE DIA_NASZ_205_Mysliwy_QuestDone   (C_INFO)
{
	npc         = NASZ_205_Mysliwy;
 	nr          = 7;
 	condition   = DIA_NASZ_205_Mysliwy_QuestDone_Condition;
 	information = DIA_NASZ_205_Mysliwy_QuestDone_Info;
 	permanent   = FALSE;
 	description = "Za�atwi�em przyw�dc� z�baczy.";
};

FUNC INT DIA_NASZ_205_Mysliwy_QuestDone_Condition()	
{
	if (WillZabilPrzywodceStada == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_205_Mysliwy_QuestDone_Info()
{
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_QuestDone_55_00"); //Za�atwi�em przyw�dc� z�baczy.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_QuestDone_55_01"); //Dobra robota. Znalaz�e� co� w gnie�dzie?
	
	if (Npc_HasItems(other, ItNa_JajoZebacza) > 0)
	{
		AI_Output (other, self,"DIA_NASZ_205_Mysliwy_QuestDone_55_02"); //Tak, mam tu jaja z�baczy.
		B_GiveInvItems(other, self, ItNa_JajoZebacza, Npc_HasItems(other, ItNa_JajoZebacza));
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_QuestDone_55_03"); //No, no. Cenne trofeum. Na �niadanie zjemy jajecznic�!
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_QuestDone_55_04"); //Pocz�stuj si� chocia� piwem.
		Createinvitems (self, ItFo_Beer, 1);
		B_GiveInvItems (self, other, ItFo_Beer, 1);
		B_UseItem (other, ItFo_Beer);
		B_GivePlayerXP (700);
	}
	else
	{
		AI_Output (other, self,"DIA_NASZ_205_Mysliwy_QuestDone_55_05"); //Nic ciekawego.
		AI_Output (other, self,"DIA_NASZ_205_Mysliwy_QuestDone_55_06"); //C�, w ko�cu w obozowisku b�dzie spokojniej.
		B_GivePlayerXP (500);
	};

	// TODO: nagroda cos innego niz zloto, np �uk?? selfmade
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_QuestDone_55_07"); //Dzi�ki za pomoc. We� to z�oto. Mi i tak nie jest potrzebne. 
	
	//Createinvitems (self, ItFo_Beer, 1);
	//B_GiveInvItems (self, other, ItFo_Beer, 1);

	Log_SetTopicStatus (TOPIC_Mysliwy_Warta, LOG_SUCCESS);
	B_LogEntry (TOPIC_Mysliwy_Warta, "Teraz ju� �aden z�bacz nie zniszczy zapas�w my�liwych.");

	DodajReputacje (4, REP_MYSLIWI);
};

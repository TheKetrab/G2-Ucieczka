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
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_siema_55_01"); //Dok¹d tak prêdko?
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_siema_15_02"); //Chcê rozmawiaæ z waszym szefem.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_siema_55_03"); //W³aŸ. Erak powinien byæ w namiocie. Nieczêsto siê stamt¹d rusza.

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
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_again_55_00"); //Nie mam czasu na pogawêdki.

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
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_00"); //W koñcu ktoœ ogarniêty. Dobrze, ¿e ciê widzê.
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_01"); //O co chodzi?
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_02"); //Mamy BARDZO du¿y problem. W okolicy zrobi³o siê jakoœ bardziej niebezpiecznie.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_03"); //Bez Eraka ciê¿ko jest nam tu wy¿yæ. ¯aden z nas nie dorównuje mu zdolnoœciami ³uczniczymi.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_04"); //Ka¿dej nocy przychodz¹ tu zêbacze, a my nie jesteœmy w stanie siê obroniæ. Wy¿eraj¹ nasze zapasy i niszcz¹ trofea.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_Kap3Intro_55_05"); //Móg³byœ siê nimi zaj¹æ?

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
 	description = "Co mam zrobiæ?";
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
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_what_55_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_01"); //Staniesz na warcie i odpêdzisz te ³achudry.
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_what_55_02"); //Chcia³eœ powiedzieæ: 'zabijesz'.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_03"); //Tak. Tak, oczywiœcie.

	Log_CreateTopic (TOPIC_Mysliwy_Warta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Mysliwy_Warta, LOG_RUNNING);
	B_LogEntry (TOPIC_Mysliwy_Warta, "Co noc, do obozu wypadowego myœliwych, przychodz¹ zêbacze. Muszê stan¹æ na warcie wieczorem i pozabijaæ wszystkie gady.");

	if(Wld_IsTime(19,00,22,00)){
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_04"); //To co, jesteœ gotowy?

		Info_ClearChoices (DIA_NASZ_205_Mysliwy_what);

		Info_AddChoice	  (DIA_NASZ_205_Mysliwy_what, "Stanê w inn¹ noc.", DIA_NASZ_205_Mysliwy_what_nope);
		Info_AddChoice	  (DIA_NASZ_205_Mysliwy_what, "Tak, mogê zaczynaæ.", DIA_NASZ_205_Mysliwy_what_yep);
	}
	
	else {
	
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_05"); //W takim razie zg³oœ siê do mnie w godzinach wieczornych.
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_55_06"); //Byle nie w nocy, bo zwierzyna mo¿e ciê uprzedziæ.

		ZapasyZwierzynaMisionWaitForAccept = TRUE;

	};


};

FUNC VOID DIA_NASZ_205_Mysliwy_what_nope()
{

	AI_Output (other,self ,"DIA_NASZ_205_Mysliwy_what_nope_15_00"); //Stanê w inn¹ noc.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_nope_55_01"); //Jak tam chcesz. Zajrzyj do nas kiedyœ w godzinach wieczornych.

	ZapasyZwierzynaMisionWaitForAccept = TRUE;
	Info_ClearChoices (DIA_NASZ_205_Mysliwy_what);
};

FUNC VOID DIA_NASZ_205_Mysliwy_what_yep()
{

	AI_Output (other,self ,"DIA_NASZ_205_Mysliwy_what_yep_15_00"); //Tak, mogê zaczynaæ.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_what_yep_55_01"); //Œwietnie! Ja idê do namiotu. Tylko nie przyœnij!

	B_LogEntry (TOPIC_Mysliwy_Warta, "Zaczynam. To bêdzie d³uga noc.");
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
 	description = "Jestem gotowy do objêcia warty.";
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
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_StartMissionThen_55_00"); //Jestem gotowy do objêcia warty.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_StartMissionThen_55_01"); //No dobra. Idê do namiotu.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_StartMissionThen_55_02"); //Nie oddalaj siê od tego miejsca i nie przyœnij przypadkiem.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_StartMissionThen_55_03"); //Dobranoc.

	B_LogEntry (TOPIC_Mysliwy_Warta, "Zaczynam. To bêdzie d³uga noc.");
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

	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_00"); //Patrz no, jakie cholery. Nawet wyspaæ siê nie mogê.
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_01"); //Ju¿ jest ich trochê mniej. Radzê sobie. IdŸ spaæ.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_02"); //Czekaj! Patrz!
	// TODO: pokazuje rêk¹
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_03"); //Tu jest jeszcze jeden. IdŸ za nim, mo¿e doprowadzi ciê do reszty stada.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_ZabiteDwieGrupy_55_04"); //Ja stanê na warcie. No ju¿, idŸ, bo ci ucieknie.

	B_LogEntry (TOPIC_Mysliwy_Warta, "Myœliwy dopatrzy³ jeszcze jednego zêbacza. Muszê go œledziæ, mo¿e doprowadzi mnie do reszty stada.");
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
 	description = "Za³atwi³em przywódcê zêbaczy.";
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
	AI_Output (other, self,"DIA_NASZ_205_Mysliwy_QuestDone_55_00"); //Za³atwi³em przywódcê zêbaczy.
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_QuestDone_55_01"); //Dobra robota. Znalaz³eœ coœ w gnieŸdzie?
	
	if (Npc_HasItems(other, ItNa_JajoZebacza) > 0)
	{
		AI_Output (other, self,"DIA_NASZ_205_Mysliwy_QuestDone_55_02"); //Tak, mam tu jaja zêbaczy.
		B_GiveInvItems(other, self, ItNa_JajoZebacza, Npc_HasItems(other, ItNa_JajoZebacza));
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_QuestDone_55_03"); //No, no. Cenne trofeum. Na œniadanie zjemy jajecznicê!
		AI_Output (self, other,"DIA_NASZ_205_Mysliwy_QuestDone_55_04"); //Poczêstuj siê chocia¿ piwem.
		Createinvitems (self, ItFo_Beer, 1);
		B_GiveInvItems (self, other, ItFo_Beer, 1);
		B_UseItem (other, ItFo_Beer);
		B_GivePlayerXP (700);
	}
	else
	{
		AI_Output (other, self,"DIA_NASZ_205_Mysliwy_QuestDone_55_05"); //Nic ciekawego.
		AI_Output (other, self,"DIA_NASZ_205_Mysliwy_QuestDone_55_06"); //Có¿, w koñcu w obozowisku bêdzie spokojniej.
		B_GivePlayerXP (500);
	};

	// TODO: nagroda cos innego niz zloto, np ³uk?? selfmade
	AI_Output (self, other,"DIA_NASZ_205_Mysliwy_QuestDone_55_07"); //Dziêki za pomoc. WeŸ to z³oto. Mi i tak nie jest potrzebne. 
	
	//Createinvitems (self, ItFo_Beer, 1);
	//B_GiveInvItems (self, other, ItFo_Beer, 1);

	Log_SetTopicStatus (TOPIC_Mysliwy_Warta, LOG_SUCCESS);
	B_LogEntry (TOPIC_Mysliwy_Warta, "Teraz ju¿ ¿aden zêbacz nie zniszczy zapasów myœliwych.");

	DodajReputacje (4, REP_MYSLIWI);
};

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_126_Robotnik_EXIT   (C_INFO)
{
	npc         = NASZ_126_Robotnik;
	nr          = 999;
	condition   = DIA_NASZ_126_Robotnik_EXIT_Condition;
	information = DIA_NASZ_126_Robotnik_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_126_Robotnik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_126_Robotnik_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_126_Robotnik_siema   (C_INFO)
{
	npc         = NASZ_126_Robotnik;
 	nr          = 1;
 	condition   = DIA_NASZ_126_Robotnik_siema_Condition;
 	information = DIA_NASZ_126_Robotnik_siema_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_126_Robotnik_siema_Condition()
{
	if Npc_IsInState (self, ZS_Talk) && (KAPITEL == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_126_Robotnik_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_siema_15_00"); //Nie przeszkadzaj mi!
	AI_StopProcessInfos (self);
};


var int RobotnikDay;
//*********************************************************************
//	Info Work
//*********************************************************************
INSTANCE DIA_NASZ_126_Robotnik_work   (C_INFO)
{
	npc         = NASZ_126_Robotnik;
 	nr          = 2;
 	condition   = DIA_NASZ_126_Robotnik_work_Condition;
 	information = DIA_NASZ_126_Robotnik_work_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_126_Robotnik_work_Condition()
{
	if (Kapitel>=2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_126_Robotnik_work_Info()
{
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_00"); //Ej, to ty jesteœ tym, który wszystkim pomaga.
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_work_55_01"); //Mo¿liwe.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_02"); //S³uchaj, mam pewien problem.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_03"); //Bo widzisz... Budynek, w którym przebywa Keroloth strasznie skrzypi. Pod³oga jest podtrzymywana przez kilka drewnianych filarów.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_04"); //Obawiam siê, ¿e konstrukcja lada moment siê za³amie.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_05"); //Jeœli w ci¹gu dwóch dni ktoœ tego nie naprawi, to Keroloth urwie mi jaja i powiesi je sobie na szyi.
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_work_55_06"); //Czemu sam siê tym nie zajmiesz?
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_07"); //Po pierwsze: Zgubi³em paczkê gwoŸdzi.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_08"); //Po drugie: Wejœcie pod owy budynek jest od zewn¹trz, a tam czyhaj¹ bestie.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_09"); //Móg³byœ mi pomóc?

	Wld_InsertNpc	(DragonSnapper,"FP_ROAM_NASZ_LOWCY_SMOCZYZEBACZ");
	MIS_ROBOTNIK_READY = TRUE;
	
	Log_CreateTopic (TOPIC_Robotnik_deski, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Robotnik_deski, LOG_RUNNING);
	B_LogEntry (TOPIC_Robotnik_deski, "W ci¹gu dwóch dni muszê naprawiæ filary budynku, w którym przebywa Keroloth. Wejœcie znajduje siê poza obozem. Aby naprawiæ filary, muszê u¿yæ gwoŸdzi, które robotnik niestety zgubi³.");

	Deski_Mission = 1;
};

//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_126_Robotnik_Gwozdzie   (C_INFO)
{
	npc         = NASZ_126_Robotnik;
 	nr          = 3;
 	condition   = DIA_NASZ_126_Robotnik_Gwozdzie_Condition;
 	information = DIA_NASZ_126_Robotnik_Gwozdzie_Info;
 	permanent   = FALSE;
 	description = "Co z tymi gwoŸdziami?";
};

FUNC INT DIA_NASZ_126_Robotnik_Gwozdzie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_Work)) && (MIS_ROBOTNIK_READY == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_126_Robotnik_Gwozdzie_Info()
{
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_Gwozdzie_15_00"); //Co z tymi gwoŸdziami?
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_Gwozdzie_55_01"); //Có¿...
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_Gwozdzie_15_02"); //Kilka dni temu schla³em siê w karczmie Silasa do nieprzytomnoœci. Cholera wie, co sta³o siê tamtej nocy...
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_Gwozdzie_15_03"); //Rano, gdy doszed³em ju¿ do siebie, zorientowa³em siê, ¿e nie mam tych cholernych gwoŸdzi. Poszed³em ich poszukaæ, ale nie znalaz³em niczego. Pewnie zosta³y gdzieœ w budynku i ktoœ je zabra³.

	B_LogEntry (TOPIC_Robotnik_deski, "Robotnik schla³ siê w karczmie. Wtedy ostatni raz widzia³ paczkê gwoŸdzi.");

	RobotnikDay = Wld_GetDay ();
};

//*********************************************************************
//	Info Klucz
//*********************************************************************
INSTANCE DIA_NASZ_126_Robotnik_Klucz   (C_INFO)
{
	npc         = NASZ_126_Robotnik;
 	nr          = 3;
 	condition   = DIA_NASZ_126_Robotnik_Klucz_Condition;
 	information = DIA_NASZ_126_Robotnik_Klucz_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_126_Robotnik_Klucz_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_Gwozdzie)) && (MIS_ROBOTNIK_READY == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_126_Robotnik_Klucz_Info()
{
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_Klucz_15_00"); //By³bym zapomnia³! WeŸ ten klucz. Dziêki niemu wejdziesz do piwnicy.

	Createinvitems (self, ItNa_Key_Robotnik, 1);
	B_giveinvitems (self, other, ItNa_Key_Robotnik, 1);
	
};

//*********************************************************************
//	Info OnceMoreForget
//*********************************************************************
INSTANCE DIA_NASZ_126_Robotnik_OnceMoreForget   (C_INFO)
{
	npc         = NASZ_126_Robotnik;
 	nr          = 4;
 	condition   = DIA_NASZ_126_Robotnik_OnceMoreForget_Condition;
 	information = DIA_NASZ_126_Robotnik_OnceMoreForget_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_126_Robotnik_OnceMoreForget_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_Klucz))
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_126_Robotnik_OnceMoreForget_Info()
{
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_OnceMoreForget_15_00"); //Czekaj! Zapomnia³em jeszcze o jednej rzeczy.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_OnceMoreForget_15_01"); //Prowadz¹c w okolicy wykopaliska pod fundamenty na budynki, znalaz³em kilka starych monet. Bardzo mnie zainteresowa³y!
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_OnceMoreForget_15_02"); //Gdyby ci siê uda³o takie znaleŸæ, przynieœ mi je. Zap³acê ci za ka¿d¹ jedn¹ sztukê z³ota.
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_OnceMoreForget_15_03"); //Tak zrobiê.
	
	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Mogê wymieniaæ stare monety na z³oto u robotnika.");

};

///////////////////////////////////////////////////////////////////////
//	Info BringOldCoin
///////////////////////////////////////////////////////////////////////

instance DIA_NASZ_126_Robotnik_BringOldCoin		(C_INFO)
{
	npc		 = 	NASZ_126_Robotnik;
	nr		 = 	5;
	condition	 = 	DIA_NASZ_126_Robotnik_BringOldCoin_Condition;
	information	 = 	DIA_NASZ_126_Robotnik_BringOldCoin_Info;
	permanent	 = 	TRUE;
	description	 = 	"Interesuj¹ ciê jeszcze stare monety?";
};

func int DIA_NASZ_126_Robotnik_BringOldCoin_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_OnceMoreForget))
		&& (Npc_HasItems(other, ItMi_OldCoin) > 0)
	{
		return TRUE;
	};
};

var int OldCoinCounter;

func void DIA_NASZ_126_Robotnik_BringOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_126_Robotnik_BringOldCoin_15_00"); //Interesuj¹ ciê jeszcze stare monety?
	AI_Output			(self, other, "DIA_NASZ_126_Robotnik_BringOldCoin_01_01"); //Jasne. Masz jakieœ?

	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;

	OldCoinCount = Npc_HasItems(other, ItMi_OldCoin);


		if (OldCoinCount == 1)
			{
				AI_Output		(other, self, "DIA_NASZ_126_Robotnik_BringOldCoin_15_02"); //Jedn¹.
				B_GivePlayerXP (5);
				B_GiveInvItems (other, self, ItMi_OldCoin,1);
				OldCoinCounter = OldCoinCounter + 1;
			}
		else
			{
				AI_Output		(other, self, "DIA_NASZ_126_Robotnik_BringOldCoin_15_03"); //Kilka.
	
				B_GiveInvItems (other, self, ItMi_OldCoin,  OldCoinCount);
	
				XP_BringOldCoins = (OldCoinCount * 5);
				OldCoinCounter = (OldCoinCounter + OldCoinCount); 
	
				B_GivePlayerXP (XP_BringOldCoins);
			};

	AI_Output			(self, other, "DIA_NASZ_126_Robotnik_BringOldCoin_01_04"); //Dziêki. Oto twoje pieni¹dze. Przynieœ mi wszystkie, które znajdziesz.

	OldCoinGeld	= (OldCoinCount * 1);

	CreateInvItems (self, ItMi_Gold, OldCoinGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OldCoinGeld);
	Npc_RemoveInvItems (self,ItMi_OldCoin,OldCoinCount);
};


//*********************************************************************
//	Info WorkDone
//*********************************************************************
INSTANCE DIA_NASZ_126_Robotnik_WorkDone   (C_INFO)
{
	npc         = NASZ_126_Robotnik;
 	nr          = 5;
 	condition   = DIA_NASZ_126_Robotnik_WorkDone_Condition;
 	information = DIA_NASZ_126_Robotnik_WorkDone_Info;
 	permanent   = FALSE;
 	description = "Naprawi³em.";
};

FUNC INT DIA_NASZ_126_Robotnik_WorkDone_Condition()
{
	if (Deski_Mission >= 4) && (MIS_ROBOTNIK_READY == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_126_Robotnik_WorkDone_Info()
{
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_WorkDone_15_00"); //Naprawi³em.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkDone_55_01"); //I jak? Bardzo Ÿle to wygl¹da³o?
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_WorkDone_15_02"); //Myœlê, ¿e niewiele brakowa³o do konsekwencji ze strony Kerolotha, o których wspomina³eœ.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkDone_55_03"); //Dziêkujê. Ratujesz mi ¿ycie. Naprawdê, nie chcê mieæ na pieñku z Kerolothem. To ju¿ nie ten sam rycerz, co niegdyœ na zamku. Pobyt w Górniczej Dolinie zmieni³ go nie do poznania.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkDone_55_04"); //WeŸ to. Grog to najlepszy trunek na œwiecie!

	Createinvitems (self, ItFo_Addon_Grog, 10);
	B_giveinvitems (self, other, ItFo_Addon_Grog, 10);
	
	MIS_ROBOTNIK_READY = FALSE;
	DodajReputacje (4, REP_LOWCY);
	B_GivePlayerXP (500);
	Log_SetTopicStatus (TOPIC_Robotnik_deski, LOG_SUCCESS);
	B_LogEntry (TOPIC_Robotnik_deski, "W wyznaczonym czasie wzmocni³em podpory.");

};

//*********************************************************************
//	Info WorkFail
//*********************************************************************
INSTANCE DIA_NASZ_126_Robotnik_WorkFail   (C_INFO)
{
	npc         = NASZ_126_Robotnik;
 	nr          = 6;
 	condition   = DIA_NASZ_126_Robotnik_WorkFail_Condition;
 	information = DIA_NASZ_126_Robotnik_WorkFail_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_126_Robotnik_WorkFail_Condition()
{
	if TimeIsUp(3,-1,RobotnikDay,-1) && (MIS_ROBOTNIK_READY == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_126_Robotnik_WorkFail_Info()
{
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkFail_15_00"); //Gdybym nie polega³ na tobie, to lepiej bym na tym wyszed³!
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkFail_55_01"); //Keroloth tak siê zdenerwowa³, ¿e sam poszed³ do piwnicy i naprawi³ te deski.
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_WorkFail_15_02"); //Nie mogê pomagaæ wszystkim. Po prostu zabrak³o mi czasu.

	MIS_ROBOTNIK_READY = FALSE;
	Log_SetTopicStatus (TOPIC_Robotnik_deski, LOG_FAILED);
	B_LogEntry (TOPIC_Robotnik_deski, "Nie zd¹¿y³em siê tym zaj¹æ i sam Keroloth wzi¹³ m³otek i poszed³ przybijaæ gwoŸdzie.");

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_126_Robotnik_PICKPOCKET (C_INFO)
{
	npc			= NASZ_126_Robotnik;
	nr			= 900;
	condition	= DIA_NASZ_126_Robotnik_PICKPOCKET_Condition;
	information	= DIA_NASZ_126_Robotnik_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_126_Robotnik_PICKPOCKET_Condition()
{
	C_Beklauen (36);
};
 
FUNC VOID DIA_NASZ_126_Robotnik_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_126_Robotnik_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_126_Robotnik_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_126_Robotnik_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_126_Robotnik_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_126_Robotnik_PICKPOCKET_DoIt);
};

func void DIA_NASZ_126_Robotnik_PICKPOCKET_DoIt()
{
	B_BeklauenGold(56);
	
	Info_ClearChoices (DIA_NASZ_126_Robotnik_PICKPOCKET);
};
	
func void DIA_NASZ_126_Robotnik_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_126_Robotnik_PICKPOCKET);
};
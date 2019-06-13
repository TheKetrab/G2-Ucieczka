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
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_00"); //Ej, to ty jeste� tym, kt�ry wszystkim pomaga.
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_work_55_01"); //Mo�liwe.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_02"); //S�uchaj, mam pewien problem.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_03"); //Bo widzisz... Budynek, w kt�rym przebywa Keroloth strasznie skrzypi. Pod�oga jest podtrzymywana przez kilka drewnianych filar�w.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_04"); //Obawiam si�, �e konstrukcja lada moment si� za�amie.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_05"); //Je�li w ci�gu dw�ch dni kto� tego nie naprawi, to Keroloth urwie mi jaja i powiesi je sobie na szyi.
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_work_55_06"); //Czemu sam si� tym nie zajmiesz?
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_07"); //Po pierwsze: Zgubi�em paczk� gwo�dzi.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_08"); //Po drugie: Wej�cie pod owy budynek jest od zewn�trz, a tam czyhaj� bestie.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_work_15_09"); //M�g�by� mi pom�c?

	Wld_InsertNpc	(DragonSnapper,"FP_ROAM_NASZ_LOWCY_SMOCZYZEBACZ");
	MIS_ROBOTNIK_READY = TRUE;
	
	Log_CreateTopic (TOPIC_Robotnik_deski, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Robotnik_deski, LOG_RUNNING);
	B_LogEntry (TOPIC_Robotnik_deski, "W ci�gu dw�ch dni musz� naprawi� filary budynku, w kt�rym przebywa Keroloth. Wej�cie znajduje si� poza obozem. Aby naprawi� filary, musz� u�y� gwo�dzi, kt�re robotnik niestety zgubi�.");

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
 	description = "Co z tymi gwo�dziami?";
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
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_Gwozdzie_15_00"); //Co z tymi gwo�dziami?
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_Gwozdzie_55_01"); //C�...
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_Gwozdzie_15_02"); //Kilka dni temu schla�em si� w karczmie Silasa do nieprzytomno�ci. Cholera wie, co sta�o si� tamtej nocy...
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_Gwozdzie_15_03"); //Rano, gdy doszed�em ju� do siebie, zorientowa�em si�, �e nie mam tych cholernych gwo�dzi. Poszed�em ich poszuka�, ale nie znalaz�em niczego. Pewnie zosta�y gdzie� w budynku i kto� je zabra�.

	B_LogEntry (TOPIC_Robotnik_deski, "Robotnik schla� si� w karczmie. Wtedy ostatni raz widzia� paczk� gwo�dzi.");

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
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_Klucz_15_00"); //By�bym zapomnia�! We� ten klucz. Dzi�ki niemu wejdziesz do piwnicy.

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
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_OnceMoreForget_15_00"); //Czekaj! Zapomnia�em jeszcze o jednej rzeczy.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_OnceMoreForget_15_01"); //Prowadz�c w okolicy wykopaliska pod fundamenty na budynki, znalaz�em kilka starych monet. Bardzo mnie zainteresowa�y!
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_OnceMoreForget_15_02"); //Gdyby ci si� uda�o takie znale��, przynie� mi je. Zap�ac� ci za ka�d� jedn� sztuk� z�ota.
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_OnceMoreForget_15_03"); //Tak zrobi�.
	
	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Mog� wymienia� stare monety na z�oto u robotnika.");

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
	description	 = 	"Interesuj� ci� jeszcze stare monety?";
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
	AI_Output			(other, self, "DIA_NASZ_126_Robotnik_BringOldCoin_15_00"); //Interesuj� ci� jeszcze stare monety?
	AI_Output			(self, other, "DIA_NASZ_126_Robotnik_BringOldCoin_01_01"); //Jasne. Masz jakie�?

	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;

	OldCoinCount = Npc_HasItems(other, ItMi_OldCoin);


		if (OldCoinCount == 1)
			{
				AI_Output		(other, self, "DIA_NASZ_126_Robotnik_BringOldCoin_15_02"); //Jedn�.
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

	AI_Output			(self, other, "DIA_NASZ_126_Robotnik_BringOldCoin_01_04"); //Dzi�ki. Oto twoje pieni�dze. Przynie� mi wszystkie, kt�re znajdziesz.

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
 	description = "Naprawi�em.";
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
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_WorkDone_15_00"); //Naprawi�em.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkDone_55_01"); //I jak? Bardzo �le to wygl�da�o?
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_WorkDone_15_02"); //My�l�, �e niewiele brakowa�o do konsekwencji ze strony Kerolotha, o kt�rych wspomina�e�.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkDone_55_03"); //Dzi�kuj�. Ratujesz mi �ycie. Naprawd�, nie chc� mie� na pie�ku z Kerolothem. To ju� nie ten sam rycerz, co niegdy� na zamku. Pobyt w G�rniczej Dolinie zmieni� go nie do poznania.
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkDone_55_04"); //We� to. Grog to najlepszy trunek na �wiecie!

	Createinvitems (self, ItFo_Addon_Grog, 10);
	B_giveinvitems (self, other, ItFo_Addon_Grog, 10);
	
	MIS_ROBOTNIK_READY = FALSE;
	DodajReputacje (4, REP_LOWCY);
	B_GivePlayerXP (500);
	Log_SetTopicStatus (TOPIC_Robotnik_deski, LOG_SUCCESS);
	B_LogEntry (TOPIC_Robotnik_deski, "W wyznaczonym czasie wzmocni�em podpory.");

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
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkFail_15_00"); //Gdybym nie polega� na tobie, to lepiej bym na tym wyszed�!
	AI_Output (self, other,"DIA_NASZ_126_Robotnik_WorkFail_55_01"); //Keroloth tak si� zdenerwowa�, �e sam poszed� do piwnicy i naprawi� te deski.
	AI_Output (other, self,"DIA_NASZ_126_Robotnik_WorkFail_15_02"); //Nie mog� pomaga� wszystkim. Po prostu zabrak�o mi czasu.

	MIS_ROBOTNIK_READY = FALSE;
	Log_SetTopicStatus (TOPIC_Robotnik_deski, LOG_FAILED);
	B_LogEntry (TOPIC_Robotnik_deski, "Nie zd��y�em si� tym zaj�� i sam Keroloth wzi�� m�otek i poszed� przybija� gwo�dzie.");

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
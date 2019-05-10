var int bandzior_fight;
var int bandzior_koniec_zagadywania;
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_315_Bandzior_EXIT   (C_INFO)
{
	npc         = NASZ_315_Bandzior;
	nr          = 999;
	condition   = DIA_NASZ_315_Bandzior_EXIT_Condition;
	information = DIA_NASZ_315_Bandzior_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_315_Bandzior_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_315_Bandzior_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_315_Bandzior_Obcy		(C_INFO)
{
	npc		 = 	NASZ_315_Bandzior;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_315_Bandzior_Obcy_Condition;
	information	 = 	DIA_NASZ_315_Bandzior_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_315_Bandzior_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_315_Bandzior_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_315_Bandzior_hello		(C_INFO)
{
	npc		 = 	NASZ_315_Bandzior;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_315_Bandzior_hello_Condition;
	information	 = 	DIA_NASZ_315_Bandzior_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};

func int DIA_NASZ_315_Bandzior_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& !npc_knowsinfo (other, DIA_NASZ_306_Perrot_done)
		&& (bandzior_koniec_zagadywania == FALSE))
	{
		return TRUE;
	};
};
func void DIA_NASZ_315_Bandzior_hello_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_hello_03_00"); //Jak czego� chcesz, to zwr�� si� do Carry'ego.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Again
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_315_Bandzior_again		(C_INFO)
{
	npc		 	 = 	NASZ_315_Bandzior;
	nr		 	 = 	2;
	condition	 = 	DIA_NASZ_315_Bandzior_again_Condition;
	information	 = 	DIA_NASZ_315_Bandzior_again_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_NASZ_315_Bandzior_again_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& npc_knowsinfo (other, DIA_NASZ_315_Bandzior_hello)
		&& !npc_knowsinfo (other, DIA_NASZ_306_Perrot_done)
		&& (bandzior_koniec_zagadywania == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NASZ_315_Bandzior_again_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_again_03_00"); //Daj�e mi �wi�ty spok�j.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info KoniecZagadywania
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_315_Bandzior_KoniecZagadywania		(C_INFO)
{
	npc		 	 = 	NASZ_315_Bandzior;
	nr		 	 = 	3;
	condition	 = 	DIA_NASZ_315_Bandzior_KoniecZagadywania_Condition;
	information	 = 	DIA_NASZ_315_Bandzior_KoniecZagadywania_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_NASZ_315_Bandzior_KoniecZagadywania_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& npc_knowsinfo (other, DIA_NASZ_315_Bandzior_hello)
		&& !npc_knowsinfo (other, DIA_NASZ_306_Perrot_done)
		&& (bandzior_koniec_zagadywania == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NASZ_315_Bandzior_KoniecZagadywania_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_KoniecZagadywania_03_00"); //Co znowu?

};


///////////////////////////////////////////////////////////////////////
//	Info Talk
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_315_Bandzior_talk		(C_INFO)
{
	npc			 = 	NASZ_315_Bandzior;
	nr			 = 	4;
	condition	 = 	DIA_NASZ_315_Bandzior_talk_Condition;
	information	 = 	DIA_NASZ_315_Bandzior_talk_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_315_Bandzior_talk_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& npc_knowsinfo (other, DIA_NASZ_306_Perrot_done))
	{
		return TRUE;
	};
};

func void DIA_NASZ_315_Bandzior_talk_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_315_Bandzior_talk_55_00"); //Donks!
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_talk_03_01"); //Tak?

	bandzior_koniec_zagadywania = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Glowa
///////////////////////////////////////////////////////////////////////
var int WillIsGoingToKillVanGan;
instance DIA_NASZ_315_Bandzior_glowa		(C_INFO)
{
	npc			 = 	NASZ_315_Bandzior;
	nr			 = 	5;
	condition	 = 	DIA_NASZ_315_Bandzior_glowa_Condition;
	information	 = 	DIA_NASZ_315_Bandzior_glowa_Info;
	permanent	 = 	FALSE;
	description	 =	"Van-Gan pragnie twojej g�owy.";
};

func int DIA_NASZ_315_Bandzior_glowa_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_315_Bandzior_talk))

	{
		return TRUE;
	};
};

func void DIA_NASZ_315_Bandzior_glowa_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_315_Bandzior_glowa_55_00"); //Van-Gan pragnie twojej g�owy.
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_glowa_03_01"); //Naprawd�? Wiesz co ci powiem?
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_glowa_03_02"); //Ja te� pragn� JEGO g�owy!
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_glowa_03_03"); //Masz mo�e ochot� na ma�y uk�adzik? Chyba mi nie powiesz, �e ork jest wa�niejszy od cz�owieka!
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_glowa_03_04"); //Dam ci 300 sztuk z�ota, za JEGO g�ow�. Co ty na to?

	Info_ClearChoices (DIA_NASZ_315_Bandzior_glowa);
		Info_AddChoice	  (DIA_NASZ_315_Bandzior_glowa, "Chc� wi�cej.", DIA_NASZ_315_Bandzior_glowa_more);
		Info_AddChoice	  (DIA_NASZ_315_Bandzior_glowa, "Zgoda, zg�adz� Van-Gana.", DIA_NASZ_315_Bandzior_glowa_ok);
		Info_AddChoice	  (DIA_NASZ_315_Bandzior_glowa, "Nie, to twoj� g�ow� zobaczy ork.", DIA_NASZ_315_Bandzior_glowa_fu);

};

FUNC VOID DIA_NASZ_315_Bandzior_glowa_more()
{
	AI_Output (other,self ,"DIA_NASZ_315_Bandzior_glowa_more_15_00"); //Chc� wi�cej.
	AI_Output (self, other,"DIA_NASZ_315_Bandzior_glowa_more_55_01"); //Nie ma takiej mo�liwo�ci. 300 albo spadaj.	
};

FUNC VOID DIA_NASZ_315_Bandzior_glowa_ok()
{
	AI_Output (other,self ,"DIA_NASZ_315_Bandzior_glowa_ok_15_00"); //Zgoda, zg�adz� Van-Gana.
	AI_Output (self, other,"DIA_NASZ_315_Bandzior_glowa_ok_55_01"); //�wietnie! Czekam na dobre informacje.

	Log_CreateTopic (TOPIC_Donks_ork, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Donks_ork, LOG_RUNNING);
	B_LogEntry (TOPIC_Donks_ork, "Zdecydowa�em si� zabi� Van-Gana. Donks b�dzie zadowolony.");
	
	WillIsGoingToKillVanGan = TRUE;

	Info_ClearChoices (DIA_NASZ_315_Bandzior_glowa);
};

FUNC VOID DIA_NASZ_315_Bandzior_glowa_fu()
{

	AI_Output (other,self ,"DIA_NASZ_315_Bandzior_glowa_fu_15_00"); //Nie, to twoj� g�ow� zobaczy ork.
	AI_Output (self, other,"DIA_NASZ_315_Bandzior_glowa_fu_55_01"); //Jeste� pewien? Wydaje mi si�, �e twoj�.
	AI_Output (self, other,"DIA_NASZ_315_Bandzior_glowa_fu_55_02"); //Na �mier� i �ycie walczmy jak nale�y, z dala od innych. Chod� za mn�.

	BANDZIOR_FIGHT = 1;
	Npc_ExchangeRoutine (NASZ_315_Bandzior, "Fight");
	AI_StopProcessInfos (self);

};

///////////////////////////////////////////////////////////////////////
//	Info KillX
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_315_Bandzior_killx		(C_INFO)
{
	npc			 = 	NASZ_315_Bandzior;
	nr			 = 	6;
	condition	 = 	DIA_NASZ_315_Bandzior_killx_Condition;
	information	 = 	DIA_NASZ_315_Bandzior_killx_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_315_Bandzior_killx_Condition ()
{
	if (BANDZIOR_FIGHT == 1
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_3_STONES"))

	{
		return TRUE;
	};
};

func void DIA_NASZ_315_Bandzior_killx_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_killx_03_00"); //Widzisz te trupy? Zaraz do nich do��czysz. Przygotuj si� na ostatni� walk� w �yciu.

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info VanGanDead
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_315_Bandzior_VanGanDead		(C_INFO)
{
	npc			 = 	NASZ_315_Bandzior;
	nr		 	 = 	7;
	condition	 = 	DIA_NASZ_315_Bandzior_VanGanDead_Condition;
	information	 = 	DIA_NASZ_315_Bandzior_VanGanDead_Info;
	permanent	 = 	FALSE;
	description	 =	"Van-Gan gryzie ziemi�.";
};

func int DIA_NASZ_315_Bandzior_VanGanDead_Condition ()
{
	if ((WillIsGoingToKillVanGan == TRUE)
		&& npc_isdead (NASZ_405_VanGan))

	{
		return TRUE;
	};
};

func void DIA_NASZ_315_Bandzior_VanGanDead_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_315_Bandzior_VanGanDead_03_00"); //Van-Gan  gryzie ziemi�.
	AI_Output			(self, other, "DIA_NASZ_315_Bandzior_VanGanDead_03_01"); //Doskonale! Zgodnie z umow�. Trzymaj.
	
	Createinvitems (self, itmi_gold, 300);
	B_giveinvitems (self, other, itmi_gold, 300);

	B_GivePlayerXP(400);
	
	Log_SetTopicStatus (TOPIC_Donks_ork, LOG_SUCCESS);
	B_LogEntry (TOPIC_Donks_ork, "Ork gryzie ziemi�, a ja zarobi�em. Czego chcie� wi�cej?");
	DodajReputacje (5, REP_BANDYCI);
};

var int WCHODZENIE_GOBBY;

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_318_Gobby_EXIT   (C_INFO)
{
	npc         = NASZ_318_Gobby;
	nr          = 999;
	condition   = DIA_NASZ_318_Gobby_EXIT_Condition;
	information = DIA_NASZ_318_Gobby_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_318_Gobby_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_318_Gobby_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_318_Gobby_Obcy		(C_INFO)
{
	npc		 = 	NASZ_318_Gobby;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_318_Gobby_Obcy_Condition;
	information	 = 	DIA_NASZ_318_Gobby_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_318_Gobby_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_318_Gobby_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_318_Gobby_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_318_Gobby_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_318_Gobby_siema   (C_INFO)
{
	npc         = NASZ_318_Gobby;
 	nr          = 1;
 	condition   = DIA_NASZ_318_Gobby_siema_Condition;
 	information = DIA_NASZ_318_Gobby_siema_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_318_Gobby_siema_Condition()
{
	if (! WCHODZENIE_GOBBY)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_318_Gobby_siema_Info()
{
	if (npc_hasitems (other, ItNa_Niewolnicy) >=1) {
		AI_Output (self, other,"DIA_NASZ_318_Gobby_siema_15_00"); //Czego tu chcesz?
		AI_Output (other, self,"DIA_NASZ_318_Gobby_siema_55_01"); //Jestem tu z polecenia Fruta.
		AI_Output (other, self,"DIA_NASZ_318_Gobby_siema_55_02"); //Mia�em ci wr�czy� ten papier.
		B_giveinvitems (other, self, ItNa_Niewolnicy, 1);
		B_UseFakeScroll();
		AI_Output (self, other,"DIA_NASZ_318_Gobby_siema_15_03"); //Hmm... No dobra, czego chcesz?

		WCHODZENIE_GOBBY=1;
	}
	
	else {	
		AI_Output (self, other,"DIA_NASZ_318_Gobby_siema_15_04"); //Nie powiniene� tu przychodzi�!

		AI_StopProcessInfos (self);
		
		self.flags = 2;

		B_Attack (self, other, AR_KILL, 1);
		B_Attack (NASZ_317_Bandzior, other, AR_KILL, 1);

	};		
};

//*********************************************************************
//	Info Daj
//*********************************************************************
INSTANCE DIA_NASZ_318_Gobby_daj   (C_INFO)
{
	npc         = NASZ_318_Gobby;
 	nr          = 2;
 	condition   = DIA_NASZ_318_Gobby_daj_Condition;
 	information = DIA_NASZ_318_Gobby_daj_Info;
 	permanent   = FALSE;
 	description = "Daj mi niewolnika.";
};

FUNC INT DIA_NASZ_318_Gobby_daj_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_318_Gobby_daj_Info()
{
	AI_Output (other,self ,"DIA_NASZ_318_Gobby_daj_15_00"); //Daj mi niewolnika.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_daj_55_01"); //Dobra, dobra. We� sobie, kt�rego chcesz.

};

//*********************************************************************
//	Info Need
//*********************************************************************
INSTANCE DIA_NASZ_318_Gobby_need   (C_INFO)
{
	npc         = NASZ_318_Gobby;
 	nr          = 3;
 	condition   = DIA_NASZ_318_Gobby_need_Condition;
 	information = DIA_NASZ_318_Gobby_need_Info;
 	permanent   = FALSE;
 	description = "Potrzeba ci czego�?";
};

FUNC INT DIA_NASZ_318_Gobby_need_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_318_Gobby_need_Info()
{
	AI_Output (other,self ,"DIA_NASZ_318_Gobby_need_15_00"); //Potrzeba ci czego�?
	AI_Output (self, other,"DIA_NASZ_318_Gobby_need_55_01"); //Skoro ju� pytasz... Przynie� mi zapas ginu.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_need_55_02"); //Przewracam si� ju� od tego ci�g�ego stania. Powiedzmy, �e pi�� butelek starczy.

	Log_CreateTopic (TOPIC_Gobby_gin, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gobby_gin, LOG_RUNNING);
	B_LogEntry (TOPIC_Gobby_gin, "Gobby chcia�by si� czego� napi�. Mam przynie�� mu 5 butelek ginu.");

};

//*********************************************************************
//	Info Beer
//*********************************************************************
INSTANCE DIA_NASZ_318_Gobby_koniec   (C_INFO)
{
	npc         = NASZ_318_Gobby;
 	nr          = 4;
 	condition   = DIA_NASZ_318_Gobby_koniec_Condition;
 	information = DIA_NASZ_318_Gobby_koniec_Info;
 	permanent   = FALSE;
 	description = "Na zdrowie.";
};

FUNC INT DIA_NASZ_318_Gobby_koniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_318_Gobby_need)
	&& npc_hasitems (other, ItFo_Booze) >=5)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_318_Gobby_koniec_Info()
{
	AI_Output (other,self ,"DIA_NASZ_318_Gobby_koniec_15_00"); //Na zdrowie.
	B_GiveInvItems (other, self, ItFo_Booze, 5);
	B_UseItem (self, ItFo_Booze);
	AI_Output (self, other,"DIA_NASZ_318_Gobby_koniec_55_01"); //Dzi�ki.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_koniec_55_02"); //Teraz to mo�na pracowa�!
	AI_Output (other,self ,"DIA_NASZ_318_Gobby_koniec_15_03"); //Co� mi si� zdaje, �e ten zapas na d�ugo nie starczy.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_koniec_55_04"); //Hej! Czy�by� pod�miewa� si� z mojej s�abo�ci do tego cudownego napoju?
	AI_Output (other,self ,"DIA_NASZ_318_Gobby_koniec_15_05"); //Ale� sk�d.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_koniec_55_06"); //��esz. Ju� ja ci poka��, co to znaczy by� mocnym ch�opem.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_koniec_55_07"); //Pami�taj: Prawdziwy m�czyzna nie zwala si� z n�g po pierwszym, lepszym, tanim piwie.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_koniec_55_08"); //Takim jak ty, si�y starczy mo�e na trzy.
	AI_Output (other,self ,"DIA_NASZ_318_Gobby_koniec_15_09"); //Zdziwi�by� si�, gdyby� zobaczy� ile takie chuchro jak ja potrafi wypi�.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_koniec_55_10"); //Doprawdy? Za pazuch� mam tu prawdziwy ogie� dla gard�a: grog z dosypk� ziaren pieprzu.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_koniec_55_11"); //Je�li wypijesz go na raz, uznam ci� za swego bracha.

	B_GivePlayerXP (50);

	B_LogEntry (TOPIC_Gobby_gin, "Zanios�em mu alkohol, ale teraz Gobby prowokuje mnie do wypicia jego specjalnego trunku.");
};

var int WillMozePicZGobbym;
//*********************************************************************
//	Info TryToDrink
//*********************************************************************
INSTANCE DIA_NASZ_318_Gobby_TryToDrink   (C_INFO)
{
	npc         = NASZ_318_Gobby;
 	nr          = 5;
 	condition   = DIA_NASZ_318_Gobby_TryToDrink_Condition;
 	information = DIA_NASZ_318_Gobby_TryToDrink_Info;
 	permanent   = FALSE;
 	description = "Daj mi t� mieszank�.";
};

FUNC INT DIA_NASZ_318_Gobby_TryToDrink_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_318_Gobby_koniec))
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_318_Gobby_TryToDrink_Info()
{
	AI_Output (other,self ,"DIA_NASZ_318_Gobby_TryToDrink_15_00"); //Daj mi t� mieszank�.
	AI_Output (self, other,"DIA_NASZ_318_Gobby_TryToDrink_55_01"); //�mia�o!
	Createinvitems (self, ItFo_Addon_Grog, 1);
	B_GiveInvItems (self, other, ItFo_Addon_Grog, 1);
	B_UseItem (other, ItFo_Addon_Grog);

	if (other.attribute[ATR_STRENGTH] >= 50) || ((other.attribute[ATR_STRENGTH] >= 20) && (other.attribute[ATR_DEXTERITY] >= 40))
	{
		AI_Output (self, other,"DIA_NASZ_318_Gobby_TryToDrink_55_02"); //Prosz�, prosz�!
		AI_Output (self, other,"DIA_NASZ_318_Gobby_TryToDrink_55_03"); //Przyznam, �e nie spodziewa�em si�. Jeste� sw�j ch�op.
		AI_Output (other,self ,"DIA_NASZ_318_Gobby_TryToDrink_15_04"); //Pija�em gorsze rzeczy.	
		AI_Output (self, other,"DIA_NASZ_318_Gobby_TryToDrink_55_05"); //Tak jak ja, brachu! Gdyby� kiedy� chcia� si� napi�, przynie� ze dwie butelki dobrego ginu. Pozwolimy sobie na chwil� przyjemno�ci.

		B_GivePlayerXP (400);
		DodajReputacje (5, REP_BANDYCI);
		Log_SetTopicStatus (TOPIC_Gobby_gin, LOG_SUCCESS);
		B_LogEntry (TOPIC_Gobby_gin, "Mocna rzecz, ale da�em rad�, a Gobby zobaczy� we mnie kompana do picia.");
		WillMozePicZGobbym = TRUE;
	}
	else {
		
		if (other.attribute[ATR_STRENGTH] > other.attribute[ATR_DEXTERITY]) {
			PrintScreen	("Wymagana si�a: 50", -1, 45, FONT_ScreenSmall, 2);
		}
		
		else {
			PrintScreen	("Wymagana si�a: 20, zr�szno��: 40", -1, 45, FONT_ScreenSmall, 2);
		};
		
		AI_StartState	(other, ZS_MagicSleep, 0, "");
		AI_Output (other,self ,"DIA_NASZ_318_Gobby_TryToDrink_15_06"); //Co to by�o?
		AI_Output (self, other,"DIA_NASZ_318_Gobby_TryToDrink_55_07"); //M�wi�em, �e nie dasz rady. Wracaj do obozu, mi�czaku.
	
		Log_SetTopicStatus (TOPIC_Gobby_gin, LOG_FAILED);
		B_LogEntry (TOPIC_Gobby_gin, "To by�o zbyt mocne jak na moj� g�ow�... Jestem zbyt s�aby.");
	};
	
};

var int GobbyDrinkCounter;
//*********************************************************************
//	Info WantToDrinkWithYou
//*********************************************************************
INSTANCE DIA_NASZ_318_Gobby_WantToDrinkWithYou   (C_INFO)
{
	npc         = NASZ_318_Gobby;
 	nr          = 6;
 	condition   = DIA_NASZ_318_Gobby_WantToDrinkWithYou_Condition;
 	information = DIA_NASZ_318_Gobby_WantToDrinkWithYou_Info;
 	permanent   = TRUE;
 	description = "Napijmy si�!";
};

FUNC INT DIA_NASZ_318_Gobby_WantToDrinkWithYou_Condition()
{
	if (WillMozePicZGobbym == TRUE) && (npc_hasitems (other, ItFo_Booze) >= 2)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_318_Gobby_WantToDrinkWithYou_Info()
{
	if (GobbyDrinkCounter < 2) {
		B_GivePlayerXP(200);
		GobbyDrinkCounter += 1;
	};

	AI_Output (other,self ,"DIA_NASZ_318_Gobby_WantToDrinkWithYou_15_00"); //Napijmy si�!
	B_GiveInvItems (other, self, ItFo_Booze, 1);
	AI_Output (self, other,"DIA_NASZ_318_Gobby_WantToDrinkWithYou_55_01"); //Twoje zdrowie!
	B_UseItem (self, ItFo_Booze);
	B_UseItem (other, ItFo_Booze);
	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_318_Gobby_PICKPOCKET (C_INFO)
{
	npc			= NASZ_318_Gobby;
	nr			= 900;
	condition	= DIA_NASZ_318_Gobby_PICKPOCKET_Condition;
	information	= DIA_NASZ_318_Gobby_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_318_Gobby_PICKPOCKET_Condition()
{
	C_Beklauen (26);
};
 
FUNC VOID DIA_NASZ_318_Gobby_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_318_Gobby_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_318_Gobby_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_318_Gobby_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_318_Gobby_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_318_Gobby_PICKPOCKET_DoIt);
};

func void DIA_NASZ_318_Gobby_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItFo_Beer,4);
	
	Info_ClearChoices (DIA_NASZ_318_Gobby_PICKPOCKET);
};
	
func void DIA_NASZ_318_Gobby_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_318_Gobby_PICKPOCKET);
};
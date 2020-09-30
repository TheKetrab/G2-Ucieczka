//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_117_Fed_EXIT   (C_INFO)
{
	npc         = NASZ_117_Fed;
	nr          = 999;
	condition   = DIA_NASZ_117_Fed_EXIT_Condition;
	information = DIA_NASZ_117_Fed_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_117_Fed_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_117_Fed_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_117_Fed_siema   (C_INFO)
{
	npc         = NASZ_117_Fed;
 	nr          = 1;
 	condition   = DIA_NASZ_117_Fed_siema_Condition;
 	information = DIA_NASZ_117_Fed_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_117_Fed_siema_Condition()
{
	if (Npc_IsInState (self, ZS_Talk)) && (ArenaQuestState==0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_117_Fed_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_117_Fed_siema_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_NASZ_117_Fed_siema_55_01"); //Nic. Nuda i tyle.
	AI_Output (other,self ,"DIA_NASZ_117_Fed_siema_15_02"); //Nie masz siê czym zaj¹æ?
	AI_Output (self, other,"DIA_NASZ_117_Fed_siema_55_03"); //Walczê na arenie. Ale obecnie nie ma nikogo chêtnego.
};

//*********************************************************************
//	Arena 
//*********************************************************************
INSTANCE DIA_NASZ_117_Fed_arena   (C_INFO)
{
	npc         = NASZ_117_Fed;
 	nr          = 2;
 	condition   = DIA_NASZ_117_Fed_arena_Condition;
 	information = DIA_NASZ_117_Fed_arena_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_117_Fed_arena_Condition()
{
	if ((Kurgan_walka==1)
		&& Npc_GetDistToWP(self,"NASZ_LOWCY_ARENA_01") < 400
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_117_Fed_arena_Info()
{
	AI_Output (self, other,"DIA_NASZ_117_Fed_arena_55_00"); //Niech wygra lepszy. Powodzenia!

	FED_WALCZY = TRUE;
	Arena_Opuszczasz_Raz = FALSE;
	Arena_Przegrana_Raz = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
//	After		
// ************************************************************

INSTANCE DIA_NASZ_117_Fed_after (C_INFO)
{
	npc	    = NASZ_117_Fed;
	nr	    = 3;
	condition   = DIA_NASZ_117_Fed_after_Condition;
	information = DIA_NASZ_117_Fed_after_Info;
	permanent   = TRUE;
	description = "I jak?";
};                       

FUNC INT DIA_NASZ_117_Fed_after_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_117_Fed_arena)
		&& ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_NASZ_117_Fed_after_Info()
{	
	AI_Output (other, self,"DIA_NASZ_117_Fed_after_15_00"); //I jak?
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_NASZ_117_Fed_after_55_01"); //Dobry jesteœ!
		AI_Output (self, other,"DIA_NASZ_117_Fed_after_55_02"); //To by³a dobra walka, gratulujê.
	}
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output (self, other,"DIA_NASZ_117_Fed_after_55_03"); //Dosta³eœ. Ale dziêki tobie mia³em jakieœ zajêcie.
		AI_Output (self, other,"DIA_NASZ_117_Fed_after_55_04"); //Je¿eli chcia³byœ zmierzyæ siê ze mn¹ jeszcze kiedyœ, idŸ do Kurgana.
	};
};

//*********************************************************************
//	Info GoToRenegaci
//*********************************************************************
INSTANCE DIA_NASZ_117_Fed_GoToRenegaci   (C_INFO)
{
	npc         = NASZ_117_Fed;
 	nr          = 4;
 	condition   = DIA_NASZ_117_Fed_GoToRenegaci_Condition;
 	information = DIA_NASZ_117_Fed_GoToRenegaci_Info;
 	permanent   = FALSE;
	description = "Keroloth wyda³ rozkaz do ataku na renegatów w kopalni.";
};

FUNC INT DIA_NASZ_117_Fed_GoToRenegaci_Condition()	
{
	if (KerolothRenegatOK == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_117_Fed_GoToRenegaci_Info()
{
	AI_Output (other, self,"DIA_NASZ_117_Fed_GoToRenegaci_15_00"); //Keroloth wyda³ rozkaz do ataku na renegatów w kopalni.
	AI_Output (self, other,"DIA_NASZ_117_Fed_GoToRenegaci_55_01"); //Myœla³em, ¿e nie obchodzi go nic innego ni¿ orkowie. Jeœli pójdziemy, to obóz zostanie os³abiony.
	AI_Output (other, self,"DIA_NASZ_117_Fed_GoToRenegaci_55_02"); //Powiedzia³, ¿e wszystkim przyda siê inny rodzaj treningu ni¿ walka na arenie.
	AI_Output (self, other,"DIA_NASZ_117_Fed_GoToRenegaci_55_03"); //W takim razie ruszam razem z tob¹.

	Npc_ExchangeRoutine (self, "FollowRenegaci");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_117_Fed,1);
};

//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_117_Fed_goth   (C_INFO)
{
	npc         = NASZ_117_Fed;
 	nr          = 4;
 	condition   = DIA_NASZ_117_Fed_goth_Condition;
 	information = DIA_NASZ_117_Fed_goth_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_117_Fed_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& npc_knowsinfo (other, DIA_NASZ_115_Kurgan_goth)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_117_Fed_goth_Info()
{
	AI_Output (self, other,"DIA_NASZ_117_Fed_goth_15_00"); //Psst.
	AI_Output (self, other,"DIA_NASZ_117_Fed_goth_55_01"); //WeŸ tê mapê.
	AI_Output (self, other,"DIA_NASZ_117_Fed_goth_55_02"); //A teraz uciekaj. Lepiej, ¿eby Kurgan nas razem nie zobaczy³.

	CreateInvItems (self, ItNa_Mapa_Lens, 1);
	B_GiveInvItems (self, other, ItNa_Mapa_Lens, 1);

	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_Goth_kradziez, "Wojownik Fed da³ mi mapê. Tylko có¿ mo¿e chowaæ siê pod znakiem 'X'?");

};


//*********************************************************************
//	Info PrayBeliar
//*********************************************************************
INSTANCE DIA_NASZ_117_Fed_PrayBeliar   (C_INFO)
{
	npc         = NASZ_117_Fed;
 	nr          = 500;
 	condition   = DIA_NASZ_117_Fed_PrayBeliar_Condition;
 	information = DIA_NASZ_117_Fed_PrayBeliar_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_117_Fed_PrayBeliar_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_412_CatSan_UrShackKilled))
	&& (Npc_IsInState(self, ZS_TALK))
	&& (KAPITEL < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_117_Fed_PrayBeliar_Info()
{
	AI_Output (other, self,"DIA_NASZ_117_Fed_PrayBeliar_15_00"); //Modlisz siê do Beliara?
	AI_Output (self, other,"DIA_NASZ_117_Fed_PrayBeliar_55_01"); //A do kogo mam siê modliæ, skoro Innos nam nie pomóg³?! Gestath nie ¿yje, a i ja omal nie zgin¹³em!
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_117_Fed_HowAreYou   (C_INFO)
{
	npc         = NASZ_117_Fed;
 	nr          = 500;
 	condition   = DIA_NASZ_117_Fed_HowAreYou_Condition;
 	information = DIA_NASZ_117_Fed_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak siê czujesz?";
};

FUNC INT DIA_NASZ_117_Fed_HowAreYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_117_Fed_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_117_Fed_HowAreYou_15_00"); //Jak siê czujesz?
	
	if !(npc_knowsinfo (other, DIA_NASZ_412_CatSan_UrShackKilled))
	{
		AI_Output (self, other,"DIA_NASZ_117_Fed_HowAreYou_55_01"); //Muszê przyznaæ, ¿e trochê siê bojê. Szykuje siê pierwsza powa¿na bitwa.
		AI_Output (self, other,"DIA_NASZ_117_Fed_HowAreYou_55_02"); //Ale z drugiej strony uwa¿am, ¿e jestem dobrze przygotowany dziêki treningom u Kurgana.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_117_Fed_HowAreYou_55_03"); //Strasznie siê stresujê. Wymarsz do twierdzy razem z innymi to chyba by³ kiepski pomys³.
		AI_Output (self, other,"DIA_NASZ_117_Fed_HowAreYou_55_04"); //Tylko bogowie mog¹ nas uratowaæ.
	};
};

//*********************************************************************
//	Info KurgKanDead
//*********************************************************************
INSTANCE DIA_NASZ_117_Fed_KurgKanDead   (C_INFO)
{
	npc         = NASZ_117_Fed;
 	nr          = 500;
 	condition   = DIA_NASZ_117_Fed_KurgKanDead_Condition;
 	information = DIA_NASZ_117_Fed_KurgKanDead_Info;
 	permanent   = TRUE;
	important	= true;
};

FUNC INT DIA_NASZ_117_Fed_KurgKanDead_Condition()
{
	if (FedFerrosKillKurgKan && !KurgKanUratowany)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_117_Fed_KurgKanDead_Info()
{
	AI_Output (self, other,"DIA_NASZ_117_Fed_KurgKanDead_55_00"); //I kolejny orkowy zadek skopany! Nawet nie by³ wielkim wyzwaniem.
	AI_Output (other, self,"DIA_NASZ_117_Fed_KurgKanDead_15_01"); //Gratulujê, Fed. Zabi³eœ by³ego orka-niewolnika, który nie by³ gotowy na walkê.
	AI_Output (self, other,"DIA_NASZ_117_Fed_KurgKanDead_55_02"); //Eeee... co?
	AI_Output (other, self,"DIA_NASZ_117_Fed_KurgKanDead_15_03"); //Niewa¿ne. ¯egnaj.
	KurgKanUratowany = -1;
	
	//Log_SetTopicStatus (Topic_OrcInATrap, LOG_FAILED);
	//B_LogEntry(Topic_OrcInATrap, "Niestety Kurg-Kan zosta³ zabity. Mam nadziejê, ¿e gdziekolwiek jego dusza nie pójdzie, bêdzie mia³ siê tam dobrze.");
	
	FailQuest(Topic_OrcInATrap,"");

	
	AI_StopProcessInfos(self);
	
	Npc_ExchangeRoutine(NASZ_117_Fed,rut1);
	Npc_ExchangeRoutine(NASZ_118_Ferros,rut2);
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_117_Fed_PICKPOCKET (C_INFO)
{
	npc			= NASZ_117_Fed;
	nr			= 900;
	condition	= DIA_NASZ_117_Fed_PICKPOCKET_Condition;
	information	= DIA_NASZ_117_Fed_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_117_Fed_PICKPOCKET_Condition()
{
	C_Beklauen (43);
};
 
FUNC VOID DIA_NASZ_117_Fed_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_117_Fed_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_117_Fed_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_117_Fed_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_117_Fed_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_117_Fed_PICKPOCKET_DoIt);
};

func void DIA_NASZ_117_Fed_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItPo_Health_02,4);
	Info_ClearChoices (DIA_NASZ_117_Fed_PICKPOCKET);
};
	
func void DIA_NASZ_117_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_117_Fed_PICKPOCKET);
};


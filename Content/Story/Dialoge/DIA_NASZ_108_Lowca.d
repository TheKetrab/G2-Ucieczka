var int LOWCA_SIKA_STOP_GADANIE;
var int LOWCA_SIKA_END;
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_108_Lowca_EXIT   (C_INFO)
{
	npc         = NASZ_108_Lowca;
	nr          = 999;
	condition   = DIA_NASZ_108_Lowca_EXIT_Condition;
	information = DIA_NASZ_108_Lowca_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_108_Lowca_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_108_Lowca_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_108_Lowca_hello		(C_INFO)
{
	npc		 	 = 	NASZ_108_Lowca;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_108_Lowca_hello_Condition;
	information	 = 	DIA_NASZ_108_Lowca_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_108_Lowca_hello_Condition ()
{
	if ((Npc_IsInState (self, ZS_Talk) && (LOWCA_SIKA_STOP_GADANIE == FALSE))
	|| (Npc_IsInState (self, ZS_Talk) && (LOWCA_SIKA_STOP_GADANIE == TRUE) && (Wld_IsTime(04,15,22,45))))
	&& (Lowca108_PojedynekDoRozegrania == FALSE)
	{
		return TRUE;
	};
};
func void DIA_NASZ_108_Lowca_hello_Info ()
{
	if (LOWCA_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_108_Lowca_hello_03_00"); //Nie przeszkadzaj mi!
	LOWCA_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (LOWCA_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_108_Lowca_hello_03_01"); //Cz³owieku, weŸ siê odczep.
	LOWCA_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (LOWCA_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_108_Lowca_hello_03_02"); //Zostaw mnie w spokoju!
	LOWCA_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_108_Lowca_hello_03_03"); //Nie mam teraz czasu.
	LOWCA_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

///////////////////////////////////////////////////////////////////////
//	Info Pojedynek
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_108_Lowca_pojedynek		(C_INFO)
{
	npc			 = 	NASZ_108_Lowca;
	nr		 	 = 	2;
	condition	 = 	DIA_NASZ_108_Lowca_pojedynek_Condition;
	information	 = 	DIA_NASZ_108_Lowca_pojedynek_Info;
	permanent	 = 	FALSE;
	description	 =	"Chcê z tob¹ walczyæ.";
};

func int DIA_NASZ_108_Lowca_pojedynek_Condition ()
{
	if(Lowca108_PojedynekDoRozegrania == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NASZ_108_Lowca_pojedynek_Info ()
{
	AI_Output		(other, self, "DIA_NASZ_108_Lowca_pojedynek_55_00"); //Chcê z tob¹ walczyæ.
	AI_Output		(self, other, "DIA_NASZ_108_Lowca_pojedynek_03_01"); //Taki frajer, jak ty? Mam daæ ci fory, czy mo¿e raczej zabiæ?
	AI_Output		(other, self, "DIA_NASZ_108_Lowca_pojedynek_55_02"); //W³aœnie mia³em zapytaæ o to samo, ale skoro ju¿ pytasz to chyba lepiej, jak dasz mi fory. Ja ciê zabijê.
	AI_Output		(self, other, "DIA_NASZ_108_Lowca_pojedynek_03_03"); //Ho, ho, ho! Mocny w gêbie. Jak myœlisz, czemu tu jestem? Tu, w Górniczej Dolinie, ur¿n¹³em ju¿ niejednego frajera. Chcesz byæ kolejnym?

	Info_ClearChoices (DIA_NASZ_108_Lowca_pojedynek);
		Info_AddChoice	  (DIA_NASZ_108_Lowca_pojedynek, "Ju¿ ci mówi³em: Mo¿esz spróbowaæ mnie zabiæ.", DIA_NASZ_108_Lowca_pojedynek_kill);
		if (npc_hasitems(other,ItNa_Trucizna)>=1) && (npc_knowsinfo (other, DIA_NASZ_123_Lowca_pojedynek)) {
			Info_AddChoice	  (DIA_NASZ_108_Lowca_pojedynek, "WeŸ sobie lepiej coœ na uspokojenie. (daj truciznê)", DIA_NASZ_108_Lowca_pojedynek_trucizna);
		};
		Info_AddChoice	  (DIA_NASZ_108_Lowca_pojedynek, "Hmm... Lepiej daj mi fory podczas walki.", DIA_NASZ_108_Lowca_pojedynek_fory);
		

};

FUNC VOID DIA_NASZ_108_Lowca_pojedynek_kill()
{
	AI_Output (other,self ,"DIA_NASZ_108_Lowca_pojedynek_kill_15_00"); //Ju¿ ci mówi³em: Mo¿esz spróbowaæ mnie zabiæ.
	AI_Output (self, other,"DIA_NASZ_108_Lowca_pojedynek_kill_55_01"); //Sam siê o to prosisz!
	
	AI_StopProcessInfos (self);
	B_Attack  (self, other, AR_KILL, 1);
};

FUNC VOID DIA_NASZ_108_Lowca_pojedynek_trucizna()
{
	AI_Output (other,self ,"DIA_NASZ_108_Lowca_pojedynek_trucizna_15_00"); //WeŸ sobie lepiej coœ na uspokojenie.
	B_giveinvitems 	(other, self, ItNa_Trucizna, 1);	
	AI_Output (self, other,"DIA_NASZ_108_Lowca_pojedynek_trucizna_55_01"); //Co to? Pachnie, jak alkohol...
	AI_Output (other,self ,"DIA_NASZ_108_Lowca_pojedynek_trucizna_15_02"); //Wyci¹g z zió³. Uwierz mi, wszelkie bóle po nim odchodz¹ w niepamiêæ.
	B_UseItem (self, ItNa_Trucizna);
	AI_Output (self, other,"DIA_NASZ_108_Lowca_pojedynek_trucizna_55_03"); //Ty ma³y szkodniku, coœ ty mi poda³? Ju¿ ja ciê nauczê szacunku do starszych.
	
	AI_StopProcessInfos (self);
	B_Attack  (self, other, AR_NONE, 1);
	
};

FUNC VOID DIA_NASZ_108_Lowca_pojedynek_fory()
{
	AI_Output (other,self ,"DIA_NASZ_108_Lowca_pojedynek_fory_15_00"); //Hmm... Lepiej daj mi fory podczas walki.
	AI_Output (self, other,"DIA_NASZ_108_Lowca_pojedynek_fory_55_01"); //Jasne, wyci¹gaj broñ. I dobrze ci radzê: Im szybciej po³o¿ysz siê na ziemiê, tym mniej siniaków siê nabawisz.
	
	AI_StopProcessInfos (self);
	B_Attack  (self, other, AR_NONE, 1);
	
};


//*********************************************************************
//	Info PoWalce
//*********************************************************************
INSTANCE DIA_NASZ_108_Lowca_PoWalce   (C_INFO)
{
	npc         = NASZ_108_Lowca;
 	nr          = 5;
 	condition   = DIA_NASZ_108_Lowca_PoWalce_Condition;
 	information = DIA_NASZ_108_Lowca_PoWalce_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_108_Lowca_PoWalce_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_108_Lowca_pojedynek)
		&& ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_108_Lowca_PoWalce_Info()
{
	Lowca108Pojedynek_Done = TRUE;
	Lowca108_PojedynekDoRozegrania = FALSE;
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		AI_Output (self, other,"DIA_NASZ_108_Lowca_PoWalce_15_00"); //To jeszcze nie koniec. Kiedyœ dostaniesz ode mnie solidny ³omot.
		
		B_LogEntry (TOPIC_Rethon_szkolenie, "Kto by pomyœla³, ¿e spranie buŸki temu bufonowi bêdzie tak przyjemne.");
		B_GivePlayerXP (200);
	}
	else {
		AI_Output (self, other,"DIA_NASZ_108_Lowca_PoWalce_15_01"); //Mia³em ochotê wbiæ ci miecz prosto w brzuch. Ale w koñcu fory, to fory.
		AI_Output (self, other,"DIA_NASZ_108_Lowca_PoWalce_15_02"); //Ma³a rada: Uwa¿aj w przysz³oœci na takich jak ja.

		B_LogEntry (TOPIC_Rethon_szkolenie, "Ten ³owca, z którym przegra³em, to jakaœ masakra... Kiedyœ mu za to oddam.");
	};

};

var int Lowca108WalkaOSikanie;
///////////////////////////////////////////////////////////////////////
//	Info Catch
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_108_Lowca_catch		(C_INFO)
{
	npc		 = 	NASZ_108_Lowca;
	nr		 = 	2;
	condition	 = 	DIA_NASZ_108_Lowca_catch_Condition;
	information	 = 	DIA_NASZ_108_Lowca_catch_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_108_Lowca_catch_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& (Wld_IsTime(22,45,04,15))
//		&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_LOWCY_TRENING_15")
		&& npc_knowsinfo (other, DIA_NASZ_125_Silas_Quest)
		&& (LOWCA_SIKA_STOP_GADANIE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NASZ_108_Lowca_catch_Info ()
{
	AI_Output		(other, self, "DIA_NASZ_108_Lowca_catch_55_00"); //Nie wstyd ci tak sikaæ przy wszystkich?
	AI_Output		(self, other, "DIA_NASZ_108_Lowca_catch_03_01"); //Nie wiem jak ty, ale ja MAM siê czym chwaliæ.
	AI_Output		(other, self, "DIA_NASZ_108_Lowca_catch_55_02"); //Przestañ, w tej chwili! Silas nie ¿yczy sobie takich odra¿aj¹cych praktyk pod swoj¹ karczm¹.
	AI_Output		(self, other, "DIA_NASZ_108_Lowca_catch_03_03"); //Daj mi chocia¿ jeden powód, dla którego mia³bym przestaæ.

	//Npc_ExchangeRoutine (self, "Start");
	self.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;

	Info_ClearChoices (DIA_NASZ_108_Lowca_catch);
		Info_AddChoice	  (DIA_NASZ_108_Lowca_catch, "Bo ci go mogê zaraz odci¹æ.", DIA_NASZ_108_Lowca_catch_fight);
		Info_AddChoice	  (DIA_NASZ_108_Lowca_catch, "Keroloth dowie siê o wszystkim.", DIA_NASZ_108_Lowca_catch_keroloth);
		if (npc_hasitems (other, ItMi_Gold) >= 50) {
			Info_AddChoice	  (DIA_NASZ_108_Lowca_catch, "Dam ci z³oto. (50 szt. z³ota)", DIA_NASZ_108_Lowca_catch_gold);
		};
};

FUNC VOID DIA_NASZ_108_Lowca_catch_fight()
{

	AI_Output (other,self ,"DIA_NASZ_108_Lowca_catch_fight_15_00"); //Bo ci go mogê zaraz odci¹æ.
		AI_ReadyMeleeWeapon		(other);
	AI_Output (self, other,"DIA_NASZ_108_Lowca_catch_fight_55_01"); //Tylko spróbuj!

	Lowca108WalkaOSikanie = TRUE;
	
	Info_ClearChoices (DIA_NASZ_108_Lowca_catch);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

FUNC VOID DIA_NASZ_108_Lowca_catch_keroloth()
{

	AI_Output (other,self ,"DIA_NASZ_108_Lowca_catch_keroloth_15_00"); //Keroloth dowie siê o wszystkim.
	AI_Output (self, other,"DIA_NASZ_108_Lowca_catch_keroloth_55_01"); //On z pewnoœci¹ o wszystkim wie. Wszyscy wiedz¹, kto ma najwiêkszy miecz w obozie.

};

FUNC VOID DIA_NASZ_108_Lowca_catch_gold()
{
	
	AI_Output (other,self ,"DIA_NASZ_108_Lowca_catch_gold_15_00"); //Dam ci z³oto.
	B_giveinvitems 	(other, self, ItMi_Gold, 50);	
	AI_Output (self, other,"DIA_NASZ_108_Lowca_catch_gold_55_01"); //Za tak¹ sumkê mogê chyba z tym skoñczyæ na jakiœ czas...

	NPC_RemoveInvItems	(self, ItMi_Gold, 50);
	LOWCA_SIKA_END = TRUE;
	LOWCA_SIKA_STOP_GADANIE = FALSE;
	Npc_ExchangeRoutine (self, "Start");
	B_LogEntry (TOPIC_Silas_lanie, "£owca orków przestanie ju¿ sikaæ pod karczm¹.");
	Info_ClearChoices (DIA_NASZ_108_Lowca_catch);
};

var int LOWCA_SIKA_WALKA_ONETIME;
///////////////////////////////////////////////////////////////////////
//	Info Walka
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_108_Lowca_walka		(C_INFO)
{
	npc			 = 	NASZ_108_Lowca;
	nr			 = 	3;
	condition	 = 	DIA_NASZ_108_Lowca_walka_Condition;
	information	 = 	DIA_NASZ_108_Lowca_walka_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_108_Lowca_walka_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		&& (npc_knowsinfo(other,DIA_NASZ_108_Lowca_catch)))
	&& (
		(!LOWCA_SIKA_WALKA_ONETIME && Lowca108WalkaOSikanie == TRUE) // kap1
		|| 
		(LowcaSika == 3) // kap2
	)
	{
		return TRUE;
	};
};

func void DIA_NASZ_108_Lowca_walka_Info ()
{
	AI_Output		(self, other, "DIA_NASZ_108_Lowca_walka_55_00"); //Ci¹gle go mam...
	AI_Output		(other, self, "DIA_NASZ_108_Lowca_walka_03_01"); //Nie by³ zbyt du¿y. Trudno by³oby go uci¹æ.
	AI_Output		(other, self, "DIA_NASZ_108_Lowca_walka_55_02"); //A teraz won st¹d i ¿ebym nigdy wiêcej nie widzia³, jak sikasz po nocach pod karczm¹!

	Npc_ExchangeRoutine (self, "Start");
	LOWCA_SIKA_END = TRUE;
	LOWCA_SIKA_STOP_GADANIE = FALSE;
	LOWCA_SIKA_WALKA_ONETIME = TRUE;
	B_LogEntry (TOPIC_Silas_lanie, "£owca orków przestanie ju¿ sikaæ pod karczm¹.");

};

///////////////////////////////////////////////////////////////////////
//	Info WalkaPrzegrales
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_108_Lowca_WalkaPrzegrales		(C_INFO)
{
	npc			 = 	NASZ_108_Lowca;
	nr			 = 	4;
	condition	 = 	DIA_NASZ_108_Lowca_WalkaPrzegrales_Condition;
	information	 = 	DIA_NASZ_108_Lowca_WalkaPrzegrales_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_108_Lowca_WalkaPrzegrales_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		&& (npc_knowsinfo(other,DIA_NASZ_108_Lowca_catch)))
	&& (
		(!LOWCA_SIKA_WALKA_ONETIME) // kap1
		||
		(LowcaSika == 3) // kap2
	)
	{
		return TRUE;
	};
};

func void DIA_NASZ_108_Lowca_WalkaPrzegrales_Info ()
{
	AI_Output		(self, other, "DIA_NASZ_108_Lowca_WalkaPrzegrales_55_00"); //Zje¿d¿aj frajerze.
	AI_Output		(self, other, "DIA_NASZ_108_Lowca_WalkaPrzegrales_03_01"); //Bêdê sobie tutaj sika³ do woli!

	LOWCA_SIKA_STOP_GADANIE = FALSE;
	LOWCA_SIKA_WALKA_ONETIME = TRUE;
	
	FailQuest(TOPIC_Silas_lanie,"Nie da³em rady... Nie przegoniê niechlujnego ³owcy.");
	//Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_FAILED);
	//B_LogEntry (TOPIC_Silas_lanie, "Nie da³em rady... Nie przegoniê niechlujnego ³owcy.");


};

///////////////////////////////////////////////////////////////////////
//	Info Umawialismy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_108_Lowca_Umawialismy		(C_INFO)
{
	npc			 = 	NASZ_108_Lowca;
	nr			 = 	5;
	condition	 = 	DIA_NASZ_108_Lowca_Umawialismy_Condition;
	information	 = 	DIA_NASZ_108_Lowca_Umawialismy_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_108_Lowca_Umawialismy_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& (LowcaSika == 2))
	{
		return TRUE;
	};
};

func void DIA_NASZ_108_Lowca_Umawialismy_Info ()
{
	AI_Output		(other, self, "DIA_NASZ_108_Lowca_Umawialismy_55_00"); //Umawialiœmy siê na coœ innego.
	AI_Output		(self, other, "DIA_NASZ_108_Lowca_Umawialismy_03_01"); //Jeœli po raz kolejny zamierzasz mi zap³aciæ to œmia³o. Na jakieœ dwa dni wrócê w krzaki.
	AI_Output		(other, self, "DIA_NASZ_108_Lowca_Umawialismy_55_02"); //Nie zamierzam p³aciæ.
	
	AI_ReadyMeleeWeapon (other);

	AI_Output		(self, other, "DIA_NASZ_108_Lowca_Umawialismy_03_03"); //O! To mi siê podoba.

	LowcaSika = 3;

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);

};
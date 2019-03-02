
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_006_Renegat_EXIT   (C_INFO)
{
	npc         = NASZ_006_Renegat;
	nr          = 999;
	condition   = DIA_NASZ_006_Renegat_EXIT_Condition;
	information = DIA_NASZ_006_Renegat_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_006_Renegat_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_006_Renegat_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_006_Renegat_siema   (C_INFO)
{
	npc         = NASZ_006_Renegat;
 	nr          = 1;
 	condition   = DIA_NASZ_006_Renegat_siema_Condition;
 	information = DIA_NASZ_006_Renegat_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_006_Renegat_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_006_Renegat_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema_15_00"); //Do jasnej cholery, gdzie leziesz? Nie wyjdziesz st�d, nawet o tym nie my�l.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema_15_01"); //Wracaj do pracy, ale to ju�!

	AI_TurnAway (hero, self);
	AI_GotoWP (hero, "OW_MINE2_01");

	B_Kapitelwechsel (1, NEWWORLD_ZEN );

	AI_StopProcessInfos (self);

	Log_CreateTopic (TOPIC_Kopalnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kopalnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Kopalnia, "Do�� tego! Im d�u�ej jestem w tej przekl�tej kopalni, tym jestem pewniejszy, �e tu zgnij�. Musz� st�d zwiewa�, tylko jak?");
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Musz� si� wydosta� z kopalni.");
};

//*********************************************************************
//	Info Hello2
//*********************************************************************
INSTANCE DIA_NASZ_006_Renegat_siema2   (C_INFO)
{
	npc         = NASZ_006_Renegat;
 	nr          = 2;
 	condition   = DIA_NASZ_006_Renegat_siema2_Condition;
 	information = DIA_NASZ_006_Renegat_siema2_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_006_Renegat_siema2_Condition()
{
	if ((npc_knowsinfo (other, DIA_NASZ_006_Renegat_siema)) && (BenPomysl_Fail!=1) // czyli misja z benem nie jest aktywna
	&& Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_2_04")) && (WillWantToKillRenegats == FALSE) && (Renegat06BiegnieOneTime == FALSE)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_006_Renegat_siema2_Info()
{
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema2_15_00"); //DO PRACY!
	
	AI_TurnAway (hero, self);
	AI_GotoWP (hero, "OW_MINE2_01");
	AI_StopProcessInfos (self);
		
};

//*********************************************************************
//	Info Hello3
//*********************************************************************
INSTANCE DIA_NASZ_006_Renegat_siema3   (C_INFO)
{
	npc         = NASZ_006_Renegat;
 	nr          = 3;
 	condition   = DIA_NASZ_006_Renegat_siema3_Condition;
 	information = DIA_NASZ_006_Renegat_siema3_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_006_Renegat_siema3_Condition()
{
	if ((npc_knowsinfo (other, DIA_NASZ_006_Renegat_siema)) && (npc_knowsinfo(other, DIA_NASZ_005_Ben_HaveYouGotAnIdea))
	&& KAPITEL==1)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_006_Renegat_siema3_Info()
{
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_15_00"); //Czego tu, �achmyto? �ap za kilof i jazda do kopalni albo sam ci� tam zaci�gn�!
	
	Info_ClearChoices (DIA_NASZ_006_Renegat_siema3);
		Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "Chc� rozmawia� z Marcosem.", DIA_NASZ_006_Renegat_siema3_c);
		Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "Przysy�a mnie Ben. On i reszta ch�opc�w obumieraj� z g�odu...", DIA_NASZ_006_Renegat_siema3_b);
		Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "Przychodz� w sprawie jedzenia...", DIA_NASZ_006_Renegat_siema3_a);
			
};

FUNC VOID DIA_NASZ_006_Renegat_siema3_c()
{

	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_01"); //Chc� rozmawia� z Marcosem.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_02"); //Ch�opcze, to ja decyduj� o tym, kto z was i kiedy mo�e porozmawia� z szefem. Normalnie kaza�bym ci spada� do kopalni.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_03"); //Mam dzi� jednak dobry humor, bo znalaz�em cenny pier�cie�, z tego te� wzgl�du zdecydowa�em, �e ci� wys�ucham. No bandyto, jaka to sprawa musi niezw�ocznie dotrze� do Marcosa?
	AI_Output (other, self,"DIA_NASZ_006_Renegat_siema3_c_55_04"); //Chodzi o rud� i jej wydobycie.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_05"); //A co jest z tym nie tak? Nie zauwa�y�em �adnych k�opot�w.
	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_06"); //G�rnicy opadaj� ju� z si�, dajecie nam zbyt ma�o wytchnienia i po�ywienia. Jak my�lisz, ile jeszcze damy rad� tak pracowa�?
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_07"); //Jeszcze jedno s�owo i...
	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_08"); //Pobijesz mnie? Prosz� bardzo, jednak pomy�l co zrobi Marcos kiedy dowie si�, �e przez twoj� niekompetencj� wszyscy g�rnicy pomarli z g�odu.
	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_09"); //Wiesz, �e bez nas nie wydob�dziecie nawet jednej zawszonej bry�ki rudy.
	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_10"); //Ponadto, s�ysza�em twoj� rozmow� z Marcosem. Z jego polecenia to ty nadzorujesz kopalni�, jak i nasz� prac�. Chyba nie chcesz go wkurzy�, co?
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_11"); //Niech ci� szlag, porozmawiam z Marcosem, a teraz wyjazd do kopalni zanim strac� cierpliwo��!
	
	B_LogEntry (TOPIC_Ben_pomysl, "Nie wierz� w to, �e mi si� uda�o! Trzeba teraz wr�ci� do Bena i poinformowa� go o sukcesie.");
	BenPomysl_Fail=3;
	
	Info_ClearChoices (DIA_NASZ_006_Renegat_siema3);
	Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "KONIEC", DIA_NASZ_006_Renegat_siema3_end);
};

FUNC VOID DIA_NASZ_006_Renegat_siema3_b()
{

	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_b_15_01"); //Przysy�a mnie Ben. On i reszta ch�opc�w obumieraj� z g�odu...
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_b_55_02"); //Gdyby�cie pracowali ci�ej, racje �ywno�ciowe by�yby wi�ksze. Nie b�dziemy utrzymywali nierob�w. Jazda st�d!
	
	B_LogEntry (TOPIC_Ben_pomysl, "Niestety nie uda�o mi si� dogada� ze stra�nikiem, trzeba przekaza� Benowi smutne wie�ci.");
	BenPomysl_Fail=2;

	Info_ClearChoices (DIA_NASZ_006_Renegat_siema3);
	Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "KONIEC", DIA_NASZ_006_Renegat_siema3_end);
};

FUNC VOID DIA_NASZ_006_Renegat_siema3_a()
{

	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_a_15_01"); //Przychodz� w sprawie jedzenia...
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_a_55_02"); //Przecie� dostali�cie ju� dzisiaj swoje przydzia�y, jeszcze wam ma�o? Jazda do kopalni albo b�dziesz �ar� przez nast�pny tydzie� ska�y i piach!
	
	B_LogEntry (TOPIC_Ben_pomysl, "Niestety nie uda�o mi si� dogada� ze stra�nikiem, trzeba przekaza� Benowi smutne wie�ci.");
	BenPomysl_Fail=2;

	Info_ClearChoices (DIA_NASZ_006_Renegat_siema3);
	Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "KONIEC", DIA_NASZ_006_Renegat_siema3_end);
};

FUNC VOID DIA_NASZ_006_Renegat_siema3_end()
{
	AI_TurnAway (hero, self);
	AI_GotoWP (hero, "OW_MINE2_01");
	AI_StopProcessInfos (self);
};





//*********************************************************************
//	Info Kill
//*********************************************************************
INSTANCE DIA_NASZ_006_Renegat_kill   (C_INFO)
{
	npc         = NASZ_006_Renegat;
 	nr          = 4;
 	condition   = DIA_NASZ_006_Renegat_kill_Condition;
 	information = DIA_NASZ_006_Renegat_kill_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_006_Renegat_kill_Condition()
{
	if (WillWantToKillRenegats == TRUE) && !(npc_knowsinfo (other, DIA_NASZ_305_Rabon_hmm))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_006_Renegat_kill_Info()
{
	AI_Output (self, other,"DIA_NASZ_006_Renegat_kill_15_00"); //Kogo my tu mamy? St�sknili�my si� za tob�.
	AI_Output (other, self,"DIA_NASZ_006_Renegat_kill_15_01"); //Ja za wami te�. Przyszed�em was zabi�.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_kill_15_02"); //Zabawne! Marcos, patrz kto przyszed�.
	AI_GotoWP (NASZ_009_Marcos, "OW_PATH_2_04");
	Npc_ExchangeRoutine (NASZ_011_Renegat, "GoToStart");
	AI_LookAtNpc (NASZ_006_Renegat, NASZ_009_Marcos);
	AI_LookAtNpc (NASZ_009_Marcos, NASZ_006_Renegat);
	AI_Output (self, other,"DIA_NASZ_006_Renegat_kill_15_03"); //Nasz przyjaciel chce si� nas pozby�. Powiesz mu, co o tym my�limy?
	AI_StopProcessInfos (self);
};


//*********************************************************************
//	Info Weapon
//*********************************************************************
INSTANCE DIA_NASZ_006_Renegat_weapon   (C_INFO)
{
	npc         = NASZ_006_Renegat;
 	nr          = 5;
 	condition   = DIA_NASZ_006_Renegat_weapon_Condition;
 	information = DIA_NASZ_006_Renegat_weapon_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_006_Renegat_weapon_Condition()
{
	if (Renegat06BiegnieOneTime == TRUE) && (KAPITEL == 1)
	&& (UcieklesZKopalni == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_006_Renegat_weapon_Info()
{
	AI_Output (self, other,"DIA_NASZ_006_Renegat_weapon_15_00"); //Hola, hola, sk�d masz t� bro�?
	AI_Output (self, other,"DIA_NASZ_006_Renegat_weapon_15_01"); //Oddawaj!
	
	var C_Item bron; bron = Npc_GetEquippedMeleeWeapon(hero);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 1);

	AI_Output (self, other,"DIA_NASZ_006_Renegat_weapon_15_02"); //A teraz zje�d�aj!
	
	Renegat06BiegnieOneTime = FALSE;
	//AI_GotoWP (hero, "OW_MINE2_03");
	AI_StopProcessInfos (self);
};

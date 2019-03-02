
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
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema_15_00"); //Do jasnej cholery, gdzie leziesz? Nie wyjdziesz st¹d, nawet o tym nie myœl.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema_15_01"); //Wracaj do pracy, ale to ju¿!

	AI_TurnAway (hero, self);
	AI_GotoWP (hero, "OW_MINE2_01");

	B_Kapitelwechsel (1, NEWWORLD_ZEN );

	AI_StopProcessInfos (self);

	Log_CreateTopic (TOPIC_Kopalnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kopalnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Kopalnia, "Doœæ tego! Im d³u¿ej jestem w tej przeklêtej kopalni, tym jestem pewniejszy, ¿e tu zgnijê. Muszê st¹d zwiewaæ, tylko jak?");
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Muszê siê wydostaæ z kopalni.");
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
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_15_00"); //Czego tu, ³achmyto? £ap za kilof i jazda do kopalni albo sam ciê tam zaci¹gnê!
	
	Info_ClearChoices (DIA_NASZ_006_Renegat_siema3);
		Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "Chcê rozmawiaæ z Marcosem.", DIA_NASZ_006_Renegat_siema3_c);
		Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "Przysy³a mnie Ben. On i reszta ch³opców obumieraj¹ z g³odu...", DIA_NASZ_006_Renegat_siema3_b);
		Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "Przychodzê w sprawie jedzenia...", DIA_NASZ_006_Renegat_siema3_a);
			
};

FUNC VOID DIA_NASZ_006_Renegat_siema3_c()
{

	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_01"); //Chcê rozmawiaæ z Marcosem.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_02"); //Ch³opcze, to ja decydujê o tym, kto z was i kiedy mo¿e porozmawiaæ z szefem. Normalnie kaza³bym ci spadaæ do kopalni.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_03"); //Mam dziœ jednak dobry humor, bo znalaz³em cenny pierœcieñ, z tego te¿ wzglêdu zdecydowa³em, ¿e ciê wys³ucham. No bandyto, jaka to sprawa musi niezw³ocznie dotrzeæ do Marcosa?
	AI_Output (other, self,"DIA_NASZ_006_Renegat_siema3_c_55_04"); //Chodzi o rudê i jej wydobycie.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_05"); //A co jest z tym nie tak? Nie zauwa¿y³em ¿adnych k³opotów.
	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_06"); //Górnicy opadaj¹ ju¿ z si³, dajecie nam zbyt ma³o wytchnienia i po¿ywienia. Jak myœlisz, ile jeszcze damy radê tak pracowaæ?
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_07"); //Jeszcze jedno s³owo i...
	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_08"); //Pobijesz mnie? Proszê bardzo, jednak pomyœl co zrobi Marcos kiedy dowie siê, ¿e przez twoj¹ niekompetencjê wszyscy górnicy pomarli z g³odu.
	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_09"); //Wiesz, ¿e bez nas nie wydobêdziecie nawet jednej zawszonej bry³ki rudy.
	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_c_15_10"); //Ponadto, s³ysza³em twoj¹ rozmowê z Marcosem. Z jego polecenia to ty nadzorujesz kopalniê, jak i nasz¹ pracê. Chyba nie chcesz go wkurzyæ, co?
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_c_55_11"); //Niech ciê szlag, porozmawiam z Marcosem, a teraz wyjazd do kopalni zanim stracê cierpliwoœæ!
	
	B_LogEntry (TOPIC_Ben_pomysl, "Nie wierzê w to, ¿e mi siê uda³o! Trzeba teraz wróciæ do Bena i poinformowaæ go o sukcesie.");
	BenPomysl_Fail=3;
	
	Info_ClearChoices (DIA_NASZ_006_Renegat_siema3);
	Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "KONIEC", DIA_NASZ_006_Renegat_siema3_end);
};

FUNC VOID DIA_NASZ_006_Renegat_siema3_b()
{

	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_b_15_01"); //Przysy³a mnie Ben. On i reszta ch³opców obumieraj¹ z g³odu...
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_b_55_02"); //Gdybyœcie pracowali ciê¿ej, racje ¿ywnoœciowe by³yby wiêksze. Nie bêdziemy utrzymywali nierobów. Jazda st¹d!
	
	B_LogEntry (TOPIC_Ben_pomysl, "Niestety nie uda³o mi siê dogadaæ ze stra¿nikiem, trzeba przekazaæ Benowi smutne wieœci.");
	BenPomysl_Fail=2;

	Info_ClearChoices (DIA_NASZ_006_Renegat_siema3);
	Info_AddChoice	  (DIA_NASZ_006_Renegat_siema3, "KONIEC", DIA_NASZ_006_Renegat_siema3_end);
};

FUNC VOID DIA_NASZ_006_Renegat_siema3_a()
{

	AI_Output (other,self ,"DIA_NASZ_006_Renegat_siema3_a_15_01"); //Przychodzê w sprawie jedzenia...
	AI_Output (self, other,"DIA_NASZ_006_Renegat_siema3_a_55_02"); //Przecie¿ dostaliœcie ju¿ dzisiaj swoje przydzia³y, jeszcze wam ma³o? Jazda do kopalni albo bêdziesz ¿ar³ przez nastêpny tydzieñ ska³y i piach!
	
	B_LogEntry (TOPIC_Ben_pomysl, "Niestety nie uda³o mi siê dogadaæ ze stra¿nikiem, trzeba przekazaæ Benowi smutne wieœci.");
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
	AI_Output (self, other,"DIA_NASZ_006_Renegat_kill_15_00"); //Kogo my tu mamy? Stêskniliœmy siê za tob¹.
	AI_Output (other, self,"DIA_NASZ_006_Renegat_kill_15_01"); //Ja za wami te¿. Przyszed³em was zabiæ.
	AI_Output (self, other,"DIA_NASZ_006_Renegat_kill_15_02"); //Zabawne! Marcos, patrz kto przyszed³.
	AI_GotoWP (NASZ_009_Marcos, "OW_PATH_2_04");
	Npc_ExchangeRoutine (NASZ_011_Renegat, "GoToStart");
	AI_LookAtNpc (NASZ_006_Renegat, NASZ_009_Marcos);
	AI_LookAtNpc (NASZ_009_Marcos, NASZ_006_Renegat);
	AI_Output (self, other,"DIA_NASZ_006_Renegat_kill_15_03"); //Nasz przyjaciel chce siê nas pozbyæ. Powiesz mu, co o tym myœlimy?
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
	AI_Output (self, other,"DIA_NASZ_006_Renegat_weapon_15_00"); //Hola, hola, sk¹d masz tê broñ?
	AI_Output (self, other,"DIA_NASZ_006_Renegat_weapon_15_01"); //Oddawaj!
	
	var C_Item bron; bron = Npc_GetEquippedMeleeWeapon(hero);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 1);

	AI_Output (self, other,"DIA_NASZ_006_Renegat_weapon_15_02"); //A teraz zje¿d¿aj!
	
	Renegat06BiegnieOneTime = FALSE;
	//AI_GotoWP (hero, "OW_MINE2_03");
	AI_StopProcessInfos (self);
};

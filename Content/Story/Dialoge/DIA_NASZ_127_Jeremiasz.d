//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_EXIT   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
	nr          = 999;
	condition   = DIA_NASZ_127_Jeremiasz_EXIT_Condition;
	information = DIA_NASZ_127_Jeremiasz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_127_Jeremiasz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_127_Jeremiasz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_siema   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 1;
 	condition   = DIA_NASZ_127_Jeremiasz_siema_Condition;
 	information = DIA_NASZ_127_Jeremiasz_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_127_Jeremiasz_siema_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_siema_15_00"); //Czego chcesz?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_siema_55_01"); //Nie widzisz, �e jestem zaj�ty?

};

//*********************************************************************
//	Info What
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_what   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 2;
 	condition   = DIA_NASZ_127_Jeremiasz_what_Condition;
 	information = DIA_NASZ_127_Jeremiasz_what_Info;
 	permanent   = FALSE;
 	description = "Co robisz?";
};

FUNC INT DIA_NASZ_127_Jeremiasz_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_127_Jeremiasz_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_what_15_00"); //Co robisz?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_what_55_01"); //Destyluj� alkohol, ch�opcze.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_what_15_02"); //To niezwykle nudne zaj�cie, ale do niczego innego si� nie nadaj�.

};

//*********************************************************************
//	Info Quest
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_Quest   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 3;
 	condition   = DIA_NASZ_127_Jeremiasz_Quest_Condition;
 	information = DIA_NASZ_127_Jeremiasz_Quest_Info;
 	permanent   = FALSE;
 	description = "Potrzebujesz czego�?";
};

FUNC INT DIA_NASZ_127_Jeremiasz_Quest_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_127_Jeremiasz_Quest_Info()
{

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_Quest_15_00"); //Potrzebujesz czego�?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Quest_55_01"); //Do mojej pracy potrzebna jest cierpliwo��, kt�ra powoli mi si� ju� ko�czy.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Quest_55_02"); //Stanie ca�ymi dniami przy stole alchemicznym mo�e si� w ko�cu nudzi�. A i m�j wiek mi doskwiera. Te stare nogi ju� d�ugo nie poci�gn�.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Quest_55_03"); //Przynie� mi co� bardzo mocno odurzaj�cego, tak na uspokojenie. Tylko uprzedzam: Bagienne ziele nie wystarczy. Ju� nie raz pr�bowa�em.

	Log_CreateTopic (TOPIC_Jeremiasz_lek, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jeremiasz_lek, LOG_RUNNING);
	B_LogEntry (TOPIC_Jeremiasz_lek, "Stary gorzelnik potrzebuje czego� na uspokojenie, ale powiedzia�, �e bagienne ziele mu nie wystarczy.");

};

//*********************************************************************
//	Info QuestDone
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_QuestDone   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 4;
 	condition   = DIA_NASZ_127_Jeremiasz_QuestDone_Condition;
 	information = DIA_NASZ_127_Jeremiasz_QuestDone_Info;
 	permanent   = FALSE;
 	description = "Ta mikstura powinna przynie�� ci spok�j.";
};

FUNC INT DIA_NASZ_127_Jeremiasz_QuestDone_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_Quest))
	&& (npc_hasitems(other,ItNa_MiksturaUspokajajaca)>=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_QuestDone_Info()
{

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_QuestDone_15_00"); //Ta mikstura powinna przynie�� ci spok�j.
	B_giveinvitems (other, self, ItNa_MiksturaUspokajajaca, 1);
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_QuestDone_55_01"); //Powinienem si� ba�?
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_QuestDone_55_02"); //Nie wiem... Jaki� alchemik uspokaja� tym napojem ludzi podczas tortur.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_QuestDone_55_03"); //Je�li nie spr�buj�, to si� nie przekonam. W takim razie do dna!

	AI_StopProcessInfos(self);
	B_UseItem(self,ItNa_MiksturaUspokajajaca);
	B_LogEntry (TOPIC_Jeremiasz_lek, "Da�em Jeremiaszowi mikstur�. Chocia� szczerze m�wi�c, mam mieszane uczucia, czy dobrze zrobi�em.");

};

//*********************************************************************
//	Info AfterQuest
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_AfterQuest   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 5;
 	condition   = DIA_NASZ_127_Jeremiasz_AfterQuest_Condition;
 	information = DIA_NASZ_127_Jeremiasz_AfterQuest_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_127_Jeremiasz_AfterQuest_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_QuestDone))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_AfterQuest_Info()
{
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_AfterQuest_15_00"); //Co... Co to by�o?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_AfterQuest_55_01"); //Nie czuj� si�, w og�le, ani dobrze ani �le.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_AfterQuest_55_02"); //Troch� kr�ci mi si� w g�owie i czuj�, jak pulsuj� moje �y�y. My�l�, �e eliksir zadzia�a za jaki� czas.
	
	JeremiaszAlmostDeadDay  = Wld_GetDay();
	JeremiaszAlmostDeadHour = Wld_GetTimeHour();

	B_LogEntry (TOPIC_Jeremiasz_lek, "Starzec stwierdzi�, �e mikstura mu pomog�a, ale moim zdaniem nie wygl�da� najlepiej. Wpadn� lepiej do niego za jaki� czas, aby zobaczy�, jak �yje.");

};

//*********************************************************************
//	Info NalewkaNaSen
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_NalewkaNaSen   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 5;
 	condition   = DIA_NASZ_127_Jeremiasz_NalewkaNaSen_Condition;
 	information = DIA_NASZ_127_Jeremiasz_NalewkaNaSen_Info;
 	permanent   = FALSE;
 	description = "Poszukuj� jakiej� nalewki na dobry sen.";
};

FUNC INT DIA_NASZ_127_Jeremiasz_NalewkaNaSen_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_HowDoUFeel))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_NalewkaNaSen_Info()
{
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_NalewkaNaSen_15_00"); //Poszukuj� jakiej� nalewki na dobry sen.
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_NalewkaNaSen_15_01"); //Masz jeszcze takie na sk�adzie?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_NalewkaNaSen_55_02"); //Oczywi�cie, ale nie mam ich ju� zbyt du�o. Trudno o sk�adniki w tym zapomnianym przez bog�w miejscu.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_NalewkaNaSen_55_03"); //Jak dla ciebie, 100 sztuk z�ota.
};

//*********************************************************************
//	Info BioreJedna
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_BioreJedna   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 5;
 	condition   = DIA_NASZ_127_Jeremiasz_BioreJedna_Condition;
 	information = DIA_NASZ_127_Jeremiasz_BioreJedna_Info;
 	permanent   = FALSE;
 	description = "Dobra, bior� jedn�. (100 szt. z�ota)";
};

FUNC INT DIA_NASZ_127_Jeremiasz_BioreJedna_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_HowDoUFeel))
	&& (npc_hasitems(other,itmi_gold) >= 100)
	&& (npc_knowsinfo(other, DIA_NASZ_127_Jeremiasz_NalewkaNaSen))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_BioreJedna_Info()
{
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_BioreJedna_15_00"); //Dobra, bior� jedn�.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_BioreJedna_55_01"); //Tylko uwa�aj, ma pot�nego kopa. Ha, ha!
	
	Createinvitems (self, ItNa_NalewkaFerros, 1);
	B_giveinvitems (self, other, ItNa_NalewkaFerros, 1);
};

//*********************************************************************
//	Info Handel
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_handel (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 4;
 	condition   = DIA_NASZ_127_Jeremiasz_handel_Condition;
 	information = DIA_NASZ_127_Jeremiasz_handel_Info;
 	permanent   = FALSE;
 	description = "Sprzedasz mi co�?";
};

FUNC INT DIA_NASZ_127_Jeremiasz_handel_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_handel_Info()
{

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_handel_15_00"); //Sprzedasz mi co�?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_handel_55_01"); //Z�oto mnie nie interesuje. Je�li chcesz co� kupi�, to pogadaj z Silasem.

};


//*********************************************************************
//	Info WouldYouTeach
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_WouldYouTeach (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 5;
 	condition   = DIA_NASZ_127_Jeremiasz_WouldYouTeach_Condition;
 	information = DIA_NASZ_127_Jeremiasz_WouldYouTeach_Info;
 	permanent   = FALSE;
 	description = "Mo�esz przekaza� mi troch� swej wiedzy?";
};

FUNC INT DIA_NASZ_127_Jeremiasz_WouldYouTeach_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_WouldYouTeach_Info()
{

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_15_00"); //Mo�esz przekaza� mi troch� swej wiedzy?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_55_01"); //Nie uwa�am si� za dobrego nauczyciela, ale je�li bardzo chcesz, mo�emy porozmawia� troch� o zio�ach.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_55_02"); //Zanim zacz��em zajmowa� si� przygotowywaniem ry��wki dla obibok�w z Nowego Obozu, by�em pomocnikiem jednego z myrta�skich znachor�w.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_55_03"); //Na stole alchemicznym mo�na utworzy� mikstur� lecznicz�, ale to wiedza zarezerwowana tylko dla niewielkiej garstki os�b.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_55_04"); //Jednak, �eby wzmocni� dzia�anie zi�, wystarczy odpowiednio obchodzi� si� ze sto�em destylacyjnym, kt�rego obecnie u�ywam do produkcji niekt�rych trunk�w.

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Jeremiasz mo�e mnie nauczy� lepszego wykorzystywania zi�.");

};

//*********************************************************************
//	Info TeachTask
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_TeachTask (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 6;
 	condition   = DIA_NASZ_127_Jeremiasz_TeachTask_Condition;
 	information = DIA_NASZ_127_Jeremiasz_TeachTask_Info;
 	permanent   = FALSE;
 	description = "Naucz mnie lepiej wykorzystywa� w�a�ciwo�ci lecznicze zi�.";
};

FUNC INT DIA_NASZ_127_Jeremiasz_TeachTask_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_WouldYouTeach))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_TeachTask_Info()
{

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_TeachTask_15_00"); //Naucz mnie lepiej wykorzystywa� w�a�ciwo�ci lecznicze zi�.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_TeachTask_55_01"); //Zaraz, zaraz. Te� chc� mie� z tego jakie� korzy�ci. Powiedzmy, �e wystarczy mi porz�dny obiad i co� na zagrych�.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_TeachTask_55_02"); //Piwa uwarzy� sobie potrafi�, ale chcia�bym zje�� czasem wi�cej, ni� dostaj� dzie� w dzie�.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_TeachTask_55_03"); //Przynie� mi gulasz, chleb i kawa� szynki. A... Do tego mo�e jeszcze ze trzy jab�ka.
	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_TeachTask_15_04"); //Jak wida� nie chcesz umrze� z g�odu, staruszku. Zaraz wracam!

	Log_CreateTopic (TOPIC_Jeremiasz_skladniki, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jeremiasz_skladniki, LOG_RUNNING);
	B_LogEntry (TOPIC_Jeremiasz_skladniki, "Jeremiasz nauczy mnie korzysta� ze sto�u destylacyjnego, je�li przynios� mu gulasz, chleb, szynk� i 3 jab�ka.");

};

//*********************************************************************
//	Info MamSkladniki
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_MamSkladniki (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 6;
 	condition   = DIA_NASZ_127_Jeremiasz_MamSkladniki_Condition;
 	information = DIA_NASZ_127_Jeremiasz_MamSkladniki_Info;
 	permanent   = FALSE;
 	description = "Mam jedzenie.";
};

FUNC INT DIA_NASZ_127_Jeremiasz_MamSkladniki_Condition()
{	
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_TeachTask)
		&& (npc_hasitems (other, ItFo_Stew) >=1)
		&& (npc_hasitems (other, ItFo_Bread) >=1)
		&& (npc_hasitems (other, ItFo_Bacon) >=1)
		&& (npc_hasitems (other, ItFo_Apple) >=3))
		{
			return TRUE;
		};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_MamSkladniki_Info()
{

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_MamSkladniki_15_00"); //Mam jedzenie.
	B_giveinvitems (other, self, ItFo_Stew, 1);
	B_giveinvitems (other, self, ItFo_Bread, 1);
	B_giveinvitems (other, self, ItFo_Bacon, 1);
	B_giveinvitems (other, self, ItFo_Apple, 3);
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_MamSkladniki_55_01"); //O tak!
	B_UseItem (self, ItFo_Bacon);
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_MamSkladniki_55_02"); //Je�li chcesz, naucz� ci� tego i owego. Ale nic za darmo!

	B_GivePlayerXP (300);
	DodajReputacje (2, REP_LOWCY);	

	Log_SetTopicStatus (TOPIC_Jeremiasz_skladniki, LOG_SUCCESS);
	B_LogEntry (TOPIC_Jeremiasz_skladniki, "Przynios�em sk�adniki. Teraz mog� nauczy� si� lepiej wykorzystywa� zio�a.");

};

func void JeremiaszSay_NoMoney() {
	AI_Output (self, other,"JeremiaszSay_NoMoney_15_00"); //Nie masz do�� z�ota.
};

func void JeremiaszSay_NoExp() {
	AI_Output (self, other,"JeremiaszSay_NoExp_15_00"); //Brak ci do�wiadczenia.
};

func void HeroSay_TeachMeZielarstwo() {
	AI_Output (other, self,"HeroSay_TeachMeZielarstwo_15_00"); //Naucz mnie zielarstwa.
};

//*********************************************************************
//	         Zielarstwo1
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_Zielarstwo1   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 100;
 	condition   = DIA_NASZ_127_Jeremiasz_Zielarstwo1_Condition;
 	information = DIA_NASZ_127_Jeremiasz_Zielarstwo1_Info;
 	permanent   = TRUE;
 	description = "Naucz mnie zielarstwa. (500 szt. z�ota) (Poziom 1: 10 PN)";
};

FUNC INT DIA_NASZ_127_Jeremiasz_Zielarstwo1_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_MamSkladniki)
		&& (level_zielarstwa < 1))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_Zielarstwo1_Info()
{
	HeroSay_TeachMeZielarstwo();
	
	if (npc_hasitems (other, ItMi_Gold) < 500) {
		JeremiaszSay_NoMoney();
	}
	else {

		if (hero.lp >= 10){
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_55_00"); //Tak jak m�wi�em, na stole destylacyjnym mo�esz uwarzy� specjalne wywary. Musisz tylko nauczy� si� go obs�ugiwa�.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_01"); //Podejd� do sto�u i we� pust� buelk�. We� ma�y no�yk i delikatnie nakr�j korze� ro�liny.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_02"); //Sok, kt�ry si� wyleje, wlej do pojemniczka na stole. Powinna by� tam te� ska�a krystaliczna. Musisz zamoczy� j� w tej cieczy.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_03"); //W czasie, gdy ska�a b�dzie si� namacza�, ty posiekaj w drobny maczek li�cie ro�liny i wsyp do buteleczki. Zalej to wod�, je�li chcesz, mo�esz tam te� naplu�. Ha, ha!
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_04"); //Teraz dolej soku �odygi, zakorkuj i mocno wstrz��nij.
			AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_05"); //Co z reszt� �odygi?
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_06"); //Jest bez soku, mo�esz j� wyrzuci�.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_07"); //Gdyby� by� zainteresowany, mo�esz rzuci� okiem do kt�rej�� z ksi��ek le��cych na stole.
			
			B_GiveInvItems (other, self, ItMi_Gold, 500);			
			level_zielarstwa = 1;
			hero.lp = hero.lp - 10;

			PrintScreen ("Nauka: Zielarstwo", -1, -1, FONT_Screen, 2);

			Npc_SetTalentSkill 	(hero, NPC_TALENT_E, 1);
		}

		else {
			JeremiaszSay_NoExp();
		};
	};
};

//*********************************************************************
//	         Zielarstwo2
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_Zielarstwo2   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 101;
 	condition   = DIA_NASZ_127_Jeremiasz_Zielarstwo2_Condition;
 	information = DIA_NASZ_127_Jeremiasz_Zielarstwo2_Info;
 	permanent   = TRUE;
 	description = "Naucz mnie zielarstwa. (1000 szt. z�ota) (Poziom 2: 20 PN)";
};

FUNC INT DIA_NASZ_127_Jeremiasz_Zielarstwo2_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_MamSkladniki)
		&& (level_zielarstwa == 1))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_127_Jeremiasz_Zielarstwo2_Info()
{
	HeroSay_TeachMeZielarstwo();
	
	if (npc_hasitems (other, ItMi_Gold) < 1000) {
		JeremiaszSay_NoMoney();
	}
	else {
		if (hero.lp >= 20){
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_55_00"); //A wi�c chcia�by� dowiedzie� si� czego� jeszcze?
			AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_55_01"); //Proces wytwarzania tych mieszanek jest troch� d�ugi, a ja nie mam czasu za ka�dym razem tutaj przychodzi�.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_02"); //Prawdziwy znawca ro�lin potrafi obej�� si� bez tworzenia mieszanki.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_03"); //Pami�tasz, jak wspomina�em o tym, �e zamiast dolewa� wody mo�esz naplu� do �rodka?
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_04"); //To nie by� �art. �lina ma specyficzne w�a�ciwo�ci. Wystarczy wiedzie�, jak nadgry�� korze�.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_05"); //Przede wszystkim podczas zbierania staraj si� odrywa� ro�lin� jak najbli�ej ziemi. Potem przegry� korze� od spodu i wys�cz p�yn.
			AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_55_06"); //Wydaje si� obrzydliwe...
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_07"); //M�odzie�cze, je�li chcesz �y� tak d�ugo jak ja, to mo�e warto wypr�bowa� moje techniki?
			AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_55_08"); //Je�li tylko mi to pomo�e, to na pewno!
			
			B_GiveInvItems (other, self, ItMi_Gold, 1000);		
			level_zielarstwa = 2;
			hero.lp = hero.lp - 20;
			
			PrintScreen ("Nauka: Zielarstwo", -1, -1, FONT_Screen, 2);
			
			PlantSkill_Factor = 2;
			Npc_SetTalentSkill 	(hero, NPC_TALENT_E, 2);
		}

		else {
			JeremiaszSay_NoExp();
		};
	};
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_127_Jeremiasz_HowAreYou   (C_INFO)
{
	npc         = NASZ_127_Jeremiasz;
 	nr          = 500;
 	condition   = DIA_NASZ_127_Jeremiasz_HowAreYou_Condition;
 	information = DIA_NASZ_127_Jeremiasz_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak idzie praca?";
};

FUNC INT DIA_NASZ_127_Jeremiasz_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_127_Jeremiasz_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_HowAreYou_15_00"); //Jak idzie praca?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_HowAreYou_55_01"); //Nie mog� narzeka�, cho� ci �owcy tyle pij�, �e ledwo wyrabiam.

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_127_Jeremiasz_PICKPOCKET (C_INFO)
{
	npc			= NASZ_127_Jeremiasz;
	nr			= 900;
	condition	= DIA_NASZ_127_Jeremiasz_PICKPOCKET_Condition;
	information	= DIA_NASZ_127_Jeremiasz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_127_Jeremiasz_PICKPOCKET_Condition()
{
	C_Beklauen (7);
};
 
FUNC VOID DIA_NASZ_127_Jeremiasz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_127_Jeremiasz_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_127_Jeremiasz_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_127_Jeremiasz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_127_Jeremiasz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_127_Jeremiasz_PICKPOCKET_DoIt);
};

func void DIA_NASZ_127_Jeremiasz_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItFo_Beer,8);
	
	Info_ClearChoices (DIA_NASZ_127_Jeremiasz_PICKPOCKET);
};
	
func void DIA_NASZ_127_Jeremiasz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_127_Jeremiasz_PICKPOCKET);
};
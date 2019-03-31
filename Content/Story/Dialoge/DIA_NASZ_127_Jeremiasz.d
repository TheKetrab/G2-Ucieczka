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
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_siema_55_01"); //Nie widzisz, ¿e jestem zajêty?

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
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_what_55_01"); //Destylujê alkohol, ch³opcze.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_what_15_02"); //To niezwykle nudne zajêcie, ale do niczego innego siê nie nadajê.

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
 	description = "Potrzebujesz czegoœ?";
};

FUNC INT DIA_NASZ_127_Jeremiasz_Quest_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_127_Jeremiasz_Quest_Info()
{

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_Quest_15_00"); //Potrzebujesz czegoœ?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Quest_55_01"); //Do mojej pracy potrzebna jest cierpliwoœæ, która powoli mi siê ju¿ koñczy.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Quest_55_02"); //Stanie ca³ymi dniami przy stole alchemicznym mo¿e siê w koñcu nudziæ. A i mój wiek mi doskwiera. Te stare nogi ju¿ d³ugo nie poci¹gn¹.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Quest_55_03"); //Przynieœ mi coœ bardzo mocno odurzaj¹cego, tak na uspokojenie. Tylko uprzedzam: Bagienne ziele nie wystarczy. Ju¿ nie raz próbowa³em.

	Log_CreateTopic (TOPIC_Jeremiasz_lek, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jeremiasz_lek, LOG_RUNNING);
	B_LogEntry (TOPIC_Jeremiasz_lek, "Stary gorzelnik potrzebuje czegoœ na uspokojenie, ale powiedzia³, ¿e bagienne ziele mu nie wystarczy.");

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
 	description = "Ta mikstura powinna przynieœæ ci spokój.";
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

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_QuestDone_15_00"); //Ta mikstura powinna przynieœæ ci spokój.
	B_giveinvitems (other, self, ItNa_MiksturaUspokajajaca, 1);
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_QuestDone_55_01"); //Powinienem siê baæ?
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_QuestDone_55_02"); //Nie wiem... Jakiœ alchemik uspokaja³ tym napojem ludzi podczas tortur.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_QuestDone_55_03"); //Jeœli nie spróbujê, to siê nie przekonam. W takim razie do dna!

	AI_StopProcessInfos(self);
	B_UseItem(self,ItNa_MiksturaUspokajajaca);
	B_LogEntry (TOPIC_Jeremiasz_lek, "Da³em Jeremiaszowi miksturê. Chocia¿ szczerze mówi¹c, mam mieszane uczucia, czy dobrze zrobi³em.");

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
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_AfterQuest_15_00"); //Co... Co to by³o?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_AfterQuest_55_01"); //Nie czujê siê, w ogóle, ani dobrze ani Ÿle.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_AfterQuest_55_02"); //Trochê krêci mi siê w g³owie i czujê, jak pulsuj¹ moje ¿y³y. Myœlê, ¿e eliksir zadzia³a za jakiœ czas.
	
	JeremiaszAlmostDeadDay  = Wld_GetDay();
	JeremiaszAlmostDeadHour = Wld_GetTimeHour();

	B_LogEntry (TOPIC_Jeremiasz_lek, "Starzec stwierdzi³, ¿e mikstura mu pomog³a, ale moim zdaniem nie wygl¹da³ najlepiej. Wpadnê lepiej do niego za jakiœ czas, aby zobaczyæ, jak ¿yje.");

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
 	description = "Poszukujê jakiejœ nalewki na dobry sen.";
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
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_NalewkaNaSen_15_00"); //Poszukujê jakiejœ nalewki na dobry sen.
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_NalewkaNaSen_15_01"); //Masz jeszcze takie na sk³adzie?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_NalewkaNaSen_55_02"); //Oczywiœcie, ale nie mam ich ju¿ zbyt du¿o. Trudno o sk³adniki w tym zapomnianym przez bogów miejscu.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_NalewkaNaSen_55_03"); //Jak dla ciebie, 100 sztuk z³ota.
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
 	description = "Dobra, biorê jedn¹. (100 szt. z³ota)";
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
	AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_BioreJedna_15_00"); //Dobra, biorê jedn¹.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_BioreJedna_55_01"); //Tylko uwa¿aj, ma potê¿nego kopa. Ha, ha!
	
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
 	description = "Sprzedasz mi coœ?";
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

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_handel_15_00"); //Sprzedasz mi coœ?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_handel_55_01"); //Z³oto mnie nie interesuje. Jeœli chcesz coœ kupiæ, to pogadaj z Silasem.

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
 	description = "Mo¿esz przekazaæ mi trochê swej wiedzy?";
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

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_15_00"); //Mo¿esz przekazaæ mi trochê swej wiedzy?
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_55_01"); //Nie uwa¿am siê za dobrego nauczyciela, ale jeœli bardzo chcesz, mo¿emy porozmawiaæ trochê o zio³ach.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_55_02"); //Zanim zacz¹³em zajmowaæ siê przygotowywaniem ry¿ówki dla obiboków z Nowego Obozu, by³em pomocnikiem jednego z myrtañskich znachorów.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_55_03"); //Na stole alchemicznym mo¿na utworzyæ miksturê lecznicz¹, ale to wiedza zarezerwowana tylko dla niewielkiej garstki osób.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_WouldYouTeach_55_04"); //Jednak, ¿eby wzmocniæ dzia³anie zió³, wystarczy odpowiednio obchodziæ siê ze sto³em destylacyjnym, którego obecnie u¿ywam do produkcji niektórych trunków.

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Jeremiasz mo¿e mnie nauczyæ lepszego wykorzystywania zió³.");

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
 	description = "Naucz mnie lepiej wykorzystywaæ w³aœciwoœci lecznicze zió³.";
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

	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_TeachTask_15_00"); //Naucz mnie lepiej wykorzystywaæ w³aœciwoœci lecznicze zió³.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_TeachTask_55_01"); //Zaraz, zaraz. Te¿ chcê mieæ z tego jakieœ korzyœci. Powiedzmy, ¿e wystarczy mi porz¹dny obiad i coœ na zagrychê.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_TeachTask_55_02"); //Piwa uwarzyæ sobie potrafiê, ale chcia³bym zjeœæ czasem wiêcej, ni¿ dostajê dzieñ w dzieñ.
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_TeachTask_55_03"); //Przynieœ mi gulasz, chleb i kawa³ szynki. A... Do tego mo¿e jeszcze ze trzy jab³ka.
	AI_Output (other,self ,"DIA_NASZ_127_Jeremiasz_TeachTask_15_04"); //Jak widaæ nie chcesz umrzeæ z g³odu, staruszku. Zaraz wracam!

	Log_CreateTopic (TOPIC_Jeremiasz_skladniki, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jeremiasz_skladniki, LOG_RUNNING);
	B_LogEntry (TOPIC_Jeremiasz_skladniki, "Jeremiasz nauczy mnie korzystaæ ze sto³u destylacyjnego, jeœli przyniosê mu gulasz, chleb, szynkê i 3 jab³ka.");

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
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_MamSkladniki_55_02"); //Jeœli chcesz, nauczê ciê tego i owego. Ale nic za darmo!

	B_GivePlayerXP (300);
	DodajReputacje (2, REP_LOWCY);	

	Log_SetTopicStatus (TOPIC_Jeremiasz_skladniki, LOG_SUCCESS);
	B_LogEntry (TOPIC_Jeremiasz_skladniki, "Przynios³em sk³adniki. Teraz mogê nauczyæ siê lepiej wykorzystywaæ zio³a.");

};

func void JeremiaszSay_NoMoney() {
	AI_Output (self, other,"JeremiaszSay_NoMoney_15_00"); //Nie masz doœæ z³ota.
};

func void JeremiaszSay_NoExp() {
	AI_Output (self, other,"JeremiaszSay_NoExp_15_00"); //Brak ci doœwiadczenia.
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
 	description = "Naucz mnie zielarstwa. (500 szt. z³ota) (Poziom 1: 10 PN)";
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
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_55_00"); //Tak jak mówi³em, na stole destylacyjnym mo¿esz uwarzyæ specjalne wywary. Musisz tylko nauczyæ siê go obs³ugiwaæ.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_01"); //PodejdŸ do sto³u i weŸ pust¹ buelkê. WeŸ ma³y no¿yk i delikatnie nakrój korzeñ roœliny.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_02"); //Sok, który siê wyleje, wlej do pojemniczka na stole. Powinna byæ tam te¿ ska³a krystaliczna. Musisz zamoczyæ j¹ w tej cieczy.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_03"); //W czasie, gdy ska³a bêdzie siê namaczaæ, ty posiekaj w drobny maczek liœcie roœliny i wsyp do buteleczki. Zalej to wod¹, jeœli chcesz, mo¿esz tam te¿ napluæ. Ha, ha!
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_04"); //Teraz dolej soku ³odygi, zakorkuj i mocno wstrz¹œnij.
			AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_05"); //Co z reszt¹ ³odygi?
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_06"); //Jest bez soku, mo¿esz j¹ wyrzuciæ.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo1_15_07"); //Gdybyœ by³ zainteresowany, mo¿esz rzuciæ okiem do którejœæ z ksi¹¿ek le¿¹cych na stole.
			
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
 	description = "Naucz mnie zielarstwa. (1000 szt. z³ota) (Poziom 2: 20 PN)";
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
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_55_00"); //A wiêc chcia³byœ dowiedzieæ siê czegoœ jeszcze?
			AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_55_01"); //Proces wytwarzania tych mieszanek jest trochê d³ugi, a ja nie mam czasu za ka¿dym razem tutaj przychodziæ.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_02"); //Prawdziwy znawca roœlin potrafi obejœæ siê bez tworzenia mieszanki.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_03"); //Pamiêtasz, jak wspomina³em o tym, ¿e zamiast dolewaæ wody mo¿esz napluæ do œrodka?
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_04"); //To nie by³ ¿art. Œlina ma specyficzne w³aœciwoœci. Wystarczy wiedzieæ, jak nadgryŸæ korzeñ.
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_05"); //Przede wszystkim podczas zbierania staraj siê odrywaæ roœlinê jak najbli¿ej ziemi. Potem przegryŸ korzeñ od spodu i wys¹cz p³yn.
			AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_55_06"); //Wydaje siê obrzydliwe...
			AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_15_07"); //M³odzieñcze, jeœli chcesz ¿yæ tak d³ugo jak ja, to mo¿e warto wypróbowaæ moje techniki?
			AI_Output (other, self,"DIA_NASZ_127_Jeremiasz_Zielarstwo2_55_08"); //Jeœli tylko mi to pomo¿e, to na pewno!
			
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
	AI_Output (self, other,"DIA_NASZ_127_Jeremiasz_HowAreYou_55_01"); //Nie mogê narzekaæ, choæ ci ³owcy tyle pij¹, ¿e ledwo wyrabiam.

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
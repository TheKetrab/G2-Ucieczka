var int Kara1kZaNauke;

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_EXIT   (C_INFO)
{
	npc         = NASZ_223_Ratford;
	nr          = 999;
	condition   = DIA_NASZ_223_Ratford_EXIT_Condition;
	information = DIA_NASZ_223_Ratford_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_223_Ratford_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_223_Ratford_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_siema   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 1;
 	condition   = DIA_NASZ_223_Ratford_siema_Condition;
 	information = DIA_NASZ_223_Ratford_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_223_Ratford_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_223_Ratford_siema_15_00"); //W czym mogê ci pomóc?
		
};

//*********************************************************************
//	Info Nauka
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_nauka   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 2;
 	condition   = DIA_NASZ_223_Ratford_nauka_Condition;
 	information = DIA_NASZ_223_Ratford_nauka_Info;
 	permanent   = FALSE;
 	description = "Chcê siê czegoœ nauczyæ.";
};

FUNC INT DIA_NASZ_223_Ratford_nauka_Condition()
{
	if (GothSaidAboutTeacher == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_nauka_Info()
{
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_nauka_15_00"); //Chcê siê czegoœ nauczyæ.
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_nauka_15_01"); //Goth wskaza³ mi ciebie, jako osobê, która potencjalnie mog³aby mi coœ pokazaæ.
	AI_PlayAni(self, "T_SEARCH");
	AI_Output (self, other,"DIA_NASZ_223_Ratford_nauka_55_02"); //Dobrze trafi³eœ. Jestem specjalist¹ w sztuce z³odziejskiej.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_nauka_55_03"); //Takie umiejêtnoœci s¹ bezcenne. Nigdy nie brakuje ci z³ota, bo tak naprawdê sakiewki ludzi obok ciebie s¹ w zasadzie twoje.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_nauka_55_04"); //Ale pamiêtaj, ¿e swoj¹ wiedz¹ podzielê siê tylko wieczorem, gdy jestem przy ognisku.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_nauka_55_05"); //Gestath ca³y czas krzywo na mnie patrzy i pos¹dza o kradzie¿e. Ciekawe, co by by³o, gdyby dowiedzia³ siê, ¿e szkolê nowego z³odziejaszka.
	
	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Ratford specjalizuje siê w sztuce z³odziejstwa. Mogê zg³aszaæ siê do niego tylko wtedy, gdy siedzi przy ognisku, poniewa¿ Gestath nie mo¿e siê o tym dowiedzieæ.");	
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_223_Ratford_Teach		(C_INFO)
{
	npc	  	    = NASZ_223_Ratford;
	nr          = 3;
	condition   = DIA_NASZ_223_Ratford_Teach_Condition;
	information = DIA_NASZ_223_Ratford_Teach_Info;
	permanent   = TRUE;
	description = "Chcia³bym siê czegoœ nauczyæ.";
};

func int DIA_NASZ_223_Ratford_Teach_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_223_Ratford_nauka))
	&& ((Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
		||(Npc_GetTalentSkill (other, NPC_TALENT_ACROBAT) == FALSE)
		||(Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE)
		||(Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NASZ_223_Ratford_Teach_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_223_Ratford_Teach_15_00"); //Chcia³bym siê czegoœ nauczyæ.

	if (Kara1kZaNauke == TRUE)
	{
		AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_03_01"); //Wci¹¿ nie da³eœ mi 1000 sztuk z³ota, na które siê umawialiœmy.
	}
	else if (Npc_GetDistToWP	(self, "NASZ_MYSLIWI_BALKON_05") >=750)
	{
		AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_03_02"); //NIE WIEM, O CZYM MÓWISZ.
	}
	else
	{
	
		AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_03_03"); //Czego teraz?

		Info_ClearChoices	(DIA_NASZ_223_Ratford_Teach);	
		Info_AddChoice		(DIA_NASZ_223_Ratford_Teach, DIALOG_BACK, DIA_NASZ_223_Ratford_Teach_BACK);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
		{ 
			Info_AddChoice	  (DIA_NASZ_223_Ratford_Teach, "Kradzie¿ kieszonkowa. (5 PN, 100 szt. z³ota)", DIA_NASZ_223_Ratford_Teach_PICKPOCKET);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_ACROBAT) == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_223_Ratford_Teach, "Akrobatyka. (5 PN, 100 szt. z³ota)",  DIA_NASZ_223_Ratford_Teach_ACROBAT);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_223_Ratford_Teach, "Skradanie siê. (5 PN, 100 szt. z³ota)",  DIA_NASZ_223_Ratford_Teach_SNEAK);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_223_Ratford_Teach, "Otwieranie zamków. (5 PN, 100 szt. z³ota)",  DIA_NASZ_223_Ratford_Teach_PICKLOCK);
		};
		
	};

};

func void Ratford_Say_No_Money_To_Teach() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_No_Money_To_Teach_55_00"); //Jeœli nie dasz mi z³ota, to nic ci nie poka¿ê.
};

func void Ratford_Say_No_Exp_To_Teach() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_No_Ex_To_Teach_55_00"); //Brak ci doœwiadczenia.
};

func void DIA_NASZ_223_Ratford_Teach_BACK()
{
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == TRUE) && (Npc_GetTalentSkill (other, NPC_TALENT_ACROBAT) == TRUE) && (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == TRUE) && (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_BACK_03_00"); //Opanowa³eœ wszystkie z³odziejskie sztuczki. Gratulujê!
		B_GivePlayerXP (1000);
	};

	Info_ClearChoices	(DIA_NASZ_223_Ratford_Teach);
};

	// ------ PICKPOCKET ------
func void DIA_NASZ_223_Ratford_Teach_PICKPOCKET()
{
	if (npc_hasitems (other, ItMi_Gold) < 100) {
		Ratford_Say_No_Money_To_Teach();
		return;
	};

	if (hero.lp < 5) {
		Ratford_Say_No_Exp_To_Teach();
		return;
	};
	
	B_GiveInvItems (other, self, ItMi_Gold, 100);	

	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKPOCKET_03_00"); //Twoim g³ównym zadaniem jest odwróciæ uwagê ofiary.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKPOCKET_03_01"); //Poka¿ jej coœ albo poopowiadaj o g³upotach. Warto te¿ nie uciekaæ zaraz po dokonaniu kradzie¿y.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKPOCKET_03_02"); //Wtedy wyda siê to podejrzane, nie s¹dzisz?
	
	NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
	Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
	B_LogEntry (TOPIC_TalentThief,"Wiem, jak okradaæ innych.");
	PrintScreen ("Nauka: fach z³odziejski", -1, -1, FONT_Screen, 2);

	Npc_SetTalentSkill 	(hero, NPC_TALENT_PICKPOCKET, 1);
	Npc_SetTalentSkill 	(hero, 6, NauczoneZlodziejskie); //umiejetnosc Fach zlodziejski
	hero.lp = hero.lp - 5;


	//Info_ClearChoices	(DIA_NASZ_223_Ratford_Teach);	
};

	// ------ ACROBAT ------
func void DIA_NASZ_223_Ratford_Teach_ACROBAT()
{
	if (npc_hasitems (other, ItMi_Gold) < 100) {
		Ratford_Say_No_Money_To_Teach();
		return;
	};

	if (hero.lp < 5) {
		Ratford_Say_No_Exp_To_Teach();
		return;
	};

	B_GiveInvItems (other, self, ItMi_Gold, 100);

	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_ACROBAT_03_04"); //Po ka¿dym skoku l¹duj robi¹c przewrót. Zwiêkszy to szybkoœæ wykonywanych manewrów.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_ACROBAT_03_05"); //Korzystaj¹c z tego, w nied³ugim czasie sam nauczysz siê skakaæ na wiêksze odleg³oœci.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_ACROBAT_03_06"); //Wykonuj¹c taki przewrót, mo¿na z³agodziæ efekt upadku z du¿ej wysokoœci. Tylko nie myœl sobie, ¿e bêdziesz móg³ skakaæ bóg wie sk¹d!

	NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
	Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
	B_LogEntry (TOPIC_TalentThief,"Posiad³em umiejêtnoœæ akrobatyki.");
	PrintScreen ("Nauka: fach z³odziejski", -1, -1, FONT_Screen, 2);

	Npc_SetTalentSkill 	(hero, NPC_TALENT_ACROBAT, 1);
	Npc_SetTalentSkill 	(hero, 6, NauczoneZlodziejskie); //umiejetnosc Fach zlodziejski
	hero.lp = hero.lp - 5;

	//Info_ClearChoices	(DIA_NASZ_223_Ratford_Teach);
};

	// ------ SNEAK ------
func void DIA_NASZ_223_Ratford_Teach_SNEAK()
{
	if (npc_hasitems (other, ItMi_Gold) < 100) {
		Ratford_Say_No_Money_To_Teach();
		return;
	};

	if (hero.lp < 5) {
		Ratford_Say_No_Exp_To_Teach();
		return;
	};

	B_GiveInvItems (other, self, ItMi_Gold, 100);

	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_SNEAK_03_08"); //Umiejêtnoœæ skradania siê jest niezwykle wa¿na dla ka¿dego z³odzieja. No i oczywiœcie dla myœliwego!
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_SNEAK_03_09"); //Przede wszystkim nie tup tak! Zawsze stawiaj stopy powoli, od piêt.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_SNEAK_03_10"); //Chodzenie na palcach wbrew temu co mówi¹ ludzie, nie jest takie dobre. Stopy szybko siê mêcz¹ i ju¿ po chwili tracimy efektywnoœæ.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_SNEAK_03_11"); //Pamiêtaj o tym.

	NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
	Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
	B_LogEntry (TOPIC_TalentThief,"Umiem siê skradaæ.");
	PrintScreen ("Nauka: fach z³odziejski", -1, -1, FONT_Screen, 2);

	Npc_SetTalentSkill 	(hero, NPC_TALENT_SNEAK, 1);
	Npc_SetTalentSkill 	(hero, 6, NauczoneZlodziejskie); //umiejetnosc Fach zlodziejski
	hero.lp = hero.lp - 5;

	//Info_ClearChoices	(DIA_NASZ_223_Ratford_Teach);
};

	// ------ PICKLOCK ------
func void DIA_NASZ_223_Ratford_Teach_PICKLOCK()
{
	if (npc_hasitems (other, ItMi_Gold) < 100) {
		Ratford_Say_No_Money_To_Teach();
		return;
	};

	if (hero.lp < 5) {
		Ratford_Say_No_Exp_To_Teach();
		return;
	};

	B_GiveInvItems (other, self, ItMi_Gold, 100);

	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_13"); //Potrzeba do tego wiele uczucia i intuicji. No, i kilka dobrych wytrychów. Chêtnie sprzedam ci kilka.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_14"); //Niektóre skrzynie s¹ jednak zabezpieczone zamkami, daj¹cymi siê otworzyæ tylko przez u¿ycie odpowiedniego klucza.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_15"); //Tak wiêc, klêcz¹c przy zamku, nale¿y ³agodnie obróciæ wytrych, w lewo i w prawo.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_16"); //Jeœli obrócisz go zbyt szybko lub zbyt mocno - z³amie siê.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_17"); //Z czasem nabierzesz wprawy w pos³ugiwaniu siê tym narzêdziem.

	NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
	Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
	B_LogEntry (TOPIC_TalentThief,"Potrafiê otwieraæ zamki.");
	PrintScreen ("Nauka: fach z³odziejski", -1, -1, FONT_Screen, 2);
	
	Log_CreateTopic (TOPIC_MysliwiTrader,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTrader,"Ratford sprzeda mi wytrychy.");	

	Npc_SetTalentSkill 	(hero, NPC_TALENT_PICKLOCK, 1);
	Npc_SetTalentSkill 	(hero, 6, NauczoneZlodziejskie); //umiejetnosc Fach zlodziejski
	hero.lp = hero.lp - 5;

	//Info_ClearChoices	(DIA_NASZ_223_Ratford_Teach);
};

var int RatfordTrzyDni; // siedem dni :)
//*********************************************************************
//	Info Zadanie
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_zadanie   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 4;
 	condition   = DIA_NASZ_223_Ratford_zadanie_Condition;
 	information = DIA_NASZ_223_Ratford_zadanie_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_223_Ratford_zadanie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_223_Ratford_nauka))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_zadanie_Info()
{
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_15_00"); //Hej, czekaj!
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_55_01"); //Teraz ju¿ wiesz, kim jestem. Nie mam gwarancji, ¿e nie pójdziesz z tym do szefa i nakablujesz na mnie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_55_02"); //Zwêdzisz coœ w obozie. Bêdziemy wtedy jechaæ na tym samym wózku.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_zadanie_55_03"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_55_04"); //Okradniesz naszego drwala. W jego skrzyni z pewnoœci¹ jest coœ ciekawego.
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_zadanie_15_05"); //Bu³ka z mas³em. Œwietne æwiczenie, jak na pocz¹tek.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_55_06"); //Zobaczymy! Masz tydzieñ. Jeœli zawalisz, to uznam, ¿e przekazywanie ci mojej wiedzy to by³ z³y pomys³.

	Log_CreateTopic (TOPIC_Ratford_zlodziejaszek, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ratford_zlodziejaszek, LOG_RUNNING);
	B_LogEntry (TOPIC_Ratford_zlodziejaszek, "Ratford nakaza³ mi opró¿niæ kufer drwala myœliwych. Mam na to tydzieñ. Cholera, ten cz³owiek przebywa w jej pobli¿u ca³y czas!");

	RatfordTrzyDni = Wld_GetDay();
	
};

//*********************************************************************
//	Info ZadanieFail
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_ZadanieFail   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 4;
 	condition   = DIA_NASZ_223_Ratford_ZadanieFail_Condition;
 	information = DIA_NASZ_223_Ratford_ZadanieFail_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_223_Ratford_ZadanieFail_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_223_Ratford_Zadanie))
	  && (!npc_knowsinfo (other, DIA_NASZ_223_Ratford_koniec))
	  && (TimeIsUp(7,-1,RatfordTrzyDni,-1)) // siedem dni :)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_ZadanieFail_Info()
{
	AI_Output (self, other,"DIA_NASZ_223_Ratford_ZadanieFail_15_00"); //Nie przyszed³eœ do mnie w ci¹gu siedmiu dni. Wiedzia³em, ¿e nie warto ciê by³o niczego uczyæ.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_ZadanieFail_55_01"); //Co ty sobie, gnojku, wyobra¿asz? Nie nauczê ciê niczego, dopóki nie zap³acisz mi 1000 sztuk z³ota.

	Kara1kZaNauke = TRUE;

	Log_SetTopicStatus (TOPIC_Ratford_zlodziejaszek, LOG_FAILED);
	B_LogEntry (TOPIC_Ratford_zlodziejaszek, "Nie zd¹¿y³em okraœæ Cappela i teraz muszê zap³aciæ Ratfordowi sporo pieniêdzy, ¿eby mnie czegoœ nauczy³. A niech to!");
	
};

//*********************************************************************
//	Info GottaPay
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_GottaPay   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 4;
 	condition   = DIA_NASZ_223_Ratford_GottaPay_Condition;
 	information = DIA_NASZ_223_Ratford_GottaPay_Info;
 	permanent   = FALSE;
 	description = "Uzbiera³em 1000 monet.";
};

FUNC INT DIA_NASZ_223_Ratford_GottaPay_Condition()
{
	if (Kara1kZaNauke == TRUE)
	  && (npc_hasitems (other, ItMi_Gold) >= 1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_GottaPay_Info()
{
	AI_Output (other, self,"DIA_NASZ_223_Ratford_GottaPay_15_00"); //Uzbiera³em 1000 monet.
	B_Giveinvitems (other, self, ItMi_Gold, 1000);
	AI_Output (self, other,"DIA_NASZ_223_Ratford_GottaPay_55_01"); //A wiêc zgodnie z umow¹ nauczê ciê, czego zechcesz.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_GottaPay_55_02"); //Ale pamiêtaj, przychodŸ tylko, gdy jestem przy ognisku!	

	Kara1kZaNauke = FALSE;
};


//*********************************************************************
//	Info Koniec
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_koniec   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 5;
 	condition   = DIA_NASZ_223_Ratford_koniec_Condition;
 	information = DIA_NASZ_223_Ratford_koniec_Info;
 	permanent   = FALSE;
 	description = "Spl¹drowa³em kufer.";
};

FUNC INT DIA_NASZ_223_Ratford_koniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_223_Ratford_zadanie)
	&& npc_hasitems (other, ItNa_ZapasowaPila) >=1)
	&& !TimeIsUp(7,-1,RatfordTrzyDni,-1) // siedem dni :)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_koniec_Info()
{
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_koniec_15_00"); //Spl¹drowa³em kufer.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_koniec_55_01"); //Znalaz³eœ coœ ciekawego?	
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_koniec_15_02"); //Znalaz³em tak¹ pi³ê.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_koniec_55_03"); //Oddaj mi j¹. Schowam j¹ przed Cappelem. Przyda mi siê, w razie gdyby drwal og³osi³, ¿e odda parê sztuk z³ota uczciwemu znalazcy.
	B_giveinvitems (other, self, ItNa_ZapasowaPila, 1);
	AI_Output (self, other,"DIA_NASZ_223_Ratford_koniec_55_04"); //Nawet nie wiesz, jak g³upi i œlepi s¹ ludzie. Ju¿ nieraz odwala³em takie akcje i nieŸle siê na tym wzbogaci³em.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_koniec_55_05"); //NieŸle siê spisa³eœ. Masz tutaj parê z³otych monet.
	
	Createinvitems (self, itmi_gold, 50);
	B_giveinvitems (self, other, itmi_gold, 50);

	B_LogEntry (TOPIC_Ratford_zlodziejaszek, "Ratford dosta³ pi³ê. Mam tylko nadziejê, ¿e nie bêdê mia³ przez to k³opotów.");
	Log_SetTopicStatus (TOPIC_Ratford_zlodziejaszek, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (2, REP_MYSLIWI);

};

//*********************************************************************
//	Info Klucz
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_klucz   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 6;
 	condition   = DIA_NASZ_223_Ratford_klucz_Condition;
 	information = DIA_NASZ_223_Ratford_klucz_Info;
 	permanent   = FALSE;
 	description = "Daj mi klucz do szczytu wielkiego domu.";
};

FUNC INT DIA_NASZ_223_Ratford_klucz_Condition()
{
	if (WRZOD_KLUCZ == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_klucz_Info()
{
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_klucz_15_00"); //Daj mi klucz do szczytu wielkiego domu.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_klucz_55_01"); //CO?!
	AI_Output (self, other,"DIA_NASZ_223_Ratford_klucz_55_02"); //Cz³owieku, ty chyba nie wiesz, o czym mówisz! Myœlisz, ¿e te drzwi s¹ zamkniête tak bez powodu?
	AI_Output (other, self,"DIA_NASZ_223_Ratford_klucz_55_03"); //W takim razie rozwi¹¿my to trochê inaczej: Ile sobie liczysz za ten klucz?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_klucz_55_04"); //Pakujesz siê w k³opoty... Piêædziesi¹t sztuk z³ota i po¿yczê ci klucz. Jeœli mam mieæ przez to k³opoty, to wolê byæ trochê do przodu w kwestii z³ota.

	B_LogEntry (TOPIC_Aran_quest, "Za 50 sztuk z³ota Ratford po¿yczy mi klucz.");

};

//*********************************************************************
//	Info Trolls
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_Trolls   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 41;
 	condition   = DIA_NASZ_223_Ratford_Trolls_Condition;
 	information = DIA_NASZ_223_Ratford_Trolls_Info;
 	permanent   = FALSE;
 	description = "Widzia³eœ kiedyœ gromadê trolli?";
};

FUNC INT DIA_NASZ_223_Ratford_Trolls_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_NearGate))
	&& (!npc_knowsinfo (other, DIA_NASZ_010_Monastir_MamSkladniki))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_Trolls_Info()
{
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_Trolls_15_00"); //Widzia³eœ kiedyœ gromadê trolli?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Trolls_55_01"); //Pewnie, w m³odoœci mia³em okazjê polowaæ z ³owcami trolli. Czemu pytasz?
	AI_Output (other, self,"DIA_NASZ_223_Ratford_Trolls_55_02"); //Muszê znaleŸæ s³oneczny aloes.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Trolls_55_03"); //Alchemicy srogo p³ac¹ za tê roœlinê. W takim razie ja srogo policzê sobie za informacje o trollach.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Trolls_55_04"); //Trzysta sztuk z³ota i wszystkiego siê dowiesz.

};

//*********************************************************************
//	Info Pay
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_Pay   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 42;
 	condition   = DIA_NASZ_223_Ratford_Pay_Condition;
 	information = DIA_NASZ_223_Ratford_Pay_Info;
 	permanent   = FALSE;
 	description = "Ud³aw siê tymi pieniêdzmi. (300 szt. z³ota)";
};

FUNC INT DIA_NASZ_223_Ratford_Pay_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_223_Ratford_Trolls))
	&& (npc_hasitems (other, ItMi_Gold) >= 300)
	&& (!npc_knowsinfo (other, DIA_NASZ_010_Monastir_MamSkladniki))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_Pay_Info()
{
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_Pay_15_00"); //Ud³aw siê tymi pieniêdzmi.
	B_giveinvitems (other, self, itmi_gold, 300);
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Pay_55_01"); //A ¿ebyœ wiedzia³, gdy ju¿ st¹d siê wydostanê, wyprawiê sobie ucztê!
	AI_Output (other, self,"DIA_NASZ_223_Ratford_Pay_55_02"); //To gdzie te trolle?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Pay_55_03"); //W górach ch³opcze. Dziœ pozosta³o tylko jedno dostêpne miejsce zwane klasztorem zmiennokszta³tnych. Za palisad¹, po zachodniej stronie.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_Pay_55_04"); //Mam nadziejê, ¿e coœ znajdê. Jeœli nie, to mo¿esz byæ pewien, ¿e siê tu pojawiê.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Pay_55_05"); //Gdybym nie by³ przekonany, ¿e znajdziesz tam trolle, to nie chcia³bym od ciebie a¿ tyle z³ota.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Pay_55_06"); //IdŸ ju¿.

	B_LogEntry (TOPIC_Monastir_pomoc, "Wiem ju¿, gdzie mogê znaleŸæ trolle! Klasztor zmiennokszta³tnych, za orkow¹ palisad¹.");

};

var int RATFORD_ZAPLACONE;
var int RATFORD_OPEN;
//*********************************************************************
//	Info BuyKey
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_buykey   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 7;
 	condition   = DIA_NASZ_223_Ratford_buykey_Condition;
 	information = DIA_NASZ_223_Ratford_buykey_Info;
 	permanent   = TRUE;
 	description = "Daj mi ten klucz.";
};

FUNC INT DIA_NASZ_223_Ratford_buykey_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_223_Ratford_klucz)
	&& (!RATFORD_ZAPLACONE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_buykey_Info()
{
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_buykey_15_00"); //Daj mi ten klucz.
	
	if (npc_hasitems (other, ItMi_Gold) >=50) {
		B_giveinvitems (other, self, itmi_gold, 50);
		AI_Output (self, other,"DIA_NASZ_223_Ratford_buykey_55_01"); //WeŸ go. Tylko uwa¿aj... Nie daj nikomu uciec.
		Createinvitems (self, ItNa_Key_Ratford, 1);
		B_giveinvitems (self, other, ItNa_Key_Ratford, 1);
		AI_Output (self, other,"DIA_NASZ_223_Ratford_buykey_55_02"); //W ogóle nawet nie chcê wiedzieæ, po co ci ten klucz...
		RATFORD_ZAPLACONE = TRUE;
		B_LogEntry (TOPIC_Aran_quest, "Kupi³em klucz od Ratforda.");
		B_GivePlayerXP (50);
		}
	else {
		AI_Output (self, other,"DIA_NASZ_223_Ratford_buykey_55_03"); //Nie ma z³ota, nie ma klucza.
	};
};

//*********************************************************************
//	Info BuyPickLock
//*********************************************************************
var int WytrychyZaPolowe;
var int Ratford_Bought_PickLock;
var int Boolean_Ratford_Much_PickLock_Said;
var int Boolean_Ratford_MuchMore_PickLock_Said;
var int Boolean_Hero_Know_MuchMore_Info;


func void Ratford_Say_No_Money() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_No_Money_55_00"); //Nie staæ ciê.
};

// po 15 wytrychach
func void Ratford_Say_Much_PickLock() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_Much_PickLock_55_00"); //Na co ci tyle tych wytrychów? Nie spodziewa³em siê, ¿e a¿ tak spodoba ci siê wy³amywanie zamków.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_Much_PickLock_55_01"); //A mo¿e tak czêsto ci siê ³ami¹? Ha, ha!
};

// po 40 wytrychach
func void Ratford_Say_MuchMore_PickLock() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_00"); //Kolejna porcja? Nawet mi nie jest potrzebne tyle wytrychów!
	AI_Output (other, self,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_01"); //Nie chodzisz tyle po okolicy...
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_02"); //To prawda. Ale kiedyœ chodzi³em wcale niemniej ni¿ ty. By³em przecie¿ myœliwym w Nowym Obozie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_03"); //Znam Górnicz¹ Dolinê, jak w³asn¹ kieszeñ. Spl¹drowa³em wiêkszoœæ kufrów w okolicznych lasach.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_04"); //Gdy by³o tu jeszcze bezpieczniej, to znaczy przed upadkiem magicznej bariery, ukry³em kilka swoich skarbów w skrzyniach zamkniêtych przeze mnie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_05"); //Nie przewidzia³em, ¿e wszystko siê tak potoczy. A teraz nie mam ochoty na zbieranie tamtych drobiazgów.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_06"); //Ale skoro z ciebie taki podró¿nik, to mo¿e ty to za³atwisz?
	
};


INSTANCE DIA_NASZ_223_Ratford_BuyPickLock   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 20;
 	condition   = DIA_NASZ_223_Ratford_BuyPickLock_Condition;
 	information = DIA_NASZ_223_Ratford_BuyPickLock_Info;
 	permanent   = TRUE;
 	description = "Sprzedasz mi trochê wytrychów?";
};

FUNC INT DIA_NASZ_223_Ratford_BuyPickLock_Condition()
{
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_BuyPickLock_Info()
{
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_BuyPickLock_15_00"); //Sprzedasz mi trochê wytrychów?
	
	Info_ClearChoices	(DIA_NASZ_223_Ratford_BuyPickLock);	
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, DIALOG_BACK, DIA_NASZ_223_Ratford_BuyPickLock_BACK);
		
		if (WytrychyZaPolowe == TRUE) {
			Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "5 wytrychów (5 szt. z³ota)", DIA_NASZ_223_Ratford_BuyPickLock_5half);
			Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "1 wytrych (1 szt. z³ota)", DIA_NASZ_223_Ratford_BuyPickLock_1half);
		}
		else {
			Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "5 wytrychów (25 szt. z³ota)", DIA_NASZ_223_Ratford_BuyPickLock_5);
			Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "1 wytrych (5 szt. z³ota)", DIA_NASZ_223_Ratford_BuyPickLock_1);	
		};
};

FUNC VOID DIA_NASZ_223_Ratford_BuyPickLock_BACK()
{
	Info_ClearChoices	(DIA_NASZ_223_Ratford_BuyPickLock);	
};

FUNC VOID DIA_NASZ_223_Ratford_BuyPickLock_5half()
{
	if (npc_hasitems (other, ItMi_Gold) >=5) {
		B_giveinvitems (other, self, itmi_gold, 5);
		Createinvitems (self, ItKe_Lockpick, 5);
		B_giveinvitems (self, other, ItKe_Lockpick, 5);
				
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "5 wytrychów (5 szt. z³ota)", DIA_NASZ_223_Ratford_BuyPickLock_5half);
	}
	else {
		Ratford_Say_No_Money();
	};
};

FUNC VOID DIA_NASZ_223_Ratford_BuyPickLock_1half()
{
	if (npc_hasitems (other, ItMi_Gold) >=1) {
		B_giveinvitems (other, self, itmi_gold, 1);
		Createinvitems (self, ItKe_Lockpick, 1);
		B_giveinvitems (self, other, ItKe_Lockpick, 1);
		Ratford_Bought_PickLock = Ratford_Bought_PickLock + 1;
		
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "1 wytrych (1 szt. z³ota)", DIA_NASZ_223_Ratford_BuyPickLock_1half);
	}
	else {
		Ratford_Say_No_Money();
	};
};


FUNC VOID DIA_NASZ_223_Ratford_BuyPickLock_5()
{
	if (npc_hasitems (other, ItMi_Gold) >=25) {
		B_giveinvitems (other, self, itmi_gold, 25);
		Createinvitems (self, ItKe_Lockpick, 5);
		B_giveinvitems (self, other, ItKe_Lockpick, 5);
		Ratford_Bought_PickLock = Ratford_Bought_PickLock + 5;

		if(Ratford_Bought_PickLock >= 15 && Boolean_Ratford_Much_PickLock_Said == FALSE) {
			Ratford_Say_Much_PickLock();
			Boolean_Ratford_Much_PickLock_Said = TRUE;
		};
		
		if(Ratford_Bought_PickLock >= 40 && Boolean_Ratford_MuchMore_PickLock_Said == FALSE) {
			Ratford_Say_MuchMore_PickLock();
			Boolean_Ratford_MuchMore_PickLock_Said = TRUE;
			Boolean_Hero_Know_MuchMore_Info = TRUE;
		};
		
		
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "5 wytrychów (25 szt. z³ota)", DIA_NASZ_223_Ratford_BuyPickLock_5);
	}
	else {
		Ratford_Say_No_Money();
	};
};

FUNC VOID DIA_NASZ_223_Ratford_BuyPickLock_1()
{
	if (npc_hasitems (other, ItMi_Gold) >=5) {
		B_giveinvitems (other, self, itmi_gold, 5);
		Createinvitems (self, ItKe_Lockpick, 1);
		B_giveinvitems (self, other, ItKe_Lockpick, 1);
		Ratford_Bought_PickLock = Ratford_Bought_PickLock + 1;
		
		if(Ratford_Bought_PickLock >= 15 && Boolean_Ratford_Much_PickLock_Said == FALSE) {
			Ratford_Say_Much_PickLock();
			Boolean_Ratford_Much_PickLock_Said = TRUE;
		};
		
		if(Ratford_Bought_PickLock >= 40 && Boolean_Ratford_MuchMore_PickLock_Said == FALSE) {
			Ratford_Say_MuchMore_PickLock();
			Boolean_Ratford_MuchMore_PickLock_Said = TRUE;
			Boolean_Hero_Know_MuchMore_Info = TRUE;
		};
		
		
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "1 wytrych (5 szt. z³ota)", DIA_NASZ_223_Ratford_BuyPickLock_1);
	}
	else {
		Ratford_Say_No_Money();
	};
};




//*********************************************************************
//	Info RatfordChests
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_RatfordChests   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 20;
 	condition   = DIA_NASZ_223_Ratford_RatfordChests_Condition;
 	information = DIA_NASZ_223_Ratford_RatfordChests_Info;
 	permanent   = FALSE;
 	description = "Co dok³adnie mam za³atwiæ?";
};

FUNC INT DIA_NASZ_223_Ratford_RatfordChests_Condition()
{
	if (Boolean_Hero_Know_MuchMore_Info == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_RatfordChests_Info()
{
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChests_15_00"); //Co dok³adnie mam za³atwiæ?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_01"); //W Górniczej Dolinie ukry³em trzy kufry. Dwa z nich s¹ zbyt ciê¿kie, ¿eby je do mnie przynieœæ i bêdziesz musia³ sam je otworzyæ.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_02"); //A trzecia to ma³a skrzyneczka ze z³otem, wiêc dasz mi j¹ do r¹k.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChests_15_03"); //Zaraz, zaraz! A co ja bêdê z tego mia³?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_04"); //Powiedzmy, ¿e jeœli przyniesiesz mi moje rzeczy, to bêdziesz dostawa³ ode mnie wytrychy za po³owê ceny.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_05"); //Hej! Widzê po tobie, ¿e chcesz siê ze mn¹ potargowaæ!
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_06"); //Zapomnij, jeœli ci nie pasuje, to nie zdradzê ci po³o¿enia tych skrzyñ.

};

//*********************************************************************
//	Info RatfordChestsTakeMis
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_RatfordChestsTakeMis   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 20;
 	condition   = DIA_NASZ_223_Ratford_RatfordChestsTakeMis_Condition;
 	information = DIA_NASZ_223_Ratford_RatfordChestsTakeMis_Info;
 	permanent   = FALSE;
 	description = "No dobra, to gdzie s¹ te skrzynie?";
};

FUNC INT DIA_NASZ_223_Ratford_RatfordChestsTakeMis_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_223_Ratford_RatfordChests))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_RatfordChestsTakeMis_Info()
{
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_00"); //No dobra, to gdzie s¹ te skrzynie?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_01"); //Pamiêtaj, da³eœ mi s³owo.
	
	if(other.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_02"); //Myœliwy nie powinien szkodziæ innemu myœliwemu.
	};
	
	if(other.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_03"); //Nie b¹dŸ parszywym ³owc¹ orków i nie zachowuj siê, jak niektórzy z was.
	};
	
	
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_04"); //Tak jak mówi³em, s¹ trzy skrzynie. Na pocz¹tku drogi na prze³êcz znajduje siê niewielkie wyp³aszczenie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_05"); //Skrêæ w lewo i przy ska³ach, w krzakach znajdziesz pierwsz¹ z nich. To chyba gdzieœ w okolicy miejsca wielkiej bitwy orków i ludzi.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_06"); //Druga skrzynia mo¿e byæ trudniejsza do znalezienia. Gdy w jej okolicy pojawi³ siê ten obrzydliwy smok, krajobraz znacznie siê zmieni³.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_07"); //Wiod³a tam œcie¿ka do ma³ej orkowej œwi¹tyni. Skrzyniê ukry³em na pagórku w pobli¿u. Wydaje mi siê, ¿e bêdzie da³o siê tam wleŸæ. 	
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_08"); //Ostatnia spoczywa na dnie jeziora przed Nowym Obozem.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_09"); //Mam tam nurkowaæ? Przecie¿ tam jest cholernie zimno!
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_10"); //W takim razie ³yknij sobie coœ rozgrzewaj¹cego przed skokiem do wody.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_11"); //Masz.
	
	Wld_InsertItem (ItNa_Ratford_Skrzyneczka,"FP_NASZ_RATFORD_SKRZYNECZKA");

	Createinvitems (self, ItFo_Booze, 1);
	B_giveinvitems (self, other, ItFo_Booze, 1);

	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_12"); //To co, wszystko jasne?
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_13"); //Tak, postaram siê to za³atwiæ.
	
	Log_CreateTopic (TOPIC_Ratford_kufry, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ratford_kufry, LOG_RUNNING);
	B_LogEntry (TOPIC_Ratford_kufry, "Jest okazja, by dostawaæ wytrychy dwa razy taniej! Ale najpierw robota przede mn¹. Ratford ukry³ trzy kufry w Górniczej Dolinie, ale chyba nie przewidzia³ ataku orków. Muszê je odnaleŸæ i dostarczyæ mu ich zawartoœæ. Pierwszy z nich znajduje siê w krzakach pod ska³¹, na pierwszym wyp³aszczeniu w drodze na prze³êcz. Gdzieœ obok pobojowiska po walce ludzi i orków. Drugi kufer znajdê w okolicy legowiska bagiennego smoka. Z tego co powiedzia³ Ratford wnioskujê, ¿e trzeba wskoczyæ na ska³y pomiêdzy dwoma œcie¿kami na bagno. Mój ostatni cel to skrzyneczka ze z³otem spoczywaj¹ca gdzieœ na dnie jeziora przed Nowym Obozem. Muszê j¹ wy³owiæ i przynieœæ w ca³oœci. Dobrze, ¿e Ratford da³ mi coœ na rozgrzanie siê, przed skokiem do lodowatej wody!");

	
};

//*********************************************************************
//	Info RatfordChestsFinish
//*********************************************************************
INSTANCE DIA_NASZ_223_Ratford_RatfordChestsFinish   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 20;
 	condition   = DIA_NASZ_223_Ratford_RatfordChestsFinish_Condition;
 	information = DIA_NASZ_223_Ratford_RatfordChestsFinish_Info;
 	permanent   = FALSE;
 	description = "Mam wszystkie twoje rzeczy.";
};

FUNC INT DIA_NASZ_223_Ratford_RatfordChestsFinish_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_223_Ratford_RatfordChestsTakeMis))
	&& (npc_hasitems(other,ItNa_Ratford_Pierscien)>=1)
	&& (npc_hasitems(other,ItNa_Ratford_Naczynie)>=1)
	&& (npc_hasitems(other,ItNa_Ratford_Puchar)>=1)
	&& (npc_hasitems(other,ItNa_Ratford_Talerz)>=1)
	&& (npc_hasitems(other,ItNa_Ratford_Skrzyneczka)>=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_223_Ratford_RatfordChestsFinish_Info()
{
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_00"); //Mam wszystkie twoje rzeczy.
	
	B_GiveInvItems(other,self,ItNa_Ratford_Pierscien,1);
	B_GiveInvItems(other,self,ItNa_Ratford_Naczynie,1);
	B_GiveInvItems(other,self,ItNa_Ratford_Puchar,1);
	B_GiveInvItems(other,self,ItNa_Ratford_Talerz,1);
	B_GiveInvItems(other,self,ItNa_Ratford_Skrzyneczka,1);
	
	Npc_RemoveInvItems(self,ItNa_Ratford_Pierscien,1);
	Npc_RemoveInvItems(self,ItNa_Ratford_Naczynie,1);
	Npc_RemoveInvItems(self,ItNa_Ratford_Puchar,1);
	Npc_RemoveInvItems(self,ItNa_Ratford_Talerz,1);
	Npc_RemoveInvItems(self,ItNa_Ratford_Skrzyneczka,1);
	
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_01"); //Dobra robota, s¹ wszystkie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_02"); //Cholera jasna! Widzisz, co siê sta³o ze skrzyneczk¹? Drewniana obudowa zaczê³a gniæ przez dzia³anie wody.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_03"); //Mam nadziejê, ¿e wnêtrze nie uciepra³o? Ale to sprawdzisz ju¿ sam, póŸniej.	
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_04"); //Nie powinno, wewn¹trz jest tylko z³oto. Dlatego w³aœnie jest taka ciê¿ka. A teraz, zgodnie z umow¹, mo¿esz kupowaæ wytrychy du¿o taniej.
	
	WytrychyZaPolowe = TRUE;
	
	B_GivePlayerXP(500);
	DodajReputacje(2,REP_MYSLIWI);
	
	Log_SetTopicStatus (TOPIC_Ratford_kufry, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ratford_kufry, "Poszukiwania przynios³y skutki i teraz mogê kupowaæ wytrychy du¿o taniej.");
};














func int Open_Chest_Cappel()
{
	if (Npc_GetDistToWP	(NASZ_222_Cappel, "NASZ_MYSLIWI_BALKON_05") <=1500)
	{
		return TRUE;
	}
	else {
	AI_Output (hero, hero,"DIA_NASZ_223_Ratford_FunkcjaCappel_55_00"); //Nie otworzê tego, Cappel jest zbyt blisko.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_223_Ratford_PICKPOCKET (C_INFO)
{
	npc			= NASZ_223_Ratford;
	nr			= 900;
	condition	= DIA_NASZ_223_Ratford_PICKPOCKET_Condition;
	information	= DIA_NASZ_223_Ratford_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_223_Ratford_PICKPOCKET_Condition()
{
	C_Beklauen (58);
};
 
FUNC VOID DIA_NASZ_223_Ratford_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_223_Ratford_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_223_Ratford_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_223_Ratford_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_223_Ratford_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_223_Ratford_PICKPOCKET_DoIt);
};

func void DIA_NASZ_223_Ratford_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRi_Dex_02, 1);
	
	Info_ClearChoices (DIA_NASZ_223_Ratford_PICKPOCKET);
};
	
func void DIA_NASZ_223_Ratford_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_223_Ratford_PICKPOCKET);
};
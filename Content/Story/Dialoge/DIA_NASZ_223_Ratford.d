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
	AI_Output (self, other,"DIA_NASZ_223_Ratford_siema_15_00"); //W czym mog� ci pom�c?
		
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
 	description = "Chc� si� czego� nauczy�.";
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
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_nauka_15_00"); //Chc� si� czego� nauczy�.
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_nauka_15_01"); //Goth wskaza� mi ciebie, jako osob�, kt�ra potencjalnie mog�aby mi co� pokaza�.
	AI_PlayAni(self, "T_SEARCH");
	AI_Output (self, other,"DIA_NASZ_223_Ratford_nauka_55_02"); //Dobrze trafi�e�. Jestem specjalist� w sztuce z�odziejskiej.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_nauka_55_03"); //Takie umiej�tno�ci s� bezcenne. Nigdy nie brakuje ci z�ota, bo tak naprawd� sakiewki ludzi obok ciebie s� w zasadzie twoje.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_nauka_55_04"); //Ale pami�taj, �e swoj� wiedz� podziel� si� tylko wieczorem, gdy jestem przy ognisku.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_nauka_55_05"); //Gestath ca�y czas krzywo na mnie patrzy i pos�dza o kradzie�e. Ciekawe, co by by�o, gdyby dowiedzia� si�, �e szkol� nowego z�odziejaszka.
	
	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Ratford specjalizuje si� w sztuce z�odziejstwa. Mog� zg�asza� si� do niego tylko wtedy, gdy siedzi przy ognisku, poniewa� Gestath nie mo�e si� o tym dowiedzie�.");	
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
	description = "Chcia�bym si� czego� nauczy�.";
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
	AI_Output			(other, self, "DIA_NASZ_223_Ratford_Teach_15_00"); //Chcia�bym si� czego� nauczy�.

	if (Kara1kZaNauke == TRUE)
	{
		AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_03_01"); //Wci�� nie da�e� mi 1000 sztuk z�ota, na kt�re si� umawiali�my.
	}
	else if (Npc_GetDistToWP	(self, "NASZ_MYSLIWI_BALKON_05") >=750)
	{
		AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_03_02"); //NIE WIEM, O CZYM M�WISZ.
	}
	else
	{
	
		AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_03_03"); //Czego teraz?

		Info_ClearChoices	(DIA_NASZ_223_Ratford_Teach);	
		Info_AddChoice		(DIA_NASZ_223_Ratford_Teach, DIALOG_BACK, DIA_NASZ_223_Ratford_Teach_BACK);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
		{ 
			Info_AddChoice	  (DIA_NASZ_223_Ratford_Teach, "Kradzie� kieszonkowa. (5 PN, 100 szt. z�ota)", DIA_NASZ_223_Ratford_Teach_PICKPOCKET);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_ACROBAT) == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_223_Ratford_Teach, "Akrobatyka. (5 PN, 100 szt. z�ota)",  DIA_NASZ_223_Ratford_Teach_ACROBAT);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_223_Ratford_Teach, "Skradanie si�. (5 PN, 100 szt. z�ota)",  DIA_NASZ_223_Ratford_Teach_SNEAK);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == FALSE)
		{ 
			Info_AddChoice	(DIA_NASZ_223_Ratford_Teach, "Otwieranie zamk�w. (5 PN, 100 szt. z�ota)",  DIA_NASZ_223_Ratford_Teach_PICKLOCK);
		};
		
	};

};

func void Ratford_Say_No_Money_To_Teach() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_No_Money_To_Teach_55_00"); //Je�li nie dasz mi z�ota, to nic ci nie poka��.
};

func void Ratford_Say_No_Exp_To_Teach() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_No_Ex_To_Teach_55_00"); //Brak ci do�wiadczenia.
};

func void DIA_NASZ_223_Ratford_Teach_BACK()
{
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == TRUE) && (Npc_GetTalentSkill (other, NPC_TALENT_ACROBAT) == TRUE) && (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == TRUE) && (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_BACK_03_00"); //Opanowa�e� wszystkie z�odziejskie sztuczki. Gratuluj�!
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

	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKPOCKET_03_00"); //Twoim g��wnym zadaniem jest odwr�ci� uwag� ofiary.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKPOCKET_03_01"); //Poka� jej co� albo poopowiadaj o g�upotach. Warto te� nie ucieka� zaraz po dokonaniu kradzie�y.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKPOCKET_03_02"); //Wtedy wyda si� to podejrzane, nie s�dzisz?
	
	NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
	Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
	B_LogEntry (TOPIC_TalentThief,"Wiem, jak okrada� innych.");
	PrintScreen ("Nauka: fach z�odziejski", -1, -1, FONT_Screen, 2);

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

	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_ACROBAT_03_04"); //Po ka�dym skoku l�duj robi�c przewr�t. Zwi�kszy to szybko�� wykonywanych manewr�w.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_ACROBAT_03_05"); //Korzystaj�c z tego, w nied�ugim czasie sam nauczysz si� skaka� na wi�ksze odleg�o�ci.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_ACROBAT_03_06"); //Wykonuj�c taki przewr�t, mo�na z�agodzi� efekt upadku z du�ej wysoko�ci. Tylko nie my�l sobie, �e b�dziesz m�g� skaka� b�g wie sk�d!

	NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
	Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
	B_LogEntry (TOPIC_TalentThief,"Posiad�em umiej�tno�� akrobatyki.");
	PrintScreen ("Nauka: fach z�odziejski", -1, -1, FONT_Screen, 2);

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

	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_SNEAK_03_08"); //Umiej�tno�� skradania si� jest niezwykle wa�na dla ka�dego z�odzieja. No i oczywi�cie dla my�liwego!
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_SNEAK_03_09"); //Przede wszystkim nie tup tak! Zawsze stawiaj stopy powoli, od pi�t.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_SNEAK_03_10"); //Chodzenie na palcach wbrew temu co m�wi� ludzie, nie jest takie dobre. Stopy szybko si� m�cz� i ju� po chwili tracimy efektywno��.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_SNEAK_03_11"); //Pami�taj o tym.

	NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
	Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
	B_LogEntry (TOPIC_TalentThief,"Umiem si� skrada�.");
	PrintScreen ("Nauka: fach z�odziejski", -1, -1, FONT_Screen, 2);

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

	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_13"); //Potrzeba do tego wiele uczucia i intuicji. No, i kilka dobrych wytrych�w. Ch�tnie sprzedam ci kilka.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_14"); //Niekt�re skrzynie s� jednak zabezpieczone zamkami, daj�cymi si� otworzy� tylko przez u�ycie odpowiedniego klucza.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_15"); //Tak wi�c, kl�cz�c przy zamku, nale�y �agodnie obr�ci� wytrych, w lewo i w prawo.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_16"); //Je�li obr�cisz go zbyt szybko lub zbyt mocno - z�amie si�.
	AI_Output			(self, other, "DIA_NASZ_223_Ratford_Teach_PICKLOCK_03_17"); //Z czasem nabierzesz wprawy w pos�ugiwaniu si� tym narz�dziem.

	NauczoneZlodziejskie = NauczoneZlodziejskie + 1;
	Log_CreateTopic (TOPIC_TalentThief,LOG_NOTE);
	B_LogEntry (TOPIC_TalentThief,"Potrafi� otwiera� zamki.");
	PrintScreen ("Nauka: fach z�odziejski", -1, -1, FONT_Screen, 2);
	
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
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_55_01"); //Teraz ju� wiesz, kim jestem. Nie mam gwarancji, �e nie p�jdziesz z tym do szefa i nakablujesz na mnie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_55_02"); //Zw�dzisz co� w obozie. B�dziemy wtedy jecha� na tym samym w�zku.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_zadanie_55_03"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_55_04"); //Okradniesz naszego drwala. W jego skrzyni z pewno�ci� jest co� ciekawego.
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_zadanie_15_05"); //Bu�ka z mas�em. �wietne �wiczenie, jak na pocz�tek.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_zadanie_55_06"); //Zobaczymy! Masz tydzie�. Je�li zawalisz, to uznam, �e przekazywanie ci mojej wiedzy to by� z�y pomys�.

	Log_CreateTopic (TOPIC_Ratford_zlodziejaszek, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ratford_zlodziejaszek, LOG_RUNNING);
	B_LogEntry (TOPIC_Ratford_zlodziejaszek, "Ratford nakaza� mi opr�ni� kufer drwala my�liwych. Mam na to tydzie�. Cholera, ten cz�owiek przebywa w jej pobli�u ca�y czas!");

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
	AI_Output (self, other,"DIA_NASZ_223_Ratford_ZadanieFail_15_00"); //Nie przyszed�e� do mnie w ci�gu siedmiu dni. Wiedzia�em, �e nie warto ci� by�o niczego uczy�.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_ZadanieFail_55_01"); //Co ty sobie, gnojku, wyobra�asz? Nie naucz� ci� niczego, dop�ki nie zap�acisz mi 1000 sztuk z�ota.

	Kara1kZaNauke = TRUE;

	Log_SetTopicStatus (TOPIC_Ratford_zlodziejaszek, LOG_FAILED);
	B_LogEntry (TOPIC_Ratford_zlodziejaszek, "Nie zd��y�em okra�� Cappela i teraz musz� zap�aci� Ratfordowi sporo pieni�dzy, �eby mnie czego� nauczy�. A niech to!");
	
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
 	description = "Uzbiera�em 1000 monet.";
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
	AI_Output (other, self,"DIA_NASZ_223_Ratford_GottaPay_15_00"); //Uzbiera�em 1000 monet.
	B_Giveinvitems (other, self, ItMi_Gold, 1000);
	AI_Output (self, other,"DIA_NASZ_223_Ratford_GottaPay_55_01"); //A wi�c zgodnie z umow� naucz� ci�, czego zechcesz.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_GottaPay_55_02"); //Ale pami�taj, przychod� tylko, gdy jestem przy ognisku!	

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
 	description = "Spl�drowa�em kufer.";
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
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_koniec_15_00"); //Spl�drowa�em kufer.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_koniec_55_01"); //Znalaz�e� co� ciekawego?	
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_koniec_15_02"); //Znalaz�em tak� pi��.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_koniec_55_03"); //Oddaj mi j�. Schowam j� przed Cappelem. Przyda mi si�, w razie gdyby drwal og�osi�, �e odda par� sztuk z�ota uczciwemu znalazcy.
	B_giveinvitems (other, self, ItNa_ZapasowaPila, 1);
	AI_Output (self, other,"DIA_NASZ_223_Ratford_koniec_55_04"); //Nawet nie wiesz, jak g�upi i �lepi s� ludzie. Ju� nieraz odwala�em takie akcje i nie�le si� na tym wzbogaci�em.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_koniec_55_05"); //Nie�le si� spisa�e�. Masz tutaj par� z�otych monet.
	
	Createinvitems (self, itmi_gold, 50);
	B_giveinvitems (self, other, itmi_gold, 50);

	B_LogEntry (TOPIC_Ratford_zlodziejaszek, "Ratford dosta� pi��. Mam tylko nadziej�, �e nie b�d� mia� przez to k�opot�w.");
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
	AI_Output (self, other,"DIA_NASZ_223_Ratford_klucz_55_02"); //Cz�owieku, ty chyba nie wiesz, o czym m�wisz! My�lisz, �e te drzwi s� zamkni�te tak bez powodu?
	AI_Output (other, self,"DIA_NASZ_223_Ratford_klucz_55_03"); //W takim razie rozwi��my to troch� inaczej: Ile sobie liczysz za ten klucz?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_klucz_55_04"); //Pakujesz si� w k�opoty... Pi��dziesi�t sztuk z�ota i po�ycz� ci klucz. Je�li mam mie� przez to k�opoty, to wol� by� troch� do przodu w kwestii z�ota.

	B_LogEntry (TOPIC_Aran_quest, "Za 50 sztuk z�ota Ratford po�yczy mi klucz.");

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
 	description = "Widzia�e� kiedy� gromad� trolli?";
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
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_Trolls_15_00"); //Widzia�e� kiedy� gromad� trolli?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Trolls_55_01"); //Pewnie, w m�odo�ci mia�em okazj� polowa� z �owcami trolli. Czemu pytasz?
	AI_Output (other, self,"DIA_NASZ_223_Ratford_Trolls_55_02"); //Musz� znale�� s�oneczny aloes.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Trolls_55_03"); //Alchemicy srogo p�ac� za t� ro�lin�. W takim razie ja srogo policz� sobie za informacje o trollach.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Trolls_55_04"); //Trzysta sztuk z�ota i wszystkiego si� dowiesz.

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
 	description = "Ud�aw si� tymi pieni�dzmi. (300 szt. z�ota)";
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
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_Pay_15_00"); //Ud�aw si� tymi pieni�dzmi.
	B_giveinvitems (other, self, itmi_gold, 300);
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Pay_55_01"); //A �eby� wiedzia�, gdy ju� st�d si� wydostan�, wyprawi� sobie uczt�!
	AI_Output (other, self,"DIA_NASZ_223_Ratford_Pay_55_02"); //To gdzie te trolle?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Pay_55_03"); //W g�rach ch�opcze. Dzi� pozosta�o tylko jedno dost�pne miejsce zwane klasztorem zmiennokszta�tnych. Za palisad�, po zachodniej stronie.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_Pay_55_04"); //Mam nadziej�, �e co� znajd�. Je�li nie, to mo�esz by� pewien, �e si� tu pojawi�.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Pay_55_05"); //Gdybym nie by� przekonany, �e znajdziesz tam trolle, to nie chcia�bym od ciebie a� tyle z�ota.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Pay_55_06"); //Id� ju�.

	B_LogEntry (TOPIC_Monastir_pomoc, "Wiem ju�, gdzie mog� znale�� trolle! Klasztor zmiennokszta�tnych, za orkow� palisad�.");

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
		AI_Output (self, other,"DIA_NASZ_223_Ratford_buykey_55_01"); //We� go. Tylko uwa�aj... Nie daj nikomu uciec.
		Createinvitems (self, ItNa_Key_Ratford, 1);
		B_giveinvitems (self, other, ItNa_Key_Ratford, 1);
		AI_Output (self, other,"DIA_NASZ_223_Ratford_buykey_55_02"); //W og�le nawet nie chc� wiedzie�, po co ci ten klucz...
		RATFORD_ZAPLACONE = TRUE;
		B_LogEntry (TOPIC_Aran_quest, "Kupi�em klucz od Ratforda.");
		B_GivePlayerXP (50);
		}
	else {
		AI_Output (self, other,"DIA_NASZ_223_Ratford_buykey_55_03"); //Nie ma z�ota, nie ma klucza.
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
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_No_Money_55_00"); //Nie sta� ci�.
};

// po 15 wytrychach
func void Ratford_Say_Much_PickLock() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_Much_PickLock_55_00"); //Na co ci tyle tych wytrych�w? Nie spodziewa�em si�, �e a� tak spodoba ci si� wy�amywanie zamk�w.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_Much_PickLock_55_01"); //A mo�e tak cz�sto ci si� �ami�? Ha, ha!
};

// po 40 wytrychach
func void Ratford_Say_MuchMore_PickLock() {
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_00"); //Kolejna porcja? Nawet mi nie jest potrzebne tyle wytrych�w!
	AI_Output (other, self,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_01"); //Nie chodzisz tyle po okolicy...
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_02"); //To prawda. Ale kiedy� chodzi�em wcale niemniej ni� ty. By�em przecie� my�liwym w Nowym Obozie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_03"); //Znam G�rnicz� Dolin�, jak w�asn� kiesze�. Spl�drowa�em wi�kszo�� kufr�w w okolicznych lasach.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_04"); //Gdy by�o tu jeszcze bezpieczniej, to znaczy przed upadkiem magicznej bariery, ukry�em kilka swoich skarb�w w skrzyniach zamkni�tych przeze mnie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_05"); //Nie przewidzia�em, �e wszystko si� tak potoczy. A teraz nie mam ochoty na zbieranie tamtych drobiazg�w.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_Say_MuchMore_PickLock_55_06"); //Ale skoro z ciebie taki podr�nik, to mo�e ty to za�atwisz?
	
};


INSTANCE DIA_NASZ_223_Ratford_BuyPickLock   (C_INFO)
{
	npc         = NASZ_223_Ratford;
 	nr          = 20;
 	condition   = DIA_NASZ_223_Ratford_BuyPickLock_Condition;
 	information = DIA_NASZ_223_Ratford_BuyPickLock_Info;
 	permanent   = TRUE;
 	description = "Sprzedasz mi troch� wytrych�w?";
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
	AI_Output (other,self ,"DIA_NASZ_223_Ratford_BuyPickLock_15_00"); //Sprzedasz mi troch� wytrych�w?
	
	Info_ClearChoices	(DIA_NASZ_223_Ratford_BuyPickLock);	
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, DIALOG_BACK, DIA_NASZ_223_Ratford_BuyPickLock_BACK);
		
		if (WytrychyZaPolowe == TRUE) {
			Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "5 wytrych�w (5 szt. z�ota)", DIA_NASZ_223_Ratford_BuyPickLock_5half);
			Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "1 wytrych (1 szt. z�ota)", DIA_NASZ_223_Ratford_BuyPickLock_1half);
		}
		else {
			Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "5 wytrych�w (25 szt. z�ota)", DIA_NASZ_223_Ratford_BuyPickLock_5);
			Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "1 wytrych (5 szt. z�ota)", DIA_NASZ_223_Ratford_BuyPickLock_1);	
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
				
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "5 wytrych�w (5 szt. z�ota)", DIA_NASZ_223_Ratford_BuyPickLock_5half);
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
		
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "1 wytrych (1 szt. z�ota)", DIA_NASZ_223_Ratford_BuyPickLock_1half);
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
		
		
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "5 wytrych�w (25 szt. z�ota)", DIA_NASZ_223_Ratford_BuyPickLock_5);
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
		
		
		Info_AddChoice		(DIA_NASZ_223_Ratford_BuyPickLock, "1 wytrych (5 szt. z�ota)", DIA_NASZ_223_Ratford_BuyPickLock_1);
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
 	description = "Co dok�adnie mam za�atwi�?";
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
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChests_15_00"); //Co dok�adnie mam za�atwi�?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_01"); //W G�rniczej Dolinie ukry�em trzy kufry. Dwa z nich s� zbyt ci�kie, �eby je do mnie przynie�� i b�dziesz musia� sam je otworzy�.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_02"); //A trzecia to ma�a skrzyneczka ze z�otem, wi�c dasz mi j� do r�k.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChests_15_03"); //Zaraz, zaraz! A co ja b�d� z tego mia�?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_04"); //Powiedzmy, �e je�li przyniesiesz mi moje rzeczy, to b�dziesz dostawa� ode mnie wytrychy za po�ow� ceny.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_05"); //Hej! Widz� po tobie, �e chcesz si� ze mn� potargowa�!
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChests_15_06"); //Zapomnij, je�li ci nie pasuje, to nie zdradz� ci po�o�enia tych skrzy�.

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
 	description = "No dobra, to gdzie s� te skrzynie?";
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
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_00"); //No dobra, to gdzie s� te skrzynie?
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_01"); //Pami�taj, da�e� mi s�owo.
	
	if(other.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_02"); //My�liwy nie powinien szkodzi� innemu my�liwemu.
	};
	
	if(other.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_03"); //Nie b�d� parszywym �owc� ork�w i nie zachowuj si�, jak niekt�rzy z was.
	};
	
	
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_04"); //Tak jak m�wi�em, s� trzy skrzynie. Na pocz�tku drogi na prze��cz znajduje si� niewielkie wyp�aszczenie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_05"); //Skr�� w lewo i przy ska�ach, w krzakach znajdziesz pierwsz� z nich. To chyba gdzie� w okolicy miejsca wielkiej bitwy ork�w i ludzi.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_06"); //Druga skrzynia mo�e by� trudniejsza do znalezienia. Gdy w jej okolicy pojawi� si� ten obrzydliwy smok, krajobraz znacznie si� zmieni�.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_07"); //Wiod�a tam �cie�ka do ma�ej orkowej �wi�tyni. Skrzyni� ukry�em na pag�rku w pobli�u. Wydaje mi si�, �e b�dzie da�o si� tam wle��. 	
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_08"); //Ostatnia spoczywa na dnie jeziora przed Nowym Obozem.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_09"); //Mam tam nurkowa�? Przecie� tam jest cholernie zimno!
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_10"); //W takim razie �yknij sobie co� rozgrzewaj�cego przed skokiem do wody.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_11"); //Masz.
	
	Wld_InsertItem (ItNa_Ratford_Skrzyneczka,"FP_NASZ_RATFORD_SKRZYNECZKA");

	Createinvitems (self, ItFo_Booze, 1);
	B_giveinvitems (self, other, ItFo_Booze, 1);

	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_12"); //To co, wszystko jasne?
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsTakeMis_15_13"); //Tak, postaram si� to za�atwi�.
	
	Log_CreateTopic (TOPIC_Ratford_kufry, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ratford_kufry, LOG_RUNNING);
	B_LogEntry (TOPIC_Ratford_kufry, "Jest okazja, by dostawa� wytrychy dwa razy taniej! Ale najpierw robota przede mn�. Ratford ukry� trzy kufry w G�rniczej Dolinie, ale chyba nie przewidzia� ataku ork�w. Musz� je odnale�� i dostarczy� mu ich zawarto��. Pierwszy z nich znajduje si� w krzakach pod ska��, na pierwszym wyp�aszczeniu w drodze na prze��cz. Gdzie� obok pobojowiska po walce ludzi i ork�w. Drugi kufer znajd� w okolicy legowiska bagiennego smoka. Z tego co powiedzia� Ratford wnioskuj�, �e trzeba wskoczy� na ska�y pomi�dzy dwoma �cie�kami na bagno. M�j ostatni cel to skrzyneczka ze z�otem spoczywaj�ca gdzie� na dnie jeziora przed Nowym Obozem. Musz� j� wy�owi� i przynie�� w ca�o�ci. Dobrze, �e Ratford da� mi co� na rozgrzanie si�, przed skokiem do lodowatej wody!");

	
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
	
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_01"); //Dobra robota, s� wszystkie.
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_02"); //Cholera jasna! Widzisz, co si� sta�o ze skrzyneczk�? Drewniana obudowa zacz�a gni� przez dzia�anie wody.
	AI_Output (other, self,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_03"); //Mam nadziej�, �e wn�trze nie uciepra�o? Ale to sprawdzisz ju� sam, p�niej.	
	AI_Output (self, other,"DIA_NASZ_223_Ratford_RatfordChestsFinish_15_04"); //Nie powinno, wewn�trz jest tylko z�oto. Dlatego w�a�nie jest taka ci�ka. A teraz, zgodnie z umow�, mo�esz kupowa� wytrychy du�o taniej.
	
	WytrychyZaPolowe = TRUE;
	
	B_GivePlayerXP(500);
	DodajReputacje(2,REP_MYSLIWI);
	
	Log_SetTopicStatus (TOPIC_Ratford_kufry, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ratford_kufry, "Poszukiwania przynios�y skutki i teraz mog� kupowa� wytrychy du�o taniej.");
};














func int Open_Chest_Cappel()
{
	if (Npc_GetDistToWP	(NASZ_222_Cappel, "NASZ_MYSLIWI_BALKON_05") <=1500)
	{
		return TRUE;
	}
	else {
	AI_Output (hero, hero,"DIA_NASZ_223_Ratford_FunkcjaCappel_55_00"); //Nie otworz� tego, Cappel jest zbyt blisko.
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
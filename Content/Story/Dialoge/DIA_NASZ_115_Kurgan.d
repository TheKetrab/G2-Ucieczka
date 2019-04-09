// TODO ogarn�� czy dobrze dzia�a arena w zamku w kap4

var int KurganArenaQuest; // 0 - nieaktywny, 1 - aktywny, 2 - ukonczony


var int Kurgan_rethon;
var int Kurgan_walka;
var int Kurgan_OK;
var int WalkaTrwa;
//0 - nikt
//1 - Fed
//2 - Kjorn
//3 - Ferros
//4 - Godar & Hokurn
//5 - Kurgan

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_EXIT   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
	nr          = 999;
	condition   = DIA_NASZ_115_Kurgan_EXIT_Condition;
	information = DIA_NASZ_115_Kurgan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_115_Kurgan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_115_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_siema   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 1;
 	condition   = DIA_NASZ_115_Kurgan_siema_Condition;
 	information = DIA_NASZ_115_Kurgan_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
	
};

FUNC INT DIA_NASZ_115_Kurgan_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_siema_15_00"); //Czym si� zajmujesz?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_siema_55_01"); //Organizuj� walki na arenie. Nie ma lepszego treningu ni� prawdziwa b�jka.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_siema_55_02"); //Walczymy jednak tylko wieczorami, bo przez dzie� trzeba pracowa�, a w nocy mie� oczy szeroko otwarte i wypatrywa� ork�w.

	Kurgan_walka=0;
	if (KAPITEL == 1) {
		Npc_ExchangeRoutine (self, "Start");
	};
};

//*********************************************************************
//	Walka
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_walka   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 3;
 	condition   = DIA_NASZ_115_Kurgan_walka_Condition;
 	information = DIA_NASZ_115_Kurgan_walka_Info;
 	permanent   = FALSE;
 	description = "Jak wygl�daj� walki?";
};

FUNC INT DIA_NASZ_115_Kurgan_walka_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_walka_Info()
{
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_walka_15_00"); //Jak wygl�daj� walki?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_walka_55_01"); //To bardzo proste. M�wisz mi, �e chcesz walczy�, ja wybieram ci przeciwnika, p�acisz wpisowe, idziesz walczy�.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_walka_55_02"); //Je�li wygrasz, dostaniesz nagrod�.
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_walka_15_03"); //A je�li przegram?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_walka_55_04"); //Pierwsza zasada wojownika: Najwa�niejsze to zawsze by� pewnym, �e si� wygra.
};

//*********************************************************************
//	Wpisowe
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_wpisowe   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 4;
 	condition   = DIA_NASZ_115_Kurgan_wpisowe_Condition;
 	information = DIA_NASZ_115_Kurgan_wpisowe_Info;
 	permanent   = FALSE;
 	description = "Ile wynosi wpisowe?";
};

FUNC INT DIA_NASZ_115_Kurgan_wpisowe_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_walka))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_wpisowe_Info()
{
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_wpisowe_15_00"); //Ile wynosi wpisowe?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_wpisowe_55_01"); //To zale�y od tego, z kim walczysz. Na pocz�tek niech b�dzie sto sztuk z�ota.

};

//*********************************************************************
//	Nagroda
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_nagroda   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 5;
 	condition   = DIA_NASZ_115_Kurgan_nagroda_Condition;
 	information = DIA_NASZ_115_Kurgan_nagroda_Info;
 	permanent   = FALSE;
 	description = "Co z nagrodami?";
};

FUNC INT DIA_NASZ_115_Kurgan_nagroda_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_walka))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_nagroda_Info()
{
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_nagroda_15_00"); //Co z nagrodami?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_nagroda_55_01"); //Je�li wygrasz, dostaniesz z powrotem swoje wpisowe oraz 50 procent wpisowego twojego przeciwnika.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_nagroda_55_02"); //Ale mo�e czasem postaram si� o jak�� ciekawsz� nagrod� ni� z�oto. Poza tym najwi�ksz� chlub� dobrego gladiatora jest chwa�a na arenie.

};

//*********************************************************************
//	Zasady
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_zasady   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 6;
 	condition   = DIA_NASZ_115_Kurgan_zasady_Condition;
 	information = DIA_NASZ_115_Kurgan_zasady_Info;
 	permanent   = FALSE;
 	description = "Jakie zasady panuj� na arenie?";
};

FUNC INT DIA_NASZ_115_Kurgan_zasady_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_zasady_Info()
{
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_zasady_15_00"); //Jakie zasady panuj� na arenie?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_zasady_55_01"); //Rzecz najwa�niejsza: Nie zabijamy przeciwnik�w. Nie u�ywamy �uk�w, kusz, magii.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_zasady_55_02"); //Walka ko�czy si�, gdy jeden z walcz�cych padnie lub wyjdzie poza aren�.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_zasady_15_03"); //Nie daj si� wypchn�� przeciwnikowi, bo to jedna z taktyk niekt�rych gladiator�w.
};

func void HeroWannaFightArena() {

	AI_Output (other,self ,"HeroWannaFightArena_15_00"); //Chc� walczy�.

	if (Wld_IsTime(21,00,23,59)) {
		AI_Output (self, other,"HeroWannaFightArena_55_01"); //Wszystkim chce si� ju� spa�. Walka w takich godzinach nie ma sensu.
	}

	else if (Wld_IsTime(00,00,04,00)) {
		AI_Output (self, other,"HeroWannaFightArena_55_02"); //�artujesz chyba. Jest �rodek nocy!
	}

	else if (Wld_IsTime(04,00,09,00)) {
		AI_Output (self, other,"HeroWannaFightArena_55_03"); //Czas na prac�, nie na potyczki!
	}
	
	else if (Wld_IsTime(09,00,19,00)) {
		AI_Output (self, other,"HeroWannaFightArena_55_04"); //Walki odbywaj� si� tylko wieczorami.
	};


};

func void HeroSayToKurgan_Keep() {
	AI_Output (other, self,"HeroSayToKurgan_Keep_55_00"); //Trzymaj.
};

func void HeroSayToKurgan_Later() {
	AI_Output (other, self,"HeroSayToKurgan_Later_55_00"); //Mo�e p�niej.
};

func void HeroSayToKurgan_NoMoney() {
	AI_Output (other, self,"HeroSayToKurgan_NoMoney_55_00"); //Nie mam tyle z�ota.
	AI_Output (self, other,"HeroSayToKurgan_NoMoney_15_01"); //C�, je�li naprawd� chcesz walczy�, to musisz je zdoby�.
};

func void KurganSayToHero_NooneWantFight() {
	AI_Output (self, other,"KurganSayToHero_NooneWantFight_55_00"); //Teraz nikt nie chce z tob� walczy�. Przyjd� p�niej.
};

//*********************************************************************
//	Fed
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_fed   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 50;
 	condition   = DIA_NASZ_115_Kurgan_fed_Condition;
 	information = DIA_NASZ_115_Kurgan_fed_Info;
 	permanent   = TRUE;
 	description = "Chc� walczy�.";
};

FUNC INT DIA_NASZ_115_Kurgan_fed_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_siema)
		&& !npc_knowsinfo (other, DIA_NASZ_115_Kurgan_fedwon))
		&& (Npc_GetDistToWP	(hero, "NASZ_LOWCY_ARENA_01") < 5000)
		&& (WalkaTrwa == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_fed_Info()
{
	HeroWannaFightArena();

	if (Wld_IsTime(19,00,20,59)) { // jesli godzina jest okej
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_55_00"); //Na pocz�tek dostaniesz prostego przeciwnika.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_55_01"); //B�dzie to Fed. Znale�li�my go w zachodniej cz�ci G�rniczej Doliny.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_55_02"); //Twierdzi, �e by� kopaczem. Nauczyli�my go tego i owego, uzbroili�my.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_55_03"); //To dobry cz�owiek. Nale�y si� 100 sztuk z�ota.
		
		Log_CreateTopic (TOPIC_Kurgan_arena, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Kurgan_arena, LOG_RUNNING);
		B_LogEntry (TOPIC_Kurgan_arena, "Kurgan, �owca ork�w, organizuje walki na arenie. Szykuje si� niez�a zabawa.");
		KurganArenaQuest = 1;

		Info_ClearChoices (DIA_NASZ_115_Kurgan_fed);
		if (npc_hasitems (other, ItMI_gold) >=100){
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_fed, "Mo�e p�niej.", DIA_NASZ_115_Kurgan_fed_no);
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_fed, "Trzymaj (zap�a� 100 szt. z�ota).", DIA_NASZ_115_Kurgan_fed_ok);
		}
		else {
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_fed, "Nie mam tyle z�ota.", DIA_NASZ_115_Kurgan_fed_nomoney);
		};
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_fed_no()
{
	HeroSayToKurgan_Later();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_fed);
};

FUNC VOID DIA_NASZ_115_Kurgan_fed_nomoney()
{
	HeroSayToKurgan_NoMoney();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_fed);
};

FUNC VOID DIA_NASZ_115_Kurgan_fed_ok()
{
	HeroSayToKurgan_Keep();
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_ok_55_01"); //Id� na aren�.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_ok_55_02"); //Fed te� si� tam uda.

	B_GiveInvItems (other, self, ItMI_gold, 100);
	Npc_RemoveInvItems   (self, ItMi_Gold, 100);
	Npc_ExchangeRoutine (NASZ_117_Fed, "Arena");
	Kurgan_walka=1;
	NASZ_117_Fed.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos (self);
	WalkaTrwa = TRUE;
};


//*********************************************************************
//	Fed Won
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_fedwon   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 51;
 	condition   = DIA_NASZ_115_Kurgan_fedwon_Condition;
 	information = DIA_NASZ_115_Kurgan_fedwon_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_fedwon_Condition()
{
	if ((Kurgan_walka==1)
		&& (NASZ_117_Fed.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_fedwon_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedwon_55_00"); //�wietna walka!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedwon_55_01"); //Bez w�tpienia zas�u�y�e� na nagrod�!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedwon_55_02"); //150 sztuk z�ota. Gdyby� chcia� ponownie walczy�, tylko powiedz.

	DodajReputacje (2, REP_LOWCY);
	B_LogEntry (TOPIC_Kurgan_arena, "Pokona�em Feda.");
	Createinvitems (self, itmi_gold, 150);
	B_Giveinvitems (self, other, itmi_gold, 150);
	B_GivePlayerXP (100);
	Npc_ExchangeRoutine(NASZ_117_Fed, "START");
	Kurgan_walka=0;
	FED_WALCZY = FALSE;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Fed Lost
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_fedlost   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 52;
 	condition   = DIA_NASZ_115_Kurgan_fedlost_Condition;
 	information = DIA_NASZ_115_Kurgan_fedlost_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_fedlost_Condition()
{
	if ((Kurgan_walka==1)
		&& (NASZ_117_Fed.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_fedlost_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedlost_55_00"); //Przegra�e�. Twoje z�oto dostaje Fed.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedlost_55_01"); //Je�li b�dziesz chcia� wyr�wna� z nim rachunki, to przyjd�, zap�a� i walcz!
	Npc_ExchangeRoutine(NASZ_117_Fed, "START");
	Kurgan_walka=0;
	FED_WALCZY = FALSE;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Kjorn
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_kjorn   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 60;
 	condition   = DIA_NASZ_115_Kurgan_kjorn_Condition;
 	information = DIA_NASZ_115_Kurgan_kjorn_Info;
 	permanent   = TRUE;
 	description = "Chc� walczy�.";
};

FUNC INT DIA_NASZ_115_Kurgan_kjorn_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_fedwon)
	&& !npc_knowsinfo (other, DIA_NASZ_115_Kurgan_kjornwon))
	&& (Npc_GetDistToWP	(hero, "NASZ_LOWCY_ARENA_01") < 5000)
	&& (WalkaTrwa == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_kjorn_Info()
{
	HeroWannaFightArena();

	if (Wld_IsTime(19,00,20,59)) {
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_55_00"); //Dobra. My�l�, �e Kjorn b�dzie dobrym przeciwnikiem.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_55_01"); //By� �owc� smok�w, uwa�aj na niego.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_55_02"); //Ta walka b�dzie wyr�wnana i dobra. 200 sztuk z�ota.

		B_LogEntry (TOPIC_Kurgan_arena, "Kjorn to m�j kolejny przeciwnik.");

		Info_ClearChoices (DIA_NASZ_115_Kurgan_kjorn);
		if (npc_hasitems (other, ItMI_gold) >=200){
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kjorn, "Mo�e p�niej.", DIA_NASZ_115_Kurgan_kjorn_no);
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kjorn, "Trzymaj (zap�a� 200 szt. z�ota).", DIA_NASZ_115_Kurgan_kjorn_ok);
		}
		else {
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kjorn, "Nie mam tyle z�ota.", DIA_NASZ_115_Kurgan_kjorn_nomoney);
		};
	
	};
	

};

FUNC VOID DIA_NASZ_115_Kurgan_kjorn_no()
{
	HeroSayToKurgan_Later();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_kjorn);
};

FUNC VOID DIA_NASZ_115_Kurgan_kjorn_nomoney()
{
	HeroSayToKurgan_NoMoney();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_kjorn);
};

FUNC VOID DIA_NASZ_115_Kurgan_kjorn_ok()
{
	HeroSayToKurgan_Keep();
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_ok_55_01"); //Id� na aren�.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_ok_55_02"); //Kjorn b�dzie gotowy.

	B_GiveInvItems (other, self, ItMI_gold, 200);
	Npc_RemoveInvItems   (self, ItMi_Gold, 200);
	Npc_ExchangeRoutine (NASZ_116_Kjorn, "Arena");
	Kurgan_walka=2;
	NASZ_116_Kjorn.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos (self);
	WalkaTrwa = TRUE;
};

//*********************************************************************
//	Kjorn Won
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_kjornwon   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 61;
 	condition   = DIA_NASZ_115_Kurgan_kjornwon_Condition;
 	information = DIA_NASZ_115_Kurgan_kjornwon_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_kjornwon_Condition()
{
	if ((Kurgan_walka==2)
		&& (NASZ_116_Kjorn.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_kjornwon_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjornwon_55_00"); //No prosz�, znowu wygra�e�.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjornwon_55_01"); //C�, twoja nagroda.

	DodajReputacje (3, REP_LOWCY);
	B_LogEntry (TOPIC_Kurgan_arena, "Pokona�em Kjorna.");
	Createinvitems (self, itmi_gold, 300);
	B_Giveinvitems (self, other, itmi_gold, 300);
	B_GivePlayerXP (200);
	Npc_ExchangeRoutine(NASZ_116_Kjorn, "START");
	Kurgan_walka=0;
	KJORN_WALCZY = FALSE;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Kjorn Lost
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_kjornlost   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 62;
 	condition   = DIA_NASZ_115_Kurgan_kjornlost_Condition;
 	information = DIA_NASZ_115_Kurgan_kjornlost_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_kjornlost_Condition()
{
	if ((Kurgan_walka==2)
		&& (NASZ_116_Kjorn.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_kjornlost_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjornlost_55_00"); //Nie da si� ukry�, �e przegra�e�.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjornlost_55_01"); //Je�li zechcesz ma�ego rewan�u, to m�w �mia�o.
	Npc_ExchangeRoutine(NASZ_116_Kjorn, "START");
	Kurgan_walka=0;
	KJORN_WALCZY = FALSE;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Ferros
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_ferros   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 70;
 	condition   = DIA_NASZ_115_Kurgan_ferros_Condition;
 	information = DIA_NASZ_115_Kurgan_ferros_Info;
 	permanent   = TRUE;
 	description = "Chc� walczy�.";
};

FUNC INT DIA_NASZ_115_Kurgan_ferros_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_kjornwon)
	&& !npc_knowsinfo (other, DIA_NASZ_115_Kurgan_ferroswon))
	&& (Npc_GetDistToWP	(hero, "NASZ_LOWCY_ARENA_01") < 5000)
	&& (WalkaTrwa == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_ferros_Info()
{
	HeroWannaFightArena();
	
	if(Wld_IsTime(19,00,20,59)) {
	
		if(KAPITEL >=2) {
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferros_55_00"); //Mam dla ciebie kolejnego przeciwnika.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferros_55_01"); //To Feros. Uwa�aj, �wietnie radzi sobie z mieczem.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferros_55_02"); //500 sztuk z�ota.

			Info_ClearChoices (DIA_NASZ_115_Kurgan_ferros);
			if (npc_hasitems (other, ItMI_gold) >=500) {
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_ferros, "Mo�e p�niej.", DIA_NASZ_115_Kurgan_ferros_no);
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_ferros, "Trzymaj (zap�a� 500 szt. z�ota).", DIA_NASZ_115_Kurgan_ferros_ok);
			}
			else {
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_ferros, "Nie mam tyle z�ota.", DIA_NASZ_115_Kurgan_ferros_nomoney);
			};
	
		}
		
		else {
			KurganSayToHero_NooneWantFight();
		};
	};

};

FUNC VOID DIA_NASZ_115_Kurgan_ferros_no()
{
	HeroSayToKurgan_Later();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_ferros);
};

FUNC VOID DIA_NASZ_115_Kurgan_ferros_nomoney()
{
	HeroSayToKurgan_NoMoney();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_ferros);
};

FUNC VOID DIA_NASZ_115_Kurgan_ferros_ok()
{
	HeroSayToKurgan_Keep();
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferros_ok_55_01"); //C�, powodzenia.

	B_GiveInvItems (other, self, ItMI_gold, 500);
	Npc_RemoveInvItems   (self, ItMi_Gold, 500);
	Npc_ExchangeRoutine (NASZ_118_Ferros, "Arena");
	Kurgan_walka=3;
	NASZ_118_Ferros.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos (self);
	WalkaTrwa = TRUE;
};

//*********************************************************************
//	Ferros Won
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_ferroswon   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 71;
 	condition   = DIA_NASZ_115_Kurgan_ferroswon_Condition;
 	information = DIA_NASZ_115_Kurgan_ferroswon_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_ferroswon_Condition()
{
	if ((Kurgan_walka==3)
		&& (NASZ_118_Ferros.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_ferroswon_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroswon_55_00"); //To by�a �wietna walka!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroswon_55_01"); //Nic bardziej mnie nie pasjonuje, ni� starcie dw�ch �wietnych wojownik�w.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroswon_55_02"); //Znalaz�em ten amulet wczoraj. Wygl�da na przydatny. We� go.

	Createinvitems (self, ItAm_Hp_01, 1);
	B_Giveinvitems (self, other, ItAm_Hp_01, 1);

	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroswon_55_03"); //A, no i z�oto oczywi�cie.

	DodajReputacje (4, REP_LOWCY);
	B_LogEntry (TOPIC_Kurgan_arena, "Pokona�em Ferosa.");
	Createinvitems (self, itmi_gold, 750);
	B_Giveinvitems (self, other, itmi_gold, 750);
	B_GivePlayerXP (500);
	Npc_ExchangeRoutine(NASZ_118_Ferros, "START");
	Kurgan_walka=0;
	FERROS_WALCZY = FALSE;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Ferros Lost
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_ferroslost   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 72;
 	condition   = DIA_NASZ_115_Kurgan_ferroslost_Condition;
 	information = DIA_NASZ_115_Kurgan_ferroslost_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_ferroslost_Condition()
{
	if ((Kurgan_walka==3)
		&& (NASZ_118_Ferros.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_ferroslost_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroslost_55_00"); //Nie przejmuj si�. Nast�pnym razem ci si� uda.
	Npc_ExchangeRoutine(NASZ_118_Ferros, "START");
	Kurgan_walka=0;
	FERROS_WALCZY = FALSE;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Godar & Hokurn
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_GodarHokurn   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 80;
 	condition   = DIA_NASZ_115_Kurgan_GodarHokurn_Condition;
 	information = DIA_NASZ_115_Kurgan_GodarHokurn_Info;
 	permanent   = TRUE;
 	description = "Chc� walczy�.";
};

FUNC INT DIA_NASZ_115_Kurgan_GodarHokurn_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_ferroswon)
		&& !npc_knowsinfo (other, DIA_NASZ_115_Kurgan_GodarHokurnWon))
		&& (Npc_GetDistToWP	(hero, "NASZ_LOWCY_ARENA_01") < 5000)
		&& (WalkaTrwa == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_GodarHokurn_Info()
{
	HeroWannaFightArena();

	if (Wld_IsTime(19,00,20,59)) {
	
		if(KAPITEL >= 3) {
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_00"); //�wietnie. Zdajesz sobie chyba spraw�, �e jeste� szanowanym gladiatorem.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_01"); //Kilku ludzi domaga�o si�, bym wyznaczy� walk� jednego gladiatora kontra dw�ch.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_02"); //Jeste� jak dot�d niepokonany. Nadajesz si� do takiej potyczki.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_03"); //Godar i Hokurn chcieli ci pokaza� kto rz�dzi na arenie.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_04"); //Masz szans� ich utwierdzi� w przekonaniu, �e to ty tutaj rz�dzisz.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_05"); //Trzech gladiator�w, to trzykrotne wpisowe. Wystarczy mi wi�c 400 sztuk z�ota.

			Info_ClearChoices (DIA_NASZ_115_Kurgan_GodarHokurn);
			if (npc_hasitems (other, ItMI_gold) >=400){
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_GodarHokurn, "Mo�e p�niej.", DIA_NASZ_115_Kurgan_GodarHokurn_no);
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_GodarHokurn, "Trzymaj (zap�a� 400 szt. z�ota).", DIA_NASZ_115_Kurgan_GodarHokurn_ok);
			}
			else {
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_GodarHokurn, "Nie mam tyle z�ota.", DIA_NASZ_115_Kurgan_GodarHokurn_nomoney);
			};
	
		}
	
		else {
			KurganSayToHero_NooneWantFight();
		};
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_GodarHokurn_no()
{
	HeroSayToKurgan_Later();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_GodarHokurn);
};

FUNC VOID DIA_NASZ_115_Kurgan_GodarHokurn_nomoney()
{
	HeroSayToKurgan_NoMoney();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_GodarHokurn);
};

FUNC VOID DIA_NASZ_115_Kurgan_GodarHokurn_ok()
{
	HeroSayToKurgan_Keep();
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_ok_55_01"); //Id� na aren� i nie daj si� pokona�. Powodzenia.

	B_GiveInvItems (other, self, ItMI_gold, 400);
	Npc_RemoveInvItems   (self, ItMi_Gold, 400);
	Npc_ExchangeRoutine (NASZ_113_Godar, "Arena");
	Npc_ExchangeRoutine (NASZ_114_Hokurn, "Arena");
	Kurgan_walka=4;
	NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	NASZ_114_Hokurn.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos (self);
	WalkaTrwa = TRUE;
};

//*********************************************************************
//	Godar & Hokurn Won
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_GodarHokurnWon   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 81;
 	condition   = DIA_NASZ_115_Kurgan_GodarHokurnWon_Condition;
 	information = DIA_NASZ_115_Kurgan_GodarHokurnWon_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_GodarHokurnWon_Condition()
{
	if ((Kurgan_walka==4)
		&& (NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		&& (NASZ_114_Hokurn.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_GodarHokurnWon_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnWon_55_00"); //Jeste� mistrzem. Brawo!
	
	/* KAPITEL 4 */
	if (KAPITEL >= 4) {
	
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnWon_55_01"); //Ale jest jeszcze jedna osoba, kt�ra mo�e pogrzeba� tw� dum�.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnWon_55_02"); //Stocz walk� ze mn�! Zobaczymy, czy dasz rad� tak�e mi. Chod�!
		
		B_LogEntry(TOPIC_Kurgan_arena,"Pokona�em Godara i Hokurna. Pora na najpot�niejszego gladiatora, czyli szefa areny.");
		Npc_ExchangeRoutine(NASZ_113_Godar, "InCastle");
		Npc_ExchangeRoutine(NASZ_114_Hokurn, "InCastle");
		B_GivePlayerXP (800);
		DodajReputacje (5, REP_LOWCY);
		Kurgan_walka=5;

		Npc_ExchangeRoutine(self,"ArenaZamek");
		AI_StopProcessInfos(self);
		
		return;
	};
	
	// ----- ----- ----- ----
	
	
	
	
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnWon_55_03"); //Wyj�tkowe widowisko. Oczywi�cie nagroda pieni�na! 800 sztuk dla ciebie.

	DodajReputacje (5, REP_LOWCY);
	B_LogEntry (TOPIC_Kurgan_arena, "Pokona�em Godara i Hokurna.");
	Createinvitems (self, itmi_gold, 800);
	B_Giveinvitems (self, other, itmi_gold, 800);
	B_GivePlayerXP (800);
	Npc_ExchangeRoutine(NASZ_113_Godar, "START");
	Npc_ExchangeRoutine(NASZ_114_Hokurn, "START");
	Kurgan_walka=0;
	GODARHOKURN_WALCZY = FALSE;
	WalkaTrwa = FALSE;
};


func void KurganSay_YoudBetterKillOrc() {
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_YoudBetterKillOrc_55_00"); //Lepiej id� polowa� na ork�w. Nie marnuj si�y na g�upie potyczki.
};

//*********************************************************************
//	Godar & Hokurn Lost
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_GodarHokurnLost   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 82;
 	condition   = DIA_NASZ_115_Kurgan_GodarHokurnLost_Condition;
 	information = DIA_NASZ_115_Kurgan_GodarHokurnLost_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_GodarHokurnLost_Condition()
{
	if ((Kurgan_walka==4)
		&& ((NASZ_113_Godar.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		|| (NASZ_114_Hokurn.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_GodarHokurnLost_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnLost_55_00"); //O stary... Walka wyj�tkowa.
	
	/* KAPITEL 4 */
	if (KAPITEL >= 4) {
	
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnLost_55_01"); //Ale nie wygra�e�, zatem nie mo�esz szczyci� si� tytu�em mistrza areny.
		KurganSay_YoudBetterKillOrc();
		
		B_LogEntry(TOPIC_Kurgan_arena,"Zosta�em pokonany przez dw�ch wojownik�w. Niestety, okaza�o si� to dla mnie za du�o.");
		Log_SetTopicStatus(TOPIC_Kurgan_arena,LOG_FAILED);
		Npc_ExchangeRoutine(NASZ_113_Godar, "InCastle");
		Npc_ExchangeRoutine(NASZ_114_Hokurn, "InCastle");
		Kurgan_walka=0;

		
		return;
	};
	
	// ----- ----- ----- ----
	
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnLost_55_02"); //Ale jedyny klucz do nast�pnej walki to wygra� z tymi dwoma.
	Npc_ExchangeRoutine(NASZ_113_Godar, "START");
	Npc_ExchangeRoutine(NASZ_114_Hokurn, "START");
	Kurgan_walka=0;
	GODARHOKURN_WALCZY = FALSE;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Kurgan
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_kurgan   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 90;
 	condition   = DIA_NASZ_115_Kurgan_kurgan_Condition;
 	information = DIA_NASZ_115_Kurgan_kurgan_Info;
 	permanent   = TRUE;
 	description = "Chc� walczy�.";
};

FUNC INT DIA_NASZ_115_Kurgan_kurgan_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_GodarHokurnWon)
	&& !npc_knowsinfo (other, DIA_NASZ_115_Kurgan_kurganwon))
	&& (Npc_GetDistToWP	(hero, "NASZ_LOWCY_ARENA_01") < 5000)
	&& (WalkaTrwa == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_kurgan_Info()
{
	HeroWannaFightArena();
	
	if (Wld_IsTime(19,00,20,59)) {
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_00"); //Szczerze m�wi�c, czeka�em na ten moment. Ostatnim twoim przeciwnikiem b�d� ja.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_01"); //Chyba obaj zdajemy sobie spraw�, �e ta walka nie b�dzie prosta. Jeste� bardzo dobry, pokona�e� wszystkich.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_02"); //Dw�ch mistrz�w areny walcz�cych mi�dzy sob�... To przecie� wspania�e widowisko.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_03"); //Warte wielu sztuk z�ota. 1000 sztuk, to moja propozycja, a raczej warunek.
		AI_Output (other,self ,"DIA_NASZ_115_Kurgan_kurgan_15_04"); //Czy je�li wygram, dostan� ca�y tw�j tysi�c, czy 500 sztuk we�miesz dla siebie jako organizator?
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_05"); //Zwyci�zcy tej walki nale�y si� sporo z�ota. Je�eli wygrasz, dostaniesz w sumie 2 tysi�ce sztuk z�ota.

		Info_ClearChoices (DIA_NASZ_115_Kurgan_kurgan);
		if (npc_hasitems (other, ItMI_gold) >=1000){
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kurgan, "Mo�e p�niej.", DIA_NASZ_115_Kurgan_kurgan_no);
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kurgan, "Trzymaj (zap�a� 1000 szt. z�ota).", DIA_NASZ_115_Kurgan_kurgan_ok);
			}
		else {
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kurgan, "Nie mam tyle z�ota.", DIA_NASZ_115_Kurgan_kurgan_nomoney);
		};
		
	};

};

FUNC VOID DIA_NASZ_115_Kurgan_kurgan_no()
{
	HeroSayToKurgan_Later();
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_no_55_01"); //No we� ty... Tak d�ugo czeka�em na walk�...
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_no_55_02"); //Niech b�dzie. Ale przyjd� p�niej.

	Info_ClearChoices (DIA_NASZ_115_Kurgan_kurgan);
};

FUNC VOID DIA_NASZ_115_Kurgan_kurgan_nomoney()
{
	HeroSayToKurgan_NoMoney();
	Info_ClearChoices (DIA_NASZ_115_Kurgan_kurgan);
};

FUNC VOID DIA_NASZ_115_Kurgan_kurgan_ok()
{
	HeroSayToKurgan_Keep();
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_ok_55_01"); //Dobra, czas uda� si� na aren�.

	B_GiveInvItems (other, self, ItMI_gold, 1000);
	Npc_RemoveInvItems   (self, ItMi_Gold, 1000);
	Npc_ExchangeRoutine (NASZ_115_Kurgan, "Arena");
	Kurgan_walka=5;
	NASZ_115_Kurgan.aivar[AIV_LastFightAgainstPlayer] = FIGHT_NONE;
	AI_StopProcessInfos (self);
	WalkaTrwa = TRUE;
};

//*********************************************************************
//	Arena 
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_arena   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 91;
 	condition   = DIA_NASZ_115_Kurgan_arena_Condition;
 	information = DIA_NASZ_115_Kurgan_arena_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_arena_Condition()
{
	if ((Kurgan_walka==5)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_LOWCY_ARENA_01")
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_arena_Info()
{
	KurganMozeStop = FALSE;
	Kurgan_Przyzwal_Ducha = FALSE;
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_arena_55_00"); //A teraz taka ma�a niespodzianka ode mnie.
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);

};

//*********************************************************************
//	ArenaZamek
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_ArenaZamek   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 91;
 	condition   = DIA_NASZ_115_Kurgan_ArenaZamek_Condition;
 	information = DIA_NASZ_115_Kurgan_ArenaZamek_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_ArenaZamek_Condition()
{
	if (Kurgan_walka==5)
	&& (Npc_GetDistToWP(other,"OC_SMITH_01") < 600)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_ArenaZamek_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaZamek_55_00"); //Gotuj bro�. Powodzenia.
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);

};



//*********************************************************************
//	DuchPrzyzwany
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_DuchPrzyzwany   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 92;
 	condition   = DIA_NASZ_115_Kurgan_DuchPrzyzwany_Condition;
 	information = DIA_NASZ_115_Kurgan_DuchPrzyzwany_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_DuchPrzyzwany_Condition()
{
	if ((Kurgan_walka==5)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_LOWCY_Arena_01")
		&& (KurganMozeStop == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_DuchPrzyzwany_Info()
{

	AI_Output (other, self,"DIA_NASZ_115_Kurgan_DuchPrzyzwany_15_01"); //Na Inosa! C� to? M�wi�e�, �e nie mo�na u�ywa� magii.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_DuchPrzyzwany_55_02"); //Ale ja u�y�em jej przed rozpocz�ciem walki. To m�j duch. Walczysz wi�c ze mn�, ale w dw�ch postaciach.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_DuchPrzyzwany_55_03"); //Powodzenia, mistrzu!
	KurganAtakuje = TRUE;

	Info_ClearChoices (DIA_NASZ_115_Kurgan_DuchPrzyzwany);
	Info_AddChoice	  (DIA_NASZ_115_Kurgan_DuchPrzyzwany, "KONIEC", DIA_NASZ_115_Kurgan_DuchPrzyzwany_end);

};

FUNC VOID DIA_NASZ_115_Kurgan_DuchPrzyzwany_end()
{
	AI_StopProcessInfos(self);
	B_Attack(NASZ_115_Kurgan, other, AR_NONE, 1);
	B_Attack(NASZ_401_Kurgan, other, AR_NONE, 1);
};


func void KurganSay_YouArePro() {
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_YouArePro_55_00"); //Jako �e jeste� nowym mistrzem, dostaniesz r�wnie� wspania�e ostrze.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_YouArePro_55_01"); //Zg�o� si� po nie u Jana.
};



var int JestesMistrzemAreny;
//*********************************************************************
//	Kurgan Won
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_kurganwon   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 93;
 	condition   = DIA_NASZ_115_Kurgan_kurganwon_Condition;
 	information = DIA_NASZ_115_Kurgan_kurganwon_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_kurganwon_Condition()
{
	if ((Kurgan_walka==5)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_kurganwon_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganwon_55_00"); //Wygl�da na to, �e mamy nowego mistrza areny.
	
	/* KAPITEL 4 */
	if (KAPITEL >= 4) {
	
		KurganSay_YouArePro();
	
		B_LogEntry (TOPIC_Kurgan_arena, "Pokona�em Kurgana i zosta�em mistrzem areny.");
		JestesMistrzemAreny = TRUE;
		DodajReputacje (6, REP_LOWCY);
		B_GivePlayerXP (1000);
		Log_SetTopicStatus (TOPIC_Kurgan_arena, LOG_SUCCESS);
		KurganArenaQuest = 2;
		Npc_ExchangeRoutine(NASZ_115_Kurgan, "InCastle");
		Kurgan_walka=0;
	
		return;
	};
	
	
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganwon_55_01"); //Przyjmij moje gratulacje, no i pieni�dze oczywi�cie.

	B_LogEntry (TOPIC_Kurgan_arena, "Pokona�em Kurgana i zosta�em mistrzem areny.");
	Createinvitems (self, itmi_gold, 2000);
	B_Giveinvitems (self, other, itmi_gold, 2000);

	KurganSay_YouArePro();

	JestesMistrzemAreny = TRUE;
	DodajReputacje (6, REP_LOWCY);
	B_GivePlayerXP (1000);
	Log_SetTopicStatus (TOPIC_Kurgan_arena, LOG_SUCCESS);
	KurganArenaQuest = 2;
	Npc_ExchangeRoutine(NASZ_115_Kurgan, "START");
	Kurgan_walka=0;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Kurgan Lost
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_kurganlost   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 94;
 	condition   = DIA_NASZ_115_Kurgan_kurganlost_Condition;
 	information = DIA_NASZ_115_Kurgan_kurganlost_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_kurganlost_Condition()
{
	if ((Kurgan_walka==5)
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_kurganlost_Info()
{
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganlost_55_00"); //Wygra�em.
	
	/* KAPITEL 4 */
	if (KAPITEL >= 4) {

		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganlost_55_01"); //W sumie nie dziwi� si�, m�odzie�cze.
		KurganSay_YoudBetterKillOrc();
		
		B_LogEntry(TOPIC_Kurgan_arena,"Zosta�em pokonany przez Kurgana.");
		Log_SetTopicStatus(TOPIC_Kurgan_arena,LOG_FAILED);
		Npc_ExchangeRoutine(self, "InCastle");
		Kurgan_walka=0;
	
		return;
	};
	
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganlost_55_02"); //Ale spodziewam si�, �e wyzwiesz mnie jeszcze raz.
	Npc_ExchangeRoutine(NASZ_115_Kurgan, "START");
	Kurgan_walka=0;
	WalkaTrwa = FALSE;
};

//*********************************************************************
//	Rethon
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_rethon   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 100;
 	condition   = DIA_NASZ_115_Kurgan_rethon_Condition;
 	information = DIA_NASZ_115_Kurgan_rethon_Info;
 	permanent   = FALSE;
 	description = "Rethon chcia�by z tob� walczy�.";
};

FUNC INT DIA_NASZ_115_Kurgan_rethon_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_109_Rethon_zadanie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_rethon_Info()
{

	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_rethon_15_00"); //Rethon chcia�by z tob� walczy�.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_01"); //A niby dlaczego mia�bym stoczy� z nim pojedynek?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_02"); //My�li, �e skoro szkoli pocz�tkuj�cych w walce mieczem, to dor�wnuje mi umiej�tno�ciami? W takim razie jest w b��dzie.
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_rethon_55_03"); //Nie ma jakiego� sposobu, by ci� przekona�?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_04"); //C�...
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_05"); //Gdyby� przyni�s� mi ko�o z�bate, m�g�bym si� zgodzi�. Potrzebuj� go do doko�czenia katapulty.
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_rethon_55_06"); //Gdzie niby mam znale�� ko�o z�bate?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_07"); //W Starej Kopalni z pewno�ci� jakie� maszyny maj� takie cz�ci.
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_rethon_55_08"); //Pracowa�em w Starej Kopalni ca�kiem niedawno i zapewniam ci�, �e nie ma tam �adnych maszyn.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_09"); //Ja m�wi� o prawdziwej Starej Kopalni z czas�w bariery. Zapewne da si� dosta� tam jako� po ska�ach.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_10"); //Spr�buj znale�� drog� i przynie� mi ko�o z�bate.

	B_LogEntry (TOPIC_Rethon_kurgan, "Kurgan powiedzia�, �e je�li przynios� mu ko�o z�bate, to stoczy walk� z Rethonem. Zasugerowa� mi, bym rozejrza� si� w�r�d gruz�w Starej Kopalni. Musz� znale�� drog� po ska�ach, by si� tam dosta�, a potem znale�� ma�� drewnian� cz��.");
	
};


//*********************************************************************
//	rethon2
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_rethon2   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 101;
 	condition   = DIA_NASZ_115_Kurgan_rethon2_Condition;
 	information = DIA_NASZ_115_Kurgan_rethon2_Info;
 	permanent   = FALSE;
 	description = "Mam ko�o z�bate.";
};

FUNC INT DIA_NASZ_115_Kurgan_rethon2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_rethon)) && (npc_hasitems (other, ItNa_KoloZebate) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_rethon2_Info()
{

	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_rethon2_15_00"); //Mam ko�o z�bate.
	B_Giveinvitems (other, self, ItNa_KoloZebate, 1);
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon2_55_01"); //Nareszcie! Teraz b�d� m�g� wznowi� prace przy mojej maszynie.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon2_55_02"); //B�d� walczy� z Rethonem. Powiedz mu, �eby przyszed� na aren�.

	B_GivePlayerXP (50);
	Kurgan_OK = TRUE;
	B_LogEntry (TOPIC_Rethon_kurgan, "Kurgan zgodzi� si� przyj�� wyzwanie Rethona. Musz� powiedzie� Rethonowi, by uda� si� na aren�.");

};

//*********************************************************************
//	rethon3
//*********************************************************************
var int Rethon3Finished;

INSTANCE DIA_NASZ_115_Kurgan_rethon3   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 102;
 	condition   = DIA_NASZ_115_Kurgan_rethon3_Condition;
 	information = DIA_NASZ_115_Kurgan_rethon3_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_115_Kurgan_rethon3_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_109_Rethon_ready))
	&& (Npc_GetDistToWP(self,"NASZ_LOWCY_ARENA_06") < 500)
	&& (Npc_GetDistToWP(NASZ_109_Rethon,"NASZ_LOWCY_ARENA_06") < 500)
	&& (Npc_IsInState(self, ZS_TALK))
	&& (Rethon3Finished == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_rethon3_Info()
{

	if (Wld_IsTime(19,00,21,00)) {
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon3_55_00"); //No, jeste� wreszcie. Czekali�my na organizatora tej walki.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon3_55_01"); //Odsu� si� teraz i patrz na pojedynek prawdziwych gladiator�w.

		Rethon3Finished = TRUE;
		Info_ClearChoices (DIA_NASZ_115_Kurgan_rethon3);
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_rethon3, DIALOG_ENDE, DIA_NASZ_115_Kurgan_rethon3_end);
	}
	else {
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon3_55_02"); //Przyjd� wieczorem. Wtedy zobaczysz, co potrafi� �owcy ork�w!
	};
	

};


FUNC VOID DIA_NASZ_115_Kurgan_rethon3_end()
{
	FF_ApplyOnceExt (RethonKurganFight, 1000, -1); // 1 na sekunde
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_goth   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 104;
 	condition   = DIA_NASZ_115_Kurgan_goth_Condition;
 	information = DIA_NASZ_115_Kurgan_goth_Info;
 	permanent   = FALSE;
	description = "Podobno dokonano napadu na my�liwych.";
};

FUNC INT DIA_NASZ_115_Kurgan_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_goth_15_00"); //Podobno dokonano napadu na my�liwych.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_goth_55_01"); //I dlaczego przychodzisz z tym do mnie? Coo?!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_goth_55_02"); //Zapomnij kole�ko. Nic tu po tobie.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_goth_55_03"); //I nie rozmawiaj nawet z moimi ch�opakami. Oni i tak nic ci nie powiedz�.

	B_LogEntry (TOPIC_Goth_kradziez, "Kurgan, szef areny, strasznie si� zdenerwowa�, gdy wspomnia�em mu o rozboju. To podejrzane, ale c� z tego, skoro nie mam nic na niego, a jego ch�opcy nic mi nie pisn�.");

};

//*********************************************************************
//	Info WhatWithArena
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_WhatWithArena   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 129;
 	condition   = DIA_NASZ_115_Kurgan_WhatWithArena_Condition;
 	information = DIA_NASZ_115_Kurgan_WhatWithArena_Info;
 	permanent   = FALSE;
	description = "Co z walk� na arenie?";
};

FUNC INT DIA_NASZ_115_Kurgan_WhatWithArena_Condition()	
{
	if (Npc_GetDistToWP	(self, "OW_PATH_190") <= 1000) // twierdza
	&& (KurganArenaQuest == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_WhatWithArena_Info()
{
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_WhatWithArena_15_00"); //Co z walk� na arenie?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_WhatWithArena_15_01"); //Jak to co? Gdy tylko rozwalimy ork�w, wracamy do naszych potyczek!

};

var int HeroChceWalczycNaArenieWZamku;
//*********************************************************************
//	Info ArenaKap4
//*********************************************************************
// UWAGA: w kap4 mozna walczyc TYLKO po jednym razie, jak sie przegra to mission failed !!!
INSTANCE DIA_NASZ_115_Kurgan_ArenaKap4   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 401;
 	condition   = DIA_NASZ_115_Kurgan_ArenaKap4_Condition;
 	information = DIA_NASZ_115_Kurgan_ArenaKap4_Info;
 	permanent   = TRUE;
	description = "Chcia�bym stoczy� walk� na arenie...";
};

FUNC INT DIA_NASZ_115_Kurgan_ArenaKap4_Condition()	
{
	if (KAPITEL >= 4)
	&& (KurganArenaQuest == 1)
	&& (HeroChceWalczycNaArenieWZamku == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_ArenaKap4_Info()
{
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_ArenaKap4_15_00"); //Chcia�bym stoczy� walk� na arenie...

	if (Wld_IsTime(21,00,23,59)) || (Wld_IsTime(00,00,06,00))
	{
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_01"); //M�j drogi wojowniku! O tej godzinie si� �pi albo biesiaduje, a nie walczy!
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_02"); //Przyjd� za dnia, wtedy o tym porozmawiamy. A tym czasem napij si� ze mn� piwa i opowiedz jaki� kawa�!
		return;
	};

	HeroChceWalczycNaArenieWZamku = TRUE;
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_03"); //A niech ci�, tobie ci�gle ma�o! Zaraz co� wykombinujemy. Pokona�e� ju� Godara i Hokurna?
	
	if (npc_knowsinfo(other,DIA_NASZ_115_Kurgan_GodarHokurnWon)) {
		AI_Output (other, self,"DIA_NASZ_115_Kurgan_ArenaKap4_15_04"); //Tak.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_05"); //W takim razie zosta�em ju� tylko ja. Miejmy za sob� t� potyczk�. Chod� za mn�!
		Kurgan_walka = 5;
		Npc_ExchangeRoutine(self,"ArenaZamek");
	} else {
		AI_Output (other, self,"DIA_NASZ_115_Kurgan_ArenaKap4_15_06"); //Nie.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_07"); //A wi�c jazda, ju�! Ch�opaki na pewno ch�tnie spior� ci ty�ek. Do walki!
		Kurgan_walka = 4;
		B_StartOtherRoutine(NASZ_113_Godar,"ArenaZamek");
		B_StartOtherRoutine(NASZ_114_Hokurn,"ArenaZamek");
	};

	AI_StopProcessInfos(self);
};


//*********************************************************************
//	Info SzturmNaZamek
//*********************************************************************
INSTANCE DIA_NASZ_115_Kurgan_SzturmNaZamek   (C_INFO)
{
	npc         = NASZ_115_Kurgan;
 	nr          = 131;
 	condition   = DIA_NASZ_115_Kurgan_SzturmNaZamek_Condition;
 	information = DIA_NASZ_115_Kurgan_SzturmNaZamek_Info;
 	permanent   = FALSE;
	description = "Keroloth kaza� mi poprowadzi� szturm na zamek.";
};

FUNC INT DIA_NASZ_115_Kurgan_SzturmNaZamek_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_MainForces))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_115_Kurgan_SzturmNaZamek_Info()
{
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_SzturmNaZamek_15_00"); //Keroloth kaza� mi poprowadzi� szturm na zamek.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_SzturmNaZamek_15_01"); //CH�OPCY, S�YSZELI�CIE? NASTA� CZAS, W KT�RYM SPE�NI SI� NASZE PRAGNIENIE.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_SzturmNaZamek_15_02"); //ODBIJEMY ZAMEK, ROZGNIECIEMY SI�Y ORK�W! ZOSTAWCIE SWOJE TROSKI I OBAWY TUTAJ. ODWAGA TO DRUGIE IMI� �OWC�W ORK�W!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_SzturmNaZamek_55_03"); //Jeste�my gotowi, prowad�.

	// Pojawia sie kopacz, niewolnik orkow
	Wld_InsertNpc	(NASZ_003_Kopacz,"NASZ_ZAMEK_OBOZ_01");
	
	WillIdziePierwszyRazNaZamek = TRUE;
	HookEngineF(oCNpc__ProcessNpc,6,UratujFunc);
	
	B_StartOtherRoutine (NASZ_113_Godar,"Zamek");
	//NASZ_113_Godar.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_113_Godar,1);
	B_StartOtherRoutine (NASZ_114_Hokurn,"Zamek");
	//NASZ_114_Hokurn.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_114_Hokurn,1);
	B_StartOtherRoutine (NASZ_115_Kurgan,"Zamek");
	//NASZ_115_Kurgan.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_115_Kurgan,1);
	B_StartOtherRoutine (NASZ_116_Kjorn,"Zamek");
	//NASZ_116_Kjorn.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_116_Kjorn,1);
	B_StartOtherRoutine (NASZ_117_Fed,"Zamek");
	//NASZ_117_Fed.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_117_Fed,1);
	B_StartOtherRoutine (NASZ_118_Ferros,"Zamek");
	//NASZ_118_Ferros.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_118_Ferros,1);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_115_Kurgan_PICKPOCKET (C_INFO)
{
	npc			= NASZ_115_Kurgan;
	nr			= 900;
	condition	= DIA_NASZ_115_Kurgan_PICKPOCKET_Condition;
	information	= DIA_NASZ_115_Kurgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_115_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen (82);
};
 
FUNC VOID DIA_NASZ_115_Kurgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_115_Kurgan_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_115_Kurgan_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_115_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_115_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_115_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_NASZ_115_Kurgan_PICKPOCKET_DoIt()
{
	B_BeklauenGold(148);
	Info_ClearChoices (DIA_NASZ_115_Kurgan_PICKPOCKET);
};
	
func void DIA_NASZ_115_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_115_Kurgan_PICKPOCKET);
};

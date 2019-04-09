// TODO ogarn¹æ czy dobrze dzia³a arena w zamku w kap4

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
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_siema_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_siema_55_01"); //Organizujê walki na arenie. Nie ma lepszego treningu ni¿ prawdziwa bójka.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_siema_55_02"); //Walczymy jednak tylko wieczorami, bo przez dzieñ trzeba pracowaæ, a w nocy mieæ oczy szeroko otwarte i wypatrywaæ orków.

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
 	description = "Jak wygl¹daj¹ walki?";
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
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_walka_15_00"); //Jak wygl¹daj¹ walki?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_walka_55_01"); //To bardzo proste. Mówisz mi, ¿e chcesz walczyæ, ja wybieram ci przeciwnika, p³acisz wpisowe, idziesz walczyæ.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_walka_55_02"); //Jeœli wygrasz, dostaniesz nagrodê.
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_walka_15_03"); //A jeœli przegram?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_walka_55_04"); //Pierwsza zasada wojownika: Najwa¿niejsze to zawsze byæ pewnym, ¿e siê wygra.
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_wpisowe_55_01"); //To zale¿y od tego, z kim walczysz. Na pocz¹tek niech bêdzie sto sztuk z³ota.

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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_nagroda_55_01"); //Jeœli wygrasz, dostaniesz z powrotem swoje wpisowe oraz 50 procent wpisowego twojego przeciwnika.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_nagroda_55_02"); //Ale mo¿e czasem postaram siê o jak¹œ ciekawsz¹ nagrodê ni¿ z³oto. Poza tym najwiêksz¹ chlub¹ dobrego gladiatora jest chwa³a na arenie.

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
 	description = "Jakie zasady panuj¹ na arenie?";
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
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_zasady_15_00"); //Jakie zasady panuj¹ na arenie?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_zasady_55_01"); //Rzecz najwa¿niejsza: Nie zabijamy przeciwników. Nie u¿ywamy ³uków, kusz, magii.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_zasady_55_02"); //Walka koñczy siê, gdy jeden z walcz¹cych padnie lub wyjdzie poza arenê.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_zasady_15_03"); //Nie daj siê wypchn¹æ przeciwnikowi, bo to jedna z taktyk niektórych gladiatorów.
};

func void HeroWannaFightArena() {

	AI_Output (other,self ,"HeroWannaFightArena_15_00"); //Chcê walczyæ.

	if (Wld_IsTime(21,00,23,59)) {
		AI_Output (self, other,"HeroWannaFightArena_55_01"); //Wszystkim chce siê ju¿ spaæ. Walka w takich godzinach nie ma sensu.
	}

	else if (Wld_IsTime(00,00,04,00)) {
		AI_Output (self, other,"HeroWannaFightArena_55_02"); //¯artujesz chyba. Jest œrodek nocy!
	}

	else if (Wld_IsTime(04,00,09,00)) {
		AI_Output (self, other,"HeroWannaFightArena_55_03"); //Czas na pracê, nie na potyczki!
	}
	
	else if (Wld_IsTime(09,00,19,00)) {
		AI_Output (self, other,"HeroWannaFightArena_55_04"); //Walki odbywaj¹ siê tylko wieczorami.
	};


};

func void HeroSayToKurgan_Keep() {
	AI_Output (other, self,"HeroSayToKurgan_Keep_55_00"); //Trzymaj.
};

func void HeroSayToKurgan_Later() {
	AI_Output (other, self,"HeroSayToKurgan_Later_55_00"); //Mo¿e póŸniej.
};

func void HeroSayToKurgan_NoMoney() {
	AI_Output (other, self,"HeroSayToKurgan_NoMoney_55_00"); //Nie mam tyle z³ota.
	AI_Output (self, other,"HeroSayToKurgan_NoMoney_15_01"); //Có¿, jeœli naprawdê chcesz walczyæ, to musisz je zdobyæ.
};

func void KurganSayToHero_NooneWantFight() {
	AI_Output (self, other,"KurganSayToHero_NooneWantFight_55_00"); //Teraz nikt nie chce z tob¹ walczyæ. PrzyjdŸ póŸniej.
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
 	description = "Chcê walczyæ.";
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
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_55_00"); //Na pocz¹tek dostaniesz prostego przeciwnika.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_55_01"); //Bêdzie to Fed. ZnaleŸliœmy go w zachodniej czêœci Górniczej Doliny.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_55_02"); //Twierdzi, ¿e by³ kopaczem. Nauczyliœmy go tego i owego, uzbroiliœmy.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_55_03"); //To dobry cz³owiek. Nale¿y siê 100 sztuk z³ota.
		
		Log_CreateTopic (TOPIC_Kurgan_arena, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Kurgan_arena, LOG_RUNNING);
		B_LogEntry (TOPIC_Kurgan_arena, "Kurgan, ³owca orków, organizuje walki na arenie. Szykuje siê niez³a zabawa.");
		KurganArenaQuest = 1;

		Info_ClearChoices (DIA_NASZ_115_Kurgan_fed);
		if (npc_hasitems (other, ItMI_gold) >=100){
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_fed, "Mo¿e póŸniej.", DIA_NASZ_115_Kurgan_fed_no);
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_fed, "Trzymaj (zap³aæ 100 szt. z³ota).", DIA_NASZ_115_Kurgan_fed_ok);
		}
		else {
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_fed, "Nie mam tyle z³ota.", DIA_NASZ_115_Kurgan_fed_nomoney);
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_ok_55_01"); //IdŸ na arenê.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fed_ok_55_02"); //Fed te¿ siê tam uda.

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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedwon_55_00"); //Œwietna walka!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedwon_55_01"); //Bez w¹tpienia zas³u¿y³eœ na nagrodê!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedwon_55_02"); //150 sztuk z³ota. Gdybyœ chcia³ ponownie walczyæ, tylko powiedz.

	DodajReputacje (2, REP_LOWCY);
	B_LogEntry (TOPIC_Kurgan_arena, "Pokona³em Feda.");
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedlost_55_00"); //Przegra³eœ. Twoje z³oto dostaje Fed.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_fedlost_55_01"); //Jeœli bêdziesz chcia³ wyrównaæ z nim rachunki, to przyjdŸ, zap³aæ i walcz!
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
 	description = "Chcê walczyæ.";
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
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_55_00"); //Dobra. Myœlê, ¿e Kjorn bêdzie dobrym przeciwnikiem.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_55_01"); //By³ ³owc¹ smoków, uwa¿aj na niego.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_55_02"); //Ta walka bêdzie wyrównana i dobra. 200 sztuk z³ota.

		B_LogEntry (TOPIC_Kurgan_arena, "Kjorn to mój kolejny przeciwnik.");

		Info_ClearChoices (DIA_NASZ_115_Kurgan_kjorn);
		if (npc_hasitems (other, ItMI_gold) >=200){
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kjorn, "Mo¿e póŸniej.", DIA_NASZ_115_Kurgan_kjorn_no);
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kjorn, "Trzymaj (zap³aæ 200 szt. z³ota).", DIA_NASZ_115_Kurgan_kjorn_ok);
		}
		else {
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kjorn, "Nie mam tyle z³ota.", DIA_NASZ_115_Kurgan_kjorn_nomoney);
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_ok_55_01"); //IdŸ na arenê.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjorn_ok_55_02"); //Kjorn bêdzie gotowy.

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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjornwon_55_00"); //No proszê, znowu wygra³eœ.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjornwon_55_01"); //Có¿, twoja nagroda.

	DodajReputacje (3, REP_LOWCY);
	B_LogEntry (TOPIC_Kurgan_arena, "Pokona³em Kjorna.");
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjornlost_55_00"); //Nie da siê ukryæ, ¿e przegra³eœ.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kjornlost_55_01"); //Jeœli zechcesz ma³ego rewan¿u, to mów œmia³o.
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
 	description = "Chcê walczyæ.";
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
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferros_55_01"); //To Feros. Uwa¿aj, œwietnie radzi sobie z mieczem.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferros_55_02"); //500 sztuk z³ota.

			Info_ClearChoices (DIA_NASZ_115_Kurgan_ferros);
			if (npc_hasitems (other, ItMI_gold) >=500) {
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_ferros, "Mo¿e póŸniej.", DIA_NASZ_115_Kurgan_ferros_no);
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_ferros, "Trzymaj (zap³aæ 500 szt. z³ota).", DIA_NASZ_115_Kurgan_ferros_ok);
			}
			else {
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_ferros, "Nie mam tyle z³ota.", DIA_NASZ_115_Kurgan_ferros_nomoney);
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferros_ok_55_01"); //Có¿, powodzenia.

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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroswon_55_00"); //To by³a œwietna walka!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroswon_55_01"); //Nic bardziej mnie nie pasjonuje, ni¿ starcie dwóch œwietnych wojowników.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroswon_55_02"); //Znalaz³em ten amulet wczoraj. Wygl¹da na przydatny. WeŸ go.

	Createinvitems (self, ItAm_Hp_01, 1);
	B_Giveinvitems (self, other, ItAm_Hp_01, 1);

	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroswon_55_03"); //A, no i z³oto oczywiœcie.

	DodajReputacje (4, REP_LOWCY);
	B_LogEntry (TOPIC_Kurgan_arena, "Pokona³em Ferosa.");
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ferroslost_55_00"); //Nie przejmuj siê. Nastêpnym razem ci siê uda.
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
 	description = "Chcê walczyæ.";
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
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_00"); //Œwietnie. Zdajesz sobie chyba sprawê, ¿e jesteœ szanowanym gladiatorem.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_01"); //Kilku ludzi domaga³o siê, bym wyznaczy³ walkê jednego gladiatora kontra dwóch.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_02"); //Jesteœ jak dot¹d niepokonany. Nadajesz siê do takiej potyczki.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_03"); //Godar i Hokurn chcieli ci pokazaæ kto rz¹dzi na arenie.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_04"); //Masz szansê ich utwierdziæ w przekonaniu, ¿e to ty tutaj rz¹dzisz.
			AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_55_05"); //Trzech gladiatorów, to trzykrotne wpisowe. Wystarczy mi wiêc 400 sztuk z³ota.

			Info_ClearChoices (DIA_NASZ_115_Kurgan_GodarHokurn);
			if (npc_hasitems (other, ItMI_gold) >=400){
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_GodarHokurn, "Mo¿e póŸniej.", DIA_NASZ_115_Kurgan_GodarHokurn_no);
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_GodarHokurn, "Trzymaj (zap³aæ 400 szt. z³ota).", DIA_NASZ_115_Kurgan_GodarHokurn_ok);
			}
			else {
				Info_AddChoice	  (DIA_NASZ_115_Kurgan_GodarHokurn, "Nie mam tyle z³ota.", DIA_NASZ_115_Kurgan_GodarHokurn_nomoney);
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurn_ok_55_01"); //IdŸ na arenê i nie daj siê pokonaæ. Powodzenia.

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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnWon_55_00"); //Jesteœ mistrzem. Brawo!
	
	/* KAPITEL 4 */
	if (KAPITEL >= 4) {
	
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnWon_55_01"); //Ale jest jeszcze jedna osoba, która mo¿e pogrzebaæ tw¹ dumê.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnWon_55_02"); //Stocz walkê ze mn¹! Zobaczymy, czy dasz radê tak¿e mi. ChodŸ!
		
		B_LogEntry(TOPIC_Kurgan_arena,"Pokona³em Godara i Hokurna. Pora na najpotê¿niejszego gladiatora, czyli szefa areny.");
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
	
	
	
	
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnWon_55_03"); //Wyj¹tkowe widowisko. Oczywiœcie nagroda pieniê¿na! 800 sztuk dla ciebie.

	DodajReputacje (5, REP_LOWCY);
	B_LogEntry (TOPIC_Kurgan_arena, "Pokona³em Godara i Hokurna.");
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_YoudBetterKillOrc_55_00"); //Lepiej idŸ polowaæ na orków. Nie marnuj si³y na g³upie potyczki.
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnLost_55_00"); //O stary... Walka wyj¹tkowa.
	
	/* KAPITEL 4 */
	if (KAPITEL >= 4) {
	
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnLost_55_01"); //Ale nie wygra³eœ, zatem nie mo¿esz szczyciæ siê tytu³em mistrza areny.
		KurganSay_YoudBetterKillOrc();
		
		B_LogEntry(TOPIC_Kurgan_arena,"Zosta³em pokonany przez dwóch wojowników. Niestety, okaza³o siê to dla mnie za du¿o.");
		Log_SetTopicStatus(TOPIC_Kurgan_arena,LOG_FAILED);
		Npc_ExchangeRoutine(NASZ_113_Godar, "InCastle");
		Npc_ExchangeRoutine(NASZ_114_Hokurn, "InCastle");
		Kurgan_walka=0;

		
		return;
	};
	
	// ----- ----- ----- ----
	
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_GodarHokurnLost_55_02"); //Ale jedyny klucz do nastêpnej walki to wygraæ z tymi dwoma.
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
 	description = "Chcê walczyæ.";
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
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_00"); //Szczerze mówi¹c, czeka³em na ten moment. Ostatnim twoim przeciwnikiem bêdê ja.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_01"); //Chyba obaj zdajemy sobie sprawê, ¿e ta walka nie bêdzie prosta. Jesteœ bardzo dobry, pokona³eœ wszystkich.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_02"); //Dwóch mistrzów areny walcz¹cych miêdzy sob¹... To przecie¿ wspania³e widowisko.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_03"); //Warte wielu sztuk z³ota. 1000 sztuk, to moja propozycja, a raczej warunek.
		AI_Output (other,self ,"DIA_NASZ_115_Kurgan_kurgan_15_04"); //Czy jeœli wygram, dostanê ca³y twój tysi¹c, czy 500 sztuk weŸmiesz dla siebie jako organizator?
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_55_05"); //Zwyciêzcy tej walki nale¿y siê sporo z³ota. Je¿eli wygrasz, dostaniesz w sumie 2 tysi¹ce sztuk z³ota.

		Info_ClearChoices (DIA_NASZ_115_Kurgan_kurgan);
		if (npc_hasitems (other, ItMI_gold) >=1000){
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kurgan, "Mo¿e póŸniej.", DIA_NASZ_115_Kurgan_kurgan_no);
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kurgan, "Trzymaj (zap³aæ 1000 szt. z³ota).", DIA_NASZ_115_Kurgan_kurgan_ok);
			}
		else {
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_kurgan, "Nie mam tyle z³ota.", DIA_NASZ_115_Kurgan_kurgan_nomoney);
		};
		
	};

};

FUNC VOID DIA_NASZ_115_Kurgan_kurgan_no()
{
	HeroSayToKurgan_Later();
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_no_55_01"); //No weŸ ty... Tak d³ugo czeka³em na walkê...
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_no_55_02"); //Niech bêdzie. Ale przyjdŸ póŸniej.

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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurgan_ok_55_01"); //Dobra, czas udaæ siê na arenê.

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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_arena_55_00"); //A teraz taka ma³a niespodzianka ode mnie.
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaZamek_55_00"); //Gotuj broñ. Powodzenia.
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

	AI_Output (other, self,"DIA_NASZ_115_Kurgan_DuchPrzyzwany_15_01"); //Na Inosa! Có¿ to? Mówi³eœ, ¿e nie mo¿na u¿ywaæ magii.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_DuchPrzyzwany_55_02"); //Ale ja u¿y³em jej przed rozpoczêciem walki. To mój duch. Walczysz wiêc ze mn¹, ale w dwóch postaciach.
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_YouArePro_55_00"); //Jako ¿e jesteœ nowym mistrzem, dostaniesz równie¿ wspania³e ostrze.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_YouArePro_55_01"); //Zg³oœ siê po nie u Jana.
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganwon_55_00"); //Wygl¹da na to, ¿e mamy nowego mistrza areny.
	
	/* KAPITEL 4 */
	if (KAPITEL >= 4) {
	
		KurganSay_YouArePro();
	
		B_LogEntry (TOPIC_Kurgan_arena, "Pokona³em Kurgana i zosta³em mistrzem areny.");
		JestesMistrzemAreny = TRUE;
		DodajReputacje (6, REP_LOWCY);
		B_GivePlayerXP (1000);
		Log_SetTopicStatus (TOPIC_Kurgan_arena, LOG_SUCCESS);
		KurganArenaQuest = 2;
		Npc_ExchangeRoutine(NASZ_115_Kurgan, "InCastle");
		Kurgan_walka=0;
	
		return;
	};
	
	
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganwon_55_01"); //Przyjmij moje gratulacje, no i pieni¹dze oczywiœcie.

	B_LogEntry (TOPIC_Kurgan_arena, "Pokona³em Kurgana i zosta³em mistrzem areny.");
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
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganlost_55_00"); //Wygra³em.
	
	/* KAPITEL 4 */
	if (KAPITEL >= 4) {

		AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganlost_55_01"); //W sumie nie dziwiê siê, m³odzieñcze.
		KurganSay_YoudBetterKillOrc();
		
		B_LogEntry(TOPIC_Kurgan_arena,"Zosta³em pokonany przez Kurgana.");
		Log_SetTopicStatus(TOPIC_Kurgan_arena,LOG_FAILED);
		Npc_ExchangeRoutine(self, "InCastle");
		Kurgan_walka=0;
	
		return;
	};
	
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_kurganlost_55_02"); //Ale spodziewam siê, ¿e wyzwiesz mnie jeszcze raz.
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
 	description = "Rethon chcia³by z tob¹ walczyæ.";
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

	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_rethon_15_00"); //Rethon chcia³by z tob¹ walczyæ.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_01"); //A niby dlaczego mia³bym stoczyæ z nim pojedynek?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_02"); //Myœli, ¿e skoro szkoli pocz¹tkuj¹cych w walce mieczem, to dorównuje mi umiejêtnoœciami? W takim razie jest w b³êdzie.
	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_rethon_55_03"); //Nie ma jakiegoœ sposobu, by ciê przekonaæ?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_04"); //Có¿...
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_05"); //Gdybyœ przyniós³ mi ko³o zêbate, móg³bym siê zgodziæ. Potrzebujê go do dokoñczenia katapulty.
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_rethon_55_06"); //Gdzie niby mam znaleŸæ ko³o zêbate?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_07"); //W Starej Kopalni z pewnoœci¹ jakieœ maszyny maj¹ takie czêœci.
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_rethon_55_08"); //Pracowa³em w Starej Kopalni ca³kiem niedawno i zapewniam ciê, ¿e nie ma tam ¿adnych maszyn.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_09"); //Ja mówiê o prawdziwej Starej Kopalni z czasów bariery. Zapewne da siê dostaæ tam jakoœ po ska³ach.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon_55_10"); //Spróbuj znaleŸæ drogê i przynieœ mi ko³o zêbate.

	B_LogEntry (TOPIC_Rethon_kurgan, "Kurgan powiedzia³, ¿e jeœli przyniosê mu ko³o zêbate, to stoczy walkê z Rethonem. Zasugerowa³ mi, bym rozejrza³ siê wœród gruzów Starej Kopalni. Muszê znaleŸæ drogê po ska³ach, by siê tam dostaæ, a potem znaleŸæ ma³¹ drewnian¹ czêœæ.");
	
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
 	description = "Mam ko³o zêbate.";
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

	AI_Output (other,self ,"DIA_NASZ_115_Kurgan_rethon2_15_00"); //Mam ko³o zêbate.
	B_Giveinvitems (other, self, ItNa_KoloZebate, 1);
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon2_55_01"); //Nareszcie! Teraz bêdê móg³ wznowiæ prace przy mojej maszynie.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon2_55_02"); //Bêdê walczy³ z Rethonem. Powiedz mu, ¿eby przyszed³ na arenê.

	B_GivePlayerXP (50);
	Kurgan_OK = TRUE;
	B_LogEntry (TOPIC_Rethon_kurgan, "Kurgan zgodzi³ siê przyj¹æ wyzwanie Rethona. Muszê powiedzieæ Rethonowi, by uda³ siê na arenê.");

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
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon3_55_00"); //No, jesteœ wreszcie. Czekaliœmy na organizatora tej walki.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon3_55_01"); //Odsuñ siê teraz i patrz na pojedynek prawdziwych gladiatorów.

		Rethon3Finished = TRUE;
		Info_ClearChoices (DIA_NASZ_115_Kurgan_rethon3);
			Info_AddChoice	  (DIA_NASZ_115_Kurgan_rethon3, DIALOG_ENDE, DIA_NASZ_115_Kurgan_rethon3_end);
	}
	else {
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_rethon3_55_02"); //PrzyjdŸ wieczorem. Wtedy zobaczysz, co potrafi¹ ³owcy orków!
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
	description = "Podobno dokonano napadu na myœliwych.";
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
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_goth_15_00"); //Podobno dokonano napadu na myœliwych.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_goth_55_01"); //I dlaczego przychodzisz z tym do mnie? Coo?!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_goth_55_02"); //Zapomnij kole¿ko. Nic tu po tobie.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_goth_55_03"); //I nie rozmawiaj nawet z moimi ch³opakami. Oni i tak nic ci nie powiedz¹.

	B_LogEntry (TOPIC_Goth_kradziez, "Kurgan, szef areny, strasznie siê zdenerwowa³, gdy wspomnia³em mu o rozboju. To podejrzane, ale có¿ z tego, skoro nie mam nic na niego, a jego ch³opcy nic mi nie pisn¹.");

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
	description = "Co z walk¹ na arenie?";
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
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_WhatWithArena_15_00"); //Co z walk¹ na arenie?
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_WhatWithArena_15_01"); //Jak to co? Gdy tylko rozwalimy orków, wracamy do naszych potyczek!

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
	description = "Chcia³bym stoczyæ walkê na arenie...";
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
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_ArenaKap4_15_00"); //Chcia³bym stoczyæ walkê na arenie...

	if (Wld_IsTime(21,00,23,59)) || (Wld_IsTime(00,00,06,00))
	{
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_01"); //Mój drogi wojowniku! O tej godzinie siê œpi albo biesiaduje, a nie walczy!
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_02"); //PrzyjdŸ za dnia, wtedy o tym porozmawiamy. A tym czasem napij siê ze mn¹ piwa i opowiedz jakiœ kawa³!
		return;
	};

	HeroChceWalczycNaArenieWZamku = TRUE;
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_03"); //A niech ciê, tobie ci¹gle ma³o! Zaraz coœ wykombinujemy. Pokona³eœ ju¿ Godara i Hokurna?
	
	if (npc_knowsinfo(other,DIA_NASZ_115_Kurgan_GodarHokurnWon)) {
		AI_Output (other, self,"DIA_NASZ_115_Kurgan_ArenaKap4_15_04"); //Tak.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_05"); //W takim razie zosta³em ju¿ tylko ja. Miejmy za sob¹ tê potyczkê. ChodŸ za mn¹!
		Kurgan_walka = 5;
		Npc_ExchangeRoutine(self,"ArenaZamek");
	} else {
		AI_Output (other, self,"DIA_NASZ_115_Kurgan_ArenaKap4_15_06"); //Nie.
		AI_Output (self, other,"DIA_NASZ_115_Kurgan_ArenaKap4_15_07"); //A wiêc jazda, ju¿! Ch³opaki na pewno chêtnie spior¹ ci ty³ek. Do walki!
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
	description = "Keroloth kaza³ mi poprowadziæ szturm na zamek.";
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
	AI_Output (other, self,"DIA_NASZ_115_Kurgan_SzturmNaZamek_15_00"); //Keroloth kaza³ mi poprowadziæ szturm na zamek.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_SzturmNaZamek_15_01"); //CH£OPCY, S£YSZELIŒCIE? NASTA£ CZAS, W KTÓRYM SPE£NI SIÊ NASZE PRAGNIENIE.
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_SzturmNaZamek_15_02"); //ODBIJEMY ZAMEK, ROZGNIECIEMY SI£Y ORKÓW! ZOSTAWCIE SWOJE TROSKI I OBAWY TUTAJ. ODWAGA TO DRUGIE IMIÊ £OWCÓW ORKÓW!
	AI_Output (self, other,"DIA_NASZ_115_Kurgan_SzturmNaZamek_55_03"); //Jesteœmy gotowi, prowadŸ.

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

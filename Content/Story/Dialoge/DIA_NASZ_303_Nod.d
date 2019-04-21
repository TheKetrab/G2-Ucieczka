func void MakeBanditsAngry()
{
	NASZ_303_Nod.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_303_Nod, GIL_BDT);
	NASZ_304_Bam.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_304_Bam, GIL_BDT);
	NASZ_305_Rabon.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_305_Rabon, GIL_BDT);
	NASZ_306_Perrot.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_306_Perrot, GIL_BDT);
	NASZ_307_Monk.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_307_Monk, GIL_BDT);
	NASZ_308_Frut.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_308_Frut, GIL_BDT);
	NASZ_309_Straznik.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_309_Straznik, GIL_BDT);
	NASZ_310_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_310_Bandzior, GIL_BDT);
	NASZ_311_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_311_Bandzior, GIL_BDT);
	NASZ_312_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_312_Bandzior, GIL_BDT);
	NASZ_313_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_313_Bandzior, GIL_BDT);
	NASZ_314_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_314_Bandzior, GIL_BDT);
	NASZ_315_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_315_Bandzior, GIL_BDT);
	NASZ_316_Carry.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_316_Carry, GIL_BDT);
	NASZ_317_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_317_Bandzior, GIL_BDT);
	NASZ_318_Gobby.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_318_Gobby, GIL_BDT);
	NASZ_319_Niewolnik.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_319_Niewolnik, GIL_BDT);
	NASZ_320_Niewolnik.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_320_Niewolnik, GIL_BDT);
	NASZ_321_Niewolnik.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_321_Niewolnik, GIL_BDT);
	NASZ_322_Niewolnik.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_322_Niewolnik, GIL_BDT);
	NASZ_323_Niewolnik.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_323_Niewolnik, GIL_BDT);
	NASZ_324_Niewolnik.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_324_Niewolnik, GIL_BDT);
	NASZ_326_Domenic.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_326_Domenic, GIL_BDT);
	NASZ_327_Danny.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_327_Danny, GIL_BDT);
};

func void MakeBanditsAngry2()
{
	B_Attack (NASZ_303_Nod, hero, AR_KILL, 1);
	B_Attack (NASZ_304_Bam, hero, AR_KILL, 1);
	B_Attack (NASZ_305_Rabon, hero, AR_KILL, 1);
	B_Attack (NASZ_306_Perrot, hero, AR_KILL, 1);
	B_Attack (NASZ_307_Monk, hero, AR_KILL, 1);
	B_Attack (NASZ_308_Frut, hero, AR_KILL, 1);
	B_Attack (NASZ_309_Straznik, hero, AR_KILL, 1);
	B_Attack (NASZ_310_Bandzior, hero, AR_KILL, 1);
	B_Attack (NASZ_311_Bandzior, hero, AR_KILL, 1);
	B_Attack (NASZ_312_Bandzior, hero, AR_KILL, 1);
	B_Attack (NASZ_313_Bandzior, hero, AR_KILL, 1);
	B_Attack (NASZ_314_Bandzior, hero, AR_KILL, 1);
	B_Attack (NASZ_315_Bandzior, hero, AR_KILL, 1);
	B_Attack (NASZ_316_Carry, hero, AR_KILL, 1);
	B_Attack (NASZ_317_Bandzior, hero, AR_KILL, 1);
	B_Attack (NASZ_318_Gobby, hero, AR_KILL, 1);
	B_Attack (NASZ_326_Domenic, hero, AR_KILL, 1);
	B_Attack (NASZ_327_Danny, hero, AR_KILL, 1);

};

var int Nod_Stopowanie;
var int NOD_READY_TO_KILL;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_EXIT   (C_INFO)
{
	npc         = NASZ_303_Nod;
	nr          = 999;
	condition   = DIA_NASZ_303_Nod_EXIT_Condition;
	information = DIA_NASZ_303_Nod_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_303_Nod_EXIT_Condition()
{
	if (NOD_READY_TO_KILL == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_siema   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 1;
 	condition   = DIA_NASZ_303_Nod_siema_Condition;
 	information = DIA_NASZ_303_Nod_siema_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_303_Nod_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)) && (npc_knowsinfo (other, DIA_NASZ_303_Nod_who)) && (Nod_Stopowanie == FALSE) && (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_303_Nod_siema_15_00"); //Czego chcesz?
		
};

//*********************************************************************
//	Info Who
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_who   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 2;
 	condition   = DIA_NASZ_303_Nod_who_Condition;
 	information = DIA_NASZ_303_Nod_who_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_303_Nod_who_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_303_Nod_who_Info()
{

	
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_15_00"); //Co tu robisz i kim jeste�?

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
		
		Info_AddChoice	  (DIA_NASZ_303_Nod_who, "By�ym kopaczem.", DIA_NASZ_303_Nod_who_miner);
		Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Przybywam zza g�r.", DIA_NASZ_303_Nod_who_none);
		if (hero.guild == GIL_OUT) {
		Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Jestem my�liwym.", DIA_NASZ_303_Nod_who_mysliwy);
		};
		if (hero.guild == GIL_DJG) {
		Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Jestem �owc� ork�w.", DIA_NASZ_303_Nod_who_lowca);
		};
};

FUNC VOID DIA_NASZ_303_Nod_who_kill()
{
	AI_StopProcessInfos (self);

	B_Attack (NASZ_303_Nod, other, AR_KILL, 1);
	B_Attack (NASZ_304_Bam, other, AR_KILL, 1);
	B_Attack (NASZ_310_Bandzior, other, AR_KILL, 1);
};

FUNC VOID DIA_NASZ_303_Nod_who_miner()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_miner_15_00"); //By�ym kopaczem.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_miner_55_01"); //Kopaczem? Cokolwiek tu robisz, nie jeste� bandyt�... Zabi�!

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "KONIEC", DIA_NASZ_303_Nod_who_kill);
};

FUNC VOID DIA_NASZ_303_Nod_who_none()
{

	AI_Output (other, self,"DIA_NASZ_303_Nod_who_none_15_00"); //Przybywam zza g�r.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_none_55_01"); //Ah, w ko�cu kto� od Samuela. Jak wygl�da sytuacja na statku?
	AI_Output (other, self,"DIA_NASZ_303_Nod_who_none_55_02"); //Stabilnie, okr�ty wygl�daj� coraz lepiej.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_none_55_03"); //I zosta�e� przys�any, �eby nam pom�c? Nie spodziewa�em si�, �e Samuel wy�le tu takie chuchro. Przy takiej posturze nie nadajesz si� do pilnowania kopaczy.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_none_55_04"); //A wi�c co takiego mo�esz nam zaoferowa�?	

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Mam wtyki w�r�d ludzi w G�rniczej Dolinie.", DIA_NASZ_303_Nod_who_wtyki);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Znam okolic�. Kr�ci�em si� tu troch�.", DIA_NASZ_303_Nod_who_okolica);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Dobrze walcz�.", DIA_NASZ_303_Nod_who_fight);
};

func void NodSay_Foreigner() {
	AI_Output (self, other,"NodSay_Foreigner_55_00"); //Szybko sobie wyja�nili�my, �e nie jeste� jednym z nas. Ch�opcy, bra� go!
};

FUNC VOID DIA_NASZ_303_Nod_who_mysliwy()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_mysliwy_15_00"); //Jestem my�liwym.
	NodSay_Foreigner();
	
	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "KONIEC", DIA_NASZ_303_Nod_who_kill);
};

FUNC VOID DIA_NASZ_303_Nod_who_lowca()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_lowca_15_00"); //Jestem �owc� ork�w.
	NodSay_Foreigner();

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "KONIEC", DIA_NASZ_303_Nod_who_kill);
};

FUNC VOID DIA_NASZ_303_Nod_who_fight()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_fight_15_00"); //Dobrze walcz�.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_fight_55_01"); //To jest podstawa, m�j drogi. I to nie wystarczy.

};

FUNC VOID DIA_NASZ_303_Nod_who_okolica()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_okolica_15_00"); //Znam okolic�. Kr�ci�em si� tu troch�.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_okolica_55_01"); //To si� mo�e przyda�. Czas sprawdzi�, czy rzeczywi�cie si� nadajesz.

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
};

FUNC VOID DIA_NASZ_303_Nod_who_wtyki()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_wtyki_15_00"); //Mam wtyki w�r�d ludzi w G�rniczej Dolinie.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_wtyki_55_01"); //Czyli jeste� jednym z nich...
	NodSay_Foreigner();


	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "KONIEC", DIA_NASZ_303_Nod_who_kill);
		
};

//*********************************************************************
//	Info What
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_what   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 4;
 	condition   = DIA_NASZ_303_Nod_what_Condition;
 	information = DIA_NASZ_303_Nod_what_Info;
 	permanent   = FALSE;
 	description = "Co mam zrobi�?";
};

FUNC INT DIA_NASZ_303_Nod_what_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_who))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_303_Nod_what_15_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_303_Nod_what_55_01"); //We� ten papier ze sto�u i go przeczytaj.
	
};

var int FRUT_MIKSTURY;
//*********************************************************************
//	Info Pismo
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_pismo   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 5;
 	condition   = DIA_NASZ_303_Nod_pismo_Condition;
 	information = DIA_NASZ_303_Nod_pismo_Info;
 	permanent   = FALSE;
 	description = "Przeczyta�em.";
};

FUNC INT DIA_NASZ_303_Nod_pismo_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_what)
		&& (Use_PradawnePismo_1_OneTime == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_pismo_Info()
{
	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_15_00"); //Przeczyta�em.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_01"); //I? Rozumiesz co� z tego?
	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_15_02"); //Nie do ko�ca...
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_03"); //Pewnie! Dlatego to ja jestem tutaj od my�lenia.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_04"); //S�uchaj uwa�nie: Gdy tutaj przybyli�my, Bam znalaz� dziwnie wygl�daj�cy zw�j.	Oczywi�cie, zjad�a go ciekawo�� i ani si� obejrzeli�my, a przywo�a� jakiego� maga.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_05"); //Ten z kolei, mia� przy sobie w�a�nie to pismo. Poza tym, przy wej�ciu na klif naprzeciw naszego obozu pojawi�a si� magiczna piecz��.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_06"); //Je�li dobrze si� przyjrzysz, zobaczysz miejsce na artefakt, kt�ry powinien odblokowa� przej�cie.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_07"); //Jestem jednak przekonany, �e zosta� on podzielony. Pytanie tylko, ile jest tych cz�ci i gdzie ich szuka�...

	Wld_InsertNpc	(NASZ_408_Straznik,"OW_SAWHUT_MOLERAT_SPAWN01");

	B_LogEntry (TOPIC_Niedostepny_Klif, "Nod chce, bym przyni�s� mu wszystkie cz�ci artefaktu, kt�ry usunie magiczn� piecz��. Twierdzi, �e cz�ci powinny znajdowa� si� w kryptach podobnych do tej, w kt�rej on sam przebywa.");
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Uda�o mi si� dotrze� do szefa bandyt�w. Szuka on jakiego� artefaktu... Musz� pom�c mu go znale��. Mo�e przyda si� do walki z orkami?");
	
	Info_ClearChoices (DIA_NASZ_303_Nod_pismo);
		Info_AddChoice	  (DIA_NASZ_303_Nod_pismo, "Cz�ci artefaktu mog� by� dobrze bronione...", DIA_NASZ_303_Nod_pismo_fight);
		Info_AddChoice	  (DIA_NASZ_303_Nod_pismo, "Du�o biegania przede mn�.", DIA_NASZ_303_Nod_pismo_bieganie);
		Info_AddChoice	  (DIA_NASZ_303_Nod_pismo, "A ty, jak myslisz, gdzie ich szuka�?", DIA_NASZ_303_Nod_pismo_gdzie);

};

FUNC VOID DIA_NASZ_303_Nod_pismo_fight()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_fight_15_00"); //Cz�ci artefaktu mog� by� dobrze bronione...
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_fight_55_01"); //Mo�esz uda� si� do Fruta. Niech da ci kilka mikstur.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_fight_55_02"); //A je�li liczysz na co� wi�cej, to odst�pi� ci par� �up�w, gdy ju� znajdziemy si� w �rodku.

	FRUT_MIKSTURY = TRUE;

};

FUNC VOID DIA_NASZ_303_Nod_pismo_bieganie()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_bieganie_15_00"); //Du�o biegania przede mn�.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_bieganie_55_01"); //A przede mn� du�o czekania!
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_bieganie_55_02"); //Przychod� do mnie z ka�d� cz�ci� artefaktu. Je�li umrzesz, to przynajmniej jakie� ju� b�d� mia�.

};

FUNC VOID DIA_NASZ_303_Nod_pismo_gdzie()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_gdzie_15_00"); //A ty, jak myslisz, gdzie ich szuka�?
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_gdzie_55_01"); //Wydaje mi si�, �e b�d� ukryte w kryptach podobnych do tej.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_gdzie_55_02"); //Je�eli rzeczywi�cie znasz okolic� tak dobrze, jak twierdzisz, to nie powiniene� mie� problemu ze znalezieniem takich miejsc.

};


//*********************************************************************
//	Info DoneSila
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_donesila   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 6;
 	condition   = DIA_NASZ_303_Nod_donesila_Condition;
 	information = DIA_NASZ_303_Nod_donesila_Info;
 	permanent   = FALSE;
 	description = "Mam artefakt spod g�rskiej fortecy.";
};

FUNC INT DIA_NASZ_303_Nod_donesila_Condition()
{
	if (npc_hasitems (other, ItNa_Artefakt_Sila) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_donesila_Info()
{
	AI_Output (other,self ,"DIA_NASZ_303_Nod_donesila_15_00"); //Mam artefakt spod g�rskiej fortecy.
	AI_Output (self, other,"DIA_NASZ_303_Nod_donesila_55_01"); //Dawaj.
	
	B_giveinvitems (other, self, ItNa_Artefakt_Sila, 1);
	B_GivePlayerXP (500);
};

//*********************************************************************
//	Info DoneMoc
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_donemoc   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 7;
 	condition   = DIA_NASZ_303_Nod_donemoc_Condition;
 	information = DIA_NASZ_303_Nod_donemoc_Info;
 	permanent   = FALSE;
 	description = "Mam artefakt z krypty pod wulkanem.";
};

FUNC INT DIA_NASZ_303_Nod_donemoc_Condition()
{
	if (npc_hasitems (other, ItNa_Artefakt_Moc) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_donemoc_Info()
{
	AI_Output (other,self ,"DIA_NASZ_303_Nod_donemoc_15_00"); //Mam artefakt z krypty pod wulkanem.
	AI_Output (self, other,"DIA_NASZ_303_Nod_donemoc_55_01"); //O tak, o to chodzi.

	B_giveinvitems (other, self, ItNa_Artefakt_Moc, 1);
	B_GivePlayerXP (500);
	
};

//*********************************************************************
//	Info DoneOdpornosc
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_doneodpornosc   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 8;
 	condition   = DIA_NASZ_303_Nod_doneodpornosc_Condition;
 	information = DIA_NASZ_303_Nod_doneodpornosc_Info;
 	permanent   = FALSE;
 	description = "Mam artefakt z krypty w pobli�u zamku.";
};

FUNC INT DIA_NASZ_303_Nod_doneodpornosc_Condition()
{
	if (npc_hasitems (other, ItNa_Artefakt_Odpornosc) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_doneodpornosc_Info()
{
	AI_Output (other,self ,"DIA_NASZ_303_Nod_doneodpornosc_15_00"); //Mam artefakt z krypty w pobli�u zamku.
	AI_Output (self, other,"DIA_NASZ_303_Nod_doneodpornosc_55_01"); //�wietnie.

	B_giveinvitems (other, self, ItNa_Artefakt_Odpornosc, 1);
	B_GivePlayerXP (500);
	
};


//*********************************************************************
//	Info CoTeraz
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_coteraz   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 9;
 	condition   = DIA_NASZ_303_Nod_coteraz_Condition;
 	information = DIA_NASZ_303_Nod_coteraz_Info;
 	permanent   = FALSE;
 	description = "Co teraz?";
};

FUNC INT DIA_NASZ_303_Nod_coteraz_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_donesila)
	&&  npc_knowsinfo (other, DIA_NASZ_303_Nod_donemoc)
	&&  npc_knowsinfo (other, DIA_NASZ_303_Nod_doneodpornosc))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_coteraz_Info()
{
	AI_Output (other,self ,"DIA_NASZ_303_Nod_coteraz_15_00"); //Co teraz?
	AI_Output (self, other,"DIA_NASZ_303_Nod_coteraz_55_01"); //Mamy ju� wszystkie cz�ci, ale kto� musi z��czy� je w ca�o��.
	AI_Output (self, other,"DIA_NASZ_303_Nod_coteraz_55_02"); //Tutaj w obozie nikt nie zna si� na kowalstwie. Zabierz wszystkie cz�ci i znajd� jakiego� kowala w G�rniczej Dolinie.
	AI_Output (self, other,"DIA_NASZ_303_Nod_coteraz_55_03"); //Biegiem, szkoda czasu.

	B_LogEntry (TOPIC_Gestath_renegaci, "Nod powierzy� mi z��czenie w ca�o�� wszystkich cz�ci artefaktu. Ale zanim to zrobi�, lepiej powiadomi� Gestatha o ca�ej sytuacji.");
	
	B_giveinvitems (self, other, ItNa_Artefakt_Sila, 1);	
	B_giveinvitems (self, other, ItNa_Artefakt_Moc, 1);	
	B_giveinvitems (self, other, ItNa_Artefakt_Odpornosc, 1);
};

var int PRZELACZNIK_ARTEFAKT_DONE;
//*********************************************************************
//	Info KowalDone
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_kowaldone   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 10;
 	condition   = DIA_NASZ_303_Nod_kowaldone_Condition;
 	information = DIA_NASZ_303_Nod_kowaldone_Info;
 	permanent   = FALSE;
 	description = "Mam ca�y artefakt.";
};

FUNC INT DIA_NASZ_303_Nod_kowaldone_Condition()
{
	if (npc_hasitems (other, ItNa_Artefakt_Caly) >=1)
	&& (MIS_Psikusy_Done == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_kowaldone_Info()
{
	AI_Output (other,self ,"DIA_NASZ_303_Nod_kowaldone_15_00"); //Mam ca�y artefakt.
	AI_Output (self, other,"DIA_NASZ_303_Nod_kowaldone_55_01"); //Nie zawiod�e� mnie. Pora odblokowa� wrota.
	AI_Output (self, other,"DIA_NASZ_303_Nod_kowaldone_55_02"); //Za mn�!

	Npc_ExchangeRoutine (NASZ_303_Nod, "Artefakt");
	Npc_ExchangeRoutine (NASZ_304_Bam, "Artefakt");

	if (!npc_isdead (NASZ_305_Rabon))
	{
		Npc_ExchangeRoutine (NASZ_305_Rabon, "Artefakt");
	};

	Npc_ExchangeRoutine (NASZ_307_Monk, "Artefakt");
	Npc_ExchangeRoutine (NASZ_308_Frut, "Artefakt");
	Npc_ExchangeRoutine (NASZ_309_Straznik, "Artefakt");
	Npc_ExchangeRoutine (NASZ_310_Bandzior, "Artefakt");
	Npc_ExchangeRoutine (NASZ_313_Bandzior, "Artefakt");

	B_GivePlayerXP (500);

	AI_StopProcessInfos (self);
};

var int OneTimeFunctionNodKlif;
FUNC VOID PRZELACZNIKARTEFAKT_S1()
{
	if (OneTimeFunctionNodKlif == FALSE)
	{
		OneTimeFunctionNodKlif = TRUE;
		Nod_Stopowanie = TRUE;
		Npc_RemoveInvItems(hero,ItNa_Artefakt_Caly,1);

		Npc_ExchangeRoutine (NASZ_303_Nod, "Przelacznik");
		Wld_InsertNpc	(DemonLordNASZ,"FP_ROAM_OW_PATH_092_02"); 

		Wld_PlayEffect("SPELLFX_massdeath",  DemonLordNASZ, DemonLordNASZ, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_incovation_blue",  DemonLordNASZ, DemonLordNASZ, 0, 0, 0, FALSE );
		Wld_PlayEffect("SPELLFX_lightstar_white",  DemonLordNASZ, DemonLordNASZ, 0, 0, 0, FALSE );

		Wld_SendTrigger ("BARIERA_BANDYCI");

		Wld_InsertNpc	(Skeleton,"FP_ARTEFAKT_SKE_A"); 
		Wld_InsertNpc	(Skeleton,"FP_ARTEFAKT_SKE_B"); 
		Wld_InsertNpc	(Skeleton,"FP_ROAM_OW_PATH_092_01"); 

		PRZELACZNIK_ARTEFAKT_DONE = TRUE;
	};
};

func void SCRIPT_BARIERA_BANDYCI_FUNC() {

	if (PRZELACZNIK_ARTEFAKT_DONE == FALSE) {
		Wld_PlayEffect ("spellFX_RingRitual1", self, self, 0, 0, 0, FALSE);
		B_KillNPC(self);
	};
};

//*********************************************************************
//	Info WhatToDo
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_WhatToDo   (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 11;
 	condition   = DIA_NASZ_303_Nod_WhatToDo_Condition;
 	information = DIA_NASZ_303_Nod_WhatToDo_Info;
 	permanent   = FALSE;
 	description = "Co mam zrobi�?";
};

FUNC INT DIA_NASZ_303_Nod_WhatToDo_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_kowaldone) && (!PRZELACZNIK_ARTEFAKT_DONE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_WhatToDo_Info()
{
	AI_Output (other,self ,"DIA_NASZ_303_Nod_WhatToDo_15_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_303_Nod_WhatToDo_55_01"); //No jak to co? W�� artefakt w to puste miejsce w skale.

};

//*********************************************************************
//	WTF
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_wtf  (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 12;
 	condition   = DIA_NASZ_303_Nod_wtf_Condition;
 	information = DIA_NASZ_303_Nod_wtf_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_303_Nod_wtf_Condition()
{
	if (PRZELACZNIK_ARTEFAKT_DONE == TRUE) && (npc_isdead (DemonLordNASZ)) && (Npc_GetDistToWP(self,"OW_PATH_093") < 500)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_wtf_Info()
{
	AI_Output (self, other,"DIA_NASZ_303_Nod_wtf_15_00"); //Cholera jasna... Co to by�o?
	AI_Output (other,self ,"DIA_NASZ_303_Nod_wtf_55_01"); //Wygl�da na to, �e to miejsce rzeczywi�cie skrywa jak�� tajemnic�.
	AI_Output (self, other,"DIA_NASZ_303_Nod_wtf_55_02"); //Patrz. Jest tu jaka� platforma teleportacyjna. Uruchom j� i przejd� dalej. My zajmiemy pozycj� i b�dziemy chroni� twoje plecy.
	Npc_ExchangeRoutine (NASZ_303_Nod, "Artefakt");
};

//*********************************************************************
//	Oko Swiata
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_OkoSwiata  (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 20;
 	condition   = DIA_NASZ_303_Nod_OkoSwiata_Condition;
 	information = DIA_NASZ_303_Nod_OkoSwiata_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_303_Nod_OkoSwiata_Condition()
{
	if (npc_hasitems (other, ItNa_OkoSwiata) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_OkoSwiata_Info()
{
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_15_00"); //No? Znalaz�e� co�?
	AI_Output (other,self ,"DIA_NASZ_303_Nod_OkoSwiata_55_01"); //Tak, jaki� amulet i par� cennych przedmiot�w.
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_02"); //�wietnie. Daj mi go.
	B_giveinvitems (other, self, ItNa_OkoSwiata, 1);
	AI_Output (other,self ,"DIA_NASZ_303_Nod_OkoSwiata_55_03"); //Co teraz zro...
	AI_ReadyMeleeWeapon		(self);
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_04"); //A teraz pos�uchaj, gnido.
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_05"); //Tutaj ko�czy si� twoja przygoda. Przejrza�em ci� i pos�a�em go�ca za tob�. Widzia�, jak donosisz na nas obcym ludziom. Kr�tko m�wi�c: Nie jeste� bandyt�.
	AI_Output (other,self ,"DIA_NASZ_303_Nod_OkoSwiata_55_06"); //I pomy�la�e�, �e wyprujesz mi flaki? Dobrze to sobie wymy�li�e�. Ale nie u�atwi� ci tego.
	AI_ReadyMeleeWeapon		(other);
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_07"); //Nie jeste� ju� mi potrzebny i wierz mi: Nikt za tob� nie zat�skni.
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_08"); //Zaraz...
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_09"); //Co to by�o?
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_10"); //Monk, Bam - biegiem do obozu! Sprawd�cie, sk�d ten ha�as.
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_11"); //Frut i ja poradzimy sobie z tym tutaj.

	StopWatchFightNod = TRUE;
	NASZ_303_Nod.flags = 0;
	NOD_READY_TO_KILL = TRUE;

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Artefakt to Oko �wiata. Nod i ch�opaki chc� mi go odebra�. Zabij� go, a potem sprawdz� co dzieje si� w obozie bandyt�w. S�ysz� jakie� wrzaski...");
	
	B_LogEntry (TOPIC_Niedostepny_Klif, "Bandyci mnie przejrzeli... C�, musz� ich za�atwi�. Ciekawe, co dzieje si� teraz w obozie bandyt�w?");

};

//*********************************************************************
//	Kill
//*********************************************************************
INSTANCE DIA_NASZ_303_Nod_Kill  (C_INFO)
{
	npc         = NASZ_303_Nod;
 	nr          = 998;
 	condition   = DIA_NASZ_303_Nod_Kill_Condition;
 	information = DIA_NASZ_303_Nod_Kill_Info;
 	permanent   = FALSE;
 	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_303_Nod_Kill_Condition()
{
	if (NOD_READY_TO_KILL == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_303_Nod_Kill_Info()
{
	AI_StopProcessInfos (self);

	Gestath_Stopowanie = TRUE;
	
	B_Attack (NASZ_303_Nod, other, AR_KILL, 1);
	//B_Attack (NASZ_304_Bam, other, AR_KILL, 1);
	//B_Attack (NASZ_307_Monk, other, AR_KILL, 1);
	B_Attack (NASZ_308_Frut, other, AR_KILL, 1);

	B_StartOtherRoutine (NASZ_315_Bandzior,"Away");
	B_StartOtherRoutine (NASZ_316_Carry,"Away");

	B_StartOtherRoutine (NASZ_304_Bam,"Koniec");
	B_StartOtherRoutine (NASZ_307_Monk,"Koniec");

	B_KillNpc(NASZ_305_Rabon);
	B_KillNpc(NASZ_309_Straznik);
	B_KillNpc(NASZ_310_Bandzior);
	B_KillNpc(NASZ_311_Bandzior);
	B_KillNpc(NASZ_312_Bandzior);
	B_KillNpc(NASZ_313_Bandzior);
	B_KillNpc(NASZ_314_Bandzior);
	B_KillNpc(NASZ_405_VanGan);

	B_StartOtherRoutine (NASZ_319_Niewolnik,"After");
	B_StartOtherRoutine (NASZ_320_Niewolnik,"After");
	B_StartOtherRoutine (NASZ_321_Niewolnik,"After");
	B_StartOtherRoutine (NASZ_325_Grimes,"After");


	B_StartOtherRoutine (NASZ_213_Gestath,"Bandyci");
	B_StartOtherRoutine (NASZ_215_Kivo,"Bandyci");
	B_StartOtherRoutine (NASZ_201_Erak,"Bandyci");
	Wld_InsertNpc	(NASZ_221_Benito,"NASZ_BANDYCI_OBOZ_08");

	B_StartOtherRoutine (NASZ_306_Perrot,"Koniec");
	B_StartOtherRoutine (NASZ_315_Bandzior,"Koniec");
	B_StartOtherRoutine (NASZ_316_Carry,"Koniec");
	B_StartOtherRoutine (NASZ_317_Bandzior,"Koniec");
	B_StartOtherRoutine (NASZ_318_Gobby,"Koniec");
	B_StartOtherRoutine (NASZ_326_Domenic,"Koniec");
	B_StartOtherRoutine (NASZ_327_Danny,"Koniec");


	NASZ_303_Nod.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_303_Nod, GIL_BDT);
	NASZ_304_Bam.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_304_Bam, GIL_BDT);
	NASZ_307_Monk.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_307_Monk, GIL_BDT);
	NASZ_308_Frut.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_308_Frut, GIL_BDT);


	NASZ_306_Perrot.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_306_Perrot, GIL_BDT);
	NASZ_315_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_315_Bandzior, GIL_BDT);
	NASZ_316_Carry.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_316_Carry, GIL_BDT);
	NASZ_317_Bandzior.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_317_Bandzior, GIL_BDT);
	NASZ_318_Gobby.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_318_Gobby, GIL_BDT);
	NASZ_326_Domenic.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_326_Domenic, GIL_BDT);
	NASZ_327_Danny.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_327_Danny, GIL_BDT);

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_303_Nod_PICKPOCKET (C_INFO)
{
	npc			= NASZ_303_Nod;
	nr			= 900;
	condition	= DIA_NASZ_303_Nod_PICKPOCKET_Condition;
	information	= DIA_NASZ_303_Nod_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_303_Nod_PICKPOCKET_Condition()
{
	C_Beklauen (72);
};
 
FUNC VOID DIA_NASZ_303_Nod_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_303_Nod_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_303_Nod_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_303_Nod_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_303_Nod_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_303_Nod_PICKPOCKET_DoIt);
};

func void DIA_NASZ_303_Nod_PICKPOCKET_DoIt()
{
	B_BeklauenGold(66);
	
	Info_ClearChoices (DIA_NASZ_303_Nod_PICKPOCKET);
};
	
func void DIA_NASZ_303_Nod_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_303_Nod_PICKPOCKET);
};
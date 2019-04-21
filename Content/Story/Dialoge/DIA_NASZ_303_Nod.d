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

	
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_15_00"); //Co tu robisz i kim jesteœ?

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
		
		Info_AddChoice	  (DIA_NASZ_303_Nod_who, "By³ym kopaczem.", DIA_NASZ_303_Nod_who_miner);
		Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Przybywam zza gór.", DIA_NASZ_303_Nod_who_none);
		if (hero.guild == GIL_OUT) {
		Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Jestem myœliwym.", DIA_NASZ_303_Nod_who_mysliwy);
		};
		if (hero.guild == GIL_DJG) {
		Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Jestem ³owc¹ orków.", DIA_NASZ_303_Nod_who_lowca);
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

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_miner_15_00"); //By³ym kopaczem.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_miner_55_01"); //Kopaczem? Cokolwiek tu robisz, nie jesteœ bandyt¹... Zabiæ!

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "KONIEC", DIA_NASZ_303_Nod_who_kill);
};

FUNC VOID DIA_NASZ_303_Nod_who_none()
{

	AI_Output (other, self,"DIA_NASZ_303_Nod_who_none_15_00"); //Przybywam zza gór.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_none_55_01"); //Ah, w koñcu ktoœ od Samuela. Jak wygl¹da sytuacja na statku?
	AI_Output (other, self,"DIA_NASZ_303_Nod_who_none_55_02"); //Stabilnie, okrêty wygl¹daj¹ coraz lepiej.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_none_55_03"); //I zosta³eœ przys³any, ¿eby nam pomóc? Nie spodziewa³em siê, ¿e Samuel wyœle tu takie chuchro. Przy takiej posturze nie nadajesz siê do pilnowania kopaczy.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_none_55_04"); //A wiêc co takiego mo¿esz nam zaoferowaæ?	

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Mam wtyki wœród ludzi w Górniczej Dolinie.", DIA_NASZ_303_Nod_who_wtyki);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Znam okolicê. Krêci³em siê tu trochê.", DIA_NASZ_303_Nod_who_okolica);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "Dobrze walczê.", DIA_NASZ_303_Nod_who_fight);
};

func void NodSay_Foreigner() {
	AI_Output (self, other,"NodSay_Foreigner_55_00"); //Szybko sobie wyjaœniliœmy, ¿e nie jesteœ jednym z nas. Ch³opcy, braæ go!
};

FUNC VOID DIA_NASZ_303_Nod_who_mysliwy()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_mysliwy_15_00"); //Jestem myœliwym.
	NodSay_Foreigner();
	
	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "KONIEC", DIA_NASZ_303_Nod_who_kill);
};

FUNC VOID DIA_NASZ_303_Nod_who_lowca()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_lowca_15_00"); //Jestem ³owc¹ orków.
	NodSay_Foreigner();

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
	Info_AddChoice	  (DIA_NASZ_303_Nod_who, "KONIEC", DIA_NASZ_303_Nod_who_kill);
};

FUNC VOID DIA_NASZ_303_Nod_who_fight()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_fight_15_00"); //Dobrze walczê.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_fight_55_01"); //To jest podstawa, mój drogi. I to nie wystarczy.

};

FUNC VOID DIA_NASZ_303_Nod_who_okolica()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_okolica_15_00"); //Znam okolicê. Krêci³em siê tu trochê.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_okolica_55_01"); //To siê mo¿e przydaæ. Czas sprawdziæ, czy rzeczywiœcie siê nadajesz.

	Info_ClearChoices (DIA_NASZ_303_Nod_who);
};

FUNC VOID DIA_NASZ_303_Nod_who_wtyki()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_who_wtyki_15_00"); //Mam wtyki wœród ludzi w Górniczej Dolinie.
	AI_Output (self, other,"DIA_NASZ_303_Nod_who_wtyki_55_01"); //Czyli jesteœ jednym z nich...
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
 	description = "Co mam zrobiæ?";
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
	AI_Output (other,self ,"DIA_NASZ_303_Nod_what_15_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_303_Nod_what_55_01"); //WeŸ ten papier ze sto³u i go przeczytaj.
	
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
 	description = "Przeczyta³em.";
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
	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_15_00"); //Przeczyta³em.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_01"); //I? Rozumiesz coœ z tego?
	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_15_02"); //Nie do koñca...
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_03"); //Pewnie! Dlatego to ja jestem tutaj od myœlenia.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_04"); //S³uchaj uwa¿nie: Gdy tutaj przybyliœmy, Bam znalaz³ dziwnie wygl¹daj¹cy zwój.	Oczywiœcie, zjad³a go ciekawoœæ i ani siê obejrzeliœmy, a przywo³a³ jakiegoœ maga.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_05"); //Ten z kolei, mia³ przy sobie w³aœnie to pismo. Poza tym, przy wejœciu na klif naprzeciw naszego obozu pojawi³a siê magiczna pieczêæ.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_06"); //Jeœli dobrze siê przyjrzysz, zobaczysz miejsce na artefakt, który powinien odblokowaæ przejœcie.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_55_07"); //Jestem jednak przekonany, ¿e zosta³ on podzielony. Pytanie tylko, ile jest tych czêœci i gdzie ich szukaæ...

	Wld_InsertNpc	(NASZ_408_Straznik,"OW_SAWHUT_MOLERAT_SPAWN01");

	B_LogEntry (TOPIC_Niedostepny_Klif, "Nod chce, bym przyniós³ mu wszystkie czêœci artefaktu, który usunie magiczn¹ pieczêæ. Twierdzi, ¿e czêœci powinny znajdowaæ siê w kryptach podobnych do tej, w której on sam przebywa.");
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Uda³o mi siê dotrzeæ do szefa bandytów. Szuka on jakiegoœ artefaktu... Muszê pomóc mu go znaleŸæ. Mo¿e przyda siê do walki z orkami?");
	
	Info_ClearChoices (DIA_NASZ_303_Nod_pismo);
		Info_AddChoice	  (DIA_NASZ_303_Nod_pismo, "Czêœci artefaktu mog¹ byæ dobrze bronione...", DIA_NASZ_303_Nod_pismo_fight);
		Info_AddChoice	  (DIA_NASZ_303_Nod_pismo, "Du¿o biegania przede mn¹.", DIA_NASZ_303_Nod_pismo_bieganie);
		Info_AddChoice	  (DIA_NASZ_303_Nod_pismo, "A ty, jak myslisz, gdzie ich szukaæ?", DIA_NASZ_303_Nod_pismo_gdzie);

};

FUNC VOID DIA_NASZ_303_Nod_pismo_fight()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_fight_15_00"); //Czêœci artefaktu mog¹ byæ dobrze bronione...
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_fight_55_01"); //Mo¿esz udaæ siê do Fruta. Niech da ci kilka mikstur.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_fight_55_02"); //A jeœli liczysz na coœ wiêcej, to odst¹piê ci parê ³upów, gdy ju¿ znajdziemy siê w œrodku.

	FRUT_MIKSTURY = TRUE;

};

FUNC VOID DIA_NASZ_303_Nod_pismo_bieganie()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_bieganie_15_00"); //Du¿o biegania przede mn¹.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_bieganie_55_01"); //A przede mn¹ du¿o czekania!
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_bieganie_55_02"); //PrzychodŸ do mnie z ka¿d¹ czêœci¹ artefaktu. Jeœli umrzesz, to przynajmniej jakieœ ju¿ bêdê mia³.

};

FUNC VOID DIA_NASZ_303_Nod_pismo_gdzie()
{

	AI_Output (other,self ,"DIA_NASZ_303_Nod_pismo_gdzie_15_00"); //A ty, jak myslisz, gdzie ich szukaæ?
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_gdzie_55_01"); //Wydaje mi siê, ¿e bêd¹ ukryte w kryptach podobnych do tej.
	AI_Output (self, other,"DIA_NASZ_303_Nod_pismo_gdzie_55_02"); //Je¿eli rzeczywiœcie znasz okolicê tak dobrze, jak twierdzisz, to nie powinieneœ mieæ problemu ze znalezieniem takich miejsc.

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
 	description = "Mam artefakt spod górskiej fortecy.";
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
	AI_Output (other,self ,"DIA_NASZ_303_Nod_donesila_15_00"); //Mam artefakt spod górskiej fortecy.
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
 	description = "Mam artefakt z krypty w pobli¿u zamku.";
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
	AI_Output (other,self ,"DIA_NASZ_303_Nod_doneodpornosc_15_00"); //Mam artefakt z krypty w pobli¿u zamku.
	AI_Output (self, other,"DIA_NASZ_303_Nod_doneodpornosc_55_01"); //Œwietnie.

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
	AI_Output (self, other,"DIA_NASZ_303_Nod_coteraz_55_01"); //Mamy ju¿ wszystkie czêœci, ale ktoœ musi z³¹czyæ je w ca³oœæ.
	AI_Output (self, other,"DIA_NASZ_303_Nod_coteraz_55_02"); //Tutaj w obozie nikt nie zna siê na kowalstwie. Zabierz wszystkie czêœci i znajdŸ jakiegoœ kowala w Górniczej Dolinie.
	AI_Output (self, other,"DIA_NASZ_303_Nod_coteraz_55_03"); //Biegiem, szkoda czasu.

	B_LogEntry (TOPIC_Gestath_renegaci, "Nod powierzy³ mi z³¹czenie w ca³oœæ wszystkich czêœci artefaktu. Ale zanim to zrobiê, lepiej powiadomiê Gestatha o ca³ej sytuacji.");
	
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
 	description = "Mam ca³y artefakt.";
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
	AI_Output (other,self ,"DIA_NASZ_303_Nod_kowaldone_15_00"); //Mam ca³y artefakt.
	AI_Output (self, other,"DIA_NASZ_303_Nod_kowaldone_55_01"); //Nie zawiod³eœ mnie. Pora odblokowaæ wrota.
	AI_Output (self, other,"DIA_NASZ_303_Nod_kowaldone_55_02"); //Za mn¹!

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
 	description = "Co mam zrobiæ?";
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
	AI_Output (other,self ,"DIA_NASZ_303_Nod_WhatToDo_15_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_303_Nod_WhatToDo_55_01"); //No jak to co? W³ó¿ artefakt w to puste miejsce w skale.

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
	AI_Output (self, other,"DIA_NASZ_303_Nod_wtf_15_00"); //Cholera jasna... Co to by³o?
	AI_Output (other,self ,"DIA_NASZ_303_Nod_wtf_55_01"); //Wygl¹da na to, ¿e to miejsce rzeczywiœcie skrywa jak¹œ tajemnicê.
	AI_Output (self, other,"DIA_NASZ_303_Nod_wtf_55_02"); //Patrz. Jest tu jakaœ platforma teleportacyjna. Uruchom j¹ i przejdŸ dalej. My zajmiemy pozycjê i bêdziemy chroniæ twoje plecy.
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
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_15_00"); //No? Znalaz³eœ coœ?
	AI_Output (other,self ,"DIA_NASZ_303_Nod_OkoSwiata_55_01"); //Tak, jakiœ amulet i parê cennych przedmiotów.
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_02"); //Œwietnie. Daj mi go.
	B_giveinvitems (other, self, ItNa_OkoSwiata, 1);
	AI_Output (other,self ,"DIA_NASZ_303_Nod_OkoSwiata_55_03"); //Co teraz zro...
	AI_ReadyMeleeWeapon		(self);
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_04"); //A teraz pos³uchaj, gnido.
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_05"); //Tutaj koñczy siê twoja przygoda. Przejrza³em ciê i pos³a³em goñca za tob¹. Widzia³, jak donosisz na nas obcym ludziom. Krótko mówi¹c: Nie jesteœ bandyt¹.
	AI_Output (other,self ,"DIA_NASZ_303_Nod_OkoSwiata_55_06"); //I pomyœla³eœ, ¿e wyprujesz mi flaki? Dobrze to sobie wymyœli³eœ. Ale nie u³atwiê ci tego.
	AI_ReadyMeleeWeapon		(other);
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_07"); //Nie jesteœ ju¿ mi potrzebny i wierz mi: Nikt za tob¹ nie zatêskni.
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_08"); //Zaraz...
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_09"); //Co to by³o?
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_10"); //Monk, Bam - biegiem do obozu! SprawdŸcie, sk¹d ten ha³as.
	AI_Output (self, other,"DIA_NASZ_303_Nod_OkoSwiata_55_11"); //Frut i ja poradzimy sobie z tym tutaj.

	StopWatchFightNod = TRUE;
	NASZ_303_Nod.flags = 0;
	NOD_READY_TO_KILL = TRUE;

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Artefakt to Oko Œwiata. Nod i ch³opaki chc¹ mi go odebraæ. Zabijê go, a potem sprawdzê co dzieje siê w obozie bandytów. S³yszê jakieœ wrzaski...");
	
	B_LogEntry (TOPIC_Niedostepny_Klif, "Bandyci mnie przejrzeli... Có¿, muszê ich za³atwiæ. Ciekawe, co dzieje siê teraz w obozie bandytów?");

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
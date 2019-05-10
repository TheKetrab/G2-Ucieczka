var int WCHODZENIE_BANDYCI;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_EXIT   (C_INFO)
{
	npc         = NASZ_307_Monk;
	nr          = 999;
	condition   = DIA_NASZ_307_Monk_EXIT_Condition;
	information = DIA_NASZ_307_Monk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_307_Monk_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_307_Monk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_307_Monk_Obcy		(C_INFO)
{
	npc		 = 	NASZ_307_Monk;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_307_Monk_Obcy_Condition;
	information	 = 	DIA_NASZ_307_Monk_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_307_Monk_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_307_Monk_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_307_Monk_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_307_Monk_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();
};




//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_siema   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 1;
 	condition   = DIA_NASZ_307_Monk_siema_Condition;
 	information = DIA_NASZ_307_Monk_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_307_Monk_siema_Condition()
{
	if (WCHODZENIE_BANDYCI == FALSE)
		&& ((Npc_GetDistToWP	(hero, "OW_PATH_033_TO_CAVE") <=500) || (Npc_GetDistToWP	(hero, "NASZ_BANDYCI_OBOZ_11") <=500) || (Npc_GetDistToWP	(hero, "NASZ_BANDYCI_OBOZ_13") <=500) || (Npc_GetDistToWP	(hero, "NASZ_BANDYCI_OBOZ_24") <=500))
	{
		return TRUE;
	};
};

func void MonkSay_Intruz() {
	AI_Output (self,other,"MonkSay_Intruz_08_00"); //Intruz!
};

FUNC VOID DIA_NASZ_307_Monk_siema_Info()
{

	AI_Output (self, other,"DIA_NASZ_307_Monk_siema_15_00"); //Co tu robisz? Czego chcesz?
	AI_Output (other, self,"DIA_NASZ_307_Monk_siema_55_01"); //Chcê wejœæ do obozu.
	AI_Output (self, other,"DIA_NASZ_307_Monk_siema_15_02"); //Oczywiœcie. A jak myœlisz, po co tu stojê?
	AI_Output (other, self,"DIA_NASZ_307_Monk_siema_55_03"); //¯eby zatrzymywaæ takich jak ja?
	AI_Output (self, other,"DIA_NASZ_307_Monk_siema_15_04"); //Zgadza siê. Nie kojarzê ciê... Znamy siê?

	Info_ClearChoices 	(DIA_NASZ_307_Monk_siema);
		Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Ja znam ciebie, ale chyba ty mnie nie.",DIA_NASZ_307_Monk_siema_IKnowYou);
		Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Chyba nie mieliœmy okazji podaæ sobie d³oni.",DIA_NASZ_307_Monk_siema_NotOkasion);
		Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Nie jestem st¹d.",DIA_NASZ_307_Monk_siema_NotFromThere);

};

FUNC VOID DIA_NASZ_307_Monk_siema_IKnowYou ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_IKnowYou_08_00"); //Ja znam ciebie, ale chyba ty mnie nie.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_IKnowYou_08_01"); //W takim razie mi siê ³adnie przedstaw. Komu s³u¿ysz?
	
	Info_ClearChoices 	(DIA_NASZ_307_Monk_siema);
		if (hero.guild == GIL_OUT) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Gestathowi.",DIA_NASZ_307_Monk_siema_Gestath); };
		if (hero.guild == GIL_DJG) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Kerolothowi.",DIA_NASZ_307_Monk_siema_Keroloth); };
		Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Samemu sobie.",DIA_NASZ_307_Monk_siema_SamemuSobie);
		if (npc_knowsinfo (other, DIA_NASZ_316_Carry_palisada)) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Samuelowi.",DIA_NASZ_307_Monk_siema_Samuel); };
		if (npc_knowsinfo (other, DIA_NASZ_316_Carry_palisada)) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Nodowi.",DIA_NASZ_307_Monk_siema_Nod); };

};

FUNC VOID DIA_NASZ_307_Monk_siema_NotOkasion ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_NotOkasion_08_00"); //Chyba nie mieliœmy okazji podaæ sobie d³oni.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_NotOkasion_08_01"); //Spróbuj tylko wyci¹gn¹æ do mnie rêkê, a ci j¹ utnê.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_NotOkasion_08_02"); //Nie zadajê siê z takimi lalusiami, jak ty. Lepiej gadaj, komu s³u¿ysz?
	
	Info_ClearChoices 	(DIA_NASZ_307_Monk_siema);
		if (hero.guild == GIL_OUT) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Gestathowi.",DIA_NASZ_307_Monk_siema_Gestath); };
		if (hero.guild == GIL_DJG) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Kerolothowi.",DIA_NASZ_307_Monk_siema_Keroloth); };
		Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Samemu sobie.",DIA_NASZ_307_Monk_siema_SamemuSobie);
		if (npc_knowsinfo (other, DIA_NASZ_316_Carry_palisada)) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Samuelowi.",DIA_NASZ_307_Monk_siema_Samuel); };
		if (npc_knowsinfo (other, DIA_NASZ_316_Carry_palisada)) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Nodowi.",DIA_NASZ_307_Monk_siema_Nod); };

};

FUNC VOID DIA_NASZ_307_Monk_siema_NotFromThere ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_NotFromThere_08_00"); //Nie jestem st¹d.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_NotFromThere_08_01"); //Na twoje nieszczêœcie ja jestem.
	MonkSay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_307_Monk_siema_Gestath ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_Gestath_08_00"); //Gestathowi.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_Gestath_08_01"); //A wiêc nie jesteœ bandyt¹? le trafi³eœ, przyjacielu.
	MonkSay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_307_Monk_siema_Keroloth ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_Keroloth_08_00"); //Kerolothowi.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_Keroloth_08_01"); //A wiêc nie jesteœ bandyt¹? le trafi³eœ, przyjacielu.
	MonkSay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_307_Monk_siema_SamemuSobie ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_SamemuSobie_08_00"); //Samemu sobie.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_SamemuSobie_08_01"); //Nie chcê ciê martwiæ, ale to jedna z najg³upszych odpowiedzi, jakie kiedykolwiek s³ysza³em. Nasi ch³opcy s¹ inaczej szkoleni.
	MonkSay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_307_Monk_siema_Samuel ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_Samuel_08_00"); //Samuelowi.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_Samuel_08_01"); //Proszê, proszê. Niepotrzebne mu s¹ ju¿ rêce do pracy przy statkach?
	
	Info_ClearChoices 	(DIA_NASZ_307_Monk_siema);
		if (npc_knowsinfo (other, DIA_NASZ_316_Carry_palisada)) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Jak widaæ wszystkie dziury za³atane.",DIA_NASZ_307_Monk_siema_JakWidac); };
		Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Jakich statkach?",DIA_NASZ_307_Monk_siema_JakichStatkach);
		if (npc_knowsinfo (other, DIA_NASZ_327_Danny_armor)) { Info_AddChoice		(DIA_NASZ_307_Monk_siema,"Stwierdzi³, ¿e Nodowi bardziej siê przydam.",DIA_NASZ_307_Monk_siema_ReceDoRoboty); };

};

FUNC VOID DIA_NASZ_307_Monk_siema_Nod ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_Nod_08_00"); //Nodowi.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_Nod_08_01"); //£¿esz! Gdyby twoim kapitanem by³ Nod, to s³u¿y³byœ razem ze mn¹ na jednym statku!
	MonkSay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_307_Monk_siema_JakWidac ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_JakWidac_08_00"); //Jak widaæ wszystkie dziury za³atane.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_JakWidac_08_01"); //W tydzieñ uwinêliœcie siê z takimi szkodami? Na to potrzebny by³ przynajmniej miesi¹c.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_JakWidac_08_02"); //Nie podobasz mi siê ch³opcze i do tego coœ krêcisz. Wiesz, co to oznacza?
	MonkSay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);	
};

FUNC VOID DIA_NASZ_307_Monk_siema_JakichStatkach ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_JakichStatkach_08_00"); //Jakich statkach?
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_JakichStatkach_08_01"); //Tak myœla³em...
	MonkSay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
};

FUNC VOID DIA_NASZ_307_Monk_siema_ReceDoRoboty ()
{
	AI_Output (other,self,"DIA_NASZ_307_Monk_siema_ReceDoRoboty_08_00"); //Stwierdzi³, ¿e Nodowi bardziej siê przydam.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_ReceDoRoboty_08_01"); //Nonsens. Pewnie sprawia³eœ tam zbyt du¿o problemów.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_ReceDoRoboty_08_02"); //Chocia¿ jeœli przeszed³eœ ca³kiem sam przez góry, to mo¿e na coœ siê nadasz.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_ReceDoRoboty_08_03"); //Najpierw pogadaj z nasz¹ za³og¹. Potem dopiero dopuœcimy ciê do naszego szefa.
	AI_Output (self,other,"DIA_NASZ_307_Monk_siema_ReceDoRoboty_08_04"); //W³aŸ.
	
	Info_ClearChoices 	(DIA_NASZ_307_Monk_siema);
};


//*********************************************************************
//	Info Help
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_help   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 2;
 	condition   = DIA_NASZ_307_Monk_help_Condition;
 	information = DIA_NASZ_307_Monk_help_Info;
 	permanent   = FALSE;
 	description = "Mogê ci w czymœ pomóc?";
};

FUNC INT DIA_NASZ_307_Monk_help_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_help_Info()
{
	AI_Output (other,self ,"DIA_NASZ_307_Monk_help_15_00"); //Mogê ci w czymœ pomóc?
	AI_Output (self, other,"DIA_NASZ_307_Monk_help_55_01"); //Chcesz uzyskaæ dostêp do szefa, co?
	AI_Output (self, other,"DIA_NASZ_307_Monk_help_55_02"); //Nie ma niczego, w czym móg³byœ mi pomóc. Za to chêtnie sprawdzê, jak biegle zabijasz przeciwników.
	AI_Output (self, other,"DIA_NASZ_307_Monk_help_55_03"); //Niedaleko naszego obozu widzia³em watahê. Mia³em dziœ iœæ wyr¿n¹æ wszystkie wilki, ¿eby nie nabra³y ochoty na nasze owce. Pójdziemy razem.
	AI_Output (self, other,"DIA_NASZ_307_Monk_help_55_04"); //Bêdziemy liczyæ ubite bestie. Powiedzmy, ¿e jeœli zabijesz chocia¿ cztery wilki, to uznam, ¿e mi siê przyda³eœ.
	AI_Output (self, other,"DIA_NASZ_307_Monk_help_55_05"); //To co, idziesz ze mn¹, czy ca³a zabawa przypadnie mi?

	Log_CreateTopic (TOPIC_Monk_wataha, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Monk_wataha, LOG_RUNNING);
	B_LogEntry (TOPIC_Monk_wataha, "Monk chce, bym razem z nim zaatakowa³ watahê w pobli¿u obozu. Muszê ubiæ przynajmniej cztery wilki, ¿eby uzna³, ¿e mu siê przyda³em.");
	
};

//*********************************************************************
//	Info Go
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_go   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 3;
 	condition   = DIA_NASZ_307_Monk_go_Condition;
 	information = DIA_NASZ_307_Monk_go_Info;
 	permanent   = FALSE;
 	description = "Ruszajmy na polowanie.";
};

FUNC INT DIA_NASZ_307_Monk_go_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_help))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_go_Info()
{
	AI_Output (other,self ,"DIA_NASZ_307_Monk_go_15_00"); //Ruszajmy na polowanie.
	AI_Output (self, other,"DIA_NASZ_307_Monk_go_55_01"); //To nie bêdzie polowanie. To bêdzie rzeŸnia. Za mn¹!

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Prowadzenie");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;	
	Druzyna (NASZ_307_Monk,1);
	
		
	Wld_InsertNpc	(Wolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(Wolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(YWolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(YWolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(YWolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(YWolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(Wolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(Wolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(Wolf,"NASZ_BANDYCI_LOWCY_02"); 
	Wld_InsertNpc	(Wolf,"NASZ_BANDYCI_LOWCY_02"); 
	
};


//*********************************************************************
//	Info Stop
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_stop   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 3;
 	condition   = DIA_NASZ_307_Monk_stop_Condition;
 	information = DIA_NASZ_307_Monk_stop_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_307_Monk_stop_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_help)
		&& (Npc_GetDistToWP(self,"OW_PATH_038")<=500))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_stop_Info()
{
	AI_Output (self, other,"DIA_NASZ_307_Monk_stop_55_00"); //Widzisz ju¿ tê grupkê? To nasz cel.
	AI_Output (self, other,"DIA_NASZ_307_Monk_stop_55_01"); //Nie zapomnij liczyæ, ile ich ubi³eœ.

	MonkWolfMissionReady = TRUE;
	
	MonkWolfKiller = 0;
	HeroWolfKiller = 0;
	
	Npc_ExchangeRoutine (self, "Atak");
	AI_StopProcessInfos (self);

};


//*********************************************************************
//	Info Koniec
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_koniec   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 4;
 	condition   = DIA_NASZ_307_Monk_koniec_Condition;
 	information = DIA_NASZ_307_Monk_koniec_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_307_Monk_koniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_stop)
	&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_BANDYCI_LOWCY_03"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_koniec_Info()
{
	//aktywuje misje z Carrym
	B_StartOtherRoutine (NASZ_316_Carry,"Away");
	CarryBiegnie = TRUE;

	if (HeroWolfKiller >= 7) {
		AI_Output (self, other,"DIA_NASZ_307_Monk_koniec_15_00"); //Ale¿ z ciebie bieg³y myœliwy... Zabi³eœ wiêcej wilków ode mnie. Tego siê nie spodziewa³em.
		AI_Output (self, other,"DIA_NASZ_307_Monk_koniec_15_01"); //Dobra robota, jestem pod wra¿eniem m³odzieñcze. Wracamy do obozu.
	
		B_LogEntry (TOPIC_Monk_wataha, "Sprosta³em zadaniu! Monk by³ ze mnie zadowolony.");
		Log_SetTopicStatus (TOPIC_Monk_wataha, LOG_SUCCESS);
		B_GivePlayerXP (400);
		DodajReputacje (10, REP_BANDYCI);
	}
	
	else if (HeroWolfKiller >=4 ) {
		AI_Output (self, other,"DIA_NASZ_307_Monk_koniec_15_02"); //By³em przekonany, ¿e bêdê musia³ za³atwiæ wszystkie wilki w pojedynkê, a tu taka niespodzianka.
		AI_Output (self, other,"DIA_NASZ_307_Monk_koniec_15_03"); //Potrenuj jeszcze trochê, a bêdziemy mogli wybraæ siê razem nawet na grupê cieniostworów!	
	
		B_LogEntry (TOPIC_Monk_wataha, "Sprosta³em zadaniu! Monk by³ ze mnie zadowolony.");
		Log_SetTopicStatus (TOPIC_Monk_wataha, LOG_SUCCESS);
		B_GivePlayerXP (400);
		DodajReputacje (10, REP_BANDYCI);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_307_Monk_koniec_15_04"); //Tak, jak siê spodziewa³em, z wiêkszoœci¹ musia³em poradziæ sobie sam.
		AI_Output (self, other,"DIA_NASZ_307_Monk_koniec_15_05"); //W sumie to nie wiem, po co w ogóle ciê ze sob¹ zabiera³em. Wracam na stra¿.	
		
		B_LogEntry (TOPIC_Monk_wataha, "Nie uda³o mi siê zabiæ wystarczaj¹co du¿o wilków.");
		Log_SetTopicStatus (TOPIC_Monk_wataha, LOG_FAILED);
	};

	AI_Output (self, other,"DIA_NASZ_307_Monk_koniec_55_06"); //Do zobaczenia przy bramie.
	AI_StopProcessInfos (self);
	
	if (npc_knowsinfo(other,DIA_NASZ_308_Frut_monkwin)) { Npc_ExchangeRoutine (self, "Straz"); }
	else { Npc_ExchangeRoutine (self, "Start"); };
	
	//self.aivar[AIV_PARTYMEMBER] = FALSE;	
	Druzyna (NASZ_307_Monk,0);
	
	MonkWolfMissionReady = FALSE;
};

//*********************************************************************
//	Info Niewolnik
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_niewolnik   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 5;
 	condition   = DIA_NASZ_307_Monk_niewolnik_Condition;
 	information = DIA_NASZ_307_Monk_niewolnik_Info;
 	permanent   = FALSE;
 	description = "Ponoæ k³óci³eœ siê z Frutem.";
};

FUNC INT DIA_NASZ_307_Monk_niewolnik_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_320_Niewolnik_help))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_niewolnik_Info()
{
	AI_Output (other, self,"DIA_NASZ_307_Monk_niewolnik_15_00"); //Ponoæ k³óci³eœ siê z Frutem.
	AI_Output (self, other,"DIA_NASZ_307_Monk_niewolnik_55_01"); //Zaraz, sk¹d to wiesz?
	AI_Output (other, self,"DIA_NASZ_307_Monk_niewolnik_55_02"); //Coœ tam obi³o mi siê o uszy.
	AI_Output (self, other,"DIA_NASZ_307_Monk_niewolnik_55_03"); //Ktoœ tu ma za d³ugi jêzor. Nie warto obgadywaæ tak¹ szychê jak Frut...
	AI_Output (self, other,"DIA_NASZ_307_Monk_niewolnik_55_04"); //Pos³uchaj, dam ci radê. Nie wtykaj nosa w nieswoje sprawy, bo ktoœ ci go w koñcu odetnie.
	AI_Output (other, self,"DIA_NASZ_307_Monk_niewolnik_55_05"); //Domyœlam siê, ¿e chodzi o pozycjê w obozie.
	AI_Output (self, other,"DIA_NASZ_307_Monk_niewolnik_55_06"); //Co?! Nie doœæ, ¿e jesteœ strasznie wœcibski to do tego bezczelny. Oduczê ciê takiego zachowania!

	AI_StopProcessInfos (self);
	B_Attack (self, hero, AR_NONE, 1);

};

var int MONK_WON;
//*********************************************************************
//	Info Win
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_win   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 5;
 	condition   = DIA_NASZ_307_Monk_win_Condition;
 	information = DIA_NASZ_307_Monk_win_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_307_Monk_win_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_niewolnik)
		&& (NASZ_307_Monk.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
		&& (MONK_WON == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_win_Info()
{
	AI_Output (other, self,"DIA_NASZ_307_Monk_win_15_00"); //Chcesz coœ dodaæ?
	AI_Output (self, other,"DIA_NASZ_307_Monk_win_55_01"); //Nie.
	AI_Output (other, self,"DIA_NASZ_307_Monk_win_55_02"); //Wiêc mo¿e mam jeszcze raz sklepaæ ci buŸkê? Gadaj w tej chwili, o co ci posz³o z Frutem.
	AI_Output (self, other,"DIA_NASZ_307_Monk_win_55_03"); //Cholera jasna. Zgodnie z przykazaniem Fruta, najpierw ja mia³em pilnowaæ bramy, a póŸniej zaj¹æ siê administracj¹ w obozie.
	AI_Output (self, other,"DIA_NASZ_307_Monk_win_55_04"); //Po dziesiêciu dniach, mieliœmy siê zamieniæ. Problem w tym, ¿e ten skurczysyn siê nie zamienia! Mimo, i¿ minê³a ustalona iloœæ czasu.
	AI_Output (self, other,"DIA_NASZ_307_Monk_win_55_05"); //A jest na tyle silny, ¿e wszyscy siê go boj¹ i nikt nie stanie po mojej stronie.
	AI_Output (self, other,"DIA_NASZ_307_Monk_win_55_06"); //Gdy siê k³ociliœmy ostro oberwa³em. To dlatego siedzê teraz cicho. Mimo to, nie pasuje mi taka sytuacja.

	B_LogEntry (TOPIC_Monk_Frut, "Frut postêpuje niezgodnie z poleceniami Noda. Zamiast po dziesiêciu dniach wymieniæ siê stanowiskiem z Monkiem, przygarn¹³ je sobie na sta³e. Problem w tym, ¿e Frut jest na tyle silny, ¿e nikt nie chce siê mu postawiæ.");

};

//*********************************************************************
//	Info Lose
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_lose   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 6;
 	condition   = DIA_NASZ_307_Monk_lose_Condition;
 	information = DIA_NASZ_307_Monk_lose_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_307_Monk_lose_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_niewolnik)
		&& (NASZ_307_Monk.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_lose_Info()
{
	AI_Output (self, other,"DIA_NASZ_307_Monk_lose_15_00"); //Jesteœ ¿a³osny.
	
	B_LogEntry (TOPIC_Monk_Frut, "Monk mnie spra³... Ahh...");
	Log_SetTopicStatus (TOPIC_Monk_Frut, LOG_FAILED);
	
	MONK_WON = TRUE;
};


//*********************************************************************
//	Info Frut
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_frut   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 7;
 	condition   = DIA_NASZ_307_Monk_frut_Condition;
 	information = DIA_NASZ_307_Monk_frut_Info;
 	permanent   = FALSE;
 	description = "Mo¿emy coœ zrobiæ w tej sprawie?";
};

FUNC INT DIA_NASZ_307_Monk_frut_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_win))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_frut_Info()
{
	AI_Output (other, self,"DIA_NASZ_307_Monk_frut_15_00"); //Mo¿emy coœ zrobiæ w tej sprawie?
	AI_Output (self, other,"DIA_NASZ_307_Monk_frut_55_01"); //To skomplikowane... Mo¿e lepiej nie dolewajmy ju¿ oliwy do ognia?
	AI_Output (other, self,"DIA_NASZ_307_Monk_frut_55_02"); //Gadaj!
	AI_Output (self, other,"DIA_NASZ_307_Monk_frut_55_03"); //Wiesz co, jesteœ bardzo konkretny, nawet jak na bandytê.
	AI_Output (self, other,"DIA_NASZ_307_Monk_frut_55_04"); //Skoro jesteœ taki ochoczy to sklep mu buŸkê.

	B_LogEntry (TOPIC_Monk_Frut, "¯eby przydaæ siê Monkowi, musia³bym pobiæ Fruta... Siê robi!");

};

//*********************************************************************
//	Info FrutKoniec
//*********************************************************************
INSTANCE DIA_NASZ_307_Monk_frutkoniec   (C_INFO)
{
	npc         = NASZ_307_Monk;
 	nr          = 8;
 	condition   = DIA_NASZ_307_Monk_frutkoniec_Condition;
 	information = DIA_NASZ_307_Monk_frutkoniec_Info;
 	permanent   = FALSE;
 	description = "No, i co ty na to?";
};

FUNC INT DIA_NASZ_307_Monk_frutkoniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_308_Frut_monkwin))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_307_Monk_frutkoniec_Info()
{
	AI_Output (other, self,"DIA_NASZ_307_Monk_frutkoniec_15_00"); //No, i co ty na to?
	AI_Output (self, other,"DIA_NASZ_307_Monk_frutkoniec_55_01"); //Skubany... Trzymaj, zas³u¿y³eœ.
	Createinvitems (self, ItMi_Gold, 100);
	B_giveinvitems (self, other, ItMi_Gold, 100);
	AI_Output (other, self,"DIA_NASZ_307_Monk_frutkoniec_55_02"); //Robiê to, co do mnie nale¿y.
	
	if (Frut_Dal_Zezwolenie_Willowi == FALSE) {
		AI_Output (other, self,"DIA_NASZ_307_Monk_frutkoniec_55_03"); //Czy teraz po zezwolenie na wejœcie do szefa mam siê zwracaæ do ciebie, czy do Fruta?
		AI_Output (self, other,"DIA_NASZ_307_Monk_frutkoniec_55_04"); //Do Fruta. Ja przej¹³em tylko stanowisko administracji i wydajê polecenia reszcie bandy.
	};
	
	B_LogEntry (TOPIC_Monk_Frut, "Nic dziwnego, ¿e w tej zgrai maj¹ miejsce takie sceny... Mam nadziejê, ¿e szybko siê st¹d zmyjê.");
	Log_SetTopicStatus (TOPIC_Monk_Frut, LOG_SUCCESS);
	B_GivePlayerXP (400);
	DodajReputacje (10, REP_BANDYCI);


};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_307_Monk_PICKPOCKET (C_INFO)
{
	npc			= NASZ_307_Monk;
	nr			= 900;
	condition	= DIA_NASZ_307_Monk_PICKPOCKET_Condition;
	information	= DIA_NASZ_307_Monk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_307_Monk_PICKPOCKET_Condition()
{
	C_Beklauen (58);
};
 
FUNC VOID DIA_NASZ_307_Monk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_307_Monk_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_307_Monk_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_307_Monk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_307_Monk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_307_Monk_PICKPOCKET_DoIt);
};

func void DIA_NASZ_307_Monk_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Bolt,49);
	
	Info_ClearChoices (DIA_NASZ_307_Monk_PICKPOCKET);
};
	
func void DIA_NASZ_307_Monk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_307_Monk_PICKPOCKET);
};
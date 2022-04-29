// ***** FRUT - ma³omówny, pewny siebie, bufon


var int Frut_wstrzymywanie;

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_EXIT   (C_INFO)
{
	npc         = NASZ_308_Frut;
	nr          = 999;
	condition   = DIA_NASZ_308_Frut_EXIT_Condition;
	information = DIA_NASZ_308_Frut_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_308_Frut_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_308_Frut_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_308_Frut_Obcy		(C_INFO)
{
	npc		 = 	NASZ_308_Frut;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_308_Frut_Obcy_Condition;
	information	 = 	DIA_NASZ_308_Frut_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_308_Frut_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_308_Frut_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_308_Frut_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_308_Frut_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_siema   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 1;
 	condition   = DIA_NASZ_308_Frut_siema_Condition;
 	information = DIA_NASZ_308_Frut_siema_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_308_Frut_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK) && !Frut_wstrzymywanie)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_308_Frut_siema_15_00"); //S³ucham.		
};

//*********************************************************************
//	Info Who
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_who   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 2;
 	condition   = DIA_NASZ_308_Frut_who_Condition;
 	information = DIA_NASZ_308_Frut_who_Info;
 	permanent   = FALSE;
 	description = "Kim jesteœ?";
};

FUNC INT DIA_NASZ_308_Frut_who_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_308_Frut_who_Info()
{
	AI_Output (other,self ,"DIA_NASZ_308_Frut_who_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_308_Frut_who_55_01"); //Nazywam siê Frut.

};

//*********************************************************************
//	Info What
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_what   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 2;
 	condition   = DIA_NASZ_308_Frut_what_Condition;
 	information = DIA_NASZ_308_Frut_what_Info;
 	permanent   = FALSE;
 	description = "Czym siê tu zajmujesz?";
};

FUNC INT DIA_NASZ_308_Frut_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_308_Frut_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_308_Frut_what_15_00"); //Czym siê tu zajmujesz?
	AI_Output (self, other,"DIA_NASZ_308_Frut_what_55_01"); //Jestem od zezwoleñ na widzenie siê z szefem naszej bandy.

	B_LogEntry (TOPIC_Gestath_renegaci, "¯eby zobaczyæ siê z szefem, muszê dostaæ zezwolenie od Fruta.");

};

//*********************************************************************
//	Info What2
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_what2   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 3;
 	condition   = DIA_NASZ_308_Frut_what2_Condition;
 	information = DIA_NASZ_308_Frut_what2_Info;
 	permanent   = FALSE;
 	description = "Co muszê zrobiæ, by dostaæ takie zezwolenie?";
};

FUNC INT DIA_NASZ_308_Frut_what2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_308_Frut_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_what2_Info()
{
	AI_Output (other,self ,"DIA_NASZ_308_Frut_what2_15_00"); //Co muszê zrobiæ, by dostaæ takie zezwolenie?
	AI_Output (self, other,"DIA_NASZ_308_Frut_what2_55_01"); //Zyskaæ reputacjê u naszych ch³opców.
	AI_Output (self, other,"DIA_NASZ_308_Frut_what2_55_02"); //Jeœli bêd¹ ciê szanowali, wpuszczê ciê.
	
	WillKnowBanditReputation = TRUE;

};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_zadanie   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 4;
 	condition   = DIA_NASZ_308_Frut_zadanie_Condition;
 	information = DIA_NASZ_308_Frut_zadanie_Info;
 	permanent   = FALSE;
 	description = "Mogê siê na coœ przydaæ?";
};

FUNC INT DIA_NASZ_308_Frut_zadanie_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_308_Frut_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_308_Frut_zadanie_15_00"); //Mogê siê na coœ przydaæ?
	AI_Output (self, other,"DIA_NASZ_308_Frut_zadanie_55_01"); //Potrzebujê tu nowego niewolnika. Ci ju¿ s³abn¹, a przyda siê trochê œwie¿ych si³.
	AI_Output (self, other,"DIA_NASZ_308_Frut_zadanie_55_02"); //Udasz siê do naszej kopalni i powiesz Gobby'emu, ¿e ma ci wydaæ jakiegoœ cz³owieka.
	AI_Output (other,self ,"DIA_NASZ_308_Frut_zadanie_15_03"); //Gdzie ta kopalnia?
	AI_Output (self, other,"DIA_NASZ_308_Frut_zadanie_55_04"); //P³yñ ca³y czas w górê rzeki od zamku. Nie wychodŸ z wody. I przestañ ju¿ w koñcu zadawaæ te cholerne pytania!
	AI_Output (other,self ,"DIA_NASZ_308_Frut_zadanie_15_05"); //Ale przecie¿ tam jest wodospad. Jak mam p³yn¹æ w górê wodospadu?
	AI_Output (self, other,"DIA_NASZ_308_Frut_zadanie_55_06"); //Wymyœlisz coœ... Co za baran...

	Log_CreateTopic (TOPIC_Frut_niewolnicy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Frut_niewolnicy, LOG_RUNNING);
	B_LogEntry (TOPIC_Frut_niewolnicy, "Mam przyprowadziæ Frutowi nowego niewolnika z kopalni. Z jego opisu wynika³o, ¿e pod wodospadem jest jaskinia, w której trwa wydobycie. Nie pomiesza³o mu siê coœ?");
	Frut_wstrzymywanie=1;
};

//*********************************************************************
//	Info Zadanie2
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_zadanie2   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 5;
 	condition   = DIA_NASZ_308_Frut_zadanie2_Condition;
 	information = DIA_NASZ_308_Frut_zadanie2_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_308_Frut_zadanie2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_308_Frut_zadanie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_zadanie2_Info()
{
	AI_Output (self, other,"DIA_NASZ_308_Frut_zadanie2_15_00"); //Ej, ty, czekaj! By³bym zapomnia³.
	AI_Output (self, other,"DIA_NASZ_308_Frut_zadanie2_55_01"); //Daj ten papier Gobby'emu. Inaczej nie da ci niewolnika.

	Frut_wstrzymywanie=0;
	Createinvitems (self, ItNa_Niewolnicy, 1);
	B_giveinvitems (self, other, ItNa_Niewolnicy, 1);

	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Rabon
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_rabon   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 6;
 	condition   = DIA_NASZ_308_Frut_rabon_Condition;
 	information = DIA_NASZ_308_Frut_rabon_Info;
 	permanent   = FALSE;
 	description = "Rabon prowadzi³ nielegalne interesy z paladynami.";
};

FUNC INT DIA_NASZ_308_Frut_rabon_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_305_Rabon_rabon))
	&& (npc_isdead(NASZ_305_Rabon))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_rabon_Info()
{
	AI_Output (other,self ,"DIA_NASZ_308_Frut_rabon_15_00"); //Rabon prowadzi³ nielegalne interesy z paladynami.
	AI_Output (self, other,"DIA_NASZ_308_Frut_rabon_55_01"); //Prowadzi³?
	AI_Output (other,self ,"DIA_NASZ_308_Frut_rabon_15_02"); //Tak, ju¿ go skasowa³em. Cwaniak mia³ z nimi jak¹œ dodatkow¹ umowê. Gdy znalaz³em w jego rzeczach spor¹ iloœæ rudy, powiedzia³ mi o tym i chcia³, ¿ebym zosta³ jego wspólnikiem.
	AI_Output (other,self ,"DIA_NASZ_308_Frut_rabon_15_03"); //Zgodzi³em siê, aby lepiej zbadaæ sprawê i zdemaskowaæ tê kanaliê. Rabon myœla³, ¿e mnie wykiwa i zaczai³ siê na mnie razem ze swoimi kolegami. Na szczêœcie uda³o mi siê zadaæ mu œmiertelny cios i wyjœæ z tego ca³o.
	AI_Output (self, other,"DIA_NASZ_308_Frut_rabon_55_04"); //To by wyjaœnia³o, dlaczego ostatnio tej rudy by³o mniej, ni¿ byæ powinno. Powiedzmy, ¿e ci wierzê.
	AI_Output (self, other,"DIA_NASZ_308_Frut_rabon_55_05"); //Jeœli jednak kolejne dostawy wcale nie bêd¹ wiêksze, to uznam, ¿e zabi³eœ Rabona ot tak, a ca³a twoja opowieœæ to nic nie warta bajka.

	B_GivePlayerXP (400);
	DodajReputacje (10, REP_BANDYCI);
	B_LogEntry (TOPIC_Rabon_sakwa, "Frut uwierzy³ mi, ¿e zabi³em Rabona, ale jeœli kolejne dostawy rudy nie bêd¹ wiêksze, zacznie podejrzewaæ mnie o k³amstwo. Cholera, pewnie jeszcze nie wie, ¿e paladyni renegaci w kopalni nie ¿yj¹, a kopacze ju¿ nie pracuj¹. Oby dobrze siê to dla mnie skoñczy³o.");
	Log_SetTopicStatus (TOPIC_Rabon_sakwa, LOG_SUCCESS);
};

//*********************************************************************
//	Info Koniec
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_koniec   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 7;
 	condition   = DIA_NASZ_308_Frut_koniec_Condition;
 	information = DIA_NASZ_308_Frut_koniec_Info;
 	permanent   = FALSE;
 	description = "Masz tu nowego niewolnika.";
};

FUNC INT DIA_NASZ_308_Frut_koniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_308_Frut_zadanie)
		&& Npc_GetDistToWP	(NASZ_325_Grimes, "NASZ_BANDYCI_OBOZ_09") < 750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_koniec_Info()
{
	AI_Output (other,self ,"DIA_NASZ_308_Frut_koniec_15_00"); //Masz tu nowego niewolnika.
	AI_Output (self, other,"DIA_NASZ_308_Frut_koniec_55_01"); //Dobra robota. Jesteœ w porz¹dku.

	Log_SetTopicStatus (TOPIC_Frut_niewolnicy, LOG_SUCCESS);
	B_LogEntry (TOPIC_Frut_niewolnicy, "Przyprowadzi³em Grimesa z kopalni. Teraz pozostaje czekaæ na dzia³ania Gestatha.");

	Npc_ExchangeRoutine (NASZ_325_Grimes, "Pick");
	//NASZ_325_Grimes.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_325_Grimes,0);
	DodajReputacje (15, REP_BANDYCI);
	B_GivePlayerXP(400);
};

//*********************************************************************
//	Info Zezwolenie
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_zezwolenie   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 10;
 	condition   = DIA_NASZ_308_Frut_zezwolenie_Condition;
 	information = DIA_NASZ_308_Frut_zezwolenie_Info;
 	permanent   = TRUE;
 	description = "Mogê widzieæ siê z szefem?";
};

FUNC INT DIA_NASZ_308_Frut_zezwolenie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_308_Frut_what2)) && (npc_hasitems (other, ItNa_ZezwolenieBandyci) == 0) && (WCHODZENIE_SZEF == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_zezwolenie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_308_Frut_zezwolenie_15_00"); //Mogê widzieæ siê z szefem?
	if (RepEnough(70,REP_BANDYCI)){
		AI_Output (self, other,"DIA_NASZ_308_Frut_zezwolenie_55_01"); //Tak. Przekona³eœ ch³opców.
		Createinvitems (self, ItNa_ZezwolenieBandyci, 1);
		B_giveinvitems (self, other, ItNa_ZezwolenieBandyci, 1);
		AI_Output (self, other,"DIA_NASZ_308_Frut_zezwolenie_55_02"); //Poka¿ ten papier stra¿nikowi.
		AI_Output (self, other,"DIA_NASZ_308_Frut_zezwolenie_55_03"); //Mo¿e teraz w koñcu przestaniesz zawracaæ mi g³owê...
		Frut_Dal_Zezwolenie_Willowi = TRUE;
	}
	else {
		PrintMissingRep(70,REP_BANDYCI);
		AI_Output (self, other,"DIA_NASZ_308_Frut_zezwolenie_55_04"); //Nie wszyscy s¹ jeszcze tob¹ zachwyceni.
		AI_Output (self, other,"DIA_NASZ_308_Frut_zezwolenie_55_05"); //Postaraj siê bardziej.
	};
};

//*********************************************************************
//	Info Monk
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_Monk   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 11;
 	condition   = DIA_NASZ_308_Frut_Monk_Condition;
 	information = DIA_NASZ_308_Frut_Monk_Info;
 	permanent   = FALSE;
 	description = "Pozdrowienia od Monka.";
};

FUNC INT DIA_NASZ_308_Frut_Monk_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_frut))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_Monk_Info()
{
	AI_Output (other,self ,"DIA_NASZ_308_Frut_Monk_15_00"); //Pozdrowienia od Monka.
	AI_Output (self, other,"DIA_NASZ_308_Frut_Monk_55_01"); //¯artujesz sobie chyba, nowy.
	AI_Output (other, self,"DIA_NASZ_308_Frut_Monk_55_02"); //Prócz pozdrowieñ mia³em przekazaæ ci te¿ potê¿nego kopa w dupê.
	AI_Output (self, other,"DIA_NASZ_308_Frut_Monk_55_03"); //O! To ju¿ mi siê podoba.

	Frut_wstrzymywanie=1;
	AI_StopProcessInfos (self);
	B_Attack (self, hero, AR_NONE, 1);

};

var int Frut_Won;
//*********************************************************************
//	Info MonkWin
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_monkwin   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 11;
 	condition   = DIA_NASZ_308_Frut_monkwin_Condition;
 	information = DIA_NASZ_308_Frut_monkwin_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_308_Frut_monkwin_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_308_Frut_Monk)
		&& (NASZ_308_Frut.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
		&& (FRUT_WON == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_monkwin_Info()
{
	AI_Output (self, other,"DIA_NASZ_308_Frut_monkwin_55_00"); //Nie ujdzie ci to p³azem... Obiecujê.
	Frut_wstrzymywanie=0;
	Npc_ExchangeRoutine (self, "Brama");
	Npc_ExchangeRoutine (NASZ_307_Monk, "Straz");
};


//*********************************************************************
//	Info MonkLose
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_monklose   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 12;
 	condition   = DIA_NASZ_308_Frut_monklose_Condition;
 	information = DIA_NASZ_308_Frut_monklose_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_308_Frut_monklose_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_308_Frut_Monk)
		&& (NASZ_308_Frut.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_monklose_Info()
{
	AI_Output (self, other,"DIA_NASZ_308_Frut_monklose_55_00"); //Coœ jeszcze mia³eœ mi przekazaæ?
	Frut_wstrzymywanie=0;

	//B_LogEntry (TOPIC_Monk_Frut, "Zawali³em. Jestem zbyt s³aby i oberwa³em od Fruta.");
	//Log_SetTopicStatus (TOPIC_Monk_Frut, LOG_FAILED);
	
	FailQuest(TOPIC_Monk_Frut,"");
	
	
	Frut_Won = TRUE;

};

//*********************************************************************
//	Info Mikstury
//*********************************************************************
INSTANCE DIA_NASZ_308_Frut_mikstury   (C_INFO)
{
	npc         = NASZ_308_Frut;
 	nr          = 13;
 	condition   = DIA_NASZ_308_Frut_mikstury_Condition;
 	information = DIA_NASZ_308_Frut_mikstury_Info;
 	permanent   = FALSE;
 	description = "Nod mówi, ¿e masz mnie wyposa¿yæ w mikstury.";
};

FUNC INT DIA_NASZ_308_Frut_mikstury_Condition()
{
	if (FRUT_MIKSTURY == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_308_Frut_mikstury_Info()
{
	AI_Output (other, self,"DIA_NASZ_308_Frut_mikstury_55_00"); //Nod mówi, ¿e masz mnie wyposa¿yæ w mikstury.
	AI_Output (self, other,"DIA_NASZ_308_Frut_mikstury_55_01"); //Mikstury? Oczywiœcie. Wybierz sobie któr¹œ sakwê.

	Info_ClearChoices (DIA_NASZ_308_Frut_mikstury);
	Info_AddChoice	  (DIA_NASZ_308_Frut_mikstury, "(1 eliksir si³y, 2 eliksiry zrêcznoœci, 1 eliksir ¿ycia, 3 esencje lecznicze)", DIA_NASZ_308_Frut_mikstury_power);
	Info_AddChoice	  (DIA_NASZ_308_Frut_mikstury, "(5 esencji leczniczych, 2 ekstrakty lecznicze, 8 esencji many)", DIA_NASZ_308_Frut_mikstury_mana);
	Info_AddChoice	  (DIA_NASZ_308_Frut_mikstury, "(12 esencji leczniczych, 5 ekstraktów leczniczych)", DIA_NASZ_308_Frut_mikstury_health);
};

FUNC VOID DIA_NASZ_308_Frut_mikstury_power()
{
	AI_Output (self, other,"DIA_NASZ_308_Frut_mikstury_power_55_00"); //Wybór godny bandyty. Trzymaj.

	Createinvitems (self, ItNa_SakwaMikstur_Power, 1);
	B_giveinvitems (self, other, ItNa_SakwaMikstur_Power, 1);
	Info_ClearChoices (DIA_NASZ_308_Frut_mikstury);

};

FUNC VOID DIA_NASZ_308_Frut_mikstury_mana()
{

	AI_Output (self, other,"DIA_NASZ_308_Frut_mikstury_mana_55_00"); //A coœ ty, mag jakiœ? No ale dobra, w koñcu siê jej pozbêdê.

	Createinvitems (self, ItNa_SakwaMikstur_Mana, 1);
	B_giveinvitems (self, other, ItNa_SakwaMikstur_Mana, 1);
	Info_ClearChoices (DIA_NASZ_308_Frut_mikstury);

};

FUNC VOID DIA_NASZ_308_Frut_mikstury_health()
{
	AI_Output (self, other,"DIA_NASZ_308_Frut_mikstury_health_55_00"); //Widzê, ¿e rozumiesz na jak krwaw¹ wyprawê idziesz...

	Createinvitems (self, ItNa_SakwaMikstur_Health, 1);
	B_giveinvitems (self, other, ItNa_SakwaMikstur_Health, 1);
	Info_ClearChoices (DIA_NASZ_308_Frut_mikstury);

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_308_Frut_PICKPOCKET (C_INFO)
{
	npc			= NASZ_308_Frut;
	nr			= 900;
	condition	= DIA_NASZ_308_Frut_PICKPOCKET_Condition;
	information	= DIA_NASZ_308_Frut_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_308_Frut_PICKPOCKET_Condition()
{
	C_Beklauen (48);
};
 
FUNC VOID DIA_NASZ_308_Frut_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_308_Frut_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_308_Frut_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_308_Frut_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_308_Frut_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_308_Frut_PICKPOCKET_DoIt);
};

func void DIA_NASZ_308_Frut_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItPo_Perm_STR,1);
	
	Info_ClearChoices (DIA_NASZ_308_Frut_PICKPOCKET);
};
	
func void DIA_NASZ_308_Frut_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_308_Frut_PICKPOCKET);
};
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_EXIT   (C_INFO)
{
	npc         = NASZ_215_Kivo;
	nr          = 999;
	condition   = DIA_NASZ_215_Kivo_EXIT_Condition;
	information = DIA_NASZ_215_Kivo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_215_Kivo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_215_Kivo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_siema   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 1;
 	condition   = DIA_NASZ_215_Kivo_siema_Condition;
 	information = DIA_NASZ_215_Kivo_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_215_Kivo_siema_Condition()
{
	if (KAPITEL == 1) && (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_siema_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_siema_55_01"); //Zw¹ mnie Kivo. Jestem najlepszy w swoim fachu.
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_siema_15_02"); //To znaczy?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_siema_55_03"); //Widzisz zapewne moj¹ zbrojê. Myœliwi maj¹ grupê ludzi do zadañ specjalnych.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_siema_55_04"); //Nie polujemy. Jesteœmy raczej stra¿nikami obozu i czasem patrolujemy okolicê, oceniamy zagro¿enie ze strony orków.
};

//*********************************************************************
//	Info Grupa
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_grupa   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 2;
 	condition   = DIA_NASZ_215_Kivo_grupa_Condition;
 	information = DIA_NASZ_215_Kivo_grupa_Info;
 	permanent   = FALSE;
 	description = "Opowiedz mi o tym wiêcej.";
};

FUNC INT DIA_NASZ_215_Kivo_grupa_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_siema)) && (KAPITEL == 1)
	{
	return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_grupa_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_grupa_15_00"); //Opowiedz mi o tym wiêcej.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_01"); //Te¿ chcia³byœ zostaæ stra¿nikiem? To bardzo odpowiedzialne zajêcie.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_02"); //Niecelnie trafiony œcierwojad ucieknie i kolacja bêdzie trochê mniej obfita. Za to jeœli spud³ujesz w zêbacza, rozwœcieczone zwierzê mo¿e przedrzeæ siê do obozu i narobiæ wiele szkód.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_03"); //Kilku z nas strze¿e obozu. Gdy w pobli¿u zobaczymy stado k¹saczy, biegniemy do bramy, by j¹ zamkn¹æ i strzelamy do nich z góry.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_04"); //Jeœli chodzi o nasz¹ dzia³alnoœæ poza obozem... Pilnujemy, by orkowie nie wchodzili na nasze tereny ³owieckie.
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_grupa_15_05"); //Orkowie czêsto to robi¹?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_06"); //Raczej nie zdarza siê to codziennie. I jeœli ju¿, to jest to pojedynczy zwiadowca. Ca³a filozofia polega na tym, by uciszyæ go jedn¹, maksymalnie dwoma strza³ami.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_07"); //Zielonoskórzy g³oœno krzycz¹, gdy s¹ zranieni, a to mo¿e przyci¹gn¹æ ich wiêcej.
};

//*********************************************************************
//	         Place
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_place   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 3;
 	condition   = DIA_NASZ_215_Kivo_place_Condition;
 	information = DIA_NASZ_215_Kivo_place_Info;
 	permanent   = FALSE;
 	description = "Co to za miejsce?";
};

FUNC INT DIA_NASZ_215_Kivo_place_Condition()	
{
	if (KAPITEL == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_place_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_place_15_00"); //Co to za miejsce?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_place_55_01"); //To cmentarz myœliwych.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_place_55_02"); //Tutaj grzebiemy swoich zmar³ych. Ludzie niestety nie s¹ nieœmiertelni.
};


//*********************************************************************
//	         What
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_what   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 4;
 	condition   = DIA_NASZ_215_Kivo_what_Condition;
 	information = DIA_NASZ_215_Kivo_what_Info;
 	permanent   = FALSE;
 	description = "Czemu tutaj jesteœ?";
};

FUNC INT DIA_NASZ_215_Kivo_what_Condition()	
{
	if (KAPITEL == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_what_15_00"); //Czemu tutaj jesteœ?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_what_55_01"); //Op³akujê mojego niedawno zmar³ego brata. Razem ze mn¹ by³ stra¿nikiem obozu.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_what_15_02"); //Orkowie zabili go tydzieñ temu.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_what_55_03"); //Zemszczê siê!
};

//*********************************************************************
//	Info GoToRenegaci
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_GoToRenegaci   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 4;
 	condition   = DIA_NASZ_215_Kivo_GoToRenegaci_Condition;
 	information = DIA_NASZ_215_Kivo_GoToRenegaci_Info;
 	permanent   = FALSE;
	description = "Potrzebujê twojej pomocy w walce z Marcosem.";
};

FUNC INT DIA_NASZ_215_Kivo_GoToRenegaci_Condition()	
{
	if (GestathRenegatOK == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_GoToRenegaci_Info()
{
	AI_Output (other, self,"DIA_NASZ_215_Kivo_GoToRenegaci_15_00"); //Potrzebujê twojej pomocy w walce z Marcosem.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_GoToRenegaci_55_01"); //Wola³bym przelewaæ krew orków ni¿ ludzi. To rozkaz Gestatha?
	AI_Output (other, self,"DIA_NASZ_215_Kivo_GoToRenegaci_55_02"); //Tak. Powiedzia³, ¿e masz mi pomóc. Na krew orków równie¿ przyjdzie pora. ChodŸ!

	Npc_ExchangeRoutine (self, "FollowRenegaci");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_215_Kivo,1);
};


//*********************************************************************
//	Info RenegaciOnPlace
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_RenegaciOnPlace   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 4;
 	condition   = DIA_NASZ_215_Kivo_RenegaciOnPlace_Condition;
 	information = DIA_NASZ_215_Kivo_RenegaciOnPlace_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_215_Kivo_RenegaciOnPlace_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_GoToRenegaci)) //
	&& (npc_knowsinfo (other, DIA_NASZ_217_Louis_GoToRenegaci))    // jesli pogadales z nimi trzema
	&& (npc_knowsinfo (other, DIA_NASZ_227_Vachut_GoToRenegaci))  // i sa z toba pod brama
	&& ((Npc_GetDistToWP(hero,"OW_PATH_148_A") < 1000)
	 || (Npc_GetDistToWP(hero,"OW_PATH_264") < 1000))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_RenegaciOnPlace_Info()
{
	// FIX Ucieczka 1.1 - niestety dubbing nagrany jako wszystko Kivo, wiec to juz nie moze byc trialog :(
	//var C_NPC Kivo; Kivo = Hlp_GetNpc (NASZ_215_Kivo);
	//var C_NPC Louis; Louis = Hlp_GetNpc (NASZ_217_Louis);
	//var C_NPC Vachut; Vachut = Hlp_GetNpc (NASZ_227_Vachut);
	
	//TRIA_Invite(Kivo);
	//TRIA_Invite(Louis);
	//TRIA_Invite(Vachut);
	
    //TRIA_Start();
 
	//TRIA_Next(Kivo);
	
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_15_00"); //I jesteœmy. Widzisz ju¿ dziurê, któr¹ chcesz siê przedostaæ?
	AI_Output (other, self,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_01"); //Jeszcze nie, muszê przyjrzeæ siê lepiej tym barykadom.
	
	if (Npc_GetDistToWP(hero,"OW_PATH_264") < (Npc_GetDistToWP(hero,"OW_PATH_148_A"))) {
		AI_Output (other, self,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_02"); //Wy oczekujcie przy tej bramie. O ile dobrze pamiêtam, ko³owrót otwiera³ w³aœnie t¹.
	} else {
		AI_Output (other, self,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_03"); //Wy udajcie siê pod drug¹ bramê. Stamt¹d zaatakujecie.
	};
	
	//TRIA_Next(Louis);
	//AI_TurnToNpc(other, self);
    //AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_04"); //Szczerze mówi¹c, czujê wiêkszy entuzjazm, gdy mam zabijaæ ludzi a nie zwierzynê.

	//TRIA_Next(Vachut);
	//AI_TurnToNpc(other, self);
    //AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_05"); //Po drodze zebra³em trochê t³uszczu z bestii i napcha³em do pojemniczka.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_06"); //Myœlê, ¿e mo¿e ci siê przydaæ, w razie gdyby ko³owrót nie chcia³ siê poruszyæ.

	Createinvitems (self, ItMi_Moleratlubric_MIS, 1);
	B_giveinvitems (self, other, ItMi_Moleratlubric_MIS, 1);
	
	AI_Output (other, self,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_07"); //Dziêki.

	//TRIA_Next(Kivo);
	//AI_TurnToNpc(other, self);
    //AI_TurnToNpc(self, other);
		
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_08"); //Zaatakujemy pod os³on¹ nocy. Do tego czasu odpocznijmy trochê.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_09"); //Ty, Willu, idŸ poszukaj szpary miêdzy deskami. A, i najwa¿niejsze: Nie daj siê zdeptaæ, gdy bêdziesz przemieniony w ma³ego owada.
	
	//TRIA_Finish();
	
	B_LogEntry(TOPIC_Korth_kopalnia,"Dotarliœmy pod kopalniê. Kivo powiedzia³, ¿e zaatakujemy pod os³on¹ nocy. Muszê znaleŸæ jak¹œ szparê, by wejœæ do œrodka. Vachut da³ mi te¿ ³ój kretoszczura, ¿ebym móg³ przekrêciæ ko³owrót i otworzyæ bramê myœliwym.");

	
	Info_ClearChoices (DIA_NASZ_215_Kivo_RenegaciOnPlace);
		Info_AddChoice	  (DIA_NASZ_215_Kivo_RenegaciOnPlace, "KONIEC", DIA_NASZ_215_Kivo_RenegaciOnPlace_end);
};

FUNC VOID DIA_NASZ_215_Kivo_RenegaciOnPlace_end()
{
	AI_StopProcessInfos(self);
	
	RenegaciSetTime_Go = TRUE;
	Fade_Status = 1;
	ff_applyonce(RenegaciSetTime);
	
	Npc_ExchangeRoutine (NASZ_215_Kivo, "StandRenegaci");
	Npc_ExchangeRoutine (NASZ_217_Louis, "StandRenegaci");
	Npc_ExchangeRoutine (NASZ_227_Vachut, "StandRenegaci");
	
};



//*********************************************************************
//	         YouToo
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_youtoo   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 30;
 	condition   = DIA_NASZ_215_Kivo_youtoo_Condition;
 	information = DIA_NASZ_215_Kivo_youtoo_Info;
 	permanent   = FALSE;
 	description = "Ciebie te¿ tutaj przys³ali?";
};

FUNC INT DIA_NASZ_215_Kivo_youtoo_Condition()	
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_BANDYCI_OBOZ_21"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_youtoo_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_youtoo_15_00"); //Ciebie te¿ tutaj przys³ali?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_youtoo_55_01"); //Tak. Doœæ ju¿ siê nalamentowa³em. Okres ¿a³oby dobieg³ koñca.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_youtoo_15_02"); //Teraz pora siê zemœciæ.

};

//*********************************************************************
//	         Help
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_help   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 31;
 	condition   = DIA_NASZ_215_Kivo_help_Condition;
 	information = DIA_NASZ_215_Kivo_help_Info;
 	permanent   = FALSE;
 	description = "Mogê ci siê na coœ przydaæ?";
};

FUNC INT DIA_NASZ_215_Kivo_help_Condition()	
{
	if (KAPITEL>=3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_help_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_help_15_00"); //Mogê ci siê na coœ przydaæ?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_55_01"); //Hmm... Zanim pójdê walczyæ z orkami, przyda³by mi siê pewien miecz. Walka na dystans jest dobra, gdy orków jest dwóch albo trzech.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_55_02"); //Spodziewam siê walki nawet z dziesiêcioma przeciwnikami, a wiêc potrzebujê ostrza do walki wrêcz, które sieje postrach w szeregach orków.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_15_03"); //Pomiêdzy Star¹ Kopalni¹ a zamkiem, gdzieœ w lesie jest cudeñko, które mnie interesuje.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_15_04"); //Konkretniej to Orkowa Zguba. Gdybym pojawi³ siê z takim ostrzem, zielonoskórzy straciliby pewnoœæ siebie! Przynieœ mi ten miecz.
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_help_15_05"); //Sk¹d wiesz, ¿e znajdê ten miecz w³aœnie w tym lesie?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_15_06"); //Jeszcze za czasów Gomeza mój przyjaciel w³ada³ tak¹ broni¹. Któregoœ dnia poszed³ tam polowaæ i nigdy nie wróci³. Miecz musi byæ gdzieœ tam.

	//Wld_InsertNpc	(NASZ_413_Umarlak,"NASZ_UMARLAK"); 
	//B_KillNPC (NASZ_413_Umarlak);
	Wld_InsertNpc	(Gobbo_Warrior_Kivo,"NASZ_UMARLAK"); 

	Log_CreateTopic (TOPIC_Kivo_zemsta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kivo_zemsta, LOG_RUNNING);
	B_LogEntry (TOPIC_Kivo_zemsta, "Kivo chce, bym odnalaz³ broñ o nazwie 'Orkowa Zguba', dziêki której mo¿na os³abiæ morale orków. Jego przyjaciel by³ niegdyœ posiadaczem tej broni, ale ostatnio widziano go bardzo dawno temu w lesie miêdzy Star¹ Kopalni¹ a zamkiem. W¹tpiê, ¿ebym tam coœ znalaz³, ale póki co nie ma lepszego tropu.");

};

var int KIVO_HELP;
//*********************************************************************
//	         OrkowaZguba
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_OrkowaZguba   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 32;
 	condition   = DIA_NASZ_215_Kivo_OrkowaZguba_Condition;
 	information = DIA_NASZ_215_Kivo_OrkowaZguba_Info;
	permanent   = FALSE;
 	description = "O ten miecz ci chodzi?";
};

FUNC INT DIA_NASZ_215_Kivo_OrkowaZguba_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_help)
		&& npc_hasitems (other, ItMw_Orkschlaechter) >= 1)
	{
		return TRUE;
	};
};


FUNC VOID DIA_NASZ_215_Kivo_OrkowaZguba_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_OrkowaZguba_15_00"); //O ten miecz ci chodzi?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_OrkowaZguba_55_01"); //Poka¿.
	B_giveinvitems (other, self, ItMw_Orkschlaechter, 1);
	
	
	var c_npc slf; slf = Hlp_GetNpc(self);
	Npc_InspectWeapon(slf,ItMw_Orkschlaechter,true);
	
	AI_Output (self, other,"DIA_NASZ_215_Kivo_OrkowaZguba_15_02"); //O tak... idealny!
	AI_Output (self, other,"DIA_NASZ_215_Kivo_OrkowaZguba_15_03"); //Dziêki, przyjacielu! WeŸ trochê z³ota w nagrodê.
	Createinvitems (self, ItMi_Gold, 100);
	B_giveinvitems (self, other, ItMi_Gold, 100);

	KIVO_HELP = TRUE;
	
	B_GivePlayerXP(700);
	DodajReputacje(2,REP_MYSLIWI);
	Log_SetTopicStatus (TOPIC_Kivo_zemsta, LOG_SUCCESS);
	B_LogEntry (TOPIC_Kivo_zemsta, "Odda³em miecz Kivo.");

};

//*********************************************************************
//	         ComeOn
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_comeon   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 35;
 	condition   = DIA_NASZ_215_Kivo_comeon_Condition;
 	information = DIA_NASZ_215_Kivo_comeon_Info;
 	permanent   = TRUE;
 	description = "ChodŸ ze mn¹.";
};

FUNC INT DIA_NASZ_215_Kivo_comeon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (WODZOWIE_KILLED == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_comeon_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_comeon_15_00"); //ChodŸ ze mn¹.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_comeon_55_01"); //Po co?
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_comeon_15_02"); //Jaszczuroludzie s¹ dla nas zagro¿eniem, pomó¿ mi ich unicestwiæ.

		if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_OrkowaZguba)){
			AI_Output (self, other,"DIA_NASZ_215_Kivo_comeon_15_03"); //Dobra, pójdê za tob¹.

			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self, "Follow");
			//self.aivar[AIV_PARTYMEMBER] = TRUE;
			Druzyna (NASZ_215_Kivo,1);
		}
		else {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_comeon_55_04"); //Najpierw ty pomó¿ mnie, potem ja pomogê tobie.
		};
};

//*********************************************************************
//	         Back
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_back   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 36;
 	condition   = DIA_NASZ_215_Kivo_back_Condition;
 	information = DIA_NASZ_215_Kivo_back_Info;
 	permanent   = TRUE;
 	description = "Wracaj.";
};

FUNC INT DIA_NASZ_215_Kivo_back_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (WODZOWIE_KILLED == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_back_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_back_15_00"); //Wracaj.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_back_55_01"); //Jeœli bêdê ci potrzebny, to daj znaæ.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Bandyci");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_215_Kivo,0);
};

//*********************************************************************
//	         ImportantBack
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_ImportantBack   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 37;
 	condition   = DIA_NASZ_215_Kivo_ImportantBack_Condition;
 	information = DIA_NASZ_215_Kivo_ImportantBack_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_215_Kivo_ImportantBack_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (WODZOWIE_KILLED == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_ImportantBack_Info()
{
	AI_Output (self, other,"DIA_NASZ_215_Kivo_ImportantBack_15_00"); //Ten Kamashi... To by³o potworne monstrum.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Bandyci");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_215_Kivo,0);
};

var int KIVO_GO;
//*********************************************************************
//	         TrollCanyon
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_TrollCanyon   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 38;
 	condition   = DIA_NASZ_215_Kivo_TrollCanyon_Condition;
 	information = DIA_NASZ_215_Kivo_TrollCanyon_Info;
 	permanent   = TRUE;
 	description = "Musisz udaæ siê do Kanionu Trolli.";
};

FUNC INT DIA_NASZ_215_Kivo_TrollCanyon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)
		&& (!KIVO_GO))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_TrollCanyon_Info()
{
	AI_Output (other, self,"DIA_NASZ_215_Kivo_TrollCanyon_15_00"); //Musisz udaæ siê do Kanionu Trolli.
		if (KIVO_HELP == TRUE) && (WODZOWIE_KILLED == TRUE) {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_01"); //Robi siê! Orkowie mog¹ ju¿ kopaæ sobie groby.			
			Npc_ExchangeRoutine (self, "Twierdza");
			B_GivePlayerXP (100);
			KIVO_GO = TRUE;
			B_LogEntry (TOPIC_Keroloth_pomoc, "Kivo uda³ siê do twierdzy.");
			KerolothMysliwi = KerolothMysliwi + 1;
		};
		if (KIVO_HELP == TRUE) && (WODZOWIE_KILLED == FALSE) {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_02"); //Myœlê, ¿e mogê siê przydaæ jeszcze Benito.
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_03"); //Nie ruszê siê st¹d, dopóki on nie za³atwi swoich spraw.
		};
		if (KIVO_HELP == FALSE) && (WODZOWIE_KILLED == FALSE) {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_04"); //Bez porz¹dnego miecza siê nie ruszam!
		};
		if (KIVO_HELP == FALSE) && (WODZOWIE_KILLED == TRUE) {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_05"); //Bez porz¹dnego miecza siê nie ruszam!
		};
};

// ************************************************************
// 			  				CanYouTeach
// ************************************************************
instance DIA_NASZ_215_Kivo_CanYouTeach (C_INFO)
{
	npc		 	= NASZ_215_Kivo;
	nr		 	= 100;
	condition	= DIA_NASZ_215_Kivo_CanYouTeach_Condition;
	information	= DIA_NASZ_215_Kivo_CanYouTeach_Info;
	permanent 	= FALSE;
	description	= "Mo¿esz mnie czegoœ nauczyæ?";
};

func int DIA_NASZ_215_Kivo_CanYouTeach_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_215_Kivo_CanYouTeach_Info ()
{
	AI_Output (other, self, "DIA_NASZ_215_Kivo_CanYouTeach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_NASZ_215_Kivo_CanYouTeach_08_01"); //Chêtnie poka¿ê ci, jak strzelaæ z ³uku.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Stra¿nik Kivo podszkoli mnie w ³ucznictwie.");	

};

//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_AmmannQuest   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 39;
 	condition   = DIA_NASZ_215_Kivo_AmmannQuest_Condition;
 	information = DIA_NASZ_215_Kivo_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "WeŸ ten pierœcieñ.";
};

FUNC INT DIA_NASZ_215_Kivo_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_215_Kivo_AmmannQuest_15_00"); //WeŸ ten pierœcieñ.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_215_Kivo_AmmannQuest_15_01"); //Co to?
	AI_Output (other, self,"DIA_NASZ_215_Kivo_AmmannQuest_15_02"); //Staniesz siê silniejszy walcz¹c u boku swoich towarzyszy.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_AmmannQuest_15_03"); //Niewiarygodne... Czas to przetestowaæ!

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		PierscienieWiernosciFinish();
	};

};

// ************************************************************
// 			  				TEACH
// ************************************************************

const int Kivo_BOW_MAX = 100;
var int Kivo_Merke_Bow;

func void KivoAddChoicesBOW() {

	if (AlignRequestedAmountToTeacherMax(LEARN_BOW, 1, Kivo_BOW_MAX) > 0) {
		Info_AddChoice		(DIA_Kivo_Teach, BuildLearnString(LEARN_BOW, 1, Kivo_BOW_MAX), DIA_Kivo_Teach_BOW_1); 
	};
	if (AlignRequestedAmountToTeacherMax(LEARN_BOW, 5, Kivo_BOW_MAX) > 1) {
		Info_AddChoice		(DIA_Kivo_Teach, BuildLearnString(LEARN_BOW, 5, Kivo_BOW_MAX), DIA_Kivo_Teach_BOW_5); 
	};

};

func void KivoSay_CantTeachYou() {
	AI_Output(self,other,"KivoSay_CantTeachYou_01_00"); //Niczego wiêcej ciê ju¿ nie nauczê. Strzelaj, ¿eby twoja celnoœæ nie mala³a.
};

func void KivoSay_NoMoney() {
	AI_Output (self, other,"KivoSay_NoMoney_01_00"); //Nie masz doœæ z³ota.
};

func void KivoSay_NoExp() {
	AI_Output (self, other,"KivoSay_NoExp_01_00"); //Brak ci doœwiadczenia.
};

INSTANCE DIA_Kivo_Teach   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 100;
 	condition   = DIA_Kivo_Teach_Condition;
 	information = DIA_Kivo_Teach_Info;
 	permanent   = TRUE;
	description = "Chcê siê nauczyæ czegoœ o ³ucznictwie.";
};

FUNC INT DIA_Kivo_Teach_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_CanYouTeach))
	&& (other.HitChance[NPC_TALENT_BOW] < 100)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Kivo_Teach_Info()
{
	AI_Output (other, self, "DIA_NASZ_215_Kivo_TeachBow_15_00"); //Chcê siê nauczyæ czegoœ o ³ucznictwie.
	AI_Output (self, other, "DIA_NASZ_215_Kivo_TeachBow_08_01"); //Czego mogê ciê nauczyæ?
	
	Kivo_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	
	Info_ClearChoices 	(DIA_Kivo_Teach);
	Info_AddChoice 		(DIA_Kivo_Teach,	DIALOG_BACK		,DIA_Kivo_Teach_Back);
	KivoAddChoicesBOW();
};

FUNC VOID DIA_Kivo_Teach_Back ()
{
	if (Kivo_Merke_Bow < other.HitChance[NPC_TALENT_BOW] && other.HitChance[NPC_TALENT_BOW] < 100)
	{
		AI_Output (self ,other,"DIA_NASZ_215_Kivo_TeachBow_BACK_08_00"); //No i proszê. Od razu poprawi³a siê twoja celnoœæ.
	};

	Info_ClearChoices (DIA_Kivo_Teach);
};

FUNC VOID DIA_Kivo_Teach_BOW_1 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_BOW,1,Kivo_BOW_MAX)) {
		KivoSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_BOW,1,Kivo_BOW_MAX)) {
		KivoSay_NoExp();
	}
	else {
	
		B_GiveInvItems(other,self,ItMi_Gold,CalculateLearnGoldCost(LEARN_BOW,1,Kivo_BOW_MAX));
		B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, Kivo_BOW_MAX);
	
		if (GetTalentNow(LEARN_BOW) >= Kivo_BOW_MAX)
		{
			KivoSay_CantTeachYou();
			Info_ClearChoices 	(DIA_Kivo_Teach);
			return;
		};
	
		Info_ClearChoices 	(DIA_Kivo_Teach);
		Info_AddChoice 		(DIA_Kivo_Teach,	DIALOG_BACK		,DIA_Kivo_Teach_Back);
		KivoAddChoicesBOW();
	};

};

FUNC VOID DIA_Kivo_Teach_BOW_5 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_BOW,5,Kivo_BOW_MAX)) {
		KivoSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_BOW,5,Kivo_BOW_MAX)) {
		KivoSay_NoExp();
	}
	else {
	
		var int amount; amount = AlignRequestedAmountToTeacherMax(LEARN_BOW,5,Kivo_BOW_MAX);
		B_GiveInvItems(other,self,ItMi_Gold,CalculateLearnGoldCost(LEARN_BOW,amount,Kivo_BOW_MAX));
		B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, amount, Kivo_BOW_MAX);
	
		if (GetTalentNow(LEARN_BOW) >= Kivo_BOW_MAX)
		{
			KivoSay_CantTeachYou();
			Info_ClearChoices 	(DIA_Kivo_Teach);
			return;
		};

		Info_ClearChoices 	(DIA_Kivo_Teach);
		Info_AddChoice 		(DIA_Kivo_Teach,	DIALOG_BACK		,DIA_Kivo_Teach_Back);
		KivoAddChoicesBOW();
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_215_Kivo_PICKPOCKET (C_INFO)
{
	npc			= NASZ_215_Kivo;
	nr			= 900;
	condition	= DIA_NASZ_215_Kivo_PICKPOCKET_Condition;
	information	= DIA_NASZ_215_Kivo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_215_Kivo_PICKPOCKET_Condition()
{
	C_Beklauen (61);
};
 
FUNC VOID DIA_NASZ_215_Kivo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_215_Kivo_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_215_Kivo_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_215_Kivo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_215_Kivo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_215_Kivo_PICKPOCKET_DoIt);
};

func void DIA_NASZ_215_Kivo_PICKPOCKET_DoIt()
{
	B_BeklauenGold(28);
	
	Info_ClearChoices (DIA_NASZ_215_Kivo_PICKPOCKET);
};
	
func void DIA_NASZ_215_Kivo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_215_Kivo_PICKPOCKET);
};
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_EXIT   (C_INFO)
{
	npc         = NASZ_008_Miecz;
	nr          = 999;
	condition   = DIA_NASZ_008_Miecz_EXIT_Condition;
	information = DIA_NASZ_008_Miecz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_008_Miecz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_008_Miecz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_siema   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 1;
 	condition   = DIA_NASZ_008_Miecz_siema_Condition;
 	information = DIA_NASZ_008_Miecz_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_008_Miecz_siema_Condition()
{
	if !(npc_knowsinfo (other, DIA_NASZ_111_Gerold_sure))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_008_Miecz_siema_55_00"); //Kim jesteœ? Czego ode mnie chcesz?
	AI_ReadyMeleeWeapon		(self);
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_siema_15_01"); //Chcia³em tylko sprawdziæ, co to za wie¿a.
	AI_RemoveWeapon 		(self);
	
	if (Wld_IsTime(20,50,08,10)) {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_siema_55_02"); //Dobrze, ¿e siê zbudzi³em. Mo¿e to ty jesteœ Ÿród³em mojego problemu? Zagl¹da³eœ tu ju¿ kiedyœ?
		AI_Output (other,self ,"DIA_NASZ_008_Miecz_siema_15_03"); //Jestem tu po raz pierwszy. O jakim problemie mówisz?
	}
	else {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_siema_55_04"); //Nie jesteœ jedynym nieproszonym goœciem na moim terytorium.
		AI_Output (other,self ,"DIA_NASZ_008_Miecz_siema_15_05"); //Co chcesz przez to powiedzieæ?
	};
	
	AI_Output (self, other,"DIA_NASZ_008_Miecz_siema_55_06"); //Nie miewam w zwyczaju dzieliæ siê swoimi problemami z nieznajomymi. Postaw jakiœ dobry alkohol, to mo¿e siê zakumplujemy.
		
};

var int MieczGrogRumOK;
//*********************************************************************
//	Info Grog
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_grog   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 2;
 	condition   = DIA_NASZ_008_Miecz_grog_Condition;
 	information = DIA_NASZ_008_Miecz_grog_Info;
 	permanent   = FALSE;
 	description = "£yknij sobie.";
};

FUNC INT DIA_NASZ_008_Miecz_grog_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_siema))
	{
		return TRUE;
	};
};

func void MieczSay_Thx() {
	AI_Output (self, other,"MieczSay_Thx_55_00"); //Dziêki ci.
};

func void MieczSay_Give() {
	AI_Output (self, other,"MieczSay_Give_55_00"); //Dawaj!
};

func void HeroMieczAlcohol() {

	AI_Output (self, other,"HeroMieczAlcohol_15_01"); //Taa?

	if (npc_hasitems (other, ItFo_Addon_Rum) >=1) {
		AI_Output (other,self ,"HeroMieczAlcohol_15_02"); //Masz tu rum. Pij œmia³o.
		MieczSay_Give();
		B_GiveInvItems (other, self, ItFo_Addon_Rum, 1);
		B_UseItem (self, ItFo_Addon_Rum);
		MieczSay_Thx();
		B_GivePlayerXP (50);
	}
	else if (npc_hasitems (other, ItFo_Addon_Grog) >=1) {
		AI_Output (other,self ,"HeroMieczAlcohol_15_03"); //Masz tu grog. Pij œmia³o.
		MieczSay_Give();
		B_GiveInvItems (other, self, ItFo_Addon_Rum, 1);
		B_UseItem (self, ItFo_Addon_Rum);
		MieczSay_Thx();
		B_GivePlayerXP (50);
	}
	else {
		AI_Output (other,self ,"HeroMieczAlcohol_15_04"); //Masz tu piwo. Pij œmia³o.
		AI_Output (self, other,"HeroMieczAlcohol_55_05"); //A, niech bêdzie! W sumie dawno nie pi³em...
		B_GiveInvItems (other, self, ItFo_Beer, 1);
		B_UseItem (self, ItFo_Beer);
		MieczSay_Thx();
	};
		
	AI_Output (other,self ,"HeroMieczAlcohol_15_06"); //No to co, teraz powiesz mi, co ciê trapi?
	AI_Output (self, other,"HeroMieczAlcohol_55_07"); //Ka¿dej nocy wydaje mi siê, ¿e ktoœ krêci siê w pobli¿u mojej kryjówki i usi³uje mnie zabiæ. 
	AI_Output (self, other,"HeroMieczAlcohol_55_08"); //Lecz gdy siê budzê, nikogo w pobli¿u nie ma.

};

FUNC VOID DIA_NASZ_008_Miecz_grog_Info()
{
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_grog_15_00"); //£yknij sobie.
	
	if (npc_hasitems (other, ItFo_Addon_Rum) >=1) || (npc_hasitems (other, ItFo_Addon_Grog) >=1) || (npc_hasitems (other, ItFo_Beer) >=1) {
		
		HeroMieczAlcohol();
		MieczGrogRumOK = TRUE;
	}

	else if (npc_hasitems (other, ItFo_Booze) >=1) {
		AI_Output (self,other ,"DIA_NASZ_008_Miecz_grog_15_09"); //Taa?
		AI_Output (other,self ,"DIA_NASZ_008_Miecz_grog_15_10"); //Masz tu gin. Pij œmia³o.
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_55_11"); //Gin? Cz³owieku, chcesz ¿ebym siê porzyga³?! Piraci nie pij¹ takich rzeczy!
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_55_12"); //Przynieœ mi coœ normalnego. Jakiœ grog albo rum...
	}

	else {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_15_13"); //Niby co mam sobie ³ykn¹æ, hê?
		AI_Output (other, self,"DIA_NASZ_008_Miecz_grog_15_14"); //Nie wiem. Myœla³em, ¿e sam masz coœ na zbyciu.
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_15_15"); //Gdzie¿ tam. Tu nie ma nic, absolutnie NIC do picia...
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_15_16"); //Przynieœ mi grog albo rum. Wtedy pogadamy.
	};
};

//*********************************************************************
//	Info GrogRum
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_GrogRum   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 3;
 	condition   = DIA_NASZ_008_Miecz_GrogRum_Condition;
 	information = DIA_NASZ_008_Miecz_GrogRum_Info;
 	permanent   = FALSE;
 	description = "Przynios³em alkohol.";
};

FUNC INT DIA_NASZ_008_Miecz_GrogRum_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_grog)) && (MieczGrogRumOK == FALSE)
	&& ((npc_hasitems (other, ItFo_Addon_Rum) >=1) || (npc_hasitems (other, ItFo_Addon_Grog) >=1) || (npc_hasitems (other, ItFo_Beer) >=1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_GrogRum_Info()
{
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_GrogRum_15_00"); //Przynios³em alkohol.

	HeroMieczAlcohol();		
	MieczGrogRumOK = TRUE;
};

//*********************************************************************
//	Info WhatIsThisTower
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_WhatIsThisTower   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 4;
 	condition   = DIA_NASZ_008_Miecz_WhatIsThisTower_Condition;
 	information = DIA_NASZ_008_Miecz_WhatIsThisTower_Info;
 	permanent   = FALSE;
 	description = "Co to za wie¿a?";
};

FUNC INT DIA_NASZ_008_Miecz_WhatIsThisTower_Condition()
{
	if ((MieczGrogRumOK == TRUE) || (npc_knowsinfo (other, DIA_NASZ_111_Gerold_sure))) && (Npc_GetDistToWP(NASZ_008_Miecz, "NASZ_MIECZ_4") <=4000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_WhatIsThisTower_Info()
{
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_WhatIsThisTower_15_00"); //Co to za wie¿a?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_WhatIsThisTower_55_01"); //Po jej wyposa¿eniu domyœlam siê, ¿e pe³ni³a niegdyœ rolê pracowni jakiegoœ maga.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_WhatIsThisTower_55_02"); //Jest bardzo stara i zniszczona. Nie by³em w stanie dostaæ siê na wy¿sze piêtra, wiêc nie wiem, co tam jest.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_WhatIsThisTower_55_03"); //I lepiej nie próbuj samemu. A ju¿ na pewno nie licz na to, ¿e jeœli siê po³amiesz, to nastawiê ci stawy. Nie znam siê na tym!

};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_zadanie   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 5;
 	condition   = DIA_NASZ_008_Miecz_zadanie_Condition;
 	information = DIA_NASZ_008_Miecz_zadanie_Info;
 	permanent   = FALSE;
 	description = "Mogê ci jakoœ pomóc?";
};

FUNC INT DIA_NASZ_008_Miecz_zadanie_Condition()
{
	if (MieczGrogRumOK == TRUE) || (npc_knowsinfo (other, DIA_NASZ_111_Gerold_sure))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_zadanie_15_00"); //Mogê ci jakoœ pomóc?
	

	if (!npc_knowsinfo (other, DIA_NASZ_111_Gerold_sure)) {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_01"); //Ton¹cy brzytwy siê chwyta. Przyjmê ka¿d¹ pomoc, byle tylko uwolniæ swoj¹ g³owê od tych urojeñ i móc siê porz¹dnie wyspaæ.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_02"); //Ka¿dej nocy wydaje mi siê, ¿e ktoœ krêci siê w pobli¿u mojej kryjówki i usi³uje mnie zabiæ. 
		AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_03"); //Lecz gdy siê budzê nikogo w pobli¿u nie ma.
	};

	AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_04"); //Nie jestem przekonany, czy to mi siê œni, czy ktoœ naprawdê usi³uje mnie zabiæ.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_05"); //Œpiê zawsze od dziewi¹tej do ósmej. Rozgl¹dnij siê w nocy wokó³, mo¿e coœ zobaczysz.
	//ork jest TYLKO w nocy.

	OrcMieczRunning = TRUE;
	Log_CreateTopic (TOPIC_Miecz_ork, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Miecz_ork, LOG_RUNNING);
	B_LogEntry (TOPIC_Miecz_ork, "Pirat ma problemy ze snem. Twierdzi, ¿e ktoœ podkrada siê w nocy do jego obozu. Poprosi³ mnie, abym stan¹³ na czatach i rozejrza³ siê w pobli¿u, gdy on bêdzie spa³. Œpi od dziewi¹tej do ósmej. Chyba nie wyœpiê siê tej nocy... ");

	if (Wld_IsTime (04,10,23,40)) {
		Wld_InsertNpc	(NASZ_451_OrkMiecz,"TOT");
	}
	else {
		Wld_InsertNpc	(NASZ_451_OrkMiecz,"NASZ_MIECZ_6");
	};
	

};

//*********************************************************************
//	Info Koniec
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_koniec   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 6;
 	condition   = DIA_NASZ_008_Miecz_koniec_Condition;
 	information = DIA_NASZ_008_Miecz_koniec_Info;
 	permanent   = FALSE;
 	description = "Rozwi¹za³em twój problem.";
};

FUNC INT DIA_NASZ_008_Miecz_koniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_zadanie)
	&& npc_isdead (NASZ_451_OrkMiecz))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_koniec_Info()
{
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_koniec_15_00"); //Rozwi¹za³em twój problem.
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_koniec_15_01"); //Rozgl¹da³em siê przez jakiœ czas, a¿ zobaczy³em orka. Prawdopodobnie szeleœci³ tak, bo pociera³ toporem o topór. Zapewne ostrzy³ swoj¹ broñ.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_koniec_55_02"); //Nie wpad³em na to, ¿e to dŸwiêk pocieranej zardzewia³ej stali. Jednak gdy mi o tym powiedzia³eœ, to faktycznie, to by³ dok³adnie ten dŸwiêk.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_koniec_55_03"); //Mam nadziejê, ¿e wys³a³eœ tego orka do piachu?
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_koniec_15_04"); //Tak. I jego ostry topór w niczym mu nie pomóg³.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_koniec_55_05"); //Dobrze siê spisa³eœ. Oto twoja nagroda.

	Createinvitems (self, itmi_gold, 140);
	B_giveinvitems (self, other, itmi_gold, 140);
	B_LogEntry (TOPIC_Miecz_ork, "Kto by pomyœla³? Ork ostrz¹cy topór... Tylko nadal nie rozumiem, dlaczego robi³ to przez kilka nocy. Ale odpowiedŸ na to pytanie odesz³a razem z tym orkiem.");
	Log_SetTopicStatus (TOPIC_Miecz_ork, LOG_SUCCESS);
	B_GivePlayerXP (400);
	
	OrcMieczRunning = FALSE;

};

//*********************************************************************
//	Info Duchy
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_duchy   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 11;
 	condition   = DIA_NASZ_008_Miecz_duchy_Condition;
 	information = DIA_NASZ_008_Miecz_duchy_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_008_Miecz_duchy_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_sure))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_duchy_Info()
{
	AI_Output (self, other,"DIA_NASZ_008_Miecz_duchy_15_00"); //Kolejny o¿ywieniec, a mo¿e jeszcze inne monstrum w ludzkiej skórze?
	AI_Output (other, self,"DIA_NASZ_008_Miecz_duchy_55_01"); //Raczej zabójca szkieletów.

};

//*********************************************************************
//	Info Duchy2
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_duchy2   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 12;
 	condition   = DIA_NASZ_008_Miecz_duchy2_Condition;
 	information = DIA_NASZ_008_Miecz_duchy2_Info;
 	permanent   = FALSE;
 	description = "Co tu robisz?";
};

FUNC INT DIA_NASZ_008_Miecz_duchy2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_duchy))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_duchy2_Info()
{
	AI_Output (other, self,"DIA_NASZ_008_Miecz_duchy2_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_duchy2_55_01"); //Musia³em mieæ oko na te trupy.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_duchy2_55_02"); //Ca³kiem niedawno widzia³em, jak têdy przechodzi³y, a ich droga wiod³a ca³kiem blisko mojej kryjówki.
	AI_Output (other, self,"DIA_NASZ_008_Miecz_duchy2_15_03"); //Widzia³eœ mo¿e, sk¹d siê bior¹?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_duchy2_55_04"); //Tak, widzia³em sk¹d wychodzi³y. Jeœli chcesz, mogê ci pokazaæ to miejsce.

	B_LogEntry (TOPIC_Keroloth_duchy, "Pirat widzia³, sk¹d bra³y siê szkielety i mo¿e mnie tam zaprowadziæ.");
};


//*********************************************************************
//	Info Prowadzenie
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_prowadzenie   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 13;
 	condition   = DIA_NASZ_008_Miecz_prowadzenie_Condition;
 	information = DIA_NASZ_008_Miecz_prowadzenie_Info;
 	permanent   = FALSE;
 	description = "ChodŸmy wiêc.";
};

FUNC INT DIA_NASZ_008_Miecz_prowadzenie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_duchy2))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_prowadzenie_Info()
{
	AI_Output (other, self,"DIA_NASZ_008_Miecz_prowadzenie_15_00"); //ChodŸmy wiêc.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_prowadzenie_55_01"); //Za mn¹.

	Npc_ExchangeRoutine (self, "Guide");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_008_Miecz,1);
	AI_StopProcessInfos (self);
	
};

//*********************************************************************
//	Info Prowadzenie2
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_prowadzenie2   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 14;
 	condition   = DIA_NASZ_008_Miecz_prowadzenie2_Condition;
 	information = DIA_NASZ_008_Miecz_prowadzenie2_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_008_Miecz_prowadzenie2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_prowadzenie)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_046"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_prowadzenie2_Info()
{
	AI_Output (self, other,"DIA_NASZ_008_Miecz_prowadzenie2_15_00"); //To tutaj. Ja dalej siê nie wybieram i tobie te¿ nie radzê. Nie wygl¹dasz na doœæ krzepkiego, by poradziæ sobie z grupk¹ o¿ywieñców.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_prowadzenie2_55_01"); //Z racji, ¿e szkielety od strony cmentarza nie bêd¹ mnie wiêcej niepokoiæ, wracam do siebie.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_prowadzenie2_55_02"); //Bywaj.

	B_LogEntry (TOPIC_Keroloth_duchy, "Wygl¹da na to, ¿e to w³aœnie na bagnie znajduje siê wylêgarnia o¿ywieñców. Czas za¿egnaæ ten problem!");

	Npc_ExchangeRoutine (self, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_008_Miecz,0);
	AI_StopProcessInfos (self);

};

//*********************************************************************
//	Info Waz
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_waz   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 15;
 	condition   = DIA_NASZ_008_Miecz_waz_Condition;
 	information = DIA_NASZ_008_Miecz_waz_Info;
 	permanent   = FALSE;
 	description = "Znasz legendê o skórze wê¿a?";
};

FUNC INT DIA_NASZ_008_Miecz_waz_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_217_Louis_waz))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_waz_Info()
{
	AI_Output (other, self,"DIA_NASZ_008_Miecz_waz_15_00"); //Znasz legendê o skórze wê¿a?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_01"); //Oczywiœcie, zna j¹ ka¿dy pirat! Czemu pytasz?
	AI_Output (other, self,"DIA_NASZ_008_Miecz_waz_55_02"); //Pewien marynarz powiedzia³ mi o sile, któr¹ mo¿na uzyskaæ dziêki tej skórze. Chcia³bym spróbowaæ.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_03"); //No dobrze... Pos³uchaj mnie wiêc:
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_04"); //Skóra wê¿a posiada specjaln¹ wydzielinê. Niestety z jednej skóry mo¿na pozyskaæ jej bardzo niewiele.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_05"); //Potrzebujê przynajmniej 10 takich skór. Utworzê z nich wtedy wywar, który wypijesz. Ale miej œwiadomoœæ, ¿e smak jest nie do zniesienia!
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_06"); //Bêdziesz wiêc potrzebowa³ czegoœ na popitê.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_07"); //Najlepszy bêdzie gin. Za³atw sobie ze trzy...
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_08"); //Poza skórami potrzebujê te¿ pust¹ butelkê i wodê.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_09"); //To chyba wszystko. Przynieœ mi sk³adniki, a wtedy sporz¹dzê napój.
	
	/*
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_ENTRANCE_03");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_ENTRANCE_02");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_01");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_02");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_3_02");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_17_01");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_7_02");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_3_01");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMP_8_03");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMPSHARK_1");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMPSHARK_2");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMPSHARK_3");
	Wld_InsertNpc		(Swampshark,"FP_ROAM_SWAMPSHARK_4");
	*/
	
	B_LogEntry (TOPIC_Louis_weze, "Miecz twierdzi, ¿e to nie jest bajka dla dzieci i potrafi³by nawet przyrz¹dziæ dla mnie w³aœciwy wywar. Mam mu przynieœæ dziesiêæ skór b³otnych wê¿y, wodê i pust¹ butelkê, a na popitê przyniosê 3 giny.");

};

var int MieczWywarDay;
//*********************************************************************
//	Info Mam
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_mam   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 16;
 	condition   = DIA_NASZ_008_Miecz_mam_Condition;
 	information = DIA_NASZ_008_Miecz_mam_Info;
 	permanent   = FALSE;
 	description = "Mam wszystko, o co prosi³eœ.";
};

FUNC INT DIA_NASZ_008_Miecz_mam_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_waz))
	&& (npc_hasitems (other, ItNa_Butelka) >=1)
	&& (npc_hasitems (other, ItFo_Water) >=1)
	&& (npc_hasitems (other, ItAt_SharkSkin) >=10)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_mam_Info()
{
	AI_Output (other, self,"DIA_NASZ_008_Miecz_mam_15_00"); //Mam wszystko, o co prosi³eœ.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_mam_55_01"); //Dobra. PrzyjdŸ jutro. I nie zapomnij o ginach!

	MieczWywarDay = Wld_GetDay ();
	B_LogEntry (TOPIC_Louis_weze, "Mam zg³osiæ siê jutro po wywar.");

};

var int Miecz_Giny_Pogadane;
//*********************************************************************
//	Info Wywar
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_wywar   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 17;
 	condition   = DIA_NASZ_008_Miecz_wywar_Condition;
 	information = DIA_NASZ_008_Miecz_wywar_Info;
 	permanent   = TRUE;
 	description = "Gotowe?";
};

FUNC INT DIA_NASZ_008_Miecz_wywar_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_mam)) && (Miecz_Giny_Pogadane == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_wywar_Info()
{
	AI_Output (other, self,"DIA_NASZ_008_Miecz_wywar_15_00"); //Gotowe?
	if (MieczWywarDay < Wld_GetDay()) {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_01"); //A masz przepitê?
		if (npc_hasitems (other, ItFo_Booze) >=3) {
		AI_Output (other, self,"DIA_NASZ_008_Miecz_wywar_55_02"); //Tak.
		AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_03"); //Pij wiêc.
		
		Miecz_Giny_Pogadane = TRUE;

		Createinvitems (self, ItNa_Miecz_Wywar, 1);
		B_giveinvitems (self, other, ItNa_Miecz_Wywar, 1);
	
		AI_StopProcessInfos (self);
		B_UseItem (other, ItNa_Miecz_Wywar);
		B_UseItem (other, ItFo_Booze);
		B_UseItem (other, ItFo_Booze);
		B_UseItem (other, ItFo_Booze);

		
		};
		if (npc_hasitems (other, ItFo_Booze) <3) {
			AI_Output (other, self,"DIA_NASZ_008_Miecz_wywar_55_04"); //Nie.
			AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_05"); //W takim razie nie mogê daæ ci napoju.
			AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_06"); //Nie widzia³eœ ludzi, którzy skrêcali siê i p³akali przez brak odpowiedniej przepity.
		};
	}
	else {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_07"); //Do króæset! Przecie¿ mówi³em, ¿ebyœ poczeka³ chocia¿ jeden dzieñ!
		AI_StopProcessInfos (self);
	};
};

//*********************************************************************
//	Info Dziala
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_dziala   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 18;
 	condition   = DIA_NASZ_008_Miecz_dziala_Condition;
 	information = DIA_NASZ_008_Miecz_dziala_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_008_Miecz_dziala_Condition()
{
	if (Miecz_Giny_Pogadane == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_dziala_Info()
{
	AI_Output (self, other,"DIA_NASZ_008_Miecz_dziala_15_00"); //¯yjesz?
	AI_Output (other, self,"DIA_NASZ_008_Miecz_dziala_55_01"); //Tak. I czujê siê œwietnie!
	AI_Output (self, other,"DIA_NASZ_008_Miecz_dziala_55_02"); //Piraci pij¹ to ju¿ jako niemowlêta. Niektórym pomaga, niektórym nie.
	AI_Output (other, self,"DIA_NASZ_008_Miecz_dziala_55_03"); //Gin te¿?!
	AI_Output (self, other,"DIA_NASZ_008_Miecz_dziala_55_04"); //Pewnie. A myœlisz, ¿e sk¹d bierze siê u nas takie zami³owanie do grogu i rumu, a wstrêt do ginu?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_dziala_55_05"); //Hahaha!

	B_LogEntry (TOPIC_Louis_weze, "Wywar zadzia³a³ i moja si³a wzros³a.");
	Log_SetTopicStatus (TOPIC_Louis_weze, LOG_SUCCESS);
	B_GivePlayerXP (500);
	DodajReputacje (2, REP_MYSLIWI);
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_008_Miecz_HowAreYou   (C_INFO)
{
	npc         = NASZ_008_Miecz;
 	nr          = 500;
 	condition   = DIA_NASZ_008_Miecz_HowAreYou_Condition;
 	information = DIA_NASZ_008_Miecz_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak tam?";
};

FUNC INT DIA_NASZ_008_Miecz_HowAreYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_zadanie))	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_008_Miecz_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_008_Miecz_HowAreYou_15_00"); //Jak tam?

	if !(npc_knowsinfo (other, DIA_NASZ_008_Miecz_duchy))	
	{
	
	
		if !(npc_knowsinfo (other, DIA_NASZ_008_Miecz_koniec))	
		{
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_01"); //Nie mogê spaæ, czuj¹c na sobie czyjeœ spojrzenie.
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_02"); //Niech go Beliar zatopi!
		}
		else
		{
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_03"); //Dziêki tobie mogê ju¿ spaæ spokojnie.		
		};
	}
	else
	{
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_04"); //Z dnia na dzieñ Górnicza Dolina jest coraz mniej bezpiecznym miejscem.
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_05"); //Jak widaæ orkowie to za ma³o i musieli pojawiæ siê ci cholerni o¿ywieñcy.			
	};

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_008_Miecz_PICKPOCKET (C_INFO)
{
	npc			= NASZ_008_Miecz;
	nr			= 900;
	condition	= DIA_NASZ_008_Miecz_PICKPOCKET_Condition;
	information	= DIA_NASZ_008_Miecz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_008_Miecz_PICKPOCKET_Condition()
{
	C_Beklauen (78);
};
 
FUNC VOID DIA_NASZ_008_Miecz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_008_Miecz_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_008_Miecz_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_008_Miecz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_008_Miecz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_008_Miecz_PICKPOCKET_DoIt);
};

func void DIA_NASZ_008_Miecz_PICKPOCKET_DoIt()
{
	B_BeklauenThings (ItPo_Health_03, 3);
	Info_ClearChoices (DIA_NASZ_008_Miecz_PICKPOCKET);
};
	
func void DIA_NASZ_008_Miecz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_008_Miecz_PICKPOCKET);
};

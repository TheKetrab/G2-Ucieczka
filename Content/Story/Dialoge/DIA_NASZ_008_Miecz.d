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
	AI_Output (self, other,"DIA_NASZ_008_Miecz_siema_55_00"); //Kim jeste�? Czego ode mnie chcesz?
	AI_ReadyMeleeWeapon		(self);
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_siema_15_01"); //Chcia�em tylko sprawdzi�, co to za wie�a.
	AI_RemoveWeapon 		(self);
	
	if (Wld_IsTime(20,50,08,10)) {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_siema_55_02"); //Dobrze, �e si� zbudzi�em. Mo�e to ty jeste� �r�d�em mojego problemu? Zagl�da�e� tu ju� kiedy�?
		AI_Output (other,self ,"DIA_NASZ_008_Miecz_siema_15_03"); //Jestem tu po raz pierwszy. O jakim problemie m�wisz?
	}
	else {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_siema_55_04"); //Nie jeste� jedynym nieproszonym go�ciem na moim terytorium.
		AI_Output (other,self ,"DIA_NASZ_008_Miecz_siema_15_05"); //Co chcesz przez to powiedzie�?
	};
	
	AI_Output (self, other,"DIA_NASZ_008_Miecz_siema_55_06"); //Nie miewam w zwyczaju dzieli� si� swoimi problemami z nieznajomymi. Postaw jaki� dobry alkohol, to mo�e si� zakumplujemy.
		
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
 	description = "�yknij sobie.";
};

FUNC INT DIA_NASZ_008_Miecz_grog_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_008_Miecz_siema))
	{
		return TRUE;
	};
};

func void MieczSay_Thx() {
	AI_Output (self, other,"MieczSay_Thx_55_00"); //Dzi�ki ci.
};

func void MieczSay_Give() {
	AI_Output (self, other,"MieczSay_Give_55_00"); //Dawaj!
};

func void HeroMieczAlcohol() {

	AI_Output (self, other,"HeroMieczAlcohol_15_01"); //Taa?

	if (npc_hasitems (other, ItFo_Addon_Rum) >=1) {
		AI_Output (other,self ,"HeroMieczAlcohol_15_02"); //Masz tu rum. Pij �mia�o.
		MieczSay_Give();
		B_GiveInvItems (other, self, ItFo_Addon_Rum, 1);
		B_UseItem (self, ItFo_Addon_Rum);
		MieczSay_Thx();
		B_GivePlayerXP (50);
	}
	else if (npc_hasitems (other, ItFo_Addon_Grog) >=1) {
		AI_Output (other,self ,"HeroMieczAlcohol_15_03"); //Masz tu grog. Pij �mia�o.
		MieczSay_Give();
		B_GiveInvItems (other, self, ItFo_Addon_Rum, 1);
		B_UseItem (self, ItFo_Addon_Rum);
		MieczSay_Thx();
		B_GivePlayerXP (50);
	}
	else {
		AI_Output (other,self ,"HeroMieczAlcohol_15_04"); //Masz tu piwo. Pij �mia�o.
		AI_Output (self, other,"HeroMieczAlcohol_55_05"); //A, niech b�dzie! W sumie dawno nie pi�em...
		B_GiveInvItems (other, self, ItFo_Beer, 1);
		B_UseItem (self, ItFo_Beer);
		MieczSay_Thx();
	};
		
	AI_Output (other,self ,"HeroMieczAlcohol_15_06"); //No to co, teraz powiesz mi, co ci� trapi?
	AI_Output (self, other,"HeroMieczAlcohol_55_07"); //Ka�dej nocy wydaje mi si�, �e kto� kr�ci si� w pobli�u mojej kryj�wki i usi�uje mnie zabi�. 
	AI_Output (self, other,"HeroMieczAlcohol_55_08"); //Lecz gdy si� budz�, nikogo w pobli�u nie ma.

};

FUNC VOID DIA_NASZ_008_Miecz_grog_Info()
{
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_grog_15_00"); //�yknij sobie.
	
	if (npc_hasitems (other, ItFo_Addon_Rum) >=1) || (npc_hasitems (other, ItFo_Addon_Grog) >=1) || (npc_hasitems (other, ItFo_Beer) >=1) {
		
		HeroMieczAlcohol();
		MieczGrogRumOK = TRUE;
	}

	else if (npc_hasitems (other, ItFo_Booze) >=1) {
		AI_Output (self,other ,"DIA_NASZ_008_Miecz_grog_15_09"); //Taa?
		AI_Output (other,self ,"DIA_NASZ_008_Miecz_grog_15_10"); //Masz tu gin. Pij �mia�o.
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_55_11"); //Gin? Cz�owieku, chcesz �ebym si� porzyga�?! Piraci nie pij� takich rzeczy!
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_55_12"); //Przynie� mi co� normalnego. Jaki� grog albo rum...
	}

	else {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_15_13"); //Niby co mam sobie �ykn��, h�?
		AI_Output (other, self,"DIA_NASZ_008_Miecz_grog_15_14"); //Nie wiem. My�la�em, �e sam masz co� na zbyciu.
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_15_15"); //Gdzie� tam. Tu nie ma nic, absolutnie NIC do picia...
		AI_Output (self, other,"DIA_NASZ_008_Miecz_grog_15_16"); //Przynie� mi grog albo rum. Wtedy pogadamy.
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
 	description = "Przynios�em alkohol.";
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
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_GrogRum_15_00"); //Przynios�em alkohol.

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
 	description = "Co to za wie�a?";
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
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_WhatIsThisTower_15_00"); //Co to za wie�a?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_WhatIsThisTower_55_01"); //Po jej wyposa�eniu domy�lam si�, �e pe�ni�a niegdy� rol� pracowni jakiego� maga.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_WhatIsThisTower_55_02"); //Jest bardzo stara i zniszczona. Nie by�em w stanie dosta� si� na wy�sze pi�tra, wi�c nie wiem, co tam jest.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_WhatIsThisTower_55_03"); //I lepiej nie pr�buj samemu. A ju� na pewno nie licz na to, �e je�li si� po�amiesz, to nastawi� ci stawy. Nie znam si� na tym!

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
 	description = "Mog� ci jako� pom�c?";
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
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_zadanie_15_00"); //Mog� ci jako� pom�c?
	

	if (!npc_knowsinfo (other, DIA_NASZ_111_Gerold_sure)) {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_01"); //Ton�cy brzytwy si� chwyta. Przyjm� ka�d� pomoc, byle tylko uwolni� swoj� g�ow� od tych uroje� i m�c si� porz�dnie wyspa�.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_02"); //Ka�dej nocy wydaje mi si�, �e kto� kr�ci si� w pobli�u mojej kryj�wki i usi�uje mnie zabi�. 
		AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_03"); //Lecz gdy si� budz� nikogo w pobli�u nie ma.
	};

	AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_04"); //Nie jestem przekonany, czy to mi si� �ni, czy kto� naprawd� usi�uje mnie zabi�.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_zadanie_55_05"); //�pi� zawsze od dziewi�tej do �smej. Rozgl�dnij si� w nocy wok�, mo�e co� zobaczysz.
	//ork jest TYLKO w nocy.

	OrcMieczRunning = TRUE;
	Log_CreateTopic (TOPIC_Miecz_ork, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Miecz_ork, LOG_RUNNING);
	B_LogEntry (TOPIC_Miecz_ork, "Pirat ma problemy ze snem. Twierdzi, �e kto� podkrada si� w nocy do jego obozu. Poprosi� mnie, abym stan�� na czatach i rozejrza� si� w pobli�u, gdy on b�dzie spa�. �pi od dziewi�tej do �smej. Chyba nie wy�pi� si� tej nocy... ");

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
 	description = "Rozwi�za�em tw�j problem.";
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
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_koniec_15_00"); //Rozwi�za�em tw�j problem.
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_koniec_15_01"); //Rozgl�da�em si� przez jaki� czas, a� zobaczy�em orka. Prawdopodobnie szele�ci� tak, bo pociera� toporem o top�r. Zapewne ostrzy� swoj� bro�.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_koniec_55_02"); //Nie wpad�em na to, �e to d�wi�k pocieranej zardzewia�ej stali. Jednak gdy mi o tym powiedzia�e�, to faktycznie, to by� dok�adnie ten d�wi�k.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_koniec_55_03"); //Mam nadziej�, �e wys�a�e� tego orka do piachu?
	AI_Output (other,self ,"DIA_NASZ_008_Miecz_koniec_15_04"); //Tak. I jego ostry top�r w niczym mu nie pom�g�.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_koniec_55_05"); //Dobrze si� spisa�e�. Oto twoja nagroda.

	Createinvitems (self, itmi_gold, 140);
	B_giveinvitems (self, other, itmi_gold, 140);
	B_LogEntry (TOPIC_Miecz_ork, "Kto by pomy�la�? Ork ostrz�cy top�r... Tylko nadal nie rozumiem, dlaczego robi� to przez kilka nocy. Ale odpowied� na to pytanie odesz�a razem z tym orkiem.");
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
	AI_Output (self, other,"DIA_NASZ_008_Miecz_duchy_15_00"); //Kolejny o�ywieniec, a mo�e jeszcze inne monstrum w ludzkiej sk�rze?
	AI_Output (other, self,"DIA_NASZ_008_Miecz_duchy_55_01"); //Raczej zab�jca szkielet�w.

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
	AI_Output (self, other,"DIA_NASZ_008_Miecz_duchy2_55_01"); //Musia�em mie� oko na te trupy.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_duchy2_55_02"); //Ca�kiem niedawno widzia�em, jak t�dy przechodzi�y, a ich droga wiod�a ca�kiem blisko mojej kryj�wki.
	AI_Output (other, self,"DIA_NASZ_008_Miecz_duchy2_15_03"); //Widzia�e� mo�e, sk�d si� bior�?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_duchy2_55_04"); //Tak, widzia�em sk�d wychodzi�y. Je�li chcesz, mog� ci pokaza� to miejsce.

	B_LogEntry (TOPIC_Keroloth_duchy, "Pirat widzia�, sk�d bra�y si� szkielety i mo�e mnie tam zaprowadzi�.");
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
 	description = "Chod�my wi�c.";
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
	AI_Output (other, self,"DIA_NASZ_008_Miecz_prowadzenie_15_00"); //Chod�my wi�c.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_prowadzenie_55_01"); //Za mn�.

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
	AI_Output (self, other,"DIA_NASZ_008_Miecz_prowadzenie2_15_00"); //To tutaj. Ja dalej si� nie wybieram i tobie te� nie radz�. Nie wygl�dasz na do�� krzepkiego, by poradzi� sobie z grupk� o�ywie�c�w.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_prowadzenie2_55_01"); //Z racji, �e szkielety od strony cmentarza nie b�d� mnie wi�cej niepokoi�, wracam do siebie.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_prowadzenie2_55_02"); //Bywaj.

	B_LogEntry (TOPIC_Keroloth_duchy, "Wygl�da na to, �e to w�a�nie na bagnie znajduje si� wyl�garnia o�ywie�c�w. Czas za�egna� ten problem!");

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
 	description = "Znasz legend� o sk�rze w�a?";
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
	AI_Output (other, self,"DIA_NASZ_008_Miecz_waz_15_00"); //Znasz legend� o sk�rze w�a?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_01"); //Oczywi�cie, zna j� ka�dy pirat! Czemu pytasz?
	AI_Output (other, self,"DIA_NASZ_008_Miecz_waz_55_02"); //Pewien marynarz powiedzia� mi o sile, kt�r� mo�na uzyska� dzi�ki tej sk�rze. Chcia�bym spr�bowa�.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_03"); //No dobrze... Pos�uchaj mnie wi�c:
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_04"); //Sk�ra w�a posiada specjaln� wydzielin�. Niestety z jednej sk�ry mo�na pozyska� jej bardzo niewiele.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_05"); //Potrzebuj� przynajmniej 10 takich sk�r. Utworz� z nich wtedy wywar, kt�ry wypijesz. Ale miej �wiadomo��, �e smak jest nie do zniesienia!
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_06"); //B�dziesz wi�c potrzebowa� czego� na popit�.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_07"); //Najlepszy b�dzie gin. Za�atw sobie ze trzy...
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_08"); //Poza sk�rami potrzebuj� te� pust� butelk� i wod�.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_waz_55_09"); //To chyba wszystko. Przynie� mi sk�adniki, a wtedy sporz�dz� nap�j.
	
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
	
	B_LogEntry (TOPIC_Louis_weze, "Miecz twierdzi, �e to nie jest bajka dla dzieci i potrafi�by nawet przyrz�dzi� dla mnie w�a�ciwy wywar. Mam mu przynie�� dziesi�� sk�r b�otnych w�y, wod� i pust� butelk�, a na popit� przynios� 3 giny.");

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
 	description = "Mam wszystko, o co prosi�e�.";
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
	AI_Output (other, self,"DIA_NASZ_008_Miecz_mam_15_00"); //Mam wszystko, o co prosi�e�.
	AI_Output (self, other,"DIA_NASZ_008_Miecz_mam_55_01"); //Dobra. Przyjd� jutro. I nie zapomnij o ginach!

	MieczWywarDay = Wld_GetDay ();
	B_LogEntry (TOPIC_Louis_weze, "Mam zg�osi� si� jutro po wywar.");

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
		AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_01"); //A masz przepit�?
		if (npc_hasitems (other, ItFo_Booze) >=3) {
		AI_Output (other, self,"DIA_NASZ_008_Miecz_wywar_55_02"); //Tak.
		AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_03"); //Pij wi�c.
		
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
			AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_05"); //W takim razie nie mog� da� ci napoju.
			AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_06"); //Nie widzia�e� ludzi, kt�rzy skr�cali si� i p�akali przez brak odpowiedniej przepity.
		};
	}
	else {
		AI_Output (self, other,"DIA_NASZ_008_Miecz_wywar_55_07"); //Do kr��set! Przecie� m�wi�em, �eby� poczeka� chocia� jeden dzie�!
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
	AI_Output (self, other,"DIA_NASZ_008_Miecz_dziala_15_00"); //�yjesz?
	AI_Output (other, self,"DIA_NASZ_008_Miecz_dziala_55_01"); //Tak. I czuj� si� �wietnie!
	AI_Output (self, other,"DIA_NASZ_008_Miecz_dziala_55_02"); //Piraci pij� to ju� jako niemowl�ta. Niekt�rym pomaga, niekt�rym nie.
	AI_Output (other, self,"DIA_NASZ_008_Miecz_dziala_55_03"); //Gin te�?!
	AI_Output (self, other,"DIA_NASZ_008_Miecz_dziala_55_04"); //Pewnie. A my�lisz, �e sk�d bierze si� u nas takie zami�owanie do grogu i rumu, a wstr�t do ginu?
	AI_Output (self, other,"DIA_NASZ_008_Miecz_dziala_55_05"); //Hahaha!

	B_LogEntry (TOPIC_Louis_weze, "Wywar zadzia�a� i moja si�a wzros�a.");
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
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_01"); //Nie mog� spa�, czuj�c na sobie czyje� spojrzenie.
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_02"); //Niech go Beliar zatopi!
		}
		else
		{
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_03"); //Dzi�ki tobie mog� ju� spa� spokojnie.		
		};
	}
	else
	{
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_04"); //Z dnia na dzie� G�rnicza Dolina jest coraz mniej bezpiecznym miejscem.
			AI_Output (self, other,"DIA_NASZ_008_Miecz_HowAreYou_55_05"); //Jak wida� orkowie to za ma�o i musieli pojawi� si� ci cholerni o�ywie�cy.			
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

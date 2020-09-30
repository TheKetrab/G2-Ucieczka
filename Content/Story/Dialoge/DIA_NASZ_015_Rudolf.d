
func int WhatArmorRudolf() {

	var c_item armor; armor = Npc_GetEquippedArmor (hero);

	if (Hlp_IsItem (armor, ItNa_DJG_L)
	 || Hlp_IsItem (armor, ItNa_DJG_M)
	 || Hlp_IsItem (armor, ItNa_DJG_H)
	 || Hlp_IsItem (armor, ItNa_DJG_S)
	 || Hlp_IsItem (armor, ItNa_DJG_ULTRA))
	{
		return 1;
	};
	
	if (Hlp_IsItem (armor, ItNa_OUT_L)
	 || Hlp_IsItem (armor, ItNa_OUT_M)
	 || Hlp_IsItem (armor, ItNa_OUT_H)
	 || Hlp_IsItem (armor, ItNa_OUT_S)
	 || Hlp_IsItem (armor, ItNa_OUT_ULTRA))
	{
		return 2;
	};

	if (Hlp_IsItem (armor, ItNa_BAN_L)
	 || Hlp_IsItem (armor, ItNa_BAN_M)
	 || Hlp_IsItem (armor, ItNa_BAN_H))
	{
		return 3;
	};

	if (Hlp_IsItem (armor, ITNA_ARMOR_ANCIENT))
	{
		return 4;
	};
	
	return 0;
};



//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_EXIT   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
	nr          = 999;
	condition   = DIA_NASZ_015_Rudolf_EXIT_Condition;
	information = DIA_NASZ_015_Rudolf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_015_Rudolf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_015_Rudolf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

func void RudolfSay_ZzaPalisady() {
	AI_Output (self, other,"RudolfSay_ZzaPalisady_15_00"); //Przybywasz zza palisady?
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_siema   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 1;
 	condition   = DIA_NASZ_015_Rudolf_siema_Condition;
 	information = DIA_NASZ_015_Rudolf_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_015_Rudolf_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_015_Rudolf_siema_Info()
{

	// FIX UCIECZKA 1.1 - tarcza znikala podczas trialogu
	// dlatego usuwam ja rudolfowi i tworze visuala voba (ktory w rzeczywistosci nie jest tarcza)
	var int shieldPtr; shieldPtr = GetItemSlot (self, "ZS_SHIELD");
	if(shieldPtr) { 
		var c_item shield; shield = MEM_PtrToInst(shieldPtr);
		oCNpc_UnequipItem(NASZ_015_Rudolf, shieldPtr);
		Npc_RemoveInvItems(NASZ_015_Rudolf,ItNa_Shield_Paladin,1);
		
		var int vobPtr; vobPtr = MEM_InsertVob(shield.visual, MEM_GetAnyWP());
		oCNpc_PutInSlot(NASZ_015_Rudolf, "ZS_SHIELD", vobPtr, 7);
	};
	
	
	AI_GoToWP(NASZ_016_Netbek,"NASZ_ZAPALISADA_LAS_18");

	var C_NPC Rudolf; Rudolf = Hlp_GetNpc (NASZ_015_Rudolf);
	var C_NPC Netbek; Netbek = Hlp_GetNpc (NASZ_016_Netbek);
	
	TRIA_Invite(Rudolf);
    TRIA_Invite(Netbek);
    TRIA_Start();
 
	TRIA_Next(Rudolf);

	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_00"); //Cz�owiek? Kim jeste�?!
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_55_01"); //Wyj��e� mi to z ust...
	//AI_ReadyMeleeWeapon	(self);
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_02"); //Netbek, chod� tutaj szybko.
	AI_GotoNpc(NASZ_016_Netbek, hero);
	
	TRIA_Next (Netbek);
	
    AI_TurnToNpc(other, self);
	
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_03"); //Oooo! Jaki ma�y ork.

	TRIA_Next (Rudolf);
    AI_TurnToNpc(other, self);
	
	
	var int armorType; armorType = WhatArmorRudolf();

	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_04"); //To nie �aden ork, idioto. To cz�owiek...
	
	if (armorType > 0) {
		AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_05"); //C� to za pancerz?
	
		if (armorType == 1) {
			AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_06"); //Pancerz �owcy ork�w.
			AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_07"); //�owcy ork�w, powiadasz?
			RudolfSay_ZzaPalisady();
		}

		else if (armorType == 2) {
			AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_08"); //Pancerz my�liwego.
			AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_09"); //My�liwego?
			RudolfSay_ZzaPalisady();
		}

		else if (armorType == 3) {
			AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_10"); //To pancerz bandyty, ale spokojnie. Nie nale�� do nich.
			RudolfSay_ZzaPalisady();
		}

		else if (armorType == 3) {
			AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_11"); //Znalaz�em ten pancerz w pewnej krypcie.
			RudolfSay_ZzaPalisady();
		};
	} else {
		RudolfSay_ZzaPalisady();
	};


	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_12"); //Tak. Jestem tu z polecenia Kerolotha.
	AI_RemoveWeapon (self);
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_13"); //Kerolotha?! S�u�y�em z nim na zamku. Szczerze m�wi�c, my�la�em, �e kto� dawno ju� podci�� mu gard�o.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_14"); //Zamek zosta� przej�ty przez ork�w. Kapitan Garond poleg�. Przygotowywali�my si� do odbicia zamku i uda�o si� nam.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_15"); //Jednak�e orkowie zza palisady otrzymali sygna� dymny, wi�c pewnie niebawem rusz� z odsiecz�.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_16"); //To by wyja�nia�o ich rozw�cieczenie. 	

	TRIA_Next (Netbek);
    AI_TurnToNpc(other, self);
	
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_17"); //Przez te porykiwania nie mog� nawi�za� kontaktu z moim mistrzem.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_18"); //Kto jest twoim mistrzem?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_19"); //�ni�cy! On daje mi m�dro�� i uspokaja. Jestem ostatnim Guru!
	
	TRIA_Next (Rudolf);
    AI_TurnToNpc(other, self);
	
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_20"); //Daj ju� sobie spok�j, Netbek. To ziele kompletnie wy�ar�o ci m�zg.

	Npc_ExchangeRoutine (NASZ_015_Rudolf, "Start");
	Npc_ExchangeRoutine (NASZ_016_Netbek, "Start");
	
	TRIA_Finish();
	
	Log_CreateTopic (TOPIC_Udar_oddzial, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_oddzial, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_oddzial, "Znalaz�em ludzi za palisad�. Rycerz Rudolf i cz�onek bractwa Netbek. Powinienem powiedzie� o tym Kerolothowi a nast�pnie Udarowi.");
	


};

//*********************************************************************
//	         Who 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_who   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 2;
 	condition   = DIA_NASZ_015_Rudolf_who_Condition;
 	information = DIA_NASZ_015_Rudolf_who_Info;
 	permanent   = FALSE;
 	description = "Kim jeste�?";
};

FUNC INT DIA_NASZ_015_Rudolf_who_Condition()	
{
	return TRUE;
};

FUNC VOID DIA_NASZ_015_Rudolf_who_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_who_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_who_55_01"); //Nazywam si� Rudolf. Przyby�em do zamku z ekspedycj� pod przewodnictwem kapitana Garonda. Ten idiota wys�a� mnie za palisad�, gdy jeszcze by�a w budowie.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_who_55_02"); //Jak wida�, utkn��em tu na dobre.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_who_55_03"); //A ty? Jak przedosta�e� si� za palisad�?
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_who_15_04"); //Orkowie otwarli bram�. Zamierzasz st�d uciec?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_who_55_05"); //Nie ma mowy! Najpierw musz� odzyska� pami�tnik mojego przyjaciela.

};

//*********************************************************************
//	         Zadanie 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_zadanie   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 3;
 	condition   = DIA_NASZ_015_Rudolf_zadanie_Condition;
 	information = DIA_NASZ_015_Rudolf_zadanie_Info;
 	permanent   = FALSE;
 	description = "Jaki pami�tnik?";
};

FUNC INT DIA_NASZ_015_Rudolf_zadanie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_015_Rudolf_who))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_015_Rudolf_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_zadanie_15_00"); //Jaki pami�tnik?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_zadanie_55_01"); //C�, nie przyby�em tutaj sam. By�o ze mn� jeszcze dw�ch rycerzy, braci. Za�o�yli�my tutaj to niewielkie obozowisko.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_zadanie_55_02"); //Nied�ugo potem Gerard poszed� obserwowa� ork�w. By�a deszczowa noc. Nie wr�ci�.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_zadanie_55_03"); //Jego brat wyruszy� na poszukiwania, ale r�wnie� nie powr�ci�. Potrzebny mi jest jego pami�tnik. Chc� wiedzie�, jakie uczucia �ywi� do mojej �ony.
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_zadanie_15_04"); //To bestialstwo!
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_zadanie_55_05"); //Je�li ��czy�o go co� z moj� �on�, to kto tak naprawd� jest besti�?

};

//*********************************************************************
//	         Poszukam 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_poszukam   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 4;
 	condition   = DIA_NASZ_015_Rudolf_poszukam_Condition;
 	information = DIA_NASZ_015_Rudolf_poszukam_Info;
 	permanent   = FALSE;
 	description = "Je�li natkn� si� na pami�tnik, to ci go przynios�.";
};

FUNC INT DIA_NASZ_015_Rudolf_poszukam_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_015_Rudolf_zadanie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_015_Rudolf_poszukam_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_poszukam_15_00"); //Je�li natkn� si� na pami�tnik, to ci go przynios�.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_poszukam_55_01"); //�wietnie!
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_poszukam_55_02"); //Je�li chodzi o mnie, to przeszuka�em dok�adnie ca�y ten las i bagna. Nic tutaj nie znalaz�em. No, poza 'guru' Netbekiem.

	Log_CreateTopic (TOPIC_Rudolf_przyjaciel, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rudolf_przyjaciel, LOG_RUNNING);
	B_LogEntry (TOPIC_Rudolf_przyjaciel, "Paladyn Rudolf chcia�by znale�� pami�tnik swojego zaginionego przyjaciela w celu ustalenia, jakie relacje ��czy�y zmar�ego z jego �on�. Rudolf przeszuka� ju� las iglasty i bagna.");

};

//*********************************************************************
//	         Tarcza 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_tarcza   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 5;
 	condition   = DIA_NASZ_015_Rudolf_tarcza_Condition;
 	information = DIA_NASZ_015_Rudolf_tarcza_Info;
 	permanent   = FALSE;
 	description = "Nosisz tarcz� paladyna.";
};

FUNC INT DIA_NASZ_015_Rudolf_tarcza_Condition()	
{
	return TRUE;
};

FUNC VOID DIA_NASZ_015_Rudolf_tarcza_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_tarcza_15_00"); //Nosisz tarcz� paladyna.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_tarcza_55_01"); //Bo jestem paladynem! Wielu z nas pos�uguje si� tarczami. Chocia� r�wnie popularn� broni� jest miecz dwur�czny.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_tarcza_55_02"); //Za palisad�, poza mn�, tarcz� posiada� jeszcze jeden m�j kompan. Tarcza robi wra�enie, co?
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_tarcza_15_03"); //Pewnie.

};

//*********************************************************************
//	         Las 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_las   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 6;
 	condition   = DIA_NASZ_015_Rudolf_las_Condition;
 	information = DIA_NASZ_015_Rudolf_las_Info;
 	permanent   = FALSE;
 	description = "Ten las jest jaki� dziwny.";
};

FUNC INT DIA_NASZ_015_Rudolf_las_Condition()	
{
	return TRUE;
};

FUNC VOID DIA_NASZ_015_Rudolf_las_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_las_15_00"); //Ten las jest jaki� dziwny.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_las_55_01"); //Nic dziwnego, bo jest magiczny.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_las_55_02"); //Jak to?
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_03"); //A my�lisz, �e z czego orkowie zbudowali palisad�?
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_04"); //Takiej ilo�ci drewna nie da si� przewie�� nawet dwudziestoma statkami. Dow�dcy przys�ali swoich r�baczy, kt�rzy wyci�li ca�y las.
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_05"); //Gdy drewna zacz�o brakowa�, orkowi szamani zebrali si� i... BACH! - nagle wyr�s� g�sty i przera�liwy las. Wydaje mi si�, �e tak pot�ne zakl�cie mo�e narusza� struktur� magii.
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_06"); //W ka�dym razie w lesie gdzieniegdzie mo�na spotka� o�ywie�c�w.
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_07"); //Co do ork�w: Maj� w lesie tartak albo, jak kto woli, sk�adowisko drewna. Nie zosta�o ich tam ju� du�o, wi�c mo�na kiedy� spu�ci� im baty.

};

//*********************************************************************
//	         Oboz 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_oboz   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 7;
 	condition   = DIA_NASZ_015_Rudolf_oboz_Condition;
 	information = DIA_NASZ_015_Rudolf_oboz_Info;
 	permanent   = FALSE;
 	description = "Czy orkowie nigdy nie natkn�li si� na wasz ob�z?";
};

FUNC INT DIA_NASZ_015_Rudolf_oboz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_015_Rudolf_las))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_015_Rudolf_oboz_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_oboz_15_00"); //Czy orkowie nigdy nie natkn�li si� na wasz ob�z?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_oboz_55_01"); //Orkowie nie zapuszczaj� si� w t� stron� lasu.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_oboz_55_02"); //A ci, kt�rzy tu zab��dzili, no c�... Ju� ich nie ma.

};

//*********************************************************************
//	         MamPamietnik 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_MamPamietnik   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 8;
 	condition   = DIA_NASZ_015_Rudolf_MamPamietnik_Condition;
 	information = DIA_NASZ_015_Rudolf_MamPamietnik_Info;
 	permanent   = FALSE;
 	description = "Chyba znalaz�em pami�tnik.";
};

FUNC INT DIA_NASZ_015_Rudolf_MamPamietnik_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_015_Rudolf_poszukam))
	&& (npc_hasitems (other, ItNa_PamietnikKannaha) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_015_Rudolf_MamPamietnik_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_MamPamietnik_15_00"); //Chyba znalaz�em pami�tnik.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_MamPamietnik_55_01"); //Daj mi go.
	B_giveinvitems (other, self, ItNa_PamietnikKannaha, 1);
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_MamPamietnik_55_02"); //Co my tu mamy...
	B_UseFakeBook();
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_MamPamietnik_55_03"); //A wi�c... Ja sam nie by�em w stanie obroni� mojej �ony, a zaj�� si� tym Kannah.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_MamPamietnik_55_04"); //Dzi�kuj� ci. To wszystko da�o mi du�o do my�lenia.
	AI_Output (self ,other,"DIA_NASZ_015_Rudolf_MamPamietnik_15_05"); //Oddam ci m�j sygnet. Nie chc� teraz, by przypomina� mi o czymkolwiek.
	
	Createinvitems (self, ItRi_Mana_02, 1);
	B_giveinvitems (self, other, ItRi_Mana_02, 1);
	
	B_GivePlayerXP (1000);
	Log_SetTopicStatus (TOPIC_Rudolf_przyjaciel, LOG_SUCCESS);
	B_LogEntry (TOPIC_Rudolf_przyjaciel, "Odda�em Rudolfowi pami�tnik.");

};


//*********************************************************************
//	         OrkowyPrzepis 
//*********************************************************************
INSTANCE DIA_NASZ_015_Rudolf_OrkowyPrzepis   (C_INFO)
{
	npc         = NASZ_015_Rudolf;
 	nr          = 8;
 	condition   = DIA_NASZ_015_Rudolf_OrkowyPrzepis_Condition;
 	information = DIA_NASZ_015_Rudolf_OrkowyPrzepis_Info;
 	permanent   = FALSE;
 	description = "Potrafisz rozszyfrowa� ten przepis?"; 
};

FUNC INT DIA_NASZ_015_Rudolf_OrkowyPrzepis_Condition()	
{
	if (PrzepisOrkowyRunning == TRUE)
	&& (npc_hasitems (other, ItNa_Przepis_Orkowy1) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_015_Rudolf_OrkowyPrzepis_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_15_00"); //Potrafisz rozszyfrowa� ten przepis?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_01"); //A c� to takiego znalaz�e�?
	B_giveinvitems (other, self, ItNa_Przepis_Orkowy1, 1);
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_02"); //No, no! To wygl�da na jak�� orkow� zup�. Nie jestem pewien, czy b�dzie to dobrze smakowa�. Wydaje mi si�, �e tw�j �o��dek wypluje wszystko, zanim zd��ysz opr�ni� chocia� po�ow� talerza.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_03"); //M�g�by� przet�umaczy� dla mnie ten przepis? Niekoniecznie s�owo w s�owo, ale �ebym chocia� mniej wi�cej wiedzia�, jakich sk�adnik�w potrzebuj�.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_04"); //Przede wszystkim surowego mi�sa... Poczekaj chwil�. Zaraz zapisz� to, co rozumiem.
	AI_Wait(self,1);
	B_UseFakeScroll();
	Createinvitems (self, ItNa_Przepis_Orkowy2, 1);
	B_giveinvitems (self, other, ItNa_Przepis_Orkowy2, 1);
	AI_Output (self ,other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_15_05"); //No, gotowe. Mog�em pomyli� si� w kilku miejscach, bo nie by�em pewien znaczenia niekt�rych s��w, ale og�lna idea powinna by� dobrze przet�umaczona.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_06"); //Dzi�ki, Rudolfie! Chyba nie przypuszcza�e�, �e tw�j pobyt za palisad� przyda si� do ugotowania orkowej zupy?
	AI_Output (self ,other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_15_07"); //Fakt. Jednak mam nadziej�, �e tego nie zjesz.

	PrzepisOrkowyZnamTresc = TRUE;
	B_LogEntry (TOPIC_Orkowy_przepis, "W ko�cu dysponuj� przet�umaczonym przepisem. Teraz trzeba jeszcze znale�� sk�adniki i poprosi� Snafa o przyrz�dzenie zupy.");

};

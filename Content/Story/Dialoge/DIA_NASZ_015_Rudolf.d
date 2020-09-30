
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

	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_00"); //Cz³owiek? Kim jesteœ?!
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_55_01"); //Wyj¹³eœ mi to z ust...
	//AI_ReadyMeleeWeapon	(self);
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_02"); //Netbek, chodŸ tutaj szybko.
	AI_GotoNpc(NASZ_016_Netbek, hero);
	
	TRIA_Next (Netbek);
	
    AI_TurnToNpc(other, self);
	
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_03"); //Oooo! Jaki ma³y ork.

	TRIA_Next (Rudolf);
    AI_TurnToNpc(other, self);
	
	
	var int armorType; armorType = WhatArmorRudolf();

	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_04"); //To nie ¿aden ork, idioto. To cz³owiek...
	
	if (armorType > 0) {
		AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_05"); //Có¿ to za pancerz?
	
		if (armorType == 1) {
			AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_06"); //Pancerz ³owcy orków.
			AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_07"); //£owcy orków, powiadasz?
			RudolfSay_ZzaPalisady();
		}

		else if (armorType == 2) {
			AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_08"); //Pancerz myœliwego.
			AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_09"); //Myœliwego?
			RudolfSay_ZzaPalisady();
		}

		else if (armorType == 3) {
			AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_10"); //To pancerz bandyty, ale spokojnie. Nie nale¿ê do nich.
			RudolfSay_ZzaPalisady();
		}

		else if (armorType == 3) {
			AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_11"); //Znalaz³em ten pancerz w pewnej krypcie.
			RudolfSay_ZzaPalisady();
		};
	} else {
		RudolfSay_ZzaPalisady();
	};


	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_12"); //Tak. Jestem tu z polecenia Kerolotha.
	AI_RemoveWeapon (self);
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_13"); //Kerolotha?! S³u¿y³em z nim na zamku. Szczerze mówi¹c, myœla³em, ¿e ktoœ dawno ju¿ podci¹³ mu gard³o.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_14"); //Zamek zosta³ przejêty przez orków. Kapitan Garond poleg³. Przygotowywaliœmy siê do odbicia zamku i uda³o siê nam.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_15"); //Jednak¿e orkowie zza palisady otrzymali sygna³ dymny, wiêc pewnie niebawem rusz¹ z odsiecz¹.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_16"); //To by wyjaœnia³o ich rozwœcieczenie. 	

	TRIA_Next (Netbek);
    AI_TurnToNpc(other, self);
	
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_17"); //Przez te porykiwania nie mogê nawi¹zaæ kontaktu z moim mistrzem.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_siema_15_18"); //Kto jest twoim mistrzem?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_19"); //Œni¹cy! On daje mi m¹droœæ i uspokaja. Jestem ostatnim Guru!
	
	TRIA_Next (Rudolf);
    AI_TurnToNpc(other, self);
	
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_siema_15_20"); //Daj ju¿ sobie spokój, Netbek. To ziele kompletnie wy¿ar³o ci mózg.

	Npc_ExchangeRoutine (NASZ_015_Rudolf, "Start");
	Npc_ExchangeRoutine (NASZ_016_Netbek, "Start");
	
	TRIA_Finish();
	
	Log_CreateTopic (TOPIC_Udar_oddzial, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Udar_oddzial, LOG_RUNNING);
	B_LogEntry (TOPIC_Udar_oddzial, "Znalaz³em ludzi za palisad¹. Rycerz Rudolf i cz³onek bractwa Netbek. Powinienem powiedzieæ o tym Kerolothowi a nastêpnie Udarowi.");
	


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
 	description = "Kim jesteœ?";
};

FUNC INT DIA_NASZ_015_Rudolf_who_Condition()	
{
	return TRUE;
};

FUNC VOID DIA_NASZ_015_Rudolf_who_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_who_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_who_55_01"); //Nazywam siê Rudolf. Przyby³em do zamku z ekspedycj¹ pod przewodnictwem kapitana Garonda. Ten idiota wys³a³ mnie za palisadê, gdy jeszcze by³a w budowie.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_who_55_02"); //Jak widaæ, utkn¹³em tu na dobre.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_who_55_03"); //A ty? Jak przedosta³eœ siê za palisadê?
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_who_15_04"); //Orkowie otwarli bramê. Zamierzasz st¹d uciec?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_who_55_05"); //Nie ma mowy! Najpierw muszê odzyskaæ pamiêtnik mojego przyjaciela.

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
 	description = "Jaki pamiêtnik?";
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
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_zadanie_15_00"); //Jaki pamiêtnik?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_zadanie_55_01"); //Có¿, nie przyby³em tutaj sam. By³o ze mn¹ jeszcze dwóch rycerzy, braci. Za³o¿yliœmy tutaj to niewielkie obozowisko.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_zadanie_55_02"); //Nied³ugo potem Gerard poszed³ obserwowaæ orków. By³a deszczowa noc. Nie wróci³.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_zadanie_55_03"); //Jego brat wyruszy³ na poszukiwania, ale równie¿ nie powróci³. Potrzebny mi jest jego pamiêtnik. Chcê wiedzieæ, jakie uczucia ¿ywi³ do mojej ¿ony.
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_zadanie_15_04"); //To bestialstwo!
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_zadanie_55_05"); //Jeœli ³¹czy³o go coœ z moj¹ ¿on¹, to kto tak naprawdê jest besti¹?

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
 	description = "Jeœli natknê siê na pamiêtnik, to ci go przyniosê.";
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
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_poszukam_15_00"); //Jeœli natknê siê na pamiêtnik, to ci go przyniosê.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_poszukam_55_01"); //Œwietnie!
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_poszukam_55_02"); //Jeœli chodzi o mnie, to przeszuka³em dok³adnie ca³y ten las i bagna. Nic tutaj nie znalaz³em. No, poza 'guru' Netbekiem.

	Log_CreateTopic (TOPIC_Rudolf_przyjaciel, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rudolf_przyjaciel, LOG_RUNNING);
	B_LogEntry (TOPIC_Rudolf_przyjaciel, "Paladyn Rudolf chcia³by znaleŸæ pamiêtnik swojego zaginionego przyjaciela w celu ustalenia, jakie relacje ³¹czy³y zmar³ego z jego ¿on¹. Rudolf przeszuka³ ju¿ las iglasty i bagna.");

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
 	description = "Nosisz tarczê paladyna.";
};

FUNC INT DIA_NASZ_015_Rudolf_tarcza_Condition()	
{
	return TRUE;
};

FUNC VOID DIA_NASZ_015_Rudolf_tarcza_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_tarcza_15_00"); //Nosisz tarczê paladyna.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_tarcza_55_01"); //Bo jestem paladynem! Wielu z nas pos³uguje siê tarczami. Chocia¿ równie popularn¹ broni¹ jest miecz dwurêczny.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_tarcza_55_02"); //Za palisad¹, poza mn¹, tarczê posiada³ jeszcze jeden mój kompan. Tarcza robi wra¿enie, co?
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
 	description = "Ten las jest jakiœ dziwny.";
};

FUNC INT DIA_NASZ_015_Rudolf_las_Condition()	
{
	return TRUE;
};

FUNC VOID DIA_NASZ_015_Rudolf_las_Info()
{
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_las_15_00"); //Ten las jest jakiœ dziwny.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_las_55_01"); //Nic dziwnego, bo jest magiczny.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_las_55_02"); //Jak to?
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_03"); //A myœlisz, ¿e z czego orkowie zbudowali palisadê?
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_04"); //Takiej iloœci drewna nie da siê przewieŸæ nawet dwudziestoma statkami. Dowódcy przys³ali swoich rêbaczy, którzy wyciêli ca³y las.
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_05"); //Gdy drewna zaczê³o brakowaæ, orkowi szamani zebrali siê i... BACH! - nagle wyrós³ gêsty i przeraŸliwy las. Wydaje mi siê, ¿e tak potê¿ne zaklêcie mo¿e naruszaæ strukturê magii.
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_06"); //W ka¿dym razie w lesie gdzieniegdzie mo¿na spotkaæ o¿ywieñców.
	AI_Output (self,other ,"DIA_NASZ_015_Rudolf_las_15_07"); //Co do orków: Maj¹ w lesie tartak albo, jak kto woli, sk³adowisko drewna. Nie zosta³o ich tam ju¿ du¿o, wiêc mo¿na kiedyœ spuœciæ im baty.

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
 	description = "Czy orkowie nigdy nie natknêli siê na wasz obóz?";
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
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_oboz_15_00"); //Czy orkowie nigdy nie natknêli siê na wasz obóz?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_oboz_55_01"); //Orkowie nie zapuszczaj¹ siê w tê stronê lasu.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_oboz_55_02"); //A ci, którzy tu zab³¹dzili, no có¿... Ju¿ ich nie ma.

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
 	description = "Chyba znalaz³em pamiêtnik.";
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
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_MamPamietnik_15_00"); //Chyba znalaz³em pamiêtnik.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_MamPamietnik_55_01"); //Daj mi go.
	B_giveinvitems (other, self, ItNa_PamietnikKannaha, 1);
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_MamPamietnik_55_02"); //Co my tu mamy...
	B_UseFakeBook();
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_MamPamietnik_55_03"); //A wiêc... Ja sam nie by³em w stanie obroniæ mojej ¿ony, a zaj¹³ siê tym Kannah.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_MamPamietnik_55_04"); //Dziêkujê ci. To wszystko da³o mi du¿o do myœlenia.
	AI_Output (self ,other,"DIA_NASZ_015_Rudolf_MamPamietnik_15_05"); //Oddam ci mój sygnet. Nie chcê teraz, by przypomina³ mi o czymkolwiek.
	
	Createinvitems (self, ItRi_Mana_02, 1);
	B_giveinvitems (self, other, ItRi_Mana_02, 1);
	
	B_GivePlayerXP (1000);
	Log_SetTopicStatus (TOPIC_Rudolf_przyjaciel, LOG_SUCCESS);
	B_LogEntry (TOPIC_Rudolf_przyjaciel, "Odda³em Rudolfowi pamiêtnik.");

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
 	description = "Potrafisz rozszyfrowaæ ten przepis?"; 
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
	AI_Output (other,self ,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_15_00"); //Potrafisz rozszyfrowaæ ten przepis?
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_01"); //A có¿ to takiego znalaz³eœ?
	B_giveinvitems (other, self, ItNa_Przepis_Orkowy1, 1);
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_02"); //No, no! To wygl¹da na jak¹œ orkow¹ zupê. Nie jestem pewien, czy bêdzie to dobrze smakowaæ. Wydaje mi siê, ¿e twój ¿o³¹dek wypluje wszystko, zanim zd¹¿ysz opró¿niæ chocia¿ po³owê talerza.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_03"); //Móg³byœ przet³umaczyæ dla mnie ten przepis? Niekoniecznie s³owo w s³owo, ale ¿ebym chocia¿ mniej wiêcej wiedzia³, jakich sk³adników potrzebujê.
	AI_Output (self, other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_04"); //Przede wszystkim surowego miêsa... Poczekaj chwilê. Zaraz zapiszê to, co rozumiem.
	AI_Wait(self,1);
	B_UseFakeScroll();
	Createinvitems (self, ItNa_Przepis_Orkowy2, 1);
	B_giveinvitems (self, other, ItNa_Przepis_Orkowy2, 1);
	AI_Output (self ,other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_15_05"); //No, gotowe. Mog³em pomyliæ siê w kilku miejscach, bo nie by³em pewien znaczenia niektórych s³ów, ale ogólna idea powinna byæ dobrze przet³umaczona.
	AI_Output (other, self,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_55_06"); //Dziêki, Rudolfie! Chyba nie przypuszcza³eœ, ¿e twój pobyt za palisad¹ przyda siê do ugotowania orkowej zupy?
	AI_Output (self ,other,"DIA_NASZ_015_Rudolf_OrkowyPrzepis_15_07"); //Fakt. Jednak mam nadziejê, ¿e tego nie zjesz.

	PrzepisOrkowyZnamTresc = TRUE;
	B_LogEntry (TOPIC_Orkowy_przepis, "W koñcu dysponujê przet³umaczonym przepisem. Teraz trzeba jeszcze znaleŸæ sk³adniki i poprosiæ Snafa o przyrz¹dzenie zupy.");

};

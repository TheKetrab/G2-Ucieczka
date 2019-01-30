// TODO: (nowe sposoby mysliwskie)
// nie dzia³a smar do prze³¹cznika. nie trzeba go miec, zeby przekrecic


//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_EXIT   (C_INFO)
{
	npc         = NASZ_231_Ted;
	nr          = 999;
	condition   = DIA_NASZ_231_Ted_EXIT_Condition;
	information = DIA_NASZ_231_Ted_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_231_Ted_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_231_Ted_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_siema   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 1;
 	condition   = DIA_NASZ_231_Ted_siema_Condition;
 	information = DIA_NASZ_231_Ted_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_231_Ted_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_231_Ted_siema_Info()
{
	if (MIS_DARYL_READY == TRUE) && (KAPITEL < 2)
	{
		Log_SetTopicStatus (TOPIC_Daryl_mieso, LOG_OBSOLETE);
	};
	
	Npc_ExchangeRoutine (self, "Start");
	TedBiegnie = TRUE;

	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_00"); //No, no. Zwinny jesteœ, przyznajê.
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_01"); //To, jak skaka³eœ po ska³ach, by³o ca³kiem widowiskowe.
	AI_Output (other, self,"DIA_NASZ_231_Ted_siema_55_02"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_03"); //Nazywam siê Ted. Polujê w tym lesie od czasów, których nawet ty sam nie pamiêtasz.
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_04"); //Uciekasz z kopalni, co?
	AI_Output (other, self,"DIA_NASZ_231_Ted_siema_55_05"); //Tak, Marcos trzyma³ nas tam jako niewolników. To cud, ¿e uda³o mi siê czmychn¹æ.
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_06"); //Nie mam pojêcia, dlaczego kopalnia jest zamkniêta. Dawno mnie nie by³o w tej czêsci lasu.	
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_07"); //Tak, czy owak teraz jesteœ tu sam. Na wolnoœci nie prze¿yjesz zbyt d³ugo. A twoje ³achy to jakieœ badziewie!
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_08"); //Mam w zanadrzu skórzany pancerz. Jeœli chcesz, odsprzedam ci go za 250 sztuk z³ota.

	B_GivePlayerXP (100);	
	Log_SetTopicStatus (TOPIC_Kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Kopalnia, "Jestem na wolnoœci! Teraz przyda³oby siê znaleŸæ jakiegoœ cz³owieka... Byle nie Paladyna!");		

};

//*********************************************************************
//	Info WhatToDo
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_WhatToDo   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 2;
 	condition   = DIA_NASZ_231_Ted_WhatToDo_Condition;
 	information = DIA_NASZ_231_Ted_WhatToDo_Info;
 	permanent   = FALSE;
	description = "Co mam zrobiæ?";
};

FUNC INT DIA_NASZ_231_Ted_WhatToDo_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_231_Ted_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_WhatToDo_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_WhatToDo_15_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_01"); //Czekaj, niech pomyœlê...
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_02"); //Powinieneœ biec co prêdzej do Kortha. To w³aœnie on poszukuje samotnie wa³êsaj¹cych siê po okolicy ludzi.
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_03"); //Ca³kiem niedawno widzia³em go obok mostu przy zamku. Radzi³bym ci p³yn¹æ rzek¹. Œci¹gniesz na siebie najmniejsz¹ uwagê i mo¿e zdo³asz dop³yn¹æ bezpiecznie. Woda trochê zimna, ale co tam!
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_04"); //Korth te¿ siê pewnie ucieszy, jak ciê zobaczy. Czasem ofiara sama przychodzi do ciebie... Zupe³nie jak w myœliwstwie. 
	AI_Output (other, self,"DIA_NASZ_231_Ted_WhatToDo_15_05"); //Mam nadziejê, ¿e ten ca³y Korth to nie jakiœ ³owca g³ów?
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_06"); //Spokojnie! Tylko ¿artujê. Korth to cz³owiek honoru. Zaprowadzi ciê do ludzkiej osady.
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Myœliwy Ted poradzi³ mi, bym poszuka³ Kortha. Powinien byæ gdzieœ w okolicy mostu przy zamku.");
};

//*********************************************************************
//	Info Teach
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_Teach   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 3;
 	condition   = DIA_NASZ_231_Ted_Teach_Condition;
 	information = DIA_NASZ_231_Ted_Teach_Info;
 	permanent   = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_NASZ_231_Ted_Teach_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_231_Ted_WhatToDo)) || (KAPITEL > 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_Teach_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Teach_55_01"); //Nie jestem nauczycielem. Brak mi cierpliwoœci do pocz¹tkuj¹cych. Jeœli szukasz kogoœ, kto pokaza³by ci, jak trzymaæ miecz albo podszkoli³ ciê w strzelaniu z ³uku, to musisz zapytaæ reszty myœliwych.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Teach_15_02"); //Za to wyrabiam strza³y. Potrzebujê tylko drzewca. Klinki wyrabiam sam, w lesie mo¿na znaleŸæ przeró¿ne kamienie.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Teach_55_03"); //Jeœli masz trochê lag, z którymi nie masz co zrobiæ, to przynieœ mi je. Za niewielk¹ op³at¹ zrobimy z nich amunicjê.
	
	Log_CreateTopic (TOPIC_Strzaly,LOG_NOTE);
	B_LogEntry (TOPIC_Strzaly,"Ted zajmuje siê wyrobem strza³. Jeœli przyniosê mu trochê lag i z³ota, mogê dostaæ zwyk³e i ostre strza³y.");	

};

var int TedSprzedalZbroje;
var int TedTanszaZbroja;
//*********************************************************************
//	Info BuyZbroja1
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_BuyZbroja1   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 4;
 	condition   = DIA_NASZ_231_Ted_BuyZbroja1_Condition;
 	information = DIA_NASZ_231_Ted_BuyZbroja1_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi ten pancerz. (Skórzany pancerz: 250 szt. z³ota)";
};

FUNC INT DIA_NASZ_231_Ted_BuyZbroja1_Condition()	
{
	if (TedSprzedalZbroje == FALSE) && (TedTanszaZbroja == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_BuyZbroja1_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_BuyZbroja1_15_00"); //Sprzedaj mi ten pancerz.
	
	if (npc_hasitems (other, ItMi_Gold) >=250) {
	
		B_GiveInvItems (other, self, ItMi_Gold, 250);
		Npc_RemoveInvItems   (self, ItMi_Gold, 250);

		AI_Output (self, other,"DIA_NASZ_231_Ted_BuyZbroja1_55_01"); //Uczciwa wymiana. Ta zbroja pomo¿e ci przetrwaæ w dziczy, zanim nie znajdziesz czegoœ lepszego.

		Createinvitems (self, ITAR_Leather_L, 1);
		B_Giveinvitems (self, other, ITAR_Leather_L, 1);
		AI_EquipBestArmor (other);

		TedSprzedalZbroje = TRUE;
	}
	else {
		AI_Output (self, other,"DIA_NASZ_231_Ted_BuyZbroja1_55_02"); //Czy ty widzisz tu 250 sztuk z³ota?
	};
};

//*********************************************************************
//	Info TooMuch
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_TooMuch   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 5;
 	condition   = DIA_NASZ_231_Ted_TooMuch_Condition;
 	information = DIA_NASZ_231_Ted_TooMuch_Info;
 	permanent   = FALSE;
	description = "To stanowczo zbyt du¿o pieniêdzy...";
};

FUNC INT DIA_NASZ_231_Ted_TooMuch_Condition()	
{
	return TRUE;
};

FUNC VOID DIA_NASZ_231_Ted_TooMuch_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_TooMuch_15_00"); //To stanowczo zbyt du¿o pieniêdzy...
	AI_Output (self, other,"DIA_NASZ_231_Ted_TooMuch_55_01"); //Kiedy na ciebie patrzê, to myœlê, ¿e masz racjê. Ale nie oddam ci tej zbroi za darmo.
	AI_Output (self, other,"DIA_NASZ_231_Ted_TooMuch_55_02"); //S³uchaj, zrobimy tak: Pokrêæ siê trochê po lesie i upoluj trochê zwierzyny. Potem zbierz ich miêso i usma¿.
	AI_Output (self, other,"DIA_NASZ_231_Ted_TooMuch_55_03"); //Przynieœ mi... powiedzmy dwa i pó³ tuzina sma¿onego miêsa, a ja sprzedam ci zbrojê taniej o po³owê. Co ty na to?
	AI_Output (other, self,"DIA_NASZ_231_Ted_TooMuch_55_04"); //Gdzie mogê usma¿yæ miêso?
	AI_Output (self, other,"DIA_NASZ_231_Ted_TooMuch_55_05"); //ZnajdŸ gdzieœ patelniê nad ogniskiem i do dzie³a! To ¿adna filozofia. Za³atw sobie trochê wêgla, by rozpaliæ ogieñ pod patelni¹. To jak bêdzie?
	AI_Output (other, self,"DIA_NASZ_231_Ted_TooMuch_55_06"); //Przemyœlê to.
	
	Log_CreateTopic (TOPIC_Ted_mieso, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ted_mieso, LOG_RUNNING);
	B_LogEntry (TOPIC_Ted_mieso, "Ted w zamian za 30 kawa³ków sma¿onego miêsa sprzeda mi skórzany pancerz taniej o po³owê. To chyba uczciwa transakcja, wiêc czemu nie?");


};

//*********************************************************************
//	Info Meat
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_Meat   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 6;
 	condition   = DIA_NASZ_231_Ted_Meat_Condition;
 	information = DIA_NASZ_231_Ted_Meat_Info;
 	permanent   = TRUE;
	description = "Mam trzydzieœci kawa³ków miêsa.";
};

FUNC INT DIA_NASZ_231_Ted_Meat_Condition()	
{
	if ((Npc_HasItems(other, ItFoMutton) + Npc_HasItems(other, ItFoMuttonRaw)) >= 30)
	&& (TedTanszaZbroja == FALSE)
	&& (npc_knowsinfo (other, DIA_NASZ_231_Ted_TooMuch))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_Meat_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_Meat_15_00"); //Mam trzydzieœci kawa³ków miêsa.

	if (Npc_HasItems(other, ItFoMutton) >= 30) {
		AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_01"); //To fantastycznie! Daj mi je.
		B_GiveInvItems (other, self, ItFoMutton, 30);
		
		if (TedSprzedalZbroje == TRUE)
		{
			AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_02"); //Odwali³eœ kawa³ dobrej roboty.
			AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_03"); //Za tak¹ kupê miêsa nale¿y ci siê jeszcze jakiœ prezent. Masz tu kilka ostrych strza³.
			Createinvitems (self, ItNa_OstraStrzala, 10);
			B_giveinvitems (self, other, ItNa_OstraStrzala, 10);
			B_LogEntry (TOPIC_Ted_mieso, "Da³em Tedowi 30 sztuk sma¿onego miêsa.");
		}
		else
		{
			AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_04"); //Odwali³eœ kawa³ dobrej roboty. Dotrzymam umowy. Sprzedam ci zbrojê za 125 sztuk z³ota.
			AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_05"); //Ale w sumie za tak¹ kupê miêsa nale¿y ci siê jeszcze jakiœ prezent. Masz tu kilka ostrych strza³.
			Createinvitems (self, ItNa_OstraStrzala, 10);
			B_giveinvitems (self, other, ItNa_OstraStrzala, 10);			
			B_LogEntry (TOPIC_Ted_mieso, "Da³em Tedowi 30 sztuk sma¿onego miêsa. Teraz myœliwy sprzeda mi pancerz po ni¿szej cenie.");
		};


		Log_SetTopicStatus (TOPIC_Ted_mieso, LOG_SUCCESS);
		B_GivePlayerXP (300);
		DodajReputacje (1, REP_MYSLIWI);

		TedTanszaZbroja = TRUE;
	}
	else {
		AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_06"); //Mia³eœ je upiec...
		AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_07"); //Ch³opcze, nieupieczone mogê sobie sam wydziergaæ ze œcierwojadów. Przynieœ mi 30 sztuk PIECZONEGO miêsa.		
	};

};


//*********************************************************************
//	Info BuyZbroja2
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_BuyZbroja2   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 7;
 	condition   = DIA_NASZ_231_Ted_BuyZbroja2_Condition;
 	information = DIA_NASZ_231_Ted_BuyZbroja2_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi ten pancerz. (Skórzany pancerz: 125 szt. z³ota)";
};

FUNC INT DIA_NASZ_231_Ted_BuyZbroja2_Condition()	
{
	if (TedSprzedalZbroje == FALSE) && (TedTanszaZbroja == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_BuyZbroja2_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_BuyZbroja2_15_00"); //Sprzedaj mi ten pancerz.
	
	if (npc_hasitems (other, ItMi_Gold) >=125) {
	
		B_GiveInvItems (other, self, ItMi_Gold, 125);
		Npc_RemoveInvItems   (self, ItMi_Gold, 125);

		AI_Output (self, other,"DIA_NASZ_231_Ted_BuyZbroja2_55_01"); //Uczciwa wymiana. Ta zbroja pomo¿e ci przetrwaæ w dziczy, zanim nie znajdziesz czegoœ lepszego.

		Createinvitems (self, ITAR_Leather_L, 1);
		B_Giveinvitems (self, other, ITAR_Leather_L, 1);
		AI_EquipBestArmor (other);

		TedSprzedalZbroje = TRUE;
	}
	else {
		AI_Output (self, other,"DIA_NASZ_231_Ted_BuyZbroja2_55_02"); //Czy ty widzisz tu 125 sztuk z³ota?
	};
};


//*********************************************************************
//	Info Kap2
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_Kap2   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 8;
 	condition   = DIA_NASZ_231_Ted_Kap2_Condition;
 	information = DIA_NASZ_231_Ted_Kap2_Info;
 	permanent   = FALSE;
	description = "Coœ siê sta³o?";
};

FUNC INT DIA_NASZ_231_Ted_Kap2_Condition()	
{
	if (KAPITEL >= 2) && (KAPITEL < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_Kap2_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_Kap2_15_00"); //Coœ siê sta³o?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap2_55_01"); //Wargi... Cholerny œwiat!
	AI_Output (other, self,"DIA_NASZ_231_Ted_Kap2_15_02"); //Co?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap2_55_03"); //Szed³em œcie¿k¹, a tu napad³y mnie wargi. Zrani³y mnie w nogê, ale uciek³em.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap2_55_04"); //Najgorsze jest to, ¿e jeden z nich zerwa³ mi sakwê z ramienia, a w niej mia³em wszystkie lekarstwa.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap2_55_05"); //Czujê siê coraz s³abszy. Jad wargów rozprzestrzenia siê.
};

//*********************************************************************
//	Info Przyniose
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_Przyniose   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 9;
 	condition   = DIA_NASZ_231_Ted_Przyniose_Condition;
 	information = DIA_NASZ_231_Ted_Przyniose_Info;
 	permanent   = FALSE;
	description = "Mo¿e ja przyniosê ci sakwê?";
};

FUNC INT DIA_NASZ_231_Ted_Przyniose_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_231_Ted_Kap2)) && (KAPITEL < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_Przyniose_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_Przyniose_15_00"); //Mo¿e ja przyniosê ci sakwê?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Przyniose_55_01"); //Poœpiesz siê w takim razie... B³agam, na Innosa!
	AI_Output (other, self,"DIA_NASZ_231_Ted_Przyniose_15_02"); //Gdzie napad³y ciê te zwierzêta?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Przyniose_55_03"); //IdŸ po prostu œcie¿k¹ przez las st¹d do kopalni.
	AI_Output (other, self,"DIA_NASZ_231_Ted_Przyniose_55_04"); //Zrobiê, co w mojej mocy.
	
	Wld_InsertNpc	(Warg,"FP_ROAM_OW_MOLERAT_OCWOOD_OLDMINE3"); 
	Wld_InsertNpc	(WargTed,"FP_ROAM_OW_MOLERAT_OCWOOD_OLDMINE2"); 
	
	Log_CreateTopic (TOPIC_Ted_sakwa, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ted_sakwa, LOG_RUNNING);
	B_LogEntry (TOPIC_Ted_sakwa, "Ted zosta³ pogryziony przez wargi, a na dodatek zabra³y mu sakwê z lekarstwami. Muszê siê za tymi bestiami rozejrzeæ po okolicy.");

};

//*********************************************************************
//	Info Mam
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_Mam   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 10;
 	condition   = DIA_NASZ_231_Ted_Mam_Condition;
 	information = DIA_NASZ_231_Ted_Mam_Info;
 	permanent   = FALSE;
	description = "Mam to, o co prosi³eœ.";
};

FUNC INT DIA_NASZ_231_Ted_Mam_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_231_Ted_Kap2)
	&& npc_hasitems (other, ItNa_SakwaTed) >=1) && (KAPITEL < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_Mam_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_Mam_15_00"); //Mam to, o co prosi³eœ.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Mam_55_01"); //Podaj.
	B_giveinvitems (other, self, ItNa_SakwaTed, 1);
	AI_Output (other, self,"DIA_NASZ_231_Ted_Mam_15_02"); //I jak?
	TedIsSick = FALSE;
	NASZ_231_Ted.attribute [ATR_HITPOINTS] = NASZ_231_Ted.attribute [ATR_HITPOINTS_MAX];
	AI_Output (self, other,"DIA_NASZ_231_Ted_Mam_55_03"); //Ból usta³... Posiedzê tu jeszcze i bêdê pielêgnowa³ nogê. Dziêkujê!
	AI_Output (self, other,"DIA_NASZ_231_Ted_Mam_55_04"); //Nie mam ci czego daæ... Chocia¿, weŸ ten amulet. Nawet jeœli ci siê nie przyda, to zawsze mo¿esz go sprzedaæ.
	
	Createinvitems (self, ItAm_Prot_Point_01, 1);
	B_giveinvitems (self, other, ItAm_Prot_Point_01, 1);
	
	DodajReputacje (3, REP_MYSLIWI);
	B_GivePlayerXP (500);
	
	Log_SetTopicStatus (TOPIC_Ted_sakwa, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ted_sakwa, "Odda³em sakwê Tedowi.");

};

//*********************************************************************
//	Info MakeArrow
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_MakeArrow   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 100;
 	condition   = DIA_NASZ_231_Ted_MakeArrow_Condition;
 	information = DIA_NASZ_231_Ted_MakeArrow_Info;
 	permanent   = TRUE;
	description = "Zrobisz dla mnie strza³y?";
};

FUNC INT DIA_NASZ_231_Ted_MakeArrow_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_231_Ted_teach))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_MakeArrow_15_00"); //Zrobisz dla mnie strza³y?
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_55_01"); //Ile?

	Info_ClearChoices (DIA_NASZ_231_Ted_MakeArrow);

		Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, DIALOG_BACK, DIA_NASZ_231_Ted_MakeArrow_Back);

		if (npc_hasitems (other, ItMi_Gold) >=150) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=25) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "50 ostrych strza³: 25 lag, 150 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_50o);
		};
		if (npc_hasitems (other, ItMi_Gold) >=25) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=25) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "50 strza³: 25 lag, 25 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_50);
		};
		if (npc_hasitems (other, ItMi_Gold) >=60) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=10) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "20 ostrych strza³: 10 lag, 60 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_20o);
		};
		if (npc_hasitems (other, ItMi_Gold) >=10) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=10) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "20 strza³: 10 lag, 10 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_20);
		};
		if (npc_hasitems (other, ItMi_Gold) >=30) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=5) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "10 ostrych strza³: 5 lag, 30 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_10o);
		};
		if (npc_hasitems (other, ItMi_Gold) >=5) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=5) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "10 strza³: 5 lag, 5 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_10);
		};
};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_Back()
{
	Info_ClearChoices (DIA_NASZ_231_Ted_MakeArrow);
};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_50o()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_50o_15_00"); //50 ostrych strza³.
	B_GiveInvItems (other, self, ItMi_Gold, 150);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 25);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_50o_15_01"); //To dla ciebie.
	CreateInvItems (self, ItNa_OstraStrzala, 50);
	B_GiveInvItems (self, other, ItNa_OstraStrzala, 50);

		if (npc_hasitems (other, ItMi_Gold) >=150) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=25) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "50 ostrych strza³: 25 lag, 150 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_50o);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_50()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_50_15_00"); //50 strza³.
	B_GiveInvItems (other, self, ItMi_Gold, 25);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 25);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_50_15_01"); //To dla ciebie.
	CreateInvItems (self, ItRw_Arrow, 50);
	B_GiveInvItems (self, other, ItRw_Arrow, 50);

		if (npc_hasitems (other, ItMi_Gold) >=25) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=25) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "50 strza³: 25 lag, 25 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_50);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_20o()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_20o_15_00"); //20 ostrych strza³.
	B_GiveInvItems (other, self, ItMi_Gold, 60);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 10);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_20o_15_01"); //To dla ciebie.
	CreateInvItems (self, ItNa_OstraStrzala, 20);
	B_GiveInvItems (self, other, ItNa_OstraStrzala, 20);

		if (npc_hasitems (other, ItMi_Gold) >=60) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=10) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "20 ostrych strza³: 10 lag, 60 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_20o);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_20()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_20_15_00"); //20 strza³.
	B_GiveInvItems (other, self, ItMi_Gold, 10);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 10);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_20_15_01"); //To dla ciebie.
	CreateInvItems (self, ItRw_Arrow, 20);
	B_GiveInvItems (self, other, ItRw_Arrow, 20);

		if (npc_hasitems (other, ItMi_Gold) >=10) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=10) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "20 strza³: 10 lag, 10 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_20);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_10o()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_10o_15_00"); //10 ostrych strza³.
	B_GiveInvItems (other, self, ItMi_Gold, 30);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 5);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_10o_15_01"); //To dla ciebie.
	CreateInvItems (self, ItNa_OstraStrzala, 10);
	B_GiveInvItems (self, other, ItNa_OstraStrzala, 10);

		if (npc_hasitems (other, ItMi_Gold) >=30) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=5) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "10 ostrych strza³: 5 lag, 30 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_10o);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_10()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_10_15_00"); //10 strza³.
	B_GiveInvItems (other, self, ItMi_Gold, 5);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 5);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_10_15_01"); //To dla ciebie.
	CreateInvItems (self, ItRw_Arrow, 10);
	B_GiveInvItems (self, other, ItRw_Arrow, 10);

		if (npc_hasitems (other, ItMi_Gold) >=5) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=5) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "10 strza³: 5 lag, 5 szt. z³ota", DIA_NASZ_231_Ted_MakeArrow_10);
		};
};

//*********************************************************************
//	Info Kap4
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_Kap4   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 41;
 	condition   = DIA_NASZ_231_Ted_Kap4_Condition;
 	information = DIA_NASZ_231_Ted_Kap4_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_231_Ted_Kap4_Condition()	
{
	if (KAPITEL == 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_Kap4_Info()
{
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_15_00"); //A co ty tu robisz?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_55_01"); //Jakby nie by³o, nie jest to najbezpieczniejsze miejsce na spacerek. Sam trafi³em tu przez przypadek.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_55_02"); //Z lasu wypatrzy³em wie¿yczkê w tym opuszczonym klasztorze i stwierdzi³em, ¿e zbadam legendy kr¹¿¹ce o tym miejscu.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_55_03"); //Ale nawet nie odwa¿y³em siê wejœæ do œrodka. Od kilku godzin stojê tu i obserwuje trolle, czy przypadkiem nie zdo³am przemkn¹æ siê obok nich.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_55_04"); //Cholera, te bestie chyba nigdy nie œpi¹...

};

//*********************************************************************
//	Info HowDoYouGetHere
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_HowDoYouGetHere   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 42;
 	condition   = DIA_NASZ_231_Ted_HowDoYouGetHere_Condition;
 	information = DIA_NASZ_231_Ted_HowDoYouGetHere_Info;
 	permanent   = FALSE;
	description = "Jak dosta³eœ siê za palisadê?";
};

FUNC INT DIA_NASZ_231_Ted_HowDoYouGetHere_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_231_Ted_Kap4))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_HowDoYouGetHere_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_HowDoYouGetHere_15_00"); //Jak dosta³eœ siê za palisadê?
	AI_Output (self, other,"DIA_NASZ_231_Ted_HowDoYouGetHere_55_01"); //Zapewne tak samo jak ty. Wszed³em przez otwart¹ bramê.
	AI_Output (self, other,"DIA_NASZ_231_Ted_HowDoYouGetHere_55_02"); //Te wasze gierki z orkami przy tej wielkiej konstrukcji p³oszy³y zwierzynê w moim lesie.
	AI_Output (self, other,"DIA_NASZ_231_Ted_HowDoYouGetHere_55_03"); //Uda³em siê wzd³u¿ rzeki i gdy zobaczy³em przejœcie do nowego, dzikiego lasu, wszed³em.

};

//*********************************************************************
//	Info WhatLegends
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_WhatLegends   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 43;
 	condition   = DIA_NASZ_231_Ted_WhatLegends_Condition;
 	information = DIA_NASZ_231_Ted_WhatLegends_Info;
 	permanent   = FALSE;
	description = "O jakich legendach mówisz?";
};

FUNC INT DIA_NASZ_231_Ted_WhatLegends_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_231_Ted_Kap4))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_WhatLegends_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_WhatLegends_15_00"); //O jakich legendach mówisz?
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatLegends_55_01"); //Legendach, bajkach, historii... Sam ju¿ nie wiem. W ka¿dym razie, podobno na tym obszarze, dawno temu rezydowali magowie, specjalizuj¹cy siê w przemianach.
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatLegends_55_02"); //Jeœli to prawda, to byæ mo¿ê znajdê tu jakieœ zapiski o konkretnych zwierzêtach, co znacznie u³atwi mi polowanie.
};

//*********************************************************************
//	Info GoTrolls
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_GoTrolls   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 44;
 	condition   = DIA_NASZ_231_Ted_GoTrolls_Condition;
 	information = DIA_NASZ_231_Ted_GoTrolls_Info;
 	permanent   = FALSE;
	description = "Mo¿e spróbujemy ubiæ parê trolli?";
};

FUNC INT DIA_NASZ_231_Ted_GoTrolls_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_231_Ted_WhatLegends))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_GoTrolls_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_GoTrolls_15_00"); //Mo¿e spróbujemy ubiæ parê trolli?
	AI_Output (self, other,"DIA_NASZ_231_Ted_GoTrolls_55_01"); //Czemu nie? We dwóch mo¿emy zaryzykowaæ.
	AI_Output (self, other,"DIA_NASZ_231_Ted_GoTrolls_55_02"); //ChodŸ, obstrzelamy te monstra i przebijemy siê do wie¿y magów!

	Log_CreateTopic (TOPIC_Ted_trolls, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ted_trolls, LOG_RUNNING);
	B_LogEntry (TOPIC_Ted_trolls, "Natkn¹³em siê na Teda przed ruinami klasztoru za palisad¹. Myœliwy liczy, ¿e pozna tu nowe sposoby na polowanie. Przeszkod¹ s¹ tutaj potê¿ne trolle.");

	Npc_ExchangeRoutine (self, "GoToWieza");
};

//*********************************************************************
//	Info Krata
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_Krata   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 45;
 	condition   = DIA_NASZ_231_Ted_Krata_Condition;
 	information = DIA_NASZ_231_Ted_Krata_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_231_Ted_Krata_Condition()	
{
	if (Npc_GetDistToWP	(self, "NASZ_ZAPALISADA_KLASZTOR_08") <=500)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_Krata_Info()
{
	AI_Output (self, other,"DIA_NASZ_231_Ted_Krata_15_00"); //Oczywiœcie... Zamkniête!
	AI_Output (self, other,"DIA_NASZ_231_Ted_Krata_55_01"); //Gdzieœ w okolicy musi byæ prze³¹cznik otwieraj¹cy tê kratê.
	AI_Output (other, self,"DIA_NASZ_231_Ted_Krata_55_02"); //Tak, tak, jasne. Idê go poszukaæ.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Krata_55_03"); //Tylko siê nie zgub!
	
	B_LogEntry (TOPIC_Ted_trolls, "Zamiast drzwi, magowie widocznie u¿ywali bram... Muszê znaleŸæ jakiœ sposób ¿eby otworzyæ tê tutaj do wie¿y.");

	Npc_ExchangeRoutine (self, "UnderWieza");

};

//*********************************************************************
//	Info DidIt
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_DidIt   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 46;
 	condition   = DIA_NASZ_231_Ted_DidIt_Condition;
 	information = DIA_NASZ_231_Ted_DidIt_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_231_Ted_DidIt_Condition()	
{
	if (WillOtworzylBrameDlaTeda == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_DidIt_Info()
{
	B_GivePlayerXP(500);

	AI_Output (self, other,"DIA_NASZ_231_Ted_DidIt_15_00"); //Uda³o ci siê!
	AI_Output (other, self,"DIA_NASZ_231_Ted_DidIt_55_01"); //Czemu nie wszed³eœ do œrodka?
	AI_Output (self, other,"DIA_NASZ_231_Ted_DidIt_55_02"); //Nie by³em pewien, czy mnie znajdziesz.
	AI_Output (other, self,"DIA_NASZ_231_Ted_DidIt_55_03"); //W³aŸ, w³aŸ. Zajrzê do ciebie póŸniej.
	
	B_LogEntry (TOPIC_Ted_trolls, "Zajrzê za jakiœ czas do Teda. Ciekawe, czy znajdzie coœ ciekawego?");

	Npc_ExchangeRoutine (self, "Gora");

};

//*********************************************************************
//	Info AndHow
//*********************************************************************
INSTANCE DIA_NASZ_231_Ted_AndHow   (C_INFO)
{
	npc         = NASZ_231_Ted;
 	nr          = 47;
 	condition   = DIA_NASZ_231_Ted_AndHow_Condition;
 	information = DIA_NASZ_231_Ted_AndHow_Info;
 	permanent   = FALSE;
	description = "I jak?";
};

FUNC INT DIA_NASZ_231_Ted_AndHow_Condition()	
{
	if (Npc_GetDistToWP	(self, "NASZ_ZAPALISADA_KLASZTOR_14") <=500)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_231_Ted_AndHow_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_AndHow_15_00"); //I jak?
	AI_Output (self, other,"DIA_NASZ_231_Ted_AndHow_55_01"); //Ta ksiêga jest unikatowa! S¹ tutaj zapiski o ró¿nych zwierzêtach. Zostanê tutaj i przestudiujê j¹ dok³adnie.
	AI_Output (self, other,"DIA_NASZ_231_Ted_AndHow_55_02"); //Dziêki za pomoc! W nagrodê dam ci kilka ognistych strza³.
	AI_Output (self, other,"DIA_NASZ_231_Ted_AndHow_55_03"); //Przydadz¹ siê na coœ równie wielkiego jak troll.

	Createinvitems (self, ItNa_OgnistaStrzala, 60);
	B_giveinvitems (self, other, ItNa_OgnistaStrzala, 60);
	
	DodajReputacje(4,REP_MYSLIWI);
	
	B_GivePlayerXP (500);
	Log_SetTopicStatus (TOPIC_Ted_trolls, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ted_trolls, "Ted znalaz³ to czego szuka³. Dobrze, ¿e nie obesz³o siê bez nagrody.");

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_231_Ted_PICKPOCKET (C_INFO)
{
	npc			= NASZ_231_Ted;
	nr			= 900;
	condition	= DIA_NASZ_231_Ted_PICKPOCKET_Condition;
	information	= DIA_NASZ_231_Ted_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_231_Ted_PICKPOCKET_Condition()
{
	C_Beklauen (40);
};
 
FUNC VOID DIA_NASZ_231_Ted_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_231_Ted_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_231_Ted_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_231_Ted_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_231_Ted_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_231_Ted_PICKPOCKET_DoIt);
};

func void DIA_NASZ_231_Ted_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItNa_OstraStrzala,42);
	
	Info_ClearChoices (DIA_NASZ_231_Ted_PICKPOCKET);
};
	
func void DIA_NASZ_231_Ted_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_231_Ted_PICKPOCKET);
};
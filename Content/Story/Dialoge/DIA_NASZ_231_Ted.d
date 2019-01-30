// TODO: (nowe sposoby mysliwskie)
// nie dzia�a smar do prze��cznika. nie trzeba go miec, zeby przekrecic


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

	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_00"); //No, no. Zwinny jeste�, przyznaj�.
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_01"); //To, jak skaka�e� po ska�ach, by�o ca�kiem widowiskowe.
	AI_Output (other, self,"DIA_NASZ_231_Ted_siema_55_02"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_03"); //Nazywam si� Ted. Poluj� w tym lesie od czas�w, kt�rych nawet ty sam nie pami�tasz.
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_04"); //Uciekasz z kopalni, co?
	AI_Output (other, self,"DIA_NASZ_231_Ted_siema_55_05"); //Tak, Marcos trzyma� nas tam jako niewolnik�w. To cud, �e uda�o mi si� czmychn��.
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_06"); //Nie mam poj�cia, dlaczego kopalnia jest zamkni�ta. Dawno mnie nie by�o w tej cz�sci lasu.	
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_07"); //Tak, czy owak teraz jeste� tu sam. Na wolno�ci nie prze�yjesz zbyt d�ugo. A twoje �achy to jakie� badziewie!
	AI_Output (self, other,"DIA_NASZ_231_Ted_siema_55_08"); //Mam w zanadrzu sk�rzany pancerz. Je�li chcesz, odsprzedam ci go za 250 sztuk z�ota.

	B_GivePlayerXP (100);	
	Log_SetTopicStatus (TOPIC_Kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Kopalnia, "Jestem na wolno�ci! Teraz przyda�oby si� znale�� jakiego� cz�owieka... Byle nie Paladyna!");		

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
	description = "Co mam zrobi�?";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_WhatToDo_15_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_01"); //Czekaj, niech pomy�l�...
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_02"); //Powiniene� biec co pr�dzej do Kortha. To w�a�nie on poszukuje samotnie wa��saj�cych si� po okolicy ludzi.
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_03"); //Ca�kiem niedawno widzia�em go obok mostu przy zamku. Radzi�bym ci p�yn�� rzek�. �ci�gniesz na siebie najmniejsz� uwag� i mo�e zdo�asz dop�yn�� bezpiecznie. Woda troch� zimna, ale co tam!
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_04"); //Korth te� si� pewnie ucieszy, jak ci� zobaczy. Czasem ofiara sama przychodzi do ciebie... Zupe�nie jak w my�liwstwie. 
	AI_Output (other, self,"DIA_NASZ_231_Ted_WhatToDo_15_05"); //Mam nadziej�, �e ten ca�y Korth to nie jaki� �owca g��w?
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatToDo_55_06"); //Spokojnie! Tylko �artuj�. Korth to cz�owiek honoru. Zaprowadzi ci� do ludzkiej osady.
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "My�liwy Ted poradzi� mi, bym poszuka� Kortha. Powinien by� gdzie� w okolicy mostu przy zamku.");
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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Teach_55_01"); //Nie jestem nauczycielem. Brak mi cierpliwo�ci do pocz�tkuj�cych. Je�li szukasz kogo�, kto pokaza�by ci, jak trzyma� miecz albo podszkoli� ci� w strzelaniu z �uku, to musisz zapyta� reszty my�liwych.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Teach_15_02"); //Za to wyrabiam strza�y. Potrzebuj� tylko drzewca. Klinki wyrabiam sam, w lesie mo�na znale�� przer�ne kamienie.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Teach_55_03"); //Je�li masz troch� lag, z kt�rymi nie masz co zrobi�, to przynie� mi je. Za niewielk� op�at� zrobimy z nich amunicj�.
	
	Log_CreateTopic (TOPIC_Strzaly,LOG_NOTE);
	B_LogEntry (TOPIC_Strzaly,"Ted zajmuje si� wyrobem strza�. Je�li przynios� mu troch� lag i z�ota, mog� dosta� zwyk�e i ostre strza�y.");	

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
	description = "Sprzedaj mi ten pancerz. (Sk�rzany pancerz: 250 szt. z�ota)";
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

		AI_Output (self, other,"DIA_NASZ_231_Ted_BuyZbroja1_55_01"); //Uczciwa wymiana. Ta zbroja pomo�e ci przetrwa� w dziczy, zanim nie znajdziesz czego� lepszego.

		Createinvitems (self, ITAR_Leather_L, 1);
		B_Giveinvitems (self, other, ITAR_Leather_L, 1);
		AI_EquipBestArmor (other);

		TedSprzedalZbroje = TRUE;
	}
	else {
		AI_Output (self, other,"DIA_NASZ_231_Ted_BuyZbroja1_55_02"); //Czy ty widzisz tu 250 sztuk z�ota?
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
	description = "To stanowczo zbyt du�o pieni�dzy...";
};

FUNC INT DIA_NASZ_231_Ted_TooMuch_Condition()	
{
	return TRUE;
};

FUNC VOID DIA_NASZ_231_Ted_TooMuch_Info()
{
	AI_Output (other, self,"DIA_NASZ_231_Ted_TooMuch_15_00"); //To stanowczo zbyt du�o pieni�dzy...
	AI_Output (self, other,"DIA_NASZ_231_Ted_TooMuch_55_01"); //Kiedy na ciebie patrz�, to my�l�, �e masz racj�. Ale nie oddam ci tej zbroi za darmo.
	AI_Output (self, other,"DIA_NASZ_231_Ted_TooMuch_55_02"); //S�uchaj, zrobimy tak: Pokr�� si� troch� po lesie i upoluj troch� zwierzyny. Potem zbierz ich mi�so i usma�.
	AI_Output (self, other,"DIA_NASZ_231_Ted_TooMuch_55_03"); //Przynie� mi... powiedzmy dwa i p� tuzina sma�onego mi�sa, a ja sprzedam ci zbroj� taniej o po�ow�. Co ty na to?
	AI_Output (other, self,"DIA_NASZ_231_Ted_TooMuch_55_04"); //Gdzie mog� usma�y� mi�so?
	AI_Output (self, other,"DIA_NASZ_231_Ted_TooMuch_55_05"); //Znajd� gdzie� patelni� nad ogniskiem i do dzie�a! To �adna filozofia. Za�atw sobie troch� w�gla, by rozpali� ogie� pod patelni�. To jak b�dzie?
	AI_Output (other, self,"DIA_NASZ_231_Ted_TooMuch_55_06"); //Przemy�l� to.
	
	Log_CreateTopic (TOPIC_Ted_mieso, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ted_mieso, LOG_RUNNING);
	B_LogEntry (TOPIC_Ted_mieso, "Ted w zamian za 30 kawa�k�w sma�onego mi�sa sprzeda mi sk�rzany pancerz taniej o po�ow�. To chyba uczciwa transakcja, wi�c czemu nie?");


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
	description = "Mam trzydzie�ci kawa�k�w mi�sa.";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_Meat_15_00"); //Mam trzydzie�ci kawa�k�w mi�sa.

	if (Npc_HasItems(other, ItFoMutton) >= 30) {
		AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_01"); //To fantastycznie! Daj mi je.
		B_GiveInvItems (other, self, ItFoMutton, 30);
		
		if (TedSprzedalZbroje == TRUE)
		{
			AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_02"); //Odwali�e� kawa� dobrej roboty.
			AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_03"); //Za tak� kup� mi�sa nale�y ci si� jeszcze jaki� prezent. Masz tu kilka ostrych strza�.
			Createinvitems (self, ItNa_OstraStrzala, 10);
			B_giveinvitems (self, other, ItNa_OstraStrzala, 10);
			B_LogEntry (TOPIC_Ted_mieso, "Da�em Tedowi 30 sztuk sma�onego mi�sa.");
		}
		else
		{
			AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_04"); //Odwali�e� kawa� dobrej roboty. Dotrzymam umowy. Sprzedam ci zbroj� za 125 sztuk z�ota.
			AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_05"); //Ale w sumie za tak� kup� mi�sa nale�y ci si� jeszcze jaki� prezent. Masz tu kilka ostrych strza�.
			Createinvitems (self, ItNa_OstraStrzala, 10);
			B_giveinvitems (self, other, ItNa_OstraStrzala, 10);			
			B_LogEntry (TOPIC_Ted_mieso, "Da�em Tedowi 30 sztuk sma�onego mi�sa. Teraz my�liwy sprzeda mi pancerz po ni�szej cenie.");
		};


		Log_SetTopicStatus (TOPIC_Ted_mieso, LOG_SUCCESS);
		B_GivePlayerXP (300);
		DodajReputacje (1, REP_MYSLIWI);

		TedTanszaZbroja = TRUE;
	}
	else {
		AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_06"); //Mia�e� je upiec...
		AI_Output (self, other,"DIA_NASZ_231_Ted_Meat_55_07"); //Ch�opcze, nieupieczone mog� sobie sam wydzierga� ze �cierwojad�w. Przynie� mi 30 sztuk PIECZONEGO mi�sa.		
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
	description = "Sprzedaj mi ten pancerz. (Sk�rzany pancerz: 125 szt. z�ota)";
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

		AI_Output (self, other,"DIA_NASZ_231_Ted_BuyZbroja2_55_01"); //Uczciwa wymiana. Ta zbroja pomo�e ci przetrwa� w dziczy, zanim nie znajdziesz czego� lepszego.

		Createinvitems (self, ITAR_Leather_L, 1);
		B_Giveinvitems (self, other, ITAR_Leather_L, 1);
		AI_EquipBestArmor (other);

		TedSprzedalZbroje = TRUE;
	}
	else {
		AI_Output (self, other,"DIA_NASZ_231_Ted_BuyZbroja2_55_02"); //Czy ty widzisz tu 125 sztuk z�ota?
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
	description = "Co� si� sta�o?";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_Kap2_15_00"); //Co� si� sta�o?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap2_55_01"); //Wargi... Cholerny �wiat!
	AI_Output (other, self,"DIA_NASZ_231_Ted_Kap2_15_02"); //Co?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap2_55_03"); //Szed�em �cie�k�, a tu napad�y mnie wargi. Zrani�y mnie w nog�, ale uciek�em.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap2_55_04"); //Najgorsze jest to, �e jeden z nich zerwa� mi sakw� z ramienia, a w niej mia�em wszystkie lekarstwa.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap2_55_05"); //Czuj� si� coraz s�abszy. Jad warg�w rozprzestrzenia si�.
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
	description = "Mo�e ja przynios� ci sakw�?";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_Przyniose_15_00"); //Mo�e ja przynios� ci sakw�?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Przyniose_55_01"); //Po�piesz si� w takim razie... B�agam, na Innosa!
	AI_Output (other, self,"DIA_NASZ_231_Ted_Przyniose_15_02"); //Gdzie napad�y ci� te zwierz�ta?
	AI_Output (self, other,"DIA_NASZ_231_Ted_Przyniose_55_03"); //Id� po prostu �cie�k� przez las st�d do kopalni.
	AI_Output (other, self,"DIA_NASZ_231_Ted_Przyniose_55_04"); //Zrobi�, co w mojej mocy.
	
	Wld_InsertNpc	(Warg,"FP_ROAM_OW_MOLERAT_OCWOOD_OLDMINE3"); 
	Wld_InsertNpc	(WargTed,"FP_ROAM_OW_MOLERAT_OCWOOD_OLDMINE2"); 
	
	Log_CreateTopic (TOPIC_Ted_sakwa, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ted_sakwa, LOG_RUNNING);
	B_LogEntry (TOPIC_Ted_sakwa, "Ted zosta� pogryziony przez wargi, a na dodatek zabra�y mu sakw� z lekarstwami. Musz� si� za tymi bestiami rozejrze� po okolicy.");

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
	description = "Mam to, o co prosi�e�.";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_Mam_15_00"); //Mam to, o co prosi�e�.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Mam_55_01"); //Podaj.
	B_giveinvitems (other, self, ItNa_SakwaTed, 1);
	AI_Output (other, self,"DIA_NASZ_231_Ted_Mam_15_02"); //I jak?
	TedIsSick = FALSE;
	NASZ_231_Ted.attribute [ATR_HITPOINTS] = NASZ_231_Ted.attribute [ATR_HITPOINTS_MAX];
	AI_Output (self, other,"DIA_NASZ_231_Ted_Mam_55_03"); //B�l usta�... Posiedz� tu jeszcze i b�d� piel�gnowa� nog�. Dzi�kuj�!
	AI_Output (self, other,"DIA_NASZ_231_Ted_Mam_55_04"); //Nie mam ci czego da�... Chocia�, we� ten amulet. Nawet je�li ci si� nie przyda, to zawsze mo�esz go sprzeda�.
	
	Createinvitems (self, ItAm_Prot_Point_01, 1);
	B_giveinvitems (self, other, ItAm_Prot_Point_01, 1);
	
	DodajReputacje (3, REP_MYSLIWI);
	B_GivePlayerXP (500);
	
	Log_SetTopicStatus (TOPIC_Ted_sakwa, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ted_sakwa, "Odda�em sakw� Tedowi.");

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
	description = "Zrobisz dla mnie strza�y?";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_MakeArrow_15_00"); //Zrobisz dla mnie strza�y?
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_55_01"); //Ile?

	Info_ClearChoices (DIA_NASZ_231_Ted_MakeArrow);

		Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, DIALOG_BACK, DIA_NASZ_231_Ted_MakeArrow_Back);

		if (npc_hasitems (other, ItMi_Gold) >=150) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=25) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "50 ostrych strza�: 25 lag, 150 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_50o);
		};
		if (npc_hasitems (other, ItMi_Gold) >=25) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=25) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "50 strza�: 25 lag, 25 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_50);
		};
		if (npc_hasitems (other, ItMi_Gold) >=60) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=10) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "20 ostrych strza�: 10 lag, 60 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_20o);
		};
		if (npc_hasitems (other, ItMi_Gold) >=10) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=10) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "20 strza�: 10 lag, 10 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_20);
		};
		if (npc_hasitems (other, ItMi_Gold) >=30) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=5) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "10 ostrych strza�: 5 lag, 30 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_10o);
		};
		if (npc_hasitems (other, ItMi_Gold) >=5) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=5) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "10 strza�: 5 lag, 5 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_10);
		};
};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_Back()
{
	Info_ClearChoices (DIA_NASZ_231_Ted_MakeArrow);
};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_50o()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_50o_15_00"); //50 ostrych strza�.
	B_GiveInvItems (other, self, ItMi_Gold, 150);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 25);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_50o_15_01"); //To dla ciebie.
	CreateInvItems (self, ItNa_OstraStrzala, 50);
	B_GiveInvItems (self, other, ItNa_OstraStrzala, 50);

		if (npc_hasitems (other, ItMi_Gold) >=150) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=25) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "50 ostrych strza�: 25 lag, 150 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_50o);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_50()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_50_15_00"); //50 strza�.
	B_GiveInvItems (other, self, ItMi_Gold, 25);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 25);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_50_15_01"); //To dla ciebie.
	CreateInvItems (self, ItRw_Arrow, 50);
	B_GiveInvItems (self, other, ItRw_Arrow, 50);

		if (npc_hasitems (other, ItMi_Gold) >=25) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=25) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "50 strza�: 25 lag, 25 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_50);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_20o()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_20o_15_00"); //20 ostrych strza�.
	B_GiveInvItems (other, self, ItMi_Gold, 60);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 10);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_20o_15_01"); //To dla ciebie.
	CreateInvItems (self, ItNa_OstraStrzala, 20);
	B_GiveInvItems (self, other, ItNa_OstraStrzala, 20);

		if (npc_hasitems (other, ItMi_Gold) >=60) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=10) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "20 ostrych strza�: 10 lag, 60 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_20o);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_20()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_20_15_00"); //20 strza�.
	B_GiveInvItems (other, self, ItMi_Gold, 10);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 10);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_20_15_01"); //To dla ciebie.
	CreateInvItems (self, ItRw_Arrow, 20);
	B_GiveInvItems (self, other, ItRw_Arrow, 20);

		if (npc_hasitems (other, ItMi_Gold) >=10) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=10) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "20 strza�: 10 lag, 10 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_20);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_10o()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_10o_15_00"); //10 ostrych strza�.
	B_GiveInvItems (other, self, ItMi_Gold, 30);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 5);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_10o_15_01"); //To dla ciebie.
	CreateInvItems (self, ItNa_OstraStrzala, 10);
	B_GiveInvItems (self, other, ItNa_OstraStrzala, 10);

		if (npc_hasitems (other, ItMi_Gold) >=30) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=5) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "10 ostrych strza�: 5 lag, 30 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_10o);
		};

};

FUNC VOID DIA_NASZ_231_Ted_MakeArrow_10()
{

	AI_Output (other,self ,"DIA_NASZ_231_Ted_MakeArrow_10_15_00"); //10 strza�.
	B_GiveInvItems (other, self, ItMi_Gold, 5);
	B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 5);
	AI_Output (self, other,"DIA_NASZ_231_Ted_MakeArrow_10_15_01"); //To dla ciebie.
	CreateInvItems (self, ItRw_Arrow, 10);
	B_GiveInvItems (self, other, ItRw_Arrow, 10);

		if (npc_hasitems (other, ItMi_Gold) >=5) && (npc_hasitems (other, ItMw_1h_Bau_Mace) >=5) {
			Info_AddChoice	  (DIA_NASZ_231_Ted_MakeArrow, "10 strza�: 5 lag, 5 szt. z�ota", DIA_NASZ_231_Ted_MakeArrow_10);
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
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_55_01"); //Jakby nie by�o, nie jest to najbezpieczniejsze miejsce na spacerek. Sam trafi�em tu przez przypadek.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_55_02"); //Z lasu wypatrzy�em wie�yczk� w tym opuszczonym klasztorze i stwierdzi�em, �e zbadam legendy kr���ce o tym miejscu.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_55_03"); //Ale nawet nie odwa�y�em si� wej�� do �rodka. Od kilku godzin stoj� tu i obserwuje trolle, czy przypadkiem nie zdo�am przemkn�� si� obok nich.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Kap4_55_04"); //Cholera, te bestie chyba nigdy nie �pi�...

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
	description = "Jak dosta�e� si� za palisad�?";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_HowDoYouGetHere_15_00"); //Jak dosta�e� si� za palisad�?
	AI_Output (self, other,"DIA_NASZ_231_Ted_HowDoYouGetHere_55_01"); //Zapewne tak samo jak ty. Wszed�em przez otwart� bram�.
	AI_Output (self, other,"DIA_NASZ_231_Ted_HowDoYouGetHere_55_02"); //Te wasze gierki z orkami przy tej wielkiej konstrukcji p�oszy�y zwierzyn� w moim lesie.
	AI_Output (self, other,"DIA_NASZ_231_Ted_HowDoYouGetHere_55_03"); //Uda�em si� wzd�u� rzeki i gdy zobaczy�em przej�cie do nowego, dzikiego lasu, wszed�em.

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
	description = "O jakich legendach m�wisz?";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_WhatLegends_15_00"); //O jakich legendach m�wisz?
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatLegends_55_01"); //Legendach, bajkach, historii... Sam ju� nie wiem. W ka�dym razie, podobno na tym obszarze, dawno temu rezydowali magowie, specjalizuj�cy si� w przemianach.
	AI_Output (self, other,"DIA_NASZ_231_Ted_WhatLegends_55_02"); //Je�li to prawda, to by� mo�� znajd� tu jakie� zapiski o konkretnych zwierz�tach, co znacznie u�atwi mi polowanie.
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
	description = "Mo�e spr�bujemy ubi� par� trolli?";
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
	AI_Output (other, self,"DIA_NASZ_231_Ted_GoTrolls_15_00"); //Mo�e spr�bujemy ubi� par� trolli?
	AI_Output (self, other,"DIA_NASZ_231_Ted_GoTrolls_55_01"); //Czemu nie? We dw�ch mo�emy zaryzykowa�.
	AI_Output (self, other,"DIA_NASZ_231_Ted_GoTrolls_55_02"); //Chod�, obstrzelamy te monstra i przebijemy si� do wie�y mag�w!

	Log_CreateTopic (TOPIC_Ted_trolls, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ted_trolls, LOG_RUNNING);
	B_LogEntry (TOPIC_Ted_trolls, "Natkn��em si� na Teda przed ruinami klasztoru za palisad�. My�liwy liczy, �e pozna tu nowe sposoby na polowanie. Przeszkod� s� tutaj pot�ne trolle.");

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
	AI_Output (self, other,"DIA_NASZ_231_Ted_Krata_15_00"); //Oczywi�cie... Zamkni�te!
	AI_Output (self, other,"DIA_NASZ_231_Ted_Krata_55_01"); //Gdzie� w okolicy musi by� prze��cznik otwieraj�cy t� krat�.
	AI_Output (other, self,"DIA_NASZ_231_Ted_Krata_55_02"); //Tak, tak, jasne. Id� go poszuka�.
	AI_Output (self, other,"DIA_NASZ_231_Ted_Krata_55_03"); //Tylko si� nie zgub!
	
	B_LogEntry (TOPIC_Ted_trolls, "Zamiast drzwi, magowie widocznie u�ywali bram... Musz� znale�� jaki� spos�b �eby otworzy� t� tutaj do wie�y.");

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

	AI_Output (self, other,"DIA_NASZ_231_Ted_DidIt_15_00"); //Uda�o ci si�!
	AI_Output (other, self,"DIA_NASZ_231_Ted_DidIt_55_01"); //Czemu nie wszed�e� do �rodka?
	AI_Output (self, other,"DIA_NASZ_231_Ted_DidIt_55_02"); //Nie by�em pewien, czy mnie znajdziesz.
	AI_Output (other, self,"DIA_NASZ_231_Ted_DidIt_55_03"); //W�a�, w�a�. Zajrz� do ciebie p�niej.
	
	B_LogEntry (TOPIC_Ted_trolls, "Zajrz� za jaki� czas do Teda. Ciekawe, czy znajdzie co� ciekawego?");

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
	AI_Output (self, other,"DIA_NASZ_231_Ted_AndHow_55_01"); //Ta ksi�ga jest unikatowa! S� tutaj zapiski o r�nych zwierz�tach. Zostan� tutaj i przestudiuj� j� dok�adnie.
	AI_Output (self, other,"DIA_NASZ_231_Ted_AndHow_55_02"); //Dzi�ki za pomoc! W nagrod� dam ci kilka ognistych strza�.
	AI_Output (self, other,"DIA_NASZ_231_Ted_AndHow_55_03"); //Przydadz� si� na co� r�wnie wielkiego jak troll.

	Createinvitems (self, ItNa_OgnistaStrzala, 60);
	B_giveinvitems (self, other, ItNa_OgnistaStrzala, 60);
	
	DodajReputacje(4,REP_MYSLIWI);
	
	B_GivePlayerXP (500);
	Log_SetTopicStatus (TOPIC_Ted_trolls, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ted_trolls, "Ted znalaz� to czego szuka�. Dobrze, �e nie obesz�o si� bez nagrody.");

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
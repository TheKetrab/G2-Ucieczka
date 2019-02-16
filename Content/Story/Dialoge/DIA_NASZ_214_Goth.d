var int Goth_Open_OneTime;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_EXIT   (C_INFO)
{
	npc         = NASZ_214_Goth;
	nr          = 999;
	condition   = DIA_NASZ_214_Goth_EXIT_Condition;
	information = DIA_NASZ_214_Goth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_214_Goth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_214_Goth_EXIT_Info()
{
	if (Goth_Open_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_214_Goth_exit_15_00"); //Otworzy� bram�!
		GateMysliwi_Open();
		GateMysliwiOpenedFirstTime = TRUE;
		Goth_Open_OneTime = TRUE;
		Npc_ExchangeRoutine (self,"Start");
	
	};
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_siema   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 1;
 	condition   = DIA_NASZ_214_Goth_siema_Condition;
 	information = DIA_NASZ_214_Goth_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_214_Goth_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_214_Goth_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_15_00"); //Wchodz�c do tego obozu pami�taj, �eby nie sprawia� k�opot�w.
	AI_Output (other,self ,"DIA_NASZ_214_Goth_siema_15_01"); //Jeste� my�liwym?
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_55_02"); //Tak dok�adniej, to jestem stra�nikiem obozu my�liwych. Zw� mnie Goth.
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_55_03"); //Pilnuj�, by �aden stw�r ani parszywy �owca ork�w nie zbli�y� si� do nas.
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_55_04"); //A ty? Kim jeste� i jak si� tu znalaz�e�?
	AI_Output (other,self ,"DIA_NASZ_214_Goth_siema_15_05"); //By�em kopaczem, ale uciek�em, by rozejrze� si� po okolicy.
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_55_06"); //No dobra, mo�esz wchodzi�.
};

//*********************************************************************
//	Info HelloLutnia
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_HelloLutnia   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 2;
 	condition   = DIA_NASZ_214_Goth_HelloLutnia_Condition;
 	information = DIA_NASZ_214_Goth_HelloLutnia_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_214_Goth_HelloLutnia_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_104_Engor_IllTakeYou))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_HelloLutnia_Info()
{
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_15_00"); //Zn�w w naszych skromnych progach?
	AI_Output (other,self ,"DIA_NASZ_214_Goth_HelloLutnia_15_01"); //Tak si� z�o�y�o. Szukam kogo� w waszym obozie. Mo�esz mi pom�c?
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_55_02"); //Przynie� mi kawa� pieczystego od Snafa, a powiem ci wszystko, co wiem.
	AI_Output (other, self,"DIA_NASZ_214_Goth_HelloLutnia_55_03"); //Nie mo�esz sam po to p�j��?
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_55_04"); //Dobre sobie, a kto pilnowa�by wtedy bramy do obozu? Jedna chwila nieuwagi, a ze�r� nas z�bacze czy inne plugastwa �yj�ce w lesie.
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_15_05"); //Nie mog� si� st�d ruszy�, bo inaczej Gestath urwie mi �eb. Ty pomo�esz mnie, a ja tobie. Uczciwa wymiana, nie s�dzisz?
	AI_Output (other, self,"DIA_NASZ_214_Goth_HelloLutnia_55_06"); //Nigdzie si� st�d nie ruszaj, zaraz wracam.
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_55_07"); //Haha! Bardzo zabawne, �artownisiu!

	B_LogEntry (TOPIC_Engor_lutnia, "Oczywi�cie, aby dowiedzie� si� kto mo�e mi wykona� lutni�, musz� pobawi� si� w ch�opca na posy�ki. Tym razem musz� przynie�� mi�so dla Gotha, bo inaczej nie powie mi, kim jest tajemniczy jegomo��.");
};

//*********************************************************************
//	Info HavePieczyste
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_HavePieczyste   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 3;
 	condition   = DIA_NASZ_214_Goth_HavePieczyste_Condition;
 	information = DIA_NASZ_214_Goth_HavePieczyste_Info;
 	permanent   = FALSE;
 	description = "Masz to swoje pieczyste!";
};

FUNC INT DIA_NASZ_214_Goth_HavePieczyste_Condition()
{
	if(npc_hasitems(other,ItNa_PieczenDlaGotha)>=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_HavePieczyste_Info()
{
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_15_00"); //Masz to swoje pieczyste!
	B_GiveInvItems(other,self,ItNa_PieczenDlaGotha,1);
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_01"); //Naprawd� by�e� u Snafa? Niezmiernie ci dzi�kuj�. Wybacz tak�e za moj� zgry�liwo��, jednak ci�g�e stanie w bramie i gapienie si� w drzewa mo�e doprowadzi� cz�owieka do wariactwa.
	CreateInvItems(self,ItFoMutton,1);
	B_UseItem(self,ItFoMutton);
	Npc_RemoveInvItems(self,ItNa_PieczenDlaGotha,1);
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_02"); //Wyborne, nie ma to jak ciep�e, ociekaj�ce t�uszczykiem mi�sko. Jeszcze raz dzi�kuje.
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_03"); //Dotrzyma�e� swojej cz�ci umowy, teraz ja dotrzymam swojego s�owa. O co chcia�e� zapyta�?
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_55_04"); //Szukam kogo�, kto zna si� na wyrobie lutni i by�by w stanie wykona� dla mnie taki instrument. Trop przywi�d� mnie do waszego obozu.
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_55_05"); //Mo�esz mi powiedzie�, gdzie on jest?
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_06"); //Pewnie masz na my�li Jehena. Owszem, mieszka u nas, ale obecnie nie ma go w obozie. Dwa dni temu uda� si� na polowanie.
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_55_07"); //�wietnie, a wiesz, kiedy wr�ci?
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_08"); //Ci�ko to okre�li�. On jako nieliczny potrafi przepada� bez s�owa na wiele dni, aby potem wr�ci� z mas� trofe�w i mi�sa.
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_09"); //Na twoim miejscu bym go poszuka�, zacznij od jego obozu przy prze��czy. Wiesz, w kt�r� to stron�?
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_55_10"); //Oczywi�cie, dzi�ki za wskaz�wk�.
	
	B_StartOtherRoutine(NASZ_232_Jehen,"Start");
	
	Log_CreateTopic (TOPIC_Jehen_strzala, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jehen_strzala, LOG_RUNNING);
	B_LogEntry (TOPIC_Jehen_strzala, "Poszukiwany przeze mnie my�liwy uda� si� na polowanie w kierunku prze��czy G�rniczej Doliny. Mam nadzieje, �e nadal b�dzie w swoim obozie, albowiem poszukiwanie jednego cz�owieka w tym miejscu b�dzie graniczy�o z niemo�liwo�ci�.");

};

//*********************************************************************
//	Info Sytuacja
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_sytuacja   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 2;
 	condition   = DIA_NASZ_214_Goth_sytuacja_Condition;
 	information = DIA_NASZ_214_Goth_sytuacja_Info;
 	permanent   = FALSE;
 	description = "Co mo�esz mi powiedzie� o sytuacji w Dolinie?";
};

FUNC INT DIA_NASZ_214_Goth_sytuacja_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_214_Goth_sytuacja_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_sytuacja_15_00"); //Co mo�esz mi powiedzie� o sytuacji w Dolinie?
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_01"); //Tak wi�c, tu znajduje si� ob�z my�liwych. Nie zale�y nam zbytnio na odzyskaniu zamku. Mo�na �mia�o powiedzie�, �e u�ywamy sobie �ycia, ile tylko mo�emy.
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_02"); //Ka�dego dnia jemy obrzydliwie obfite posi�ki, �remy mi�so i popijamy piwem. Co lepszego nam zosta�o? Jeste�my uwi�zieni w dawnej Kolonii Karnej.
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_03"); //Jedyne, czego tu brakuje, to kobiet. I to nie jednej - przynajmniej dziesi�ciu!
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_04"); //Jesli jednak chcesz wiedzie� wi�cej na temat tego, co si� sta�o z paladynami odsy�am ci� do �owc�w ork�w.
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_05"); //Ci idioci chwal� si� tym na prawo i na lewo.
};

//*********************************************************************
//	Info Lowcy
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_lowcy   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 3;
 	condition   = DIA_NASZ_214_Goth_lowcy_Condition;
 	information = DIA_NASZ_214_Goth_lowcy_Info;
 	permanent   = FALSE;
 	description = "Czemu tak nie znosisz �owc�w ork�w?";
};

FUNC INT DIA_NASZ_214_Goth_lowcy_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_sytuacja))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_lowcy_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_lowcy_15_00"); //Czemu tak nie znosisz �owc�w ork�w?
	AI_Output (self, other,"DIA_NASZ_214_Goth_lowcy_55_01"); //Nie tak dawno temu skrzadziono nam wszystkie trofea! S� zwyk�ymi rabusiami.
	AI_Output (other,self ,"DIA_NASZ_214_Goth_lowcy_15_02"); //Ale� to dawni rycerze. Jakim cudem mogli dokona� rabunku?
	AI_Output (self, other,"DIA_NASZ_214_Goth_lowcy_55_03"); //Pr�cz rycerzy, do �owc�w ork�w nale�� te� bandyci, kt�rzy zamieszkiwali G�rnicz� Dolin�. Ta grupa ludzi to zbieranina t�pych osi�k�w.
	AI_Output (self, other,"DIA_NASZ_214_Goth_lowcy_55_04"); //To w�a�nie oni s� odpowiedzialni za kradzie� naszych zdobyczy.

};

//*********************************************************************
//	Info Kradziez
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_kradziez   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 4;
 	condition   = DIA_NASZ_214_Goth_kradziez_Condition;
 	information = DIA_NASZ_214_Goth_kradziez_Info;
 	permanent   = FALSE;
 	description = "Co dok�adnie ukradli?";
};

FUNC INT DIA_NASZ_214_Goth_kradziez_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_lowcy))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_kradziez_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_kradziez_15_00"); //Co dok�adnie ukradli?
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_01"); //Troch� wilczych sk�r, sk�r warg�w i ko�o 20 flaszek piwa!
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_02"); //To� to rozb�j! Jakby tego by�o ma�o, zabrali nam tak�e �uki i miecze.
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_03"); //Ale �uki to niech sobie maj�. Codziennie wykonujemy ze trzy nowe. Gorzej z mieczami.
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_04"); //Tak mi�dzy nami, to Dobar nie jest najlepszym kowalem. Dobrze radzi sobie z wyrobem grot�w, ale tamte miecze by�y po prostu �wietne.
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_05"); //Cappel i Chris zabrali je z zamkowego arsena�u przed wymarszem paladyn�w. Szkoda mi tych ostrzy.
};

//*********************************************************************
//	         Zadanie 
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_zadanie   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 5;
 	condition   = DIA_NASZ_214_Goth_zadanie_Condition;
 	information = DIA_NASZ_214_Goth_zadanie_Info;
 	permanent   = FALSE;
 	description = "Przynios� ci zrabowane rzeczy.";
};

FUNC INT DIA_NASZ_214_Goth_zadanie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_kradziez))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_zadanie_15_00"); //Przynios� ci zrabowane rzeczy.
	AI_Output (self, other,"DIA_NASZ_214_Goth_zadanie_55_01"); //Naprawd�? 
	AI_Output (other,self ,"DIA_NASZ_214_Goth_zadanie_15_02"); //Oczywi�cie, tylko powiedz co dok�adnie chcesz dosta�.
	AI_Output (self, other,"DIA_NASZ_214_Goth_zadanie_55_03"); //No dobra, to jeszcze raz: 10 wilczych sk�r, 5 sk�r warg�w, 20 butelek piwa i paczk� mieczy jednor�cznych.
	AI_Output (self, other,"DIA_NASZ_214_Goth_zadanie_55_04"); //Wyniuchaj te�, kto jest odpowiedzialny za kradzie� i daj mu nauczk�!

	Log_CreateTopic (TOPIC_Goth_kradziez, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Goth_kradziez, LOG_RUNNING);
	B_LogEntry (TOPIC_Goth_kradziez, "Goth poprosi� mnie, �ebym przyni�s� mu zrabowane przez �owc�w ork�w trofea: 10 wilczych sk�r, 5 sk�r warg�w, 20 butelek piwa i paczk� mieczy jednor�cznych. Przy okazji mam dowiedzie� si�, kto jest za wszystko odpowiedzialny i da� mu nauczk�.");

};


//*********************************************************************
//	         Koniec zadania
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_finish   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 6;
 	condition   = DIA_NASZ_214_Goth_finish_Condition;
 	information = DIA_NASZ_214_Goth_finish_Info;
 	permanent   = FALSE;
 	description = "Za�atwione!";
};

FUNC INT DIA_NASZ_214_Goth_finish_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_102_Lens_zadanie) 
	&& npc_hasitems (other, ItAt_WolfFur) >= 10
	&& npc_hasitems (other, ItAt_WargFur) >= 5
	&& npc_hasitems (other, ItFo_Beer) >= 20
	&& npc_hasitems (other, ItNa_PaczkaGoth) >= 1
	&& npc_isdead (NASZ_102_Lens))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_finish_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_finish_15_00"); //Za�atwione!
	B_giveinvitems (other, self, itfo_beer, 20);
	B_giveinvitems (other, self, ItAt_WargFur, 5);
	B_giveinvitems (other, self, ItAt_WolfFur, 10);
	B_giveinvitems (other, self, ItNa_PaczkaGoth, 1);
	AI_Output (self, other,"DIA_NASZ_214_Goth_finish_55_01"); //�wietnie! Powiedz, kto by� za wszystko odpowiedzialny?
	AI_Output (other,self ,"DIA_NASZ_214_Goth_finish_15_02"); //To cz�owiek imieniem Lens.
	AI_Output (self, other,"DIA_NASZ_214_Goth_finish_55_03"); //Mam nadziej�, �e zosta� ukarany.
	AI_Output (other,self ,"DIA_NASZ_214_Goth_finish_15_04"); //Nie martw si�. Ten rabu� ju� gryzie ziemi�.
	AI_Output (self, other,"DIA_NASZ_214_Goth_finish_55_05"); //Nie chcia�bym by� na jego miejscu. Jednak niew�tpliwie zas�u�y� sobie na to. Jeste� po��dnym cz�owiekiem. Twoje zdrowie!
	B_UseItem (self,ItFo_Beer);
	AI_Output (self, other,"DIA_NASZ_214_Goth_finish_55_06"); //Oto i twoja nagroda. Trzymaj.

	Createinvitems (self, itmi_gold, 140);
	B_giveinvitems (self, other, itmi_gold, 140);
	B_LogEntry (TOPIC_Goth_kradziez, "Odda�em Gothowi skradzione rzeczy.");
	Log_SetTopicStatus (TOPIC_Goth_kradziez, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (4, REP_MYSLIWI);
};

var int GothSaidAboutTeacher;
//*********************************************************************
//	Info Teach
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_teach   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 7;
 	condition   = DIA_NASZ_214_Goth_teach_Condition;
 	information = DIA_NASZ_214_Goth_teach_Info;
 	permanent   = TRUE;
 	description = "Kto mo�e mnie tu czego� nauczy�?";
};

FUNC INT DIA_NASZ_214_Goth_teach_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_214_Goth_teach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_teach_15_00"); //Kto mo�e mnie tu czego� nauczy�?
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_01"); //My�liwemu potrzebna jest lekka klinga lub ostry sztylet oraz dobry �uk.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_02"); //Walki broni� nauczy ci� Louis. Skubany strasznie du�o walczy� szablami, zreszt� tak tutaj trafi�.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_03"); //Je�li chcesz nauczy� si� strzela�, to powiniene� zg�osi� si� do k�rego� ze stra�nik�w.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_04"); //Zazwyczaj wszyscy s� zaj�ci, ale ostatnio chyba Kivo nic nie robi. Mo�e stworzysz mu w ko�cu okazj� do okazania si� bardziej po�ytecznym?
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_05"); //Zawitaj te� u Ratforda.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_06"); //Je�li chodzi o patroszenie zwierzyny to Chris jest niezast�piony.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_07"); //Ewentualnie Vachut, ale on zadomowi� si� w pobli�u �owc�w ork�w. Ten to dopiero zna si� na rzeczy!

	GothSaidAboutTeacher = TRUE;
};

//*********************************************************************
//	Info Straz
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_straz   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 8;
 	condition   = DIA_NASZ_214_Goth_straz_Condition;
 	information = DIA_NASZ_214_Goth_straz_Info;
 	permanent   = TRUE;
 	description = "Jak tam na stra�y?";
};

FUNC INT DIA_NASZ_214_Goth_straz_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_214_Goth_straz_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_straz_15_00"); //Jak tam na stra�y?
	AI_Output (self, other,"DIA_NASZ_214_Goth_straz_55_01"); //Nie mog� narzeka�. Najwa�niejsze, �e mam co je�� i pi�, a w okolicy nie dzieje si� nic strasznego.

};

//*********************************************************************
//	Draal
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_draal   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 9;
 	condition   = DIA_NASZ_214_Goth_draal_Condition;
 	information = DIA_NASZ_214_Goth_draal_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_214_Goth_draal_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_lets))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_draal_Info()
{

	AI_Output (self, other,"DIA_NASZ_214_Goth_draal_55_00"); //A kog� to przyprowadzi�e�?
	AI_Output (other, self,"DIA_NASZ_214_Goth_draal_15_01"); //To Draal, kopacz. Ale twierdzi, �e potrafi strzela� z �uku.
	AI_Output (self, other,"DIA_NASZ_214_Goth_draal_55_02"); //Powiedz mu, �eby uda� si� do Gestatha. Jestem pewien, �e tw�j znajomy si� nam przyda.

	Npc_ExchangeRoutine (self, "Start"); // bo do tej pory ma Wait4Draal
	
	Log_SetTopicStatus (TOPIC_draal, LOG_SUCCESS);
	B_LogEntry (TOPIC_draal, "Przyprowadzi�em skaza�ca do my�liwych.");

	B_GivePlayerXP (300);
	DodajReputacje (3, REP_MYSLIWI);
};

//*********************************************************************
//	PresjaCzasu
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_PresjaCzasu   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 9;
 	condition   = DIA_NASZ_214_Goth_PresjaCzasu_Condition;
 	information = DIA_NASZ_214_Goth_PresjaCzasu_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_214_Goth_PresjaCzasu_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_PresjaCzasu))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_PresjaCzasu_Info()
{

	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_00"); //Przybywasz w sam� por�! W�a�nie potrzebujemy jakiego� silnego �owc� ork�w.
	AI_Output (other, self,"DIA_NASZ_214_Goth_PresjaCzasu_15_01"); //Orkowie maj� was na celowniku! Zamierzaj� napa�� na wasz ob�z.
	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_02"); //M�j drogi... Ju� to zrobili. Par� chwil temu oddzia� ork�w wy�oni� si� zza rogu i uderzy�. Zamkn�li�my oczywi�cie bram�, by ostrzeliwa� ich z g�ry.
	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_03"); //Ale jak na z�o��, Dick obudzi� si� i wyskoczy� ze swojego ��ka jednemu orkowi prosto na g�ow�!
	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_04"); //Zdezorientowane dzikusy wzi�y go ze sob� i powlek�y gdzie�.
	AI_Output (other, self,"DIA_NASZ_214_Goth_PresjaCzasu_55_05"); //Czemu nie wys�ali�cie za nim nikogo od razu?
	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_06"); //A niby kogo? Wszyscy stra�nicy zaj�ci s� swoimi sprawami. My, zwykli my�liwi, nie rzucimy si� przecie� w pogo� za orkami!
	AI_Output (other, self,"DIA_NASZ_214_Goth_PresjaCzasu_55_07"); //W takim razie ja si� tym zajm�.
	
	Npc_ExchangeRoutine (self, "Start"); // bo do tej pory ma Wait4Draal
	
	B_LogEntry (TOPIC_Udar_presja, "Troszk� si� sp�ni�em. My�liwi zostali chwil� temu zaatakowani i zabrali ze sob� Dicka. Musz� znale�� grupk� ork�w i odbi� na�ogowego palacza ziela. Niepowinni by� daleko, skoro min�o tak niewiele czasu.");

	Wld_InsertNpc(OrcWarrior_Roam,"FP_DICK_ORC_1");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_DICK_ORC_2");
	Wld_InsertNpc(OrcScout,"FP_DICK_ORC_3");

	AI_Teleport(NASZ_219_Dick,"NASZ_DICK_SIT");
	B_StartOtherRoutine(NASZ_219_Dick,"Orc");
	
	NASZ_219_Dick.guild = GIL_FRIENDLY_ORC;
	Npc_SetTrueGuild (NASZ_219_Dick, GIL_FRIENDLY_ORC);
	
	
	
};







//*********************************************************************
//	Undeads
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_Undeads   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 10;
 	condition   = DIA_NASZ_214_Goth_Undeads_Condition;
 	information = DIA_NASZ_214_Goth_Undeads_Info;
 	permanent   = FALSE;
 	important	= TRUE;
};

FUNC INT DIA_NASZ_214_Goth_Undeads_Condition()
{
	if (KAPITEL >= 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_Undeads_Info()
{

	AI_Output (self, other,"DIA_NASZ_214_Goth_Undeads_55_00"); //Chwa�a niech b�dzie bogom! Nawet nie chc� wiedzie�, co mog�oby si� sta�, gdyby� nam nie pom�g�!
	AI_Output (other, self,"DIA_NASZ_214_Goth_Undeads_55_01"); //Co tu si� dzieje do cholery? Sk�d wzi�y si� te szkielety i dlaczego zaatakowa�y wasz ob�z?
	AI_Output (self, other,"DIA_NASZ_214_Goth_Undeads_55_02"); //Ostatnio podzia�o si� do�� sporo dziwnych rzeczy. W G�rniczej Dolinie wsz�dzie pe�no demon�w i obrzydliwych zombie. Jakby tego by�o ma�o pojawi�y si� jeszcze zmutowane bestie.
	AI_Output (self, other,"DIA_NASZ_214_Goth_Undeads_55_03"); //Niestety nikt z nas nie wie co si� dzieje. �aden z nas nie spodziewa� si� te� ataku na nasz ob�z!
	AI_Output (self, other,"DIA_NASZ_214_Goth_Undeads_55_04"); //Czym pr�dzej udaj si� do Eraka. On zdecydowanie powie ci wi�cej na temat naszej felernej sytuacji.

	B_LogEntry (TOPIC_Sprawy,"Cholera! Ob�z my�liwych zosta� zaatakowany przez nieumar�ych. Keroloth mia� racj� ze swoim przeczuciem, i� ci potrzebuj� naszej pomocy. Erak mo�e powiedzie� mi o tym wi�cej.");
};


//*********************************************************************
//	Plaskowyz
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_plaskowyz   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 10;
 	condition   = DIA_NASZ_214_Goth_plaskowyz_Condition;
 	information = DIA_NASZ_214_Goth_plaskowyz_Info;
 	permanent   = FALSE;
 	description = "Wspomnia�e� co� o zmutowanych bestiach. O co chodzi?";
};

FUNC INT DIA_NASZ_214_Goth_plaskowyz_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_214_Goth_Undeads))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_plaskowyz_Info()
{

	AI_Output (other, self,"DIA_NASZ_214_Goth_plaskowyz_55_00"); //Wspomnia�e� co� o zmutowanych bestiach. O co chodzi?
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_01"); //Jehen w�a�nie wr�ci� z polowania w okolicach prze��czy i powiedzia� mi co� niewiarygodnego.
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_02"); //Twierdzi, �e widzia� stado gigantycznych bestii. Trolle s� wi�ksze ni� te zwyk�e. Bestie szybsze i sprawniejsze.
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_03"); //To prawdziwa wyl�garnia z�a. Prawdopodobnie, gdy magowie wywo�ywali to swoje trz�sienie ziemi, skumulowana energia trafi�a kilka bestii, kt�re rozszala�y si� i teraz grasuj� w g�rach.
	AI_Output (other, self,"DIA_NASZ_214_Goth_plaskowyz_55_04"); //Gdzie dok�adnie jest to miejsce? 
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_05"); //Nad opuszczon� kopalni�, gdzie kiedy� da�o si� przedosta� do Khorinis.
	AI_Output (other, self,"DIA_NASZ_214_Goth_plaskowyz_55_06"); //By�em w tamtych okolicach i nie zauwa�y�em �adnego giganta...
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_07"); //Mo�liwe, �e nie tyle ma to wsp�lnego z trz�sieniem wywo�anym przez mag�w, co z tymi wszystkimi demonami. A mo�e nawet z wyp�dzeniem ork�w z zamku?
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_08"); //Przyczyna jest nieistotna. Wa�ne, �e pojawi�a si� szansa na zdobycie sk�ry pot�nego czarnego g�rskiego trolla. Mutanta. Giganta, olbrzyma.

};

//*********************************************************************
//	MayMe
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_mayme   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 11;
 	condition   = DIA_NASZ_214_Goth_mayme_Condition;
 	information = DIA_NASZ_214_Goth_mayme_Info;
 	permanent   = FALSE;
 	description = "Jak rozumiem, mam przynie�� ci t� sk�r�?";
};

FUNC INT DIA_NASZ_214_Goth_mayme_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_plaskowyz))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_mayme_Info()
{

	AI_Output (other, self,"DIA_NASZ_214_Goth_mayme_55_00"); //Jak rozumiem, mam przynie�� ci t� sk�r�?
	AI_Output (self, other,"DIA_NASZ_214_Goth_mayme_15_01"); //Oczywi�cie! Przecie� dlatego ci o tym wszystkim m�wi�.
	AI_Output (other, self,"DIA_NASZ_214_Goth_mayme_55_02"); //A co ja b�d� z tego mia�?
	AI_Output (self, other,"DIA_NASZ_214_Goth_mayme_55_03"); //Chwa�� i szacunek w�r�d my�liwych? Zastanowi� si� nad cen� sk�ry.
	
	Log_CreateTopic (TOPIC_Goth_plaskowyz, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Goth_plaskowyz, LOG_RUNNING);
	B_LogEntry (TOPIC_Goth_plaskowyz, "Na prze��czy G�rniczej Doliny znajduje si� p�askowy�, na kt�rym z niewiadomych przyczyn pojawi�y si� gigantyczne bestie. Dok�adniej to miejsce jest w g�rach nad opuszczon� kopalni�, kt�r� niegdy� mo�na by�o przedosta� si� do Khorinis. Goth jest zainteresowany sk�r� gigantycznego czarnego trolla i zap�aci za ni� spor� sumk�. Warto by by�o jednak ubi� wszystkie stwory stamt�d, cho�by dla zdobycia szacunku i w�asnej satysfakcji.");

	MissionPlaskowyzRunning = TRUE;
};

//*********************************************************************
//	SellFur
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_SellFur   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 12;
 	condition   = DIA_NASZ_214_Goth_SellFur_Condition;
 	information = DIA_NASZ_214_Goth_SellFur_Info;
 	permanent   = FALSE;
 	description = "Mam tu sk�r� trolla giganta.";
};

FUNC INT DIA_NASZ_214_Goth_SellFur_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_mayme))
	&& (npc_hasitems (other, ItNa_GigantSkora) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_SellFur_Info()
{

	AI_Output (other, self,"DIA_NASZ_214_Goth_SellFur_55_00"); //Mam tu sk�r� trolla giganta.
	B_Giveinvitems (other, self, ItNa_GigantSkora, 1);
	AI_Output (self, other,"DIA_NASZ_214_Goth_SellFur_15_01"); //Mia�em si� zastanowi�... Dam ci 350 sztuk z�ota.
	AI_Output (self, other,"DIA_NASZ_214_Goth_SellFur_55_02"); //Trzymaj.
	Createinvitems (self, ItMi_Gold, 350);
	B_Giveinvitems (self, other, ItMi_Gold, 350);
	
	Log_SetTopicStatus (TOPIC_Goth_plaskowyz, LOG_SUCCESS);
	MissionPlaskowyzRunning = FALSE;
	B_GivePlayerXP (500);
	DodajReputacje (2, REP_MYSLIWI);
};



//*********************************************************************
//	KilledGigant
//*********************************************************************
INSTANCE DIA_NASZ_214_Goth_KilledGigant   (C_INFO)
{
	npc         = NASZ_214_Goth;
 	nr          = 13;
 	condition   = DIA_NASZ_214_Goth_KilledGigant_Condition;
 	information = DIA_NASZ_214_Goth_KilledGigant_Info;
 	permanent   = FALSE;
 	description = "Zabi�em wszystkie bestie na p�askowy�u.";
};

FUNC INT DIA_NASZ_214_Goth_KilledGigant_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_mayme))
	&& (npc_isdead (Troll_Black_Plaskowyz))
	&& (npc_isdead (BlackGobboGigant1))
	&& (npc_isdead (BlackGobboGigant2))
	&& (npc_isdead (BlackGobboGigant3))
	&& (npc_isdead (Harpy_Gigant))
	&& (npc_isdead (OrcBiterGigant1))
	&& (npc_isdead (OrcBiterGigant2))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_214_Goth_KilledGigant_Info()
{

	AI_Output (other, self,"DIA_NASZ_214_Goth_KilledGigant_55_00"); //Zabi�em wszystkie bestie na p�askowy�u.
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_mayme)) {
		AI_Output (self, other,"DIA_NASZ_214_Goth_KilledGigant_15_01"); //Wszystkie? Naprawd� jeste� wielkim wojownikiem.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_214_Goth_KilledGigant_15_02"); //Je�li to prawda to za�atw mi sk�r� trolla giganta. Ju� zapomnia�e�?
	};

	B_GivePlayerXP (300);
	DodajReputacje (2, REP_MYSLIWI);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_214_Goth_PICKPOCKET (C_INFO)
{
	npc			= NASZ_214_Goth;
	nr			= 900;
	condition	= DIA_NASZ_214_Goth_PICKPOCKET_Condition;
	information	= DIA_NASZ_214_Goth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_214_Goth_PICKPOCKET_Condition()
{
	C_Beklauen (44);
};
 
FUNC VOID DIA_NASZ_214_Goth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_214_Goth_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_214_Goth_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_214_Goth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_214_Goth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_214_Goth_PICKPOCKET_DoIt);
};

func void DIA_NASZ_214_Goth_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Arrow,47);
	
	Info_ClearChoices (DIA_NASZ_214_Goth_PICKPOCKET);
};
	
func void DIA_NASZ_214_Goth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_214_Goth_PICKPOCKET);
};
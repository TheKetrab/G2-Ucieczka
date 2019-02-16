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
		AI_Output (self, other,"DIA_NASZ_214_Goth_exit_15_00"); //Otworzyæ bramê!
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
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_15_00"); //Wchodz¹c do tego obozu pamiêtaj, ¿eby nie sprawiaæ k³opotów.
	AI_Output (other,self ,"DIA_NASZ_214_Goth_siema_15_01"); //Jesteœ myœliwym?
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_55_02"); //Tak dok³adniej, to jestem stra¿nikiem obozu myœliwych. Zw¹ mnie Goth.
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_55_03"); //Pilnujê, by ¿aden stwór ani parszywy ³owca orków nie zbli¿y³ siê do nas.
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_55_04"); //A ty? Kim jesteœ i jak siê tu znalaz³eœ?
	AI_Output (other,self ,"DIA_NASZ_214_Goth_siema_15_05"); //By³em kopaczem, ale uciek³em, by rozejrzeæ siê po okolicy.
	AI_Output (self, other,"DIA_NASZ_214_Goth_siema_55_06"); //No dobra, mo¿esz wchodziæ.
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
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_15_00"); //Znów w naszych skromnych progach?
	AI_Output (other,self ,"DIA_NASZ_214_Goth_HelloLutnia_15_01"); //Tak siê z³o¿y³o. Szukam kogoœ w waszym obozie. Mo¿esz mi pomóc?
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_55_02"); //Przynieœ mi kawa³ pieczystego od Snafa, a powiem ci wszystko, co wiem.
	AI_Output (other, self,"DIA_NASZ_214_Goth_HelloLutnia_55_03"); //Nie mo¿esz sam po to pójœæ?
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_55_04"); //Dobre sobie, a kto pilnowa³by wtedy bramy do obozu? Jedna chwila nieuwagi, a ze¿r¹ nas zêbacze czy inne plugastwa ¿yj¹ce w lesie.
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_15_05"); //Nie mogê siê st¹d ruszyæ, bo inaczej Gestath urwie mi ³eb. Ty pomo¿esz mnie, a ja tobie. Uczciwa wymiana, nie s¹dzisz?
	AI_Output (other, self,"DIA_NASZ_214_Goth_HelloLutnia_55_06"); //Nigdzie siê st¹d nie ruszaj, zaraz wracam.
	AI_Output (self, other,"DIA_NASZ_214_Goth_HelloLutnia_55_07"); //Haha! Bardzo zabawne, ¿artownisiu!

	B_LogEntry (TOPIC_Engor_lutnia, "Oczywiœcie, aby dowiedzieæ siê kto mo¿e mi wykonaæ lutniê, muszê pobawiæ siê w ch³opca na posy³ki. Tym razem muszê przynieœæ miêso dla Gotha, bo inaczej nie powie mi, kim jest tajemniczy jegomoœæ.");
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
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_01"); //Naprawdê by³eœ u Snafa? Niezmiernie ci dziêkujê. Wybacz tak¿e za moj¹ zgryŸliwoœæ, jednak ci¹g³e stanie w bramie i gapienie siê w drzewa mo¿e doprowadziæ cz³owieka do wariactwa.
	CreateInvItems(self,ItFoMutton,1);
	B_UseItem(self,ItFoMutton);
	Npc_RemoveInvItems(self,ItNa_PieczenDlaGotha,1);
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_02"); //Wyborne, nie ma to jak ciep³e, ociekaj¹ce t³uszczykiem miêsko. Jeszcze raz dziêkuje.
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_03"); //Dotrzyma³eœ swojej czêœci umowy, teraz ja dotrzymam swojego s³owa. O co chcia³eœ zapytaæ?
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_55_04"); //Szukam kogoœ, kto zna siê na wyrobie lutni i by³by w stanie wykonaæ dla mnie taki instrument. Trop przywiód³ mnie do waszego obozu.
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_55_05"); //Mo¿esz mi powiedzieæ, gdzie on jest?
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_06"); //Pewnie masz na myœli Jehena. Owszem, mieszka u nas, ale obecnie nie ma go w obozie. Dwa dni temu uda³ siê na polowanie.
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_55_07"); //Œwietnie, a wiesz, kiedy wróci?
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_08"); //Ciê¿ko to okreœliæ. On jako nieliczny potrafi przepadaæ bez s³owa na wiele dni, aby potem wróciæ z mas¹ trofeów i miêsa.
	AI_Output (self, other,"DIA_NASZ_214_Goth_HavePieczyste_55_09"); //Na twoim miejscu bym go poszuka³, zacznij od jego obozu przy prze³êczy. Wiesz, w któr¹ to stronê?
	AI_Output (other, self,"DIA_NASZ_214_Goth_HavePieczyste_55_10"); //Oczywiœcie, dziêki za wskazówkê.
	
	B_StartOtherRoutine(NASZ_232_Jehen,"Start");
	
	Log_CreateTopic (TOPIC_Jehen_strzala, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jehen_strzala, LOG_RUNNING);
	B_LogEntry (TOPIC_Jehen_strzala, "Poszukiwany przeze mnie myœliwy uda³ siê na polowanie w kierunku prze³êczy Górniczej Doliny. Mam nadzieje, ¿e nadal bêdzie w swoim obozie, albowiem poszukiwanie jednego cz³owieka w tym miejscu bêdzie graniczy³o z niemo¿liwoœci¹.");

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
 	description = "Co mo¿esz mi powiedzieæ o sytuacji w Dolinie?";
};

FUNC INT DIA_NASZ_214_Goth_sytuacja_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_214_Goth_sytuacja_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_sytuacja_15_00"); //Co mo¿esz mi powiedzieæ o sytuacji w Dolinie?
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_01"); //Tak wiêc, tu znajduje siê obóz myœliwych. Nie zale¿y nam zbytnio na odzyskaniu zamku. Mo¿na œmia³o powiedzieæ, ¿e u¿ywamy sobie ¿ycia, ile tylko mo¿emy.
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_02"); //Ka¿dego dnia jemy obrzydliwie obfite posi³ki, ¿remy miêso i popijamy piwem. Co lepszego nam zosta³o? Jesteœmy uwiêzieni w dawnej Kolonii Karnej.
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_03"); //Jedyne, czego tu brakuje, to kobiet. I to nie jednej - przynajmniej dziesiêciu!
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_04"); //Jesli jednak chcesz wiedzieæ wiêcej na temat tego, co siê sta³o z paladynami odsy³am ciê do ³owców orków.
	AI_Output (self, other,"DIA_NASZ_214_Goth_sytuacja_55_05"); //Ci idioci chwal¹ siê tym na prawo i na lewo.
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
 	description = "Czemu tak nie znosisz ³owców orków?";
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
	AI_Output (other,self ,"DIA_NASZ_214_Goth_lowcy_15_00"); //Czemu tak nie znosisz ³owców orków?
	AI_Output (self, other,"DIA_NASZ_214_Goth_lowcy_55_01"); //Nie tak dawno temu skrzadziono nam wszystkie trofea! S¹ zwyk³ymi rabusiami.
	AI_Output (other,self ,"DIA_NASZ_214_Goth_lowcy_15_02"); //Ale¿ to dawni rycerze. Jakim cudem mogli dokonaæ rabunku?
	AI_Output (self, other,"DIA_NASZ_214_Goth_lowcy_55_03"); //Prócz rycerzy, do ³owców orków nale¿¹ te¿ bandyci, którzy zamieszkiwali Górnicz¹ Dolinê. Ta grupa ludzi to zbieranina têpych osi³ków.
	AI_Output (self, other,"DIA_NASZ_214_Goth_lowcy_55_04"); //To w³aœnie oni s¹ odpowiedzialni za kradzie¿ naszych zdobyczy.

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
 	description = "Co dok³adnie ukradli?";
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
	AI_Output (other,self ,"DIA_NASZ_214_Goth_kradziez_15_00"); //Co dok³adnie ukradli?
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_01"); //Trochê wilczych skór, skór wargów i ko³o 20 flaszek piwa!
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_02"); //To¿ to rozbój! Jakby tego by³o ma³o, zabrali nam tak¿e ³uki i miecze.
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_03"); //Ale ³uki to niech sobie maj¹. Codziennie wykonujemy ze trzy nowe. Gorzej z mieczami.
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_04"); //Tak miêdzy nami, to Dobar nie jest najlepszym kowalem. Dobrze radzi sobie z wyrobem grotów, ale tamte miecze by³y po prostu œwietne.
	AI_Output (self, other,"DIA_NASZ_214_Goth_kradziez_55_05"); //Cappel i Chris zabrali je z zamkowego arsena³u przed wymarszem paladynów. Szkoda mi tych ostrzy.
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
 	description = "Przyniosê ci zrabowane rzeczy.";
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
	AI_Output (other,self ,"DIA_NASZ_214_Goth_zadanie_15_00"); //Przyniosê ci zrabowane rzeczy.
	AI_Output (self, other,"DIA_NASZ_214_Goth_zadanie_55_01"); //Naprawdê? 
	AI_Output (other,self ,"DIA_NASZ_214_Goth_zadanie_15_02"); //Oczywiœcie, tylko powiedz co dok³adnie chcesz dostaæ.
	AI_Output (self, other,"DIA_NASZ_214_Goth_zadanie_55_03"); //No dobra, to jeszcze raz: 10 wilczych skór, 5 skór wargów, 20 butelek piwa i paczkê mieczy jednorêcznych.
	AI_Output (self, other,"DIA_NASZ_214_Goth_zadanie_55_04"); //Wyniuchaj te¿, kto jest odpowiedzialny za kradzie¿ i daj mu nauczkê!

	Log_CreateTopic (TOPIC_Goth_kradziez, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Goth_kradziez, LOG_RUNNING);
	B_LogEntry (TOPIC_Goth_kradziez, "Goth poprosi³ mnie, ¿ebym przyniós³ mu zrabowane przez ³owców orków trofea: 10 wilczych skór, 5 skór wargów, 20 butelek piwa i paczkê mieczy jednorêcznych. Przy okazji mam dowiedzieæ siê, kto jest za wszystko odpowiedzialny i daæ mu nauczkê.");

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
 	description = "Za³atwione!";
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
	AI_Output (other,self ,"DIA_NASZ_214_Goth_finish_15_00"); //Za³atwione!
	B_giveinvitems (other, self, itfo_beer, 20);
	B_giveinvitems (other, self, ItAt_WargFur, 5);
	B_giveinvitems (other, self, ItAt_WolfFur, 10);
	B_giveinvitems (other, self, ItNa_PaczkaGoth, 1);
	AI_Output (self, other,"DIA_NASZ_214_Goth_finish_55_01"); //Œwietnie! Powiedz, kto by³ za wszystko odpowiedzialny?
	AI_Output (other,self ,"DIA_NASZ_214_Goth_finish_15_02"); //To cz³owiek imieniem Lens.
	AI_Output (self, other,"DIA_NASZ_214_Goth_finish_55_03"); //Mam nadziejê, ¿e zosta³ ukarany.
	AI_Output (other,self ,"DIA_NASZ_214_Goth_finish_15_04"); //Nie martw siê. Ten rabuœ ju¿ gryzie ziemiê.
	AI_Output (self, other,"DIA_NASZ_214_Goth_finish_55_05"); //Nie chcia³bym byæ na jego miejscu. Jednak niew¹tpliwie zas³u¿y³ sobie na to. Jesteœ po¿¹dnym cz³owiekiem. Twoje zdrowie!
	B_UseItem (self,ItFo_Beer);
	AI_Output (self, other,"DIA_NASZ_214_Goth_finish_55_06"); //Oto i twoja nagroda. Trzymaj.

	Createinvitems (self, itmi_gold, 140);
	B_giveinvitems (self, other, itmi_gold, 140);
	B_LogEntry (TOPIC_Goth_kradziez, "Odda³em Gothowi skradzione rzeczy.");
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
 	description = "Kto mo¿e mnie tu czegoœ nauczyæ?";
};

FUNC INT DIA_NASZ_214_Goth_teach_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_214_Goth_teach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_teach_15_00"); //Kto mo¿e mnie tu czegoœ nauczyæ?
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_01"); //Myœliwemu potrzebna jest lekka klinga lub ostry sztylet oraz dobry ³uk.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_02"); //Walki broni¹ nauczy ciê Louis. Skubany strasznie du¿o walczy³ szablami, zreszt¹ tak tutaj trafi³.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_03"); //Jeœli chcesz nauczyæ siê strzelaæ, to powinieneœ zg³osiæ siê do kóregoœ ze stra¿ników.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_04"); //Zazwyczaj wszyscy s¹ zajêci, ale ostatnio chyba Kivo nic nie robi. Mo¿e stworzysz mu w koñcu okazjê do okazania siê bardziej po¿ytecznym?
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_05"); //Zawitaj te¿ u Ratforda.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_06"); //Jeœli chodzi o patroszenie zwierzyny to Chris jest niezast¹piony.
	AI_Output (self, other,"DIA_NASZ_214_Goth_teach_55_07"); //Ewentualnie Vachut, ale on zadomowi³ siê w pobli¿u ³owców orków. Ten to dopiero zna siê na rzeczy!

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
 	description = "Jak tam na stra¿y?";
};

FUNC INT DIA_NASZ_214_Goth_straz_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_214_Goth_straz_Info()
{
	AI_Output (other,self ,"DIA_NASZ_214_Goth_straz_15_00"); //Jak tam na stra¿y?
	AI_Output (self, other,"DIA_NASZ_214_Goth_straz_55_01"); //Nie mogê narzekaæ. Najwa¿niejsze, ¿e mam co jeœæ i piæ, a w okolicy nie dzieje siê nic strasznego.

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

	AI_Output (self, other,"DIA_NASZ_214_Goth_draal_55_00"); //A kogó¿ to przyprowadzi³eœ?
	AI_Output (other, self,"DIA_NASZ_214_Goth_draal_15_01"); //To Draal, kopacz. Ale twierdzi, ¿e potrafi strzelaæ z ³uku.
	AI_Output (self, other,"DIA_NASZ_214_Goth_draal_55_02"); //Powiedz mu, ¿eby uda³ siê do Gestatha. Jestem pewien, ¿e twój znajomy siê nam przyda.

	Npc_ExchangeRoutine (self, "Start"); // bo do tej pory ma Wait4Draal
	
	Log_SetTopicStatus (TOPIC_draal, LOG_SUCCESS);
	B_LogEntry (TOPIC_draal, "Przyprowadzi³em skazañca do myœliwych.");

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

	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_00"); //Przybywasz w sam¹ porê! W³aœnie potrzebujemy jakiegoœ silnego ³owcê orków.
	AI_Output (other, self,"DIA_NASZ_214_Goth_PresjaCzasu_15_01"); //Orkowie maj¹ was na celowniku! Zamierzaj¹ napaœæ na wasz obóz.
	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_02"); //Mój drogi... Ju¿ to zrobili. Parê chwil temu oddzia³ orków wy³oni³ siê zza rogu i uderzy³. Zamknêliœmy oczywiœcie bramê, by ostrzeliwaæ ich z góry.
	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_03"); //Ale jak na z³oœæ, Dick obudzi³ siê i wyskoczy³ ze swojego ³ó¿ka jednemu orkowi prosto na g³owê!
	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_04"); //Zdezorientowane dzikusy wziê³y go ze sob¹ i powlek³y gdzieœ.
	AI_Output (other, self,"DIA_NASZ_214_Goth_PresjaCzasu_55_05"); //Czemu nie wys³aliœcie za nim nikogo od razu?
	AI_Output (self, other,"DIA_NASZ_214_Goth_PresjaCzasu_55_06"); //A niby kogo? Wszyscy stra¿nicy zajêci s¹ swoimi sprawami. My, zwykli myœliwi, nie rzucimy siê przecie¿ w pogoñ za orkami!
	AI_Output (other, self,"DIA_NASZ_214_Goth_PresjaCzasu_55_07"); //W takim razie ja siê tym zajmê.
	
	Npc_ExchangeRoutine (self, "Start"); // bo do tej pory ma Wait4Draal
	
	B_LogEntry (TOPIC_Udar_presja, "Troszkê siê spóŸni³em. Myœliwi zostali chwilê temu zaatakowani i zabrali ze sob¹ Dicka. Muszê znaleŸæ grupkê orków i odbiæ na³ogowego palacza ziela. Niepowinni byæ daleko, skoro minê³o tak niewiele czasu.");

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

	AI_Output (self, other,"DIA_NASZ_214_Goth_Undeads_55_00"); //Chwa³a niech bêdzie bogom! Nawet nie chcê wiedzieæ, co mog³oby siê staæ, gdybyœ nam nie pomóg³!
	AI_Output (other, self,"DIA_NASZ_214_Goth_Undeads_55_01"); //Co tu siê dzieje do cholery? Sk¹d wziê³y siê te szkielety i dlaczego zaatakowa³y wasz obóz?
	AI_Output (self, other,"DIA_NASZ_214_Goth_Undeads_55_02"); //Ostatnio podzia³o siê doœæ sporo dziwnych rzeczy. W Górniczej Dolinie wszêdzie pe³no demonów i obrzydliwych zombie. Jakby tego by³o ma³o pojawi³y siê jeszcze zmutowane bestie.
	AI_Output (self, other,"DIA_NASZ_214_Goth_Undeads_55_03"); //Niestety nikt z nas nie wie co siê dzieje. ¯aden z nas nie spodziewa³ siê te¿ ataku na nasz obóz!
	AI_Output (self, other,"DIA_NASZ_214_Goth_Undeads_55_04"); //Czym prêdzej udaj siê do Eraka. On zdecydowanie powie ci wiêcej na temat naszej felernej sytuacji.

	B_LogEntry (TOPIC_Sprawy,"Cholera! Obóz myœliwych zosta³ zaatakowany przez nieumar³ych. Keroloth mia³ racjê ze swoim przeczuciem, i¿ ci potrzebuj¹ naszej pomocy. Erak mo¿e powiedzieæ mi o tym wiêcej.");
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
 	description = "Wspomnia³eœ coœ o zmutowanych bestiach. O co chodzi?";
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

	AI_Output (other, self,"DIA_NASZ_214_Goth_plaskowyz_55_00"); //Wspomnia³eœ coœ o zmutowanych bestiach. O co chodzi?
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_01"); //Jehen w³aœnie wróci³ z polowania w okolicach prze³êczy i powiedzia³ mi coœ niewiarygodnego.
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_02"); //Twierdzi, ¿e widzia³ stado gigantycznych bestii. Trolle s¹ wiêksze ni¿ te zwyk³e. Bestie szybsze i sprawniejsze.
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_03"); //To prawdziwa wylêgarnia z³a. Prawdopodobnie, gdy magowie wywo³ywali to swoje trzêsienie ziemi, skumulowana energia trafi³a kilka bestii, które rozszala³y siê i teraz grasuj¹ w górach.
	AI_Output (other, self,"DIA_NASZ_214_Goth_plaskowyz_55_04"); //Gdzie dok³adnie jest to miejsce? 
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_05"); //Nad opuszczon¹ kopalni¹, gdzie kiedyœ da³o siê przedostaæ do Khorinis.
	AI_Output (other, self,"DIA_NASZ_214_Goth_plaskowyz_55_06"); //By³em w tamtych okolicach i nie zauwa¿y³em ¿adnego giganta...
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_07"); //Mo¿liwe, ¿e nie tyle ma to wspólnego z trzêsieniem wywo³anym przez magów, co z tymi wszystkimi demonami. A mo¿e nawet z wypêdzeniem orków z zamku?
	AI_Output (self, other,"DIA_NASZ_214_Goth_plaskowyz_55_08"); //Przyczyna jest nieistotna. Wa¿ne, ¿e pojawi³a siê szansa na zdobycie skóry potê¿nego czarnego górskiego trolla. Mutanta. Giganta, olbrzyma.

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
 	description = "Jak rozumiem, mam przynieœæ ci tê skórê?";
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

	AI_Output (other, self,"DIA_NASZ_214_Goth_mayme_55_00"); //Jak rozumiem, mam przynieœæ ci tê skórê?
	AI_Output (self, other,"DIA_NASZ_214_Goth_mayme_15_01"); //Oczywiœcie! Przecie¿ dlatego ci o tym wszystkim mówiê.
	AI_Output (other, self,"DIA_NASZ_214_Goth_mayme_55_02"); //A co ja bêdê z tego mia³?
	AI_Output (self, other,"DIA_NASZ_214_Goth_mayme_55_03"); //Chwa³ê i szacunek wœród myœliwych? Zastanowiê siê nad cen¹ skóry.
	
	Log_CreateTopic (TOPIC_Goth_plaskowyz, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Goth_plaskowyz, LOG_RUNNING);
	B_LogEntry (TOPIC_Goth_plaskowyz, "Na prze³êczy Górniczej Doliny znajduje siê p³askowy¿, na którym z niewiadomych przyczyn pojawi³y siê gigantyczne bestie. Dok³adniej to miejsce jest w górach nad opuszczon¹ kopalni¹, któr¹ niegdyœ mo¿na by³o przedostaæ siê do Khorinis. Goth jest zainteresowany skór¹ gigantycznego czarnego trolla i zap³aci za ni¹ spor¹ sumkê. Warto by by³o jednak ubiæ wszystkie stwory stamt¹d, choæby dla zdobycia szacunku i w³asnej satysfakcji.");

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
 	description = "Mam tu skórê trolla giganta.";
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

	AI_Output (other, self,"DIA_NASZ_214_Goth_SellFur_55_00"); //Mam tu skórê trolla giganta.
	B_Giveinvitems (other, self, ItNa_GigantSkora, 1);
	AI_Output (self, other,"DIA_NASZ_214_Goth_SellFur_15_01"); //Mia³em siê zastanowiæ... Dam ci 350 sztuk z³ota.
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
 	description = "Zabi³em wszystkie bestie na p³askowy¿u.";
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

	AI_Output (other, self,"DIA_NASZ_214_Goth_KilledGigant_55_00"); //Zabi³em wszystkie bestie na p³askowy¿u.
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_mayme)) {
		AI_Output (self, other,"DIA_NASZ_214_Goth_KilledGigant_15_01"); //Wszystkie? Naprawdê jesteœ wielkim wojownikiem.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_214_Goth_KilledGigant_15_02"); //Jeœli to prawda to za³atw mi skórê trolla giganta. Ju¿ zapomnia³eœ?
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
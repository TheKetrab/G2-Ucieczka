//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_EXIT   (C_INFO)
{
	npc         = NASZ_118_Ferros;
	nr          = 999;
	condition   = DIA_NASZ_118_Ferros_EXIT_Condition;
	information = DIA_NASZ_118_Ferros_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_118_Ferros_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_118_Ferros_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_siema   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 1;
 	condition   = DIA_NASZ_118_Ferros_siema_Condition;
 	information = DIA_NASZ_118_Ferros_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_118_Ferros_siema_Condition()
{
	if (Npc_IsInState (self, ZS_Talk)) && !(Kurgan_walka==3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_siema_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_siema_55_01"); //Nazywam siê Feros. By³em ³owc¹ smoków. Przyby³em z Myrtany w poszukiwaniu nowego celu w ¿yciu.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_siema_55_02"); //Widocznie los tak chcia³, ¿e teraz jestem w jednej dziurze z potê¿n¹ armi¹ orków.
};

//*********************************************************************
//	Info CanYouTeach
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_CanYouTeach   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 2;
 	condition   = DIA_NASZ_118_Ferros_CanYouTeach_Condition;
 	information = DIA_NASZ_118_Ferros_CanYouTeach_Info;
 	permanent   = FALSE;
 	description = "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_NASZ_118_Ferros_CanYouTeach_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_118_Ferros_CanYouTeach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_CanYouTeach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_CanYouTeach_55_01"); //Prawdziwy wojownik powinien po prostu umieæ przywaliæ.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_CanYouTeach_55_02"); //Jeœli chcesz, mogê pomóc ci w treningu si³owym.

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Feros pomo¿e mi popracowaæ nad si³¹.");
};

//*********************************************************************
//	Info Need
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_need   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 3;
 	condition   = DIA_NASZ_118_Ferros_need_Condition;
 	information = DIA_NASZ_118_Ferros_need_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_118_Ferros_need_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_siema))
	&& (KAPITEL >= 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_need_Info()
{
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_15_00"); //Hej, jesteœ. Mam do ciebie proœbê.
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_need_15_01"); //O co chodzi, Feros?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_55_02"); //Gdybyœ podczas swoich podró¿y natkn¹³ siê na pewien zwój, to chcia³bym go dostaæ. Chodzi o SPECJALNE zaklêcie œwiat³a: œwiêty p³omieñ. To stary czar paladynów.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_need_55_03"); //Po co ci takie zaklêcie? Nie wystarczy zwyk³y zwój czaru œwiat³a?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_55_04"); //Magia paladynów upad³a. Ich magiczne runy przesta³y dzia³aæ i mo¿liwe, ¿e magiczne zwoje zostan¹ jedyn¹ pami¹tk¹ po paladynach. Kto wie, jak¹ wartoœæ bêd¹ mia³y te zwoje za dziesiêæ lat?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_55_05"); //Poza tym chcê siê im dok³adnie przyjrzeæ. Zebra³em ju¿ wiêkszoœæ z nich i pozosta³ w³aœnie œwiêty p³omieñ.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_need_55_06"); //Nie wiesz, gdzie takie zaklêcie mo¿e siê podziewaæ?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_55_07"); //Nie mam pojêcia. Rycerze byli w Górniczej Dolinie na d³ugo przed stworzeniem bariery. Mo¿e powinieneœ poszukaæ w pobli¿u platform, przy których by³a tworzona bariera?
	AI_Output (other, self,"DIA_NASZ_118_Ferros_need_55_08"); //Jeœli gdzieœ znajdê taki zwój, to mo¿esz byæ pewien, ¿e go nie wykorzystam, tylko ci przyniosê.	
	
	Log_CreateTopic (TOPIC_Ferros_plomien, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ferros_plomien, LOG_RUNNING);
	B_LogEntry (TOPIC_Ferros_plomien, "Po zniszczeniu magii paladynów, Feros zdecydowa³ siê zebraæ kolekcjê ich czarów zapisanych na zwojach. Brakuje mu 'œwiêtego p³omienia', którego odszukania siê podj¹³em. £owca orków s¹dzi, ¿e warto rozejrzeæ siê po terenach, z których wznosi³a siê bariera. By³y one przecie¿ ochraniane przez paladynów i mo¿e znajdê tam jakieœ zwoje?");

};

//*********************************************************************
//	Info NeedEnd
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_NeedEnd   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 4;
 	condition   = DIA_NASZ_118_Ferros_NeedEnd_Condition;
 	information = DIA_NASZ_118_Ferros_NeedEnd_Info;
 	permanent   = FALSE;
 	description = "Znalaz³em ten zwój.";
};

FUNC INT DIA_NASZ_118_Ferros_NeedEnd_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_need))
	&& (npc_hasitems (other, ItSc_PalLight) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_NeedEnd_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_NeedEnd_15_00"); //Znalaz³em ten zwój.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_NeedEnd_55_01"); //Poka¿.
	B_giveinvitems (other, self, ItSc_PalLight, 1);
	Npc_RemoveInvItems(self,ItSc_PalLight,1);
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_118_Ferros_NeedEnd_55_02"); //To ten! Teraz moja kolekcja jest pe³na!
	AI_Output (self, other,"DIA_NASZ_118_Ferros_NeedEnd_55_03"); //Dziêki. Przyjmij te mikstury w nagrodê.

	Createinvitems (self, ItPo_Health_03, 3);
	B_giveinvitems (self, other, ItPo_Health_03, 3);
	Createinvitems (self, ItPo_Health_02, 2);
	B_giveinvitems (self, other, ItPo_Health_02, 2);
	Createinvitems (self, ItPo_Health_01, 2);
	B_giveinvitems (self, other, ItPo_Health_01, 2);
	
	DodajReputacje(1,REP_LOWCY);
	B_GivePlayerXP (500);
	Log_SetTopicStatus (TOPIC_Ferros_plomien, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ferros_plomien, "Przynios³em Ferosowi zaklêcie.");

};

//*********************************************************************
//	Info PodkrazoneOczy
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_PodkrazoneOczy   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 5;
 	condition   = DIA_NASZ_118_Ferros_PodkrazoneOczy_Condition;
 	information = DIA_NASZ_118_Ferros_PodkrazoneOczy_Info;
 	permanent   = FALSE;
 	description = "Wygl¹dasz, jakbyœ nie spa³ przez tydzieñ.";
};

FUNC INT DIA_NASZ_118_Ferros_PodkrazoneOczy_Condition()
{

		return TRUE;

};

FUNC VOID DIA_NASZ_118_Ferros_PodkrazoneOczy_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_PodkrazoneOczy_15_00"); //Wygl¹dasz, jakbyœ nie spa³ przez tydzieñ.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_01"); //Bardzo œmieszne, ¿artownisiu. Mo¿e zamiast wypominaæ mi oczywiste rzeczy, powiesz coœ, o czym nie wiem.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_02"); //Wybacz, ostatnio jestem strasznie rozdra¿niony. To wszystko przez te przeklête koszmary, jakie nawiedzaj¹ mnie ka¿dej nocy.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_03"); //Nie mogê ju¿ z nimi wytrzymaæ! Gdybyœ widzia³ to, co ja...
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_04"); //Obrazy w mojej g³owie s¹ tak realistyczne, ¿e jestem wrêcz w stanie ich dotkn¹æ.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_05"); //Co konkretnie ci siê œni?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_06"); //Ka¿dej nocy jest dok³adnie tak samo:
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_07"); //Budzê siê poœród ciemnoœci, która przenika umys³ w taki sposób, jakby czyta³a wszystkie moje myœli. Podczas tego wszystkiego stojê na kamiennej p³ycie.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_08"); //Nim zd¹¿ê siê rozejrzeæ wszystko siê rozpada, a ja sam spadam w nieprzeniknion¹ otch³añ, gdzie widzê sylwetki moich martwych towarzyszy.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_09"); //Ich twarze s¹ tak realistyczne, i¿ niemal mogê ich dotkn¹æ.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_10"); //Do teraz widzê ich agonalne twarze. Proszê pomó¿ mi, bo czujê, ¿e ju¿ nied³ugo si¹dzie mi to wszystko na g³owê i zwariujê.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_11"); //Spróbujê ci pomoc, ale nie wiem nawet od czego zacz¹æ. Mo¿e masz jakieœ wskazówki?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_12"); //Hmm... Na twoim miejscu uda³bym siê do alchemika rezyduj¹cego u myœliwych, mo¿e on bêdzie w stanie mi pomóc.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_13"); //Uda³bym siê do niego sam, ale Keroloth kaza³ mi pilnowaæ tego cholernego obozu. Nie interesuj¹ go moje problemy, ani dolegliwoœci.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_14"); //Trzymaj siê, pomoc ju¿ nadchodzi.
	
	Log_CreateTopic (TOPIC_Ferros_sny, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ferros_sny, LOG_RUNNING);
	B_LogEntry (TOPIC_Ferros_sny, "Z powodu koszmarów sennych, Feros nie mo¿e spaæ i czuje, ¿e nied³ugo przez to zwariuje. Zaoferowa³em mu pomoc, zaœ on poleci³ mi udaæ siê do alchemika w obozie myœliwych. Czeka mnie niema³a podró¿.");
};

var int FerrosLekarstwoDay;
//*********************************************************************
//	Info MamLekarstwo
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_MamLekarstwo   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 6;
 	condition   = DIA_NASZ_118_Ferros_MamLekarstwo_Condition;
 	information = DIA_NASZ_118_Ferros_MamLekarstwo_Info;
 	permanent   = FALSE;
 	description = "Mam lekarstwo.";
};

FUNC INT DIA_NASZ_118_Ferros_MamLekarstwo_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_FerrosSnyReady))
	&& (npc_hasitems (other, ItNa_KropleFerros) >= 1)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_MamLekarstwo_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_MamLekarstwo_15_00"); //Mam lekarstwo.
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_MamLekarstwo_15_01"); //Powinieneœ piæ codziennie po trzy krople. Nie wiêcej, bo mo¿e ci siê jeszcze pogorszyæ.
	B_GiveInvItems (other, self, ItNa_KropleFerros, 1);
	Npc_RemoveInvItems(self,ItNa_KropleFerros,1);
	AI_Output (other, self,"DIA_NASZ_118_Ferros_MamLekarstwo_55_02"); //Ponadto, je¿eli rozboli ciê g³owa, to Kirgo poleci³, byœ wypi³ zimne mleko. To pomo¿e ci poradziæ sobie z dzia³aniem leku.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_MamLekarstwo_55_03"); //Jesteœ pewien, ¿e to pomo¿e? Zreszt¹, niewa¿ne, i tak nie mamy innej alternatywy.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_MamLekarstwo_55_04"); //PrzyjdŸ do mnie za trzy dni. Powiem ci, jak siê czujê.
	
	FerrosLekarstwoDay = Wld_GetDay();
	B_LogEntry (TOPIC_Ferros_sny, "Feros poleci³ mi wróciæ do niego za 3 dni. No có¿, czas zaj¹æ siê innymi sprawami.");

};

//*********************************************************************
//	Info HowDoUFeel
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_HowDoUFeel   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 7;
 	condition   = DIA_NASZ_118_Ferros_HowDoUFeel_Condition;
 	information = DIA_NASZ_118_Ferros_HowDoUFeel_Info;
 	permanent   = FALSE;
 	description = "Jak siê czujesz?";
};

FUNC INT DIA_NASZ_118_Ferros_HowDoUFeel_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_MamLekarstwo))
	&& TimeIsUp(3,-1,FerrosLekarstwoDay,-1) // 3day
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_HowDoUFeel_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_HowDoUFeel_15_00"); //Jak siê czujesz?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_HowDoUFeel_15_01"); //Zdecydowanie lepiej, chocia¿ nadal ciê¿ko jest mi siê wyspaæ. Prawdopodobnie to wina dzia³ania eliksiru.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_HowDoUFeel_55_02"); //Mogê mieæ do ciebie ostatni¹ proœbê?
	AI_Output (other, self,"DIA_NASZ_118_Ferros_HowDoUFeel_55_03"); //Oczywiœcie, o co chodzi?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_HowDoUFeel_55_04"); //Jeremiasz ma w swoim asortymencie kilka nalewek, które pomagaj¹ w kwestii snu. Mo¿esz mi tak¹ za³atwiæ? Oczywiœcie oddam ci koszty zakupy.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_HowDoUFeel_55_05"); //Zobaczê, co da siê zrobiæ.

	B_LogEntry (TOPIC_Ferros_sny, "Feros czuje siê ju¿ lepiej, lecz nadal ma k³opoty z zaœniêciem. Rozwi¹zaniem ma byæ nalewka od Jeremiasza.");

};

//*********************************************************************
//	Info MamNalewke
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_MamNalewke   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 8;
 	condition   = DIA_NASZ_118_Ferros_MamNalewke_Condition;
 	information = DIA_NASZ_118_Ferros_MamNalewke_Info;
 	permanent   = FALSE;
 	description = "Mam nalewkê.";
};

FUNC INT DIA_NASZ_118_Ferros_MamNalewke_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_MamLekarstwo))
	&& (npc_hasitems (other, ItNa_NalewkaFerros) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_MamNalewke_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_MamNalewke_15_00"); //Mam nalewkê.
	B_GiveInvItems(other,self,ItNa_NalewkaFerros,1);
	Npc_RemoveInvItems(self,ItNa_NalewkaFerros,1);
	AI_Output (self, other,"DIA_NASZ_118_Ferros_MamNalewke_15_01"); //Ile ciê to kosztowa³o?
	AI_Output (other, self,"DIA_NASZ_118_Ferros_MamNalewke_55_02"); //100 sztuk z³ota. Jeremiasz uprzedzi³ mnie tak¿e, i¿ ma ona potê¿nego kopa.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_MamNalewke_55_03"); //Ha, ha! O to mi w³aœnie chodzi, dziêki ci jeszcze raz. Tutaj masz zwrot kosztów, tak jak siê umawialiœmy i kolejne 100 za sam¹ fatygê.
	
	Createinvitems (self, ItMi_Gold, 200);
	B_giveinvitems (self, other, ItMi_Gold, 200);
	
	if (hero.guild == GIL_NONE) {
		AI_Output (self, other,"DIA_NASZ_118_Ferros_MamNalewke_55_04"); //Powiem Kerolothowi o twojej pomocy, je¿eli chcesz do nas do³¹czyæ, to przyda ci siê ka¿dy g³os.
	};

	DodajReputacje(2,REP_LOWCY);
	B_GivePlayerXP(300);
	Log_SetTopicStatus (TOPIC_Ferros_sny, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ferros_sny, "No tak, przecie¿ najlepiej œpi siê po mocno stê¿onym alkoholu...");

};

//*********************************************************************
//	Info GoToRenegaci
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_GoToRenegaci   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 9;
 	condition   = DIA_NASZ_118_Ferros_GoToRenegaci_Condition;
 	information = DIA_NASZ_118_Ferros_GoToRenegaci_Info;
 	permanent   = FALSE;
	description = "Mamy udaæ siê do Starej Kopalni i pozabijaæ renegatów.";
};

FUNC INT DIA_NASZ_118_Ferros_GoToRenegaci_Condition()	
{
	if (KerolothRenegatOK == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_GoToRenegaci_Info()
{
	AI_Output (other, self,"DIA_NASZ_118_Ferros_GoToRenegaci_15_00"); //Mamy udaæ siê do Starej Kopalni i pozabijaæ renegatów.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_GoToRenegaci_55_01"); //Damy im radê? Ilu nas bêdzie? I w ogóle jak chcesz dostaæ siê do œrodka? Nie bêdziemy przecie¿ taszczyæ ze sob¹ drabin, bo zostaniemy zestrzeleni przy próbie przedarcia siê gór¹.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_GoToRenegaci_55_02"); //Zaatakujemy pod os³on¹ nocy we czterech. Ja, ty, Fed i Kjorn. Keroloth da³ mi zaklêcie przemiany w chrz¹szcza, dziêki któremu przedostanê siê do œrodka i otworzê bramê.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_GoToRenegaci_55_03"); //Hmm... No dobra. Oby nie skoñczy³o siê zbyt krwawo.

	Npc_ExchangeRoutine (self, "FollowRenegaci");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_118_Ferros,1);
};

//*********************************************************************
//	Info RenegaciOnPlace
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_RenegaciOnPlace   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 10;
 	condition   = DIA_NASZ_118_Ferros_RenegaciOnPlace_Condition;
 	information = DIA_NASZ_118_Ferros_RenegaciOnPlace_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_118_Ferros_RenegaciOnPlace_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_GoToRenegaci)) //
	&& (npc_knowsinfo (other, DIA_NASZ_117_Fed_GoToRenegaci))    // jesli pogadales z nimi trzema
	&& (npc_knowsinfo (other, DIA_NASZ_116_Kjorn_GoToRenegaci))  // i sa z toba pod brama
	&& ((Npc_GetDistToWP(hero,"OW_PATH_148_A") < 1000)
	 || (Npc_GetDistToWP(hero,"OW_PATH_264") < 1000))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_RenegaciOnPlace_Info()
{
	var C_NPC Ferros; Ferros = Hlp_GetNpc (NASZ_118_Ferros);
	var C_NPC Kjorn; Kjorn = Hlp_GetNpc (NASZ_116_Kjorn);
	var C_NPC Fed; Fed = Hlp_GetNpc (NASZ_117_Fed);
	
	TRIA_Invite(Ferros);
	TRIA_Invite(Kjorn);
	TRIA_Invite(Fed);
	
    TRIA_Start();
 
	TRIA_Next(Ferros);
	
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_15_00"); //I jesteœmy. Widzisz ju¿ dziurê, któr¹ chcesz siê przedostaæ?
	AI_Output (other, self,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_01"); //Jeszcze nie, muszê przyjrzeæ siê lepiej tym barykadom.
	
	if (Npc_GetDistToWP(hero,"OW_PATH_264") < (Npc_GetDistToWP(hero,"OW_PATH_148_A"))) {
		AI_Output (other, self,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_02"); //Wy oczekujcie przy tej bramie. O ile dobrze pamiêtam, ko³owrót otwiera³ w³aœnie t¹.
	} else {
		AI_Output (other, self,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_03"); //Wy udajcie siê pod drug¹ bramê. Stamt¹d zaatakujecie.
	};
	
	TRIA_Next(Kjorn);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_04"); //Czyli ta misja to atak na kopalniê renegatów? Dobrze, ¿e wczoraj ostrzy³em swój miecz.

	TRIA_Next(Fed);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_05"); //Po drodze zebra³em trochê t³uszczu z bestii i napcha³em do pojemniczka.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_06"); //Myœlê, ¿e mo¿e ci siê przydaæ, w razie gdyby ko³owrót nie chcia³ siê poruszyæ.

	Createinvitems (self, ItMi_Moleratlubric_MIS, 1);
	B_giveinvitems (self, other, ItMi_Moleratlubric_MIS, 1);
	
	AI_Output (other, self,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_07"); //Dziêki.

	TRIA_Next(Ferros);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
		
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_08"); //Zaatakujemy pod os³on¹ nocy. Do tego czasu odpocznijmy trochê.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_09"); //Ty, Willu, idŸ poszukaj szpary miêdzy deskami. A, i najwa¿niejsze: Nie daj siê zdeptaæ, gdy bêdziesz przemieniony w ma³ego owada.
	
	TRIA_Finish();
	
	B_LogEntry(TOPIC_Korth_kopalnia,"Dotarliœmy pod kopalniê. Feros powiedzia³, ¿e zaatakujemy pod os³on¹ nocy. Muszê znaleŸæ jak¹œ szparê, by wejœæ do œrodka. Fed da³ mi te¿ ³ój kretoszczura, ¿ebym móg³ przekrêciæ ko³owrót i otworzyæ bramê ³owcom.");

	Info_ClearChoices (DIA_NASZ_118_Ferros_RenegaciOnPlace);
		Info_AddChoice	  (DIA_NASZ_118_Ferros_RenegaciOnPlace, "KONIEC", DIA_NASZ_118_Ferros_RenegaciOnPlace_end);
};

FUNC VOID DIA_NASZ_118_Ferros_RenegaciOnPlace_end()
{
	AI_StopProcessInfos(self);
	
	RenegaciSetTime_Go = TRUE;
	Fade_Status = 1;
	ff_applyonce(RenegaciSetTime);
	
	Npc_ExchangeRoutine (NASZ_116_Kjorn, "StandRenegaci");
	Npc_ExchangeRoutine (NASZ_117_Fed, "StandRenegaci");
	Npc_ExchangeRoutine (NASZ_118_Ferros, "StandRenegaci");
	
};

//*********************************************************************
//	Arena 
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_arena   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 11;
 	condition   = DIA_NASZ_118_Ferros_arena_Condition;
 	information = DIA_NASZ_118_Ferros_arena_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_118_Ferros_arena_Condition()
{
	if ((Kurgan_walka==3)
		&& Npc_GetDistToWP(self,"NASZ_LOWCY_ARENA_01") < 400
		&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_arena_Info()
{
	AI_Output (self, other,"DIA_NASZ_118_Ferros_arena_55_00"); //Poka¿, co potrafisz.

	FERROS_WALCZY = TRUE;
	Arena_Opuszczasz_Raz = FALSE;
	Arena_Przegrana_Raz = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

//*********************************************************************
//	Teach
//*********************************************************************
INSTANCE DIA_NASZ_118_Ferros_teach   (C_INFO)
{
	npc         = NASZ_118_Ferros;
 	nr          = 100;
 	condition   = DIA_NASZ_118_Ferros_teach_Condition;
 	information = DIA_NASZ_118_Ferros_teach_Info;
 	permanent   = TRUE;
 	description = "Chcê byæ silniejszy.";
};

FUNC INT DIA_NASZ_118_Ferros_teach_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_CanYouTeach))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_118_Ferros_teach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_teach_15_00"); //Chcê byæ silniejszy.
	
	Info_ClearChoices (DIA_NASZ_118_Ferros_Teach);
	
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);
	
	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
	};
};

FUNC VOID DIA_NASZ_118_Ferros_Teach_Back ()
{
	Info_ClearChoices (DIA_NASZ_118_Ferros_Teach);
};

FUNC VOID DIA_NASZ_118_Ferros_Teach_STR_1 ()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, 90);
	
	Info_ClearChoices 	(DIA_NASZ_118_Ferros_Teach);
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);

	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
	};
};


FUNC VOID DIA_NASZ_118_Ferros_Teach_STR_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, 90);
	
	Info_ClearChoices 	(DIA_NASZ_118_Ferros_Teach);
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);

	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
	};
};

FUNC VOID DIA_NASZ_118_Ferros_Teach_STR_1High ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, 90);
	
	Info_ClearChoices 	(DIA_NASZ_118_Ferros_Teach);
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);

	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
	};
};


FUNC VOID DIA_NASZ_118_Ferros_Teach_STR_5High ()
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, 90);
	
	Info_ClearChoices 	(DIA_NASZ_118_Ferros_Teach);
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);

	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si³a + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
	};
};

func void OPEN_RENEGACI_ATTACK_S1() {

	//Print("Funkcja dziala");

	NASZ_006_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_006_Renegat, GIL_BDT);
	
	NASZ_011_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_011_Renegat, GIL_BDT);
	
	NASZ_013_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_013_Renegat, GIL_BDT);
	
	NASZ_014_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_014_Renegat, GIL_BDT);
	
	NASZ_009_Marcos.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_009_Marcos, GIL_BDT);

	NASZ_009_Marcos.flags = 0;
	
	if(!npc_isdead(NASZ_009_Marcos))
	{
		Npc_ExchangeRoutine (NASZ_005_Ben, "After");
		
		if(hero.guild == GIL_DJG) {
			B_StartOtherRoutine(NASZ_118_Ferros,"FightRenegaci");
			B_StartOtherRoutine(NASZ_117_Fed,"FightRenegaci");
			B_StartOtherRoutine(NASZ_116_Kjorn,"FightRenegaci");
		}

		else {
			B_StartOtherRoutine(NASZ_215_Kivo,"FightRenegaci");
			B_StartOtherRoutine(NASZ_217_Louis,"FightRenegaci");
			B_StartOtherRoutine(NASZ_227_Vachut,"FightRenegaci");
		};
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_118_Ferros_PICKPOCKET (C_INFO)
{
	npc			= NASZ_118_Ferros;
	nr			= 900;
	condition	= DIA_NASZ_118_Ferros_PICKPOCKET_Condition;
	information	= DIA_NASZ_118_Ferros_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_118_Ferros_PICKPOCKET_Condition()
{
	C_Beklauen (64);
};
 
FUNC VOID DIA_NASZ_118_Ferros_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_118_Ferros_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_118_Ferros_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_118_Ferros_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_118_Ferros_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_118_Ferros_PICKPOCKET_DoIt);
};

func void DIA_NASZ_118_Ferros_PICKPOCKET_DoIt()
{
	B_BeklauenGold(44);
	Info_ClearChoices (DIA_NASZ_118_Ferros_PICKPOCKET);
};
	
func void DIA_NASZ_118_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_118_Ferros_PICKPOCKET);
};

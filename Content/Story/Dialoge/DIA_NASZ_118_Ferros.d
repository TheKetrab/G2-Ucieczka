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
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_siema_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_siema_55_01"); //Nazywam si� Feros. By�em �owc� smok�w. Przyby�em z Myrtany w poszukiwaniu nowego celu w �yciu.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_siema_55_02"); //Widocznie los tak chcia�, �e teraz jestem w jednej dziurze z pot�n� armi� ork�w.
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
 	description = "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_NASZ_118_Ferros_CanYouTeach_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_118_Ferros_CanYouTeach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_CanYouTeach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_CanYouTeach_55_01"); //Prawdziwy wojownik powinien po prostu umie� przywali�.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_CanYouTeach_55_02"); //Je�li chcesz, mog� pom�c ci w treningu si�owym.

	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Feros pomo�e mi popracowa� nad si��.");
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
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_15_00"); //Hej, jeste�. Mam do ciebie pro�b�.
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_need_15_01"); //O co chodzi, Feros?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_55_02"); //Gdyby� podczas swoich podr�y natkn�� si� na pewien zw�j, to chcia�bym go dosta�. Chodzi o SPECJALNE zakl�cie �wiat�a: �wi�ty p�omie�. To stary czar paladyn�w.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_need_55_03"); //Po co ci takie zakl�cie? Nie wystarczy zwyk�y zw�j czaru �wiat�a?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_55_04"); //Magia paladyn�w upad�a. Ich magiczne runy przesta�y dzia�a� i mo�liwe, �e magiczne zwoje zostan� jedyn� pami�tk� po paladynach. Kto wie, jak� warto�� b�d� mia�y te zwoje za dziesi�� lat?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_55_05"); //Poza tym chc� si� im dok�adnie przyjrze�. Zebra�em ju� wi�kszo�� z nich i pozosta� w�a�nie �wi�ty p�omie�.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_need_55_06"); //Nie wiesz, gdzie takie zakl�cie mo�e si� podziewa�?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_need_55_07"); //Nie mam poj�cia. Rycerze byli w G�rniczej Dolinie na d�ugo przed stworzeniem bariery. Mo�e powiniene� poszuka� w pobli�u platform, przy kt�rych by�a tworzona bariera?
	AI_Output (other, self,"DIA_NASZ_118_Ferros_need_55_08"); //Je�li gdzie� znajd� taki zw�j, to mo�esz by� pewien, �e go nie wykorzystam, tylko ci przynios�.	
	
	Log_CreateTopic (TOPIC_Ferros_plomien, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ferros_plomien, LOG_RUNNING);
	B_LogEntry (TOPIC_Ferros_plomien, "Po zniszczeniu magii paladyn�w, Feros zdecydowa� si� zebra� kolekcj� ich czar�w zapisanych na zwojach. Brakuje mu '�wi�tego p�omienia', kt�rego odszukania si� podj��em. �owca ork�w s�dzi, �e warto rozejrze� si� po terenach, z kt�rych wznosi�a si� bariera. By�y one przecie� ochraniane przez paladyn�w i mo�e znajd� tam jakie� zwoje?");

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
 	description = "Znalaz�em ten zw�j.";
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
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_NeedEnd_15_00"); //Znalaz�em ten zw�j.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_NeedEnd_55_01"); //Poka�.
	B_giveinvitems (other, self, ItSc_PalLight, 1);
	Npc_RemoveInvItems(self,ItSc_PalLight,1);
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_118_Ferros_NeedEnd_55_02"); //To ten! Teraz moja kolekcja jest pe�na!
	AI_Output (self, other,"DIA_NASZ_118_Ferros_NeedEnd_55_03"); //Dzi�ki. Przyjmij te mikstury w nagrod�.

	Createinvitems (self, ItPo_Health_03, 3);
	B_giveinvitems (self, other, ItPo_Health_03, 3);
	Createinvitems (self, ItPo_Health_02, 2);
	B_giveinvitems (self, other, ItPo_Health_02, 2);
	Createinvitems (self, ItPo_Health_01, 2);
	B_giveinvitems (self, other, ItPo_Health_01, 2);
	
	DodajReputacje(1,REP_LOWCY);
	B_GivePlayerXP (500);
	Log_SetTopicStatus (TOPIC_Ferros_plomien, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ferros_plomien, "Przynios�em Ferosowi zakl�cie.");

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
 	description = "Wygl�dasz, jakby� nie spa� przez tydzie�.";
};

FUNC INT DIA_NASZ_118_Ferros_PodkrazoneOczy_Condition()
{

		return TRUE;

};

FUNC VOID DIA_NASZ_118_Ferros_PodkrazoneOczy_Info()
{
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_PodkrazoneOczy_15_00"); //Wygl�dasz, jakby� nie spa� przez tydzie�.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_01"); //Bardzo �mieszne, �artownisiu. Mo�e zamiast wypomina� mi oczywiste rzeczy, powiesz co�, o czym nie wiem.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_02"); //Wybacz, ostatnio jestem strasznie rozdra�niony. To wszystko przez te przekl�te koszmary, jakie nawiedzaj� mnie ka�dej nocy.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_03"); //Nie mog� ju� z nimi wytrzyma�! Gdyby� widzia� to, co ja...
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_04"); //Obrazy w mojej g�owie s� tak realistyczne, �e jestem wr�cz w stanie ich dotkn��.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_05"); //Co konkretnie ci si� �ni?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_06"); //Ka�dej nocy jest dok�adnie tak samo:
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_07"); //Budz� si� po�r�d ciemno�ci, kt�ra przenika umys� w taki spos�b, jakby czyta�a wszystkie moje my�li. Podczas tego wszystkiego stoj� na kamiennej p�ycie.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_08"); //Nim zd��� si� rozejrze� wszystko si� rozpada, a ja sam spadam w nieprzeniknion� otch�a�, gdzie widz� sylwetki moich martwych towarzyszy.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_09"); //Ich twarze s� tak realistyczne, i� niemal mog� ich dotkn��.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_10"); //Do teraz widz� ich agonalne twarze. Prosz� pom� mi, bo czuj�, �e ju� nied�ugo si�dzie mi to wszystko na g�ow� i zwariuj�.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_11"); //Spr�buj� ci pomoc, ale nie wiem nawet od czego zacz��. Mo�e masz jakie� wskaz�wki?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_12"); //Hmm... Na twoim miejscu uda�bym si� do alchemika rezyduj�cego u my�liwych, mo�e on b�dzie w stanie mi pom�c.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_13"); //Uda�bym si� do niego sam, ale Keroloth kaza� mi pilnowa� tego cholernego obozu. Nie interesuj� go moje problemy, ani dolegliwo�ci.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_PodkrazoneOczy_55_14"); //Trzymaj si�, pomoc ju� nadchodzi.
	
	Log_CreateTopic (TOPIC_Ferros_sny, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ferros_sny, LOG_RUNNING);
	B_LogEntry (TOPIC_Ferros_sny, "Z powodu koszmar�w sennych, Feros nie mo�e spa� i czuje, �e nied�ugo przez to zwariuje. Zaoferowa�em mu pomoc, za� on poleci� mi uda� si� do alchemika w obozie my�liwych. Czeka mnie niema�a podr�.");
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
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_MamLekarstwo_15_01"); //Powiniene� pi� codziennie po trzy krople. Nie wi�cej, bo mo�e ci si� jeszcze pogorszy�.
	B_GiveInvItems (other, self, ItNa_KropleFerros, 1);
	Npc_RemoveInvItems(self,ItNa_KropleFerros,1);
	AI_Output (other, self,"DIA_NASZ_118_Ferros_MamLekarstwo_55_02"); //Ponadto, je�eli rozboli ci� g�owa, to Kirgo poleci�, by� wypi� zimne mleko. To pomo�e ci poradzi� sobie z dzia�aniem leku.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_MamLekarstwo_55_03"); //Jeste� pewien, �e to pomo�e? Zreszt�, niewa�ne, i tak nie mamy innej alternatywy.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_MamLekarstwo_55_04"); //Przyjd� do mnie za trzy dni. Powiem ci, jak si� czuj�.
	
	FerrosLekarstwoDay = Wld_GetDay();
	B_LogEntry (TOPIC_Ferros_sny, "Feros poleci� mi wr�ci� do niego za 3 dni. No c�, czas zaj�� si� innymi sprawami.");

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
 	description = "Jak si� czujesz?";
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
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_HowDoUFeel_15_00"); //Jak si� czujesz?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_HowDoUFeel_15_01"); //Zdecydowanie lepiej, chocia� nadal ci�ko jest mi si� wyspa�. Prawdopodobnie to wina dzia�ania eliksiru.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_HowDoUFeel_55_02"); //Mog� mie� do ciebie ostatni� pro�b�?
	AI_Output (other, self,"DIA_NASZ_118_Ferros_HowDoUFeel_55_03"); //Oczywi�cie, o co chodzi?
	AI_Output (self, other,"DIA_NASZ_118_Ferros_HowDoUFeel_55_04"); //Jeremiasz ma w swoim asortymencie kilka nalewek, kt�re pomagaj� w kwestii snu. Mo�esz mi tak� za�atwi�? Oczywi�cie oddam ci koszty zakupy.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_HowDoUFeel_55_05"); //Zobacz�, co da si� zrobi�.

	B_LogEntry (TOPIC_Ferros_sny, "Feros czuje si� ju� lepiej, lecz nadal ma k�opoty z za�ni�ciem. Rozwi�zaniem ma by� nalewka od Jeremiasza.");

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
 	description = "Mam nalewk�.";
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
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_MamNalewke_15_00"); //Mam nalewk�.
	B_GiveInvItems(other,self,ItNa_NalewkaFerros,1);
	Npc_RemoveInvItems(self,ItNa_NalewkaFerros,1);
	AI_Output (self, other,"DIA_NASZ_118_Ferros_MamNalewke_15_01"); //Ile ci� to kosztowa�o?
	AI_Output (other, self,"DIA_NASZ_118_Ferros_MamNalewke_55_02"); //100 sztuk z�ota. Jeremiasz uprzedzi� mnie tak�e, i� ma ona pot�nego kopa.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_MamNalewke_55_03"); //Ha, ha! O to mi w�a�nie chodzi, dzi�ki ci jeszcze raz. Tutaj masz zwrot koszt�w, tak jak si� umawiali�my i kolejne 100 za sam� fatyg�.
	
	Createinvitems (self, ItMi_Gold, 200);
	B_giveinvitems (self, other, ItMi_Gold, 200);
	
	if (hero.guild == GIL_NONE) {
		AI_Output (self, other,"DIA_NASZ_118_Ferros_MamNalewke_55_04"); //Powiem Kerolothowi o twojej pomocy, je�eli chcesz do nas do��czy�, to przyda ci si� ka�dy g�os.
	};

	DodajReputacje(2,REP_LOWCY);
	B_GivePlayerXP(300);
	Log_SetTopicStatus (TOPIC_Ferros_sny, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ferros_sny, "No tak, przecie� najlepiej �pi si� po mocno st�onym alkoholu...");

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
	description = "Mamy uda� si� do Starej Kopalni i pozabija� renegat�w.";
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
	AI_Output (other, self,"DIA_NASZ_118_Ferros_GoToRenegaci_15_00"); //Mamy uda� si� do Starej Kopalni i pozabija� renegat�w.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_GoToRenegaci_55_01"); //Damy im rad�? Ilu nas b�dzie? I w og�le jak chcesz dosta� si� do �rodka? Nie b�dziemy przecie� taszczy� ze sob� drabin, bo zostaniemy zestrzeleni przy pr�bie przedarcia si� g�r�.
	AI_Output (other, self,"DIA_NASZ_118_Ferros_GoToRenegaci_55_02"); //Zaatakujemy pod os�on� nocy we czterech. Ja, ty, Fed i Kjorn. Keroloth da� mi zakl�cie przemiany w chrz�szcza, dzi�ki kt�remu przedostan� si� do �rodka i otworz� bram�.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_GoToRenegaci_55_03"); //Hmm... No dobra. Oby nie sko�czy�o si� zbyt krwawo.

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
	
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_15_00"); //I jeste�my. Widzisz ju� dziur�, kt�r� chcesz si� przedosta�?
	AI_Output (other, self,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_01"); //Jeszcze nie, musz� przyjrze� si� lepiej tym barykadom.
	
	if (Npc_GetDistToWP(hero,"OW_PATH_264") < (Npc_GetDistToWP(hero,"OW_PATH_148_A"))) {
		AI_Output (other, self,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_02"); //Wy oczekujcie przy tej bramie. O ile dobrze pami�tam, ko�owr�t otwiera� w�a�nie t�.
	} else {
		AI_Output (other, self,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_03"); //Wy udajcie si� pod drug� bram�. Stamt�d zaatakujecie.
	};
	
	TRIA_Next(Kjorn);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_04"); //Czyli ta misja to atak na kopalni� renegat�w? Dobrze, �e wczoraj ostrzy�em sw�j miecz.

	TRIA_Next(Fed);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_05"); //Po drodze zebra�em troch� t�uszczu z bestii i napcha�em do pojemniczka.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_06"); //My�l�, �e mo�e ci si� przyda�, w razie gdyby ko�owr�t nie chcia� si� poruszy�.

	Createinvitems (self, ItMi_Moleratlubric_MIS, 1);
	B_giveinvitems (self, other, ItMi_Moleratlubric_MIS, 1);
	
	AI_Output (other, self,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_07"); //Dzi�ki.

	TRIA_Next(Ferros);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
		
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_08"); //Zaatakujemy pod os�on� nocy. Do tego czasu odpocznijmy troch�.
	AI_Output (self, other,"DIA_NASZ_118_Ferros_RenegaciOnPlace_55_09"); //Ty, Willu, id� poszukaj szpary mi�dzy deskami. A, i najwa�niejsze: Nie daj si� zdepta�, gdy b�dziesz przemieniony w ma�ego owada.
	
	TRIA_Finish();
	
	B_LogEntry(TOPIC_Korth_kopalnia,"Dotarli�my pod kopalni�. Feros powiedzia�, �e zaatakujemy pod os�on� nocy. Musz� znale�� jak�� szpar�, by wej�� do �rodka. Fed da� mi te� ��j kretoszczura, �ebym m�g� przekr�ci� ko�owr�t i otworzy� bram� �owcom.");

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
	AI_Output (self, other,"DIA_NASZ_118_Ferros_arena_55_00"); //Poka�, co potrafisz.

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
 	description = "Chc� by� silniejszy.";
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
	AI_Output (other,self ,"DIA_NASZ_118_Ferros_teach_15_00"); //Chc� by� silniejszy.
	
	Info_ClearChoices (DIA_NASZ_118_Ferros_Teach);
	
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);
	
	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
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
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
	};
};


FUNC VOID DIA_NASZ_118_Ferros_Teach_STR_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, 90);
	
	Info_ClearChoices 	(DIA_NASZ_118_Ferros_Teach);
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);

	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
	};
};

FUNC VOID DIA_NASZ_118_Ferros_Teach_STR_1High ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, 90);
	
	Info_ClearChoices 	(DIA_NASZ_118_Ferros_Teach);
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);

	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
	};
};


FUNC VOID DIA_NASZ_118_Ferros_Teach_STR_5High ()
{
	if (hero.lp >= 10){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, 90);
	
	Info_ClearChoices 	(DIA_NASZ_118_Ferros_Teach);
	Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, DIALOG_BACK, DIA_NASZ_118_Ferros_Teach_Back);

	if (other.attribute[ATR_STRENGTH] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_118_Ferros_Teach, "Si�a + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_118_Ferros_Teach_STR_5High); };
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

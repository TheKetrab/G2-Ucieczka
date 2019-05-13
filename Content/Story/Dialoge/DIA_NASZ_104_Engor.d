//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_EXIT   (C_INFO)
{
	npc         = NASZ_104_Engor;
	nr          = 999;
	condition   = DIA_NASZ_104_Engor_EXIT_Condition;
	information = DIA_NASZ_104_Engor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_104_Engor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_104_Engor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_siema   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 1;
 	condition   = DIA_NASZ_104_Engor_siema_Condition;
 	information = DIA_NASZ_104_Engor_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_104_Engor_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_104_Engor_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_104_Engor_siema_55_00"); //Nie widzia�em ci� tu wcze�niej...
	AI_Output (self, other,"DIA_NASZ_104_Engor_siema_55_01"); //Je�li potrzebujesz �ywno�ci lub mikstur, zg�o� si� do mnie.

	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Engor handluje �ywno�ci� i miksturami.");
};


//*********************************************************************
//	Info HelloPiosenka 
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_HelloPiosenka   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 1;
 	condition   = DIA_NASZ_104_Engor_HelloPiosenka_Condition;
 	information = DIA_NASZ_104_Engor_HelloPiosenka_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_104_Engor_HelloPiosenka_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_103_Johny_HelloPiosenka)
	&& (Npc_IsInState(self, ZS_TALK)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_104_Engor_HelloPiosenka_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_HelloPiosenka_55_00"); //Engor, masz chwil�?
	AI_Output (self, other,"DIA_NASZ_104_Engor_HelloPiosenka_55_01"); //26, 27, 29... Co? A, to ty. Czego potrzebujesz?
	AI_Output (other, self,"DIA_NASZ_104_Engor_HelloPiosenka_55_02"); //Jestem tu w imieniu Silasa.
	AI_Output (self, other,"DIA_NASZ_104_Engor_HelloPiosenka_55_03"); //Ciekawe, co tym razem? Jakie� sk�adniki na now�, eksperymentaln� nalewk�?
	AI_Output (other, self,"DIA_NASZ_104_Engor_HelloPiosenka_55_04"); //Chodzi o bardziej przyziemne sprawy, konkretniej o muzyk�. Potrzebujemy kogo�, kto zagra wieczorami na lutni, aby poprawi� nieco nastroje ch�opak�w.
	AI_Output (other, self,"DIA_NASZ_104_Engor_HelloPiosenka_55_05"); //Pocz�tkowo typowali�my Johny'ego, jednak ten przys�a� mnie do ciebie.
	AI_Output (self, other,"DIA_NASZ_104_Engor_HelloPiosenka_55_06"); //I pomy�la� o mnie, to stary dra�! Owszem, potrafi� gra� na lutni, jednak odk�d m�j instrument uleg� zniszczeniu, ca�e dni sp�dzam na liczeniu zapas�w i siedzeniu na �awce.
	AI_Output (self, other,"DIA_NASZ_104_Engor_HelloPiosenka_55_07"); //Nawet jakbym chcia�, to nie mog� wam pom�c. Bez instrumentu wiele nie zdzia�am. Przykro mi.
	
	B_LogEntry (TOPIC_Silas_piosenka, "No tak, mog�em si� tego spodziewa�. Engor straci� sw�j instrument, a co za tym idzie, nie mo�e zagra� w karczmie. Trzeba co� wymy�li�.");
};

//*********************************************************************
//	Info IllTakeYou 
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_IllTakeYou   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 1;
 	condition   = DIA_NASZ_104_Engor_IllTakeYou_Condition;
 	information = DIA_NASZ_104_Engor_IllTakeYou_Info;
 	permanent   = FALSE;
 	description = "A gdybym tak przyni�s� ci lutni�?";
};

FUNC INT DIA_NASZ_104_Engor_IllTakeYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_103_Johny_HelloPiosenka))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_104_Engor_IllTakeYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_IllTakeYou_55_00"); //A gdybym tak przyni�s� ci lutni�?
	AI_Output (other, self,"DIA_NASZ_104_Engor_IllTakeYou_55_01"); //Zgodzi�by� si� wtedy gra� wieczorami w karczmie?
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_02"); //Oczywi�cie. Jednak nie s�dz�, by� znalaz� jak�kolwiek lutni� w tej okolicy.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_03"); //Zapewne wszystkie zosta�y podobne przedmioty zosta�y ju� dawno przerobione na groty be�t�w albo tarcze, czy po prostu spalone, by podtrzyma� ogie�.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_04"); //Poza tym w�tpi�, aby takie rzeczy wala�y si� gdzie� po pod�odze lub innych jaskiniach. Jedynym rozwi�zaniem by�oby stworzy� lutni� od nowa, jednak i z tym mo�e by� k�opot.
	AI_Output (other, self,"DIA_NASZ_104_Engor_IllTakeYou_55_05"); //K�opoty to ju� dla mnie nie pierwszyzna, dam sobie rad�. Powiedz mi tylko, co musz� zrobi�.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_06"); //Dobrze wi�c. Kiedy� do naszego obozu przyby� pewien my�liwy, kt�ry po kilku g��bszych wygada� si�, �e dawniej by� bardzo dobrym lutnikiem.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_07"); //Niestety, nie pami�tam jego imienia. Jednak jak popytasz w obozie my�liwych to na pewno kto� ci pomo�e.
	
	Log_CreateTopic (TOPIC_Engor_lutnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Engor_lutnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Engor_lutnia, "Czas skierowa� swe kroki do obozu my�liwych i poszuka� tam tajemniczego lutnika. Miejmy nadziej�, �e facet jeszcze �yje.");
};

//*********************************************************************
//	Info IHaveLute 
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_IHaveLute   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 4;
 	condition   = DIA_NASZ_104_Engor_IHaveLute_Condition;
 	information = DIA_NASZ_104_Engor_IHaveLute_Info;
 	permanent   = FALSE;
 	description = "Zbieraj si�, dzi� wieczorem dajesz sw�j pierwszy koncert!";
};

FUNC INT DIA_NASZ_104_Engor_IHaveLute_Condition()
{
	if (npc_hasitems(other,ItMi_Lute)>=1)
	&& (LutniaDlaEngora > 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_104_Engor_IHaveLute_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_IHaveLute_55_00"); //Zbieraj si�, dzi� wieczorem dajesz sw�j pierwszy koncert!
	B_GiveInvItems(other, self, ItMi_Lute, 1);
	AI_Output (self, other,"DIA_NASZ_104_Engor_IHaveLute_55_01"); //Nie �artuj! Naprawd� uda�o ci si� zdoby� ten instrument? Czyli ten lutnik �yje?
	AI_Output (other, self,"DIA_NASZ_104_Engor_IHaveLute_55_02"); //Owszem, ale nim do niego dotar�em, musia�em si� sporo nabiega�.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IHaveLute_55_03"); //Oczywi�cie, rozumiem o co ci chodzi. W ramach podzi�kowania mog� ci da� pas, 150 sztuk z�ota lub pi�� ekstrakt�w leczniczych Co wybierasz?

	if (LutniaDlaEngora == 1) { B_GivePlayerXP(50); };
	if (LutniaDlaEngora == 2) { B_GivePlayerXP(150); };
	
	Log_SetTopicStatus (TOPIC_Engor_lutnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Engor_lutnia, "Odda�em lutni� Engorowi.");
	B_GivePlayerXP(300);
	DodajReputacje(2,REP_LOWCY);
	
	Info_ClearChoices (DIA_NASZ_104_Engor_IHaveLute);
		Info_AddChoice	  (DIA_NASZ_104_Engor_IHaveLute, "150 sztuk z�ota.", DIA_NASZ_104_Engor_IHaveLute_Gold);
		Info_AddChoice	  (DIA_NASZ_104_Engor_IHaveLute, "5 ekstrakt�w leczniczych.", DIA_NASZ_104_Engor_IHaveLute_Potion);
		Info_AddChoice	  (DIA_NASZ_104_Engor_IHaveLute, "Pas stalowej r�ki. (Obrona przed broni� i strza�ami: +5)", DIA_NASZ_104_Engor_IHaveLute_Belt);

};

FUNC VOID DIA_NASZ_104_Engor_IHaveLute_Gold()
{

	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	
	Info_ClearChoices (DIA_NASZ_104_Engor_IHaveLute);
};

FUNC VOID DIA_NASZ_104_Engor_IHaveLute_Potion()
{
	CreateInvItems(self,ItPo_Health_02,5);
	B_GiveInvItems(self,other,ItPo_Health_02,5);
	
	Info_ClearChoices (DIA_NASZ_104_Engor_IHaveLute);

};

FUNC VOID DIA_NASZ_104_Engor_IHaveLute_Belt()
{
	CreateInvItems(self,ItNa_PasStalowejReki,1);
	B_GiveInvItems(self,other,ItNa_PasStalowejReki,1);
	
	Info_ClearChoices (DIA_NASZ_104_Engor_IHaveLute);
};




//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_goth   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 2;
 	condition   = DIA_NASZ_104_Engor_goth_Condition;
 	information = DIA_NASZ_104_Engor_goth_Info;
 	permanent   = FALSE;
	description = "Wiesz co� o tym, �eby �owcy okradli my�liwych?";
};

FUNC INT DIA_NASZ_104_Engor_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_104_Engor_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_goth_15_00"); //Wiesz co� o tym, �e �owcy okradli my�liwych?
	AI_Output (self, other,"DIA_NASZ_104_Engor_goth_55_01"); //�owcy? Przecie� jeste�my zgran� paczk�...
	AI_Output (self, other,"DIA_NASZ_104_Engor_goth_55_02"); //Chocia�... Gladiatorzy z areny to banda cudak�w. Mroczne towarzystwo. My�l�, �e je�li kogo� podejrzewa�, to w�a�nie kt�rego� z nich.

	B_LogEntry (TOPIC_Goth_kradziez, "Zdaniem Engora to gladiatorzy maj� co� wsp�lnego z t� kradzie��.");

};

var int CiezkiPancerzLowcyKupiony;
//*********************************************************************
//	Info CiezkiPancerz
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_CiezkiPancerz   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 3;
 	condition   = DIA_NASZ_104_Engor_CiezkiPancerz_Condition;
 	information = DIA_NASZ_104_Engor_CiezkiPancerz_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi zbroj�. (Ci�ki pancerz �owcy ork�w: 600 szt. z�ota)";
};

FUNC INT DIA_NASZ_104_Engor_CiezkiPancerz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_BeALowca) && (hero.guild == GIL_DJG)
		&& (CiezkiPancerzLowcyKupiony == FALSE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_104_Engor_CiezkiPancerz_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_CiezkiPancerz_15_00"); //Sprzedaj mi zbroj�.
	if (npc_hasitems (other, ItMi_Gold) >= 600) {
		if (RepEnough(50,REP_LOWCY)) {
			B_GiveInvItems (other, self, ItMi_Gold, 600);
			Npc_RemoveInvItems   (self, ItMi_Gold, 600);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkiPancerz_55_01"); //Prosz� bardzo!
			Createinvitems (self, ITNA_DJG_M, 1);
			B_Giveinvitems (self, other, ITNA_DJG_M, 1);
			AI_EquipBestArmor (other);
			AI_EquipBestArmor (self);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkiPancerz_55_02"); //Le�y jak ula�.
			AI_Output (other, self,"DIA_NASZ_104_Engor_CiezkiPancerz_55_03"); //Mam nadziej�, �e wcale nie gorzej ochrania.
			CiezkiPancerzLowcyKupiony = TRUE;
		}
		else {
			PrintMissingRep(50,REP_LOWCY);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkiPancerz_55_04"); //Jeszcze nie zas�ugujesz na ten pancerz.
		};
	}
	else {
		AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkiPancerz_55_05"); //Nie masz do�� z�ota.
	};
};

var int CiezkaZbrojaLowcyKupiona;
//*********************************************************************
//	Info CiezkaZbroja
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_CiezkaZbroja   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 4;
 	condition   = DIA_NASZ_104_Engor_CiezkaZbroja_Condition;
 	information = DIA_NASZ_104_Engor_CiezkaZbroja_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi zbroj�. (Ci�ka zbroja �owcy ork�w: 1500 szt. z�ota)";
};

FUNC INT DIA_NASZ_104_Engor_CiezkaZbroja_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_KapThree) && (hero.guild == GIL_DJG)
		&& (CiezkaZbrojaLowcyKupiona == FALSE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_104_Engor_CiezkaZbroja_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_CiezkaZbroja_15_00"); //Sprzedaj mi zbroj�.
	if (npc_hasitems (other, ItMi_Gold) >= 1500) {
		if (RepEnough(80,REP_LOWCY)) {
			B_GiveInvItems (other, self, ItMi_Gold, 1500);
			Npc_RemoveInvItems   (self, ItMi_Gold, 1500);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkaZbroja_55_01"); //Prosz� bardzo!
			Createinvitems (self, ITNA_DJG_S, 1);
			B_Giveinvitems (self, other, ITNA_DJG_S, 1);
			AI_EquipBestArmor (other);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkaZbroja_55_02"); //Doskonale!
			CiezkaZbrojaLowcyKupiona = TRUE;
		}
		else {
			PrintMissingRep(80,REP_LOWCY);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkaZbroja_55_03"); //Jeszcze nie zas�ugujesz na ten pancerz.
		};
	}
	else {
		AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkaZbroja_55_04"); //Nie masz do�� z�ota.
	};
};

//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_Gwozdzie   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 21;
 	condition   = DIA_NASZ_104_Engor_Gwozdzie_Condition;
 	information = DIA_NASZ_104_Engor_Gwozdzie_Info;
 	permanent   = FALSE;
	description = "Nie widzia�e� przypadkiem paczki z gwo�dziami?";
};

FUNC INT DIA_NASZ_104_Engor_Gwozdzie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_Gwozdzie))
	&& (WillKnowGwozdzieThief == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_104_Engor_Gwozdzie_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_Gwozdzie_15_00"); //Nie widzia�e� przypadkiem paczki z gwo�dziami?
	AI_Output (self, other,"DIA_NASZ_104_Engor_Gwozdzie_55_01"); //Paczki z gwo�dziami? Nie, czemu pytasz?
	AI_Output (other, self,"DIA_NASZ_104_Engor_Gwozdzie_15_02"); //Robotnik j� zgubi�, a jej zawarto�� jest mu bardzo potrzebna.
	AI_Output (self, other,"DIA_NASZ_104_Engor_Gwozdzie_55_03"); //Niestety, nie przypominam sobie niczego. Powodzenia w poszukiwaniach.

	B_LogEntry (TOPIC_Robotnik_deski, "Engor nie widzia� paczki.");

};



//*********************************************************************
//	Info Towary
//*********************************************************************
INSTANCE DIA_NASZ_104_Engor_towary   (C_INFO)
{
	npc         = NASZ_104_Engor;
 	nr          = 100;
 	condition   = DIA_NASZ_104_Engor_towary_Condition;
 	information = DIA_NASZ_104_Engor_towary_Info;
 	permanent   = TRUE;
	trade       = TRUE;
 	description = "Poka� mi swoje towary.";
};

FUNC INT DIA_NASZ_104_Engor_towary_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_104_Engor_towary_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_towary_15_00"); //Poka� mi swoje towary.
	AI_Output (self, other,"DIA_NASZ_104_Engor_towary_55_01"); //Wybierz sobie.
	B_GiveTradeInv(self);
};



INSTANCE DIA_NASZ_104_Engor_KurgKan   (C_INFO)
{
	npc         = NASZ_104_Engor;
	nr          = 999;
	condition   = DIA_NASZ_104_Engor_KurgKan_Condition;
	information = DIA_NASZ_104_Engor_KurgKan_Info;
	important 	= true;
};

FUNC INT DIA_NASZ_104_Engor_KurgKan_Condition()
{
	if(KurgKanFollowPC)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_104_Engor_KurgKan_Info()
{
	AI_Output (self, other,"DIA_NASZ_104_Engor_KurgKan_15_00"); //Jestem rozczarowany tob�, Willu.
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_104_Engor_PICKPOCKET (C_INFO)
{
	npc			= NASZ_104_Engor;
	nr			= 900;
	condition	= DIA_NASZ_104_Engor_PICKPOCKET_Condition;
	information	= DIA_NASZ_104_Engor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_104_Engor_PICKPOCKET_Condition()
{
	C_Beklauen (24);
};
 
FUNC VOID DIA_NASZ_104_Engor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_104_Engor_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_104_Engor_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_104_Engor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_104_Engor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_104_Engor_PICKPOCKET_DoIt);
};

func void DIA_NASZ_104_Engor_PICKPOCKET_DoIt()
{
	B_BeklauenThings (ItFo_Beer, 2);
	Info_ClearChoices (DIA_NASZ_104_Engor_PICKPOCKET);
};
	
func void DIA_NASZ_104_Engor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_104_Engor_PICKPOCKET);
};

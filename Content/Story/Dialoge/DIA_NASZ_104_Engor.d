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
	AI_Output (self, other,"DIA_NASZ_104_Engor_siema_55_00"); //Nie widzia³em ciê tu wczeœniej...
	AI_Output (self, other,"DIA_NASZ_104_Engor_siema_55_01"); //Jeœli potrzebujesz ¿ywnoœci lub mikstur, zg³oœ siê do mnie.

	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Engor handluje ¿ywnoœci¹ i miksturami.");
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
	AI_Output (other, self,"DIA_NASZ_104_Engor_HelloPiosenka_55_00"); //Engor, masz chwilê?
	AI_Output (self, other,"DIA_NASZ_104_Engor_HelloPiosenka_55_01"); //26, 27, 29... Co? A, to ty. Czego potrzebujesz?
	AI_Output (other, self,"DIA_NASZ_104_Engor_HelloPiosenka_55_02"); //Jestem tu w imieniu Silasa.
	AI_Output (self, other,"DIA_NASZ_104_Engor_HelloPiosenka_55_03"); //Ciekawe, co tym razem? Jakieœ sk³adniki na now¹, eksperymentaln¹ nalewkê?
	AI_Output (other, self,"DIA_NASZ_104_Engor_HelloPiosenka_55_04"); //Chodzi o bardziej przyziemne sprawy, konkretniej o muzykê. Potrzebujemy kogoœ, kto zagra wieczorami na lutni, aby poprawiæ nieco nastroje ch³opaków.
	AI_Output (other, self,"DIA_NASZ_104_Engor_HelloPiosenka_55_05"); //Pocz¹tkowo typowaliœmy Johny'ego, jednak ten przys³a³ mnie do ciebie.
	AI_Output (self, other,"DIA_NASZ_104_Engor_HelloPiosenka_55_06"); //I pomyœla³ o mnie, to stary drañ! Owszem, potrafiê graæ na lutni, jednak odk¹d mój instrument uleg³ zniszczeniu, ca³e dni spêdzam na liczeniu zapasów i siedzeniu na ³awce.
	AI_Output (self, other,"DIA_NASZ_104_Engor_HelloPiosenka_55_07"); //Nawet jakbym chcia³, to nie mogê wam pomóc. Bez instrumentu wiele nie zdzia³am. Przykro mi.
	
	B_LogEntry (TOPIC_Silas_piosenka, "No tak, mog³em siê tego spodziewaæ. Engor straci³ swój instrument, a co za tym idzie, nie mo¿e zagraæ w karczmie. Trzeba coœ wymyœliæ.");
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
 	description = "A gdybym tak przyniós³ ci lutniê?";
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
	AI_Output (other, self,"DIA_NASZ_104_Engor_IllTakeYou_55_00"); //A gdybym tak przyniós³ ci lutniê?
	AI_Output (other, self,"DIA_NASZ_104_Engor_IllTakeYou_55_01"); //Zgodzi³byœ siê wtedy graæ wieczorami w karczmie?
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_02"); //Oczywiœcie. Jednak nie s¹dzê, byœ znalaz³ jak¹kolwiek lutniê w tej okolicy.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_03"); //Zapewne wszystkie zosta³y podobne przedmioty zosta³y ju¿ dawno przerobione na groty be³tów albo tarcze, czy po prostu spalone, by podtrzymaæ ogieñ.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_04"); //Poza tym w¹tpiê, aby takie rzeczy wala³y siê gdzieœ po pod³odze lub innych jaskiniach. Jedynym rozwi¹zaniem by³oby stworzyæ lutniê od nowa, jednak i z tym mo¿e byæ k³opot.
	AI_Output (other, self,"DIA_NASZ_104_Engor_IllTakeYou_55_05"); //K³opoty to ju¿ dla mnie nie pierwszyzna, dam sobie radê. Powiedz mi tylko, co muszê zrobiæ.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_06"); //Dobrze wiêc. Kiedyœ do naszego obozu przyby³ pewien myœliwy, który po kilku g³êbszych wygada³ siê, ¿e dawniej by³ bardzo dobrym lutnikiem.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IllTakeYou_55_07"); //Niestety, nie pamiêtam jego imienia. Jednak jak popytasz w obozie myœliwych to na pewno ktoœ ci pomo¿e.
	
	Log_CreateTopic (TOPIC_Engor_lutnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Engor_lutnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Engor_lutnia, "Czas skierowaæ swe kroki do obozu myœliwych i poszukaæ tam tajemniczego lutnika. Miejmy nadziejê, ¿e facet jeszcze ¿yje.");
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
 	description = "Zbieraj siê, dziœ wieczorem dajesz swój pierwszy koncert!";
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
	AI_Output (other, self,"DIA_NASZ_104_Engor_IHaveLute_55_00"); //Zbieraj siê, dziœ wieczorem dajesz swój pierwszy koncert!
	B_GiveInvItems(other, self, ItMi_Lute, 1);
	AI_Output (self, other,"DIA_NASZ_104_Engor_IHaveLute_55_01"); //Nie ¿artuj! Naprawdê uda³o ci siê zdobyæ ten instrument? Czyli ten lutnik ¿yje?
	AI_Output (other, self,"DIA_NASZ_104_Engor_IHaveLute_55_02"); //Owszem, ale nim do niego dotar³em, musia³em siê sporo nabiegaæ.
	AI_Output (self, other,"DIA_NASZ_104_Engor_IHaveLute_55_03"); //Oczywiœcie, rozumiem o co ci chodzi. W ramach podziêkowania mogê ci daæ pas, 150 sztuk z³ota lub piêæ ekstraktów leczniczych Co wybierasz?

	if (LutniaDlaEngora == 1) { B_GivePlayerXP(50); };
	if (LutniaDlaEngora == 2) { B_GivePlayerXP(150); };
	
	Log_SetTopicStatus (TOPIC_Engor_lutnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Engor_lutnia, "Odda³em lutniê Engorowi.");
	B_GivePlayerXP(300);
	DodajReputacje(2,REP_LOWCY);
	
	Info_ClearChoices (DIA_NASZ_104_Engor_IHaveLute);
		Info_AddChoice	  (DIA_NASZ_104_Engor_IHaveLute, "150 sztuk z³ota.", DIA_NASZ_104_Engor_IHaveLute_Gold);
		Info_AddChoice	  (DIA_NASZ_104_Engor_IHaveLute, "5 ekstraktów leczniczych.", DIA_NASZ_104_Engor_IHaveLute_Potion);
		Info_AddChoice	  (DIA_NASZ_104_Engor_IHaveLute, "Pas stalowej rêki. (Obrona przed broni¹ i strza³ami: +5)", DIA_NASZ_104_Engor_IHaveLute_Belt);

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
	description = "Wiesz coœ o tym, ¿eby ³owcy okradli myœliwych?";
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
	AI_Output (other, self,"DIA_NASZ_104_Engor_goth_15_00"); //Wiesz coœ o tym, ¿e ³owcy okradli myœliwych?
	AI_Output (self, other,"DIA_NASZ_104_Engor_goth_55_01"); //£owcy? Przecie¿ jesteœmy zgran¹ paczk¹...
	AI_Output (self, other,"DIA_NASZ_104_Engor_goth_55_02"); //Chocia¿... Gladiatorzy z areny to banda cudaków. Mroczne towarzystwo. Myœlê, ¿e jeœli kogoœ podejrzewaæ, to w³aœnie któregoœ z nich.

	B_LogEntry (TOPIC_Goth_kradziez, "Zdaniem Engora to gladiatorzy maj¹ coœ wspólnego z t¹ kradzie¿¹.");

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
	description = "Sprzedaj mi zbrojê. (Ciê¿ki pancerz ³owcy orków: 600 szt. z³ota)";
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
	AI_Output (other, self,"DIA_NASZ_104_Engor_CiezkiPancerz_15_00"); //Sprzedaj mi zbrojê.
	if (npc_hasitems (other, ItMi_Gold) >= 600) {
		if (RepEnough(50,REP_LOWCY)) {
			B_GiveInvItems (other, self, ItMi_Gold, 600);
			Npc_RemoveInvItems   (self, ItMi_Gold, 600);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkiPancerz_55_01"); //Proszê bardzo!
			Createinvitems (self, ITNA_DJG_M, 1);
			B_Giveinvitems (self, other, ITNA_DJG_M, 1);
			AI_EquipBestArmor (other);
			AI_EquipBestArmor (self);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkiPancerz_55_02"); //Le¿y jak ula³.
			AI_Output (other, self,"DIA_NASZ_104_Engor_CiezkiPancerz_55_03"); //Mam nadziejê, ¿e wcale nie gorzej ochrania.
			CiezkiPancerzLowcyKupiony = TRUE;
		}
		else {
			PrintMissingRep(50,REP_LOWCY);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkiPancerz_55_04"); //Jeszcze nie zas³ugujesz na ten pancerz.
		};
	}
	else {
		AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkiPancerz_55_05"); //Nie masz doœæ z³ota.
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
	description = "Sprzedaj mi zbrojê. (Ciê¿ka zbroja ³owcy orków: 1500 szt. z³ota)";
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
	AI_Output (other, self,"DIA_NASZ_104_Engor_CiezkaZbroja_15_00"); //Sprzedaj mi zbrojê.
	if (npc_hasitems (other, ItMi_Gold) >= 1500) {
		if (RepEnough(80,REP_LOWCY)) {
			B_GiveInvItems (other, self, ItMi_Gold, 1500);
			Npc_RemoveInvItems   (self, ItMi_Gold, 1500);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkaZbroja_55_01"); //Proszê bardzo!
			Createinvitems (self, ITNA_DJG_S, 1);
			B_Giveinvitems (self, other, ITNA_DJG_S, 1);
			AI_EquipBestArmor (other);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkaZbroja_55_02"); //Doskonale!
			CiezkaZbrojaLowcyKupiona = TRUE;
		}
		else {
			PrintMissingRep(80,REP_LOWCY);
			AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkaZbroja_55_03"); //Jeszcze nie zas³ugujesz na ten pancerz.
		};
	}
	else {
		AI_Output (self, other,"DIA_NASZ_104_Engor_CiezkaZbroja_55_04"); //Nie masz doœæ z³ota.
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
	description = "Nie widzia³eœ przypadkiem paczki z gwoŸdziami?";
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
	AI_Output (other, self,"DIA_NASZ_104_Engor_Gwozdzie_15_00"); //Nie widzia³eœ przypadkiem paczki z gwoŸdziami?
	AI_Output (self, other,"DIA_NASZ_104_Engor_Gwozdzie_55_01"); //Paczki z gwoŸdziami? Nie, czemu pytasz?
	AI_Output (other, self,"DIA_NASZ_104_Engor_Gwozdzie_15_02"); //Robotnik j¹ zgubi³, a jej zawartoœæ jest mu bardzo potrzebna.
	AI_Output (self, other,"DIA_NASZ_104_Engor_Gwozdzie_55_03"); //Niestety, nie przypominam sobie niczego. Powodzenia w poszukiwaniach.

	B_LogEntry (TOPIC_Robotnik_deski, "Engor nie widzia³ paczki.");

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
 	description = "Poka¿ mi swoje towary.";
};

FUNC INT DIA_NASZ_104_Engor_towary_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_104_Engor_towary_Info()
{
	AI_Output (other, self,"DIA_NASZ_104_Engor_towary_15_00"); //Poka¿ mi swoje towary.
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
	AI_Output (self, other,"DIA_NASZ_104_Engor_KurgKan_15_00"); //Jestem rozczarowany tob¹, Willu.
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

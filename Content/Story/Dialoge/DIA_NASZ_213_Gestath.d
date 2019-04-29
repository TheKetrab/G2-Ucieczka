var int WillKnowQuestRenegaci;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_EXIT   (C_INFO)
{
	npc         = NASZ_213_Gestath;
	nr          = 999;
	condition   = DIA_NASZ_213_Gestath_EXIT_Condition;
	information = DIA_NASZ_213_Gestath_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_213_Gestath_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_213_Gestath_EXIT_Info()
{
	if (WillKnowQuestRenegaci == TRUE) {
	AI_Output (self, other,"DIA_NASZ_213_Gestath_EXIT_55_00"); //Nie daj siê zabiæ. Niech Innos ciê prowadzi.
	
	WillKnowQuestRenegaci = FALSE;
	
	AI_StopProcessInfos (self);
	};
	
	AI_StopProcessInfos (self);
};


//*********************************************************************
//	Info InformAboutCrime 
//*********************************************************************
var int Gestath_Talk_Crime_First_Time;

INSTANCE DIA_NASZ_213_Gestath_InformAboutCrime   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 1;
 	condition   = DIA_NASZ_213_Gestath_InformAboutCrime_Condition;
 	information = DIA_NASZ_213_Gestath_InformAboutCrime_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_213_Gestath_InformAboutCrime_Condition()
{
	if (Thief_Counter_Mysliwi > 0)
	&& ((Gestath_Talk_Crime_First_Time == FALSE) || (Npc_IsInState(self, ZS_TALK)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_InformAboutCrime_Info()
{
	if (Gestath_Talk_Crime_First_Time == FALSE) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_15_00"); //A niech ciê! Kradzie¿ w moim obozie? Nie tylko z Ratfordem takie problemy...
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_55_01"); //S³uchaj, jeœli mamy tworzyæ zgrany zespó³, to nie mo¿emy sobie nawzajem rzucaæ k³ód pod nogi. Musisz koniecznie wynagrodziæ reszcie swoje zachowanie i okazaæ skruchê.
		Gestath_Talk_Crime_First_Time = TRUE;
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_15_02"); //Przyszed³eœ zap³aciæ?
	};
	
	var string want_to_pay; want_to_pay = "Chcê zap³aciæ za kradzie¿. (";
	want_to_pay = ConcatStrings(want_to_pay,IntToString(Thief_Counter_Mysliwi*30));
	want_to_pay = ConcatStrings(want_to_pay," szt. z³ota)");

	Info_ClearChoices (DIA_NASZ_213_Gestath_InformAboutCrime);
		Info_AddChoice	  (DIA_NASZ_213_Gestath_InformAboutCrime, "KONIEC", DIA_NASZ_213_Gestath_InformAboutCrime_end);
		Info_AddChoice	  (DIA_NASZ_213_Gestath_InformAboutCrime, want_to_pay, DIA_NASZ_213_Gestath_InformAboutCrime_pay);

};

FUNC VOID DIA_NASZ_213_Gestath_InformAboutCrime_end()
{
	AI_StopProcessInfos(self);
};

FUNC VOID DIA_NASZ_213_Gestath_InformAboutCrime_pay()
{
	var int want_to_pay_money;
	want_to_pay_money = Thief_Counter_Mysliwi*30;

	AI_Output (other,self ,"DIA_NASZ_213_Gestath_InformAboutCrime_pay_15_00"); //Chcê zap³aciæ za kradzie¿.
	
	if (npc_hasitems(other,ItMi_Gold) >= want_to_pay_money) {
		B_GiveInvItems(other,self,ItMi_Gold,want_to_pay_money);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_pay_55_01"); //Dobrze. Ale pamiêtaj, by nie robiæ ju¿ takich rzeczy nigdy wiêcej!
		
		Thief_Counter_Mysliwi = 0;
		Gestath_Talk_Crime_First_Time = FALSE;
		
		Info_ClearChoices (DIA_NASZ_213_Gestath_InformAboutCrime);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_InformAboutCrime_pay_55_02"); //Jesteœ takim gburem, ¿e nawet nie masz z³ota, by zrewan¿owaæ siê za kradzie¿! Kiepski z ciebie z³odziej...
		AI_StopProcessInfos(self);
	};
};	
	


//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_hello   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 1;
 	condition   = DIA_NASZ_213_Gestath_hello_Condition;
 	information = DIA_NASZ_213_Gestath_hello_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_213_Gestath_hello_Condition()
{
	if (Thief_Counter_Mysliwi == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_hello_Info()
{
	AI_Output (self, other,"DIA_NASZ_213_Gestath_hello_55_00"); //Kim jesteœ i czego tutaj szukasz?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_hello_15_01"); //Nazywam siê Will. Uciek³em z kopalni, bo warunki, w których nas trzymano, by³y nieludzkie. Moim celem jest te¿ uwolnienie wspó³wiêŸniów, którzy nadal tam pracuj¹.
		
};

//*********************************************************************
//	Info Hello2
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_siema2   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 2;
 	condition   = DIA_NASZ_213_Gestath_siema2_Condition;
 	information = DIA_NASZ_213_Gestath_siema2_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_213_Gestath_siema2_Condition()
{
	if (Npc_IsInState(self, ZS_TALK)
	&& npc_knowsinfo (other, DIA_NASZ_213_Gestath_hello)) && (Gestath_Stopowanie == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_siema2_Info()
{
	AI_Output (self, other,"DIA_NASZ_213_Gestath_siema2_15_00"); //Witaj, Willu.
		
};

//*********************************************************************
//	Info OUT
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_out   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 3;
 	condition   = DIA_NASZ_213_Gestath_out_Condition;
 	information = DIA_NASZ_213_Gestath_out_Info;
 	permanent   = FALSE;
	description = "Chcia³bym zostaæ myœliwym.";
};

FUNC INT DIA_NASZ_213_Gestath_out_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_213_Gestath_out_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_out_55_00"); //Chcia³bym zostaæ myœliwym.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_out_15_01"); //No có¿... Przyda nam siê nowy cz³owiek. Jednak, aby zostaæ myœliwym, musisz dowieœæ swojej wartoœci.
};

//*********************************************************************
//	Info Co
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_co   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 4;
 	condition   = DIA_NASZ_213_Gestath_co_Condition;
 	information = DIA_NASZ_213_Gestath_co_Info;
 	permanent   = FALSE;
	description = "Co mam zrobiæ?";
};

FUNC INT DIA_NASZ_213_Gestath_co_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_out))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_co_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_co_55_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_15_01"); //Jeœli chcesz tutaj zostaæ, nie ma problemu. Ale bêdziesz musia³ sam sobie kupowaæ ¿arcie i znaleŸæ miejsce do spania.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_02"); //Jeœli jednak chcesz mieæ tu coœ do powiedzenia, zbrojê i inne udogodnienia, to musisz siê troszkê przydaæ w obozie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_03"); //Pomó¿ ch³opcom. Spodobaj siê im. Kiedy bêdê ju¿ s³ysza³ na twój temat doœæ du¿o dobrych rzeczy, to zostaniesz cz³onkiem obozu myœliwych.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_04"); //No i oczywiœcie najwa¿niejsze...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_05"); //Jeœli chcesz, ¿ebym ciê przyj¹³, muszê mieæ pewnoœæ, ¿e posiadasz przynajmniej podstawowe zdolnoœci myœliwskie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_co_55_06"); //Przynieœ mi skóry trzech wilków: zwyk³ego, czarnego i lodowego. To bêdzie wystarczaj¹cy dowód, ¿e wiesz, gdzie szukaæ zwierzyny oraz potrafisz j¹ upolowaæ i co najwa¿niejsze oprawiæ.

	MIS_Wilki_Ready = TRUE;

	Log_CreateTopic (TOPIC_Gestath_wilki, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gestath_wilki, LOG_RUNNING);
	B_LogEntry (TOPIC_Gestath_wilki, "Muszê przynieœæ Gestathowi skóry trzech wilków: zwyk³ego, czarnego i lodowego.");

	if (Mission_Gildia_Ready == FALSE) {
		Log_CreateTopic (TOPIC_gildia, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_gildia, LOG_RUNNING);
		Mission_Gildia_Ready = TRUE;
	};
	
	B_LogEntry (TOPIC_gildia, "Aby zostaæ myœliwym, muszê zdobyæ poparcie w obozie oraz sprawdziæ siê jako myœliwy wykonuj¹c zadanie Gestatha.");
	Mission_Gestath_Fur = TRUE;

};

//*********************************************************************
//	Info WhereWolf
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_WhereWolf   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 6;
 	condition   = DIA_NASZ_213_Gestath_WhereWolf_Condition;
 	information = DIA_NASZ_213_Gestath_WhereWolf_Info;
 	permanent   = FALSE;
	description = "Gdzie znajdê te wilki?";
};

FUNC INT DIA_NASZ_213_Gestath_WhereWolf_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_co))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_WhereWolf_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhereWolf_55_00"); //Gdzie znajdê te wilki?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhereWolf_15_01"); //Zwyk³e znajdziesz w lasach. Czarne szukaj pod wulkanem, a lodowe oczywiœcie w okolicach Nowego Obozu.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhereWolf_55_02"); //Tylko, ¿e te ostatnie wystêpuj¹ w du¿ych watahach. Nie daj siê zjeœæ.

	B_LogEntry (TOPIC_Gestath_wilki, "Zwyk³e wilki mogê spotkaæ w lasach, czarne pod wulkanem, a lodowe w okolicach Nowego Obozu.");
};

//*********************************************************************
//	Info FurForYou
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_FurForYou   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 7;
 	condition   = DIA_NASZ_213_Gestath_FurForYou_Condition;
 	information = DIA_NASZ_213_Gestath_FurForYou_Info;
 	permanent   = FALSE;
	description = "Mam dla ciebie skóry.";
};

FUNC INT DIA_NASZ_213_Gestath_FurForYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_co)
		&& npc_hasitems (other, ItAt_WolfFur) >=1
		&& npc_hasitems (other, ItNa_BlackWolfFur) >=1
		&& npc_hasitems (other, ItNa_IceWolfFur) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_FurForYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_FurForYou_15_00"); //Mam dla ciebie skóry.
	B_giveinvitems (other, self, ItAt_WolfFur, 1);
	Npc_RemoveInvItems (self, ItAt_WolfFur, 1);
	B_giveinvitems (other, self, ItNa_BlackWolfFur, 1);
	Npc_RemoveInvItems (self, ItNa_BlackWolfFur, 1);
	B_giveinvitems (other, self, ItNa_IceWolfFur, 1);
	Npc_RemoveInvItems (self, ItNa_IceWolfFur, 1);
	AI_Output (self, other,"DIA_NASZ_213_Gestath_FurForYou_55_01"); //Niech no spojrzê.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_FurForYou_55_02"); //Dobrze naciête...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_FurForYou_55_03"); //Tak. Potrafisz garbowaæ skóry. To daje ci ogromny plus w drodze do do³¹czenia do nas.
	
	MIS_Wilki_Ready = FALSE;

	DodajReputacje (4, REP_MYSLIWI);
	B_GivePlayerXP (500);
	B_LogEntry (TOPIC_Gestath_wilki, "Odda³em skóry Gestathowi.");
	Log_SetTopicStatus (TOPIC_Gestath_wilki, LOG_SUCCESS);
	Mission_Gestath_Fur = FALSE;
};

var int WILL_MYSLIWY;
//*********************************************************************
//	Info Ready
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_ready   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 8;
 	condition   = DIA_NASZ_213_Gestath_ready_condition;
 	information = DIA_NASZ_213_Gestath_ready_Info;
 	permanent   = TRUE;
	description = "Czy jestem ju¿ gotowy, by do was do³¹czyæ?";
};

FUNC INT DIA_NASZ_213_Gestath_ready_condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_out)
		&& (!WILL_MYSLIWY))
		&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_ready_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ready_55_00"); //Czy jestem ju¿ gotowy, by do was do³¹czyæ?
	if (RepEnough(25,REP_MYSLIWI)) && (npc_knowsinfo (other, DIA_NASZ_213_Gestath_FurForYou)) {
	
		if (npc_knowsinfo (other, DIA_NASZ_201_Erak_PreHello)) {
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_01"); //Tak. Dowiod³eœ, ¿e mo¿na na tobie polegaæ. Ch³opcy s¹ zgodni co do twojego cz³onkostwa i udowodni³eœ, ¿e znasz siê trochê na polowaniu.
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_55_02"); //Mo¿esz zaczynaæ, kiedy tylko zechcesz.

			WILL_MYSLIWY = TRUE;
		}
		else {
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_03"); //Pozna³eœ ju¿ Eraka?
			AI_Output (other, self,"DIA_NASZ_213_Gestath_ready_15_04"); //Nie.
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_05"); //Uwa¿am, ¿e powinniœcie zamieniæ ze sob¹ kilka s³ów. To moja prawa rêka.
			AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_06"); //Erak przebywa w obozie wypadowym. IdŸ wzd³u¿ palisady na pó³noc, a na jej koñcu skrêæ w prawo. Tam go znajdziesz.
		};
	}
	else if (RepEnough(10,REP_MYSLIWI)) {
		PrintMissingRep(25,REP_MYSLIWI);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_07"); //Niestety to ci¹gle za ma³o. Ch³opcy ju¿ ciê znaj¹, ale nie ka¿dy jest skory do pochwa³y.
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_55_08"); //Pracuj tak dalej, a niebawem staniesz siê jednym z nas.
	}
	else {
		PrintMissingRep(25,REP_MYSLIWI);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_15_09"); //¯artujesz chyba!
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ready_55_10"); //Pomog³eœ komukolwiek? IdŸ lepiej przekonywaæ do siebie ch³opców, zamiast dra¿niæ mnie swoimi g³upimi pytaniami. 
	};
};

//*********************************************************************
//	Info BeAMysliwy
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_BeAMysliwy   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 9;
 	condition   = DIA_NASZ_213_Gestath_BeAMysliwy_Condition;
 	information = DIA_NASZ_213_Gestath_BeAMysliwy_Info;
 	permanent   = FALSE;
	description = "Chcê zostaæ myœliwym.";
};

FUNC INT DIA_NASZ_213_Gestath_BeAMysliwy_Condition()
{
	if (WILL_MYSLIWY == TRUE)
		&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_BeAMysliwy_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_BeAMysliwy_15_00"); //Chcê zostaæ myœliwym.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BeAMysliwy_15_01"); //Œwietnie! Dobry jesteœ, a my potrzebujemy dobrych ludzi.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BeAMysliwy_15_02"); //Od dzisiaj mo¿esz nosiæ siê z tytu³em myœliwego. WeŸ te¿ tê zbrojê i noœ j¹ na potwierdzenie swojej przynale¿noœci.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BeAMysliwy_15_03"); //Wpadnij te¿ do Dobara i upomnij siê o nó¿ dla siebie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BeAMysliwy_15_04"); //Jeœli zale¿y ci na czymœ, co lepiej ciê obroni, to zapytaj Hunta. Znajdzie siê coœ dla ciebie.

	Npc_SetTrueGuild (other, GIL_OUT);
	other.guild	= GIL_OUT;
	Snd_Play ("LEVELUP");

	Createinvitems (self, ITNA_OUT_L, 1);
	B_giveinvitems (self, other, ITNA_OUT_L, 1);
	AI_EquipBestArmor (other);

	B_GivePlayerXP (1000);		
	DodajReputacje(10,REP_MYSLIWI);
	B_LogEntry (TOPIC_gildia, "Do³¹czy³em do myœliwych.");
	Log_SetTopicStatus (TOPIC_gildia, LOG_SUCCESS);
	
	B_Kapitelwechsel (2, NEWWORLD_ZEN );

};

var int GESTATH_ARAN;
//*********************************************************************
//	Info Aran
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_aran   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 10;
 	condition   = DIA_NASZ_213_Gestath_aran_Condition;
 	information = DIA_NASZ_213_Gestath_aran_Info;
 	permanent   = FALSE;
	description = "Aran szuka towarzystwa...";
};

FUNC INT DIA_NASZ_213_Gestath_aran_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_216_Aran_quest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_aran_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_aran_15_00"); //Aran szuka towarzystwa...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_aran_15_01"); //To mo¿e sam z nim posiedŸ?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_aran_15_02"); //Przykro mi Willu, ale jeœli chcesz mu pomóc, to musisz sam poszukaæ kogoœ, kto chcia³by z nim przebywaæ.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_aran_15_03"); //Aran jest strasznie gadatliwy i w³aœnie dlatego odizolowa³em go od naszych.

	B_LogEntry (TOPIC_Aran_quest, "Gestath mi nie pomo¿e... Muszê udaæ siê do kogoœ, kto ma radê na wszystko!");
	GESTATH_ARAN = TRUE;
};


var int GestathMiejsceOpisane;
//*********************************************************************
//	Info ObozWypadowy
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_ObozWypadowy   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 11;
 	condition   = DIA_NASZ_213_Gestath_ObozWypadowy_Condition;
 	information = DIA_NASZ_213_Gestath_ObozWypadowy_Info;
 	permanent   = FALSE;
 	description = "Czy masz dla mnie jakieœ zadanie?";
};

FUNC INT DIA_NASZ_213_Gestath_ObozWypadowy_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_213_Gestath_ObozWypadowy_Info()
{
	AI_Output (other,self ,"DIA_NASZ_213_Gestath_ObozWypadowy_15_00"); //Czy masz dla mnie jakieœ zadanie?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ObozWypadowy_55_01"); //Ja nie. Ale jeœli tutaj nikt nie chce twojej pomocy, to mo¿esz zajrzeæ do obozu wypadowego.
	
	if (WillKnowObozWypadowy == FALSE) {
		AI_Output (other, self,"DIA_NASZ_213_Gestath_ObozWypadowy_55_02"); //Gdzie jest ten obóz?
		AI_Output (self, other,"DIA_NASZ_213_Gestath_ObozWypadowy_08_04"); //Hmm... Masz przy sobie porz¹dn¹ mapê?
	
		if (Npc_HasItems (other,ItWr_Map_OldWorld) == FALSE)
		{
			AI_Output	(other, self, "DIA_NASZ_213_Gestath_ObozWypadowy_15_07"); //Nie.
			AI_Output	(self, other, "DIA_NASZ_213_Gestath_ObozWypadowy_08_08"); //W takim razie chyba muszê ci opisaæ to miejsce.
			AI_Output	(self, other, "DIA_NASZ_213_Gestath_ObozWypadowy_08_09"); //IdŸ na po³udnie, wzd³u¿ palisady. Gdy natrafisz na w¹wóz nie do przebycia, skrêæ w prawo w stronê gór. Jestem przekonany, ¿e zobaczysz to miejsce. 
			GestathMiejsceOpisane = TRUE;
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_213_Gestath_Landkarte		(C_INFO)
{
	npc			 = 	NASZ_213_Gestath;
	nr		 	 = 	12;
	condition	 = 	DIA_NASZ_213_Gestath_Landkarte_Condition;
	information	 = 	DIA_NASZ_213_Gestath_Landkarte_Info;
	permanent    =  FALSE;
	description	 = 	"Mam tu tak¹ mapê. Mo¿e byæ?";
};

func int DIA_NASZ_213_Gestath_Landkarte_Condition ()
{
	if ((Npc_KnowsInfo (other, DIA_NASZ_213_Gestath_ObozWypadowy)) && (!Npc_KnowsInfo (other, DIA_NASZ_201_Erak_PreHello))
	&& (Npc_HasItems (other,ItWr_Map_OldWorld))
	&& (WillKnowObozWypadowy == FALSE)) && (GestathMiejsceOpisane == FALSE)
		{
			return TRUE;
		};
};

func void DIA_NASZ_213_Gestath_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_213_Gestath_Landkarte_15_00"); //Mam tu tak¹ mapê. Mo¿e byæ?
	AI_Output	(self, other, "DIA_NASZ_213_Gestath_Landkarte_08_01"); //Mo¿e. Zaraz zaznaczê ci, gdzie jest to miejsce.
	B_GiveInvItems (other, self, ItWr_Map_OldWorld,1);
	AI_Output	(self, other, "DIA_NASZ_213_Gestath_Landkarte_08_02"); //Proszê, oto twoja mapa.
	
	Npc_RemoveInvItems	(self,ItWr_Map_OldWorld ,1 );
	CreateInvItems (self, ItNa_Mapa_ObozWypadowy, 1);									
	B_GiveInvItems (self, other, ItNa_Mapa_ObozWypadowy, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info VickGold
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_213_Gestath_VickGold		(C_INFO)
{
	npc			 = 	NASZ_213_Gestath;
	nr		 	 = 	13;
	condition	 = 	DIA_NASZ_213_Gestath_VickGold_Condition;
	information	 = 	DIA_NASZ_213_Gestath_VickGold_Info;
	permanent    =  FALSE;
	description	 = 	"Pomog³em Vickowi dostarczyæ miêso do obozu.";
};

func int DIA_NASZ_213_Gestath_VickGold_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_NASZ_204_Vick_SecondStop))
		{
			return TRUE;
		};
};

func void DIA_NASZ_213_Gestath_VickGold_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_213_Gestath_VickGold_15_00"); //Pomog³em Vickowi dostarczyæ miêso do obozu.
	AI_Output	(self, other, "DIA_NASZ_213_Gestath_VickGold_08_01"); //Robi³eœ za ochroniarza? No dobra, masz tu ma³¹ nagrodê.

	CreateInvItems (self, ItMi_Gold, 80);
	B_GiveInvItems (self, other, ItMi_Gold, 80);
};

var int GestathRenegatOK;
var int GestathRenegatOneTime;
///////////////////////////////////////////////////////////////////////
//	Info WantToKillRenegat
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_213_Gestath_WantToKillRenegat		(C_INFO)
{
	npc			 = 	NASZ_213_Gestath;
	nr		 	 = 	14;
	condition	 = 	DIA_NASZ_213_Gestath_WantToKillRenegat_Condition;
	information	 = 	DIA_NASZ_213_Gestath_WantToKillRenegat_Info;
	permanent    =  TRUE;
	description	 = 	"Mogê liczyæ na wsparcie w walce z Marcosem?";
};

func int DIA_NASZ_213_Gestath_WantToKillRenegat_Condition ()
{
	if (WillWantToKillRenegats == TRUE) && (GestathRenegatOK == FALSE) && !(npc_isdead (NASZ_009_Marcos)) && !(hero.guild == GIL_DJG)
		{
			return TRUE;
		};
};

func void DIA_NASZ_213_Gestath_WantToKillRenegat_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_213_Gestath_WantToKillRenegat_15_00"); //Mogê liczyæ na wsparcie w walce z Marcosem?
	if !(hero.guild == GIL_OUT) && (GestathRenegatOneTime == FALSE) {
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_01"); //Z Marcosem? Tym paladynem renegatem?
		AI_Output	(other, self, "DIA_NASZ_213_Gestath_WantToKillRenegat_15_02"); //Dok³adnie. Muszê pomóc innym kopaczom siê stamt¹d wydostaæ.
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_03"); //Do³¹cz do nas. Wtedy porozmawiamy o tym ponownie.
		
		GestathRenegatOneTime = TRUE;
		B_LogEntry (TOPIC_Korth_kopalnia, "Gestath pomo¿e mi, jeœli do³¹czê do myœliwych.");
	}
	else if !(hero.guild == GIL_OUT) && (GestathRenegatOneTime == TRUE) {
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_04"); //Nie.
	}
	else {
		
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_05"); //Tak. Jesteœ ju¿ jednym z nas, dotrzymam obietnicy. Powiedz coœ wiêcej.
		AI_Output	(other, self, "DIA_NASZ_213_Gestath_WantToKillRenegat_15_06"); //Marcos jest schowany w kopalni - za palisad¹. Chcê siê tam jakoœ dostaæ.
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_07"); //Zapewne bramê da siê otworzyæ tylko od wewn¹trz... Mo¿e znajdziesz gdzieœ szparê miêdzy deskami?
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_08"); //WeŸ ten magiczny zwój. Przemiana w chrz¹szcza to bardzo u¿yteczne zaklêcie.
		AI_Output	(self, other, "DIA_NASZ_213_Gestath_WantToKillRenegat_08_09"); //Zabierz ze sob¹ Kivo, Louisa i Vachuta. Niech pomog¹ naszemu nowemu przyjacielowi.
		
		CreateInvItems (self, ItNa_TrfMeatbug, 1);									
		B_GiveInvItems (self, other, ItNa_TrfMeatbug, 1);
		
		B_LogEntry (TOPIC_Korth_kopalnia, "W koñcu nadszed³ czas powrotu do kopalni. Tym razem jednak ju¿ nie jako kopacz, a jako myœliwy! Gestath da³ mi zwój przemiany w chrz¹szcza. Mo¿e gdzieœ miêdzy deskami palisady bêdzie jakaœ ma³a dziura, dziêki której przedostanê siê do œrodka. Mam zabraæ ze sob¹ Vachuta, Kivo i Louisa.");
		
		GestathRenegatOK = TRUE;
		
	};
};

///////////////////////////////////////////////////////////////////////
//	Info FromJehen
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_213_Gestath_FromJehen		(C_INFO)
{
	npc			 = 	NASZ_213_Gestath;
	nr		 	 = 	15;
	condition	 = 	DIA_NASZ_213_Gestath_FromJehen_Condition;
	information	 = 	DIA_NASZ_213_Gestath_FromJehen_Info;
	permanent    =  FALSE;
	description	 = 	"Przynoszê trofea Jehena.";
};

func int DIA_NASZ_213_Gestath_FromJehen_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_232_Jehen_ProwadzenieKoniec))
	&& (npc_hasitems (other,ItNa_JehenPaczkaZFutrami) >= 1)
	&& (npc_hasitems (other,ItNa_JehenPaczkaZMiesem) >= 1)
	
	{
		return TRUE;
	};
};

func void DIA_NASZ_213_Gestath_FromJehen_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_213_Gestath_FromJehen_15_00"); //Przynoszê trofea Jehena.
	B_GiveInvItems (other, self, ItNa_JehenPaczkaZFutrami, 1);
	B_GiveInvItems (other, self, ItNa_JehenPaczkaZMiesem, 1);
	Npc_RemoveInvItems (self, ItNa_JehenPaczkaZFutrami, 1);
	Npc_RemoveInvItems (self, ItNa_JehenPaczkaZMiesem, 1);

	AI_Output	(self, other, "DIA_NASZ_213_Gestath_FromJehen_08_01"); //To znaczy, ¿e wróci³ ju¿ do obozu? Doskonale, przeka¿ mu proszê te sto strza³.
	CreateInvItems (self, ItRw_Arrow, 100);
	B_GiveInvItems (self, other, ItRw_Arrow, 100);	
	
};




func void WillSay_WhereIsAbandonedMine() {
	AI_Output (other,self ,"WillSay_WhereIsAbandonedMine_15_00"); //Gdzie jest ta Opuszczona Kopalnia?
	AI_Output (self, other,"WillSay_WhereIsAbandonedMine_55_01"); //Nie wiesz? Ch³opie! Przecie¿ to ta najbli¿ej Starej Wie¿y Demonów.
	AI_Output (self, other,"WillSay_WhereIsAbandonedMine_55_02"); //Niegdyœ zajêta przez pe³zacze. O ile siê nie mylê, to przebywa³ tam kiedyœ paladyn Silvestro. Mówi ci to coœ?
	AI_Output (self, other,"WillSay_WhereIsAbandonedMine_55_03"); //Na pewno tam trafisz.

	
	B_LogEntry (TOPIC_Gestath_renegaci, "Opuszczona Kopalnia znajduje siê w okolicy Starej Wie¿y Demonów.");
};

func void WillSay_AnyAdvices() {
	AI_Output (other,self ,"WillSay_AnyAdvices_15_00"); //Masz dla mnie jakieœ rady?
};

func void GestathSay_Becareful() {
	AI_Output (self, other,"GestathSay_Becareful_55_03"); //Przede wszystkim uwa¿aj.
};

func void GestathSay_AboutBandits() {

	AI_Output (self, other,"DIA_NASZ_213_Gestath_GestathSay_AboutBandits_55_00"); //Pos³uchaj: Kilka dni temu, jeden ze zwiadowców, zauwa¿y³ coœ dziwnego.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_GestathSay_AboutBandits_55_01"); //Dwóch ludzi w Opuszczonej Kopalni. Nie wiadomo kim s¹, ani tym bardziej czego chc¹. Wybierzesz siê tam i sprawdzisz, o co chodzi.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_GestathSay_AboutBandits_55_02"); //Mam ich zabiæ?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_GestathSay_AboutBandits_55_03"); //Jeœli twoim zdaniem stanowi¹ zagro¿enie, to tak.
};

//*********************************************************************
//	Info RenegaciDJG
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_RenegaciDJG   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 20;
 	condition   = DIA_NASZ_213_Gestath_RenegaciDJG_Condition;
 	information = DIA_NASZ_213_Gestath_RenegaciDJG_Info;
 	permanent   = FALSE;
 	description = "Przysy³a mnie Keroloth.";
};

FUNC INT DIA_NASZ_213_Gestath_RenegaciDJG_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_WhatToDoKap2))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciDJG_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciDJG_55_00"); //Przysy³a mnie Keroloth.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciDJG_55_01"); //Ciebie? Chyba nie docenia powagi tej sprawy...
	AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciDJG_55_02"); //Ja doceniam. I jestem przekonany, ¿e podo³am wyzwaniu.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciDJG_55_03"); //Zobaczymy...
	
	GestathSay_AboutBandits();

	B_LogEntry (TOPIC_Gestath_renegaci, "Ponoæ w Opuszczonej Kopalni zauwa¿ono ludzi. Moim zadaniem jest dowiedzieæ siê, kim oni s¹, a jeœli zajdzie taka potrzeba to ich zabiæ.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "W Górniczej Dolinie pojawili siê ludzie niebêd¹cy ani myœliwymi, ani ³owcami orków.");

	
	WillKnowQuestRenegaci = TRUE;

	Info_ClearChoices (DIA_NASZ_213_Gestath_RenegaciDJG);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_RenegaciDJG, "Gdzie jest ta Opuszczona Kopalnia?", DIA_NASZ_213_Gestath_RenegaciDJG_where);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_RenegaciDJG, "Masz dla mnie jakieœ rady?", DIA_NASZ_213_Gestath_RenegaciDJG_how);
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciDJG_where()
{
	WillSay_WhereIsAbandonedMine();
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciDJG_how()
{

	WillSay_AnyAdvices();
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciDJG_how_55_01"); //Potrafisz chyba walczyæ? Uwa¿aj na nich, mog¹ znacznie przewy¿szaæ ciê swoimi umiejêtnoœciami.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciDJG_how_55_02"); //Zachowaj rozwagê i nie zbli¿aj siê do nich zanadto, zanim dobrze nie przyjrzysz siê tej dwójce.
	GestathSay_Becareful();	

	B_LogEntry (TOPIC_Gestath_renegaci, "Gestath poradzi³ mi, bym przyjrza³ siê tej dwójce z daleka zanim ich zabijê.");
};



//*********************************************************************
//	Info RenegaciOUT
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_RenegaciOUT   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 21;
 	condition   = DIA_NASZ_213_Gestath_RenegaciOUT_Condition;
 	information = DIA_NASZ_213_Gestath_RenegaciOUT_Info;
 	permanent   = FALSE;
 	description = "Co mam teraz zrobiæ?";
};

FUNC INT DIA_NASZ_213_Gestath_RenegaciOUT_Condition()
{
	if (hero.guild == GIL_OUT)
	&& (KOPACZE_URATOWANI == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciOUT_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciOUT_55_00"); //Co mam teraz zrobiæ?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciOUT_55_01"); //Hmm... Jestem pod wra¿eniem twojego zapa³u. Upora³eœ siê ze swoimi k³opotami, pora na inne k³opoty.

	GestathSay_AboutBandits();

	Log_CreateTopic (TOPIC_Gestath_Renegaci, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gestath_renegaci, LOG_RUNNING);
	B_LogEntry (TOPIC_Gestath_renegaci, "W dawnej kopalni Silvestra zauwa¿ono dwójkê ludzi w nieznanych pancerzach. Moim zadaniem jest dowiedzieæ siê, kim oni s¹, a jeœli zajdzie taka potrzeba, to ich zabiæ.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "W Górniczej Dolinie pojawili siê ludzie niebêd¹cy ani myœliwymi, ani ³owcami orków.");
	
	WillKnowQuestRenegaci = TRUE;
	
	Info_ClearChoices (DIA_NASZ_213_Gestath_RenegaciOUT);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_RenegaciOUT, "Gdzie jest ta Opuszczona Kopalnia?", DIA_NASZ_213_Gestath_RenegaciOUT_where);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_RenegaciOUT, "Masz dla mnie jakieœ rady?", DIA_NASZ_213_Gestath_RenegaciOUT_how);
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciOUT_where()
{
	WillSay_WhereIsAbandonedMine();
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciOUT_how()
{
	WillSay_AnyAdvices();
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciOUT_how_55_01"); //Wykorzystaj swoje umiejêtnoœci. Skradaj siê i strzelaj z ³uku w razie potrzeby.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciOUT_how_55_02"); //Na twoim miejscu nie zbli¿a³bym siê do nich zanadto, zanim nie przyjrza³bym siê tej dwójce.
	GestathSay_Becareful();
	
	if (Npc_HasItems (other,ItRi_Dex_02) == FALSE) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciOUT_how_55_04"); //WeŸ ten pierœcieñ. Jestem pewien, ¿e ci siê przyda.
		Createinvitems (self, ItRi_Dex_02, 1);
		B_Giveinvitems (self, other, ItRi_Dex_02, 1);
	};

	B_LogEntry (TOPIC_Gestath_renegaci, "Gestath poradzi³ mi, bym przyjrza³ siê tej dwójce z daleka.");
};

var int BANDZIOR_KILLED;
var int BANDZIOR_LIST;
//*********************************************************************
//	Info RenegaciInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_RenegaciInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 22;
 	condition   = DIA_NASZ_213_Gestath_RenegaciInfo_Condition;
 	information = DIA_NASZ_213_Gestath_RenegaciInfo_Info;
 	permanent   = TRUE;
 	description = "Powiem ci, czego siê dowiedzia³em.";
};

FUNC INT DIA_NASZ_213_Gestath_RenegaciInfo_Condition()
{
	if (KAPITEL == 2)
		&& (BANDZIOR_KILLED == FALSE || BANDZIOR_LIST == FALSE)
		&& (npc_knowsinfo(other,DIA_NASZ_213_Gestath_RenegaciOUT)
		 || npc_knowsinfo(other,DIA_NASZ_213_Gestath_RenegaciDJG))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_RenegaciInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_00"); //Powiem ci, czego siê dowiedzia³em.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_01"); //Tak?	

		if ((npc_isdead (NASZ_301_Bandzior) && npc_isdead (NASZ_302_Bandzior) && (!BANDZIOR_KILLED))
		|| (npc_hasitems (other, ItNa_ListBandyci) >=1 && (!BANDZIOR_LIST))) {

			if (npc_isdead (NASZ_301_Bandzior) && npc_isdead (NASZ_302_Bandzior) && (!BANDZIOR_KILLED)) {
				AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_02"); //Zabi³em tych ludzi.
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_03"); //I? Widzia³eœ ich z bliska. Mo¿esz coœ o nich powiedzieæ?
				AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_04"); //Rzucili siê na mnie. Ich zbroje nie przypomina³y ¿adnych z tych, które nosz¹ myœliwi albo ³owcy orków.
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_05"); //To ciekawe... Widaæ nie jesteœmy sami w tej dziurze. Trzeba siê czegoœ o nich dowiedzieæ.

				BANDZIOR_KILLED = TRUE;
			};

			if (npc_hasitems (other, ItNa_ListBandyci) >=1 && (!BANDZIOR_LIST)) {
				AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_06"); //Znalaz³em ten list.
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_07"); //Poka¿ go.
				B_UseFakeScroll();
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_08"); //No, no. To chyba okreœla miejsce ich obozu. Ciekawe, kto to taki ten Nod.

				BANDZIOR_LIST = TRUE;
				//B_LogEntry (TOPIC_Gestath_Renegaci, "");
			};
		}

			else {
				AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_09"); //Niczego nowego.
				AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_10"); //Wiêc po co robisz mi nadziejê na jakieœ informacje? Bierz siê do roboty!
			};
		
		if ((BANDZIOR_KILLED == TRUE) && (BANDZIOR_LIST == TRUE)) {
			AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_11"); //No dobra... W takim razie przed tob¹ kolejne zadanie.
			AI_Output (other, self,"DIA_NASZ_213_Gestath_RenegaciInfo_55_12"); //Niech zgadnê. Mam przenikn¹æ do ich obozu i dowiedzieæ siê, czego tu szukaj¹?
			AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_13"); //Wymagasz od siebie wiêcej, ni¿ bym ciê poprosi³. Ale niech tak bêdzie!
			AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_14"); //Jeœli chcesz prze¿yæ w ich towarzystwie, to lepiej za³atw sobie taki pancerz, jaki nosz¹.
			AI_Output (self, other,"DIA_NASZ_213_Gestath_RenegaciInfo_55_15"); //Dowiedz siê od nich tyle, ile dasz radê. Powodzenia.
			
			B_LogEntry (TOPIC_Gestath_Renegaci, "Muszê przenikn¹æ do obozu tamtych ludzi i dowiedzieæ siê, po co przybyli do Górniczej Doliny. Szef myœliwych zasugerowa³ mi, ¿ebym za³atwi³ sobie taki sam pancerz, jaki mieli tamci ludzie.");
		};
};

//*********************************************************************
//	Info BamInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_BamInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 23;
 	condition   = DIA_NASZ_213_Gestath_BamInfo_Condition;
 	information = DIA_NASZ_213_Gestath_BamInfo_Info;
 	permanent   = FALSE;
 	description = "Jeden z bandytów chce wiedzieæ, co z kopalni¹.";
};

FUNC INT DIA_NASZ_213_Gestath_BamInfo_Condition()
{
	if (hero.guild == GIL_OUT)
	&& (npc_knowsinfo (other, DIA_NASZ_304_Bam_quest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_BamInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_BamInfo_55_00"); //Jeden z bandytów chce wiedzieæ, co z kopalni¹.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BamInfo_55_01"); //T¹, w której pracowa³eœ?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_BamInfo_55_02"); //W³aœnie tak. Nie mogê mu przecie¿ powiedzieæ, ¿e wszyscy paladyni nie ¿yj¹, a kopacze zostali uwolnieni.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BamInfo_55_03"); //Mo¿esz mu po prostu daæ trochê rudy i powiedzieæ, ¿e to od nich. Myœlê, ¿e jakieœ dwadzieœcia bry³ek wystarczy.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_BamInfo_55_04"); //A jeœli nie zdo³asz tyle uzbieraæ, to zapytaj Kerolotha, czy nie da siê tego rozwi¹zaæ bardziej subtelnie.

	B_LogEntry (TOPIC_Bam_kopalnia, "Gestath zasugerowa³ mi, ¿eby daæ bandycie 20 bry³ek rudy i sk³amaæ, ¿e to dostawa od paladynów. Mogê te¿ zapytaæ Kerolotha, co on o tym s¹dzi");
};


//*********************************************************************
//	Info NiewolnicyInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_NiewolnicyInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 23;
 	condition   = DIA_NASZ_213_Gestath_NiewolnicyInfo_Condition;
 	information = DIA_NASZ_213_Gestath_NiewolnicyInfo_Info;
 	permanent   = FALSE;
 	description = "W obozie bandytów s¹ niewolnicy.";
};

FUNC INT DIA_NASZ_213_Gestath_NiewolnicyInfo_Condition()
{
	if (WCHODZENIE_BANDYCI == TRUE) && (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_NiewolnicyInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_NiewolnicyInfo_55_00"); //W Obozie Bandytów s¹ niewolnicy.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_NiewolnicyInfo_55_01"); //Na razie nic z tym nie mo¿emy zrobiæ.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_NiewolnicyInfo_55_02"); //Spróbuj siê z nimi skontaktowaæ... Mo¿e bêdziesz móg³ im w czymœ pomóc.
};

//*********************************************************************
//	Info ArtefaktInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_ArtefaktInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 24;
 	condition   = DIA_NASZ_213_Gestath_ArtefaktInfo_Condition;
 	information = DIA_NASZ_213_Gestath_ArtefaktInfo_Info;
 	permanent   = FALSE;
 	description = "Wiem ju¿ ca³kiem sporo o bandytach.";
};

FUNC INT DIA_NASZ_213_Gestath_ArtefaktInfo_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_coteraz))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_ArtefaktInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_00"); //Wiem ju¿ ca³kiem sporo o bandytach.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_01"); //Domyœlam siê. D³ugo o niczym nie mówi³eœ. A wiêc wiesz ju¿, jak siê tu dostali i czego chc¹?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_02"); //Przedostali siê tutaj przez góry. Ich statek trochê ucierpia³. Czêœæ z nich zosta³a na pla¿y i go naprawia.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_03"); //Oko³o dwudziestu z nich przebi³o siê przez góry i za³o¿y³o obóz na po³udniu Górniczej Doliny. Chc¹ wydobywaæ rudê i sprzedawaæ j¹ królowi.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_04"); //Ale ich szef szuka chyba czegoœ innego...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_05"); //Czekaj, czekaj. Powiedzia³eœ, ¿e przebili siê tu przez góry?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_06"); //Tak, ale wszyscy twierdz¹, ¿e to droga bez powrotu. Raczej tamtêdy nie uciekniemy.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_07"); //Faktycznie, w tamtych górach mieszkaj¹ dzikie plemiona orków. Podró¿ przez po³udniowe góry to fatalny pomys³. Poza tym nie mielibyœmy w³aœnego statku, by odp³yn¹æ z wybrze¿a. A co z tym ich szefem?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_08"); //Chce siê przedostaæ na jeden z klifów. Wys³a³ mnie na poszukiwania czêœci pewnego artefaktu, który mu to umo¿liwi.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_09"); //Znalaz³em ju¿ je wszystkie i mam je teraz po³¹czyæ.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_ArtefaktInfo_55_10"); //Uwa¿aj na tego cz³owieka. Nasi stra¿nicy bêd¹ ciê mieli na oku, a ty zanim oddasz gotowy artefakt ich szefowi, nabroisz trochê w ich obozie.
};

//*********************************************************************
//	Info WhatToDoInfo
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_WhatToDoInfo   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 25;
 	condition   = DIA_NASZ_213_Gestath_WhatToDoInfo_Condition;
 	information = DIA_NASZ_213_Gestath_WhatToDoInfo_Info;
 	permanent   = FALSE;
 	description = "Co mam zrobiæ?";
};

FUNC INT DIA_NASZ_213_Gestath_WhatToDoInfo_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_ArtefaktInfo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_WhatToDoInfo_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_01"); //Przede wszystkim ogranicz im dostêp do jedzenia. Maj¹ tam jakieœ zapasy?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_02"); //Maj¹ owce...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_03"); //Œwietnie, w takim razie musisz ur¿n¹æ je wszystkie. Kolejne pytanie: Jak wygl¹da ich palisada?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_04"); //Grube k³ody stoj¹ce bardzo blisko siebie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_05"); //Bêdzie trzeba coœ z tym zrobiæ... WeŸ ten tasak i obr¹b trochê te dechy gdzieœ z boku ich palisady. Z zewn¹trz i od wewn¹trz.
	Createinvitems (self, ItMw_1h_Sld_Axe, 1);
	B_Giveinvitems (self, other, ItMw_1h_Sld_Axe, 1);	
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_06"); //Tak, ¿ebyœmy mogli tam wkroczyæ w razie potrzeby. I na koniec pod³ó¿ w jakieœ ustalone miejsce paczki z broni¹.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_07"); //Te trzy powinny wystarczyæ.
	Createinvitems (self, ItNa_PaczkaZBronia, 3);
	B_Giveinvitems (self, other, ItNa_PaczkaZBronia, 3);	
	AI_Output (other, self,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_08"); //Zostawiê je w skrzyni niewolników przy obr¹banych deskach.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_WhatToDoInfo_55_09"); //Niech bêdzie. Nie daj siê z³apaæ!
	
	B_LogEntry (TOPIC_Gestath_renegaci, "Zanim oddam Nodowi artefakt, muszê nabroiæ w obozie.");
	
	MIS_Psikusy_Ready = TRUE;
	ff_applyonceext(Psikusy,1000,-1);

	Log_CreateTopic (TOPIC_Gestath_psikus, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gestath_psikus, LOG_RUNNING);
	B_LogEntry (TOPIC_Gestath_psikus, "Muszê w nocy poza³atwiaæ pewne sprawy w obozie bandytów. Pierwsza z nich to ubój owiec. Nastêpnie muszê obr¹baæ deski palisady od zewn¹trz i od wewn¹trz, aby u³atwiæ wejœcie do obozu myœliwym. Zrobiê to na odcinku miêdzy Domenicem a miejscem, w którym wieczorami odpoczywaj¹ niewolnicy. Bêdê tylko musia³ odci¹gn¹æ Domenica... Tam te¿ postanowi³em zostawiæ paczki z broni¹: Schowam je w kufrze obok niewolników.");

};

// ----- ----- -----
FUNC INT DESKA_PAL_BAN_1_COND() {
	if(MIS_Psikusy_Ready > 0)
	&&((Wld_IsTime(22,00,00,00)) || (Wld_IsTime(00,00,03,00)))
	&&(MIS_Psikusy_Domenic_Odlecial == TRUE)
	{ 
		return true;
	}
	else if(npc_hasitems(hero,ItMw_1h_Sld_Axe)==0) {
		CreateInvItems(hero,ItMw_1h_Sld_Axe,1);
	};
	
	return false;
};

var int Deska_Pal_Ban_1_OneTime;
FUNC VOID DESKA_PAL_BAN_1_DO_S1() {
	if(Deska_Pal_Ban_1_OneTime == 0) {
		Print("Na wszelki wypadek powinienem uderzyæ jeszcze raz...");
		Deska_Pal_Ban_1_OneTime = 1;
		
		if(Deska_Pal_Ban_2_OneTime == TRUE) {
			MIS_Psikusy_Ready = MIS_Psikusy_Ready + 1;
			B_LogEntry (TOPIC_Gestath_psikus, "Zaj¹³em siê deskami.");
			MIS_Psikusy_Domenic_Odlecial = FALSE;
			Npc_ExchangeRoutine (NASZ_326_Domenic, "Start");
		};
		
	};
};

FUNC INT DESKA_PAL_BAN_2_COND() {
	if(MIS_Psikusy_Ready > 0)
	&&((Wld_IsTime(22,00,00,00)) || (Wld_IsTime(00,00,03,00)))
	{ 
		return true;
	};
	
	return false;
};

var int Deska_Pal_Ban_2_OneTime;
FUNC VOID DESKA_PAL_BAN_2_DO_S1() {
	if(Deska_Pal_Ban_2_OneTime == 0) {
		Deska_Pal_Ban_2_OneTime = 1;

		if(Deska_Pal_Ban_1_OneTime == TRUE) {
			MIS_Psikusy_Ready = MIS_Psikusy_Ready + 1;
			B_LogEntry (TOPIC_Gestath_psikus, "Zaj¹³em siê deskami.");
		};

	};
};


//*********************************************************************
//	Info KapThree
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_KapThree   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 30;
 	condition   = DIA_NASZ_213_Gestath_KapThree_Condition;
 	information = DIA_NASZ_213_Gestath_KapThree_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_213_Gestath_KapThree_Condition()
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_033_TO_CAVE2"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_KapThree_Info()
{
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_00"); //No proszê, to¿ to nasz bohater.
	AI_Output (other,self ,"DIA_NASZ_213_Gestath_KapThree_55_01"); //Co tu siê sta³o?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_02"); //No widzisz, kiedy ty poszed³eœ wraz z bandytami na ten klif, obóz zosta³ niemal niebroniony.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_03"); //W piêciu, bez najmniejszego problemu poradziliœmy sobie z resztk¹ bandytów. PóŸniej jeszcze przysz³o ich kilku, ale byli tak zdezorientowani... Ha, ha! Nie zdo³ali nawet dobyæ broni, a ju¿ padli trupem!
	AI_Output (other,self ,"DIA_NASZ_213_Gestath_KapThree_55_04"); //Tak, a ich elita czeka³a na mnie i chcieli ze mn¹ zrobiæ to samo!
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_05"); //Widzê, ¿e jednak wyszed³eœ z tego ca³o.
	
	if (hero.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_06"); //Dobra robota, Willu, œwietnie siê spisa³eœ. Od tego momentu zostajesz stra¿nikiem.
		Createinvitems (self, ITNA_OUT_H, 1);
		B_Giveinvitems (self, other, ITNA_OUT_H, 1);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_07"); //Noœ ten pancerz z dum¹, bo œwiadczy o twych wybitnych umiejêtnoœciach.
		AI_EquipBestArmor (other);
		AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_08"); //Chyba, ¿e chcia³byœ mieæ taki jak ja? Dogadaj siê z Huntem.
	};

	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_55_09"); //Dobra robota Willu, œwietnie siê spisa³eœ. Keroloth z pewnoœci¹ bêdzie dumny, ¿e ma takiego wojownika w swojej za³odze.
	};

	B_Kapitelwechsel		(3, NEWWORLD_ZEN );
	Gestath_Stopowanie = FALSE;
	
	B_LogEntry (TOPIC_Gestath_renegaci, "Ju¿ po wszystkim... Chocia¿ jedno zagro¿enie mniej w Górniczej Dolinie.");
	Log_SetTopicStatus (TOPIC_Gestath_renegaci, LOG_SUCCESS);
	B_GivePlayerXP (1000);
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Gestath wraz z innymi myœliwymi przejêli obóz bandytów. Powinienem zg³osiæ siê do Kerolotha. Czy¿by kolejne wyzwania?");
	
	B_LogEntry (TOPIC_Niedostepny_Klif, "Gestath i stra¿nicy za³atwili resztê bandytów.");
	Log_SetTopicStatus (TOPIC_Niedostepny_Klif, LOG_SUCCESS);

	Info_ClearChoices (DIA_NASZ_213_Gestath_KapThree);
	Info_AddChoice	  (DIA_NASZ_213_Gestath_KapThree, "Co teraz?", DIA_NASZ_213_Gestath_KapThree_what);

};

FUNC VOID DIA_NASZ_213_Gestath_KapThree_what()
{

	AI_Output (other,self ,"DIA_NASZ_213_Gestath_KapThree_where_15_00"); //Co teraz?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_where_55_01"); //Na razie mo¿esz odpocz¹æ. Ale zg³oœ siê do Kerolotha w najbli¿szym czasie. Z pewnoœci¹ mu siê przydasz w jego podbojach.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_where_55_02"); //Jeœli chodzi o ten obóz, to dowodziæ bêdzie tu Erak. Jeœli czegoœ chcesz, to z nim to za³atwiaj. Ja wracam do siebie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_KapThree_where_55_03"); //Do zobaczenia.

	Npc_ExchangeRoutine (self, "Start");
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Keroloth
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_keroloth   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 31;
 	condition   = DIA_NASZ_213_Gestath_keroloth_Condition;
 	information = DIA_NASZ_213_Gestath_keroloth_Info;
 	permanent   = FALSE;
 	description = "Przybywam z wiadomoœci¹ od Kerolotha.";
};

FUNC INT DIA_NASZ_213_Gestath_keroloth_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_WhatNow)
		&& npc_hasitems (other, ItNa_List_Keroloth) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_keroloth_Info()
{

	AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_00"); //Przybywam z wiadomoœci¹ od Kerolotha. £owcy orków chc¹ zaatakowaæ i odbiæ zamek, jednak aby siê tego podj¹æ, potrzebuj¹ waszej pomocy.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_01"); //Udzia³ tak doskonale wyszkolonych ³uczników w bitwie, da³by nam olbrzymi¹ przewagê nad si³ami wroga.
	B_giveinvitems (other, self, ItNa_List_Keroloth, 1);
	Npc_RemoveInvItems (self,ItNa_List_Keroloth, 1);
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_02"); //S³ysza³em o planach Kerolotha odnoœnie zamku, jednak nie spodziewa³em siê, i¿ naprawdê podejmie siê tego ryzyka.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_03"); //Niestety, wiêkszoœæ ze stra¿ników jest zajêta swoimi sprawami i przebywaj¹ poza obozem.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_04"); //I oczywiœcie to ja muszê ich znaleŸæ i grzecznie poprosiæ, aby pomogli ³owcom w wojnie. No dobra, kogo i gdzie szukaæ?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_05"); //Erak razem z Kivo i Benito s¹ w Obozie Bandytów. Ka¿dy z nich ma tam coœ do roboty.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_06"); //Aran ci¹gle stoi w jaskini obok obozu i dogl¹da orków.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_07"); //Ammann... Chyba go jeszcze nie znasz. On ma specjalne zadanie. Wysla³em go po pierœcienie wiernoœci. O cholera! Zapomnia³em, ¿e kilka dni temu powiedzia³em mu, ¿e ciê do niego przyœlê... Mo¿e byæ z³y.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_08"); //No ja bym na jego miejscu uœmiechniêty nie by³.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_09"); //Jest nad obozowiskiem wypadowym Eraka. Pamiêtasz, gdzie to jest? IdŸ po prostu w stronê kamiennej twierdzy w górach. Lepiej udaj siê tam od razu.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_10"); //Vachut jest oczywiœcie u siebie, to znaczy obok ³owców orków. Szczerze mówi¹c, nie mam pojêcia, co teraz robi...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_11"); //Ostatni raz widzia³em go, gdy wraca³em z obozu bandytów. Wspomina³ wtedy coœ o jakichœ dziwnych topielcach...
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_12"); //Ayana powinieneœ znaleŸæ pod obozowiskiem wypadowym Eraka. Trzymaj siê rzeki i idŸ w dó³, zgodnie z jej biegiem. O ile mnie pamiêæ nie myli, to gdzieœ tam by³ cmentarz orków.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_13"); //To bêdzie naprawdê ciê¿ka bitwa, do której nale¿y siê sowicie przygotowaæ. Orkowie to nie wargi czy zêbacze, dlatego zajmie nam to wiêcej czasu ni¿ przygotowanie do zwyczajnego polowania.
		
	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_14"); //Nie martw siê jednak o to, damy sobie radê w obozie. Ty wracaj do Kerolotha i przeka¿ mu, ¿e ja i inni myœliwi staniemy po jego stronie.
		AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_15"); //Oczywiœcie, jeœli osobiœcie przeniosê im personalne zaproszenia...
	}
	else { // GIL_OUT
		AI_Output (other, self,"DIA_NASZ_213_Gestath_keroloth_55_16"); //Oczywiœcie pomogê, w koñcu jestem jednym z was.
		AI_Output (self, other,"DIA_NASZ_213_Gestath_keroloth_55_17"); //Na nic innego nie liczy³em z twojej strony. Najlepiej bierzmy siê od razu do roboty, aby nie kazaæ Kerolothowi czekaæ ze szturmem. Im d³u¿ej zwlekamy tym wiêksza szansa, i¿ orkowie odkryj¹ co planujemy.
		
		B_LogEntry(TOPIC_Keroloth_Wojna,"Trzeba za³atwiæ kilka spraw w obozie myœliwych.");
	};

	
	Log_CreateTopic (TOPIC_Ammann_wiernosc, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_RUNNING);
	B_LogEntry (TOPIC_Ammann_wiernosc, "Nad obozem wypadowym myœliwych czeka na mnie Ammann. Mamy za³atwiæ jakieœ pierœcienie wiernoœci.");
	
	B_LogEntry (TOPIC_Keroloth_pomoc, "Gestath wyœle swoich ludzi, tylko je¿eli pomogê poza³atwiaæ im swoje sprawy. To bêdzie 6 stra¿ników, Erak i on sam. Erak, Kivo i Benito s¹ w obozie bandytów, Aran w jaskini obok obozu, Ammann na œcie¿ce do kamiennej twierdzy w górach, Vachut w swoim obozowisku obok ³owców orków, a Ayana powinienem znaleŸæ gdzieœ przy jakimœ orkowym cmentarzu.");
	
	Migration_LowcyToTwierdza();
	

	Wld_InsertNpc	(NASZ_218_Ammann,"PLATEAU_ROUND01");
	FF_ApplyOnceExt(TworzenieBroniGladiatorom,5000,-1);
};


//*********************************************************************
//	Info OUTDobarQuest
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_OUTDobarQuest   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 24;
 	condition   = DIA_NASZ_213_Gestath_OUTDobarQuest_Condition;
 	information = DIA_NASZ_213_Gestath_OUTDobarQuest_Info;
 	permanent   = FALSE;
 	description = "Od czego mogê zacz¹æ?";
};

FUNC INT DIA_NASZ_213_Gestath_OUTDobarQuest_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth))
	&& (hero.guild == GIL_OUT)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_OUTDobarQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_00"); //Od czego mogê zacz¹æ?
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_01"); //Jak wiesz, wielu moich ludzi nie dysponuje zbyt wytrzyma³ymi pancerzami. Te co prawda s¹ w stanie zapewniæ im ochronê przed k³ami wilka, lecz nie dadz¹ rady orkowej broni.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_02"); //Dlatego poleci³em Dobarowi, aby pomyœla³ nad ewentualnym ulepszeniem ich pancerzy, ¿eby mieli wiêksze szanse w trakcie walki.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_03"); //Z tego co wiem, ma ju¿ nawet pewien pomys³. Móg³byœ mu pomóc?
	AI_Output (other, self,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_04"); //Oczywiœcie, ju¿ biorê siê do pracy.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_05"); //Zaczekaj, to nie wszystko. Jak ju¿ wspomnia³em, Erak opuœci³ obóz wypadowy. Chcia³bym wiedzieæ, co z myœliwymi, którzy tam pozostali.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_06"); //Mo¿liwe, ¿e bêd¹ potrzebowali twojej pomocy.
	AI_Output (other, self,"DIA_NASZ_213_Gestath_OUTDobarQuest_55_07"); //Zajrzê tam, napewno.

	Log_CreateTopic (TOPIC_Dobar_pancerze, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dobar_pancerze, LOG_RUNNING);
	B_LogEntry (TOPIC_Dobar_pancerze, "Dobar opracowa³ umocnion¹ wersjê pancerza i moim zadaniem jest mu pomóc.");

};

//*********************************************************************
//	Info AllIsReady
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_AllIsReady   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 24;
 	condition   = DIA_NASZ_213_Gestath_AllIsReady_Condition;
 	information = DIA_NASZ_213_Gestath_AllIsReady_Info;
 	permanent   = FALSE;
 	description = "Wszystko ju¿ jest gotowe.";
};

FUNC INT DIA_NASZ_213_Gestath_AllIsReady_Condition()
{
	if (hero.guild == GIL_OUT)
	&& (npc_knowsinfo(other,DIA_NASZ_205_Mysliwy_QuestDone)) // podle gady
	&& (npc_knowsinfo(other,DIA_NASZ_232_Jehen_Part2Finish)) // jehen
	&& (WillSkonczylZadanieDobaraPancerze) // ulepszenie pancerzy
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_AllIsReady_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_AllIsReady_55_00"); //Wszystko ju¿ jest gotowe.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_AllIsReady_55_01"); //Dobra robota. Mogê wiêc zostawiæ obóz i stawiæ siê na proœbê Kerolotha osobiœcie.
	AI_Output (self, other,"DIA_NASZ_213_Gestath_AllIsReady_55_02"); //Dziêki za pomoc, Willu.
	
	B_LogEntry (TOPIC_Keroloth_Wojna, "Myœliwi w obozie maj¹ ju¿ wszystko, czego im by³o potrzeba. Mogê wróciæ do Kerolotha.");

	KerolothMysliwi = KerolothMysliwi + 1;
	Npc_ExchangeRoutine (self, "Twierdza");
};




























//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_213_Gestath_AmmannQuest   (C_INFO)
{
	npc         = NASZ_213_Gestath;
 	nr          = 32;
 	condition   = DIA_NASZ_213_Gestath_AmmannQuest_Condition;
 	information = DIA_NASZ_213_Gestath_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "WeŸ ten pierœcieñ.";
};

FUNC INT DIA_NASZ_213_Gestath_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_213_Gestath_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_213_Gestath_AmmannQuest_15_00"); //WeŸ ten pierœcieñ.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	Npc_RemoveInvItems (self,ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_213_Gestath_AmmannQuest_15_01"); //Pierœcieñ wiernoœci! A wiêc uporaliœcie siê z tym razem z Ammannem. Œwietna robota!

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		B_LogEntry (TOPIC_Ammann_wiernosc, "Rozda³em wszystkie pierœcienie.");
		Log_SetTopicStatus (TOPIC_Ammann_wiernosc, LOG_SUCCESS);
		B_GivePlayerXP (700);
		DodajReputacje(4,REP_MYSLIWI);
	};

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_213_Gestath_PICKPOCKET (C_INFO)
{
	npc			= NASZ_213_Gestath;
	nr			= 900;
	condition	= DIA_NASZ_213_Gestath_PICKPOCKET_Condition;
	information	= DIA_NASZ_213_Gestath_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_213_Gestath_PICKPOCKET_Condition()
{
	C_Beklauen (87);
};
 
FUNC VOID DIA_NASZ_213_Gestath_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_213_Gestath_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_213_Gestath_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_213_Gestath_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_213_Gestath_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_213_Gestath_PICKPOCKET_DoIt);
};

func void DIA_NASZ_213_Gestath_PICKPOCKET_DoIt()
{
	B_BeklauenGold(120);
	
	Info_ClearChoices (DIA_NASZ_213_Gestath_PICKPOCKET);
};
	
func void DIA_NASZ_213_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_213_Gestath_PICKPOCKET);
};
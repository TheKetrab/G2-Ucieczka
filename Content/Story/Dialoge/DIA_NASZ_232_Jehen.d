
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_EXIT   (C_INFO)
{
	npc         = NASZ_232_Jehen;
	nr          = 999;
	condition   = DIA_NASZ_232_Jehen_EXIT_Condition;
	information = DIA_NASZ_232_Jehen_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_232_Jehen_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_232_Jehen_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_siema   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 1;
 	condition   = DIA_NASZ_232_Jehen_siema_Condition;
 	information = DIA_NASZ_232_Jehen_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_siema_Condition()
{
	if (KAPITEL < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_siema_Info()
{

	AI_Output (self, other,"DIA_NASZ_232_Jehen_siema_55_00"); //St¹paj ciszej, bo sp³oszysz zwierzynê!
	AI_Output (other, self,"DIA_NASZ_232_Jehen_siema_55_01"); //Ty jesteœ Jehen?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_siema_55_02"); //Zgadza siê, pomó¿ mi uporaæ siê z tymi przeroœniêtymi ptaszyskami, to porozmawiamy.
	
	B_LogEntry (TOPIC_Jehen_strzala, "No i proszê, znalaz³em go! Zanim jednak z nim pogadam, musimy zabiæ kilka œcierwojadów.");
	
	Npc_ExchangeRoutine (self, "GuideToScavengers");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna(NASZ_232_Jehen,1);
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(NiespokojnyScierwojad1,"FP_ROAM_NIESPOKOJNY_SCIERWOJAD_01");
	Wld_InsertNpc	(NiespokojnyScierwojad2,"FP_ROAM_NIESPOKOJNY_SCIERWOJAD_02");
	Wld_InsertNpc	(NiespokojnyScierwojad3,"FP_ROAM_NIESPOKOJNY_SCIERWOJAD_03");
	
};

//*********************************************************************
//	Info GoodFight
//*********************************************************************
func void Jehen_Say_YouFindMe() {

	AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_YouFindMe_15_00"); //Jak rozumiem, nie znalaz³eœ mnie bez powodu?

};

INSTANCE DIA_NASZ_232_Jehen_GoodFight   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 2;
 	condition   = DIA_NASZ_232_Jehen_GoodFight_Condition;
 	information = DIA_NASZ_232_Jehen_GoodFight_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_GoodFight_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_232_Jehen_siema))
	&& (Npc_GetDistToWP (self, "NASZ_JEHEN_01") < 750)
	&& (npc_isdead (NiespokojnyScierwojad1))
	&& (npc_isdead (NiespokojnyScierwojad2))
	&& (npc_isdead (NiespokojnyScierwojad3))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_GoodFight_Info()
{
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GoodFight_15_00"); //To by³a dobra walka! Nic ci siê nie sta³o?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GoodFight_55_01"); //Kilka zadrapañ, nic powa¿nego. Bywa³em w wiêkszych tarapatach.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GoodFight_55_02"); //ChodŸ, podejdŸ do ogniska, nie bêdziesz przecie¿ sta³ na takim uboczu. Masz mo¿e ochotê na kawa³ek pieczonego miêsa i butelkê piwa?

	B_GivePlayerXP(100);
	DodajReputacje(1,REP_MYSLIWI);
	
	Npc_ExchangeRoutine (self, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna(NASZ_232_Jehen,0);
	
	Info_ClearChoices (DIA_NASZ_232_Jehen_GoodFight);
		Info_AddChoice	  (DIA_NASZ_232_Jehen_GoodFight, "Nie, dziêkujê.", DIA_NASZ_232_Jehen_GoodFight_No);
		Info_AddChoice	  (DIA_NASZ_232_Jehen_GoodFight, "Bardzo chêtnie.", DIA_NASZ_232_Jehen_GoodFight_Yes);

};

FUNC VOID DIA_NASZ_232_Jehen_GoodFight_No()
{
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_GoodFight_No_15_00"); //Nie, dziêkujê.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GoodFight_No_15_01"); //Na pewno? Szkoda, chcia³em ci podziêkowaæ za pomoc.
	Jehen_Say_YouFindMe();
	Info_ClearChoices (DIA_NASZ_232_Jehen_GoodFight);
};

FUNC VOID DIA_NASZ_232_Jehen_GoodFight_Yes()
{
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_GoodFight_Yes_15_00"); //Bardzo chêtnie.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GoodFight_Yes_15_01"); //Proszê, przygotowane wed³ug domowej receptury.
	CreateInvItems (self, ItFoMutton, 1);
	CreateInvItems (self, ItFo_Water, 1);
	B_GiveInvItems (self, other, ItFoMutton, 1);
	B_GiveInvItems (self, other, ItFo_Water, 1);
	B_UseItem(other,ItFoMutton);
	Jehen_Say_YouFindMe();
	Info_ClearChoices (DIA_NASZ_232_Jehen_GoodFight);
};


//*********************************************************************
//	Info GothSaid
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_GothSaid   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 2;
 	condition   = DIA_NASZ_232_Jehen_GothSaid_Condition;
 	information = DIA_NASZ_232_Jehen_GothSaid_Info;
 	permanent   = FALSE;
	description = "Tak naprawdê to Goth wspomnia³, gdzie mogê ciê znaleŸæ.";
};

FUNC INT DIA_NASZ_232_Jehen_GothSaid_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_232_Jehen_GoodFight))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_GothSaid_Info()
{
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_15_00"); //Tak naprawdê to Goth wspomnia³, gdzie mogê ciê znaleŸæ.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_01"); //S³ysza³em, ¿e nim zosta³eœ myœliwym, zajmowa³eœ siê wyrobem instrumentów.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_02"); //Konkretnie mam tutaj na myœli lutniê. Czy by³byœ w stanie mi pomóc?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_03"); //No to teraz mnie naprawdê zaskoczy³eœ, ch³opcze. Ju¿ od kilku dobrych lat nie zajmowa³em siê wytworem lutni i nie wiem, ile z tego jeszcze pamiêtam.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_04"); //Jak rozumiem to bardzo pilna sprawa? Mogê wiedzieæ do czego jest wam ona potrzebna?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_05"); //Potrzebuje jej Engor. Chcemy, aby zagra³ w naszym obozie dla reszty ³owców. Ca³a ta sytuacja w dolinie odciska na nich swoje piêtno.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_06"); //Uwa¿amy, to znaczy ja i Silas, ¿e muzyka ukoi ich sko³atane nerwy.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_07"); //To bardzo szlachetne z waszej strony, dlatego te¿ postaram siê wam pomóc. Jednak nim to zrobimy, zechcesz potowarzyszyæ mi w drodze do obozu?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_08"); //Mam kilka rzeczy do zabrania, a sam nie dam rady z tym wszystkim.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_09"); //Oczywiœcie.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_10"); //W takim razie za mn¹!
	CreateInvItems(self,ItNa_JehenPaczkaZFutrami,1);
	CreateInvItems(self,ItNa_JehenPaczkaZMiesem,1);
	B_GiveInvItems(self,other,ItNa_JehenPaczkaZFutrami,1);
	B_GiveInvItems(self,other,ItNa_JehenPaczkaZMiesem,1);
	
	B_LogEntry (TOPIC_Jehen_strzala, "Jehen pomo¿e mi, ale najpierw muszê pomóc mu zanieœæ kilka rzeczy do obozu. A wiêc w drogê!");
	
	Npc_ExchangeRoutine (self, "Prowadzenie");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna(NASZ_232_Jehen,1);
	AI_StopProcessInfos (self);
};


//*********************************************************************
//	Info ProwadzenieKoniec
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_ProwadzenieKoniec   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 3;
 	condition   = DIA_NASZ_232_Jehen_ProwadzenieKoniec_Condition;
 	information = DIA_NASZ_232_Jehen_ProwadzenieKoniec_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_ProwadzenieKoniec_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_232_Jehen_GothSaid)
		 && Npc_GetDistToWP	(self, "LOCATION_02_03") < 750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_ProwadzenieKoniec_Info()
{
	AI_Output (self, other,"DIA_NASZ_232_Jehen_ProwadzenieKoniec_55_00"); //Dziêkujê za pomoc. Oddaj proszê trofea Gestathowi, a ja pójdê przygotowaæ sobie niezbêdne narzêdzia.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_ProwadzenieKoniec_55_01"); //Znajdziesz mnie w budynku nad wejœciem do obozu.

	B_LogEntry (TOPIC_Jehen_strzala, "Przyniesione towary powinienem oddaæ Gestathowi.");

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Mysliwi");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna(NASZ_232_Jehen,0);
};

var int Jehen_Robi_Nowa_Lutnie;
var int JehenLuteDay;
var int JehenLuteSaidNoMoney;
var int JehenLuteCheckOneOption;
//*********************************************************************
//	Info TalkedToGestath
//*********************************************************************
func void Jehen_Say_AboutLute() {
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_AboutLute_55_00"); //Je¿eli chodzi o lutniê to uda³o mi siê znaleŸæ jedn¹ w swoich rzeczach. Jest trochê pozadzierana, ale bêdzie siê na niej da³o graæ. Mogê ci j¹ sprzedaæ za 50 sztuk z³ota lub...
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_AboutLute_55_01"); //Jeœli dostarczysz mi 150 z³otych monet to wykonam dla ciebie nowy instrument, z³oto oczywiœcie bêdzie mi potrzebne na pokrycie kosztów zwi¹zanych z materia³ami.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_AboutLute_55_02"); //Co wybierasz?

	if(npc_hasitems(other,ItMi_Gold)<50) {
		AI_Output (other, self,"DIA_NASZ_232_Jehen_Say_AboutLute_55_03"); //Obawiam siê, ¿e nie znajdê nawet 50 sztuk z³ota...
		AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_AboutLute_55_04"); //W takim razie poczekam, a¿ zgromadzisz tê sumkê pieniêdzy.
		JehenLuteSaidNoMoney = TRUE;
		Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
		B_LogEntry (TOPIC_Jehen_strzala, "Mogê kupiæ od Jehena jego star¹ lutniê za 50 sztuk z³ota albo daæ mu 150 sztuk z³ota, ¿eby zrobi³ nowy instrument.");
		//Print(IntToString(JehenLuteCheckOneOption));
		//Print(IntToString(JehenLuteSaidNoMoney));
	}

	else {

		Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
			if(npc_hasitems(other,ItMi_Gold)>=150) {
				Info_AddChoice	  (DIA_NASZ_232_Jehen_TalkedToGestath, "Myœlê, ¿e nowa lutnia sprawi Engorowi wiêksz¹ radoœæ.", DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew);
			};
			if(npc_hasitems(other,ItMi_Gold)>=50) {
				Info_AddChoice	  (DIA_NASZ_232_Jehen_TalkedToGestath, "Wezmê tê, któr¹ znalaz³eœ. Nie mogê zbytnio z tym zwlekaæ.", DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis);
			};
	};
};

INSTANCE DIA_NASZ_232_Jehen_TalkedToGestath   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 3;
 	condition   = DIA_NASZ_232_Jehen_TalkedToGestath_Condition;
 	information = DIA_NASZ_232_Jehen_TalkedToGestath_Info;
 	permanent   = FALSE;
	description = "Odda³em towar Gestathowi.";
};

FUNC INT DIA_NASZ_232_Jehen_TalkedToGestath_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_FromJehen))
	&& (npc_hasitems(other,ItRw_Arrow)>=100)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_Info()
{
	AI_Output (other, self,"DIA_NASZ_232_Jehen_TalkedToGestath_55_00"); //Odda³em towar Gestathowi.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_55_01"); //Ucieszy³ siê, ¿e wróci³em?
	
	B_GivePlayerXP(100);
	DodajReputacje(1,REP_MYSLIWI);

	Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
		Info_AddChoice	  (DIA_NASZ_232_Jehen_TalkedToGestath, "Trudno powiedzieæ, nie jest chyba w najlepszym nastroju.", DIA_NASZ_232_Jehen_TalkedToGestath_No);
		Info_AddChoice	  (DIA_NASZ_232_Jehen_TalkedToGestath, "Tak, kaza³ przekazaæ ci te sto strza³.", DIA_NASZ_232_Jehen_TalkedToGestath_Yes);

};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_No()
{
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_TalkedToGestath_No_15_00"); //Trudno powiedzieæ, nie jest chyba w najlepszym nastroju.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_No_15_01"); //Dziwne... To mu siê nie zdarza.
	Jehen_Say_AboutLute();
};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_Yes()
{
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_TalkedToGestath_Yes_15_00"); //Tak, kaza³ przekazaæ ci te sto strza³.
	B_GiveInvItems(other, self, ItRw_Arrow, 100);
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_Yes_15_01"); //Uczciwoœæ w tych czasach to rzadka sprawa, zw³aszcza z r¹k obcych. Dziêkujê nieznajomy.
	
	B_GivePlayerXP(100);
	Jehen_Say_AboutLute();

};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew()
{
	JehenLuteCheckOneOption = TRUE;
	
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew_15_00"); //Myœlê, ¿e nowa lutnia sprawi Engorowi wiêksz¹ radoœæ.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew_15_01"); //Oczywiœcie! DŸwiêk nowego instrumentu bêdzie na pewno przyjemniejszy dla uszu wielu ludzi.
	B_GiveInvItems(other,self,ItMi_Gold,150);
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew_15_02"); //Wróæ do mnie za dwa dni, a nowa lutnia bêdzie gotowa.
	Jehen_Robi_Nowa_Lutnie = TRUE;
	JehenLuteDay = Wld_GetDay();

	B_LogEntry (TOPIC_Jehen_strzala, "Wykonanie instrumentu zajmie myœliwemu dwa dni. Mam wiêc trochê czasu na swoje sprawy.");
		
	Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
	Info_ClearChoices (DIA_NASZ_232_Jehen_GivingMoney); // to tez trzeba zamknac bo mozna z tego wywolac
};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis()
{
	JehenLuteCheckOneOption = TRUE;
	
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis_15_00"); //Wezmê tê, któr¹ znalaz³eœ. Nie mogê zbytnio z tym zwlekaæ.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis_15_01"); //Oczywiœcie, proszê oto instrument.
	CreateInvItems(self,ItMi_Lute,1);
	B_GiveInvItems(self,other,ItMi_Lute,1);
	LutniaDlaEngora = 1;
	
	B_LogEntry (TOPIC_Jehen_strzala, "Zdecydowa³em, ¿e wezmê stary instument Jehena. Nie ma czasu do stracenia! Engor i tak bêdzie zadowolony - nie wspominaj¹c o Silasie.");
	Log_SetTopicStatus(TOPIC_Jehen_strzala, LOG_SUCCESS);
	
	Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
	Info_ClearChoices (DIA_NASZ_232_Jehen_GivingMoney); // to tez trzeba zamknac bo mozna z tego wywolac
};


//*********************************************************************
//	Info GivingMoney
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_GivingMoney   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 55;
 	condition   = DIA_NASZ_232_Jehen_GivingMoney_Condition;
 	information = DIA_NASZ_232_Jehen_GivingMoney_Info;
 	permanent   = FALSE;
	description = "Mam ju¿ pieni¹dze na zakup lutni.";
};

FUNC INT DIA_NASZ_232_Jehen_GivingMoney_Condition()	
{
	if (npc_hasitems(other,ItMi_Gold)>=50)
	&& (JehenLuteSaidNoMoney == TRUE)
	&& (JehenLuteCheckOneOption == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_GivingMoney_Info()
{
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GivingMoney_55_00"); //Mam ju¿ pieni¹dze na zakup lutni.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GivingMoney_55_01"); //Œwietnie. Wiêc jak bêdzie?
	
	Info_ClearChoices (DIA_NASZ_232_Jehen_GivingMoney);
		if(npc_hasitems(other,ItMi_Gold)>=150) {
			Info_AddChoice	  (DIA_NASZ_232_Jehen_GivingMoney, "Myœlê, ¿e nowa lutnia sprawi Engorowi wiêksz¹ radoœæ.", DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew);
		};
		if(npc_hasitems(other,ItMi_Gold)>=50) {
			Info_AddChoice	  (DIA_NASZ_232_Jehen_GivingMoney, "Wezmê tê, któr¹ znalaz³eœ. Nie mogê zbytnio z tym zwlekaæ.", DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis);
		};
};


//*********************************************************************
//	Info HowWork
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_HowWork   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_HowWork_Condition;
 	information = DIA_NASZ_232_Jehen_HowWork_Info;
 	permanent   = TRUE;
	description = "Jak idzie praca?";
};

FUNC INT DIA_NASZ_232_Jehen_HowWork_Condition()	
{
	if (Jehen_Robi_Nowa_Lutnie == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_HowWork_Info()
{
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HowWork_55_00"); //Jak idzie praca?
	
	if (TimeIsUp(2,-1,JehenLuteDay,-1) == FALSE) {
		AI_Output (self, other,"DIA_NASZ_232_Jehen_HowWork_55_01"); //Jeszcze trochê przede mn¹. Mam nadziejê, ¿e gryf wytrzyma naci¹g strun.	
	}
	
	else {
		Jehen_Robi_Nowa_Lutnie = FALSE;
		AI_Output (self, other,"DIA_NASZ_232_Jehen_HowWork_55_02"); //W³aœnie skoñczy³em, jestem pozytywnie zaskoczony z efektu koñcowego. Engor powinien byæ zadowolony, tylko nie uszkodŸ jej po drodze!	
		
		CreateInvItems(self,ItMi_Lute,1);
		B_GiveInvItems(self,other,ItMi_Lute,1);
		LutniaDlaEngora = 2;
	
		AI_Output (other, self,"DIA_NASZ_232_Jehen_HowWork_55_03"); //O to siê nie martw, trzymaj siê!
		AI_Output (self, other,"DIA_NASZ_232_Jehen_HowWork_55_04"); //Ty równie¿!
		
		Log_SetTopicStatus (TOPIC_Jehen_strzala, LOG_SUCCESS);
		B_LogEntry (TOPIC_Jehen_strzala, "Mam lutniê! Teraz mogê zanieœæ j¹ Engorowi.");
	};
	
};


//*********************************************************************
//	Info WhoDoISee
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_WhoDoISee   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_WhoDoISee_Condition;
 	information = DIA_NASZ_232_Jehen_WhoDoISee_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_WhoDoISee_Condition()	
{
	if (KAPITEL >= 3)
	&& (npc_knowsinfo (other, DIA_NASZ_224_Dobar_PancerzeStart))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_WhoDoISee_Info()
{
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_00"); //No proszê, kogo ja widzê! Co tutaj robisz?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_WhoDoISee_55_01"); //Witaj Jehenie, przybywam tu na proœbê Dobara. Nasz stary, poczciwy kowal nie mo¿e doczekaæ siê wyczekiwanej dostawy futer z orkowych psów.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_02"); //No to mamy powiem k³opot, gdy¿ nie mam tych skór. Ba, nawet nie zacz¹³em dobrze polowaæ!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_03"); //Nie doœæ, ¿e coœ przep³oszy³o st¹d wszystkie orkowe psy, to jeszcze, jakby tego by³o ma³o, w nocy natkn¹³em siê na stworzenie wygl¹daj¹ce na przeroœniêtego cieniostwora.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_WhoDoISee_55_04"); //Dlaczego wiêc go nie zastrzeli³eœ? Podejrzewam, i¿ jego skóra jest o wiele bardziej wytrzyma³a ni¿ ta pochodz¹ca z orkowych psów.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_05"); //Nie myœl, ze nie próbowa³em! Kiedy bestia przechodzi³a obok namiotu, poma³u z niego siê wykrad³em i zaszed³em ofiarê od ty³u, by strza³y trafi³y w najczulsze punkty w jego cielsku.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_06"); //Lecz wyobraŸ sobie, jakie musia³o byæ moje zdziwienie, kiedy œwiat³o ksiê¿yca oœwietli³o sylwetkê niedosz³ego cieniostwora.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_07"); //Nie, to na pewno nie by³ cieniostwór mimo tego, i¿ tak wygl¹da³! Sylwetka z³o¿ona z samych koœci, na których wisia³o gnij¹ce i rozk³adaj¹ce siê miêso po³¹czone bia³ymi œciêgnami i puste oczy na œrodku g³owy.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_08"); //Tak jak nie bojê siê noc¹ polowaæ, tak po zobaczeniu tego potwora chyba zmieniê swoje przyzwyczajenia.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_WhoDoISee_55_09"); //Wiesz, gdzie ta bestia siê uda³a?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_10"); //Tak, obserwowa³em j¹ jeszcze przez chwilê, nim ta zniknê³a mi z oczu. Powinniœmy na ni¹ zapolowaæ. Kto wie, jak groŸne jest to stworzenie i co mo¿e zrobiæ.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_WhoDoISee_55_11"); //Czy¿by twój strach przemin¹³?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_12"); //Nie, po prostu spe³niam swój obowi¹zek, a we dwóch bêdzie znacznie bezpieczniej. Wyruszamy o pó³nocy, nie zapomnij siê przygotowaæ.

	B_LogEntry (TOPIC_Dobar_pancerze, "Znalaz³em myœliwego, który jeszcze nie zacz¹³ polowaæ na orkowe psy. Okaza³o siê bowiem, i¿ spotka³ siê z zupe³nie nowym k³opotem, jakim by³o spotkanie z tajemniczym, nieumar³ym cieniostworem.");
};

//*********************************************************************
//	Info LetsGo
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_LetsGo   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_LetsGo_Condition;
 	information = DIA_NASZ_232_Jehen_LetsGo_Info;
 	permanent   = FALSE;
	description = "Jestem gotów, ruszajmy!";
};

FUNC INT DIA_NASZ_232_Jehen_LetsGo_Condition()	
{
	if (Wld_IsTime(23,00,23,59) || Wld_IsTime(00,00,02,00))
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_WhoDoISee))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_LetsGo_Info()
{
	AI_Output (other, self,"DIA_NASZ_232_Jehen_LetsGo_55_00"); //Jestem gotów, ruszajmy!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LetsGo_55_01"); //Trzymaj siê blisko mnie. Nie chcê, by coœ nas rozdzieli³o.

	Npc_ExchangeRoutine(self,"LastTimeISee");
	AI_StopProcessInfos(self);
	
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna(NASZ_232_Jehen,1);
	
	Log_CreateTopic (TOPIC_Jehen_poscig, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jehen_poscig, LOG_RUNNING);
	B_LogEntry (TOPIC_Jehen_poscig, "Wraz z nastaniem pó³nocy wyruszy³em z Jehenem na poszukiwania tajemniczej bestii. Blask ksiê¿yca powinien nam daæ wystarczaj¹co du¿o œwiat³a i jednoczeœnie cienia, do skrycia siê przed oczami stworzenia.");
};

//*********************************************************************
//	Info LastTimeISee
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_LastTimeISee   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_LastTimeISee_Condition;
 	information = DIA_NASZ_232_Jehen_LastTimeISee_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_LastTimeISee_Condition()	
{
	if (Npc_GetDistToWP(self,"PATH_TO_PLATEAU06") < 1000)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_LetsGo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_LastTimeISee_Info()
{
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_00"); //To w tym miejscu widzia³em j¹ po raz ostatni, dlatego te¿ od tej chwili powinniœmy byæ bardzo ostro¿ni. 
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_01"); //Trzymaj siê mnie i staraj siê nie zgubiæ. Kto wie, co mo¿e nas spotkaæ po drodze?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_LastTimeISee_55_02"); //Uwa¿asz, ¿e to jest normalne? Mam na myœli tego cieniostwora, który pojawi³ siê tutaj znik¹d.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_03"); //Szczerze mówi¹c to nie wydaje mi siê, aby to by³o normalne. Chocia¿ z drugiej strony nie wiadomo, jakie okropieñstwa mog¹ do nas przybywaæ z wymiaru Beliara.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_04"); //Równie dobrze mo¿e to byæ te¿ efekt rytua³u przywo³ania przeprowadzonego przez jakiegoœ maga.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_05"); //Tak samo prawdopodobne jest, i¿ ten cieniostwór zachorowa³ i jest ju¿ w stanie agonalnym, przez co wygl¹da, jak wygl¹da.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_06"); //Niezale¿nie od tego czym to jest i jak siê boimy, nale¿y siê tego stworzenia pozbyæ. Nie oci¹gajmy siê, musimy dopaœæ to stworzenie, nim bêdzie za póŸno. Trzymaj siê mnie.

	Npc_ExchangeRoutine(self,"DeadWarg");
	AI_StopProcessInfos(self);
	
	// wstawiamy martego warga
	Wld_InsertNpc(WargJehen,"FP_NASZ_MARTWYWARG");
	B_KillNPC(WargJehen);

};

//*********************************************************************
//	Info DeadWarg
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_DeadWarg   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_DeadWarg_Condition;
 	information = DIA_NASZ_232_Jehen_DeadWarg_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_DeadWarg_Condition()	
{
	if (Npc_GetDistToWP(self,"SPAWN_OW_WARAN_EBENE_02_05") < 1000)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_LastTimeISee))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_DeadWarg_Info()
{
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_00"); //Martwy warg? Œlady po pazurach wskazuj¹ na silne uderzenie skierowane bezpoœrednio na jego bok. To samo uderzenie pozbawi³o go od razu ¿ycia.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_01"); //Ponadto na sierœci dostrzegam dziwne plamy o fioletowej barwie, które siê... klej¹?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWarg_55_02"); //Jak myœlisz, co to mo¿e byæ? Nie wygl¹da mi to na krew, ani tym bardziej na coœ, co mog³o wydostaæ siê z cia³a warga.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_03"); //Nie, to na pewno nie krew, ani wydzielina z cia³a. Prêdzej jakaœ œlina lub coœ, co ma zwil¿aæ pokarm i go rozdrabniaæ. Prawdopodobnie pochodzi od tego cieniostwora.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_04"); //To ju¿ daje nam niepokoj¹ce wskazówki, i¿ nie mamy stycznoœci ze zwyk³¹ besti¹.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_05"); //Rozejrzyj siê po okolicy. Mo¿e znajdziesz coœ wa¿nego, co umknê³o mojej uwadze.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_06"); //Tylko nie oddalaj siê zbyt daleko bo inaczej stracê ciê z pola widzenia, a nie powinniœmy siê rozdzielaæ.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWarg_55_07"); //Rozejrzê siê po okolicy, a ty spróbuj siê czegoœ dowiedzieæ.
	
	
	Npc_ExchangeRoutine(self,"DeadWargWait");
	AI_StopProcessInfos(self);
	
	// wstawiamy koœæ
	Wld_InsertItem(ItNa_KoscWargJehen,"FP_NASZ_MARTWYWARG_KOSC");

};

//*********************************************************************
//	Info DeadWargBone
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_DeadWargBone   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_DeadWargBone_Condition;
 	information = DIA_NASZ_232_Jehen_DeadWargBone_Info;
 	permanent   = FALSE;
	description = "Znalaz³em tylko pêkniêt¹ koœæ.";
};

FUNC INT DIA_NASZ_232_Jehen_DeadWargBone_Condition()	
{
	if (npc_hasitems(other,ItNa_KoscWargJehen) >=1)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_DeadWarg))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_DeadWargBone_Info()
{
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWargBone_55_00"); //Znalaz³em tylko pêkniêt¹ koœæ.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWargBone_55_01"); //Wygl¹da tak, jakby ktoœ j¹ przegryz³ i wyplu³.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_02"); //Nie pomyli³eœ siê bardzo. Kiedy ty przeszukiwa³eœ okolicê, ja przyjrza³em siê naszej ofierze.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_03"); //Koœæ, któr¹ przynios³eœ, pasowa³aby do rany na jego prawej ³apie, gdzie w³aœnie tej koœci brakuje.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_04"); //Cieniostwór, lub to z czym mamy teraz do czynienia, prawdopodobnie z³apa³o warga i wyrwa³o mu ³apê po czym uderzy³o ³ap¹ i zabi³o na miejscu.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_05"); //Wyj¹tkowo okrutnie jak na mój gust. Powinniœmy siê lepiej przygotowaæ.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWargBone_55_06"); //Dowiedzia³eœ siê jeszcze czegoœ?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_07"); //Tak, jest jeszcze coœ. Uda³o mi siê znaleŸæ niewielkie, krwawe œlady prowadz¹ce w stronê tamtego klifu. Powinniœmy ju¿ ruszaæ, chodŸ.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWargBone_55_08"); //Gdzie widzisz te œlady? Ja nigdzie nie mogê ich dostrzec!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_09"); //Ch³opcze, jak bêdziesz myœliwym tyle lat co ja, to równie¿ nie bêdziesz mia³ z tym problemu. Za mn¹!
	
	Npc_ExchangeRoutine(self,"Korzenie");
	AI_StopProcessInfos(self);
	
	B_LogEntry (TOPIC_Jehen_poscig, "Nie musieliœmy odchodziæ daleko od obozu, a ju¿ znaleŸliœmy pierwsze œlady dzia³alnoœci naszej ofiary. W brutalny sposób zabi³a warga, który nawet nie mia³ szans w starciu z jej si³¹. Czymkolwiek to stworzenie jest, powinniœmy siê dobrze przygotowaæ do ewentualnej konfrontacji.");

};

//*********************************************************************
//	Info Korzenie
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_Korzenie   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_Korzenie_Condition;
 	information = DIA_NASZ_232_Jehen_Korzenie_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_Korzenie_Condition()	
{
	if (Npc_GetDistToWP(self,"NASZ_PRZEJSCIE_ROCKCAMP_2") < 1000)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_DeadWargBone))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_Korzenie_Info()
{
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_00"); //Mogê zadaæ ci jedno, bardzo wa¿ne pytanie?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Korzenie_55_01"); //Oczywiœcie, coœ siê sta³o?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_02"); //Odk¹d zaczêliœmy iœæ tropem tego stworzenia, zaczê³a boleæ mnie g³owa, a im dalej idziemy, tym ból staje siê coraz bardziej nie do zniesienia. Czujê siê, jakbym zaraz mia³ eksplodowaæ!
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Korzenie_55_03"); //Myœla³em, ¿e jedynie ja mam takie dolegliwoœci. Z ka¿dym krokiem czujê siê tak, jakby moje si³y mala³y, a moje cia³o stawa³o siê coraz s³absze i mnie wytrzyma³e.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_04"); //Dziwne rzeczy maj¹ tutaj miejsce, miejmy nadziejê, ¿e to nic powa¿nego, gdy¿ inaczej mo¿emy mieæ powa¿ne tarapaty.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_05"); //Jak ju¿ wczeœniej mówi³em, chcê siê przygotowaæ do walki z t¹ besti¹. Wróæ siê nad rzekê i powinieneœ znaleŸæ kilka rzecznych pn¹czy.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Korzenie_55_06"); //A có¿ to s¹ te rzeczne pn¹cza?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_07"); //Silnie toksyczne roœliny, które wy³aniaj¹ siê z ziemi jedynie w nocy i okreœlonych miejscach. S¹ bardzo rzadkie, a my mamy szczêœcie, gdy¿ zobaczy³em parê w korycie tej górskiej rzeki.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_08"); //Przynieœ mi cztery pn¹cza, tylko na mi³oœæ bosk¹, nie ³ap ich za korzenie, bo inaczej padniesz tutaj w konwulsjach przedœmiertelnych.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_09"); //Ja w tym czasie przygotujê sobie wszystkie przyrz¹dy do zrobienia zatrutych strza³.
	
	Npc_ExchangeRoutine(self,"KorzenieWait");
	AI_StopProcessInfos(self);
	
	Wld_InsertItem(ItNa_RzecznePnacze,"FP_NASZ_RZECZNE_PNACZE_1");
	Wld_InsertItem(ItNa_RzecznePnacze,"FP_NASZ_RZECZNE_PNACZE_2");
	Wld_InsertItem(ItNa_RzecznePnacze,"FP_NASZ_RZECZNE_PNACZE_3");
	Wld_InsertItem(ItNa_RzecznePnacze,"FP_NASZ_RZECZNE_PNACZE_4");
	
	B_LogEntry (TOPIC_Jehen_poscig, "Jehen powiedzia³ mi, i¿ od momentu wyruszenia mecz¹ go dziwne bóle g³owy. Nie by³oby w tym nic dziwnego, gdyby nie fakt, i¿ ja równie¿ mam takie dolegliwoœci. Cokolwiek to oznacza, chcê mieæ ju¿ to za sob¹.");
	B_LogEntry (TOPIC_Jehen_poscig, "Myœliwy opowiedzia³ mi o rzecznych pn¹czach, wysoce toksycznej roœlinie. Mam zebraæ cztery korzenie, które ten nastêpnie wykorzysta do zrobienia zatrutych strza³. Powinienem jednak uwa¿aæ, aby nie z³apaæ ich za korzenie. Szykuje siê niebezpieczna praca.");

};


//*********************************************************************
//	Info KorzenieDone
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_KorzenieDone   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_KorzenieDone_Condition;
 	information = DIA_NASZ_232_Jehen_KorzenieDone_Info;
 	permanent   = FALSE;
	description = "Mam cztery korzenie, tak jak potrzebowa³eœ.";
};

FUNC INT DIA_NASZ_232_Jehen_KorzenieDone_Condition()	
{
	if (npc_hasitems(other,ItNa_RzecznePnacze) >=4)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_Korzenie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_KorzenieDone_Info()
{
	B_GivePlayerXP(100);
	
	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_00"); //Mam cztery korzenie, tak jak potrzebowa³eœ.

	B_GiveInvItems(other,self,ItNa_RzecznePnacze,4);
	Npc_RemoveInvItems(self,ItNa_RzecznePnacze,4);

	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_01"); //Nie wspomnia³eœ jednak, i¿ ich zapach jest tak intensywny! Do teraz ³zawi¹ mi oczy.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_02"); //Musia³o to umkn¹æ mojej uwadze. Nie martw siê jednak, gdy¿ nie jest on szkodliwy dla zdrowia. Za kilka minut powinno ci przejœæ, a ja tymczasem zajmê siê ekstrakcj¹ toksyn.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_03"); //Robi³eœ to ju¿ wczeœniej? Wygl¹dasz na takiego, który zna siê nie tylko na sztuce ³owiectwa, ale i na roœlinach.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_04"); //Nauczy³em siê tej sztuki kiedy jeszcze ¿y³em w Monterze, niewielkim mieœcie w Myrtanie.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_05"); //Pewnego wieczoru przesiadywa³em w tamtejszej karczmie, pij¹c piwo po ciê¿kim i d³ugotrwa³ym polowaniu na wilki, gdy spostrzeg³em, jak do œrodka wchodzi facet w sukience.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_06"); //Dwóch goœci za nim, którzy dzier¿yli po dwa ostrza na plecach umocni³o mnie w tym, i¿ by³ to asasyn. Los chcia³, ¿e zaczêliœmy ze sob¹ rozmawiaæ, a po kilku g³êbszych zostaliœmy wrêcz kolegami.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_07"); //W okresie, kiedy przebywa³ w mieœcie, nauczy³ mnie wielu sztuczek swojego ludu, jak w³aœnie ta z produkcj¹ strza³ zanurzonych w neurotoksynie pozyskanej z rzecznych pn¹czy.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_08"); //Nie s¹dzi³em, ¿e mia³eœ kontakty wœród ludów pustyni.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_09"); //Przez d³u¿szy czas polowa³em na zwierzynê specjalnie na ich zamówienia, gdy¿ wielu z nich chcia³o posiadaæ w swej kolekcji futra szablozêbów czy œnie¿nych wilków, a dla mnie ka¿da podró¿ do Nordmaru by³a przyjemnoœci¹.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_10"); //Nawet nie wiesz, jak têskniê za tamtejszymi górami. Niestety wojna zmusi³a mnie do ucieczki na Khorinis, gdy¿ liczy³em, ¿e bêdê tutaj bezpieczny.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_11"); //A jak widzisz los zdecydowa³ siê pójœæ mi na przekór i wrzuci³ mnie w wojnê, przed któr¹ przecie¿ ucieka³em.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_12"); //No, strza³y gotowe. Mo¿emy iœæ dalej, tylko dok¹...
	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_13"); //S³ysza³eœ? Coœ jakby ryk lub wycie odbijaj¹ce siê echem od ska³!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_14"); //A¿ zbyt dobrze! Trzymaj siê mnie i miej broñ w gotowoœci!

	Npc_ExchangeRoutine(self,"Trup");
	AI_StopProcessInfos(self);

	Wld_InsertNpc(NASZ_022_Trup,"NASZ_JEHEN_QUEST_05");
	B_KillNPC(NASZ_022_Trup);
	
	B_LogEntry (TOPIC_Jehen_poscig, "Podczas produkcji strza³ Jehen opowiedzia³ mi co nieco o swojej przesz³oœci. Cz³owiek, który ucieka³ przed wojn¹, aby ratowaæ swe, ¿ycie znalaz³ siê w jej centrum. Mimo tego nie podda³ siê i walczy dalej. Mam tylko nadziejê, ¿e w koñcu odnajdzie swój spokój. Nied³ugo po rozmowie us³yszeliœmy dziwny ryk i natychmiast pobiegliœmy w tamto miejsce...");
};

//*********************************************************************
//	Info Trup
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_Trup   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_Trup_Condition;
 	information = DIA_NASZ_232_Jehen_Trup_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_Trup_Condition()	
{
	if (Npc_GetDistToWP(self,"NASZ_JEHEN_QUEST_05") < 1000)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_KorzenieDone))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_Trup_Info()
{

	AI_Output (self, other,"DIA_NASZ_232_Jehen_Trup_55_00"); //Innosie, miej tego biedaka w opiece!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Trup_55_01"); //Zaraz... To przecie¿ duch! Czy ta bestia by³a w stanie uœmierciæ nawet kogoœ, kto ju¿ nie ¿yje?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Trup_55_02"); //Nawet nie chcê wiedzieæ, ile¿ musia³ wycierpieæ przy kontakcie z tym stworzeniem. Spójrz na jego pancerz. Ca³y we krwi, a prawy bok tu³owia poszarpany, jakby ktoœ wyrwa³ mu skórê.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Trup_55_03"); //To tylko umacnia nas w tym, i¿ ta bestia jest cholernie silna i niebezpieczna. Co zrobimy dalej?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Trup_55_04"); //W³aœnie siê nad tym zastanawiam... S³ysza³eœ? Kolejny ryk, coœ jakby warkniêcie. A! Widzê bestiê! Ruszamy, ubezpieczaj moje ty³y!

	Npc_ExchangeRoutine(self,"Bestia1");
	AI_StopProcessInfos(self);
	
	self.flags = 2;

	Wld_InsertNpc(BestiaSwiatynna,"NASZ_JEHEN_QUEST_06");
	
};


//*********************************************************************
//	Info Bestia1
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_Bestia1   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_Bestia1_Condition;
 	information = DIA_NASZ_232_Jehen_Bestia1_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_Bestia1_Condition()	
{
	if (Npc_GetDistToWP(self,"NASZ_JEHEN_QUEST_06") < 1000)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_Trup))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_Bestia1_Info()
{
	B_GivePlayerXP(200);
	DodajReputacje(2,REP_MYSLIWI);
	
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Bestia1_55_00"); //To by³a ciê¿ka walka, ale na szczêœcie dobieg³a koñca. Nie s¹dzi³em, ¿e on bêdzie a¿ tak silny. Wszystko w porz¹dku?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Bestia1_55_01"); //Tak, na szczêœcie ta rana to niewielkie zadrapanie. Kilka centymetrów wy¿ej i by³bym ju¿ martwy, bardziej ciekawi mnie to, co porasta jego cia³o. Coœ jakby ³uski?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Bestia1_55_02"); //Mo¿e powinieneœ siê im przyjrzeæ. Wyrwij ile zdo³asz. Ja z rozwalon¹ rêk¹ nie bardzo dam sobie z tym rade.
	
	self.flags = 0;

	Npc_ExchangeRoutine(self,"Bestia1");
	
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna(NASZ_232_Jehen,0);
	
	
	AI_StopProcessInfos(self);
	
	B_LogEntry (TOPIC_Jehen_poscig, "Przy ciele bestii znaleŸliœmy ³uski, które mog¹ pos³u¿yæ Dobarowi do wzmocnienia naszych pancerzy.");

};

//*********************************************************************
//	Info HaveLuski
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_HaveLuski   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_HaveLuski_Condition;
 	information = DIA_NASZ_232_Jehen_HaveLuski_Info;
 	permanent   = FALSE;
	description = "Wyrwa³em kilka ³usek.";
};

FUNC INT DIA_NASZ_232_Jehen_HaveLuski_Condition()	
{
	if (npc_hasitems(other,ItNa_LuskaBestii) >= 3)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_Trup))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_HaveLuski_Info()
{
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HaveLuski_55_00"); //Wyrwa³em kilka ³usek.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HaveLuski_55_01"); //To jakaœ skorupa poroœniêta tkank¹, która tworzy³a kiedyœ cia³o tej bestii. Wydaje siê byæ bardzo wytrzyma³¹, bo znajdowa³a siê w miejscu, gdzie atakowaliœmy to stworzenie swoimi mieczami.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HaveLuski_55_02"); //Byæ mo¿e to nada siê do wzmocnienia naszych pancerzy? Jak uwa¿asz?	
	AI_Output (self, other,"DIA_NASZ_232_Jehen_HaveLuski_55_03"); //Myœlê, ¿e Dobar by³by zadowolony, lecz to jedynie trzy ³uski. Raczej nie zrobi z tego pancerzy dla wszystkich ch³opaków, jednak masz racjê. Nale¿y mu o tym powiedzieæ, mo¿e jakoœ odtworzy to ze swojego metalu.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_HaveLuski_55_04"); //Zaczekaj... Te¿ widzia³eœ ten b³ysk? Dochodzi³ jakby spod wody. Chyba pod wulkanem jest jaskinia. 
	AI_Output (self, other,"DIA_NASZ_232_Jehen_HaveLuski_55_05"); //Udaj siê tam. Ja ze swoj¹ rêk¹ wola³bym nie wchodziæ do wody, bo ci¹gle krwawi. Poczekam tutaj na ciebie.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HaveLuski_55_06"); //Sprawdzê to i zaraz wrócê.
	
	AI_StopProcessInfos(self);
	
	B_LogEntry (TOPIC_Jehen_poscig, "Jehen zauwa¿y³ b³ysk œwiat³a dochodz¹cy spod wody, z jaskini pod wulkanem. Muszê to sprawdziæ.");
	B_StartOtherRoutine(NASZ_021_Nieznajomy,"StartOUT");
};

//*********************************************************************
//	Info Part2Start
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_Part2Start   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_Part2Start_Condition;
 	information = DIA_NASZ_232_Jehen_Part2Start_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_232_Jehen_Part2Start_Condition()	
{

	if (npc_knowsinfo (other, DIA_NASZ_021_Nieznajomy_StartZacmienieOUT))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_Part2Start_Info()
{
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_00"); //A niech to, jesteœ!
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Part2Start_55_01"); //Jakim cudem siê tutaj znalaz³eœ i dlaczego nie zaczeka³eœ nad jeziorem?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_02"); //Zaniepokoi³em siê, gdy wp³yn¹³eœ pod wodê i d³ugo ciê nie widzia³em. Chcia³em udaæ siê za tob¹, ale moja rêka jest w ciê¿kim stanie.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_03"); //Przeliczy³em siê z si³ami i porwa³ mnie wodospad. Gdy wyp³yn¹³em na powierzchnie i chcia³em dobiæ do brzegu, sta³o siê dok³adnie to samo.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_04"); //Wyczo³ga³em siê na powierzchniê tutaj i odpoczywam. Ale to nie wszystko! Zastanawiasz siê pewnie, czemu tutaj siedzê?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Part2Start_55_05"); //No tak, na twoim miejscu poszed³bym st¹d z powrotem do namiotu. To nie a¿ tak daleko.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_06"); //Te¿ mia³em taki zamiar. Ale zauwa¿y³em trop kolejnego potwora! Prowadzi do jaskini, pod wodê.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_07"); //Skoro ju¿ mnie znalaz³eœ, to mogê wróciæ do namiotu, bo bestiê ujarzmisz ty. Wp³yñ tam i nie daj siê jej. Wróæ do mnie i nie zapomnij o ³uskach!
	
	AI_StopProcessInfos(self);
	
	Npc_ExchangeRoutine(self,"Namiot");
	B_LogEntry (TOPIC_Jehen_zagubiony, "Znalaz³em myœliwego, który z kolei natrafi³ na trop kolejnej bestii. Muszê wp³yn¹æ za ni¹ do podwodnej jaskini i zebraæ jej ³uski. Szkoda, ¿e tym razem bêdê musia³ sam siê z ni¹ zmierzyæ.");
	Wld_InsertNpc(BestiaSwiatynna,"NASZ_JEHEN_QUEST_12");
	
};

//*********************************************************************
//	Info Part2Finish
//*********************************************************************
INSTANCE DIA_NASZ_232_Jehen_Part2Finish   (C_INFO)
{
	npc         = NASZ_232_Jehen;
 	nr          = 4;
 	condition   = DIA_NASZ_232_Jehen_Part2Finish_Condition;
 	information = DIA_NASZ_232_Jehen_Part2Finish_Info;
 	permanent   = FALSE;
	description = "Pozyska³em kolejne ³uski.";
};

FUNC INT DIA_NASZ_232_Jehen_Part2Finish_Condition()	
{
	if (npc_hasitems(other,ItNa_LuskaBestii) >= 6)
	&& (npc_knowsinfo (other, DIA_NASZ_232_Jehen_Part2Start))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_232_Jehen_Part2Finish_Info()
{
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Part2Finish_55_00"); //Pozyska³em kolejne ³uski.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Finish_55_01"); //Œwietna robota! Dobar na pewno wykorzysta je i umocni pancerze. 
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Part2Finish_55_02"); //Co ze skórami orkowych psów? Kowalowi wystarcz¹ same ³uski?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Finish_55_03"); //Nie mam zielonego pojêcia. Mo¿esz ich trochê zebraæ, ale nie licz na moj¹ pomoc.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Finish_55_04"); //Odpocz¹³em trochê, ale moja rêka nie umo¿liwi mi uczestnictwa w polowaniu. Spróbujê wróciæ do obozu. Do zobaczenia!

	AI_StopProcessInfos(self);
	
	Npc_ExchangeRoutine(self,"Mysliwi");

	B_LogEntry (TOPIC_Dobar_pancerze, "Mogê zanieœæ kowalowi ³uski z tych bestii, ale nie wiem co ze skórami orkowych psów. Mo¿e te¿ kilka zdejmê?");
	
	Log_SetTopicStatus (TOPIC_Jehen_zagubiony, LOG_SUCCESS);
	B_LogEntry (TOPIC_Jehen_zagubiony, "Jehen odzyska³ si³y i wróci do obozu. Mam nadziejê, ¿e nie spotkam ju¿ wiêcej tych strasznych bestii.");
	DodajReputacje(2,REP_MYSLIWI);
	B_GivePlayerXP(700);

	Wld_InsertNpc(OrcDog,"FP_ROAM_OW_ORCBARRIER_04_01");
	Wld_InsertNpc(OrcDog,"FP_ROAM_OW_ORCBARRIER_04_02");
	Wld_InsertNpc(OrcDog,"FP_ROAM_OW_ORCBARRIER_04_03");
	Wld_InsertNpc(OrcDog,"FP_ROAM_OW_ORCBARRIER_04_04");
	Wld_InsertNpc(OrcDog,"FP_ROAM_OW_ORCBARRIER_04_05");
	
};










// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_232_Jehen_PICKPOCKET (C_INFO)
{
	npc			= NASZ_232_Jehen;
	nr			= 900;
	condition	= DIA_NASZ_232_Jehen_PICKPOCKET_Condition;
	information	= DIA_NASZ_232_Jehen_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_232_Jehen_PICKPOCKET_Condition()
{
	C_Beklauen (35);
};
 
FUNC VOID DIA_NASZ_232_Jehen_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_232_Jehen_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_232_Jehen_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_232_Jehen_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_232_Jehen_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_232_Jehen_PICKPOCKET_DoIt);
};

func void DIA_NASZ_232_Jehen_PICKPOCKET_DoIt()
{
	B_BeklauenGold(33);
	
	Info_ClearChoices (DIA_NASZ_232_Jehen_PICKPOCKET);
};
	
func void DIA_NASZ_232_Jehen_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_232_Jehen_PICKPOCKET);
};

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

	AI_Output (self, other,"DIA_NASZ_232_Jehen_siema_55_00"); //St�paj ciszej, bo sp�oszysz zwierzyn�!
	AI_Output (other, self,"DIA_NASZ_232_Jehen_siema_55_01"); //Ty jeste� Jehen?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_siema_55_02"); //Zgadza si�, pom� mi upora� si� z tymi przero�ni�tymi ptaszyskami, to porozmawiamy.
	
	B_LogEntry (TOPIC_Jehen_strzala, "No i prosz�, znalaz�em go! Zanim jednak z nim pogadam, musimy zabi� kilka �cierwojad�w.");
	
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

	AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_YouFindMe_15_00"); //Jak rozumiem, nie znalaz�e� mnie bez powodu?

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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GoodFight_15_00"); //To by�a dobra walka! Nic ci si� nie sta�o?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GoodFight_55_01"); //Kilka zadrapa�, nic powa�nego. Bywa�em w wi�kszych tarapatach.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GoodFight_55_02"); //Chod�, podejd� do ogniska, nie b�dziesz przecie� sta� na takim uboczu. Masz mo�e ochot� na kawa�ek pieczonego mi�sa i butelk� piwa?

	B_GivePlayerXP(100);
	DodajReputacje(1,REP_MYSLIWI);
	
	Npc_ExchangeRoutine (self, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna(NASZ_232_Jehen,0);
	
	Info_ClearChoices (DIA_NASZ_232_Jehen_GoodFight);
		Info_AddChoice	  (DIA_NASZ_232_Jehen_GoodFight, "Nie, dzi�kuj�.", DIA_NASZ_232_Jehen_GoodFight_No);
		Info_AddChoice	  (DIA_NASZ_232_Jehen_GoodFight, "Bardzo ch�tnie.", DIA_NASZ_232_Jehen_GoodFight_Yes);

};

FUNC VOID DIA_NASZ_232_Jehen_GoodFight_No()
{
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_GoodFight_No_15_00"); //Nie, dzi�kuj�.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GoodFight_No_15_01"); //Na pewno? Szkoda, chcia�em ci podzi�kowa� za pomoc.
	Jehen_Say_YouFindMe();
	Info_ClearChoices (DIA_NASZ_232_Jehen_GoodFight);
};

FUNC VOID DIA_NASZ_232_Jehen_GoodFight_Yes()
{
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_GoodFight_Yes_15_00"); //Bardzo ch�tnie.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GoodFight_Yes_15_01"); //Prosz�, przygotowane wed�ug domowej receptury.
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
	description = "Tak naprawd� to Goth wspomnia�, gdzie mog� ci� znale��.";
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
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_15_00"); //Tak naprawd� to Goth wspomnia�, gdzie mog� ci� znale��.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_01"); //S�ysza�em, �e nim zosta�e� my�liwym, zajmowa�e� si� wyrobem instrument�w.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_02"); //Konkretnie mam tutaj na my�li lutni�. Czy by�by� w stanie mi pom�c?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_03"); //No to teraz mnie naprawd� zaskoczy�e�, ch�opcze. Ju� od kilku dobrych lat nie zajmowa�em si� wytworem lutni i nie wiem, ile z tego jeszcze pami�tam.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_04"); //Jak rozumiem to bardzo pilna sprawa? Mog� wiedzie� do czego jest wam ona potrzebna?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_05"); //Potrzebuje jej Engor. Chcemy, aby zagra� w naszym obozie dla reszty �owc�w. Ca�a ta sytuacja w dolinie odciska na nich swoje pi�tno.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_06"); //Uwa�amy, to znaczy ja i Silas, �e muzyka ukoi ich sko�atane nerwy.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_07"); //To bardzo szlachetne z waszej strony, dlatego te� postaram si� wam pom�c. Jednak nim to zrobimy, zechcesz potowarzyszy� mi w drodze do obozu?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_08"); //Mam kilka rzeczy do zabrania, a sam nie dam rady z tym wszystkim.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GothSaid_55_09"); //Oczywi�cie.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GothSaid_55_10"); //W takim razie za mn�!
	CreateInvItems(self,ItNa_JehenPaczkaZFutrami,1);
	CreateInvItems(self,ItNa_JehenPaczkaZMiesem,1);
	B_GiveInvItems(self,other,ItNa_JehenPaczkaZFutrami,1);
	B_GiveInvItems(self,other,ItNa_JehenPaczkaZMiesem,1);
	
	B_LogEntry (TOPIC_Jehen_strzala, "Jehen pomo�e mi, ale najpierw musz� pom�c mu zanie�� kilka rzeczy do obozu. A wi�c w drog�!");
	
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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_ProwadzenieKoniec_55_00"); //Dzi�kuj� za pomoc. Oddaj prosz� trofea Gestathowi, a ja p�jd� przygotowa� sobie niezb�dne narz�dzia.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_ProwadzenieKoniec_55_01"); //Znajdziesz mnie w budynku nad wej�ciem do obozu.

	B_LogEntry (TOPIC_Jehen_strzala, "Przyniesione towary powinienem odda� Gestathowi.");

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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_AboutLute_55_00"); //Je�eli chodzi o lutni� to uda�o mi si� znale�� jedn� w swoich rzeczach. Jest troch� pozadzierana, ale b�dzie si� na niej da�o gra�. Mog� ci j� sprzeda� za 50 sztuk z�ota lub...
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_AboutLute_55_01"); //Je�li dostarczysz mi 150 z�otych monet to wykonam dla ciebie nowy instrument, z�oto oczywi�cie b�dzie mi potrzebne na pokrycie koszt�w zwi�zanych z materia�ami.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_AboutLute_55_02"); //Co wybierasz?

	if(npc_hasitems(other,ItMi_Gold)<50) {
		AI_Output (other, self,"DIA_NASZ_232_Jehen_Say_AboutLute_55_03"); //Obawiam si�, �e nie znajd� nawet 50 sztuk z�ota...
		AI_Output (self, other,"DIA_NASZ_232_Jehen_Say_AboutLute_55_04"); //W takim razie poczekam, a� zgromadzisz t� sumk� pieni�dzy.
		JehenLuteSaidNoMoney = TRUE;
		Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
		B_LogEntry (TOPIC_Jehen_strzala, "Mog� kupi� od Jehena jego star� lutni� za 50 sztuk z�ota albo da� mu 150 sztuk z�ota, �eby zrobi� nowy instrument.");
		//Print(IntToString(JehenLuteCheckOneOption));
		//Print(IntToString(JehenLuteSaidNoMoney));
	}

	else {

		Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
			if(npc_hasitems(other,ItMi_Gold)>=150) {
				Info_AddChoice	  (DIA_NASZ_232_Jehen_TalkedToGestath, "My�l�, �e nowa lutnia sprawi Engorowi wi�ksz� rado��.", DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew);
			};
			if(npc_hasitems(other,ItMi_Gold)>=50) {
				Info_AddChoice	  (DIA_NASZ_232_Jehen_TalkedToGestath, "Wezm� t�, kt�r� znalaz�e�. Nie mog� zbytnio z tym zwleka�.", DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis);
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
	description = "Odda�em towar Gestathowi.";
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
	AI_Output (other, self,"DIA_NASZ_232_Jehen_TalkedToGestath_55_00"); //Odda�em towar Gestathowi.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_55_01"); //Ucieszy� si�, �e wr�ci�em?
	
	B_GivePlayerXP(100);
	DodajReputacje(1,REP_MYSLIWI);

	Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
		Info_AddChoice	  (DIA_NASZ_232_Jehen_TalkedToGestath, "Trudno powiedzie�, nie jest chyba w najlepszym nastroju.", DIA_NASZ_232_Jehen_TalkedToGestath_No);
		Info_AddChoice	  (DIA_NASZ_232_Jehen_TalkedToGestath, "Tak, kaza� przekaza� ci te sto strza�.", DIA_NASZ_232_Jehen_TalkedToGestath_Yes);

};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_No()
{
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_TalkedToGestath_No_15_00"); //Trudno powiedzie�, nie jest chyba w najlepszym nastroju.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_No_15_01"); //Dziwne... To mu si� nie zdarza.
	Jehen_Say_AboutLute();
};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_Yes()
{
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_TalkedToGestath_Yes_15_00"); //Tak, kaza� przekaza� ci te sto strza�.
	B_GiveInvItems(other, self, ItRw_Arrow, 100);
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_Yes_15_01"); //Uczciwo�� w tych czasach to rzadka sprawa, zw�aszcza z r�k obcych. Dzi�kuj� nieznajomy.
	
	B_GivePlayerXP(100);
	Jehen_Say_AboutLute();

};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew()
{
	JehenLuteCheckOneOption = TRUE;
	
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew_15_00"); //My�l�, �e nowa lutnia sprawi Engorowi wi�ksz� rado��.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew_15_01"); //Oczywi�cie! D�wi�k nowego instrumentu b�dzie na pewno przyjemniejszy dla uszu wielu ludzi.
	B_GiveInvItems(other,self,ItMi_Gold,150);
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew_15_02"); //Wr�� do mnie za dwa dni, a nowa lutnia b�dzie gotowa.
	Jehen_Robi_Nowa_Lutnie = TRUE;
	JehenLuteDay = Wld_GetDay();

	B_LogEntry (TOPIC_Jehen_strzala, "Wykonanie instrumentu zajmie my�liwemu dwa dni. Mam wi�c troch� czasu na swoje sprawy.");
		
	Info_ClearChoices (DIA_NASZ_232_Jehen_TalkedToGestath);
	Info_ClearChoices (DIA_NASZ_232_Jehen_GivingMoney); // to tez trzeba zamknac bo mozna z tego wywolac
};

FUNC VOID DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis()
{
	JehenLuteCheckOneOption = TRUE;
	
	AI_Output (other,self ,"DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis_15_00"); //Wezm� t�, kt�r� znalaz�e�. Nie mog� zbytnio z tym zwleka�.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis_15_01"); //Oczywi�cie, prosz� oto instrument.
	CreateInvItems(self,ItMi_Lute,1);
	B_GiveInvItems(self,other,ItMi_Lute,1);
	LutniaDlaEngora = 1;
	
	B_LogEntry (TOPIC_Jehen_strzala, "Zdecydowa�em, �e wezm� stary instument Jehena. Nie ma czasu do stracenia! Engor i tak b�dzie zadowolony - nie wspominaj�c o Silasie.");
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
	description = "Mam ju� pieni�dze na zakup lutni.";
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
	AI_Output (other, self,"DIA_NASZ_232_Jehen_GivingMoney_55_00"); //Mam ju� pieni�dze na zakup lutni.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_GivingMoney_55_01"); //�wietnie. Wi�c jak b�dzie?
	
	Info_ClearChoices (DIA_NASZ_232_Jehen_GivingMoney);
		if(npc_hasitems(other,ItMi_Gold)>=150) {
			Info_AddChoice	  (DIA_NASZ_232_Jehen_GivingMoney, "My�l�, �e nowa lutnia sprawi Engorowi wi�ksz� rado��.", DIA_NASZ_232_Jehen_TalkedToGestath_MakeNew);
		};
		if(npc_hasitems(other,ItMi_Gold)>=50) {
			Info_AddChoice	  (DIA_NASZ_232_Jehen_GivingMoney, "Wezm� t�, kt�r� znalaz�e�. Nie mog� zbytnio z tym zwleka�.", DIA_NASZ_232_Jehen_TalkedToGestath_TakeThis);
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
		AI_Output (self, other,"DIA_NASZ_232_Jehen_HowWork_55_01"); //Jeszcze troch� przede mn�. Mam nadziej�, �e gryf wytrzyma naci�g strun.	
	}
	
	else {
		Jehen_Robi_Nowa_Lutnie = FALSE;
		AI_Output (self, other,"DIA_NASZ_232_Jehen_HowWork_55_02"); //W�a�nie sko�czy�em, jestem pozytywnie zaskoczony z efektu ko�cowego. Engor powinien by� zadowolony, tylko nie uszkod� jej po drodze!	
		
		CreateInvItems(self,ItMi_Lute,1);
		B_GiveInvItems(self,other,ItMi_Lute,1);
		LutniaDlaEngora = 2;
	
		AI_Output (other, self,"DIA_NASZ_232_Jehen_HowWork_55_03"); //O to si� nie martw, trzymaj si�!
		AI_Output (self, other,"DIA_NASZ_232_Jehen_HowWork_55_04"); //Ty r�wnie�!
		
		Log_SetTopicStatus (TOPIC_Jehen_strzala, LOG_SUCCESS);
		B_LogEntry (TOPIC_Jehen_strzala, "Mam lutni�! Teraz mog� zanie�� j� Engorowi.");
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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_00"); //No prosz�, kogo ja widz�! Co tutaj robisz?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_WhoDoISee_55_01"); //Witaj Jehenie, przybywam tu na pro�b� Dobara. Nasz stary, poczciwy kowal nie mo�e doczeka� si� wyczekiwanej dostawy futer z orkowych ps�w.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_02"); //No to mamy powiem k�opot, gdy� nie mam tych sk�r. Ba, nawet nie zacz��em dobrze polowa�!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_03"); //Nie do��, �e co� przep�oszy�o st�d wszystkie orkowe psy, to jeszcze, jakby tego by�o ma�o, w nocy natkn��em si� na stworzenie wygl�daj�ce na przero�ni�tego cieniostwora.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_WhoDoISee_55_04"); //Dlaczego wi�c go nie zastrzeli�e�? Podejrzewam, i� jego sk�ra jest o wiele bardziej wytrzyma�a ni� ta pochodz�ca z orkowych ps�w.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_05"); //Nie my�l, ze nie pr�bowa�em! Kiedy bestia przechodzi�a obok namiotu, poma�u z niego si� wykrad�em i zaszed�em ofiar� od ty�u, by strza�y trafi�y w najczulsze punkty w jego cielsku.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_06"); //Lecz wyobra� sobie, jakie musia�o by� moje zdziwienie, kiedy �wiat�o ksi�yca o�wietli�o sylwetk� niedosz�ego cieniostwora.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_07"); //Nie, to na pewno nie by� cieniostw�r mimo tego, i� tak wygl�da�! Sylwetka z�o�ona z samych ko�ci, na kt�rych wisia�o gnij�ce i rozk�adaj�ce si� mi�so po��czone bia�ymi �ci�gnami i puste oczy na �rodku g�owy.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_08"); //Tak jak nie boj� si� noc� polowa�, tak po zobaczeniu tego potwora chyba zmieni� swoje przyzwyczajenia.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_WhoDoISee_55_09"); //Wiesz, gdzie ta bestia si� uda�a?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_10"); //Tak, obserwowa�em j� jeszcze przez chwil�, nim ta znikn�a mi z oczu. Powinni�my na ni� zapolowa�. Kto wie, jak gro�ne jest to stworzenie i co mo�e zrobi�.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_WhoDoISee_55_11"); //Czy�by tw�j strach przemin��?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_WhoDoISee_55_12"); //Nie, po prostu spe�niam sw�j obowi�zek, a we dw�ch b�dzie znacznie bezpieczniej. Wyruszamy o p�nocy, nie zapomnij si� przygotowa�.

	B_LogEntry (TOPIC_Dobar_pancerze, "Znalaz�em my�liwego, kt�ry jeszcze nie zacz�� polowa� na orkowe psy. Okaza�o si� bowiem, i� spotka� si� z zupe�nie nowym k�opotem, jakim by�o spotkanie z tajemniczym, nieumar�ym cieniostworem.");
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
	description = "Jestem got�w, ruszajmy!";
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
	AI_Output (other, self,"DIA_NASZ_232_Jehen_LetsGo_55_00"); //Jestem got�w, ruszajmy!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LetsGo_55_01"); //Trzymaj si� blisko mnie. Nie chc�, by co� nas rozdzieli�o.

	Npc_ExchangeRoutine(self,"LastTimeISee");
	AI_StopProcessInfos(self);
	
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna(NASZ_232_Jehen,1);
	
	Log_CreateTopic (TOPIC_Jehen_poscig, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jehen_poscig, LOG_RUNNING);
	B_LogEntry (TOPIC_Jehen_poscig, "Wraz z nastaniem p�nocy wyruszy�em z Jehenem na poszukiwania tajemniczej bestii. Blask ksi�yca powinien nam da� wystarczaj�co du�o �wiat�a i jednocze�nie cienia, do skrycia si� przed oczami stworzenia.");
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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_00"); //To w tym miejscu widzia�em j� po raz ostatni, dlatego te� od tej chwili powinni�my by� bardzo ostro�ni. 
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_01"); //Trzymaj si� mnie i staraj si� nie zgubi�. Kto wie, co mo�e nas spotka� po drodze?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_LastTimeISee_55_02"); //Uwa�asz, �e to jest normalne? Mam na my�li tego cieniostwora, kt�ry pojawi� si� tutaj znik�d.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_03"); //Szczerze m�wi�c to nie wydaje mi si�, aby to by�o normalne. Chocia� z drugiej strony nie wiadomo, jakie okropie�stwa mog� do nas przybywa� z wymiaru Beliara.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_04"); //R�wnie dobrze mo�e to by� te� efekt rytua�u przywo�ania przeprowadzonego przez jakiego� maga.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_05"); //Tak samo prawdopodobne jest, i� ten cieniostw�r zachorowa� i jest ju� w stanie agonalnym, przez co wygl�da, jak wygl�da.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_LastTimeISee_55_06"); //Niezale�nie od tego czym to jest i jak si� boimy, nale�y si� tego stworzenia pozby�. Nie oci�gajmy si�, musimy dopa�� to stworzenie, nim b�dzie za p�no. Trzymaj si� mnie.

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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_00"); //Martwy warg? �lady po pazurach wskazuj� na silne uderzenie skierowane bezpo�rednio na jego bok. To samo uderzenie pozbawi�o go od razu �ycia.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_01"); //Ponadto na sier�ci dostrzegam dziwne plamy o fioletowej barwie, kt�re si�... klej�?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWarg_55_02"); //Jak my�lisz, co to mo�e by�? Nie wygl�da mi to na krew, ani tym bardziej na co�, co mog�o wydosta� si� z cia�a warga.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_03"); //Nie, to na pewno nie krew, ani wydzielina z cia�a. Pr�dzej jaka� �lina lub co�, co ma zwil�a� pokarm i go rozdrabnia�. Prawdopodobnie pochodzi od tego cieniostwora.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_04"); //To ju� daje nam niepokoj�ce wskaz�wki, i� nie mamy styczno�ci ze zwyk�� besti�.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_05"); //Rozejrzyj si� po okolicy. Mo�e znajdziesz co� wa�nego, co umkn�o mojej uwadze.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWarg_55_06"); //Tylko nie oddalaj si� zbyt daleko bo inaczej strac� ci� z pola widzenia, a nie powinni�my si� rozdziela�.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWarg_55_07"); //Rozejrz� si� po okolicy, a ty spr�buj si� czego� dowiedzie�.
	
	
	Npc_ExchangeRoutine(self,"DeadWargWait");
	AI_StopProcessInfos(self);
	
	// wstawiamy ko��
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
	description = "Znalaz�em tylko p�kni�t� ko��.";
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
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWargBone_55_00"); //Znalaz�em tylko p�kni�t� ko��.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWargBone_55_01"); //Wygl�da tak, jakby kto� j� przegryz� i wyplu�.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_02"); //Nie pomyli�e� si� bardzo. Kiedy ty przeszukiwa�e� okolic�, ja przyjrza�em si� naszej ofierze.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_03"); //Ko��, kt�r� przynios�e�, pasowa�aby do rany na jego prawej �apie, gdzie w�a�nie tej ko�ci brakuje.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_04"); //Cieniostw�r, lub to z czym mamy teraz do czynienia, prawdopodobnie z�apa�o warga i wyrwa�o mu �ap� po czym uderzy�o �ap� i zabi�o na miejscu.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_05"); //Wyj�tkowo okrutnie jak na m�j gust. Powinni�my si� lepiej przygotowa�.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWargBone_55_06"); //Dowiedzia�e� si� jeszcze czego�?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_07"); //Tak, jest jeszcze co�. Uda�o mi si� znale�� niewielkie, krwawe �lady prowadz�ce w stron� tamtego klifu. Powinni�my ju� rusza�, chod�.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_DeadWargBone_55_08"); //Gdzie widzisz te �lady? Ja nigdzie nie mog� ich dostrzec!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_DeadWargBone_55_09"); //Ch�opcze, jak b�dziesz my�liwym tyle lat co ja, to r�wnie� nie b�dziesz mia� z tym problemu. Za mn�!
	
	Npc_ExchangeRoutine(self,"Korzenie");
	AI_StopProcessInfos(self);
	
	B_LogEntry (TOPIC_Jehen_poscig, "Nie musieli�my odchodzi� daleko od obozu, a ju� znale�li�my pierwsze �lady dzia�alno�ci naszej ofiary. W brutalny spos�b zabi�a warga, kt�ry nawet nie mia� szans w starciu z jej si��. Czymkolwiek to stworzenie jest, powinni�my si� dobrze przygotowa� do ewentualnej konfrontacji.");

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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_00"); //Mog� zada� ci jedno, bardzo wa�ne pytanie?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Korzenie_55_01"); //Oczywi�cie, co� si� sta�o?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_02"); //Odk�d zacz�li�my i�� tropem tego stworzenia, zacz�a bole� mnie g�owa, a im dalej idziemy, tym b�l staje si� coraz bardziej nie do zniesienia. Czuj� si�, jakbym zaraz mia� eksplodowa�!
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Korzenie_55_03"); //My�la�em, �e jedynie ja mam takie dolegliwo�ci. Z ka�dym krokiem czuj� si� tak, jakby moje si�y mala�y, a moje cia�o stawa�o si� coraz s�absze i mnie wytrzyma�e.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_04"); //Dziwne rzeczy maj� tutaj miejsce, miejmy nadziej�, �e to nic powa�nego, gdy� inaczej mo�emy mie� powa�ne tarapaty.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_05"); //Jak ju� wcze�niej m�wi�em, chc� si� przygotowa� do walki z t� besti�. Wr�� si� nad rzek� i powiniene� znale�� kilka rzecznych pn�czy.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Korzenie_55_06"); //A c� to s� te rzeczne pn�cza?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_07"); //Silnie toksyczne ro�liny, kt�re wy�aniaj� si� z ziemi jedynie w nocy i okre�lonych miejscach. S� bardzo rzadkie, a my mamy szcz�cie, gdy� zobaczy�em par� w korycie tej g�rskiej rzeki.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_08"); //Przynie� mi cztery pn�cza, tylko na mi�o�� bosk�, nie �ap ich za korzenie, bo inaczej padniesz tutaj w konwulsjach przed�miertelnych.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Korzenie_55_09"); //Ja w tym czasie przygotuj� sobie wszystkie przyrz�dy do zrobienia zatrutych strza�.
	
	Npc_ExchangeRoutine(self,"KorzenieWait");
	AI_StopProcessInfos(self);
	
	Wld_InsertItem(ItNa_RzecznePnacze,"FP_NASZ_RZECZNE_PNACZE_1");
	Wld_InsertItem(ItNa_RzecznePnacze,"FP_NASZ_RZECZNE_PNACZE_2");
	Wld_InsertItem(ItNa_RzecznePnacze,"FP_NASZ_RZECZNE_PNACZE_3");
	Wld_InsertItem(ItNa_RzecznePnacze,"FP_NASZ_RZECZNE_PNACZE_4");
	
	B_LogEntry (TOPIC_Jehen_poscig, "Jehen powiedzia� mi, i� od momentu wyruszenia mecz� go dziwne b�le g�owy. Nie by�oby w tym nic dziwnego, gdyby nie fakt, i� ja r�wnie� mam takie dolegliwo�ci. Cokolwiek to oznacza, chc� mie� ju� to za sob�.");
	B_LogEntry (TOPIC_Jehen_poscig, "My�liwy opowiedzia� mi o rzecznych pn�czach, wysoce toksycznej ro�linie. Mam zebra� cztery korzenie, kt�re ten nast�pnie wykorzysta do zrobienia zatrutych strza�. Powinienem jednak uwa�a�, aby nie z�apa� ich za korzenie. Szykuje si� niebezpieczna praca.");

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
	description = "Mam cztery korzenie, tak jak potrzebowa�e�.";
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
	
	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_00"); //Mam cztery korzenie, tak jak potrzebowa�e�.

	B_GiveInvItems(other,self,ItNa_RzecznePnacze,4);
	Npc_RemoveInvItems(self,ItNa_RzecznePnacze,4);

	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_01"); //Nie wspomnia�e� jednak, i� ich zapach jest tak intensywny! Do teraz �zawi� mi oczy.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_02"); //Musia�o to umkn�� mojej uwadze. Nie martw si� jednak, gdy� nie jest on szkodliwy dla zdrowia. Za kilka minut powinno ci przej��, a ja tymczasem zajm� si� ekstrakcj� toksyn.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_03"); //Robi�e� to ju� wcze�niej? Wygl�dasz na takiego, kt�ry zna si� nie tylko na sztuce �owiectwa, ale i na ro�linach.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_04"); //Nauczy�em si� tej sztuki kiedy jeszcze �y�em w Monterze, niewielkim mie�cie w Myrtanie.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_05"); //Pewnego wieczoru przesiadywa�em w tamtejszej karczmie, pij�c piwo po ci�kim i d�ugotrwa�ym polowaniu na wilki, gdy spostrzeg�em, jak do �rodka wchodzi facet w sukience.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_06"); //Dw�ch go�ci za nim, kt�rzy dzier�yli po dwa ostrza na plecach umocni�o mnie w tym, i� by� to asasyn. Los chcia�, �e zacz�li�my ze sob� rozmawia�, a po kilku g��bszych zostali�my wr�cz kolegami.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_07"); //W okresie, kiedy przebywa� w mie�cie, nauczy� mnie wielu sztuczek swojego ludu, jak w�a�nie ta z produkcj� strza� zanurzonych w neurotoksynie pozyskanej z rzecznych pn�czy.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_08"); //Nie s�dzi�em, �e mia�e� kontakty w�r�d lud�w pustyni.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_09"); //Przez d�u�szy czas polowa�em na zwierzyn� specjalnie na ich zam�wienia, gdy� wielu z nich chcia�o posiada� w swej kolekcji futra szabloz�b�w czy �nie�nych wilk�w, a dla mnie ka�da podr� do Nordmaru by�a przyjemno�ci�.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_10"); //Nawet nie wiesz, jak t�skni� za tamtejszymi g�rami. Niestety wojna zmusi�a mnie do ucieczki na Khorinis, gdy� liczy�em, �e b�d� tutaj bezpieczny.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_11"); //A jak widzisz los zdecydowa� si� p�j�� mi na przek�r i wrzuci� mnie w wojn�, przed kt�r� przecie� ucieka�em.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_12"); //No, strza�y gotowe. Mo�emy i�� dalej, tylko dok�...
	AI_Output (other, self,"DIA_NASZ_232_Jehen_KorzenieDone_55_13"); //S�ysza�e�? Co� jakby ryk lub wycie odbijaj�ce si� echem od ska�!
	AI_Output (self, other,"DIA_NASZ_232_Jehen_KorzenieDone_55_14"); //A� zbyt dobrze! Trzymaj si� mnie i miej bro� w gotowo�ci!

	Npc_ExchangeRoutine(self,"Trup");
	AI_StopProcessInfos(self);

	Wld_InsertNpc(NASZ_022_Trup,"NASZ_JEHEN_QUEST_05");
	B_KillNPC(NASZ_022_Trup);
	
	B_LogEntry (TOPIC_Jehen_poscig, "Podczas produkcji strza� Jehen opowiedzia� mi co nieco o swojej przesz�o�ci. Cz�owiek, kt�ry ucieka� przed wojn�, aby ratowa� swe, �ycie znalaz� si� w jej centrum. Mimo tego nie podda� si� i walczy dalej. Mam tylko nadziej�, �e w ko�cu odnajdzie sw�j spok�j. Nied�ugo po rozmowie us�yszeli�my dziwny ryk i natychmiast pobiegli�my w tamto miejsce...");
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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Trup_55_01"); //Zaraz... To przecie� duch! Czy ta bestia by�a w stanie u�mierci� nawet kogo�, kto ju� nie �yje?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Trup_55_02"); //Nawet nie chc� wiedzie�, ile� musia� wycierpie� przy kontakcie z tym stworzeniem. Sp�jrz na jego pancerz. Ca�y we krwi, a prawy bok tu�owia poszarpany, jakby kto� wyrwa� mu sk�r�.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Trup_55_03"); //To tylko umacnia nas w tym, i� ta bestia jest cholernie silna i niebezpieczna. Co zrobimy dalej?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Trup_55_04"); //W�a�nie si� nad tym zastanawiam... S�ysza�e�? Kolejny ryk, co� jakby warkni�cie. A! Widz� besti�! Ruszamy, ubezpieczaj moje ty�y!

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
	
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Bestia1_55_00"); //To by�a ci�ka walka, ale na szcz�cie dobieg�a ko�ca. Nie s�dzi�em, �e on b�dzie a� tak silny. Wszystko w porz�dku?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Bestia1_55_01"); //Tak, na szcz�cie ta rana to niewielkie zadrapanie. Kilka centymetr�w wy�ej i by�bym ju� martwy, bardziej ciekawi mnie to, co porasta jego cia�o. Co� jakby �uski?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Bestia1_55_02"); //Mo�e powiniene� si� im przyjrze�. Wyrwij ile zdo�asz. Ja z rozwalon� r�k� nie bardzo dam sobie z tym rade.
	
	self.flags = 0;

	Npc_ExchangeRoutine(self,"Bestia1");
	
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna(NASZ_232_Jehen,0);
	
	
	AI_StopProcessInfos(self);
	
	B_LogEntry (TOPIC_Jehen_poscig, "Przy ciele bestii znale�li�my �uski, kt�re mog� pos�u�y� Dobarowi do wzmocnienia naszych pancerzy.");

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
	description = "Wyrwa�em kilka �usek.";
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
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HaveLuski_55_00"); //Wyrwa�em kilka �usek.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HaveLuski_55_01"); //To jaka� skorupa poro�ni�ta tkank�, kt�ra tworzy�a kiedy� cia�o tej bestii. Wydaje si� by� bardzo wytrzyma��, bo znajdowa�a si� w miejscu, gdzie atakowali�my to stworzenie swoimi mieczami.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HaveLuski_55_02"); //By� mo�e to nada si� do wzmocnienia naszych pancerzy? Jak uwa�asz?	
	AI_Output (self, other,"DIA_NASZ_232_Jehen_HaveLuski_55_03"); //My�l�, �e Dobar by�by zadowolony, lecz to jedynie trzy �uski. Raczej nie zrobi z tego pancerzy dla wszystkich ch�opak�w, jednak masz racj�. Nale�y mu o tym powiedzie�, mo�e jako� odtworzy to ze swojego metalu.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_HaveLuski_55_04"); //Zaczekaj... Te� widzia�e� ten b�ysk? Dochodzi� jakby spod wody. Chyba pod wulkanem jest jaskinia. 
	AI_Output (self, other,"DIA_NASZ_232_Jehen_HaveLuski_55_05"); //Udaj si� tam. Ja ze swoj� r�k� wola�bym nie wchodzi� do wody, bo ci�gle krwawi. Poczekam tutaj na ciebie.
	AI_Output (other, self,"DIA_NASZ_232_Jehen_HaveLuski_55_06"); //Sprawdz� to i zaraz wr�c�.
	
	AI_StopProcessInfos(self);
	
	B_LogEntry (TOPIC_Jehen_poscig, "Jehen zauwa�y� b�ysk �wiat�a dochodz�cy spod wody, z jaskini pod wulkanem. Musz� to sprawdzi�.");
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
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_00"); //A niech to, jeste�!
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Part2Start_55_01"); //Jakim cudem si� tutaj znalaz�e� i dlaczego nie zaczeka�e� nad jeziorem?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_02"); //Zaniepokoi�em si�, gdy wp�yn��e� pod wod� i d�ugo ci� nie widzia�em. Chcia�em uda� si� za tob�, ale moja r�ka jest w ci�kim stanie.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_03"); //Przeliczy�em si� z si�ami i porwa� mnie wodospad. Gdy wyp�yn��em na powierzchnie i chcia�em dobi� do brzegu, sta�o si� dok�adnie to samo.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_04"); //Wyczo�ga�em si� na powierzchni� tutaj i odpoczywam. Ale to nie wszystko! Zastanawiasz si� pewnie, czemu tutaj siedz�?
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Part2Start_55_05"); //No tak, na twoim miejscu poszed�bym st�d z powrotem do namiotu. To nie a� tak daleko.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_06"); //Te� mia�em taki zamiar. Ale zauwa�y�em trop kolejnego potwora! Prowadzi do jaskini, pod wod�.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Start_55_07"); //Skoro ju� mnie znalaz�e�, to mog� wr�ci� do namiotu, bo besti� ujarzmisz ty. Wp�y� tam i nie daj si� jej. Wr�� do mnie i nie zapomnij o �uskach!
	
	AI_StopProcessInfos(self);
	
	Npc_ExchangeRoutine(self,"Namiot");
	B_LogEntry (TOPIC_Jehen_zagubiony, "Znalaz�em my�liwego, kt�ry z kolei natrafi� na trop kolejnej bestii. Musz� wp�yn�� za ni� do podwodnej jaskini i zebra� jej �uski. Szkoda, �e tym razem b�d� musia� sam si� z ni� zmierzy�.");
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
	description = "Pozyska�em kolejne �uski.";
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
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Part2Finish_55_00"); //Pozyska�em kolejne �uski.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Finish_55_01"); //�wietna robota! Dobar na pewno wykorzysta je i umocni pancerze. 
	AI_Output (other, self,"DIA_NASZ_232_Jehen_Part2Finish_55_02"); //Co ze sk�rami orkowych ps�w? Kowalowi wystarcz� same �uski?
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Finish_55_03"); //Nie mam zielonego poj�cia. Mo�esz ich troch� zebra�, ale nie licz na moj� pomoc.
	AI_Output (self, other,"DIA_NASZ_232_Jehen_Part2Finish_55_04"); //Odpocz��em troch�, ale moja r�ka nie umo�liwi mi uczestnictwa w polowaniu. Spr�buj� wr�ci� do obozu. Do zobaczenia!

	AI_StopProcessInfos(self);
	
	Npc_ExchangeRoutine(self,"Mysliwi");

	B_LogEntry (TOPIC_Dobar_pancerze, "Mog� zanie�� kowalowi �uski z tych bestii, ale nie wiem co ze sk�rami orkowych ps�w. Mo�e te� kilka zdejm�?");
	
	Log_SetTopicStatus (TOPIC_Jehen_zagubiony, LOG_SUCCESS);
	B_LogEntry (TOPIC_Jehen_zagubiony, "Jehen odzyska� si�y i wr�ci do obozu. Mam nadziej�, �e nie spotkam ju� wi�cej tych strasznych bestii.");
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
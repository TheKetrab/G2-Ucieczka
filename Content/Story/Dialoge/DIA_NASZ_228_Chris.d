var int NASZ_228_CHRIS_TEACHPLAYER_Everything;
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_228_Chris_EXIT   (C_INFO)
{
	npc         = NASZ_228_Chris;
	nr          = 999;
	condition   = DIA_NASZ_228_Chris_EXIT_Condition;
	information = DIA_NASZ_228_Chris_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_228_Chris_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_228_Chris_EXIT_Info()
{
	AI_StopProcessInfos (self);

};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_228_Chris_Hello		(C_INFO)
{
	npc		 = 	NASZ_228_Chris;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_228_Chris_Hello_Condition;
	information	 = 	DIA_NASZ_228_Chris_Hello_Info;
	permanent	 =	FALSE;
	important    =  TRUE;
};

func int DIA_NASZ_228_Chris_Hello_Condition ()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

func void DIA_NASZ_228_Chris_Hello_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_228_Chris_Hello_15_00"); //Œwietny st¹d widok na orków.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_Hello_03_01"); //To prawda, wszystko ³adnie widaæ. Ciekaw jestem, czy gdybyœ znalaz³ siê w zamku, te¿ byœ mia³ tak¹ rozeœmian¹ buŸkê.

};

///////////////////////////////////////////////////////////////////////
//	Info Who
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_228_Chris_Who		(C_INFO)
{
	npc		 = 	NASZ_228_Chris;
	nr		 = 	2;
	condition	 = 	DIA_NASZ_228_Chris_Who_Condition;
	information	 = 	DIA_NASZ_228_Chris_Who_Info;
	permanent        =	FALSE;
	description	 = 	"Kim jesteœ?";
};

func int DIA_NASZ_228_Chris_Who_Condition ()
{
		return TRUE;
};

func void DIA_NASZ_228_Chris_Who_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_228_Chris_Who_15_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_NASZ_228_Chris_Who_03_01"); //Mam na imiê Chris. Jestem myœliwym i przewodniczê ka¿demu masowemu polowaniu.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_Who_03_02"); //Niech by to szlag trafi³! Tym razem Erak, we w³asnej osobie, uda³ siê do obozu wypadowego i oczywiœcie przewodniczy grupie.
};

var int CHRIS_DONT_BEER;
var int CHRIS_GUIDE_BEER;
var int CANFUR;
//*********************************************************************
//	         Guide
//*********************************************************************
INSTANCE DIA_NASZ_228_Chris_guide   (C_INFO)
{
	npc         = NASZ_228_Chris;
 	nr          = 3;
 	condition   = DIA_NASZ_228_Chris_guide_Condition;
 	information = DIA_NASZ_228_Chris_guide_Info;
 	permanent   = TRUE;
 	description = "Wybierzmy siê na polowanie.";
};

FUNC INT DIA_NASZ_228_Chris_guide_Condition()	
{
	if (!CANFUR) && (npc_knowsinfo (other, DIA_NASZ_228_Chris_Who))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_228_Chris_guide_Info()
{
	AI_Output (other,self ,"DIA_NASZ_228_Chris_guide_15_00"); //Wybierzmy siê na polowanie.
	AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_01"); //Razem? A umiesz chocia¿ zdejmowaæ skóry?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE){

		AI_Output (other, self,"DIA_NASZ_228_Chris_guide_55_02"); //Nie.
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_03"); //W takim razie nie obraŸ siê, ale to nie ma najmniejszego sensu...
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_04"); //By³byœ dla mnie tylko balastem do ochraniania.
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_05"); //Naucz siê chocia¿ podstaw myœliwstwa, a dopiero wtedy udamy siê na polowanie. 
		}
	else {
		AI_Output (other, self,"DIA_NASZ_228_Chris_guide_55_06"); //Tak.
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_07"); //Hmm... No dobra, ale co ja bêdê z tego mia³?
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_08"); //Z³ota nie chcê. W Górniczej Dolinie ma ono znikom¹ wartoœæ. Wiesz dobrze o czym myœlê...
		CANFUR = TRUE;

		Info_ClearChoices (DIA_NASZ_228_Chris_guide);
		if (npc_hasitems (other, ItFo_Beer) >=3) {
			Info_AddChoice	  (DIA_NASZ_228_Chris_guide, "Dam ci trzy piwa.", DIA_NASZ_228_Chris_guide_three);
		};
		if (npc_hasitems (other, ItFo_Beer) >=1) {
			Info_AddChoice	  (DIA_NASZ_228_Chris_guide, "Dam ci piwo.", DIA_NASZ_228_Chris_guide_beer);
		};
		
		Info_AddChoice	  (DIA_NASZ_228_Chris_guide, "Nie mam niczego poza z³otem.", DIA_NASZ_228_Chris_guide_no);

	};
};

FUNC VOID DIA_NASZ_228_Chris_guide_no()
{

	AI_Output (other,self ,"DIA_NASZ_228_Chris_guide_no_15_09"); //Nie mam niczego poza z³otem.
	AI_Output (self, other,"DIA_NASZ_228_Chris_guide_no_55_10"); //Mój drogi. Zaopatrz siê w jakieœ trunki. Przynieœ mi 3 piwa. Wtedy pogadamy.

	CHRIS_DONT_BEER = TRUE;
	Info_ClearChoices (DIA_NASZ_228_Chris_guide);
};

FUNC VOID DIA_NASZ_228_Chris_guide_three()
{

	AI_Output (other,self ,"DIA_NASZ_228_Chris_guide_three_15_11"); //Dam ci trzy piwa.
	AI_Output (self, other,"DIA_NASZ_228_Chris_guide_three_55_12"); //Trzy? Niech bêdzie. Daj znaæ, jak bêdziesz gotów wyruszyæ.
	B_GiveInvItems (other, self, ItFo_Beer, 3);
	B_UseItem (self, ItFo_Beer);

	Log_CreateTopic (TOPIC_Chris_polowanie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Chris_polowanie, LOG_RUNNING);
	B_LogEntry (TOPIC_Chris_polowanie, "Chris zgodzi³ siê pójœæ ze mn¹ na polowanie w zamian za trzy piwa.");
	Info_ClearChoices (DIA_NASZ_228_Chris_guide);
	CHRIS_GUIDE_BEER = TRUE;
};


FUNC VOID DIA_NASZ_228_Chris_guide_beer()
{

	AI_Output (other,self ,"DIA_NASZ_228_Chris_guide_beer_15_13"); //Dam ci piwo.
	AI_Output (self, other,"DIA_NASZ_228_Chris_guide_beer_55_14"); //Jedno? Nie nie, to za ma³o.

};


//*********************************************************************
//	         BringBeer
//*********************************************************************
INSTANCE DIA_NASZ_228_Chris_BringBeer   (C_INFO)
{
	npc         = NASZ_228_Chris;
 	nr          = 4;
 	condition   = DIA_NASZ_228_Chris_BringBeer_Condition;
 	information = DIA_NASZ_228_Chris_BringBeer_Info;
 	permanent   = FALSE;
 	description = "Przynios³em piwa.";
};

FUNC INT DIA_NASZ_228_Chris_BringBeer_Condition()	
{
	if ((npc_hasitems (other, ItFo_Beer) >=3)
		//&& (npc_knowsinfo (other, DIA_NASZ_228_Chris_guide)
		&& (CHRIS_DONT_BEER == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_228_Chris_BringBeer_Info()
{
	AI_Output (other, self,"DIA_NASZ_228_Chris_BringBeer_55_00"); //Przynios³em piwa.
	AI_Output (self, other,"DIA_NASZ_228_Chris_BringBeer_55_01"); //Niech bêdzie. Daj znaæ jak bêdziesz gotów wyruszyæ.
	B_GiveInvItems (other, self, ItFo_Beer, 3);
	B_UseItem (self, ItFo_Beer);

	Log_CreateTopic (TOPIC_Chris_polowanie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Chris_polowanie, LOG_RUNNING);
	B_LogEntry (TOPIC_Chris_polowanie, "Chris zgodzi³ siê pójœæ ze mn¹ na polowanie w zamian za trzy piwa.");
	CHRIS_GUIDE_BEER = TRUE;
};

//*********************************************************************
//	         Go
//*********************************************************************
INSTANCE DIA_NASZ_228_Chris_go   (C_INFO)
{
	npc         = NASZ_228_Chris;
 	nr          = 5;
 	condition   = DIA_NASZ_228_Chris_go_Condition;
 	information = DIA_NASZ_228_Chris_go_Info;
 	permanent   = FALSE;
 	description = "ChodŸmy zapolowaæ.";
};

FUNC INT DIA_NASZ_228_Chris_go_Condition()	
{
	if (CHRIS_GUIDE_BEER == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_228_Chris_go_Info()
{
	AI_Output (other, self,"DIA_NASZ_228_Chris_go_55_00"); //ChodŸmy zapolowaæ.
	AI_Output (self, other,"DIA_NASZ_228_Chris_go_55_01"); //Wieje po³udniowo-zachodni wiatr. Zwierzyna nie wyczuje naszego zapachu i siê nie sp³oszy.
	
	NASZ_228_Chris.flags = 2;
	
	Wld_InsertNpc	(OrcDog,"OW_PATH_340");
	Wld_InsertNpc	(OrcDog,"FP_NASZ_POLOWANIE_F");
	Wld_InsertNpc	(OrcDog,"FP_NASZ_POLOWANIE_G");
	Wld_InsertNpc	(OrcDog,"FP_NASZ_POLOWANIE_H");
	Wld_InsertNpc	(OrcDog,"FP_NASZ_POLOWANIE_I");

	
	Npc_ExchangeRoutine (NASZ_228_Chris, "Guide");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_228_Chris,1);
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	         MightDymoondo
//*********************************************************************
INSTANCE DIA_NASZ_228_Chris_MightDymoondo   (C_INFO)
{
	npc         = NASZ_228_Chris;
 	nr          = 5;
 	condition   = DIA_NASZ_228_Chris_MightDymoondo_Condition;
 	information = DIA_NASZ_228_Chris_MightDymoondo_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_228_Chris_MightDymoondo_Condition()	
{
	if (npc_knowsinfo(other,DIA_NASZ_228_Chris_go))
	&& (Npc_GetDistToWp(self,"OW_PATH_100") < 800)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_228_Chris_MightDymoondo_Info()
{
	AI_Output (self, other,"DIA_NASZ_228_Chris_MightDymoondo_55_00"); //Hej, a mo¿e wziêlibyœmy ze sob¹ Dymoondo? M³odziak te¿ mia³by szansê nabyæ trochê doœwiadczenia.
	AI_Output (self, other,"DIA_NASZ_228_Chris_MightDymoondo_55_01"); //Jeœli chcesz, to podejdŸ do niego i pogadaj z nim.
	
	Npc_ExchangeRoutine (NASZ_228_Chris, "Guide2");
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	         Bye
//*********************************************************************
INSTANCE DIA_NASZ_228_Chris_bye   (C_INFO)
{
	npc         = NASZ_228_Chris;
 	nr          = 6;
 	condition   = DIA_NASZ_228_Chris_bye_Condition;
 	information = DIA_NASZ_228_Chris_bye_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_228_Chris_bye_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_228_Chris_go)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_340"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_228_Chris_bye_Info()
{
	AI_Output (self, other,"DIA_NASZ_228_Chris_bye_55_00"); //No, no! Fajne to by³o. Ale tej watahy orkowych psów, to siê nie spodziewa³em.
	AI_Output (other,self ,"DIA_NASZ_228_Chris_bye_15_01"); //W pojedynkê nie mia³bym szans.
	AI_Output (self, other,"DIA_NASZ_228_Chris_bye_55_02"); //Dlatego to my, myœliwi, trzymamy siê razem!
	AI_Output (self, other,"DIA_NASZ_228_Chris_bye_55_03"); //Zbieraj skóry i wracaj. Do zobaczenia w obozie.

	self.flags = 0;

	Log_SetTopicStatus (TOPIC_Chris_polowanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Chris_polowanie, "Polowanie zakoñczone pomyœlnie! Teraz mogê sprzedaæ skóry i inne trofea.");
	B_GivePlayerXP (300);

	DodajReputacje (2, REP_MYSLIWI);
	
	if (npc_knowsinfo (other, DIA_NASZ_230_Dymoondo_polowanie)) {
		Npc_ExchangeRoutine (NASZ_230_Dymoondo, "Start");
		//self.aivar[AIV_PARTYMEMBER] = FALSE;
		Druzyna (NASZ_230_Dymoondo,0);	
	};
	
	Npc_ExchangeRoutine (NASZ_228_Chris, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_228_Chris,0);
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			  ASK TEACHER 
// ************************************************************

INSTANCE DIA_NASZ_228_Chris_AskTeacher (C_INFO)
{
	npc			= NASZ_228_Chris;
	nr          = 10;
	condition	= DIA_NASZ_228_Chris_AskTeacher_Condition;
	information	= DIA_NASZ_228_Chris_AskTeacher_Info;

	description = "Mo¿esz mnie nauczyæ czegoœ o polowaniu?";
};                       

FUNC INT DIA_NASZ_228_Chris_AskTeacher_Condition()
{
	if 	(Npc_KnowsInfo (other, DIA_NASZ_228_Chris_who))
		{
			return TRUE;
		};
};

FUNC VOID DIA_NASZ_228_Chris_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_NASZ_228_Chris_AskTeacher_15_00"); //Mo¿esz mnie czegoœ nauczyæ o polowaniu?
	AI_Output(self,other,"DIA_NASZ_228_Chris_AskTeacher_03_01"); //Nie ma problemu. Za parê z³otych monet mogê ci pokazaæ, jak siê patroszy upolowane zwierzêta.
	AI_Output(self,other,"DIA_NASZ_228_Chris_AskTeacher_03_02"); //Za futra i inne trofea mo¿na dostaæ naprawdê sporo pieniêdzy.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Chris poka¿e mi, jak obrabiaæ zwierzynê.");	
};


///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_228_Chris_TEACHHUNTING		(C_INFO)
{
	npc	    = NASZ_228_Chris;
	nr          = 12;
	condition   = DIA_NASZ_228_Chris_TEACHHUNTING_Condition;
	information = DIA_NASZ_228_Chris_TEACHHUNTING_Info;
	permanent   = TRUE;
	description = "Opowiedz mi o oprawianiu zwierz¹t.";
};

func int DIA_NASZ_228_Chris_TEACHHUNTING_Condition ()
{
	if (NASZ_228_CHRIS_TEACHPLAYER_Everything == FALSE)
	&& (npc_knowsinfo (other, DIA_NASZ_228_Chris_AskTeacher))
	{
			return TRUE;
	};
};

func void DIA_NASZ_228_Chris_TEACHHUNTING_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_228_Chris_TEACHHUNTING_15_00"); //Opowiedz mi o oprawianiu zwierz¹t.
	if 	((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
		 ||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
		 ||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
		 ||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
		 ||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
		 ||((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)))
	{
		AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_03_01"); //Co tym razem?

		Info_AddChoice		(DIA_NASZ_228_Chris_TEACHHUNTING, DIALOG_BACK, DIA_NASZ_228_Chris_TEACHHUNTING_BACK);
	
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Usuwanie k³ów.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_Teeth); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Usuwanie pazurów.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_Claws); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Obdzieranie ze skóry.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_Fur); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Wyci¹ganie ¿¹d³a krwiopijcy.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_BFSting); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Wycinanie skrzyde³ krwiopijcy.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_BFWing); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Usuwanie rogu smoczego zêbacza.",25,3),  DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn); };
	}
	else
	{
		AI_Output (self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_03_02"); //Niestety, nie mogê ci powiedzieæ nic, czego byœ ju¿ nie wiedzia³.
		NASZ_228_CHRIS_TEACHPLAYER_Everything = TRUE;
	};
};

func void DIA_NASZ_228_Chris_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_NASZ_228_Chris_TEACHHUNTING);
};

func void ChrisSay_NoExp() {
	AI_Output (self, other, "DIA_NASZ_228_Chris_ChrisSay_NoExp_03_00"); //Brak ci doœwiadczenia.
};

func void ChrisSay_NoMoney() {
	AI_Output (self, other, "DIA_NASZ_228_Chris_ChrisSay_NoMoney_03_00"); //Jeœli mi nie zap³acisz, to nie przeka¿ê ci ¿adnych wskazówek.
};

// ------ Klauen hacken ------
func void DIA_NASZ_228_Chris_TEACHHUNTING_Claws()
{
	if (npc_hasitems(other,ItMi_Gold) < 25) {
		ChrisSay_NoMoney();
		return;
	};

	if (hero.lp < 3) {
		ChrisSay_NoExp();
		return;
	};

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Claws_03_00"); //Zwierzêta nie lubi¹ byæ pozbawiane pazurów. Musisz wykonaæ bardzo precyzyjne ciêcie.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Claws_03_01"); //Skrzy¿uj lekko rêce, a potem silnie pchnij.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Claws_03_02"); //Handlarze bardzo lubi¹, jeœli ktoœ p³aci im pazurami.

	B_GiveInvItems(other,self,ItMi_Gold,25);
	Npc_RemoveInvItems(self,ItMi_Gold,25);
	
	hero.lp -= 3;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
};

// ------ Fell abziehen ------
func void DIA_NASZ_228_Chris_TEACHHUNTING_Teeth()
{
	if (npc_hasitems(other,ItMi_Gold) < 25) {
		ChrisSay_NoMoney();
		return;
	};

	if (hero.lp < 3) {
		ChrisSay_NoExp();
		return;
	};

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Teeth_03_00"); //Naj³atwiej jest pozbawiæ zwierzê zêbów. Natnij no¿em dzi¹s³o dooko³a zêba.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Teeth_03_01"); //Potem musisz ju¿ tylko uderzyæ w z¹b i po wszystkim.

	B_GiveInvItems(other,self,ItMi_Gold,25);
	Npc_RemoveInvItems(self,ItMi_Gold,25);
	
	hero.lp -= 3;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
};

// ------ Fell abziehen ------
func void DIA_NASZ_228_Chris_TEACHHUNTING_Fur()
{
	if (npc_hasitems(other,ItMi_Gold) < 25) {
		ChrisSay_NoMoney();
		return;
	};

	if (hero.lp < 3) {
		ChrisSay_NoExp();
		return;
	};

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Fur_03_00"); //Pozyskanie futra najlepiej jest zacz¹æ od wykonania g³êbokiego naciêcia dooko³a tylnych koñczyn.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Fur_03_01"); //Jeœli zrobisz to w³aœciwie, zdarcie skóry to ju¿ drobnostka.
	
	B_GiveInvItems(other,self,ItMi_Gold,25);
	Npc_RemoveInvItems(self,ItMi_Gold,25);
	
	hero.lp -= 3;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
};

// ------ Blutfliegenstachel ------
func void DIA_NASZ_228_Chris_TEACHHUNTING_BFSting()
{
	if (npc_hasitems(other,ItMi_Gold) < 25) {
		ChrisSay_NoMoney();
		return;
	};

	if (hero.lp < 3) {
		ChrisSay_NoExp();
		return;
	};

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_BFSting_03_00"); //Na tylnej stronie odw³oku tej muchy znajduje siê miêkki punkt.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_BFSting_03_01"); //Jeœli na niego naciœniesz, wysunie siê ¿¹d³o, które bêdziesz móg³ odci¹æ no¿em.
		
	B_GiveInvItems(other,self,ItMi_Gold,25);
	Npc_RemoveInvItems(self,ItMi_Gold,25);
	
	hero.lp -= 3;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
};

// ------ Blutfliegenflügel ------
func void DIA_NASZ_228_Chris_TEACHHUNTING_BFWing ()
{
	if (npc_hasitems(other,ItMi_Gold) < 25) {
		ChrisSay_NoMoney();
		return;
	};

	if (hero.lp < 3) {
		ChrisSay_NoExp();
		return;
	};

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_BFWing_03_00"); //Najlepszym sposobem na usuniêcie skrzyde³ krwiopijcy jest odciêcie ich ostrym no¿em tu¿ przy samym ciele.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_BFWing_03_01"); //Musisz uwa¿aæ, skrzyd³a s¹ bardzo delikatne. Jeœli naruszysz ich delikatn¹ pow³okê, stan¹ siê bezwartoœciowe.

	B_GiveInvItems(other,self,ItMi_Gold,25);
	Npc_RemoveInvItems(self,ItMi_Gold,25);
	
	hero.lp -= 3;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
};

// ------ DrgSnapperHorn ------
func void DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn()
{
	if (npc_hasitems(other,ItMi_Gold) < 25) {
		ChrisSay_NoMoney();
		return;
	};

	if (hero.lp < 3) {
		ChrisSay_NoExp();
		return;
	};

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn_03_00"); //Mimo, ¿e wydaje siê to doœæ proste, mo¿e sprawiæ problem nawet doœwiadczonemu myœliwemu.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn_03_01"); //Najpierw musisz wbiæ nó¿ jak najg³êbiej w sam œrodek czo³a, a nastêpnie ostro¿nie podwa¿yæ róg.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn_03_02"); //Jeœli nie mo¿esz oddzieliæ go od czaszki, bêdziesz sobie musia³ pomóc drugim no¿em.
	
	B_GiveInvItems(other,self,ItMi_Gold,25);
	Npc_RemoveInvItems(self,ItMi_Gold,25);
	
	hero.lp -= 3;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_228_Chris_PICKPOCKET (C_INFO)
{
	npc			= NASZ_228_Chris;
	nr			= 900;
	condition	= DIA_NASZ_228_Chris_PICKPOCKET_Condition;
	information	= DIA_NASZ_228_Chris_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_228_Chris_PICKPOCKET_Condition()
{
	C_Beklauen (44);
};
 
FUNC VOID DIA_NASZ_228_Chris_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_228_Chris_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_228_Chris_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_228_Chris_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_228_Chris_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_228_Chris_PICKPOCKET_DoIt);
};

func void DIA_NASZ_228_Chris_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Arrow,48);
	
	Info_ClearChoices (DIA_NASZ_228_Chris_PICKPOCKET);
};
	
func void DIA_NASZ_228_Chris_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_228_Chris_PICKPOCKET);
};
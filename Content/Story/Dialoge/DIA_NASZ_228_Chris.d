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
	AI_Output			(other, self, "DIA_NASZ_228_Chris_Hello_15_00"); //�wietny st�d widok na ork�w.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_Hello_03_01"); //To prawda, wszystko �adnie wida�. Ciekaw jestem, czy gdyby� znalaz� si� w zamku, te� by� mia� tak� roze�mian� bu�k�.

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
	description	 = 	"Kim jeste�?";
};

func int DIA_NASZ_228_Chris_Who_Condition ()
{
		return TRUE;
};

func void DIA_NASZ_228_Chris_Who_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_228_Chris_Who_15_00"); //Kim jeste�?
	AI_Output			(self, other, "DIA_NASZ_228_Chris_Who_03_01"); //Mam na imi� Chris. Jestem my�liwym i przewodnicz� ka�demu masowemu polowaniu.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_Who_03_02"); //Niech by to szlag trafi�! Tym razem Erak, we w�asnej osobie, uda� si� do obozu wypadowego i oczywi�cie przewodniczy grupie.
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
 	description = "Wybierzmy si� na polowanie.";
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
	AI_Output (other,self ,"DIA_NASZ_228_Chris_guide_15_00"); //Wybierzmy si� na polowanie.
	AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_01"); //Razem? A umiesz chocia� zdejmowa� sk�ry?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE){

		AI_Output (other, self,"DIA_NASZ_228_Chris_guide_55_02"); //Nie.
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_03"); //W takim razie nie obra� si�, ale to nie ma najmniejszego sensu...
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_04"); //By�by� dla mnie tylko balastem do ochraniania.
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_05"); //Naucz si� chocia� podstaw my�liwstwa, a dopiero wtedy udamy si� na polowanie. 
		}
	else {
		AI_Output (other, self,"DIA_NASZ_228_Chris_guide_55_06"); //Tak.
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_07"); //Hmm... No dobra, ale co ja b�d� z tego mia�?
		AI_Output (self, other,"DIA_NASZ_228_Chris_guide_55_08"); //Z�ota nie chc�. W G�rniczej Dolinie ma ono znikom� warto��. Wiesz dobrze o czym my�l�...
		CANFUR = TRUE;

		Info_ClearChoices (DIA_NASZ_228_Chris_guide);
		if (npc_hasitems (other, ItFo_Beer) >=3) {
			Info_AddChoice	  (DIA_NASZ_228_Chris_guide, "Dam ci trzy piwa.", DIA_NASZ_228_Chris_guide_three);
		};
		if (npc_hasitems (other, ItFo_Beer) >=1) {
			Info_AddChoice	  (DIA_NASZ_228_Chris_guide, "Dam ci piwo.", DIA_NASZ_228_Chris_guide_beer);
		};
		
		Info_AddChoice	  (DIA_NASZ_228_Chris_guide, "Nie mam niczego poza z�otem.", DIA_NASZ_228_Chris_guide_no);

	};
};

FUNC VOID DIA_NASZ_228_Chris_guide_no()
{

	AI_Output (other,self ,"DIA_NASZ_228_Chris_guide_no_15_09"); //Nie mam niczego poza z�otem.
	AI_Output (self, other,"DIA_NASZ_228_Chris_guide_no_55_10"); //M�j drogi. Zaopatrz si� w jakie� trunki. Przynie� mi 3 piwa. Wtedy pogadamy.

	CHRIS_DONT_BEER = TRUE;
	Info_ClearChoices (DIA_NASZ_228_Chris_guide);
};

FUNC VOID DIA_NASZ_228_Chris_guide_three()
{

	AI_Output (other,self ,"DIA_NASZ_228_Chris_guide_three_15_11"); //Dam ci trzy piwa.
	AI_Output (self, other,"DIA_NASZ_228_Chris_guide_three_55_12"); //Trzy? Niech b�dzie. Daj zna�, jak b�dziesz got�w wyruszy�.
	B_GiveInvItems (other, self, ItFo_Beer, 3);
	B_UseItem (self, ItFo_Beer);

	Log_CreateTopic (TOPIC_Chris_polowanie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Chris_polowanie, LOG_RUNNING);
	B_LogEntry (TOPIC_Chris_polowanie, "Chris zgodzi� si� p�j�� ze mn� na polowanie w zamian za trzy piwa.");
	Info_ClearChoices (DIA_NASZ_228_Chris_guide);
	CHRIS_GUIDE_BEER = TRUE;
};


FUNC VOID DIA_NASZ_228_Chris_guide_beer()
{

	AI_Output (other,self ,"DIA_NASZ_228_Chris_guide_beer_15_13"); //Dam ci piwo.
	AI_Output (self, other,"DIA_NASZ_228_Chris_guide_beer_55_14"); //Jedno? Nie nie, to za ma�o.

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
 	description = "Przynios�em piwa.";
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
	AI_Output (other, self,"DIA_NASZ_228_Chris_BringBeer_55_00"); //Przynios�em piwa.
	AI_Output (self, other,"DIA_NASZ_228_Chris_BringBeer_55_01"); //Niech b�dzie. Daj zna� jak b�dziesz got�w wyruszy�.
	B_GiveInvItems (other, self, ItFo_Beer, 3);
	B_UseItem (self, ItFo_Beer);

	Log_CreateTopic (TOPIC_Chris_polowanie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Chris_polowanie, LOG_RUNNING);
	B_LogEntry (TOPIC_Chris_polowanie, "Chris zgodzi� si� p�j�� ze mn� na polowanie w zamian za trzy piwa.");
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
 	description = "Chod�my zapolowa�.";
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
	AI_Output (other, self,"DIA_NASZ_228_Chris_go_55_00"); //Chod�my zapolowa�.
	AI_Output (self, other,"DIA_NASZ_228_Chris_go_55_01"); //Wieje po�udniowo-zachodni wiatr. Zwierzyna nie wyczuje naszego zapachu i si� nie sp�oszy.
	
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
	AI_Output (self, other,"DIA_NASZ_228_Chris_MightDymoondo_55_00"); //Hej, a mo�e wzi�liby�my ze sob� Dymoondo? M�odziak te� mia�by szans� naby� troch� do�wiadczenia.
	AI_Output (self, other,"DIA_NASZ_228_Chris_MightDymoondo_55_01"); //Je�li chcesz, to podejd� do niego i pogadaj z nim.
	
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
	AI_Output (self, other,"DIA_NASZ_228_Chris_bye_55_00"); //No, no! Fajne to by�o. Ale tej watahy orkowych ps�w, to si� nie spodziewa�em.
	AI_Output (other,self ,"DIA_NASZ_228_Chris_bye_15_01"); //W pojedynk� nie mia�bym szans.
	AI_Output (self, other,"DIA_NASZ_228_Chris_bye_55_02"); //Dlatego to my, my�liwi, trzymamy si� razem!
	AI_Output (self, other,"DIA_NASZ_228_Chris_bye_55_03"); //Zbieraj sk�ry i wracaj. Do zobaczenia w obozie.

	self.flags = 0;

	Log_SetTopicStatus (TOPIC_Chris_polowanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Chris_polowanie, "Polowanie zako�czone pomy�lnie! Teraz mog� sprzeda� sk�ry i inne trofea.");
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

	description = "Mo�esz mnie nauczy� czego� o polowaniu?";
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
	AI_Output(other,self,"DIA_NASZ_228_Chris_AskTeacher_15_00"); //Mo�esz mnie czego� nauczy� o polowaniu?
	AI_Output(self,other,"DIA_NASZ_228_Chris_AskTeacher_03_01"); //Nie ma problemu. Za par� z�otych monet mog� ci pokaza�, jak si� patroszy upolowane zwierz�ta.
	AI_Output(self,other,"DIA_NASZ_228_Chris_AskTeacher_03_02"); //Za futra i inne trofea mo�na dosta� naprawd� sporo pieni�dzy.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Chris poka�e mi, jak obrabia� zwierzyn�.");	
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
	description = "Opowiedz mi o oprawianiu zwierz�t.";
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
	AI_Output	(other, self, "DIA_NASZ_228_Chris_TEACHHUNTING_15_00"); //Opowiedz mi o oprawianiu zwierz�t.
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
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Usuwanie k��w.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_Teeth); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Usuwanie pazur�w.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_Claws); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Obdzieranie ze sk�ry.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_Fur); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Wyci�ganie ��d�a krwiopijcy.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_BFSting); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Wycinanie skrzyde� krwiopijcy.",25,3), DIA_NASZ_228_Chris_TEACHHUNTING_BFWing); };
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
			{ Info_AddChoice (DIA_NASZ_228_Chris_TEACHHUNTING, TeachString("Usuwanie rogu smoczego z�bacza.",25,3),  DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn); };
	}
	else
	{
		AI_Output (self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_03_02"); //Niestety, nie mog� ci powiedzie� nic, czego by� ju� nie wiedzia�.
		NASZ_228_CHRIS_TEACHPLAYER_Everything = TRUE;
	};
};

func void DIA_NASZ_228_Chris_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_NASZ_228_Chris_TEACHHUNTING);
};

func void ChrisSay_NoExp() {
	AI_Output (self, other, "DIA_NASZ_228_Chris_ChrisSay_NoExp_03_00"); //Brak ci do�wiadczenia.
};

func void ChrisSay_NoMoney() {
	AI_Output (self, other, "DIA_NASZ_228_Chris_ChrisSay_NoMoney_03_00"); //Je�li mi nie zap�acisz, to nie przeka�� ci �adnych wskaz�wek.
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

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Claws_03_00"); //Zwierz�ta nie lubi� by� pozbawiane pazur�w. Musisz wykona� bardzo precyzyjne ci�cie.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Claws_03_01"); //Skrzy�uj lekko r�ce, a potem silnie pchnij.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Claws_03_02"); //Handlarze bardzo lubi�, je�li kto� p�aci im pazurami.

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

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Teeth_03_00"); //Naj�atwiej jest pozbawi� zwierz� z�b�w. Natnij no�em dzi�s�o dooko�a z�ba.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Teeth_03_01"); //Potem musisz ju� tylko uderzy� w z�b i po wszystkim.

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

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Fur_03_00"); //Pozyskanie futra najlepiej jest zacz�� od wykonania g��bokiego naci�cia dooko�a tylnych ko�czyn.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_Fur_03_01"); //Je�li zrobisz to w�a�ciwie, zdarcie sk�ry to ju� drobnostka.
	
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

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_BFSting_03_00"); //Na tylnej stronie odw�oku tej muchy znajduje si� mi�kki punkt.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_BFSting_03_01"); //Je�li na niego naci�niesz, wysunie si� ��d�o, kt�re b�dziesz m�g� odci�� no�em.
		
	B_GiveInvItems(other,self,ItMi_Gold,25);
	Npc_RemoveInvItems(self,ItMi_Gold,25);
	
	hero.lp -= 3;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
};

// ------ Blutfliegenfl�gel ------
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

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_BFWing_03_00"); //Najlepszym sposobem na usuni�cie skrzyde� krwiopijcy jest odci�cie ich ostrym no�em tu� przy samym ciele.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_BFWing_03_01"); //Musisz uwa�a�, skrzyd�a s� bardzo delikatne. Je�li naruszysz ich delikatn� pow�ok�, stan� si� bezwarto�ciowe.

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

	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn_03_00"); //Mimo, �e wydaje si� to do�� proste, mo�e sprawi� problem nawet do�wiadczonemu my�liwemu.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn_03_01"); //Najpierw musisz wbi� n� jak najg��biej w sam �rodek czo�a, a nast�pnie ostro�nie podwa�y� r�g.
	AI_Output			(self, other, "DIA_NASZ_228_Chris_TEACHHUNTING_DrgSnapperHorn_03_02"); //Je�li nie mo�esz oddzieli� go od czaszki, b�dziesz sobie musia� pom�c drugim no�em.
	
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
var int NASZ_229_Ayan_TEACHPLAYER;
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_229_Ayan_EXIT   (C_INFO)
{
	npc         = NASZ_229_Ayan;
	nr          = 999;
	condition   = DIA_NASZ_229_Ayan_EXIT_Condition;
	information = DIA_NASZ_229_Ayan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_229_Ayan_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_229_Ayan_EXIT_Info()
{
	AI_StopProcessInfos (self);

};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_Hello		(C_INFO)
{
	npc			 = 	NASZ_229_Ayan;
	nr			 = 	1;
	condition	 = 	DIA_NASZ_229_Ayan_Hello_Condition;
	information	 = 	DIA_NASZ_229_Ayan_Hello_Info;
	permanent	 =	FALSE;
	description	 = 	"Co robisz na tym krañcu œwiata?";
};

func int DIA_NASZ_229_Ayan_Hello_Condition ()
{
	if (KAPITEL < 4)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_Hello_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Hello_15_00"); //Co robisz na tym krañcu œwiata?
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Hello_03_01"); //Zastanawiam siê, co mo¿e byæ po drugiej stronie tej rzeki.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Hello_03_02"); //Bez zw¹tpienia by³ tu kiedyœ most. Jeœli siê tam dostanê, mo¿e znajdê coœ ciekawego...

};

///////////////////////////////////////////////////////////////////////
//	Info Most
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_most		(C_INFO)
{
	npc			 = 	NASZ_229_Ayan;
	nr			 = 	2;
	condition	 = 	DIA_NASZ_229_Ayan_most_Condition;
	information	 = 	DIA_NASZ_229_Ayan_most_Info;
	permanent    =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_most_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_InfoAboutAyan))
	|| (Cheat_SkipToAyanQuest)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_most_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_most_03_00"); //Ju¿ wiem, jak dostaæ siê na drugi brzeg!
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_most_03_01"); //Znalaz³em tê runê teleportacyjn¹ nurkuj¹c w rzece.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_most_03_02"); //Uwierz mi, nie by³o ³atwo! Mam nadziejê, ¿e siê op³aci.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_most_03_03"); //Szukam jakiegoœ osi³ka, bo samemu nie zamierzam siê tam wybieraæ. Mo¿e zechcesz mi towarzyszyæ?

};

///////////////////////////////////////////////////////////////////////
//	Info Chodzmy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_chodzmy		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	3;
	condition	 = 	DIA_NASZ_229_Ayan_chodzmy_Condition;
	information	 = 	DIA_NASZ_229_Ayan_chodzmy_Info;
	permanent	 =	FALSE;
	description	 = 	"Czemu nie?";
};

func int DIA_NASZ_229_Ayan_chodzmy_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_most))
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_chodzmy_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_chodzmy_15_00"); //Czemu nie?
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_chodzmy_03_01"); //Œwietnie!
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_chodzmy_03_02"); //Z tym, ¿e runa jest jedna, a nas jest dwóch.
	AI_PlayAni (self,"R_SCRATCHHEAD");
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_chodzmy_03_03"); //Przeteleportuj siê i rzuæ runê. Dasz radê?
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_chodzmy_03_04"); //Nie jestem pewien... Mo¿liwe, ¿e runa spadnie do rzeki.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_chodzmy_03_05"); //Mam tylko nadziejê, ¿e j¹ znajdê. Do zobaczenia po drugiej stronie.
	AyanThrowReady = TRUE;
	ff_applyonceExt(AyanThrow,1000,-1);

	Log_CreateTopic (TOPIC_Ayan_nieznane, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ayan_nieznane, LOG_RUNNING);
	B_LogEntry (TOPIC_Ayan_nieznane, "Ayan znalaz³ sposób na predostanie siê za rzekê na tajemniczy p³askowy¿. Rzuci runê do rzeki.");

	Createinvitems (self, ItNa_TeleportOzywieniec, 1);
	//B_giveinvitems (self, other, ItNa_TeleportOzywieniec, 1);
	ff_applyonceExt(TeleportOzywieniec,1000,-1);
	//B_UseItem (self, ItNa_TeleportOzywieniec);
	
	AI_StopProcessInfos (self);
	//B_ReadySpell (NASZ_229_Ayan, SPL_TeleportOzywieniec,0);
	B_StartOtherRoutine (NASZ_229_Ayan,"Most");
	B_Attack(self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Ready
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_ready		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	4;
	condition	 = 	DIA_NASZ_229_Ayan_ready_Condition;
	information	 = 	DIA_NASZ_229_Ayan_ready_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_ready_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_chodzmy)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_OZYWIENIEC_B"))
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_ready_Info ()
{
	B_GivePlayerXP(300);
	
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ready_03_00"); //Zadzia³a³o. 
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_ready_15_01"); //To chyba dobry znak. 
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ready_03_02"); //Cholera, pe³no tu o¿ywieñców. Ten p³askowy¿ to jeden wielki grób.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ready_03_03"); //IdŸ pierwszy. Tak jak mówi³em, jesteœ mi potrzebny do walki z niebezpieczeñstwem.

	B_LogEntry (TOPIC_Ayan_nieznane, "Po drugiej stronie pe³no jest o¿ywieñców. Ciekawe, czy coœ tutaj znajdziemy?");

	self.aivar[AIV_MagicUser] = MAGIC_NEVER;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "BeforeGraveyard");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_229_Ayan,1);
};

///////////////////////////////////////////////////////////////////////
//	Info BeforeGraveyard
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_BeforeGraveyard		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	5;
	condition	 = 	DIA_NASZ_229_Ayan_BeforeGraveyard_Condition;
	information	 = 	DIA_NASZ_229_Ayan_BeforeGraveyard_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_BeforeGraveyard_Condition ()
{
	if (Npc_GetDistToWP	(self, "NASZ_OZYWIENIEC_F") < 2000)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_BeforeGraveyard_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_BeforeGraveyard_03_00"); //Co my tu mamy? 
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_BeforeGraveyard_15_01"); //Wygl¹da na wejœcie do grobowca. 
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_BeforeGraveyard_03_02"); //ChodŸ, zobaczymy co jest wewn¹trz.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Closed");
};

///////////////////////////////////////////////////////////////////////
//	Info Closed
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_Closed		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	6;
	condition	 = 	DIA_NASZ_229_Ayan_Closed_Condition;
	information	 = 	DIA_NASZ_229_Ayan_Closed_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_Closed_Condition ()
{
	if (Npc_GetDistToWP	(self, "NASZ_OZYWIENIEC_T") < 3000)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_Closed_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_00"); //A wiêc to orkowy grobowiec.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_01"); //To miejsce jest przepe³nione z³ymi czarami. Wydaje mi siê, ¿e to za spraw¹ starych orkowych run, duchy zmar³ych pozosta³y na cmentarzu.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Closed_15_02"); //Nigdy jeszcze nie spotka³em orkowego ducha.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_03"); //To tak jak ja. Zaczynam siê obawiaæ tego miejsca.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_04"); //Patrz, ten kamieñ z pewnoœci¹ blokuje jakiœ mechanizm. Musimy znaleŸæ coœ, co go przesunie.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Closed_15_05"); //ChodŸmy na dó³. Mo¿e tam coœ znajdziemy.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_06"); //Masz racjê. ProwadŸ.

	B_LogEntry (TOPIC_Ayan_nieznane, "Jesteœmy w jakimœ orkowym grobowcu. Pe³no tu orkowych duchów. Ogromny kamieñ tarasuje przejœcie, wiêc musimy znaleŸæ mechanizm, który go przesunie.");

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Hey");
};

///////////////////////////////////////////////////////////////////////
//	Info HEY
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_hey		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	7;
	condition	 = 	DIA_NASZ_229_Ayan_hey_Condition;
	information	 = 	DIA_NASZ_229_Ayan_hey_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_hey_Condition ()
{
	if (Npc_GetDistToWP	(self, "NASZ_OZYWIENIEC_03") < 2000)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_hey_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_hey_03_00"); //Hej, s³yszysz?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_hey_15_01"); //Te dziwne odg³osy dochodz¹ jakby z tego kana³u œciekowego... Zapewne te zawalone boczne korytarze nie s¹ œlepe.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_hey_03_02"); //Nie widzia³em dot¹d ¿adnego ko³owrotu ani prze³¹cznika, który móg³by otworzyæ wrota w poprzedniej komnacie..
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_hey_03_03"); //Myœlê, ¿e trzeba przedostaæ siê jakoœ przez ten kana³.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_hey_03_04"); //Wymyœlê coœ, bez obaw.

	B_LogEntry (TOPIC_Ayan_nieznane, "W jednym z dolnych korytarzy natrafiliœmy na kana³ œciekowy, z którego wydobywaj¹ siê odg³osy. Muszê znaleŸæ sposób, by przedostaæ siê na drug¹ stronê.");

	Npc_ExchangeRoutine (self, "StandInHey");
	
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_229_Ayan,0);
};

///////////////////////////////////////////////////////////////////////
//	Info FindMeatbug
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_FindMeatbug		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	8;
	condition	 = 	DIA_NASZ_229_Ayan_FindMeatbug_Condition;
	information	 = 	DIA_NASZ_229_Ayan_FindMeatbug_Info;
	permanent	 =	FALSE;
	description	 = 	"Znalaz³em zwój przemiany w chrz¹szcza.";
};

func int DIA_NASZ_229_Ayan_FindMeatbug_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_hey))
		&& (npc_hasitems (other, ItNa_TrfMeatbug) >=1)
		&& (WillOtworzylKolowrotOrc == FALSE)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_FindMeatbug_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_FindMeatbug_03_00"); //Znalaz³em zwój przemiany w chrz¹szcza.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_FindMeatbug_15_01"); //To na co czekasz? W³aŸ do kana³u.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_FindMeatbug_03_02"); //Tylko wróæ ¿ywy. Nie chcê zostaæ sam w tym ponurym miejscu.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info KolowrotRedi
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_KolowrotRedi		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	9;
	condition	 = 	DIA_NASZ_229_Ayan_KolowrotRedi_Condition;
	information	 = 	DIA_NASZ_229_Ayan_KolowrotRedi_Info;
	permanent	 =	FALSE;
	description	 = 	"Przekrêci³em ko³owrót.";
};

func int DIA_NASZ_229_Ayan_KolowrotRedi_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_hey))
	&& (WillOtworzylKolowrotOrc == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_KolowrotRedi_Info ()
{
	B_GivePlayerXP(300);

	AI_Output			(other, self, "DIA_NASZ_229_Ayan_KolowrotRedi_03_00"); //Przekrêci³em ko³owrót.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_KolowrotRedi_15_01"); //A wiêc mo¿emy iœæ dalej?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_KolowrotRedi_03_02"); //Có¿... Chyba tak.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_KolowrotRedi_15_03"); //ChodŸmy wiêc!

	B_LogEntry (TOPIC_Ayan_nieznane, "Przejœcie do kolejnej komnaty powinno byæ otwarte. Idziemy dalej.");
	
	Npc_ExchangeRoutine (self, "GoToBigHall");
	
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_229_Ayan,1);
};

///////////////////////////////////////////////////////////////////////
//	Info ILikeYou
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_ILikeYou		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	9;
	condition	 = 	DIA_NASZ_229_Ayan_ILikeYou_Condition;
	information	 = 	DIA_NASZ_229_Ayan_ILikeYou_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_ILikeYou_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_KolowrotRedi))
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_ILikeYou_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ILikeYou_03_00"); //Hej, m³ody.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ILikeYou_03_01"); //Polubi³em ciê. Mam nadziejê, ¿e za tym ma³ym kanalikiem nic ci siê nie przytrafi³o?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_ILikeYou_15_02"); //Ubi³em kilka orkowych duchów, wszystko w porz¹dku.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ILikeYou_03_03"); //Szczerze mówi¹c martwi³em siê trochê, czy dasz radê. Raz jeszcze powtórzê, ¿e nie chcê tu zostaæ sam.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_ILikeYou_03_04"); //Ja tak samo...
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ILikeYou_15_05"); //Nie daj siê zabiæ, m³ody.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info NextChamber
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_NextChamber		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	10;
	condition	 = 	DIA_NASZ_229_Ayan_NextChamber_Condition;
	information	 = 	DIA_NASZ_229_Ayan_NextChamber_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_NextChamber_Condition ()
{
	if (Npc_GetDistToWP	(self, "NASZ_OZYWIENIEC_06") < 2000)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_NextChamber_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_NextChamber_03_00"); //Kolejna wielka sala. Musi tu znajdowaæ siê coœ cennego...
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_NextChamber_03_01"); //Wszêdzie pe³no orków-duchów... Musimy siê rozdzieliæ.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_NextChamber_15_02"); //Ja poszukam tu czegoœ ciekawego, a ty pilnuj, by w tej wielkiej sali nagle nie zaroi³o siê od orków.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_NextChamber_03_03"); //Zgoda. Gdybyœ czegoœ potrzebowa³, bêdê w centrum tej komnaty.

	B_LogEntry (TOPIC_Ayan_nieznane, "Trafiliœmy do wielkiej komnaty. Rozejrzê siê tu. Mo¿e znajdê coœ ciekawego?");
	
	Npc_ExchangeRoutine (self, "StandInBigHall");
};

///////////////////////////////////////////////////////////////////////
//	Info Musimy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_Musimy		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	11;
	condition	 = 	DIA_NASZ_229_Ayan_Musimy_Condition;
	information	 = 	DIA_NASZ_229_Ayan_Musimy_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_Musimy_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_NextChamber))
	&& (WillOtworzylGlazOrc == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_Musimy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Musimy_03_00"); //Chyba poci¹gn¹³eœ za w³aœciw¹ dŸwigniê.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Musimy_03_01"); //Sta³em sobie i pali³em bagienne ziele, a tu nagle na œrodku tej komnaty w suficie coœ drgnê³o i moim oczom ukaza³ siê pionowy szyb wentylacyjny.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Musimy_03_02"); //Widaæ œwiat³o. Musi byæ tu gdzieœ winda.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Musimy_15_03"); //ChodŸmy na górê. Mo¿e tam coœ bêdzie.
	
	AyanBiegnie = FALSE;
	
	Npc_ExchangeRoutine (self, "GoToUpFloor");
};

///////////////////////////////////////////////////////////////////////
//	Info LookPrzelaczniki
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_LookPrzelaczniki		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	12;
	condition	 = 	DIA_NASZ_229_Ayan_LookPrzelaczniki_Condition;
	information	 = 	DIA_NASZ_229_Ayan_LookPrzelaczniki_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_LookPrzelaczniki_Condition ()
{
	if Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_OZYWIENIEC_19")
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_LookPrzelaczniki_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_LookPrzelaczniki_03_00"); //Patrz! S¹ tu jakieœ kolumny. Zapewnê da siê je poruszyæ.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_LookPrzelaczniki_03_01"); //Zobaczymy.

	B_LogEntry (TOPIC_Ayan_nieznane, "Jeœli przekrêcê prze³¹czniki, byæ mo¿e winda siê aktywuje.");
	
	Npc_ExchangeRoutine (self, "StandInUpFloor");
};

///////////////////////////////////////////////////////////////////////
//	Info nope
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_nope		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	13;
	condition	 = 	DIA_NASZ_229_Ayan_nope_Condition;
	information	 = 	DIA_NASZ_229_Ayan_nope_Info;
	permanent	 =	FALSE;
	description	 = 	"Te kolumny chyba s¹ zepsute.";
};

func int DIA_NASZ_229_Ayan_nope_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_LookPrzelaczniki))
	&& (WillSprobowalPrzelacznikAyan == TRUE) && (WillSprobowalPrzelacznikWill == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_nope_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_nope_03_00"); //Te kolumny chyba s¹ zepsute.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_nope_03_01"); //No, chyba ¿e trzeba je przekrêciæ jednoczeœnie.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_nope_03_02"); //Spróbujmy.

	WillIsGoingToSwitchWillPrzelacznik = TRUE;
	B_LogEntry (TOPIC_Ayan_nieznane, "Ayan zaproponowa³, ¿ebyœmy przekrêcili prze³¹czniki równoczeœnie.");
	
	Npc_ExchangeRoutine (self, "StandIn19");
};

///////////////////////////////////////////////////////////////////////
//	Info Dziala
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_Dziala		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	14;
	condition	 = 	DIA_NASZ_229_Ayan_Dziala_Condition;
	information	 = 	DIA_NASZ_229_Ayan_Dziala_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_Dziala_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_nope))
	&& (DwaPrzelacznikiOkej == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_Dziala_Info ()
{
	B_GivePlayerXP(300);

	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Dziala_03_00"); //Widzia³eœ ten b³ysk na dole?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Dziala_03_01"); //Tak, ale nie jestem pewien, czy winda bêdzie dzia³aæ.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Dziala_03_02"); //Pora siê przekonaæ. Stañmy pod tym szybem, mo¿e winda ruszy.

	B_LogEntry (TOPIC_Ayan_nieznane, "Uda³o siê! Musimy teraz razem stan¹æ na platformê pod szybem w suficie.");
	WillAndAyanLift = TRUE;
	ff_applyonceExt(LiftReady,1000,-1);

	Npc_ExchangeRoutine (self, "StandInLift");
};

///////////////////////////////////////////////////////////////////////
//	Info Dolina
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_Dolina		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	15;
	condition	 = 	DIA_NASZ_229_Ayan_Dolina_Condition;
	information	 = 	DIA_NASZ_229_Ayan_Dolina_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_Dolina_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_dziala))
		&& (Npc_GetDistToWP	(self, "NASZ_OZYWIENIEC_25") < 700)
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_Dolina_Info ()
{
	B_GivePlayerXP(300);

	AI_Output (self, other, "DIA_NASZ_229_Ayan_Dolina_03_00"); //Ukryta dolina? Niemo¿liwe... Wygl¹da, jakby od stuleci nikt tutaj nie zagl¹da³.
	AI_Output (self, other, "DIA_NASZ_229_Ayan_Dolina_03_01"); //Rozejrzyjmy siê tutaj.
	
	B_LogEntry (TOPIC_Ayan_nieznane, "Trafiliœmy do jakiejœ ukrytej doliny. Jakie skarby chowa? Jaka jest jej przesz³oœæ? Chyba teraz legenda Monastira nabiera sensu...");

	Npc_ExchangeRoutine (self, "FollowToDead");
	ff_applyonceExt(summon,15000,-1);
	
};

///////////////////////////////////////////////////////////////////////
//	Info Done
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_229_Ayan_done		(C_INFO)
{
	npc		 = 	NASZ_229_Ayan;
	nr		 = 	16;
	condition	 = 	DIA_NASZ_229_Ayan_done_Condition;
	information	 = 	DIA_NASZ_229_Ayan_done_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};

func int DIA_NASZ_229_Ayan_done_Condition ()
{
	if ((Npc_GetDistToWP	(self, "NASZ_OZYWIENIEC_40") < 1000)
		&& npc_isdead (Ozywieniec))
	{
		return TRUE;
	};
};

func void DIA_NASZ_229_Ayan_done_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_done_03_00"); //O jasna cholera! Co.. co to by³o?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_done_15_01"); //Chyba zaczynam siê domyœlaæ... tylko... gdzie jest zwój? Musi gdzieœ tu byæ.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_done_03_02"); //Jaki zwój? Przeszukam dok³adnie tego umarlaka. Ty idŸ na górê. Mo¿e tam znajdziesz coœ ciekawego.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_done_03_03"); //B¹dŸ ostro¿ny. To miejsce jest przesi¹kniête z³em.

	B_LogEntry (TOPIC_Monastir_bogowie, "Wygl¹da na to, ¿e znalaz³em komnatê o¿ywieñca... Ayan poleci³ mi rozejrzeæ siê na górze, podczas gdy on sam przeszuka dok³adniej zw³oki.");
	B_GivePlayerXP (500);

	Npc_ExchangeRoutine (self, "Stand");
	
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_229_Ayan,0);

};


func void OZYWIENIEC_S1 ()
{
	if (OZYWIENIEC_OneTime == FALSE){
		AI_Teleport		(NASZ_229_Ayan, "TOT");
		B_StartOtherRoutine (NASZ_229_Ayan,"Dead");
		Wld_InsertNpc 	(OZYWIENIEC, "NASZ_OZYWIENIEC_40");
		Wld_PlayEffect("spellFX_Maya_Ghost",  OZYWIENIEC, OZYWIENIEC, 0, 0, 0, FALSE ); 
		Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",  OZYWIENIEC, OZYWIENIEC, 0, 0, 0, FALSE ); 
		Snd_Play ("MFX_GhostVoice"); 
		Snd_Play ("MFX_Firestorm_Cast"); 
		Snd_Play ("MFX_Lightning_Origin");
		Wld_InsertNpc 	(NASZ_402_Innos, "NASZ_OLDTEMPLE_INNOS");
		Wld_InsertNpc 	(NASZ_403_Adanos, "OW_ICEDRAGON_15");
		Wld_InsertNpc 	(NASZ_404_Beliar, "DT_E3_07");

		B_LogEntry (TOPIC_Monastir_bogowie, "Jasna cholera... Czy¿by Ayan u¿y³ tego zwoju? To by oznacza³o, ¿e bogowie zostali przyzwani, a on sam zmieni³ siê w... o¿ywieñca. A Monastir chcia³, ¿ebym to ja znalaz³ zwój i go u¿y³... Chyba muszê mu grzecznie powiedzieæ, co by siê ze mn¹ sta³o.");

		Log_SetTopicStatus (TOPIC_Ayan_nieznane, LOG_SUCCESS);

		OZYWIENIEC_OneTime = TRUE;
	};
};

//*********************************************************************
//	         TrollCanyon
//*********************************************************************
INSTANCE DIA_NASZ_229_Ayan_TrollCanyon   (C_INFO)
{
	npc         = NASZ_229_Ayan;
 	nr          = 30;
 	condition   = DIA_NASZ_229_Ayan_TrollCanyon_Condition;
 	information = DIA_NASZ_229_Ayan_TrollCanyon_Info;
 	permanent   = FALSE;
 	description = "Musisz udaæ siê do Kanionu Trolli.";
};

FUNC INT DIA_NASZ_229_Ayan_TrollCanyon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_229_Ayan_TrollCanyon_Info()
{
	AI_Output (other, self,"DIA_NASZ_229_Ayan_TrollCanyon_15_00"); //Musisz udaæ siê do Kanionu Trolli.
	AI_Output (self, other,"DIA_NASZ_229_Ayan_TrollCanyon_55_01"); //Tam? Strasznie daleko.
	AI_Output (self, other,"DIA_NASZ_229_Ayan_TrollCanyon_15_02"); //Przynieœ mi trzy ekstrakty lecznicze. Dopiero wtedy wyruszê w drogê.
};


//*********************************************************************
//	         Extract
//*********************************************************************
INSTANCE DIA_NASZ_229_Ayan_Extract   (C_INFO)
{
	npc         = NASZ_229_Ayan;
 	nr          = 31;
 	condition   = DIA_NASZ_229_Ayan_Extract_Condition;
 	information = DIA_NASZ_229_Ayan_Extract_Info;
 	permanent   = FALSE;
 	description = "Oto twoje mikstury.";
};

FUNC INT DIA_NASZ_229_Ayan_Extract_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_229_Ayan_TrollCanyon)
		&& npc_hasitems (other, ItPo_Health_02) >=3)
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_229_Ayan_Extract_Info()
{
	AI_Output (other, self,"DIA_NASZ_229_Ayan_Extract_15_00"); //Oto twoje mikstury.
	B_GiveInvItems (other, self, ItPo_Health_02, 3);
	AI_Output (self, other,"DIA_NASZ_229_Ayan_Extract_55_01"); //Dziêki. Wyruszam od razu!

	KerolothMysliwi = KerolothMysliwi + 1;
	
	Npc_ExchangeRoutine (self, "Twierdza");
	B_LogEntry (TOPIC_Keroloth_pomoc, "Ayan uda³ siê do twierdzy.");
	B_GivePlayerXP (100);
	
};

//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_229_Ayan_AmmannQuest   (C_INFO)
{
	npc         = NASZ_229_Ayan;
 	nr          = 38;
 	condition   = DIA_NASZ_229_Ayan_AmmannQuest_Condition;
 	information = DIA_NASZ_229_Ayan_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "WeŸ ten pierœcieñ.";
};

FUNC INT DIA_NASZ_229_Ayan_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_229_Ayan_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_229_Ayan_AmmannQuest_15_00"); //WeŸ ten pierœcieñ.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_229_Ayan_AmmannQuest_15_01"); //Pierœcieñ? Brakuje mi ju¿ palców na noszenie kolejnych pierœcieni.
	AI_Output (other, self,"DIA_NASZ_229_Ayan_AmmannQuest_15_02"); //W takim razie na jednym bêdziesz mia³ dwa.

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

INSTANCE DIA_NASZ_229_Ayan_PICKPOCKET (C_INFO)
{
	npc			= NASZ_229_Ayan;
	nr			= 900;
	condition	= DIA_NASZ_229_Ayan_PICKPOCKET_Condition;
	information	= DIA_NASZ_229_Ayan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_229_Ayan_PICKPOCKET_Condition()
{
	C_Beklauen (54);
};
 
FUNC VOID DIA_NASZ_229_Ayan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_229_Ayan_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_229_Ayan_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_229_Ayan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_229_Ayan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_229_Ayan_PICKPOCKET_DoIt);
};

func void DIA_NASZ_229_Ayan_PICKPOCKET_DoIt()
{
	B_BeklauenGold(89);
	
	Info_ClearChoices (DIA_NASZ_229_Ayan_PICKPOCKET);
};
	
func void DIA_NASZ_229_Ayan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_229_Ayan_PICKPOCKET);
};
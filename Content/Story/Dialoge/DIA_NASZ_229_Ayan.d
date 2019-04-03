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
	description	 = 	"Co robisz na tym kra�cu �wiata?";
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
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Hello_15_00"); //Co robisz na tym kra�cu �wiata?
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Hello_03_01"); //Zastanawiam si�, co mo�e by� po drugiej stronie tej rzeki.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Hello_03_02"); //Bez zw�tpienia by� tu kiedy� most. Je�li si� tam dostan�, mo�e znajd� co� ciekawego...

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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_most_03_00"); //Ju� wiem, jak dosta� si� na drugi brzeg!
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_most_03_01"); //Znalaz�em t� run� teleportacyjn� nurkuj�c w rzece.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_most_03_02"); //Uwierz mi, nie by�o �atwo! Mam nadziej�, �e si� op�aci.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_most_03_03"); //Szukam jakiego� osi�ka, bo samemu nie zamierzam si� tam wybiera�. Mo�e zechcesz mi towarzyszy�?

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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_chodzmy_03_01"); //�wietnie!
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_chodzmy_03_02"); //Z tym, �e runa jest jedna, a nas jest dw�ch.
	AI_PlayAni (self,"R_SCRATCHHEAD");
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_chodzmy_03_03"); //Przeteleportuj si� i rzu� run�. Dasz rad�?
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_chodzmy_03_04"); //Nie jestem pewien... Mo�liwe, �e runa spadnie do rzeki.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_chodzmy_03_05"); //Mam tylko nadziej�, �e j� znajd�. Do zobaczenia po drugiej stronie.
	AyanThrowReady = TRUE;
	ff_applyonceExt(AyanThrow,1000,-1);

	Log_CreateTopic (TOPIC_Ayan_nieznane, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ayan_nieznane, LOG_RUNNING);
	B_LogEntry (TOPIC_Ayan_nieznane, "Ayan znalaz� spos�b na predostanie si� za rzek� na tajemniczy p�askowy�. Rzuci run� do rzeki.");

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
	
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ready_03_00"); //Zadzia�a�o. 
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_ready_15_01"); //To chyba dobry znak. 
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ready_03_02"); //Cholera, pe�no tu o�ywie�c�w. Ten p�askowy� to jeden wielki gr�b.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ready_03_03"); //Id� pierwszy. Tak jak m�wi�em, jeste� mi potrzebny do walki z niebezpiecze�stwem.

	B_LogEntry (TOPIC_Ayan_nieznane, "Po drugiej stronie pe�no jest o�ywie�c�w. Ciekawe, czy co� tutaj znajdziemy?");

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
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_BeforeGraveyard_15_01"); //Wygl�da na wej�cie do grobowca. 
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_BeforeGraveyard_03_02"); //Chod�, zobaczymy co jest wewn�trz.

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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_00"); //A wi�c to orkowy grobowiec.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_01"); //To miejsce jest przepe�nione z�ymi czarami. Wydaje mi si�, �e to za spraw� starych orkowych run, duchy zmar�ych pozosta�y na cmentarzu.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Closed_15_02"); //Nigdy jeszcze nie spotka�em orkowego ducha.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_03"); //To tak jak ja. Zaczynam si� obawia� tego miejsca.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_04"); //Patrz, ten kamie� z pewno�ci� blokuje jaki� mechanizm. Musimy znale�� co�, co go przesunie.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Closed_15_05"); //Chod�my na d�. Mo�e tam co� znajdziemy.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Closed_03_06"); //Masz racj�. Prowad�.

	B_LogEntry (TOPIC_Ayan_nieznane, "Jeste�my w jakim� orkowym grobowcu. Pe�no tu orkowych duch�w. Ogromny kamie� tarasuje przej�cie, wi�c musimy znale�� mechanizm, kt�ry go przesunie.");

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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_hey_03_00"); //Hej, s�yszysz?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_hey_15_01"); //Te dziwne odg�osy dochodz� jakby z tego kana�u �ciekowego... Zapewne te zawalone boczne korytarze nie s� �lepe.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_hey_03_02"); //Nie widzia�em dot�d �adnego ko�owrotu ani prze��cznika, kt�ry m�g�by otworzy� wrota w poprzedniej komnacie..
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_hey_03_03"); //My�l�, �e trzeba przedosta� si� jako� przez ten kana�.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_hey_03_04"); //Wymy�l� co�, bez obaw.

	B_LogEntry (TOPIC_Ayan_nieznane, "W jednym z dolnych korytarzy natrafili�my na kana� �ciekowy, z kt�rego wydobywaj� si� odg�osy. Musz� znale�� spos�b, by przedosta� si� na drug� stron�.");

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
	description	 = 	"Znalaz�em zw�j przemiany w chrz�szcza.";
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
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_FindMeatbug_03_00"); //Znalaz�em zw�j przemiany w chrz�szcza.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_FindMeatbug_15_01"); //To na co czekasz? W�a� do kana�u.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_FindMeatbug_03_02"); //Tylko wr�� �ywy. Nie chc� zosta� sam w tym ponurym miejscu.

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
	description	 = 	"Przekr�ci�em ko�owr�t.";
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

	AI_Output			(other, self, "DIA_NASZ_229_Ayan_KolowrotRedi_03_00"); //Przekr�ci�em ko�owr�t.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_KolowrotRedi_15_01"); //A wi�c mo�emy i�� dalej?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_KolowrotRedi_03_02"); //C�... Chyba tak.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_KolowrotRedi_15_03"); //Chod�my wi�c!

	B_LogEntry (TOPIC_Ayan_nieznane, "Przej�cie do kolejnej komnaty powinno by� otwarte. Idziemy dalej.");
	
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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ILikeYou_03_00"); //Hej, m�ody.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ILikeYou_03_01"); //Polubi�em ci�. Mam nadziej�, �e za tym ma�ym kanalikiem nic ci si� nie przytrafi�o?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_ILikeYou_15_02"); //Ubi�em kilka orkowych duch�w, wszystko w porz�dku.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ILikeYou_03_03"); //Szczerze m�wi�c martwi�em si� troch�, czy dasz rad�. Raz jeszcze powt�rz�, �e nie chc� tu zosta� sam.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_ILikeYou_03_04"); //Ja tak samo...
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_ILikeYou_15_05"); //Nie daj si� zabi�, m�ody.

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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_NextChamber_03_00"); //Kolejna wielka sala. Musi tu znajdowa� si� co� cennego...
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_NextChamber_03_01"); //Wsz�dzie pe�no ork�w-duch�w... Musimy si� rozdzieli�.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_NextChamber_15_02"); //Ja poszukam tu czego� ciekawego, a ty pilnuj, by w tej wielkiej sali nagle nie zaroi�o si� od ork�w.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_NextChamber_03_03"); //Zgoda. Gdyby� czego� potrzebowa�, b�d� w centrum tej komnaty.

	B_LogEntry (TOPIC_Ayan_nieznane, "Trafili�my do wielkiej komnaty. Rozejrz� si� tu. Mo�e znajd� co� ciekawego?");
	
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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Musimy_03_00"); //Chyba poci�gn��e� za w�a�ciw� d�wigni�.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Musimy_03_01"); //Sta�em sobie i pali�em bagienne ziele, a tu nagle na �rodku tej komnaty w suficie co� drgn�o i moim oczom ukaza� si� pionowy szyb wentylacyjny.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Musimy_03_02"); //Wida� �wiat�o. Musi by� tu gdzie� winda.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Musimy_15_03"); //Chod�my na g�r�. Mo�e tam co� b�dzie.
	
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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_LookPrzelaczniki_03_00"); //Patrz! S� tu jakie� kolumny. Zapewn� da si� je poruszy�.
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_LookPrzelaczniki_03_01"); //Zobaczymy.

	B_LogEntry (TOPIC_Ayan_nieznane, "Je�li przekr�c� prze��czniki, by� mo�e winda si� aktywuje.");
	
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
	description	 = 	"Te kolumny chyba s� zepsute.";
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
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_nope_03_00"); //Te kolumny chyba s� zepsute.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_nope_03_01"); //No, chyba �e trzeba je przekr�ci� jednocze�nie.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_nope_03_02"); //Spr�bujmy.

	WillIsGoingToSwitchWillPrzelacznik = TRUE;
	B_LogEntry (TOPIC_Ayan_nieznane, "Ayan zaproponowa�, �eby�my przekr�cili prze��czniki r�wnocze�nie.");
	
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

	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Dziala_03_00"); //Widzia�e� ten b�ysk na dole?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_Dziala_03_01"); //Tak, ale nie jestem pewien, czy winda b�dzie dzia�a�.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_Dziala_03_02"); //Pora si� przekona�. Sta�my pod tym szybem, mo�e winda ruszy.

	B_LogEntry (TOPIC_Ayan_nieznane, "Uda�o si�! Musimy teraz razem stan�� na platform� pod szybem w suficie.");
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

	AI_Output (self, other, "DIA_NASZ_229_Ayan_Dolina_03_00"); //Ukryta dolina? Niemo�liwe... Wygl�da, jakby od stuleci nikt tutaj nie zagl�da�.
	AI_Output (self, other, "DIA_NASZ_229_Ayan_Dolina_03_01"); //Rozejrzyjmy si� tutaj.
	
	B_LogEntry (TOPIC_Ayan_nieznane, "Trafili�my do jakiej� ukrytej doliny. Jakie skarby chowa? Jaka jest jej przesz�o��? Chyba teraz legenda Monastira nabiera sensu...");

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
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_done_03_00"); //O jasna cholera! Co.. co to by�o?
	AI_Output			(other, self, "DIA_NASZ_229_Ayan_done_15_01"); //Chyba zaczynam si� domy�la�... tylko... gdzie jest zw�j? Musi gdzie� tu by�.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_done_03_02"); //Jaki zw�j? Przeszukam dok�adnie tego umarlaka. Ty id� na g�r�. Mo�e tam znajdziesz co� ciekawego.
	AI_Output			(self, other, "DIA_NASZ_229_Ayan_done_03_03"); //B�d� ostro�ny. To miejsce jest przesi�kni�te z�em.

	B_LogEntry (TOPIC_Monastir_bogowie, "Wygl�da na to, �e znalaz�em komnat� o�ywie�ca... Ayan poleci� mi rozejrze� si� na g�rze, podczas gdy on sam przeszuka dok�adniej zw�oki.");
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

		B_LogEntry (TOPIC_Monastir_bogowie, "Jasna cholera... Czy�by Ayan u�y� tego zwoju? To by oznacza�o, �e bogowie zostali przyzwani, a on sam zmieni� si� w... o�ywie�ca. A Monastir chcia�, �ebym to ja znalaz� zw�j i go u�y�... Chyba musz� mu grzecznie powiedzie�, co by si� ze mn� sta�o.");

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
 	description = "Musisz uda� si� do Kanionu Trolli.";
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
	AI_Output (other, self,"DIA_NASZ_229_Ayan_TrollCanyon_15_00"); //Musisz uda� si� do Kanionu Trolli.
	AI_Output (self, other,"DIA_NASZ_229_Ayan_TrollCanyon_55_01"); //Tam? Strasznie daleko.
	AI_Output (self, other,"DIA_NASZ_229_Ayan_TrollCanyon_15_02"); //Przynie� mi trzy ekstrakty lecznicze. Dopiero wtedy wyrusz� w drog�.
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
	AI_Output (self, other,"DIA_NASZ_229_Ayan_Extract_55_01"); //Dzi�ki. Wyruszam od razu!

	KerolothMysliwi = KerolothMysliwi + 1;
	
	Npc_ExchangeRoutine (self, "Twierdza");
	B_LogEntry (TOPIC_Keroloth_pomoc, "Ayan uda� si� do twierdzy.");
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
 	description = "We� ten pier�cie�.";
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
	AI_Output (other, self,"DIA_NASZ_229_Ayan_AmmannQuest_15_00"); //We� ten pier�cie�.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_229_Ayan_AmmannQuest_15_01"); //Pier�cie�? Brakuje mi ju� palc�w na noszenie kolejnych pier�cieni.
	AI_Output (other, self,"DIA_NASZ_229_Ayan_AmmannQuest_15_02"); //W takim razie na jednym b�dziesz mia� dwa.

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		B_LogEntry (TOPIC_Ammann_wiernosc, "Rozda�em wszystkie pier�cienie.");
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
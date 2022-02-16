var int LOWCA_STOP_GADANIE;
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_123_Lowca_EXIT   (C_INFO)
{
	npc         = NASZ_123_Lowca;
	nr          = 999;
	condition   = DIA_NASZ_123_Lowca_EXIT_Condition;
	information = DIA_NASZ_123_Lowca_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_123_Lowca_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_123_Lowca_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_123_Lowca_hello		(C_INFO)
{
	npc		 	 = 	NASZ_123_Lowca;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_123_Lowca_hello_Condition;
	information	 = 	DIA_NASZ_123_Lowca_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_123_Lowca_hello_Condition ()
{
	if (((Npc_IsInState (self, ZS_Talk) && (LOWCA_STOP_GADANIE == FALSE))
	|| (Npc_IsInState (self, ZS_Talk) && (LOWCA_STOP_GADANIE == TRUE) && (Wld_IsTime(02,00,23,30))))
	&& 	(!Hlp_StrCmp(Npc_GetNearestWP(self),"OW_SPAWN_TRACK_LEICHE_01"))
	&& (Lowca123_PojedynekDoRozegrania == FALSE))
	
	|| (KAPITEL >= 3) // od trzeciego rozdzia�u nie da si� rozmawia�, bo inaczej da�oby si� zrobi� questa z Rethonem treningiem
	
	{
		return TRUE;
	};
};
func void DIA_NASZ_123_Lowca_hello_Info ()
{
	if (LOWCA_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_123_Lowca_hello_03_00"); //Nie przeszkadzaj mi!
	LOWCA_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (LOWCA_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_123_Lowca_hello_03_01"); //Cz�owieku, we� si� odczep.
	LOWCA_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (LOWCA_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_123_Lowca_hello_03_02"); //Zostaw mnie w spokoju!
	LOWCA_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_123_Lowca_hello_03_03"); //Nie mam teraz czasu.
	LOWCA_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

///////////////////////////////////////////////////////////////////////
//	Info Pojedynek
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_123_Lowca_pojedynek		(C_INFO)
{
	npc			 = 	NASZ_123_Lowca;
	nr		 	 = 	2;
	condition	 = 	DIA_NASZ_123_Lowca_pojedynek_Condition;
	information	 = 	DIA_NASZ_123_Lowca_pojedynek_Info;
	permanent	 = 	FALSE;
	description	 =	"Przyszed�em spr�bowa� swoich si� w walce.";
};

func int DIA_NASZ_123_Lowca_pojedynek_Condition ()
{
	if(Lowca123_PojedynekDoRozegrania == TRUE)
	&& (KAPITEL < 3)
	{
		return TRUE;
	};
};

func void DIA_NASZ_123_Lowca_pojedynek_Info ()
{
	AI_Output		(other, self, "DIA_NASZ_123_Lowca_pojedynek_55_00"); //Przyszed�em spr�bowa� swoich si� w walce.
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_pojedynek_03_01"); //Hej, to nie jest arena! A mo�e ja nie chc� z tob� walczy�?
	AI_Output		(other, self, "DIA_NASZ_123_Lowca_pojedynek_55_02"); //Ale ja chc� z tob�. Je�li wyci�gn� miecz, b�dziesz musia� si� broni�. Dalej ci� nie przekona�em?
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_pojedynek_03_03"); //Czekaj, czekaj. Mo�e to ja ci� do czego� przekonam? Za 30 sztuk z�ota sprzedam ci trucizn�, a ty zostawisz mnie w spokoju.
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_pojedynek_55_04"); //To wyj�tkowo dobra cena!

	
	Info_ClearChoices (DIA_NASZ_123_Lowca_pojedynek);
		Info_AddChoice	  (DIA_NASZ_123_Lowca_pojedynek, "Nie przekupisz mnie. Walcz!", DIA_NASZ_123_Lowca_pojedynek_fight);
		if (npc_hasitems(other,ItMi_Gold)>=30) {
			Info_AddChoice	  (DIA_NASZ_123_Lowca_pojedynek, "Zgoda, mo�emy p�j�� na taki uk�ad.", DIA_NASZ_123_Lowca_pojedynek_buy);
		};
		Info_AddChoice	  (DIA_NASZ_123_Lowca_pojedynek, "A na co mi trucizna?", DIA_NASZ_123_Lowca_pojedynek_why);
		

};

FUNC VOID DIA_NASZ_123_Lowca_pojedynek_fight()
{
	AI_Output (other,self ,"DIA_NASZ_123_Lowca_pojedynek_fight_15_00"); //Nie przekupisz mnie. Walcz!
	AI_Output (self, other,"DIA_NASZ_123_Lowca_pojedynek_fight_55_01"); //Czyli jednak to ty mnie przekona�e�...
	
	LOWCA_STOP_GADANIE = TRUE;
	AI_StopProcessInfos (self);
	B_Attack  (self, other, AR_NONE, 1);
};

FUNC VOID DIA_NASZ_123_Lowca_pojedynek_buy()
{
	Lowca123_PojedynekWzietaTrucizna = TRUE;
	Lowca123Pojedynek_Done = TRUE;
	
	AI_Output (other,self ,"DIA_NASZ_123_Lowca_pojedynek_buy_15_00"); //Zgoda, mo�emy p�j�� na taki uk�ad.
	B_giveinvitems 	(other, self, ItMi_Gold, 30);	
	AI_Output (self, other,"DIA_NASZ_123_Lowca_pojedynek_buy_55_01"); //Ahh, ta perswazja. Trzymaj.
	
	Createinvitems	(self, ItNa_Trucizna, 1);
	B_giveinvitems 	(self, other, ItNa_Trucizna, 1);	
	
	AI_Output (other, self,"DIA_NASZ_123_Lowca_pojedynek_buy_55_02"); //Uwa�aj, �ebym kiedy� nie wla� jej tobie do zupy.
	AI_Output (self, other,"DIA_NASZ_123_Lowca_pojedynek_buy_55_03"); //Id� ju� lepiej. Mnie nie nastraszysz.
	
	B_LogEntry (TOPIC_Rethon_szkolenie, "Z jednym z �owc�w doszed�em do porozumienia i oby�o si� bez walki. Ale to chyba nic z�ego.");
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_NASZ_123_Lowca_pojedynek_why()
{
	AI_Output (other,self ,"DIA_NASZ_123_Lowca_pojedynek_why_15_00"); //A na co mi trucizna?
	AI_Output (self, other,"DIA_NASZ_123_Lowca_pojedynek_why_55_01"); //Mo�esz j� poda� �owcy obok nas przed walk� albo komu� innemu.
	AI_Output (self, other,"DIA_NASZ_123_Lowca_pojedynek_why_15_02"); //Tylko wymy�l jak�� g�upi� historyjk�, �eby si� nie zorientowa�.

};


//*********************************************************************
//	Info PoWalce
//*********************************************************************
INSTANCE DIA_NASZ_123_Lowca_PoWalce   (C_INFO)
{
	npc         = NASZ_123_Lowca;
 	nr          = 5;
 	condition   = DIA_NASZ_123_Lowca_PoWalce_Condition;
 	information = DIA_NASZ_123_Lowca_PoWalce_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_123_Lowca_PoWalce_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_123_Lowca_pojedynek)
		&& ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_123_Lowca_PoWalce_Info()
{
	Lowca123Pojedynek_Done = TRUE;
	LOWCA_STOP_GADANIE = TRUE;
	Lowca123_PojedynekDoRozegrania = FALSE;
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		AI_Output (self, other,"DIA_NASZ_123_Lowca_PoWalce_15_00"); //A niech ci�, ale umiesz przy�o�y�! �a�uj�, �e nie da�em rady ci� przekupi�. Oszcz�dzi�bym troch� siniak�w.
		AI_Output (other, self,"DIA_NASZ_123_Lowca_PoWalce_55_01"); //Mo�e i tak, ale sprawiedliwa walka to dobry trening. Dzi�ki za walk�!

		B_LogEntry (TOPIC_Rethon_szkolenie, "�owca za�atwiony. Dobrze, �e nie da�em si� nam�wi� na trucizn� zamiast walki, bo jeszcze Rethon krzywo by na to patrzy�.");
		B_GivePlayerXP (200);
	}
	else {
		AI_Output (self, other,"DIA_NASZ_123_Lowca_PoWalce_15_02"); //Widzisz? Trzeba by�o bra� trucizn�.

		B_LogEntry (TOPIC_Rethon_szkolenie, "No tak, przegra�em. Wszystko mnie boli!");
	};

};


var int LOWCA_CATCH_PRIZE;
var int LOWCA_CATCH_NO;
///////////////////////////////////////////////////////////////////////
//	Info Catch
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_123_Lowca_catch		(C_INFO)
{
	npc		 = 	NASZ_123_Lowca;
	nr		 = 	2;
	condition	 = 	DIA_NASZ_123_Lowca_catch_Condition;
	information	 = 	DIA_NASZ_123_Lowca_catch_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_123_Lowca_catch_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& (Wld_IsTime(23,30,02,00))
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_LOWCY_TRENING_15")
		&& npc_knowsinfo (other, DIA_NASZ_124_Bron_zadanie)
		&& (LOWCA_STOP_GADANIE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NASZ_123_Lowca_catch_Info ()
{
	AI_Output		(other, self, "DIA_NASZ_123_Lowca_catch_55_00"); //Co ty tu robisz?
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_catch_03_01"); //O cholera...
	AI_Output		(other, self, "DIA_NASZ_123_Lowca_catch_55_02"); //A wi�c to ty podkradasz si� co noc do zapas�w.
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_catch_03_03"); //Nie s�dzi�em, �e kto� mnie z�apie.
	AI_Output		(other, self, "DIA_NASZ_123_Lowca_catch_55_04"); //Oddawaj wod� �wi�con�, kt�r� ukrad�e�!
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_catch_03_05"); //Bierz to, bierz. Teraz pewnie powiesz to wszystkim?
	Createinvitems	(self, ItNa_WodaSwiecona_Adanos, 1);
	B_giveinvitems 	(self, other, ItNa_WodaSwiecona_Adanos, 1);	
	AI_Output		(other, self, "DIA_NASZ_123_Lowca_catch_55_06"); //W�a�ciwie to taki mam zamiar.
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_catch_03_07"); //Nie, nie, czekaj! Wykrad�em ju� do�� ciekawych rzeczy. Mog� da� ci pier�cie� si�y albo 200 sztuk z�ota.
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_catch_03_08"); //W zamian prosz� ci� tylko o milczenie.

	B_LogEntry (TOPIC_Bron_woda, "Uda�o si�! Odzyska�em wod� �wi�con�.");
	
	LOWCA_STOP_GADANIE = FALSE;
	Npc_ExchangeRoutine (self, "Start");

	Info_ClearChoices (DIA_NASZ_123_Lowca_catch);
		Info_AddChoice	  (DIA_NASZ_123_Lowca_catch, "Daj mi i pier�cie�, i z�oto.", DIA_NASZ_123_Lowca_catch_both);
		Info_AddChoice	  (DIA_NASZ_123_Lowca_catch, "Nie, w obozie nie mo�na tolerowa� z�odziei.", DIA_NASZ_123_Lowca_catch_no);
		Info_AddChoice	  (DIA_NASZ_123_Lowca_catch, "Daj mi z�oto.", DIA_NASZ_123_Lowca_catch_gold);
		Info_AddChoice	  (DIA_NASZ_123_Lowca_catch, "Wezm� pier�cie� si�y.", DIA_NASZ_123_Lowca_catch_sila);

};

func void Lowca123Say_ForgetIt() {
	AI_Output (self, other,"Lowca123Say_ForgetIt_55_01"); //Bierz to. I zapomnij o tym, co widzia�e�.
};

func void Lowca123Say_EndWithThis() {
	AI_Output (self, other,"Lowca123Say_EndWithThis_55_00"); //Ko�cz� z tym podkradaniem. To robi si� zbyt ryzykowne.
};

FUNC VOID DIA_NASZ_123_Lowca_catch_both()
{

	AI_Output (other,self ,"DIA_NASZ_123_Lowca_catch_both_15_00"); //Daj mi i pier�cie�, i z�oto.
	AI_Output (self, other,"DIA_NASZ_123_Lowca_catch_both_55_01"); //CO?! No dobra, bierz to i zapomnijmy o ca�ym zdarzeniu.
	Lowca123Say_EndWithThis();
		
	Createinvitems	(self, ItRi_Str_01, 1);
	B_giveinvitems 	(self, other, ItRi_Str_01, 1);	
	Createinvitems	(self, ItMi_Gold, 200);
	B_giveinvitems 	(self, other, ItMi_Gold, 200);	

	LOWCA_CATCH_PRIZE = TRUE;
	AI_StopProcessInfos (self);

};

FUNC VOID DIA_NASZ_123_Lowca_catch_no()
{

	AI_Output (other,self ,"DIA_NASZ_123_Lowca_catch_no_15_00"); //Nie, w obozie nie mo�na tolerowa� z�odziei.
	AI_Output (self, other,"DIA_NASZ_123_Lowca_catch_no_55_01"); //Jeszcze mi za to zap�acisz...
	AI_Output (other,self ,"DIA_NASZ_123_Lowca_catch_no_15_02"); //Taki pewien? Obecnie to ty jeste� w gorszej sytuacji.

	LOWCA_CATCH_NO = TRUE;
	AI_StopProcessInfos (self);

};

FUNC VOID DIA_NASZ_123_Lowca_catch_gold()
{

	AI_Output (other,self ,"DIA_NASZ_123_Lowca_catch_gold_15_00"); //Daj mi z�oto.
	Lowca123Say_ForgetIt();
	Lowca123Say_EndWithThis();
	
	Createinvitems	(self, ItMi_Gold, 200);
	B_giveinvitems 	(self, other, ItMi_Gold, 200);	
	
	LOWCA_CATCH_PRIZE = TRUE;
	Info_ClearChoices (DIA_NASZ_123_Lowca_catch);
};
FUNC VOID DIA_NASZ_123_Lowca_catch_sila()
{

	AI_Output (other,self ,"DIA_NASZ_123_Lowca_catch_sila_15_00"); //Wezm� pier�cie� si�y.
	Lowca123Say_ForgetIt();
	Lowca123Say_EndWithThis();
	
	Createinvitems	(self, ItRi_Str_01, 1);
	B_giveinvitems 	(self, other, ItRi_Str_01, 1);	
	
	LOWCA_CATCH_PRIZE = TRUE;
	Info_ClearChoices (DIA_NASZ_123_Lowca_catch);
};

var int LOWCA_BANICJA_ONETIME;
///////////////////////////////////////////////////////////////////////
//	Info Banicja
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_123_Lowca_banicja		(C_INFO)
{
	npc			 = 	NASZ_123_Lowca;
	nr			 = 	3;
	condition	 = 	DIA_NASZ_123_Lowca_banicja_Condition;
	information	 = 	DIA_NASZ_123_Lowca_banicja_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_123_Lowca_banicja_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& (!LOWCA_BANICJA_ONETIME)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"OW_SPAWN_TRACK_LEICHE_01"))

	{
		return TRUE;
	};
};

func void DIA_NASZ_123_Lowca_banicja_Info ()
{
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_banicja_55_00"); //Czego jeszcze chcesz?
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_banicja_03_01"); //Przez ciebie zosta�em wygnany z obozu!
	AI_Output		(other, self, "DIA_NASZ_123_Lowca_banicja_55_02"); //Moim zdaniem sam sobie na to zapracowa�e�.
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_banicja_03_03"); //Odwal si�.

	LOWCA_BANICJA_ONETIME = TRUE;

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BanicjaSecond
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_123_Lowca_banicjasecond		(C_INFO)
{
	npc			 = 	NASZ_123_Lowca;
	nr			 = 	4;
	condition	 = 	DIA_NASZ_123_Lowca_banicjasecond_Condition;
	information	 = 	DIA_NASZ_123_Lowca_banicjasecond_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_NASZ_123_Lowca_banicjasecond_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& (LOWCA_BANICJA_ONETIME == TRUE)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"OW_SPAWN_TRACK_LEICHE_01"))

	{
		return TRUE;
	};
};

func void DIA_NASZ_123_Lowca_banicjasecond_Info ()
{
	AI_Output		(self, other, "DIA_NASZ_123_Lowca_banicjasecond_55_00"); //Wara!

	AI_StopProcessInfos (self);
};
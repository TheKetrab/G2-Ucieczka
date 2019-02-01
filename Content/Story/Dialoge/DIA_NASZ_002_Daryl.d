var int DARYL_JE;
var int Mis_Daryl_mieso;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_EXIT   (C_INFO)
{
	npc         = NASZ_002_Daryl;
	nr          = 999;
	condition   = DIA_NASZ_002_Daryl_EXIT_Condition;
	information = DIA_NASZ_002_Daryl_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_002_Daryl_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_002_Daryl_EXIT_Info()
{
	if (DARYL_JE == TRUE)
	{
		Createinvitems (self, ItAt_Meatbugflesh, 1);
		B_UseItem (NASZ_002_Daryl, ItAt_Meatbugflesh);

		AI_Output (self, other,"DIA_NASZ_002_Daryl_exit_55_00"); //Pycha!
		AI_Output (self, other,"DIA_NASZ_002_Daryl_exit_55_01"); //Nie mog� ci nic da�... Ale we� m�j kij.
		AI_Output (self, other,"DIA_NASZ_002_Daryl_exit_55_02"); //Przyda ci si�, gdy b�dziesz chcia� si� obroni� przed kt�rym� z tych bandzior�w.
		
		Createinvitems (self, ItMw_1h_Bau_Mace, 1);
		B_giveinvitems (self, other, ItMw_1h_Bau_Mace, 1);
		DARYL_JE = FALSE;
		AI_StopProcessInfos (self);
	}
	else
	{
		
		AI_StopProcessInfos (self);
		
	};
};

//*********************************************************************
//	Info hi 
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_hi   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 1;
 	condition   = DIA_NASZ_002_Daryl_hi_Condition;
 	information = DIA_NASZ_002_Daryl_hi_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_002_Daryl_hi_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_002_Daryl_hi_Info()
{
	AI_Output (self, other,"DIA_NASZ_002_Daryl_hi_15_00"); //Hej, ty! Pr�bujesz uciec?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_hi_55_01"); //A mam na to jakie� szanse?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_hi_15_02"); //Zapomnij. Jeden ju� pr�bowa�. Grimes, pami�tasz?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_hi_55_03"); //I co z nim?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_hi_55_04"); //Nie ma go. Widzia�em tylko z ko�ca jaskini, jak skr�ci� zaraz za stra�nikiem w prawo.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_hi_55_05"); //To by� pierwszy i zarazem ostatni, kt�ry ucieka�.

	B_LogEntry (TOPIC_Kopalnia, "Grimes uciek� z kopalni. Nie wiadomo, czy �yje. Daryl widzia� go, jak skr�ca� zaraz za stra�nikiem w prawo.");		

};

//*********************************************************************
//	         Help
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_help   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 2;
 	condition   = DIA_NASZ_002_Daryl_help_Condition;
 	information = DIA_NASZ_002_Daryl_help_Info;
 	permanent   = FALSE;
 	description = "Czemu nie pracujesz?";
};

FUNC INT DIA_NASZ_002_Daryl_help_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_002_Daryl_hi))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_002_Daryl_help_Info()
{
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_help_15_00"); //Czemu nie pracujesz?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_help_55_01"); //Jestem g�odny. Nie mam ju� si�y.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_help_55_02"); //Zabi�bym za kawa�ek mi�sa.

	MIS_DARYL_READY = TRUE;

	Mis_Daryl_mieso = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Daryl_mieso, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Daryl_mieso, LOG_RUNNING);
	B_LogEntry (TOPIC_Daryl_mieso, "Daryl jest g�odny. Tylko... Co on mo�e zje��? Porcje �ywno�ciowe s� tutaj tak ma�e, �e ja sam umieram z g�odu.");

};

//*********************************************************************
//	         Done
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_done   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 3;
 	condition   = DIA_NASZ_002_Daryl_done_Condition;
 	information = DIA_NASZ_002_Daryl_done_Info;
 	permanent   = FALSE;
 	description = "Mam dla ciebie mi�so chrz�szcza.";
};

FUNC INT DIA_NASZ_002_Daryl_done_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_002_Daryl_help)
		&& npc_hasitems (other, ItAt_Meatbugflesh) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_002_Daryl_done_Info()
{
	MIS_DARYL_READY = FALSE;
	
	AI_StandUp (self);
	B_TurnToNpc (self,other);

	AI_Output (other,self ,"DIA_NASZ_002_Daryl_done_15_00"); //Mam dla ciebie mi�so chrz�szcza.

	B_giveinvitems (other, self, ItAt_Meatbugflesh, 1);

	AI_Output (self, other,"DIA_NASZ_002_Daryl_done_55_01"); //Wielkie nieba! Dzi�kuj�.

	AI_Output (self, other,"DIA_NASZ_002_Daryl_done_55_04"); //Wracam do pracy, bo nie chc� oberwa�.

	DARYL_JE = TRUE;
	B_GivePlayerXP (100);
	Mis_Daryl_mieso = LOG_SUCCESS;
	Log_SetTopicStatus (TOPIC_Daryl_mieso, LOG_SUCCESS);
	B_LogEntry (TOPIC_Daryl_mieso, "Daryl zjad� mi�so z chrz�szczy. Ciekawe, na ile mu to wystarczy?");

	Npc_ExchangeRoutine (self, "Start");
};

//*********************************************************************
//	         MamGrzyba
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_MamGrzyba   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 4;
 	condition   = DIA_NASZ_002_Daryl_MamGrzyba_Condition;
 	information = DIA_NASZ_002_Daryl_MamGrzyba_Info;
 	permanent   = FALSE;
 	description = "Co powiesz na kopalnianego grzyba?";
};

FUNC INT DIA_NASZ_002_Daryl_MamGrzyba_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_002_Daryl_help)
		&& !(npc_knowsinfo (other, DIA_NASZ_002_Daryl_done))
		&& npc_hasitems (other, ItNa_KopalnianyGrzyb) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_002_Daryl_MamGrzyba_Info()
{	
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_MamGrzyba_15_00"); //Co powiesz na kopalnianego grzyba?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_MamGrzyba_55_01"); //Co? �artujesz chyba sobie! Nie wiesz, �e s� truj�ce?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_MamGrzyba_55_02"); //Cz�owieku, przynie� mi kawa�ek sera, okruch� chleba albo jakie� tandetne mi�so, kt�re da si� pogry��.
	
	B_LogEntry (TOPIC_Daryl_mieso, "M�j pomys� z kopalnianym grzybem nie spodoba� si� zbytnio Darylowi. Musz� wykombinowa� co� innego.");
};



//*********************************************************************
//	         BenPassword
//*********************************************************************
var int BenPassword_Perm_False;
INSTANCE DIA_NASZ_002_Daryl_BenPassword   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 4;
 	condition   = DIA_NASZ_002_Daryl_BenPassword_Condition;
 	information = DIA_NASZ_002_Daryl_BenPassword_Info;
 	permanent   = TRUE;
 	description = "'Sikorka �piewa o poranku, a skowronek s�ucha jej melodii.'";
};

FUNC INT DIA_NASZ_002_Daryl_BenPassword_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_Ben3Szkodnik))
	&& (BenPassword_Perm_False == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_002_Daryl_BenPassword_Info()
{
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BenPassword_15_00"); //'Sikorka �piewa o poranku, a skowronek s�ucha jej melodii.'
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_01"); //Przysy�a ci� Ben? O co chodzi?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BenPassword_55_02"); //Chcemy uciszy� szkodnika raz na zawsze, a ty masz pono� pomys�, jak to zrobi�.
	
	if(Mis_Daryl_mieso != LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_03"); //M�j m�ody przyjacielu... Jestem tak g�odny, �e nie potrafi� trze�wo my�le�.
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_04"); //Przynie� mi co� do jedzenia, dopiero wtedy pogadamy.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_05"); //Nareszcie nasta�a chwila, kiedy pozb�dziemy si� tego sukinsyna.
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_06"); //Ostatnio z jego powodu zosta�em pobity przez stra�nik�w, gdy� ten powiedzia� im, �e z powodu choroby, nie pracuj� tak efektownie jak reszta.
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_07"); //Przez tydzie� nie czu�em w�asnej g�owy i brzucha. Wracaj�c jednak do mojego planu, to wiem ju�, jak mo�emy zamkn�� mu bu�k�.
		BenPassword_Perm_False = TRUE;
	};
};

//*********************************************************************
//	         ZamieniamSie
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_ZamieniamSie   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 4;
 	condition   = DIA_NASZ_002_Daryl_ZamieniamSie_Condition;
 	information = DIA_NASZ_002_Daryl_ZamieniamSie_Info;
 	permanent   = FALSE;
 	description = "Zamieniam si� w s�uch.";
};

FUNC INT DIA_NASZ_002_Daryl_ZamieniamSie_Condition()	
{
	if (BenPassword_Perm_False == TRUE) // jesli pogadamy z Darylem + zalatwimy z chrzaszczem
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_002_Daryl_ZamieniamSie_Info()
{

	AI_Output (other, self,"DIA_NASZ_002_Daryl_ZamieniamSie_55_00"); //Zamieniam si� w s�uch.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_01"); //Jak dobrze wiesz, on jako jedyny z nas wszystkich sympatyzuje si� ze stra�nikami i robi wszystko, aby si� im przypodoba�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_02"); //Nie wiem, co chce tym osi�gn��, jednak za chwil� nie b�dziemy musieli si� tym przejmowa�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_03"); //Kojarzysz ten zamkni�ty tunel obok Bena, w kt�rym wstrzymano wydobycie, bo sko�czy�a si� tam ju� ruda?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_04"); //Ostatnio odkry�em, �e zosta�a tam jedna bry�a, i nie by�oby w niej nic specjalnego, gdyby nie fakt, �e jest strasznie nadkruszona.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_05"); //Wystarczy jeden zamach kilofem �eby ca�y strop spad� na ciebie. Ju� wiesz, jak zamierzam wykorzysta� ten fakt?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_ZamieniamSie_55_06"); //Chyba tak, ale w mojej g�owie rodzi si� pewna w�tpliwo��: Jak chcesz go przekona� do wydobycia rudy w tym tunelu?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_ZamieniamSie_55_07"); //Przecie� on nie jest tak g�upi, aby �lepo zawierzy� w to, co m�wimy.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_08"); //Tym te� si� ju� zaj��em. Upozorujemy sytuacj�, w kt�rej chwalisz mi si�, �e wydoby�e� tam du�y kawa� o wiele czystszej rudy ni� ta tutaj.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_09"); //Jestem pewien, �e po�knie haczyk i sam p�jdzie si� temu przyjrze�, a wtedy b�dziemy mieli spok�j.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_10"); //Jednak b�dziesz potrzebowa� dowodu na swoje s�owa. Troch� si� przy tym nam�czy�em, ale w ko�cu uda�o mi si� wy�upa� du�� bry�k� rudy, kt�ra znacz�co r�ni si� od innych.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_11"); //Udaj si� do Sattara, powinien ju� sko�czy� prac� nad tym, aby wygl�da�a na bardziej szlachetn� ni� reszta.
		
	B_LogEntry (TOPIC_Ben_szkodnik, "Je�eli Daryl mia� racj�, to nied�ugo czeka nas naprawd� du�e zamieszanie. Mam tylko nadziej�, �e Bryson po�knie haczyk i nie wyczuje naszego podst�pu. W przeciwnym wypadku wszyscy zawi�niemy na sznurze.");

};


//*********************************************************************
//	         SattarNugget
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_SattarNugget   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 4;
 	condition   = DIA_NASZ_002_Daryl_SattarNugget_Condition;
 	information = DIA_NASZ_002_Daryl_SattarNugget_Info;
 	permanent   = FALSE;
 	description = "Gotowe, mam ska��.";
};

FUNC INT DIA_NASZ_002_Daryl_SattarNugget_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_020_Sattar_HaveYouFinished)
		&& npc_hasitems (other, ItNa_WyszlifowanaRuda) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_002_Daryl_SattarNugget_Info()
{
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_SattarNugget_15_00"); //Gotowe, mam ska��.
	// (uwa�nie przygl�da si� bry�ce rudy)
	AI_Output (self, other,"DIA_NASZ_002_Daryl_SattarNugget_55_01"); //Daj no spojrze� na to male�stwo. Cholera, Sattar jest prawdziwym arcymistrzem! Ta ska�a wygl�da tak prawdziwie, �e sam przez chwil� si� nabra�em.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_SattarNugget_55_02"); //Teraz s�uchaj uwa�nie: P�jdziemy do tunelu Brysona i zaczniemy tam ze sob� rozmawia�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_SattarNugget_55_03"); //W pewnym momencie wtr�cisz, �e wydoby�e� w zamkni�tym tunelu wyj�tkow� bry�k� rudy i masz zamiar pokaza� j� stra�nikom.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_SattarNugget_55_04"); //To powinno zwr�ci� jego uwag�. A wi�c do dzie�a!
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SitBryson");
	
};

var int BrysonWentToDie;

//*********************************************************************
//	         BrysonTRIA
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_BrysonTRIA   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 5;
 	condition   = DIA_NASZ_002_Daryl_BrysonTRIA_Condition;
 	information = DIA_NASZ_002_Daryl_BrysonTRIA_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_002_Daryl_BrysonTRIA_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_002_Daryl_SattarNugget))
		&& (Npc_IsInState(self, ZS_TALK))
		&& (Npc_GetDistToWP	(self, "NASZ_KOPALNIA_NOWY_20") <=500)
	{
		return TRUE;
	};
};


FUNC VOID DIA_NASZ_002_Daryl_BrysonTRIA_Info()
{
	
	var C_NPC Daryl; Daryl = Hlp_GetNpc (NASZ_002_Daryl);
	var C_NPC Bryson; Bryson = Hlp_GetNpc (NASZ_004_Bryson);
	TRIA_Invite(Daryl);
	TRIA_Invite(Bryson);
    TRIA_Start();
 
	TRIA_Next(Daryl);

	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_15_00"); //Ty te� zrobi�e� sobie chwilow� przerw�?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_01"); //Tak, od tego �upania w ska�y nie czuj� ju� r�k. Nie wspominaj�c o towarzysz�cym od rana g�odzie, kt�ry nie chce da� za wygran�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_55_02"); //Wi�c czujesz to samo co ja... Nied�ugo m�j kilof rozpadnie si� w drzazgi od tego kopania, ju� ostrze ledwie trzyma si� na trzonku.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_55_03"); //Tylko czeka�, a� wypadnie i zrobi komu� krzywd�. Wygl�dasz jednak na strasznie zadowolonego, dlaczego?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_04"); //Od d�u�szego czasu intuicja podpowiada�a mi, abym sprawdzi� boczny tunel w sektorze Bena, w kt�rym zako�czyli�my wydobycie.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_05"); //Nie uwierzysz, co tam znalaz�em!

	TRIA_Cam("TRIA_CAM_KOPALNIA");
	Npc_ExchangeRoutine (NASZ_004_Bryson, "GoToTria");
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_06"); //Po ostatnim osuwisku pojawi�o si� tam z�o�e wyj�tkowo czystej magicznej rudy.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_07"); //Sp�jrz na t� bry�k�. Jak my�lisz, czy stra�nicy zgodz� si� nam podnie�� racje �ywno�ciowe je�li im to poka��?
	
	TRIA_Next(Bryson);
	AI_TurnToNpc(other, self);
	AI_RunToNPC(self, hero);
	
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_55_08"); //Zaryzykowa�e� kar�, aby sprawdzi� swoj� intuicj�? Godne podziwu, co tam znalaz�e�?
	
	TRIA_Finish();
	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonTRIA);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "Znalaz�em tak� oto ska��.", DIA_NASZ_002_Daryl_BrysonTRIA_iFound);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "Je�eli tak bardzo chcesz mie� ten kamie� to bierz sw�j kilof i zabieraj si� do roboty.", DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "Nie tw�j cholerny interes.", DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines);
			
};

func void Bryson_Go_Away() {

	AI_Output (self, other,"DIA_Bryson_Go_Away_55_00"); //Na Innosa! Za t� ska�� dostan� tyle �arcia, �e ju� nigdy nie b�d� g�odowa�!
	AI_Output (self, other,"DIA_Bryson_Go_Away_55_01"); //Od zawsze wiedzia�em, �e nie jeste� tak bezu�yteczny na jakiego wygl�dasz, frajerze. Zejd�cie mi obaj z drogi, bo mam �y�� z�ota do wydobycia.

};

FUNC VOID DIA_NASZ_002_Daryl_BrysonTRIA_iFound()
{
	var C_NPC Daryl; Daryl = Hlp_GetNpc (NASZ_002_Daryl);
	var C_NPC Bryson; Bryson = Hlp_GetNpc (NASZ_004_Bryson);
	TRIA_Invite(Daryl);
	TRIA_Invite(Bryson);
    TRIA_Start();
 
	TRIA_Next(Bryson);
	AI_TurnToNpc(other, self);
	
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_15_00"); //Znalaz�em tak� oto ska��.
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_15_01"); //Mam szczer� nadziej�, �e dzi�ki temu Marcos podniesie nam racje �ywno�ciowe. Powinien by� zadowolony z tego znaleziska.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_55_02"); //Chyba mi podniesie te racje! Oddawaj ten kamie�, bo w przeciwnym wypadku sam go sobie zabior�, a ty dostaniesz jeszcze lanie od stra�nik�w za sprawianie k�opot�w.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_55_03"); //Jak my�lisz, komu uwierz�?
	B_giveinvitems (other, self, ItNa_WyszlifowanaRuda, 1);
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_15_04"); //Ty sukinsynu...

	// --- Bryson_Go_Away ---
	Bryson_Go_Away();

	BrysonWentToDie = TRUE;
	
	TRIA_Finish();
	
	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonTRIA);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "KONIEC", DIA_NASZ_002_Daryl_BrysonTRIA_ende);
	
	// --- ---
};

FUNC VOID DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock()
{
	var C_NPC Daryl; Daryl = Hlp_GetNpc (NASZ_002_Daryl);
	var C_NPC Bryson; Bryson = Hlp_GetNpc (NASZ_004_Bryson);
	TRIA_Invite(Daryl);
	TRIA_Invite(Bryson);
    TRIA_Start();
 
	TRIA_Next(Bryson);
	AI_TurnToNpc(other, self);
	
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_15_00"); //Je�eli tak bardzo chcesz mie� ten kamie� to bierz sw�j kilof i zabieraj si� do roboty.
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_15_01"); //Nie licz, �e ka�dy b�dzie robi� wszystko za ciebie.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_55_02"); //My�lisz, �e jestem na tyle g�upi, aby zmarnowa� sw�j czas na darmo? Poka� mi t� ska�� albo sam j� sobie wezm�, a ty stracisz kilka z�b�w, m�okosie.
	B_giveinvitems (other, self, ItNa_WyszlifowanaRuda, 1);
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_15_03"); //�eby� si� nie zdziwi�...
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_55_04"); //Co tam m�wi�e�?
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_15_05"); //Nic, nic, ju� id�.
	
	// --- Bryson_Go_Away ---	
	Bryson_Go_Away();

	BrysonWentToDie = TRUE;
	
	TRIA_Finish();
	
	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonTRIA);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "KONIEC", DIA_NASZ_002_Daryl_BrysonTRIA_ende);
	
	// --- ---
};

FUNC VOID DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines()
{
	var C_NPC Daryl; Daryl = Hlp_GetNpc (NASZ_002_Daryl);
	var C_NPC Bryson; Bryson = Hlp_GetNpc (NASZ_004_Bryson);
	TRIA_Invite(Daryl);
	TRIA_Invite(Bryson);
    TRIA_Start();
 
	TRIA_Next(Bryson);
	AI_TurnToNpc(other, self);
	
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_15_00"); //Nie tw�j cholerny interes.
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_15_01"); //Wracaj lepiej do roboty albo donios� stra�nikowi, �e si� obijasz.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_55_02"); //Nie tym tonem. Poka� mi ten kamie� albo postaram si� �eby�cie ty i twoi koledzy nie dostawali �arcia przez najbli�szy tydzie�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_55_03"); //Wyrazi�em si� dostatecznie jasno?
	B_giveinvitems (other, self, ItNa_WyszlifowanaRuda, 1);
	// (hero m�wi do siebie)
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_15_04"); //�eby� usma�y� si� w otch�ani Beliara.
	
	// --- Bryson_Go_Away ---
	Bryson_Go_Away();

	BrysonWentToDie = TRUE;
	
	TRIA_Finish();
	
	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonTRIA);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "KONIEC", DIA_NASZ_002_Daryl_BrysonTRIA_ende);
	
	// --- ---
	
	
};

FUNC VOID DIA_NASZ_002_Daryl_BrysonTRIA_ende()
{
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (NASZ_004_Bryson, "RunToOre");
	AI_TurnToNpc(hero, NASZ_002_Daryl);
};


func void Bryson_Die()
{
	Wld_SendTrigger("MOVER_BRYSON_1");
	Wld_SendTrigger("MOVER_BRYSON_2");
	
	B_StartOtherRoutine (NASZ_004_Bryson, "RunToOre");
	Npc_ClearAIQueue(NASZ_004_Bryson);
	AI_Teleport(NASZ_004_Bryson,"NASZ_KOPALNIA_BRYSON_DEAD");
	
	B_LogEntry (TOPIC_Ben_szkodnik, "Nasz� rozmow� przerwa� krzyk dobiegaj�cy z zamkni�tego tunelu. Oby wszystko posz�o zgodnie z planem, bo na miejscu pojawi� si� ju� Marcos. Najlepiej poczekam, a� sobie p�jdzie i dopiero wr�c� do Bena.");
	
	Snd_Play ("SVM_1_BERZERK");
	Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
	
	B_KillNPC(NASZ_004_Bryson);
	
	//AI_Teleport(NASZ_009_Marcos,"OW_PATH_2_04");
	//Npc_ExchangeRoutine (NASZ_009_Marcos, "GoToTria");
};


func void Marcos_GoBack()
{
	Npc_ExchangeRoutine (NASZ_009_Marcos, "Backing");
	Npc_ExchangeRoutine (NASZ_002_Daryl, "Start");
};

//*********************************************************************
//	         BrysonAfterGoAway
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_BrysonAfterGoAway   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 7;
 	condition   = DIA_NASZ_002_Daryl_BrysonAfterGoAway_Condition;
 	information = DIA_NASZ_002_Daryl_BrysonAfterGoAway_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_002_Daryl_BrysonAfterGoAway_Condition()	
{
	if (BrysonWentToDie == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_002_Daryl_BrysonAfterGoAway_Info()
{
	AI_Teleport(NASZ_009_Marcos,"OW_PATH_2_04");
	Npc_ExchangeRoutine (NASZ_009_Marcos, "GoToTria");

	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_15_00"); //Jestem zaskoczony bo nie przypuszcza�em, �e p�jdzie tak szybko. Ca�e szcz�cie, �e si� na nas nie rzuci�. Dobrze sobie poradzi�e�.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_55_01"); //By�o blisko. Miejmy nadziej�, �e twoje domys�y oka�� si� prawdziwe i ta ska�a zwali mu si� na g�ow�, bo mam ju� go serdecznie do��.

	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonAfterGoAway);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonAfterGoAway, "Oby...", DIA_NASZ_002_Daryl_BrysonAfterGoAway_Continue);
			
};


FUNC VOID DIA_NASZ_002_Daryl_BrysonAfterGoAway_Continue()
{
	Bryson_Die();
	
	var C_NPC Daryl; Daryl = Hlp_GetNpc (NASZ_002_Daryl);
	var C_NPC Marcos; Marcos = Hlp_GetNpc (NASZ_009_Marcos);
	TRIA_Invite(Daryl);
	TRIA_Invite(Marcos);
    TRIA_Start();
	
	TRIA_Cam("TRIA_CAM_KOPALNIA");
	
	TRIA_Next(Marcos);
	AI_RunToNPC(self,hero);
	
	TRIA_Next(Daryl);

	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Continue_15_00"); //Oby...
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Continue_55_01"); //S�ysza�e�?
	
	TRIA_Next (Marcos);
    AI_TurnToNpc(other, self);
	
	AI_ReadyMeleeWeapon (self);
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Continue_55_02"); //Co tu si� do cholery wyprawia? Wy dwaj, czemu nie pracujecie?
	
	TRIA_Finish();
	
	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonAfterGoAway);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonAfterGoAway, "To przez Brysona!", DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonAfterGoAway, "Zrobili�my sobie chwilow� przerw�.", DIA_NASZ_002_Daryl_BrysonAfterGoAway_break);
	
};


FUNC VOID DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson()
{
	var C_NPC Daryl; Daryl = Hlp_GetNpc (NASZ_002_Daryl);
	var C_NPC Marcos; Marcos = Hlp_GetNpc (NASZ_009_Marcos);
	TRIA_Invite(Daryl);
	TRIA_Invite(Marcos);
    TRIA_Start();
	
	TRIA_Next(Daryl);

	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson_15_00"); //To przez Brysona!
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson_15_01"); //Wpad� w jak�� furi�, zacz�� nam grozi� i uda� si� do zamkni�tego tunelu.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson_55_02"); //Wspomina� co� o tym, �e wydoby� tam wyj�tkow� bry�k� rudy, dzi�ki kt�rej zaskarbi sobie przychylno�� wielmo�nego lorda.
	
	TRIA_Next (Marcos);
    AI_TurnToNpc(other, self);
	
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson_55_03"); //Nie mam s��w na tego cz�owieka...
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson_55_04"); //Wracajcie do roboty.

	TRIA_Finish();

	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonAfterGoAway);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonAfterGoAway, "KONIEC", DIA_NASZ_002_Daryl_BrysonAfterGoAway_ende);
};

FUNC VOID DIA_NASZ_002_Daryl_BrysonAfterGoAway_break()
{
	var C_NPC Daryl; Daryl = Hlp_GetNpc (NASZ_002_Daryl);
	var C_NPC Marcos; Marcos = Hlp_GetNpc (NASZ_009_Marcos);
	TRIA_Invite(Daryl);
	TRIA_Invite(Marcos);
    TRIA_Start();
	
	TRIA_Next(Daryl);

	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_15_00"); //Zrobili�my sobie chwilow� przerw�.
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_15_01"); //Mieli�my ju� wraca� do pracy, kiedy nasz� uwag� przyku� Bryson.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_55_02"); //Nie wiemy czemu, ale wbieg� do zamkni�tego tunelu, tak jakby czego� w nim szuka�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_55_03"); //Nast�pnie dobieg� nas stamt�d jego krzyk, panie.
	
	TRIA_Next(Marcos);
	
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_55_04"); //Cholerny idiota. Wy dwaj wracajcie do roboty, ju�!
	
	TRIA_Finish();
	
	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonAfterGoAway);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonAfterGoAway, "KONIEC", DIA_NASZ_002_Daryl_BrysonAfterGoAway_ende);

};

FUNC VOID DIA_NASZ_002_Daryl_BrysonAfterGoAway_ende()
{
	Marcos_GoBack();
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Metody1
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_Metody1   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 8;
 	condition   = DIA_NASZ_002_Daryl_Metody1_Condition;
 	information = DIA_NASZ_002_Daryl_Metody1_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_002_Daryl_Metody1_Condition()
{
	if(npc_knowsinfo (other, DIA_NASZ_020_Sattar_Metody2))
	&& (Npc_GetDistToWP	(self, "NASZ_KOPALNIA_NOWY_12") <=750)
	&& (npc_hasitems (other, ItNa_Krysztal) >=2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_002_Daryl_Metody1_Info()
{
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Metody1_15_00"); //Jeszcze nigdy nie widzia�em takiego grymasu zamy�lenia na twarzy Sattara. Mam nadziej�, �e jego wysi�ek nie p�jdzie na marne i uda mu si� stworzy� ten zw�j.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Metody1_55_01"); //R�wnie� mam tak� nadziej�. Martwi� si� jedynie tym, aby stra�nicy nie zacz�li czego� podejrzewa�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Metody1_55_02"); //Dlatego nie powinni�my da� po sobie pozna�, �e co� knujemy. Ja p�jd� do Bena pozmawia� z nim o dalszym planie.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Metody1_55_03"); //Ty za� powiniene� si� nieco przespa�, bo wygl�dasz jak zombie.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Metody1_55_04"); //Zanim jednak udasz si� na spoczynek oddaj kamienie Sattarowi. Zapewne nie mo�e si� ju� doczeka�. Niech Innos nam sprzyja.
	
	Npc_ExchangeRoutine (self, "GoToBen");

};

//*********************************************************************
//	Info Taktyki1
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_Taktyki1   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 9;
 	condition   = DIA_NASZ_002_Daryl_Taktyki1_Condition;
 	information = DIA_NASZ_002_Daryl_Taktyki1_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_002_Daryl_Taktyki1_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_WhatAreUTalkingAbout))
	&& (Ben_MIS_Choice_Taktyki == TRUE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_002_Daryl_Taktyki1_Info()
{
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_15_00"); //Daryl, przysz�a pora aby oderwa� si� w ko�cu od kopania tej rudy. Nadszed� czas aby� zrobi� nam mikstur�. 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_01"); //D�ugo oczekiwa�em na t� chwil� i cierpliwo�� si� op�aci�a. Najlepiej od razu zabior� si� do pracy �eby�my nie tracili czasu.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_15_02"); //Jak chcesz uwarzy� tutaj trucizn� i z czego? Wiesz, �e nie mo�emy zabi� stra�nika, ani mu bardzo zaszkodzi�?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_03"); //Ta mieszanka nie b�dzie przeznaczona dla naszego stra�nika. Pozw�l, �e wprowadz� ci� w szczeg�y.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_04"); //D�ugo my�la�em nad receptur� trucizny, kt�ra pozwoli nam osi�gn�� obrany cel.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_05"); //Postanowi�em wykorzysta� kopalniane grzyby rosn�ce w tunelach pozbawionych du�ych ilo�ci �wiat�a. Mo�e wygl�daj� niepozornie jednak nie daj si� zwie��!
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_06"); //W ich kapeluszach znajduje si� silna toksyna, kt�ra po odpowiednim przetworzeniu potrafi pozbawi� kogo� przytomno�ci na kilka godzin.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_07"); //Cz�sto ro�liny te wykorzystywali op�acani �owcy g��w chc�cy upozorowa� swoja �mier�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_08"); //Przez kilka godzin po za�yciu wygl�dasz jak prawdziwy nieboszczyk, kt�ry nie ma nawet pulsu. Kiedy ju� j� przygotuj� b�dziesz musia� j� wypi�.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_15_09"); //Zwariowali�cie?! Nie wypij� czego� co mo�e mnie zabi�! Zapomnijcie o tym pomy�le!
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_10"); //Nie zrobi�bym czego�, co mo�e ci zaszkodzi�. Doskonale znam dzia�anie i sposoby tworzenia takich eliksir�w.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_11"); //To najpewniejsza droga do wolno�ci, wierz mi. Po wypiciu tej mikstury b�dziesz wygl�da� jak trup.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_12"); //Stra�nicy na pewno wyci�gn� ci� z kopalni i zostawi� twoje 'zw�oki' przy reszcie grob�w, gdzie b�d� ci� chcieli jutro pochowa�. 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_13"); //Ty jednak obudzisz si� w �rodku nocy i zwyczajnie uciekniesz. A kiedy si� obudz�, ciebie ju� tutaj nie b�dzie. Czy� to nie proste? 
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_15_14"); //A co je�eli si� nie obudz�? 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_15"); //Nie ma takiej mo�liwo�ci. Toksyny zawarte w grzybach s� zbyt s�abe aby kogo� zabi� lub trzyma� w stanie �mierci d�u�ej ni� przez pi�� godzin. Wszystko zale�y te� od mieszanki. 
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_55_16"); //Nie podoba mi si� ten plan, jednak jak rozumiem nie mamy wyj�cia. Mog� ci w czy� pom�c? 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_17"); //Owszem. Ja p�jd� przyszykowa� flakonik, jaki uda�o mi si� wykra�� z obozu paladyn�w,	ty za� przynie� mi cztery grzyby. Tylko ich nie jedz! 
	
	Wld_InsertItem (ItNa_KopalnianyGrzyb, "FP_ITEM_KOPALNIANY_GRZYB_1");
	Wld_InsertItem (ItNa_KopalnianyGrzyb, "FP_ITEM_KOPALNIANY_GRZYB_2");
	Wld_InsertItem (ItNa_KopalnianyGrzyb, "FP_ITEM_KOPALNIANY_GRZYB_3");
	
	B_LogEntry (TOPIC_Ben_Taktyki, "Ten plan to czyste szale�stwo! Nie s�dzi�em, �e aby uciec z kopalni b�d� zmuszony upozorowa� w�asn� �mier� poprzez wypicie jakiej� trucizny. Mam tylko nadziej�, �e nie wp�dzi mnie to do grobu, bo nie jest mi jeszcze �pieszno na drugi �wiat. Musz� zebra� 4 grzyby kopalniane i przynie�� je Darylowi.");

};

//*********************************************************************
//	Info Taktyki2
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_Taktyki2   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 10;
 	condition   = DIA_NASZ_002_Daryl_Taktyki2_Condition;
 	information = DIA_NASZ_002_Daryl_Taktyki2_Info;
 	permanent   = FALSE;
 	description = "Mam grzyby, co dalej?";
};

FUNC INT DIA_NASZ_002_Daryl_Taktyki2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_002_Daryl_Taktyki1))
	&& (npc_hasitems (other, ItNa_KopalnianyGrzyb) >=4)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_002_Daryl_Taktyki2_Info()
{
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki2_15_00"); //Mam grzyby, co dalej?
	B_giveinvitems (other, self, ItNa_KopalnianyGrzyb, 4);
	Npc_RemoveInvItems (self, ItNa_KopalnianyGrzyb, 4); 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki2_55_01"); //�wietnie! Prze�pij si�, a ja w tym czasie zaczn� swoj� prac�.
	
	if ((Wld_IsTime(23,30,00,00)) || (Wld_IsTime(00,00,01,00))) {
		AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki2_55_02"); //Wr�� za godzin�.
		B_LogEntry (TOPIC_Ben_Taktyki, "Daryl rozpocz�� przygotowania mieszanki. Mam si� przespa� i wr�ci� do niego za godzin�.");
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki2_55_03"); //Wr�� o p�nocy.
		B_LogEntry (TOPIC_Ben_Taktyki, "Daryl rozpocz�� przygotowania mieszanki. Mam si� przespa� i wr�ci� do niego o p�nocy.");
	};
	
	KopalniaWillMaSiePrzespac = TRUE;
};

//*********************************************************************
//	Info Taktyki3
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_Taktyki3   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 10;
 	condition   = DIA_NASZ_002_Daryl_Taktyki3_Condition;
 	information = DIA_NASZ_002_Daryl_Taktyki3_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_002_Daryl_Taktyki3_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_002_Daryl_Taktyki2))
	&& ((Wld_IsTime(23,00,00,00)) || (Wld_IsTime(00,00,02,30)))
	&& (KopalniaWillSiePrzespal == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_002_Daryl_Taktyki3_Info()
{
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki3_15_00"); //Dobrze, �e jeste�.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki3_55_01"); //Eliksir jest ju� gotowy, powinni�my wr�ci� do Bena. 
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self, "GoToBen");

};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_002_Daryl_HowAreYou   (C_INFO)
{
	npc         = NASZ_002_Daryl;
 	nr          = 500;
 	condition   = DIA_NASZ_002_Daryl_HowAreYou_Condition;
 	information = DIA_NASZ_002_Daryl_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak si� czujesz?";
};

FUNC INT DIA_NASZ_002_Daryl_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_002_Daryl_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_002_Daryl_HowAreYou_15_00"); //Jak si� czujesz?

	if !(npc_knowsinfo (other, DIA_NASZ_005_Ben_Finish))	
	{
		if !(npc_knowsinfo (other, DIA_NASZ_002_Daryl_done))	
		{
			AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_01"); //Jest gorzej ni� w wi�zieniu.
			AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_02"); //Umieram z g�odu!
		}
		else
		{
			AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_03"); //W �yciu nie przypuszcza�em, �e mi�so chrz�szczy jest takie pyszne!
			AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_04"); //Gdyby nie ty, pewnie gryz�bym ju� ziemi�.
		};	
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_05"); //Doskonale!
		AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_06"); //Teraz b�d� jada� po dwa obiady dziennie.
	};

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_002_Daryl_PICKPOCKET (C_INFO)
{
	npc			= NASZ_002_Daryl;
	nr			= 900;
	condition	= DIA_NASZ_002_Daryl_PICKPOCKET_Condition;
	information	= DIA_NASZ_002_Daryl_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_002_Daryl_PICKPOCKET_Condition()
{
	C_Beklauen (41);
};
 
FUNC VOID DIA_NASZ_002_Daryl_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_002_Daryl_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_002_Daryl_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_002_Daryl_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_002_Daryl_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_002_Daryl_PICKPOCKET_DoIt);
};

func void DIA_NASZ_002_Daryl_PICKPOCKET_DoIt()
{
	B_BeklauenGold (12);
	Info_ClearChoices (DIA_NASZ_002_Daryl_PICKPOCKET);
};
	
func void DIA_NASZ_002_Daryl_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_002_Daryl_PICKPOCKET);
};



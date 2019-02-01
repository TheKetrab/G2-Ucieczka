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
		AI_Output (self, other,"DIA_NASZ_002_Daryl_exit_55_01"); //Nie mogê ci nic daæ... Ale weŸ mój kij.
		AI_Output (self, other,"DIA_NASZ_002_Daryl_exit_55_02"); //Przyda ci siê, gdy bêdziesz chcia³ siê obroniæ przed którymœ z tych bandziorów.
		
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
	AI_Output (self, other,"DIA_NASZ_002_Daryl_hi_15_00"); //Hej, ty! Próbujesz uciec?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_hi_55_01"); //A mam na to jakieœ szanse?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_hi_15_02"); //Zapomnij. Jeden ju¿ próbowa³. Grimes, pamiêtasz?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_hi_55_03"); //I co z nim?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_hi_55_04"); //Nie ma go. Widzia³em tylko z koñca jaskini, jak skrêci³ zaraz za stra¿nikiem w prawo.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_hi_55_05"); //To by³ pierwszy i zarazem ostatni, który ucieka³.

	B_LogEntry (TOPIC_Kopalnia, "Grimes uciek³ z kopalni. Nie wiadomo, czy ¿yje. Daryl widzia³ go, jak skrêca³ zaraz za stra¿nikiem w prawo.");		

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
	AI_Output (self, other,"DIA_NASZ_002_Daryl_help_55_01"); //Jestem g³odny. Nie mam ju¿ si³y.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_help_55_02"); //Zabi³bym za kawa³ek miêsa.

	MIS_DARYL_READY = TRUE;

	Mis_Daryl_mieso = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Daryl_mieso, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Daryl_mieso, LOG_RUNNING);
	B_LogEntry (TOPIC_Daryl_mieso, "Daryl jest g³odny. Tylko... Co on mo¿e zjeœæ? Porcje ¿ywnoœciowe s¹ tutaj tak ma³e, ¿e ja sam umieram z g³odu.");

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
 	description = "Mam dla ciebie miêso chrz¹szcza.";
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

	AI_Output (other,self ,"DIA_NASZ_002_Daryl_done_15_00"); //Mam dla ciebie miêso chrz¹szcza.

	B_giveinvitems (other, self, ItAt_Meatbugflesh, 1);

	AI_Output (self, other,"DIA_NASZ_002_Daryl_done_55_01"); //Wielkie nieba! Dziêkujê.

	AI_Output (self, other,"DIA_NASZ_002_Daryl_done_55_04"); //Wracam do pracy, bo nie chcê oberwaæ.

	DARYL_JE = TRUE;
	B_GivePlayerXP (100);
	Mis_Daryl_mieso = LOG_SUCCESS;
	Log_SetTopicStatus (TOPIC_Daryl_mieso, LOG_SUCCESS);
	B_LogEntry (TOPIC_Daryl_mieso, "Daryl zjad³ miêso z chrz¹szczy. Ciekawe, na ile mu to wystarczy?");

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
	AI_Output (self, other,"DIA_NASZ_002_Daryl_MamGrzyba_55_01"); //Co? ¯artujesz chyba sobie! Nie wiesz, ¿e s¹ truj¹ce?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_MamGrzyba_55_02"); //Cz³owieku, przynieœ mi kawa³ek sera, okruchê chleba albo jakieœ tandetne miêso, które da siê pogryŸæ.
	
	B_LogEntry (TOPIC_Daryl_mieso, "Mój pomys³ z kopalnianym grzybem nie spodoba³ siê zbytnio Darylowi. Muszê wykombinowaæ coœ innego.");
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
 	description = "'Sikorka œpiewa o poranku, a skowronek s³ucha jej melodii.'";
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
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BenPassword_15_00"); //'Sikorka œpiewa o poranku, a skowronek s³ucha jej melodii.'
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_01"); //Przysy³a ciê Ben? O co chodzi?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BenPassword_55_02"); //Chcemy uciszyæ szkodnika raz na zawsze, a ty masz ponoæ pomys³, jak to zrobiæ.
	
	if(Mis_Daryl_mieso != LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_03"); //Mój m³ody przyjacielu... Jestem tak g³odny, ¿e nie potrafiê trzeŸwo myœleæ.
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_04"); //Przynieœ mi coœ do jedzenia, dopiero wtedy pogadamy.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_05"); //Nareszcie nasta³a chwila, kiedy pozbêdziemy siê tego sukinsyna.
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_06"); //Ostatnio z jego powodu zosta³em pobity przez stra¿ników, gdy¿ ten powiedzia³ im, ¿e z powodu choroby, nie pracujê tak efektownie jak reszta.
		AI_Output (self, other,"DIA_NASZ_002_Daryl_BenPassword_55_07"); //Przez tydzieñ nie czu³em w³asnej g³owy i brzucha. Wracaj¹c jednak do mojego planu, to wiem ju¿, jak mo¿emy zamkn¹æ mu buŸkê.
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
 	description = "Zamieniam siê w s³uch.";
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

	AI_Output (other, self,"DIA_NASZ_002_Daryl_ZamieniamSie_55_00"); //Zamieniam siê w s³uch.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_01"); //Jak dobrze wiesz, on jako jedyny z nas wszystkich sympatyzuje siê ze stra¿nikami i robi wszystko, aby siê im przypodobaæ.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_02"); //Nie wiem, co chce tym osi¹gn¹æ, jednak za chwilê nie bêdziemy musieli siê tym przejmowaæ.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_03"); //Kojarzysz ten zamkniêty tunel obok Bena, w którym wstrzymano wydobycie, bo skoñczy³a siê tam ju¿ ruda?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_04"); //Ostatnio odkry³em, ¿e zosta³a tam jedna bry³a, i nie by³oby w niej nic specjalnego, gdyby nie fakt, ¿e jest strasznie nadkruszona.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_05"); //Wystarczy jeden zamach kilofem ¿eby ca³y strop spad³ na ciebie. Ju¿ wiesz, jak zamierzam wykorzystaæ ten fakt?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_ZamieniamSie_55_06"); //Chyba tak, ale w mojej g³owie rodzi siê pewna w¹tpliwoœæ: Jak chcesz go przekonaæ do wydobycia rudy w tym tunelu?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_ZamieniamSie_55_07"); //Przecie¿ on nie jest tak g³upi, aby œlepo zawierzy³ w to, co mówimy.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_08"); //Tym te¿ siê ju¿ zaj¹³em. Upozorujemy sytuacjê, w której chwalisz mi siê, ¿e wydoby³eœ tam du¿y kawa³ o wiele czystszej rudy ni¿ ta tutaj.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_09"); //Jestem pewien, ¿e po³knie haczyk i sam pójdzie siê temu przyjrzeæ, a wtedy bêdziemy mieli spokój.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_10"); //Jednak bêdziesz potrzebowa³ dowodu na swoje s³owa. Trochê siê przy tym namêczy³em, ale w koñcu uda³o mi siê wy³upaæ du¿¹ bry³kê rudy, która znacz¹co ró¿ni siê od innych.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_ZamieniamSie_55_11"); //Udaj siê do Sattara, powinien ju¿ skoñczyæ pracê nad tym, aby wygl¹da³a na bardziej szlachetn¹ ni¿ reszta.
		
	B_LogEntry (TOPIC_Ben_szkodnik, "Je¿eli Daryl mia³ racjê, to nied³ugo czeka nas naprawdê du¿e zamieszanie. Mam tylko nadziejê, ¿e Bryson po³knie haczyk i nie wyczuje naszego podstêpu. W przeciwnym wypadku wszyscy zawiœniemy na sznurze.");

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
 	description = "Gotowe, mam ska³ê.";
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
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_SattarNugget_15_00"); //Gotowe, mam ska³ê.
	// (uwa¿nie przygl¹da siê bry³ce rudy)
	AI_Output (self, other,"DIA_NASZ_002_Daryl_SattarNugget_55_01"); //Daj no spojrzeæ na to maleñstwo. Cholera, Sattar jest prawdziwym arcymistrzem! Ta ska³a wygl¹da tak prawdziwie, ¿e sam przez chwilê siê nabra³em.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_SattarNugget_55_02"); //Teraz s³uchaj uwa¿nie: Pójdziemy do tunelu Brysona i zaczniemy tam ze sob¹ rozmawiaæ.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_SattarNugget_55_03"); //W pewnym momencie wtr¹cisz, ¿e wydoby³eœ w zamkniêtym tunelu wyj¹tkow¹ bry³kê rudy i masz zamiar pokazaæ j¹ stra¿nikom.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_SattarNugget_55_04"); //To powinno zwróciæ jego uwagê. A wiêc do dzie³a!
	
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

	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_15_00"); //Ty te¿ zrobi³eœ sobie chwilow¹ przerwê?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_01"); //Tak, od tego ³upania w ska³y nie czujê ju¿ r¹k. Nie wspominaj¹c o towarzysz¹cym od rana g³odzie, który nie chce daæ za wygran¹.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_55_02"); //Wiêc czujesz to samo co ja... Nied³ugo mój kilof rozpadnie siê w drzazgi od tego kopania, ju¿ ostrze ledwie trzyma siê na trzonku.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_55_03"); //Tylko czekaæ, a¿ wypadnie i zrobi komuœ krzywdê. Wygl¹dasz jednak na strasznie zadowolonego, dlaczego?
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_04"); //Od d³u¿szego czasu intuicja podpowiada³a mi, abym sprawdzi³ boczny tunel w sektorze Bena, w którym zakoñczyliœmy wydobycie.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_05"); //Nie uwierzysz, co tam znalaz³em!

	TRIA_Cam("TRIA_CAM_KOPALNIA");
	Npc_ExchangeRoutine (NASZ_004_Bryson, "GoToTria");
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_06"); //Po ostatnim osuwisku pojawi³o siê tam z³o¿e wyj¹tkowo czystej magicznej rudy.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonTRIA_55_07"); //Spójrz na t¹ bry³kê. Jak myœlisz, czy stra¿nicy zgodz¹ siê nam podnieœæ racje ¿ywnoœciowe jeœli im to poka¿ê?
	
	TRIA_Next(Bryson);
	AI_TurnToNpc(other, self);
	AI_RunToNPC(self, hero);
	
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_55_08"); //Zaryzykowa³eœ kar¹, aby sprawdziæ swoj¹ intuicjê? Godne podziwu, co tam znalaz³eœ?
	
	TRIA_Finish();
	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonTRIA);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "Znalaz³em tak¹ oto ska³ê.", DIA_NASZ_002_Daryl_BrysonTRIA_iFound);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "Je¿eli tak bardzo chcesz mieæ ten kamieñ to bierz swój kilof i zabieraj siê do roboty.", DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonTRIA, "Nie twój cholerny interes.", DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines);
			
};

func void Bryson_Go_Away() {

	AI_Output (self, other,"DIA_Bryson_Go_Away_55_00"); //Na Innosa! Za tê ska³ê dostanê tyle ¿arcia, ¿e ju¿ nigdy nie bêdê g³odowa³!
	AI_Output (self, other,"DIA_Bryson_Go_Away_55_01"); //Od zawsze wiedzia³em, ¿e nie jesteœ tak bezu¿yteczny na jakiego wygl¹dasz, frajerze. ZejdŸcie mi obaj z drogi, bo mam ¿y³ê z³ota do wydobycia.

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
	
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_15_00"); //Znalaz³em tak¹ oto ska³ê.
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_15_01"); //Mam szczer¹ nadziejê, ¿e dziêki temu Marcos podniesie nam racje ¿ywnoœciowe. Powinien byæ zadowolony z tego znaleziska.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_55_02"); //Chyba mi podniesie te racje! Oddawaj ten kamieñ, bo w przeciwnym wypadku sam go sobie zabiorê, a ty dostaniesz jeszcze lanie od stra¿ników za sprawianie k³opotów.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_iFound_55_03"); //Jak myœlisz, komu uwierz¹?
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
	
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_15_00"); //Je¿eli tak bardzo chcesz mieæ ten kamieñ to bierz swój kilof i zabieraj siê do roboty.
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_15_01"); //Nie licz, ¿e ka¿dy bêdzie robi³ wszystko za ciebie.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_55_02"); //Myœlisz, ¿e jestem na tyle g³upi, aby zmarnowaæ swój czas na darmo? Poka¿ mi tê ska³ê albo sam j¹ sobie wezmê, a ty stracisz kilka zêbów, m³okosie.
	B_giveinvitems (other, self, ItNa_WyszlifowanaRuda, 1);
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_15_03"); //¯ebyœ siê nie zdziwi³...
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_55_04"); //Co tam mówi³eœ?
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_ifYouWantARock_15_05"); //Nic, nic, ju¿ idê.
	
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
	
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_15_00"); //Nie twój cholerny interes.
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_15_01"); //Wracaj lepiej do roboty albo doniosê stra¿nikowi, ¿e siê obijasz.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_55_02"); //Nie tym tonem. Poka¿ mi ten kamieñ albo postaram siê ¿ebyœcie ty i twoi koledzy nie dostawali ¿arcia przez najbli¿szy tydzieñ.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_55_03"); //Wyrazi³em siê dostatecznie jasno?
	B_giveinvitems (other, self, ItNa_WyszlifowanaRuda, 1);
	// (hero mówi do siebie)
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonTRIA_notYourBusines_15_04"); //¯ebyœ usma¿y³ siê w otch³ani Beliara.
	
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
	
	B_LogEntry (TOPIC_Ben_szkodnik, "Nasz¹ rozmowê przerwa³ krzyk dobiegaj¹cy z zamkniêtego tunelu. Oby wszystko posz³o zgodnie z planem, bo na miejscu pojawi³ siê ju¿ Marcos. Najlepiej poczekam, a¿ sobie pójdzie i dopiero wrócê do Bena.");
	
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

	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_15_00"); //Jestem zaskoczony bo nie przypuszcza³em, ¿e pójdzie tak szybko. Ca³e szczêœcie, ¿e siê na nas nie rzuci³. Dobrze sobie poradzi³eœ.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_55_01"); //By³o blisko. Miejmy nadziejê, ¿e twoje domys³y oka¿¹ siê prawdziwe i ta ska³a zwali mu siê na g³owê, bo mam ju¿ go serdecznie doœæ.

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
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Continue_55_01"); //S³ysza³eœ?
	
	TRIA_Next (Marcos);
    AI_TurnToNpc(other, self);
	
	AI_ReadyMeleeWeapon (self);
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Continue_55_02"); //Co tu siê do cholery wyprawia? Wy dwaj, czemu nie pracujecie?
	
	TRIA_Finish();
	
	Info_ClearChoices (DIA_NASZ_002_Daryl_BrysonAfterGoAway);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonAfterGoAway, "To przez Brysona!", DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson);
		Info_AddChoice	  (DIA_NASZ_002_Daryl_BrysonAfterGoAway, "Zrobiliœmy sobie chwilow¹ przerwê.", DIA_NASZ_002_Daryl_BrysonAfterGoAway_break);
	
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
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson_15_01"); //Wpad³ w jak¹œ furiê, zacz¹³ nam groziæ i uda³ siê do zamkniêtego tunelu.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson_55_02"); //Wspomina³ coœ o tym, ¿e wydoby³ tam wyj¹tkow¹ bry³kê rudy, dziêki której zaskarbi sobie przychylnoœæ wielmo¿nego lorda.
	
	TRIA_Next (Marcos);
    AI_TurnToNpc(other, self);
	
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_Bryson_55_03"); //Nie mam s³ów na tego cz³owieka...
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

	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_15_00"); //Zrobiliœmy sobie chwilow¹ przerwê.
	AI_Output (other,self ,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_15_01"); //Mieliœmy ju¿ wracaæ do pracy, kiedy nasz¹ uwagê przyku³ Bryson.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_55_02"); //Nie wiemy czemu, ale wbieg³ do zamkniêtego tunelu, tak jakby czegoœ w nim szuka³.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_55_03"); //Nastêpnie dobieg³ nas stamt¹d jego krzyk, panie.
	
	TRIA_Next(Marcos);
	
	AI_Output (self, other,"DIA_NASZ_002_Daryl_BrysonAfterGoAway_break_55_04"); //Cholerny idiota. Wy dwaj wracajcie do roboty, ju¿!
	
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
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Metody1_15_00"); //Jeszcze nigdy nie widzia³em takiego grymasu zamyœlenia na twarzy Sattara. Mam nadziejê, ¿e jego wysi³ek nie pójdzie na marne i uda mu siê stworzyæ ten zwój.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Metody1_55_01"); //Równie¿ mam tak¹ nadziejê. Martwiê siê jedynie tym, aby stra¿nicy nie zaczêli czegoœ podejrzewaæ.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Metody1_55_02"); //Dlatego nie powinniœmy daæ po sobie poznaæ, ¿e coœ knujemy. Ja pójdê do Bena pozmawiaæ z nim o dalszym planie.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Metody1_55_03"); //Ty zaœ powinieneœ siê nieco przespaæ, bo wygl¹dasz jak zombie.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Metody1_55_04"); //Zanim jednak udasz siê na spoczynek oddaj kamienie Sattarowi. Zapewne nie mo¿e siê ju¿ doczekaæ. Niech Innos nam sprzyja.
	
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
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_15_00"); //Daryl, przysz³a pora aby oderwaæ siê w koñcu od kopania tej rudy. Nadszed³ czas abyœ zrobi³ nam miksturê. 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_01"); //D³ugo oczekiwa³em na tê chwilê i cierpliwoœæ siê op³aci³a. Najlepiej od razu zabiorê siê do pracy ¿ebyœmy nie tracili czasu.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_15_02"); //Jak chcesz uwarzyæ tutaj truciznê i z czego? Wiesz, ¿e nie mo¿emy zabiæ stra¿nika, ani mu bardzo zaszkodziæ?
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_03"); //Ta mieszanka nie bêdzie przeznaczona dla naszego stra¿nika. Pozwól, ¿e wprowadzê ciê w szczegó³y.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_04"); //D³ugo myœla³em nad receptur¹ trucizny, która pozwoli nam osi¹gn¹æ obrany cel.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_05"); //Postanowi³em wykorzystaæ kopalniane grzyby rosn¹ce w tunelach pozbawionych du¿ych iloœci œwiat³a. Mo¿e wygl¹daj¹ niepozornie jednak nie daj siê zwieœæ!
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_06"); //W ich kapeluszach znajduje siê silna toksyna, która po odpowiednim przetworzeniu potrafi pozbawiæ kogoœ przytomnoœci na kilka godzin.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_07"); //Czêsto roœliny te wykorzystywali op³acani ³owcy g³ów chc¹cy upozorowaæ swoja œmieræ.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_08"); //Przez kilka godzin po za¿yciu wygl¹dasz jak prawdziwy nieboszczyk, który nie ma nawet pulsu. Kiedy ju¿ j¹ przygotujê bêdziesz musia³ j¹ wypiæ.
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_15_09"); //Zwariowaliœcie?! Nie wypijê czegoœ co mo¿e mnie zabiæ! Zapomnijcie o tym pomyœle!
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_10"); //Nie zrobi³bym czegoœ, co mo¿e ci zaszkodziæ. Doskonale znam dzia³anie i sposoby tworzenia takich eliksirów.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_11"); //To najpewniejsza droga do wolnoœci, wierz mi. Po wypiciu tej mikstury bêdziesz wygl¹da³ jak trup.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_12"); //Stra¿nicy na pewno wyci¹gn¹ ciê z kopalni i zostawi¹ twoje 'zw³oki' przy reszcie grobów, gdzie bêd¹ ciê chcieli jutro pochowaæ. 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_13"); //Ty jednak obudzisz siê w œrodku nocy i zwyczajnie uciekniesz. A kiedy siê obudz¹, ciebie ju¿ tutaj nie bêdzie. Czy¿ to nie proste? 
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_15_14"); //A co je¿eli siê nie obudzê? 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_15"); //Nie ma takiej mo¿liwoœci. Toksyny zawarte w grzybach s¹ zbyt s³abe aby kogoœ zabiæ lub trzymaæ w stanie œmierci d³u¿ej ni¿ przez piêæ godzin. Wszystko zale¿y te¿ od mieszanki. 
	AI_Output (other, self,"DIA_NASZ_002_Daryl_Taktyki1_55_16"); //Nie podoba mi siê ten plan, jednak jak rozumiem nie mamy wyjœcia. Mogê ci w czyœ pomóc? 
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki1_55_17"); //Owszem. Ja pójdê przyszykowaæ flakonik, jaki uda³o mi siê wykraœæ z obozu paladynów,	ty zaœ przynieœ mi cztery grzyby. Tylko ich nie jedz! 
	
	Wld_InsertItem (ItNa_KopalnianyGrzyb, "FP_ITEM_KOPALNIANY_GRZYB_1");
	Wld_InsertItem (ItNa_KopalnianyGrzyb, "FP_ITEM_KOPALNIANY_GRZYB_2");
	Wld_InsertItem (ItNa_KopalnianyGrzyb, "FP_ITEM_KOPALNIANY_GRZYB_3");
	
	B_LogEntry (TOPIC_Ben_Taktyki, "Ten plan to czyste szaleñstwo! Nie s¹dzi³em, ¿e aby uciec z kopalni bêdê zmuszony upozorowaæ w³asn¹ œmieræ poprzez wypicie jakiejœ trucizny. Mam tylko nadziejê, ¿e nie wpêdzi mnie to do grobu, bo nie jest mi jeszcze œpieszno na drugi œwiat. Muszê zebraæ 4 grzyby kopalniane i przynieœæ je Darylowi.");

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
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki2_55_01"); //Œwietnie! Przeœpij siê, a ja w tym czasie zacznê swoj¹ pracê.
	
	if ((Wld_IsTime(23,30,00,00)) || (Wld_IsTime(00,00,01,00))) {
		AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki2_55_02"); //Wróæ za godzinê.
		B_LogEntry (TOPIC_Ben_Taktyki, "Daryl rozpocz¹³ przygotowania mieszanki. Mam siê przespaæ i wróciæ do niego za godzinê.");
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki2_55_03"); //Wróæ o pó³nocy.
		B_LogEntry (TOPIC_Ben_Taktyki, "Daryl rozpocz¹³ przygotowania mieszanki. Mam siê przespaæ i wróciæ do niego o pó³nocy.");
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
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki3_15_00"); //Dobrze, ¿e jesteœ.
	AI_Output (self, other,"DIA_NASZ_002_Daryl_Taktyki3_55_01"); //Eliksir jest ju¿ gotowy, powinniœmy wróciæ do Bena. 
	
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
 	description = "Jak siê czujesz?";
};

FUNC INT DIA_NASZ_002_Daryl_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_002_Daryl_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_002_Daryl_HowAreYou_15_00"); //Jak siê czujesz?

	if !(npc_knowsinfo (other, DIA_NASZ_005_Ben_Finish))	
	{
		if !(npc_knowsinfo (other, DIA_NASZ_002_Daryl_done))	
		{
			AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_01"); //Jest gorzej ni¿ w wiêzieniu.
			AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_02"); //Umieram z g³odu!
		}
		else
		{
			AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_03"); //W ¿yciu nie przypuszcza³em, ¿e miêso chrz¹szczy jest takie pyszne!
			AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_04"); //Gdyby nie ty, pewnie gryz³bym ju¿ ziemiê.
		};	
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_05"); //Doskonale!
		AI_Output (self, other,"DIA_NASZ_002_Daryl_HowAreYou_55_06"); //Teraz bêdê jada³ po dwa obiady dziennie.
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



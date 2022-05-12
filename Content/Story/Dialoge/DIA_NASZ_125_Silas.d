//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_EXIT   (C_INFO)
{
	npc         = NASZ_125_Silas;
	nr          = 999;
	condition   = DIA_NASZ_125_Silas_EXIT_Condition;
	information = DIA_NASZ_125_Silas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_125_Silas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_125_Silas_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_siema   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 1;
 	condition   = DIA_NASZ_125_Silas_siema_Condition;
 	information = DIA_NASZ_125_Silas_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_125_Silas_siema_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_125_Silas_siema_15_00"); //Kogo my tu mamy? Kolejny nowy. W ci�gu ostatnich dni namno�y�o si� tu ludzi.
	AI_Output (self, other,"DIA_NASZ_125_Silas_siema_55_01"); //Darmozjady, �aden z was nie pomaga� przy budowie obozu, a teraz wszyscy korzystacie!
	AI_Output (self, other,"DIA_NASZ_125_Silas_siema_55_02"); //Jestem Silas, ober�ysta. W mojej karczmie nie ma nic za darmo. Ka�dy kufel piwa kosztuje.

	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Silas prowadzi karczm�. Mog� u niego kupi� alkohol.");

};

//*********************************************************************
//	Info Work
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_work   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 3;
 	condition   = DIA_NASZ_125_Silas_work_Condition;
 	information = DIA_NASZ_125_Silas_work_Info;
 	permanent   = FALSE;
 	description = "Mog� si� na co� przyda�?";
};

FUNC INT DIA_NASZ_125_Silas_work_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_125_Silas_work_Info()
{
	AI_Output (other,self ,"DIA_NASZ_125_Silas_work_15_00"); //Mog� si� na co� przyda�?
	AI_Output (self, other,"DIA_NASZ_125_Silas_work_55_01"); //Takie chuchro najwy�ej mo�e zaj�� si� zmywaniem pustych kufli.
	AI_Output (other,self ,"DIA_NASZ_125_Silas_work_15_02"); //Nie jeste� zbyt uprzejmy jak na karczmarza.
	AI_Output (self, other,"DIA_NASZ_125_Silas_work_55_03"); //A ty jeste� bardzo wra�liwy. Co, ju� mi�kniesz?

};

var int Mis_Lowca_Sika_Done;
//*********************************************************************
//	Info Quest
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_Quest   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 4;
 	condition   = DIA_NASZ_125_Silas_Quest_Condition;
 	information = DIA_NASZ_125_Silas_Quest_Info;
 	permanent   = FALSE;
 	description = "Zaczynasz mnie irytowa�.";
};

FUNC INT DIA_NASZ_125_Silas_Quest_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_125_Silas_work))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_Quest_Info()
{

	AI_Output (other,self ,"DIA_NASZ_125_Silas_Quest_15_00"); //Zaczynasz mnie irytowa�.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Quest_55_01"); //No, no, no... Czy�by� nie podziela� mojej oceny twoich predyspozycji? Ch�tnie udowodni� ci, �e mam racj�.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Quest_55_02"); //Co noc pod moj� karczm� przychodzi jaki� osi�ek i sika po �cianach.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Quest_55_03"); //Bestialstwo. Spu�� mu lanie!
	AI_Output (other,self ,"DIA_NASZ_125_Silas_Quest_15_04"); //Lanie? To wyra�enie ma chyba wi�cej znacze�...

	LOWCA_SIKA_STOP_GADANIE = TRUE;

	Log_CreateTopic (TOPIC_Silas_lanie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_lanie, "Pewien dowcipni� przychodzi w nocy pod karczm� Silasa i mu j� obsikuje. Ober�ysta chce, bym da� mu nauczk�.");

};

var int SikaDalejRdy;
//*********************************************************************
//	Info End
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_End   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 6;
 	condition   = DIA_NASZ_125_Silas_End_Condition;
 	information = DIA_NASZ_125_Silas_End_Info;
 	permanent   = FALSE;
 	description = "Tw�j problem nale�y do przesz�o�ci.";
};

FUNC INT DIA_NASZ_125_Silas_End_Condition()
{
	if (LOWCA_SIKA_END == TRUE                // pobity lub zaplacone
	 || npc_isdead(NASZ_108_Lowca))           // lub zabity w quescie 'Szkolenie'
	&& (NASZ_108_LOWCA_KilledByOrcs == FALSE) // ale nie zabity przez ork�w w kap3, bo wtedy 0exp
	{
		return TRUE;
	};
};

func void HeroSay_YourProblemIsOver() {
	AI_Output (other,self ,"DIA_NASZ_125_Silas_End_15_00"); //Tw�j problem nale�y do przesz�o�ci.
};

FUNC VOID DIA_NASZ_125_Silas_End_Info()
{
	HeroSay_YourProblemIsOver();
	Mis_Lowca_Sika_Done = TRUE;
	
	if (NASZ_108_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_01"); //S�ysza�em odg�osy walki. Nie s�dzi�em, �e postanowisz za�atwi� to w ten spos�b. Uci��e� mu mo�e jaja?
		AI_Output (other, self,"DIA_NASZ_125_Silas_End_55_02"); //No niezbyt...
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_03"); //W dawnej Kolonii tym �achmyt� zaj�oby si� paru m�czyzn. Haha!
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_04"); //Tak czy owak, skoro postawi�e� na swoim i za�atwi�e� m�j k�opot, to ja postawi� ci par� butelek najlepszego alkoholu!

		DodajReputacje (3, REP_LOWCY);
		B_GivePlayerXP (300);
		Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
		B_LogEntry (TOPIC_Silas_lanie, "Silas by� ca�kiem zaskoczony, tym �e postawi�em si� wojownikowi.");
		Createinvitems (self, ItFo_Addon_Rum, 3);
		B_giveinvitems (self, other, ItFo_Addon_Rum, 3);
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_05"); //Masz pewno��, �e ju� nie wr�ci?
		AI_Output (other, self,"DIA_NASZ_125_Silas_End_55_06"); //Tak, to znaczy tak mi si� wydaje.
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_07"); //To zale�y od tego, jak si� z nim upora�e�. A w�a�ciwie to co zrobi�e�?
	
		LowcaSikaZaplaconeDay = Wld_GetDay ();
		SikaDalejRdy = TRUE;
		FF_ApplyOnceExt(SikaDalej,5000,-1);
		Info_ClearChoices 	(DIA_NASZ_125_Silas_End);
		Info_AddChoice 		(DIA_NASZ_125_Silas_End, "Pogrozi�em mu pi�ciami.",DIA_NASZ_125_Silas_End_Threat);
		Info_AddChoice		(DIA_NASZ_125_Silas_End, "Zap�aci�em mu.",DIA_NASZ_125_Silas_End_Pay);
	};

};

FUNC VOID DIA_NASZ_125_Silas_End_Threat ()
{
	AI_Output (other, self,"DIA_NASZ_125_Silas_End_Threat_55_00"); //Pogrozi�em mu pi�ciami.
	AI_Output (self, other,"DIA_NASZ_125_Silas_End_Threat_55_01"); //Doprawdy? No c�, nie wydaje mi si�, �eby uzbrojony �owca ork�w wystraszy� si� takiego ch�ystka jak ty.
	AI_Output (self, other,"DIA_NASZ_125_Silas_End_Threat_55_02"); //Tak czy inaczej swoje zrobi�e�. We� te kilka butelek rumu.
	Info_ClearChoices (DIA_NASZ_125_Silas_End);
	
	DodajReputacje (2, REP_LOWCY);
	B_GivePlayerXP (300);
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_lanie, "Troch� nak�ama�em Silasowi z tym 'gro�eniem pi�ciami', ale staruszek chyba si� nie zorientowa�.");
	Createinvitems (self, ItFo_Addon_Rum, 3);
	B_giveinvitems (self, other, ItFo_Addon_Rum, 3);
};

FUNC VOID DIA_NASZ_125_Silas_End_Pay ()
{
	AI_Output (other, self,"DIA_NASZ_125_Silas_End_Pay_55_00"); //Zap�aci�em mu.
	AI_Output (self, other,"DIA_NASZ_125_Silas_End_Pay_55_01"); //Widzisz, sam sobie udowodni�e�, �e to, co m�wi�em na tw�j temat to sama prawda.
	AI_Output (self, other,"DIA_NASZ_125_Silas_End_Pay_55_02"); //Tak, czy inaczej swoje zrobi�e�. We� te kilka butelek rumu.
	Info_ClearChoices (DIA_NASZ_125_Silas_End);
	
	DodajReputacje (2, REP_LOWCY);
	B_GivePlayerXP (300);
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_lanie, "Silas nie zdziwi� si�, �e rozwi�za�em problem p�ac�c. Co z tego? Przecie� nie wszystko za�atwia si� walk�!");
	Createinvitems (self, ItFo_Addon_Rum, 3);
	B_giveinvitems (self, other, ItFo_Addon_Rum, 3);
};

//*********************************************************************
//	Info SikaDalej
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_SikaDalej   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 7;
 	condition   = DIA_NASZ_125_Silas_SikaDalej_Condition;
 	information = DIA_NASZ_125_Silas_SikaDalej_Info;
 	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_NASZ_125_Silas_SikaDalej_Condition()
{
	if (LowcaSika == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_SikaDalej_Info()
{

	AI_Output (self, other,"DIA_NASZ_125_Silas_SikaDalej_15_00"); //Wiedzia�em, �e tak si� stanie.
	AI_Output (self, other,"DIA_NASZ_125_Silas_SikaDalej_55_01"); //�owca, z kt�rym rzekomo zrobi�e� porz�dek, wr�ci� do starych nawyk�w.
	AI_Output (self, other,"DIA_NASZ_125_Silas_SikaDalej_55_02"); //Co si� tak gapisz? Zajmij si� nim!

	LowcaSika = 2;
	LOWCA_SIKA_STOP_GADANIE = TRUE;


	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_lanie, "O cholera! Jak zapowiada�, tak zrobi� - �owca wr�ci� do swoich wstr�tnych praktyk. Co� mi si� wydaje, �e tym razem sakiewka ze z�otem nie wystarczy.");

};

//*********************************************************************
//	Info NieBedzie
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_NieBedzie   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 8;
 	condition   = DIA_NASZ_125_Silas_NieBedzie_Condition;
 	information = DIA_NASZ_125_Silas_NieBedzie_Info;
 	permanent   = FALSE;
	description	= "�owca w ko�cu si� opami�ta�.";
};

FUNC INT DIA_NASZ_125_Silas_NieBedzie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_125_Silas_SikaDalej))
	&& (
		(npc_knowsinfo (other, DIA_NASZ_108_Lowca_walka)
		&& NASZ_108_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) // pobity przez hero
		||
		(npc_isdead(NASZ_108_Lowca) && NASZ_108_LOWCA_KilledByOrcs == FALSE) // zabity, ale nie przez ork�w
	)
	{
		return TRUE;
	};
};

func void SilasSay_OkOk() {
	AI_Output (self, other,"DIA_NASZ_125_Silas_NieBedzie_55_01"); //No dobra, dobra. Zobaczymy.
};

FUNC VOID DIA_NASZ_125_Silas_NieBedzie_Info()
{

	AI_Output (other, self,"DIA_NASZ_125_Silas_NieBedzie_15_00"); //�owca w ko�cu si� opami�ta�.
	SilasSay_OkOk();

	DodajReputacje(1,REP_LOWCY);
	B_GivePlayerXP (50);
	
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_lanie, "Nieelegancki problem rozwi�zany raz na zawsze!");

};

//*********************************************************************
//	Info StaraPiosenka
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_StaraPiosenka   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 7;
 	condition   = DIA_NASZ_125_Silas_StaraPiosenka_Condition;
 	information = DIA_NASZ_125_Silas_StaraPiosenka_Info;
 	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_NASZ_125_Silas_StaraPiosenka_Condition()
{
	if (Mis_Lowca_Sika_Done == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_StaraPiosenka_Info()
{

	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_00"); //Hej, zaczekaj!
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_01"); //Jeszcze raz ci dzi�kuj� za pomoc, ale... czy m�g�by� mi pom�c z jeszcze jedn� spraw�? Wiem, �e prosz� o wiele, ale uwierz mi, dzia�am w imi� dobra ca�ego obozu!
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_02"); //Brzmi powa�nie. Co si� sta�o?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_03"); //Od d�u�szego czasu widz�, �e ch�opaki nie s� tacy jak wcze�niej. Wielu z nich wygl�da na przygn�bionych, smutnych i za�amanych. Nie ma w nich ju� tej energii jak� mo�na by�o dostrzec na pocz�tku.
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_04"); //To wszystko wina tego przekl�tego miejsca. Unosz�ca si� w atmosferze ci�g�a gro�ba zagro�enia ze strony zielonosk�rych doprowadzi ich na skraj za�amania. Musimy co� zdzia�a�!
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_05"); //S�dzi�em, �e oni byli tacy od zawsze. Masz jaki� pomys�, jak poprawi� ich nastr�j?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_06"); //Owszem, jednak nie wiem, na ile si� zda, bo to jedyne rozwi�zanie jakie przychodzi mi do g�owy. Uwa�am, �e muzyka mog�aby tutaj pom�c. Odpowiednio zagrana melodia jest w stanie rozweseli� cz�owieka.
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_07"); //Dobry pomys�, ale powiedz mi, co ja mam zrobi�? Chyba nie liczysz na to, �e z�api� za lutni� i zaczn� gra�?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_08"); //Nie, sk�d. Chcia�bym, aby� w moim imieniu porozmawia� z lud�mi w obozie. Mo�e kto� potrafi gra� na tym instrumencie... Zrobi�by� to dla mnie?
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_15_09"); //Zgoda, ale b�dziesz musia� mi to wynagrodzi�. Z kim powinienem porozmawia�?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_10"); //O to si� nie martw, zimne piwo na m�j koszt i z�oto z pewno�ci� zrekompensuj� tw�j cenny czas.
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_11"); //Kiedy� s�ysza�em, jak Johny chwali� si� umiej�tno�ciami gry na lutni. Powiniene� z nim porozmawia�.
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_12"); //W takim razie bior� si� do roboty.
	
	Log_CreateTopic (TOPIC_Silas_piosenka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Silas_piosenka, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_piosenka, "Silas opowiedzia� mi o sytuacji w obozie. Wielu �owc�w jest przygn�bionych przez panuj�c� w dolinie sytuacj�. Aby temu zaradzi�, karczmarz poprosi� mnie, abym poszuka� w obozie kogo�, kto potrafi gra� na lutni. To nie powinno by� trudne.");

};

//*********************************************************************
//	Info StaraPiosenkaDone
//*********************************************************************
var int SilasDalPiwo;
INSTANCE DIA_NASZ_125_Silas_StaraPiosenkaDone   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 7;
 	condition   = DIA_NASZ_125_Silas_StaraPiosenkaDone_Condition;
 	information = DIA_NASZ_125_Silas_StaraPiosenkaDone_Info;
 	permanent   = FALSE;
	description	= "Dzisiaj Engor powinien da� sw�j pierwszy wyst�p.";
};

FUNC INT DIA_NASZ_125_Silas_StaraPiosenkaDone_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_104_Engor_IHaveLute))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_StaraPiosenkaDone_Info()
{

	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenkaDone_15_00"); //Dzisiaj Engor powinien da� sw�j pierwszy wyst�p.
	
	if (Wld_IsTime(21,00,23,59) || Wld_IsTime(00,00,02,00)) {
		AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaDone_55_01"); //Fantastyczne! Oto twoja zap�ata. Masz tu te� dobre piwo, na dobry pocz�tek zabawy.
		SilasDalPiwo = TRUE;
		Createinvitems(self,ItNa_KufelPiwa,1);
		B_giveinvitems(self, other, ItNa_KufelPiwa, 1);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaDone_55_02"); //Fantastyczne! Oto twoja zap�ata, nie zapomnij tak�e przyj�� wieczorem do karczmy pos�ucha� muzyki.
		AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaDone_55_03"); //Stawiam ci tak�e darmowe piwo!
	};
	
	Createinvitems(self,ItMi_Gold,50);
	B_giveinvitems(self, other, ItMi_Gold, 50);
		
	EngorRoutinePlayLute = TRUE;
	
	DodajReputacje(1,REP_LOWCY);
	B_GivePlayerXP(300);
	
	B_StartOtherRoutine (NASZ_104_Engor,"Lute");
	Log_SetTopicStatus (TOPIC_Silas_piosenka, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_piosenka, "Za�atwione.");

};

//*********************************************************************
//	Info StaraPiosenkaAfter
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_StaraPiosenkaAfter   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 7;
 	condition   = DIA_NASZ_125_Silas_StaraPiosenkaAfter_Condition;
 	information = DIA_NASZ_125_Silas_StaraPiosenkaAfter_Info;
 	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_NASZ_125_Silas_StaraPiosenkaAfter_Condition()
{
	if (Wld_IsTime(21,00,23,59) || Wld_IsTime(00,00,02,00))
	&& (npc_knowsinfo (other, DIA_NASZ_125_Silas_StaraPiosenkaDone))
	&& (SilasDalPiwo == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_StaraPiosenkaAfter_Info()
{
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaAfter_15_00"); //Witaj Willu, przyszed�e� pos�ucha� muzyki?
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenkaAfter_55_01"); //Owszem i napi� si� zimnego piwa.
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaAfter_55_02"); //Na m�j koszt, mi�ej zabawy!
	
	SilasDalPiwo = TRUE;
	
	Createinvitems(self,ItNa_KufelPiwa,1);
	B_giveinvitems(self, other, ItNa_KufelPiwa, 1);
	
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info KurgKanDance
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_KurgKanDance   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 7;
 	condition   = DIA_NASZ_125_Silas_KurgKanDance_Condition;
 	information = DIA_NASZ_125_Silas_KurgKanDance_Info;
 	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_NASZ_125_Silas_KurgKanDance_Condition()
{
	if (Npc_GetDistToWP(NASZ_120_Phill,"NASZ_LOWCY_KARCZMA_02") < 500)
	&& (Npc_GetDistToWP(NASZ_452_KurgKan,"NASZ_LOWCY_KARCZMA_02") < 500)
	&& (Wld_IsTime(21,00,02,00))
	&& (KurgKanTanczy)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_KurgKanDance_Info()
{

	AI_Output (self, other,"DIA_NASZ_125_Silas_KurgKanDance_15_00"); //Ha, ha! Patrz jakiego Phill znalaz� sobie towarzysza do ta�ca.
	AI_Output (other, self,"DIA_NASZ_125_Silas_KurgKanDance_55_01"); //Kazali�cie mu ta�czy�? Nie jest wam wstyd?
	AI_Output (self, other,"DIA_NASZ_125_Silas_KurgKanDance_55_02"); //Kaza�? O nie, ten ork po prostu przyszed� w chwili wolnego i widz�c ta�cz�cego Philla, zdecydowa� si� do niego do��czy�. Ubaw po pachy! 
	AI_Output (other, self,"DIA_NASZ_125_Silas_KurgKanDance_55_03"); //Je�li tak, to rzeczywi�cie.
	
};


//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_Gwozdzie   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 22;
 	condition   = DIA_NASZ_125_Silas_Gwozdzie_Condition;
 	information = DIA_NASZ_125_Silas_Gwozdzie_Info;
 	permanent   = FALSE;
 	description = "Nie widzia�e� przypadkiem paczuszki gwo�dzi?";
};

FUNC INT DIA_NASZ_125_Silas_Gwozdzie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_Gwozdzie))
	&& (WillKnowGwozdzieThief == FALSE) && (MIS_ROBOTNIK_READY == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_Gwozdzie_Info()
{

	AI_Output (other,self ,"DIA_NASZ_125_Silas_Gwozdzie_15_00"); //Nie widzia�e� przypadkiem paczuszki gwo�dzi?
	AI_Output (self, other,"DIA_NASZ_125_Silas_Gwozdzie_55_01"); //O czym ty m�wisz?
	AI_Output (other,self ,"DIA_NASZ_125_Silas_Gwozdzie_15_02"); //Kilka dni temu robotnik zgubi� tu paczk�. Widzia�e� co� mo�e?
	AI_Output (self, other,"DIA_NASZ_125_Silas_Gwozdzie_55_03"); //Ah tak, pami�tam. Zarzyga� ca�y st�. Ale gdy sprz�ta�em rano karczm�, niczego nie znalaz�em.

	B_LogEntry (TOPIC_Robotnik_deski, "Silas nie widzia� gwo�dzi. Musz� zapyta� innych bywalc�w karczmy.");

};




var int HeroKnowAboutSilasSwitch;
func int SILAS_SWITCH_COND() {
	return HeroKnowAboutSilasSwitch;
};

var int Silas_Switch_OneTime;
func void SILAS_SWITCH_S1() {

	Wld_SendTrigger("SILAS_BECZKA_MOVER");
	Wld_SendTrigger("SILAS_KARCZMA_MOVER");

	if (Silas_Switch_OneTime == FALSE) {
		Silas_Switch_OneTime = TRUE;
		B_LogEntry (TOPIC_Silas_ryzowka, "Uda�o si�! Znalaz�em przycisk w beczce. Pora spl�drowa� schowek.");
	};
};

//*********************************************************************
//	Info QuestKap3
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_QuestKap3   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 22;
 	condition   = DIA_NASZ_125_Silas_QuestKap3_Condition;
 	information = DIA_NASZ_125_Silas_QuestKap3_Info;
 	permanent   = FALSE;
 	description = "Masz pod dostatkiem beczek z piwem?";
};

FUNC INT DIA_NASZ_125_Silas_QuestKap3_Condition()
{
	if (KAPITEL >= 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_QuestKap3_Info()
{

	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_00"); //Masz pod dostatkiem beczek z piwem?
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_01"); //Na �cianie wisi ich kilka. Reszta jest schowana w piwnicy, ch�odz� si�. A Jeremiasz dba o to, �eby codziennie uzupe�nia� nasze zapasy.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_02"); //Jednak piwo ma w sobie ma�o alkoholu i niekt�rym z �owc�w nie wystarcza. Pijani wspominaj�, jak Jeremiasz przyrz�dza� ry��wk� i wszyscy upijali�my si� ni� w karczmie w Nowym Obozie.
	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_03"); //Pami�tam ten trunek, ale nie by� moim ulubionym. Raz mocno przesadzi�em i sko�czy�o si� to bardzo nieciekawie...
	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_04"); //Od tamtego momentu nie mia�em styczno�ci z ry��wk� i chyba nie b�d� mia� ju� okazji. Uprawy ry�u w Nowym Obozie od dawna le�� przykryte �niegiem.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_05"); //To prawda. Nie ma r�wnie� zbieraczy, kt�rzy zajmowaliby si� upraw� pod okiem Ry�owego Ksi�cia. Nowego ry�u w G�rniczej Dolinie ju� nie wyhodujemy.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_06"); //Ale w mojej karczmie z pewno�ci� zosta�o jeszcze kilka beczu�ek. Niestety, tamte tereny okupuj� pot�ne jaszczurki i nie spos�b dosta� si� do �rodka.

	if (!npc_knowsinfo(other,DIA_NASZ_221_Benito_KillDone)) {
		AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_07"); //Nie wykluczam, �e niebawem si� tam wybior�.
	}
	else {
		AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_08"); //By�em tam ju� i mog� uda� si� ponownie.
	};
	
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_09"); //Naprawd�? By�oby �wietnie, gdyby� przyni�s� moje zapasy. Tylko musisz wiedzie�, gdzie ich szuka�. S� w schowku, ukryte przed spragnionymi Szkodnikami.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_10"); //Homer sprawi� ten mechanizm. Tama na jeziorze to nie jego jedyne osi�gni�cie. Ciekawe, czy prze�y� upadek Bariery...
	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_11"); //Dobra, to gdzie schowa�e� te beczu�ki?
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_12"); //Musisz wyj�� na pi�tro w karczmie, do pracowni Jeremiasza. Tam, po prawej stronie, przy �cianie, le�y beczka. Musisz podej�� do niej od lewej strony i pomaca�.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_13"); //Gdzie� powinna by� wn�ka, a w �rodku prze��cznik. Beczka zadzia�a jak ko�owr�t i poci�gnie �a�cuchy, kt�re wyci�gn� do g�ry drewniany st� pi�tro ni�ej.
	AI_Output (other, self,"DIA_NASZ_125_Silas_QuestKap3_55_14"); //Homer sprytnie to wymy�li�.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_15"); //To prawda. Nikt nigdy tam si� nie w�ama�! Jeste� czwartym, opr�cz mnie, Jeremiasza i Homera, cz�owiekiem, kt�ry zna to sekretne miejsce.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_16"); //Id� wi�c i przynie� o co prosz�, a b�dziesz m�g� kolejny raz skosztowa� ry��wki!
	
	HeroKnowAboutSilasSwitch = TRUE;
	
	Log_CreateTopic (TOPIC_Silas_ryzowka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Silas_ryzowka, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_ryzowka, "Silas powiedzia�, �e w jego karczmie w Nowym Obozie s� jeszcze zapasy ry��wki. Aby dosta� si� do miejsca, w kt�rym s� schowane, musz� wyj�� na pi�tro, gdzie Jeremiasz warzy� alkohol. Tam, po prawej stronie jest beczka przypi�ta do �a�cuch�w. Z jej lewej strony jest prze��cznik, kt�ry aktywuje mechanizm. Mam przynie�� karczmarzowi wszystkie zapasy, kt�re tam znajd�.");

	
};


var int SilasRyzowkaDay;
var int SilasRyzowkaHour;
//*********************************************************************
//	Info QuestKap3Finish
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_QuestKap3Finish   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 22;
 	condition   = DIA_NASZ_125_Silas_QuestKap3Finish_Condition;
 	information = DIA_NASZ_125_Silas_QuestKap3Finish_Info;
 	permanent   = FALSE;
 	description = "Przynios�em beczki z ry��wk�.";
};

FUNC INT DIA_NASZ_125_Silas_QuestKap3Finish_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_125_Silas_QuestKap3))
	&& (npc_hasitems(other,ItNa_Beczulka) >= 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_QuestKap3Finish_Info()
{

	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3Finish_15_00"); //Przynios�em beczki z ry��wk�.
	B_giveinvitems(other,self,ItNa_Beczulka,2);
	Npc_RemoveInvItems(self,ItNa_Beczulka,2);
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3Finish_55_01"); //O bogowie! Ju� czuj� ten aromat. Przyjd� za godzin�, to dostaniesz butelk�.
	
	Log_SetTopicStatus (TOPIC_Silas_ryzowka, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_ryzowka, "Odda�em karczmarzowi beczki. Ucieszy� si� i zaprosi� mnie na gratisow� butelk�. Mog� przyj�� za godzin�.");
	DodajReputacje(2,REP_LOWCY);
	B_GivePlayerXP(700);
	
	SilasRyzowkaDay = Wld_GetDay();
	SilasRyzowkaHour = Wld_GetTimeHour();
};

//*********************************************************************
//	Info QuestKap3Ryzowka
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_QuestKap3Ryzowka   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 22;
 	condition   = DIA_NASZ_125_Silas_QuestKap3Ryzowka_Condition;
 	information = DIA_NASZ_125_Silas_QuestKap3Ryzowka_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_125_Silas_QuestKap3Ryzowka_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_125_Silas_QuestKap3Finish))
	&& (TimeIsUp(-1,1,SilasRyzowkaDay,SilasRyzowkaHour)) // 1h
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_QuestKap3Ryzowka_Info()
{

	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3Ryzowka_15_00"); //Zgodnie z obietnic�, butelka dla ciebie.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3Ryzowka_55_01"); //Spr�buj! Mo�e tw�j �o��dek nie pami�ta ju�, jak na ni� reagowa�. Ha, ha!

	Createinvitems(self,ItNa_Ryzowka,1);
	B_giveinvitems(self,other,ItNa_Ryzowka,1);
	
	SILAS_SPRZEDAJE_RYZOWKE = TRUE;
	
};











//*********************************************************************
//	Info Trolls
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_Trolls   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 41;
 	condition   = DIA_NASZ_125_Silas_Trolls_Condition;
 	information = DIA_NASZ_125_Silas_Trolls_Info;
 	permanent   = FALSE;
 	description = "Wiesz, gdzie mog� znale�� trolle?";
};

FUNC INT DIA_NASZ_125_Silas_Trolls_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_NearGate))
	&& (!npc_knowsinfo (other, DIA_NASZ_223_Ratford_Pay))
	&& (!npc_knowsinfo (other, DIA_NASZ_010_Monastir_MamSkladniki))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_Trolls_Info()
{

	AI_Output (other,self ,"DIA_NASZ_125_Silas_Trolls_15_00"); //Wiesz, gdzie mog� znale�� trolle?
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_01"); //W G�rniczej Dolinie? Wsz�dzie, przede wszystkim w g�rach.
	AI_Output (other,self ,"DIA_NASZ_125_Silas_Trolls_15_02"); //Mam na my�li ca�� gromadk� trolli.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_03"); //Cz�owieku, czy� ty oszala�? Rozszarpi� ci� i zrobi� z ciebie zabawk� dla swoich m�odych.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_04"); //Jeden troll ci nie wystarczy?
	AI_Output (other,self ,"DIA_NASZ_125_Silas_Trolls_15_05"); //Monastir potrzebuje ro�liny, kt�r� mog� znale�� tylko w trollich odchodach.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_06"); //C� ten mag kombinuje... Za czas�w bariery, w Kanionie Trolli, by�o ich pe�no. Ale to miejsce zosta�o zasypane przez obsuwaj�ce si� g�azy.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_07"); //Nie mam poj�cia. Zapytaj Ratforda z obozu my�liwych. Jest wi�niem tego miejsca nie kr�cej ni� ja i ca�e �ycie poluje w okolicy.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_08"); //Mo�e zechcesz napi� si� czego� przed �mierci�?
	
	B_LogEntry (TOPIC_Monastir_pomoc, "Silas m�wi� co� o Kanionie Trolli, ale zosta� on zasypany. Mam poradzi� si� Ratforda.");

};

//*********************************************************************
//	Info Towary
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_towary   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 100;
 	condition   = DIA_NASZ_125_Silas_towary_Condition;
 	information = DIA_NASZ_125_Silas_towary_Info;
 	permanent   = TRUE;
	trade       = TRUE;
 	description = "Poka� mi swoje towary.";
};

FUNC INT DIA_NASZ_125_Silas_towary_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_125_Silas_towary_Info()
{
	AI_Output (other, self,"DIA_NASZ_125_Silas_towary_15_00"); //Poka� mi swoje towary.
	AI_Output (self, other,"DIA_NASZ_125_Silas_towary_55_01"); //Pami�taj: 'Kto piwo pije, ten zdrowo �yje'!
	B_GiveTradeInv (self);
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_HowAreYou   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 500;
 	condition   = DIA_NASZ_125_Silas_HowAreYou_Condition;
 	information = DIA_NASZ_125_Silas_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak tam interesy?";
};

FUNC INT DIA_NASZ_125_Silas_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_125_Silas_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_125_Silas_HowAreYou_15_00"); //Jak tam interesy?

	var int rnd; rnd = Hlp_Random(2);

	if (rnd == 0) {
		if (KurgKanTanczy) {
			AI_Output (self, other,"DIA_NASZ_125_Silas_HowAreYou_55_02"); //Dzi�ki pomocy orka mam du�o wi�cej czasu dla siebie. Dobrze, �e go sprowadzi�e�!
			return;
		};
	};
	
	// --- jesli nie wyszedl z dialogu, czyli albo rnd==1 albo kurgkan jeszcze nie pracuje dla silasa
	if (Jeremiasz_AlmostDead) {
		AI_Output (self, other,"DIA_NASZ_125_Silas_HowAreYou_55_03"); //Sytuacja jest kiepskawa, bo Jeremiasz le�y prawie martwy w ��ku.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_125_Silas_HowAreYou_55_01"); //Dop�ki Jeremiasz dla mnie pracuje, picia nikomu nie zabraknie!
	};

};

//*********************************************************************
//	Info EndDead
//*********************************************************************
INSTANCE DIA_NASZ_125_Silas_EndDead   (C_INFO)
{
	npc         = NASZ_125_Silas;
 	nr          = 6;
 	condition   = DIA_NASZ_125_Silas_EndDead_Condition;
 	information = DIA_NASZ_125_Silas_EndDead_Info;
 	permanent   = FALSE;
 	description = "Tw�j problem nale�y do przesz�o�ci.";
};

FUNC INT DIA_NASZ_125_Silas_EndDead_Condition()
{
	if (NASZ_108_LOWCA_KilledByOrcs)
	 && (
	     (npc_knowsinfo(other, DIA_NASZ_125_Silas_Quest) && (LOWCA_SIKA_END == FALSE)) // rozpoczete ale nie skonczone pierwsze podejscie
	     || 
		 ((LowcaSika >= 2) && !npc_knowsinfo(other,DIA_NASZ_125_Silas_NieBedzie)) // rozpoczete ale nie skonczone drugie podejscie
		)
	{
		return TRUE;
	};
	
};

FUNC VOID DIA_NASZ_125_Silas_EndDead_Info()
{
	HeroSay_YourProblemIsOver();
	SilasSay_OkOk();

	// bez nagrody i do�wiadczenia; tylko ko�czy misj�
	Mis_Lowca_Sika_Done = TRUE;
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_lanie, "Orkowie zabili tego �owc� i problem sam si� rozwi�za�. Powiadomi�em o tym Silasa.");	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_125_Silas_PICKPOCKET (C_INFO)
{
	npc			= NASZ_125_Silas;
	nr			= 900;
	condition	= DIA_NASZ_125_Silas_PICKPOCKET_Condition;
	information	= DIA_NASZ_125_Silas_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_125_Silas_PICKPOCKET_Condition()
{
	C_Beklauen (27);
};
 
FUNC VOID DIA_NASZ_125_Silas_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_125_Silas_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_125_Silas_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_125_Silas_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_125_Silas_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_125_Silas_PICKPOCKET_DoIt);
};

func void DIA_NASZ_125_Silas_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItFo_Beer,3);
	
	Info_ClearChoices (DIA_NASZ_125_Silas_PICKPOCKET);
};
	
func void DIA_NASZ_125_Silas_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_125_Silas_PICKPOCKET);
};
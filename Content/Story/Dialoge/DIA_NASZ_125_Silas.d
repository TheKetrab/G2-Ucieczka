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
	AI_Output (self, other,"DIA_NASZ_125_Silas_siema_15_00"); //Kogo my tu mamy? Kolejny nowy. W ci¹gu ostatnich dni namno¿y³o siê tu ludzi.
	AI_Output (self, other,"DIA_NASZ_125_Silas_siema_55_01"); //Darmozjady, ¿aden z was nie pomaga³ przy budowie obozu, a teraz wszyscy korzystacie!
	AI_Output (self, other,"DIA_NASZ_125_Silas_siema_55_02"); //Jestem Silas, ober¿ysta. W mojej karczmie nie ma nic za darmo. Ka¿dy kufel piwa kosztuje.

	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Silas prowadzi karczmê. Mogê u niego kupiæ alkohol.");

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
 	description = "Mogê siê na coœ przydaæ?";
};

FUNC INT DIA_NASZ_125_Silas_work_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_125_Silas_work_Info()
{
	AI_Output (other,self ,"DIA_NASZ_125_Silas_work_15_00"); //Mogê siê na coœ przydaæ?
	AI_Output (self, other,"DIA_NASZ_125_Silas_work_55_01"); //Takie chuchro najwy¿ej mo¿e zaj¹æ siê zmywaniem pustych kufli.
	AI_Output (other,self ,"DIA_NASZ_125_Silas_work_15_02"); //Nie jesteœ zbyt uprzejmy jak na karczmarza.
	AI_Output (self, other,"DIA_NASZ_125_Silas_work_55_03"); //A ty jesteœ bardzo wra¿liwy. Co, ju¿ miêkniesz?

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
 	description = "Zaczynasz mnie irytowaæ.";
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

	AI_Output (other,self ,"DIA_NASZ_125_Silas_Quest_15_00"); //Zaczynasz mnie irytowaæ.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Quest_55_01"); //No, no, no... Czy¿byœ nie podziela³ mojej oceny twoich predyspozycji? Chêtnie udowodniê ci, ¿e mam racjê.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Quest_55_02"); //Co noc pod moj¹ karczmê przychodzi jakiœ osi³ek i sika po œcianach.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Quest_55_03"); //Bestialstwo. Spuœæ mu lanie!
	AI_Output (other,self ,"DIA_NASZ_125_Silas_Quest_15_04"); //Lanie? To wyra¿enie ma chyba wiêcej znaczeñ...

	LOWCA_SIKA_STOP_GADANIE = TRUE;

	Log_CreateTopic (TOPIC_Silas_lanie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_lanie, "Pewien dowcipniœ przychodzi w nocy pod karczmê Silasa i mu j¹ obsikuje. Ober¿ysta chce, bym da³ mu nauczkê.");

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
 	description = "Twój problem nale¿y do przesz³oœci.";
};

FUNC INT DIA_NASZ_125_Silas_End_Condition()
{
	if (LOWCA_SIKA_END == TRUE                // pobity lub zaplacone
	 || npc_isdead(NASZ_108_Lowca))           // lub zabity w quescie 'Szkolenie'
	&& (NASZ_108_LOWCA_KilledByOrcs == FALSE) // ale nie zabity przez orków w kap3, bo wtedy 0exp
	{
		return TRUE;
	};
};

func void HeroSay_YourProblemIsOver() {
	AI_Output (other,self ,"DIA_NASZ_125_Silas_End_15_00"); //Twój problem nale¿y do przesz³oœci.
};

FUNC VOID DIA_NASZ_125_Silas_End_Info()
{
	HeroSay_YourProblemIsOver();
	Mis_Lowca_Sika_Done = TRUE;
	
	if (NASZ_108_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_01"); //S³ysza³em odg³osy walki. Nie s¹dzi³em, ¿e postanowisz za³atwiæ to w ten sposób. Uci¹³eœ mu mo¿e jaja?
		AI_Output (other, self,"DIA_NASZ_125_Silas_End_55_02"); //No niezbyt...
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_03"); //W dawnej Kolonii tym ³achmyt¹ zajê³oby siê paru mê¿czyzn. Haha!
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_04"); //Tak czy owak, skoro postawi³eœ na swoim i za³atwi³eœ mój k³opot, to ja postawiê ci parê butelek najlepszego alkoholu!

		DodajReputacje (3, REP_LOWCY);
		B_GivePlayerXP (300);
		Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
		B_LogEntry (TOPIC_Silas_lanie, "Silas by³ ca³kiem zaskoczony, tym ¿e postawi³em siê wojownikowi.");
		Createinvitems (self, ItFo_Addon_Rum, 3);
		B_giveinvitems (self, other, ItFo_Addon_Rum, 3);
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_05"); //Masz pewnoœæ, ¿e ju¿ nie wróci?
		AI_Output (other, self,"DIA_NASZ_125_Silas_End_55_06"); //Tak, to znaczy tak mi siê wydaje.
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_07"); //To zale¿y od tego, jak siê z nim upora³eœ. A w³aœciwie to co zrobi³eœ?
	
		LowcaSikaZaplaconeDay = Wld_GetDay ();
		SikaDalejRdy = TRUE;
		FF_ApplyOnceExt(SikaDalej,5000,-1);
		Info_ClearChoices 	(DIA_NASZ_125_Silas_End);
		Info_AddChoice 		(DIA_NASZ_125_Silas_End, "Pogrozi³em mu piêœciami.",DIA_NASZ_125_Silas_End_Threat);
		Info_AddChoice		(DIA_NASZ_125_Silas_End, "Zap³aci³em mu.",DIA_NASZ_125_Silas_End_Pay);
	};

};

FUNC VOID DIA_NASZ_125_Silas_End_Threat ()
{
	AI_Output (other, self,"DIA_NASZ_125_Silas_End_Threat_55_00"); //Pogrozi³em mu piêœciami.
	AI_Output (self, other,"DIA_NASZ_125_Silas_End_Threat_55_01"); //Doprawdy? No có¿, nie wydaje mi siê, ¿eby uzbrojony ³owca orków wystraszy³ siê takiego ch³ystka jak ty.
	AI_Output (self, other,"DIA_NASZ_125_Silas_End_Threat_55_02"); //Tak czy inaczej swoje zrobi³eœ. WeŸ te kilka butelek rumu.
	Info_ClearChoices (DIA_NASZ_125_Silas_End);
	
	DodajReputacje (2, REP_LOWCY);
	B_GivePlayerXP (300);
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_lanie, "Trochê nak³ama³em Silasowi z tym 'gro¿eniem piêœciami', ale staruszek chyba siê nie zorientowa³.");
	Createinvitems (self, ItFo_Addon_Rum, 3);
	B_giveinvitems (self, other, ItFo_Addon_Rum, 3);
};

FUNC VOID DIA_NASZ_125_Silas_End_Pay ()
{
	AI_Output (other, self,"DIA_NASZ_125_Silas_End_Pay_55_00"); //Zap³aci³em mu.
	AI_Output (self, other,"DIA_NASZ_125_Silas_End_Pay_55_01"); //Widzisz, sam sobie udowodni³eœ, ¿e to, co mówi³em na twój temat to sama prawda.
	AI_Output (self, other,"DIA_NASZ_125_Silas_End_Pay_55_02"); //Tak, czy inaczej swoje zrobi³eœ. WeŸ te kilka butelek rumu.
	Info_ClearChoices (DIA_NASZ_125_Silas_End);
	
	DodajReputacje (2, REP_LOWCY);
	B_GivePlayerXP (300);
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_lanie, "Silas nie zdziwi³ siê, ¿e rozwi¹za³em problem p³ac¹c. Co z tego? Przecie¿ nie wszystko za³atwia siê walk¹!");
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

	AI_Output (self, other,"DIA_NASZ_125_Silas_SikaDalej_15_00"); //Wiedzia³em, ¿e tak siê stanie.
	AI_Output (self, other,"DIA_NASZ_125_Silas_SikaDalej_55_01"); //£owca, z którym rzekomo zrobi³eœ porz¹dek, wróci³ do starych nawyków.
	AI_Output (self, other,"DIA_NASZ_125_Silas_SikaDalej_55_02"); //Co siê tak gapisz? Zajmij siê nim!

	LowcaSika = 2;
	LOWCA_SIKA_STOP_GADANIE = TRUE;


	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_lanie, "O cholera! Jak zapowiada³, tak zrobi³ - ³owca wróci³ do swoich wstrêtnych praktyk. Coœ mi siê wydaje, ¿e tym razem sakiewka ze z³otem nie wystarczy.");

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
	description	= "£owca w koñcu siê opamiêta³.";
};

FUNC INT DIA_NASZ_125_Silas_NieBedzie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_125_Silas_SikaDalej))
	&& (
		(npc_knowsinfo (other, DIA_NASZ_108_Lowca_walka)
		&& NASZ_108_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) // pobity przez hero
		||
		(npc_isdead(NASZ_108_Lowca) && NASZ_108_LOWCA_KilledByOrcs == FALSE) // zabity, ale nie przez orków
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

	AI_Output (other, self,"DIA_NASZ_125_Silas_NieBedzie_15_00"); //£owca w koñcu siê opamiêta³.
	SilasSay_OkOk();

	DodajReputacje(1,REP_LOWCY);
	B_GivePlayerXP (50);
	
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_lanie, "Nieelegancki problem rozwi¹zany raz na zawsze!");

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
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_01"); //Jeszcze raz ci dziêkujê za pomoc, ale... czy móg³byœ mi pomóc z jeszcze jedn¹ spraw¹? Wiem, ¿e proszê o wiele, ale uwierz mi, dzia³am w imiê dobra ca³ego obozu!
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_02"); //Brzmi powa¿nie. Co siê sta³o?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_03"); //Od d³u¿szego czasu widzê, ¿e ch³opaki nie s¹ tacy jak wczeœniej. Wielu z nich wygl¹da na przygnêbionych, smutnych i za³amanych. Nie ma w nich ju¿ tej energii jak¹ mo¿na by³o dostrzec na pocz¹tku.
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_04"); //To wszystko wina tego przeklêtego miejsca. Unosz¹ca siê w atmosferze ci¹g³a groŸba zagro¿enia ze strony zielonoskórych doprowadzi ich na skraj za³amania. Musimy coœ zdzia³aæ!
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_05"); //S¹dzi³em, ¿e oni byli tacy od zawsze. Masz jakiœ pomys³, jak poprawiæ ich nastrój?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_06"); //Owszem, jednak nie wiem, na ile siê zda, bo to jedyne rozwi¹zanie jakie przychodzi mi do g³owy. Uwa¿am, ¿e muzyka mog³aby tutaj pomóc. Odpowiednio zagrana melodia jest w stanie rozweseliæ cz³owieka.
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_07"); //Dobry pomys³, ale powiedz mi, co ja mam zrobiæ? Chyba nie liczysz na to, ¿e z³apiê za lutniê i zacznê graæ?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_08"); //Nie, sk¹d. Chcia³bym, abyœ w moim imieniu porozmawia³ z ludŸmi w obozie. Mo¿e ktoœ potrafi graæ na tym instrumencie... Zrobi³byœ to dla mnie?
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_15_09"); //Zgoda, ale bêdziesz musia³ mi to wynagrodziæ. Z kim powinienem porozmawiaæ?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_10"); //O to siê nie martw, zimne piwo na mój koszt i z³oto z pewnoœci¹ zrekompensuj¹ twój cenny czas.
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_11"); //Kiedyœ s³ysza³em, jak Johny chwali³ siê umiejêtnoœciami gry na lutni. Powinieneœ z nim porozmawiaæ.
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_12"); //W takim razie biorê siê do roboty.
	
	Log_CreateTopic (TOPIC_Silas_piosenka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Silas_piosenka, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_piosenka, "Silas opowiedzia³ mi o sytuacji w obozie. Wielu ³owców jest przygnêbionych przez panuj¹c¹ w dolinie sytuacjê. Aby temu zaradziæ, karczmarz poprosi³ mnie, abym poszuka³ w obozie kogoœ, kto potrafi graæ na lutni. To nie powinno byæ trudne.");

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
	description	= "Dzisiaj Engor powinien daæ swój pierwszy wystêp.";
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

	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenkaDone_15_00"); //Dzisiaj Engor powinien daæ swój pierwszy wystêp.
	
	if (Wld_IsTime(21,00,23,59) || Wld_IsTime(00,00,02,00)) {
		AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaDone_55_01"); //Fantastyczne! Oto twoja zap³ata. Masz tu te¿ dobre piwo, na dobry pocz¹tek zabawy.
		SilasDalPiwo = TRUE;
		Createinvitems(self,ItNa_KufelPiwa,1);
		B_giveinvitems(self, other, ItNa_KufelPiwa, 1);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaDone_55_02"); //Fantastyczne! Oto twoja zap³ata, nie zapomnij tak¿e przyjœæ wieczorem do karczmy pos³uchaæ muzyki.
		AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaDone_55_03"); //Stawiam ci tak¿e darmowe piwo!
	};
	
	Createinvitems(self,ItMi_Gold,50);
	B_giveinvitems(self, other, ItMi_Gold, 50);
		
	EngorRoutinePlayLute = TRUE;
	
	DodajReputacje(1,REP_LOWCY);
	B_GivePlayerXP(300);
	
	B_StartOtherRoutine (NASZ_104_Engor,"Lute");
	Log_SetTopicStatus (TOPIC_Silas_piosenka, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_piosenka, "Za³atwione.");

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
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaAfter_15_00"); //Witaj Willu, przyszed³eœ pos³uchaæ muzyki?
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenkaAfter_55_01"); //Owszem i napiæ siê zimnego piwa.
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenkaAfter_55_02"); //Na mój koszt, mi³ej zabawy!
	
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

	AI_Output (self, other,"DIA_NASZ_125_Silas_KurgKanDance_15_00"); //Ha, ha! Patrz jakiego Phill znalaz³ sobie towarzysza do tañca.
	AI_Output (other, self,"DIA_NASZ_125_Silas_KurgKanDance_55_01"); //Kazaliœcie mu tañczyæ? Nie jest wam wstyd?
	AI_Output (self, other,"DIA_NASZ_125_Silas_KurgKanDance_55_02"); //Kazaæ? O nie, ten ork po prostu przyszed³ w chwili wolnego i widz¹c tañcz¹cego Philla, zdecydowa³ siê do niego do³¹czyæ. Ubaw po pachy! 
	AI_Output (other, self,"DIA_NASZ_125_Silas_KurgKanDance_55_03"); //Jeœli tak, to rzeczywiœcie.
	
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
 	description = "Nie widzia³eœ przypadkiem paczuszki gwoŸdzi?";
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

	AI_Output (other,self ,"DIA_NASZ_125_Silas_Gwozdzie_15_00"); //Nie widzia³eœ przypadkiem paczuszki gwoŸdzi?
	AI_Output (self, other,"DIA_NASZ_125_Silas_Gwozdzie_55_01"); //O czym ty mówisz?
	AI_Output (other,self ,"DIA_NASZ_125_Silas_Gwozdzie_15_02"); //Kilka dni temu robotnik zgubi³ tu paczkê. Widzia³eœ coœ mo¿e?
	AI_Output (self, other,"DIA_NASZ_125_Silas_Gwozdzie_55_03"); //Ah tak, pamiêtam. Zarzyga³ ca³y stó³. Ale gdy sprz¹ta³em rano karczmê, niczego nie znalaz³em.

	B_LogEntry (TOPIC_Robotnik_deski, "Silas nie widzia³ gwoŸdzi. Muszê zapytaæ innych bywalców karczmy.");

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
		B_LogEntry (TOPIC_Silas_ryzowka, "Uda³o siê! Znalaz³em przycisk w beczce. Pora spl¹drowaæ schowek.");
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
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_01"); //Na œcianie wisi ich kilka. Reszta jest schowana w piwnicy, ch³odz¹ siê. A Jeremiasz dba o to, ¿eby codziennie uzupe³niaæ nasze zapasy.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_02"); //Jednak piwo ma w sobie ma³o alkoholu i niektórym z ³owców nie wystarcza. Pijani wspominaj¹, jak Jeremiasz przyrz¹dza³ ry¿ówkê i wszyscy upijaliœmy siê ni¹ w karczmie w Nowym Obozie.
	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_03"); //Pamiêtam ten trunek, ale nie by³ moim ulubionym. Raz mocno przesadzi³em i skoñczy³o siê to bardzo nieciekawie...
	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_04"); //Od tamtego momentu nie mia³em stycznoœci z ry¿ówk¹ i chyba nie bêdê mia³ ju¿ okazji. Uprawy ry¿u w Nowym Obozie od dawna le¿¹ przykryte œniegiem.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_05"); //To prawda. Nie ma równie¿ zbieraczy, którzy zajmowaliby siê upraw¹ pod okiem Ry¿owego Ksiêcia. Nowego ry¿u w Górniczej Dolinie ju¿ nie wyhodujemy.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_06"); //Ale w mojej karczmie z pewnoœci¹ zosta³o jeszcze kilka beczu³ek. Niestety, tamte tereny okupuj¹ potê¿ne jaszczurki i nie sposób dostaæ siê do œrodka.

	if (!npc_knowsinfo(other,DIA_NASZ_221_Benito_KillDone)) {
		AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_07"); //Nie wykluczam, ¿e niebawem siê tam wybiorê.
	}
	else {
		AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_08"); //By³em tam ju¿ i mogê udaæ siê ponownie.
	};
	
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_09"); //Naprawdê? By³oby œwietnie, gdybyœ przyniós³ moje zapasy. Tylko musisz wiedzieæ, gdzie ich szukaæ. S¹ w schowku, ukryte przed spragnionymi Szkodnikami.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_10"); //Homer sprawi³ ten mechanizm. Tama na jeziorze to nie jego jedyne osi¹gniêcie. Ciekawe, czy prze¿y³ upadek Bariery...
	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3_15_11"); //Dobra, to gdzie schowa³eœ te beczu³ki?
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_12"); //Musisz wyjœæ na piêtro w karczmie, do pracowni Jeremiasza. Tam, po prawej stronie, przy œcianie, le¿y beczka. Musisz podejœæ do niej od lewej strony i pomacaæ.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_13"); //Gdzieœ powinna byæ wnêka, a w œrodku prze³¹cznik. Beczka zadzia³a jak ko³owrót i poci¹gnie ³añcuchy, które wyci¹gn¹ do góry drewniany stó³ piêtro ni¿ej.
	AI_Output (other, self,"DIA_NASZ_125_Silas_QuestKap3_55_14"); //Homer sprytnie to wymyœli³.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_15"); //To prawda. Nikt nigdy tam siê nie w³ama³! Jesteœ czwartym, oprócz mnie, Jeremiasza i Homera, cz³owiekiem, który zna to sekretne miejsce.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3_55_16"); //IdŸ wiêc i przynieœ o co proszê, a bêdziesz móg³ kolejny raz skosztowaæ ry¿ówki!
	
	HeroKnowAboutSilasSwitch = TRUE;
	
	Log_CreateTopic (TOPIC_Silas_ryzowka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Silas_ryzowka, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_ryzowka, "Silas powiedzia³, ¿e w jego karczmie w Nowym Obozie s¹ jeszcze zapasy ry¿ówki. Aby dostaæ siê do miejsca, w którym s¹ schowane, muszê wyjœæ na piêtro, gdzie Jeremiasz warzy³ alkohol. Tam, po prawej stronie jest beczka przypiêta do ³añcuchów. Z jej lewej strony jest prze³¹cznik, który aktywuje mechanizm. Mam przynieœæ karczmarzowi wszystkie zapasy, które tam znajdê.");

	
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
 	description = "Przynios³em beczki z ry¿ówk¹.";
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

	AI_Output (other,self ,"DIA_NASZ_125_Silas_QuestKap3Finish_15_00"); //Przynios³em beczki z ry¿ówk¹.
	B_giveinvitems(other,self,ItNa_Beczulka,2);
	Npc_RemoveInvItems(self,ItNa_Beczulka,2);
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3Finish_55_01"); //O bogowie! Ju¿ czujê ten aromat. PrzyjdŸ za godzinê, to dostaniesz butelkê.
	
	Log_SetTopicStatus (TOPIC_Silas_ryzowka, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_ryzowka, "Odda³em karczmarzowi beczki. Ucieszy³ siê i zaprosi³ mnie na gratisow¹ butelkê. Mogê przyjœæ za godzinê.");
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

	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3Ryzowka_15_00"); //Zgodnie z obietnic¹, butelka dla ciebie.
	AI_Output (self, other,"DIA_NASZ_125_Silas_QuestKap3Ryzowka_55_01"); //Spróbuj! Mo¿e twój ¿o³¹dek nie pamiêta ju¿, jak na ni¹ reagowa³. Ha, ha!

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
 	description = "Wiesz, gdzie mogê znaleŸæ trolle?";
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

	AI_Output (other,self ,"DIA_NASZ_125_Silas_Trolls_15_00"); //Wiesz, gdzie mogê znaleŸæ trolle?
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_01"); //W Górniczej Dolinie? Wszêdzie, przede wszystkim w górach.
	AI_Output (other,self ,"DIA_NASZ_125_Silas_Trolls_15_02"); //Mam na myœli ca³¹ gromadkê trolli.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_03"); //Cz³owieku, czyœ ty oszala³? Rozszarpi¹ ciê i zrobi¹ z ciebie zabawkê dla swoich m³odych.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_04"); //Jeden troll ci nie wystarczy?
	AI_Output (other,self ,"DIA_NASZ_125_Silas_Trolls_15_05"); //Monastir potrzebuje roœliny, któr¹ mogê znaleŸæ tylko w trollich odchodach.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_06"); //Có¿ ten mag kombinuje... Za czasów bariery, w Kanionie Trolli, by³o ich pe³no. Ale to miejsce zosta³o zasypane przez obsuwaj¹ce siê g³azy.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_07"); //Nie mam pojêcia. Zapytaj Ratforda z obozu myœliwych. Jest wiêŸniem tego miejsca nie krócej ni¿ ja i ca³e ¿ycie poluje w okolicy.
	AI_Output (self, other,"DIA_NASZ_125_Silas_Trolls_55_08"); //Mo¿e zechcesz napiæ siê czegoœ przed œmierci¹?
	
	B_LogEntry (TOPIC_Monastir_pomoc, "Silas mówi³ coœ o Kanionie Trolli, ale zosta³ on zasypany. Mam poradziæ siê Ratforda.");

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
 	description = "Poka¿ mi swoje towary.";
};

FUNC INT DIA_NASZ_125_Silas_towary_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_125_Silas_towary_Info()
{
	AI_Output (other, self,"DIA_NASZ_125_Silas_towary_15_00"); //Poka¿ mi swoje towary.
	AI_Output (self, other,"DIA_NASZ_125_Silas_towary_55_01"); //Pamiêtaj: 'Kto piwo pije, ten zdrowo ¿yje'!
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
			AI_Output (self, other,"DIA_NASZ_125_Silas_HowAreYou_55_02"); //Dziêki pomocy orka mam du¿o wiêcej czasu dla siebie. Dobrze, ¿e go sprowadzi³eœ!
			return;
		};
	};
	
	// --- jesli nie wyszedl z dialogu, czyli albo rnd==1 albo kurgkan jeszcze nie pracuje dla silasa
	if (Jeremiasz_AlmostDead) {
		AI_Output (self, other,"DIA_NASZ_125_Silas_HowAreYou_55_03"); //Sytuacja jest kiepskawa, bo Jeremiasz le¿y prawie martwy w ³ó¿ku.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_125_Silas_HowAreYou_55_01"); //Dopóki Jeremiasz dla mnie pracuje, picia nikomu nie zabraknie!
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
 	description = "Twój problem nale¿y do przesz³oœci.";
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

	// bez nagrody i doœwiadczenia; tylko koñczy misjê
	Mis_Lowca_Sika_Done = TRUE;
	Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
	B_LogEntry (TOPIC_Silas_lanie, "Orkowie zabili tego ³owcê i problem sam siê rozwi¹za³. Powiadomi³em o tym Silasa.");	
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
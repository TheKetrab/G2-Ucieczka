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
 	description = "Mogê na coœ siê przydaæ?";
};

FUNC INT DIA_NASZ_125_Silas_work_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_125_Silas_work_Info()
{
	AI_Output (other,self ,"DIA_NASZ_125_Silas_work_15_00"); //Mogê na coœ siê przydaæ?
	AI_Output (self, other,"DIA_NASZ_125_Silas_work_55_01"); //Takie chuchro mo¿e najwy¿ej zaj¹æ siê zmywaniem pustych kufli.
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
	B_LogEntry (TOPIC_Silas_lanie, "Pewien dowcipniœ przychodzi w nocy pod karczmê Silasa i mu j¹ obsikuje. Ober¿ysta chce bym da³ mu nauczkê.");

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
	if (LOWCA_SIKA_END == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_End_Info()
{

	AI_Output (other,self ,"DIA_NASZ_125_Silas_End_15_00"); //Twój problem nale¿y do przesz³oœci.
	Mis_Lowca_Sika_Done = TRUE;
	
	if (NASZ_108_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_01"); //S³ysza³em odg³osy walki. Nie s¹dzi³em, ¿e postanowisz za³atwiæ to w ten sposób. Uci¹³eœ mu mo¿e jaja?
		AI_Output (other, self,"DIA_NASZ_125_Silas_End_55_02"); //Niekoniecznie...
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_03"); //W dawnej Kolonii tym ³achmyt¹ zajê³oby siê paru mê¿czyzn. Haha!
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_04"); //Tak czy owak, skoro postawi³eœ na swoim i za³atwi³eœ mój k³opot, to ja postawiê ci parê butelek najlepszego alkoholu!

		DodajReputacje (3, REP_LOWCY);
		B_GivePlayerXP (300);
		Log_SetTopicStatus (TOPIC_Silas_lanie, LOG_SUCCESS);
		B_LogEntry (TOPIC_Silas_lanie, "Silas by³ ca³kiem zaskoczony, ¿e postawi³em siê wojownikowi.");
		Createinvitems (self, ItFo_Addon_Rum, 3);
		B_giveinvitems (self, other, ItFo_Addon_Rum, 3);
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_125_Silas_End_55_05"); //Masz pewnoœæ, ¿e ju¿ tu nie wróci?
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
	if (NASZ_108_Lowca.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (npc_knowsinfo (other, DIA_NASZ_125_Silas_SikaDalej))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_125_Silas_NieBedzie_Info()
{

	AI_Output (other, self,"DIA_NASZ_125_Silas_NieBedzie_15_00"); //£owca w koñcu siê opamiêta³.
	AI_Output (self, other,"DIA_NASZ_125_Silas_NieBedzie_55_01"); //No dobra, dobra. Zobaczymy.

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
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_01"); //Jeszcze raz dziêkujê za pomoc. Lecz, czy móg³byœ mi pomóc z jeszcze jedn¹ spraw¹? Wiem, ¿e proszê o wiele, ale uwierz mi – to dla dobra ca³ego obozu!
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_02"); //Brzmi powa¿nie. Co siê sta³o?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_03"); //Od d³u¿szego czasu widzê, ¿e ch³opaki nie s¹ tacy jak wczeœniej. Wielu z nich wygl¹da na przygnêbionych, smutnych i za³amanych. Nie ma w nich ju¿ tej energii jak¹ mo¿na by³o dostrzec na pocz¹tku.
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_04"); //To wszystko wina tego przeklêtego miejsca. Unosz¹ca siê w atmosferze ci¹g³a groŸba zagro¿enia ze strony zielonoskórych doprowadzi ich na skraj za³amania. Musimy coœ zdzia³aæ!
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_05"); //S¹dzi³em, ¿e oni byli tacy od zawsze. Masz jakiœ pomys³, jak poprawiæ ich nastrój?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_55_06"); //Owszem, jednak nie wiem na ile siê zda, bo to jedyne rozwi¹zanie jakie przychodzi mi do g³owy. Uwa¿am, ¿e muzyka mog³aby tutaj pomóc, odpowiednio zagrana melodia jest w stanie rozweseliæ cz³owieka.
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_07"); //Dobry pomys³, ale powiedz mi, co ja mam zrobiæ? Chyba nie liczysz na to, ¿e z³apiê za lutniê i zacznê graæ?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_08"); //Nie, sk¹d. Chcia³bym, abyœ w moim imieniu porozmawia³ z ludŸmi w obozie. Mo¿e ktoœ potrafi graæ na tym instrumencie... Zrobi³byœ to dla mnie?
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_15_09"); //Zgoda, ale bêdziesz musia³ mi to wynagrodziæ. Z kim powinienem porozmawiaæ?
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_10"); //O to siê nie martw, zimne piwo na mój koszt i z³oto z pewnoœci¹ zrekompensuj¹ twój cenny czas.
	AI_Output (self, other,"DIA_NASZ_125_Silas_StaraPiosenka_15_11"); //Kiedyœ s³ysza³em, jak Johny chwali³ siê umiejêtnoœciami gry na lutni. Powinieneœ z nim porozmawiaæ.
	AI_Output (other, self,"DIA_NASZ_125_Silas_StaraPiosenka_55_12"); //W takim razie biorê siê do roboty.
	
	Log_CreateTopic (TOPIC_Silas_piosenka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Silas_piosenka, LOG_RUNNING);
	B_LogEntry (TOPIC_Silas_piosenka, "Silas opowiedzia³ mi o sytuacji w obozie, wielu ³owców jest przygnêbionych przez panuj¹c¹ w dolinie sytuacje. Aby temu zaradziæ, karczmarz poprosi³ mnie, abym poszuka³ w obozie kogoœ, kto potrafi graæ na lutni. To nie powinno byæ trudne.");

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
	
	DodajReputacje(3,REP_LOWCY);
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
	AI_Output (self, other,"DIA_NASZ_125_Silas_HowAreYou_55_01"); //Dopóki Jeremiasz dla mnie pracuje, picia nikomu nie zabraknie!

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
var int GhorimRediToTelepport;

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_027_Ghorim_EXIT   (C_INFO)
{
	npc         = NASZ_027_Ghorim;
	nr          = 999;
	condition   = DIA_NASZ_027_Ghorim_EXIT_Condition;
	information = DIA_NASZ_027_Ghorim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_027_Ghorim_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_027_Ghorim_EXIT_Info()
{
	if (GhorimRediToTelepport == TRUE)
	{
		AI_StopProcessInfos (self);
		Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");
		AI_Teleport (self, "TOT"); 
		B_StartOtherRoutine (self,"End");
	};
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Before
//*********************************************************************
INSTANCE DIA_NASZ_027_Ghorim_Before   (C_INFO)
{
	npc         = NASZ_027_Ghorim;
 	nr          = 1;
 	condition   = DIA_NASZ_027_Ghorim_Before_Condition;
 	information = DIA_NASZ_027_Ghorim_Before_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_027_Ghorim_Before_Condition()
{
	if (!Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
	&& (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_027_Ghorim_Before_Info()
{
	AI_Output (self, other,"DIA_NASZ_027_Ghorim_Before_027_00"); //MMMM.
	
};


///////////////////////////////////////////////////////////////////////
//	Info Lojalnosc
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_027_Ghorim_Lojalnosc		(C_INFO)
{
	npc		 	 = 	NASZ_027_Ghorim;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_027_Ghorim_Lojalnosc_Condition;
	information	 = 	DIA_NASZ_027_Ghorim_Lojalnosc_Info;
	important	 = 	TRUE;
};

func int DIA_NASZ_027_Ghorim_Lojalnosc_Condition ()
{
		if(Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
		{
			return TRUE;
		};
};
func void DIA_NASZ_027_Ghorim_Lojalnosc_Info ()
{
	
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_00"); //Stój tam, gdzie stoisz! Inaczej podeptasz bagienne ziele, które muszê ugnieœæ i zanieœæ Cor Kalomowi!
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_01"); //Nie chcê podwa¿aæ twoich s³ów, duchu, lecz tutaj nigdzie nie ma bagiennego ziela. Jest jedynie b³oto, kamienie i ziemia, z której wyrastaj¹ nowe chwasty.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_02"); //Niech to szlag! Harlok znów siê obija zamiast zabraæ siê do roboty! Tym razem sam siê z nim rozmówiê!
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_03"); //Spokojnie, Ghorimie. Myœlê, ¿e móg³byœ wzi¹æ sobie trochê wolnego i odpocz¹æ od pracy. Ka¿dy ma prawo do chwili wytchnienia.
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_04"); //Pamiêtam, ¿e swego czasu du¿o odpoczywa³eœ.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_05"); //Wtedy jeszcze ten sukinsyn Harlok jakkolwiek pomaga³ mi w mojej pracy. Teraz nie widzia³em go tu ju¿ kilka dobrych tygodni.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_06"); //Ale masz racjê: Nale¿y mi siê wypoczynek. A skoro ju¿ tu jesteœ, to mo¿e móg³byœ mi pomóc?
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_07"); //Oczywiœcie, duchu. Czego potrzebujesz?
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_08"); //Wiesz, ¿ycie w tym miejscu jest naprawdê smutne i pozbawione radoœci z ¿ycia, a naprawdê chcia³bym siê trochê rozerwaæ.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_09"); //Mo¿e móg³byœ przynieœæ mi jak¹œ ksi¹¿kê do poczytania? S³owo pisane od zawsze potrafi³o mnie rozweseliæ.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_10"); //Szczególnie interesuje mnie ksi¹¿ka Baala Lukora. By³ to jeden z najwierniejszych wyznawców naszego mistrza, Œni¹cego.
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_11"); //Gdzie mogê znaleŸæ rzeczy Baala Lukora?
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_12"); //Ju¿ kilkukrotnie przeszukiwa³em jego chatê. Lukor musia³ wzi¹æ tê ksiêgê ze sob¹, gdy wybra³ siê na cmentarzysko orków. Jestem przekonany, ¿e to w³aœnie w niej zapisa³ coœ o swoich objawieniach. 
	
	Log_CreateTopic (TOPIC_Ghorim_ksiega, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ghorim_ksiega, LOG_RUNNING);
	B_LogEntry (TOPIC_Ghorim_ksiega, "Duch Ghorim chcia³by poznaæ sekretne zapiski Baala Lukora, który by³ najbli¿ej ze wszystkich Guru ze Œni¹cym. Muszê odnaleŸæ jego ksiêgê, któr¹ zabra³ ze sob¹ na cmentarzysko orków.");
	//HookEngineF(oCNpc__CloseDeadNpc,5,LukorBook);
	

	AI_StopProcessInfos (self);

};

///////////////////////////////////////////////////////////////////////
//	Info Ksiazka
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_027_Ghorim_Ksiazka		(C_INFO)
{
	npc		 	 = 	NASZ_027_Ghorim;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_027_Ghorim_Ksiazka_Condition;
	information	 = 	DIA_NASZ_027_Ghorim_Ksiazka_Info;
	description	 =	"Mam twoj¹ ksi¹¿kê.";
};

func int DIA_NASZ_027_Ghorim_Ksiazka_Condition ()
{
	if( Npc_KnowsInfo(other,DIA_NASZ_027_Ghorim_Lojalnosc))
	&& (Npc_HasItems(hero,ItNa_KsiegaLukora) >= 1)
	{
		return TRUE;
	};
};
func void DIA_NASZ_027_Ghorim_Ksiazka_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Ksiazka_15_00"); //Mam twoj¹ ksi¹¿kê.
	B_GiveInvItems(other,self,ItNa_KsiegaLukora,1);
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Ksiazka_15_01"); //Liczê, ¿e umili ci czas przez kilka najbli¿szych godzin.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Ksiazka_027_02"); //Naprawdê mi j¹ przynios³eœ? Mo¿e œmiertelnicy nie s¹ tacy bezduszni na jakich ich siê kreuje. Proszê, przyjmij ode mnie w nagrodê mój pierœcieñ.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Ksiazka_027_03"); //Mi siê ju¿ nie przyda, a tobie z pewnoœci¹ pomo¿e podczas dalszych wêdrówek. Powinieneœ znaleŸæ go w mojej chacie, o ile ta jeszcze istnieje. Je¿eli go tam nie bêdzie, poszukaj w okolicy.
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Ksiazka_15_04"); //Dziêkujê Ghorimie, na pewno mi siê przyda. ¯egnaj i mam nadziejê, ¿e wkrótce zaznasz spokoju.

	Wld_InsertItem (ItNa_Pierscien_Zarazy,"FP_NASZ_PIERSCIEN_GHORIM");
	
	B_LogEntry (TOPIC_Lojalnosc,"W nagrodê za pomoc, Ghorim zaoferowa³ mi swój pierœcieñ, niestety duch nie mia³ go przy sobie. Wskaza³ mi jednak miejsce, gdzie mo¿e siê znajdowaæ. Czas przeszukaæ jego chatê i jej okolicê.");
	
	Log_SetTopicStatus (TOPIC_Ghorim_ksiega, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ghorim_ksiega, "Ghorim wydawa³ siê byæ zaskoczony, ¿e znalaz³em tê ksi¹¿kê. Có¿... Ja sam by³em zaskoczony, ¿e j¹ znalaz³em.");
	B_GivePlayerXP(500);


	GhorimRediToTelepport = TRUE;
};


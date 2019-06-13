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
	
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_00"); //St�j tam, gdzie stoisz! Inaczej podeptasz bagienne ziele, kt�re musz� ugnie�� i zanie�� Cor Kalomowi!
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_01"); //Nie chc� podwa�a� twoich s��w, duchu, lecz tutaj nigdzie nie ma bagiennego ziela. Jest jedynie b�oto, kamienie i ziemia, z kt�rej wyrastaj� nowe chwasty.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_02"); //Niech to szlag! Harlok zn�w si� obija zamiast zabra� si� do roboty! Tym razem sam si� z nim rozm�wi�!
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_03"); //Spokojnie, Ghorimie. My�l�, �e m�g�by� wzi�� sobie troch� wolnego i odpocz�� od pracy. Ka�dy ma prawo do chwili wytchnienia.
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_04"); //Pami�tam, �e swego czasu du�o odpoczywa�e�.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_05"); //Wtedy jeszcze ten sukinsyn Harlok jakkolwiek pomaga� mi w mojej pracy. Teraz nie widzia�em go tu ju� kilka dobrych tygodni.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_06"); //Ale masz racj�: Nale�y mi si� wypoczynek. A skoro ju� tu jeste�, to mo�e m�g�by� mi pom�c?
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_07"); //Oczywi�cie, duchu. Czego potrzebujesz?
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_08"); //Wiesz, �ycie w tym miejscu jest naprawd� smutne i pozbawione rado�ci z �ycia, a naprawd� chcia�bym si� troch� rozerwa�.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_09"); //Mo�e m�g�by� przynie�� mi jak�� ksi��k� do poczytania? S�owo pisane od zawsze potrafi�o mnie rozweseli�.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_10"); //Szczeg�lnie interesuje mnie ksi��ka Baala Lukora. By� to jeden z najwierniejszych wyznawc�w naszego mistrza, �ni�cego.
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Lojalnosc_15_11"); //Gdzie mog� znale�� rzeczy Baala Lukora?
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Lojalnosc_027_12"); //Ju� kilkukrotnie przeszukiwa�em jego chat�. Lukor musia� wzi�� t� ksi�g� ze sob�, gdy wybra� si� na cmentarzysko ork�w. Jestem przekonany, �e to w�a�nie w niej zapisa� co� o swoich objawieniach. 
	
	Log_CreateTopic (TOPIC_Ghorim_ksiega, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ghorim_ksiega, LOG_RUNNING);
	B_LogEntry (TOPIC_Ghorim_ksiega, "Duch Ghorim chcia�by pozna� sekretne zapiski Baala Lukora, kt�ry by� najbli�ej ze wszystkich Guru ze �ni�cym. Musz� odnale�� jego ksi�g�, kt�r� zabra� ze sob� na cmentarzysko ork�w.");
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
	description	 =	"Mam twoj� ksi��k�.";
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
	
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Ksiazka_15_00"); //Mam twoj� ksi��k�.
	B_GiveInvItems(other,self,ItNa_KsiegaLukora,1);
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Ksiazka_15_01"); //Licz�, �e umili ci czas przez kilka najbli�szych godzin.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Ksiazka_027_02"); //Naprawd� mi j� przynios�e�? Mo�e �miertelnicy nie s� tacy bezduszni na jakich ich si� kreuje. Prosz�, przyjmij ode mnie w nagrod� m�j pier�cie�.
	AI_Output			(self, other, "DIA_NASZ_027_Ghorim_Ksiazka_027_03"); //Mi si� ju� nie przyda, a tobie z pewno�ci� pomo�e podczas dalszych w�dr�wek. Powiniene� znale�� go w mojej chacie, o ile ta jeszcze istnieje. Je�eli go tam nie b�dzie, poszukaj w okolicy.
	AI_Output			(other, self, "DIA_NASZ_027_Ghorim_Ksiazka_15_04"); //Dzi�kuj� Ghorimie, na pewno mi si� przyda. �egnaj i mam nadziej�, �e wkr�tce zaznasz spokoju.

	Wld_InsertItem (ItNa_Pierscien_Zarazy,"FP_NASZ_PIERSCIEN_GHORIM");
	
	B_LogEntry (TOPIC_Lojalnosc,"W nagrod� za pomoc, Ghorim zaoferowa� mi sw�j pier�cie�, niestety duch nie mia� go przy sobie. Wskaza� mi jednak miejsce, gdzie mo�e si� znajdowa�. Czas przeszuka� jego chat� i jej okolic�.");
	
	Log_SetTopicStatus (TOPIC_Ghorim_ksiega, LOG_SUCCESS);
	B_LogEntry (TOPIC_Ghorim_ksiega, "Ghorim wydawa� si� by� zaskoczony, �e znalaz�em t� ksi��k�. C�... Ja sam by�em zaskoczony, �e j� znalaz�em.");
	B_GivePlayerXP(500);


	GhorimRediToTelepport = TRUE;
};


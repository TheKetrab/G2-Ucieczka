var int ShratRediToTelepport;

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_025_Shrat_EXIT   (C_INFO)
{
	npc         = NASZ_025_Shrat;
	nr          = 999;
	condition   = DIA_NASZ_025_Shrat_EXIT_Condition;
	information = DIA_NASZ_025_Shrat_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_025_Shrat_EXIT_Condition()
{	
	return TRUE;
};

func void DeleteShrat()
{
	if(InfoManager_HasFinished())
	{
		B_StartOtherRoutine (NASZ_025_Shrat,"End");
		DeleteNpc(NASZ_025_Shrat);
		ff_remove(DeleteShrat);
	};
};

FUNC VOID DIA_NASZ_025_Shrat_EXIT_Info()
{
	if (ShratRediToTelepport == TRUE)
	{
		Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");

		AI_StopProcessInfos (self);
		ff_applyonceext(DeleteShrat,1000,-1);
		hero.aivar[AIV_INVINCIBLE] = 0;
	};
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Before
//*********************************************************************
INSTANCE DIA_NASZ_025_Shrat_Before   (C_INFO)
{
	npc         = NASZ_025_Shrat;
 	nr          = 1;
 	condition   = DIA_NASZ_025_Shrat_Before_Condition;
 	information = DIA_NASZ_025_Shrat_Before_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_025_Shrat_Before_Condition()
{
	if (!Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
	&& (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_025_Shrat_Before_Info()
{
	AI_Output (self, other,"DIA_NASZ_025_Shrat_Before_025_00"); //MMMM.
	
};

///////////////////////////////////////////////////////////////////////
//	Info Lojalnosc
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_025_Shrat_Lojalnosc		(C_INFO)
{
	npc		 	 = 	NASZ_025_Shrat;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_025_Shrat_Lojalnosc_Condition;
	information	 = 	DIA_NASZ_025_Shrat_Lojalnosc_Info;
	description	 =	"Shrat, to naprawd� ty?";
};

func int DIA_NASZ_025_Shrat_Lojalnosc_Condition ()
{
		if(Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
		{
			return TRUE;
		};
};
func void DIA_NASZ_025_Shrat_Lojalnosc_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_025_Shrat_Lojalnosc_15_00"); //Shrat, to naprawd� ty? My�la�em, �e opu�ci�e� sw�j dom na bagnach tu� po upadku bariery!
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_01"); //To imi�... Wydaje si� by� znajome, lecz nic ju� dla mnie nie oznacza. Natomiast ty... Kim jeste�? �miertelnik nie powinien by� nigdy tutaj przychodzi�.
	AI_Output			(other, self, "DIA_NASZ_025_Shrat_Lojalnosc_15_02"); //Wy naprawd� nic nie pami�tacie... Przysy�a mnie Baal Orun. Chc� wam pom�c, ale abym m�g� pozna� spos�b, kt�ry mo�e mnie do tego doprowadzi�, musz� zdoby� wasze zaufanie.
	AI_Output			(other, self, "DIA_NASZ_025_Shrat_Lojalnosc_15_03"); //Powiedz mi duchu, czy jest jaki� spos�b na ukojenie twojej duszy?
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_04"); //Chcesz nam pom�c... Nie cz�sto spotyka si� �miertelnika, kt�ry baczy na los innych. Nie, mi niczego nie potrzeba.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_05"); //Jednak chc� poprosi� ci� o wy�wiadczenie przys�ugi mojemu przyjacielowi.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_06"); //Pewnego razu wyszed� z obozu pozbiera� zio�a przy okolicznej g�rze, gdzie napad�y i po�ar�y go wilki. Jego nagie ko�ci le�� w jaskini, a duch b��ka si� po okolicy nie mog�c zazna� spokoju.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Lojalnosc_025_07"); //M�g�by� mu pom�c?
	
	Wld_InsertItem (ItNa_DuchSkull,"FP_ROAM_ZAPALISADA_LAS_70");
	
	
	B_LogEntry (TOPIC_Lojalnosc, "Porozmawia�em ze Shratem, duch nie poprosi� mnie o nic dla siebie, a jedynie o wykonanie obrz�du poch�wku dla jego przyjaciela.");
	
	Log_CreateTopic (TOPIC_Shrat_przyjaciel, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Shrat_przyjaciel, LOG_RUNNING);
	B_LogEntry (TOPIC_Shrat_przyjaciel, "Shrat martwi si� o spoczynek swojego przyjaciela. 'Pewnego razu wyszed� z obozu pozbiera� zio�a przy okolicznej g�rze.' Pozostaje mi znale�� jego ko�ci i pomodli� si� nad nimi do znanych mi bog�w. Mo�e to pomo�e jego duszy zazna� spokoju.");	
	
	ff_applyonce(Duch);




};

func void Duch()
{
	//print("funkcja duch");

	if(Npc_HasItems(hero,ItNa_DuchSkull)>=1)
	{
		AI_Output(hero,hero,"DIA_Will_Duch_15_00");//Innosie, Adanosie i Beliarze... Jako pokorny �miertelnik prosz� was o wys�uchanie moich mod��w.
		Duch_Modlitwa_Start = TRUE;
		Fade_Status = 1;
		ff_applyonce(Duch_Modlitwa);
		ff_remove(Duch);
	};

};


///////////////////////////////////////////////////////////////////////
//	Info Duch
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_025_Shrat_Duch		(C_INFO)
{
	npc		 	 = 	NASZ_025_Shrat;
	nr		 	 = 	2;
	condition	 = 	DIA_NASZ_025_Shrat_Duch_Condition;
	information	 = 	DIA_NASZ_025_Shrat_Duch_Info;
	description	 =	"Je�li chodzi o twojego przyjaciela...";
};

func int DIA_NASZ_025_Shrat_Duch_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_NASZ_026_DuchNowicjusza_Lojalnosc))
	{
		return TRUE;
	};
};
func void DIA_NASZ_025_Shrat_Duch_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_025_Shrat_Duch_15_00"); //Tw�j przyjaciel zazna� spokoju po�r�d innych zmar�ych.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Duch_025_01"); //Wyczu�em to w chwili, kiedy si� po�egnali�cie. Teraz ju� wiem, �e kieruj� tob� szlachetne pobudki.
	AI_Output			(self, other, "DIA_NASZ_025_Shrat_Duch_025_02"); //Niech ci� �wiat�o prowadzi.
	
	ShratRediToTelepport = TRUE;
	B_LogEntry (TOPIC_Lojalnosc, "Po dostarczeniu do Shrata wiadomo�ci o jego przyjacielu ten zamilk� i odda� si� zadumie. My�l�, �e nie b�d� go d�u�ej niepokoi�.");	


};

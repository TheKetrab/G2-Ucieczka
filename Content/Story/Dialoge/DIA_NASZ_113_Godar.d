//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_113_Godar_EXIT   (C_INFO)
{
	npc         = NASZ_113_Godar;
	nr          = 999;
	condition   = DIA_NASZ_113_Godar_EXIT_Condition;
	information = DIA_NASZ_113_Godar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_113_Godar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_113_Godar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_113_Godar_hello		(C_INFO)
{
	npc		 	 = 	NASZ_113_Godar;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_113_Godar_hello_Condition;
	information	 = 	DIA_NASZ_113_Godar_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_113_Godar_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_113_Godar_hello_Info ()
{
	if (LOWCA_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_00"); //Nie przeszkadzaj mi!
	LOWCA_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (LOWCA_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_01"); //Cz³owieku, weŸ siê odczep.
	LOWCA_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (LOWCA_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_02"); //Zostaw mnie w spokoju!
	LOWCA_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_113_Godar_hello_03_03"); //Nie mam teraz czasu.
	LOWCA_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

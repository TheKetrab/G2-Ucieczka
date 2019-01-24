
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_208_Mysliwy_EXIT   (C_INFO)
{
	npc         = NASZ_208_Mysliwy;
	nr          = 999;
	condition   = DIA_NASZ_208_Mysliwy_EXIT_Condition;
	information = DIA_NASZ_208_Mysliwy_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_208_Mysliwy_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_208_Mysliwy_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_208_Mysliwy_hello		(C_INFO)
{
	npc		 	 = 	NASZ_208_Mysliwy;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_208_Mysliwy_hello_Condition;
	information	 = 	DIA_NASZ_208_Mysliwy_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_208_Mysliwy_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_NASZ_208_Mysliwy_hello_Info ()
{
	if (MYSLIWY_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_208_Mysliwy_hello_03_00"); //Zajmij siê swoimi sprawami.
	MYSLIWY_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (MYSLIWY_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_208_Mysliwy_hello_03_01"); //Nie przeszkadzaj mi.
	MYSLIWY_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (MYSLIWY_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_208_Mysliwy_hello_03_02"); //Nie masz nic lepszego do roboty? Zostaw mnie.
	MYSLIWY_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_208_Mysliwy_hello_03_03"); //OdejdŸ.
	MYSLIWY_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

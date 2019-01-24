
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_322_Niewolnik_EXIT   (C_INFO)
{
	npc         = NASZ_322_Niewolnik;
	nr          = 999;
	condition   = DIA_NASZ_322_Niewolnik_EXIT_Condition;
	information = DIA_NASZ_322_Niewolnik_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_322_Niewolnik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_322_Niewolnik_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_322_Niewolnik_hello		(C_INFO)
{
	npc		 	 = 	NASZ_322_Niewolnik;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_322_Niewolnik_hello_Condition;
	information	 = 	DIA_NASZ_322_Niewolnik_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_322_Niewolnik_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_NASZ_322_Niewolnik_hello_Info ()
{
	if (KOPACZ_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_322_Niewolnik_hello_03_00"); //Obaj b�dziemy mieli k�opoty.
	KOPACZ_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (KOPACZ_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_322_Niewolnik_hello_03_01"); //Odejd�.
	KOPACZ_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (KOPACZ_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_322_Niewolnik_hello_03_02"); //Rozmowa to nie jest najlepszy pomys�.
	KOPACZ_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_322_Niewolnik_hello_03_03"); //Ka�� nas wybato�y�!
	KOPACZ_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

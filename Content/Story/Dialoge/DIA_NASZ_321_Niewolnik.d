
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_321_Niewolnik_EXIT   (C_INFO)
{
	npc         = NASZ_321_Niewolnik;
	nr          = 999;
	condition   = DIA_NASZ_321_Niewolnik_EXIT_Condition;
	information = DIA_NASZ_321_Niewolnik_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_321_Niewolnik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_321_Niewolnik_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_321_Niewolnik_hello		(C_INFO)
{
	npc		 	 = 	NASZ_321_Niewolnik;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_321_Niewolnik_hello_Condition;
	information	 = 	DIA_NASZ_321_Niewolnik_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_321_Niewolnik_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_321_Niewolnik_hello_Info ()
{
	if (KOPACZ_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_321_Niewolnik_hello_03_00"); //Obaj bêdziemy mieli k³opoty.
	KOPACZ_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (KOPACZ_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_321_Niewolnik_hello_03_01"); //OdejdŸ.
	KOPACZ_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (KOPACZ_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_321_Niewolnik_hello_03_02"); //Rozmowa to nie jest najlepszy pomys³.
	KOPACZ_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_321_Niewolnik_hello_03_03"); //Ka¿¹ nas wybato¿yæ!
	KOPACZ_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

///////////////////////////////////////////////////////////////////////
//	Info Kap3
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_321_Niewolnik_kap3		(C_INFO)
{
	npc		 	 = 	NASZ_321_Niewolnik;
	nr		 	 = 	2;
	condition	 = 	DIA_NASZ_321_Niewolnik_kap3_Condition;
	information	 = 	DIA_NASZ_321_Niewolnik_kap3_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_321_Niewolnik_kap3_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)) && (KAPITEL >= 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_321_Niewolnik_kap3_Info ()
{
	if (KOPACZ_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_321_Niewolnik_kap3_03_00"); //Dziêki za ratunek.
	KOPACZ_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (KOPACZ_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_321_Niewolnik_kap3_03_01"); //Jestem ci bardzo wdziêczny.
	KOPACZ_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (KOPACZ_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_321_Niewolnik_kap3_03_02"); //Dobrze, ¿e ju¿ nie ma tych cholernych bandytów.
	KOPACZ_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_321_Niewolnik_kap3_03_03"); //Œwietna robota, wielki wojowniku.
	KOPACZ_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};
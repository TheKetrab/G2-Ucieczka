
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_004_Bryson_EXIT   (C_INFO)
{
	npc         = NASZ_004_Bryson;
	nr          = 999;
	condition   = DIA_NASZ_004_Bryson_EXIT_Condition;
	information = DIA_NASZ_004_Bryson_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_004_Bryson_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_004_Bryson_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_004_Bryson_hello		(C_INFO)
{
	npc		 	 = 	NASZ_004_Bryson;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_004_Bryson_hello_Condition;
	information	 = 	DIA_NASZ_004_Bryson_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_004_Bryson_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)) && (KOPACZE_URATOWANI == FALSE)
	{
		return TRUE;
	};
};
func void DIA_NASZ_004_Bryson_hello_Info ()
{
	if (KOPACZ_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_004_Bryson_hello_03_00"); //Czego nie pracujesz?
	KOPACZ_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (KOPACZ_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_004_Bryson_hello_03_01"); //Jak tylko skoñczê, to zobaczysz, ¿e ci siê oberwie za lenistwo!
	KOPACZ_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (KOPACZ_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_004_Bryson_hello_03_02"); //B¹dŸ mi³y, to mo¿e dostaniesz ode mnie parê okruchów chleba, ha ha ha!
	KOPACZ_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_004_Bryson_hello_03_03"); //Dobrze ci radzê ch³optasiu, odwal siê!
	KOPACZ_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

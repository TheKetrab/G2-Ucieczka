//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_012_Renegat_EXIT   (C_INFO)
{
	npc         = NASZ_012_Renegat;
	nr          = 999;
	condition   = DIA_NASZ_012_Renegat_EXIT_Condition;
	information = DIA_NASZ_012_Renegat_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_012_Renegat_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_012_Renegat_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_012_Renegat_siema   (C_INFO)
{
	npc         = NASZ_012_Renegat;
 	nr          = 1;
 	condition   = DIA_NASZ_012_Renegat_siema_Condition;
 	information = DIA_NASZ_012_Renegat_siema_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_012_Renegat_siema_Condition()
{
	if (WillCanTalkWithRenegat == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_012_Renegat_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_012_Renegat_siema_15_00"); //Czego tu chcesz? I tak nie wejdziesz. Zje¿d¿aj st¹d!
	
	AI_TurnAway (hero, self);
	AI_GotoWP (hero, "NASZ_TWIERDZA_OUT");
	AI_StopProcessInfos (self);
};


//*********************************************************************
//	Info Poslaniec
//*********************************************************************
INSTANCE DIA_NASZ_012_Renegat_poslaniec   (C_INFO)
{
	npc         = NASZ_012_Renegat;
 	nr          = 2;
 	condition   = DIA_NASZ_012_Renegat_poslaniec_Condition;
 	information = DIA_NASZ_012_Renegat_poslaniec_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_012_Renegat_poslaniec_Condition()
{
	if (WillCanTalkWithRenegat == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_012_Renegat_poslaniec_Info()
{
	AI_Output (self, other,"DIA_NASZ_012_Renegat_poslaniec_55_00"); //Zatrzymaj siê. Czego chcesz, nieznajomy?
	AI_Output (other,self ,"DIA_NASZ_012_Renegat_poslaniec_15_01"); //Jestem pos³añcem od Rabona.
	AI_Output (self, other,"DIA_NASZ_012_Renegat_poslaniec_55_02"); //Doprawdy? A jak ciê zw¹, przybyszu?

	

	Info_ClearChoices (DIA_NASZ_012_Renegat_poslaniec);
		Info_AddChoice	  (DIA_NASZ_012_Renegat_poslaniec, "Hernandoz.", DIA_NASZ_012_Renegat_poslaniec_Will);
		Info_AddChoice	  (DIA_NASZ_012_Renegat_poslaniec, "Herendez.", DIA_NASZ_012_Renegat_poslaniec_Hernandez);
		Info_AddChoice	  (DIA_NASZ_012_Renegat_poslaniec, "Henardez.", DIA_NASZ_012_Renegat_poslaniec_Marcos);
		Info_AddChoice	  (DIA_NASZ_012_Renegat_poslaniec, "Hernandemos.", DIA_NASZ_012_Renegat_poslaniec_Rabon);
		Info_AddChoice	  (DIA_NASZ_012_Renegat_poslaniec, "Hernandes.", DIA_NASZ_012_Renegat_poslaniec_Nod);
};

FUNC VOID DIA_NASZ_012_Renegat_poslaniec_will()
{

	AI_Output (other,self ,"DIA_NASZ_012_Renegat_poslaniec_will_15_00"); //Hernandoz.
	AI_Output (self, other,"DIA_NASZ_012_Renegat_poslaniec_will_55_01"); //INTRUZ!

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);


};

FUNC VOID DIA_NASZ_012_Renegat_poslaniec_hernandez()
{

	AI_Output (other,self ,"DIA_NASZ_012_Renegat_poslaniec_hernandez_15_00"); //Herendez.
	AI_Output (self, other,"DIA_NASZ_012_Renegat_poslaniec_hernandez_55_01"); //OTWORZYÆ BRAMÊ!
	B_StartOtherRoutine (NASZ_305_Rabon,"Twierdza");
	AI_StopProcessInfos (self);
	
	GateTwierdza_Open();

};

FUNC VOID DIA_NASZ_012_Renegat_poslaniec_marcos()
{

	AI_Output (other,self ,"DIA_NASZ_012_Renegat_poslaniec_marcos_15_00"); //Henardez.
	AI_Output (self, other,"DIA_NASZ_012_Renegat_poslaniec_marcos_55_01"); //INTRUZ!

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_012_Renegat_poslaniec_rabon()
{

	AI_Output (other,self ,"DIA_NASZ_012_Renegat_poslaniec_rabon_15_00"); //Hernandemos.
	AI_Output (self, other,"DIA_NASZ_012_Renegat_poslaniec_rabon_55_01"); //INTRUZ!

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_012_Renegat_poslaniec_nod()
{

	AI_Output (other,self ,"DIA_NASZ_012_Renegat_poslaniec_nod_15_00"); //Hernandes.
	AI_Output (self, other,"DIA_NASZ_012_Renegat_poslaniec_nod_55_01"); //INTRUZ!

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);

};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_314_Bandzior_EXIT   (C_INFO)
{
	npc         = NASZ_314_Bandzior;
	nr          = 999;
	condition   = DIA_NASZ_314_Bandzior_EXIT_Condition;
	information = DIA_NASZ_314_Bandzior_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_314_Bandzior_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_314_Bandzior_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_314_Bandzior_Obcy		(C_INFO)
{
	npc		 = 	NASZ_314_Bandzior;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_314_Bandzior_Obcy_Condition;
	information	 = 	DIA_NASZ_314_Bandzior_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_314_Bandzior_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_314_Bandzior_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_314_Bandzior_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_314_Bandzior_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_314_Bandzior_hello		(C_INFO)
{
	npc		 	 = 	NASZ_314_Bandzior;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_314_Bandzior_hello_Condition;
	information	 = 	DIA_NASZ_314_Bandzior_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_314_Bandzior_hello_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_NASZ_314_Bandzior_hello_Info ()
{
	if (BANDZIOR_ZAGADANIE == 3) {
	AI_Output			(self, other, "DIA_NASZ_314_Bandzior_hello_03_00"); //Zostaw mnie w spokoju.
	BANDZIOR_ZAGADANIE = 0;
	AI_StopProcessInfos (self);
	}
		
	else if (BANDZIOR_ZAGADANIE == 2) {
	AI_Output			(self, other, "DIA_NASZ_314_Bandzior_hello_03_01"); //To, ¿e ³azisz sobie po obozie, nie oznacza, ¿e mam zamiar z tob¹ rozmawiaæ.
	BANDZIOR_ZAGADANIE = 3;
	AI_StopProcessInfos (self);
	}

	else if (BANDZIOR_ZAGADANIE == 1) {
	AI_Output			(self, other, "DIA_NASZ_314_Bandzior_hello_03_02"); //Dasz mi spokój?
	BANDZIOR_ZAGADANIE = 2;
	AI_StopProcessInfos (self);
	}

	else {
	AI_Output			(self, other, "DIA_NASZ_314_Bandzior_hello_03_03"); //Odwal siê!
	BANDZIOR_ZAGADANIE = 1;
	AI_StopProcessInfos (self);
	};

};

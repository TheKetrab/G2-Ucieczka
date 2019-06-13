
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_309_Straznik_EXIT   (C_INFO)
{
	npc         = NASZ_309_Straznik;
	nr          = 999;
	condition   = DIA_NASZ_309_Straznik_EXIT_Condition;
	information = DIA_NASZ_309_Straznik_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_309_Straznik_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_309_Straznik_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_309_Straznik_Obcy		(C_INFO)
{
	npc		 = 	NASZ_309_Straznik;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_309_Straznik_Obcy_Condition;
	information	 = 	DIA_NASZ_309_Straznik_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_309_Straznik_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_309_Straznik_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_309_Straznik_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_309_Straznik_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};


func void Straznik309Say_Won() {
	AI_Output (self, other,"Straznik309Say_Won_15_00"); //Won!
};

//*********************************************************************
//	Info Hello
//*********************************************************************
var int Straznik309WonOneTime;

INSTANCE DIA_NASZ_309_Straznik_siema   (C_INFO)
{
	npc         = NASZ_309_Straznik;
 	nr          = 1;
 	condition   = DIA_NASZ_309_Straznik_siema_Condition;
 	information = DIA_NASZ_309_Straznik_siema_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_309_Straznik_siema_Condition()
{
	if (! WCHODZENIE_SZEF)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_309_Straznik_siema_Info()
{
	if (npc_hasitems (other, ItNa_ZezwolenieBandyci) >=1) {
		Straznik309Say_Won();
		AI_Output (other, self,"DIA_NASZ_309_Straznik_siema_55_01"); //Frut zezwoli³ mi na widzenie siê z szefem. Mam na to papier.
		AI_Output (self, other,"DIA_NASZ_309_Straznik_siema_55_02"); //Poka¿.
		B_giveinvitems (other, self, ItNa_ZezwolenieBandyci, 1);
		B_UseFakeScroll();
		AI_Output (self, other,"DIA_NASZ_309_Straznik_siema_55_03"); //Dobra, mo¿esz wejœæ. Tylko nie palnij czegoœ g³upiego. No, o ile chcesz jeszcze trochê po¿yæ.
		B_LogEntry (TOPIC_Gestath_renegaci, "Teraz mogê porozmawiaæ z przywódc¹ bandytów.");

		WCHODZENIE_SZEF=1;
	}

	else {
		Straznik309Say_Won();

		if (Straznik309WonOneTime == FALSE) {
			AI_Output (other, self,"DIA_NASZ_309_Straznik_siema_55_04"); //Chcê rozmawiaæ z szefem.
			AI_Output (self, other,"DIA_NASZ_309_Straznik_siema_55_05"); //Nie masz pozwolenia od Fruta, wiêc o tym zapomnij. A teraz zje¿d¿aj!
			Straznik309WonOneTime = TRUE;
		};
		
		AI_TurnAway (hero, self);
		AI_GotoWP (hero, "OW_PATH_033_TO_CAVE3");
		AI_StopProcessInfos (self);

	};		
};

//*********************************************************************
//	Info Hello3
//*********************************************************************
INSTANCE DIA_NASZ_309_Straznik_siema3   (C_INFO)
{
	npc         = NASZ_309_Straznik;
 	nr          = 2;
 	condition   = DIA_NASZ_309_Straznik_siema3_Condition;
 	information = DIA_NASZ_309_Straznik_siema3_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_309_Straznik_siema3_Condition()
{
	if (Npc_IsInState (self, ZS_Talk)
		&& (WCHODZENIE_SZEF == 1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_309_Straznik_siema3_Info()
{
	
	AI_Output (self, other,"DIA_NASZ_309_Straznik_siema3_15_00"); //Muszê byæ czujny.

	AI_StopProcessInfos (self);
	
};

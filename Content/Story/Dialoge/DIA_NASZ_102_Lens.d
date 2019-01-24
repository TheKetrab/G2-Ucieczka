//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_102_Lens_EXIT   (C_INFO)
{
	npc         = NASZ_102_Lens;
	nr          = 999;
	condition   = DIA_NASZ_102_Lens_EXIT_Condition;
	information = DIA_NASZ_102_Lens_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_102_Lens_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_102_Lens_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

var int KNOW_THIEF;
//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_102_Lens_siema   (C_INFO)
{
	npc         = NASZ_102_Lens;
 	nr          = 1;
 	condition   = DIA_NASZ_102_Lens_siema_Condition;
 	information = DIA_NASZ_102_Lens_siema_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_102_Lens_siema_Condition()
{
	if (!npc_knowsinfo (other, DIA_NASZ_117_Fed_goth))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_102_Lens_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_102_Lens_siema_15_00"); //Co tutaj robisz?
	AI_Output (self, other,"DIA_NASZ_102_Lens_siema_55_01"); //Zje¿d¿aj! Albo sam ciê st¹d wykopiê!
	
	AI_TurnAway (hero, self);
	AI_GotoWP (hero, "LOCATION_16_OUT");

	AI_StopProcessInfos (self);	
};

//*********************************************************************
//	         Zadanie 
//*********************************************************************
INSTANCE DIA_NASZ_102_Lens_zadanie   (C_INFO)
{
	npc         = NASZ_102_Lens;
 	nr          = 2;
 	condition   = DIA_NASZ_102_Lens_zadanie_Condition;
 	information = DIA_NASZ_102_Lens_zadanie_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_102_Lens_zadanie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_117_Fed_goth))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_102_Lens_zadanie_Info()
{
	AI_Output (self, other,"DIA_NASZ_102_Lens_zadanie_55_00"); //Zab³¹dzi³eœ? Jazda st¹d!
	AI_Output (other,self ,"DIA_NASZ_102_Lens_zadanie_15_01"); //To ty dokona³eœ rozboju na myœliwych!
	AI_Output (self, other,"DIA_NASZ_102_Lens_zadanie_55_02"); //Argh! Jak do tego doszed³eœ? Zreszt¹ niewa¿ne, bo niby co z tym zrobisz? Jesteœ nic nie wart.
	AI_Output (other, self,"DIA_NASZ_102_Lens_zadanie_55_03"); //Gdzie s¹ zrabowane trofea?
	AI_Output (self, other,"DIA_NASZ_102_Lens_zadanie_55_04"); //Nie twój interes! A teraz gotuj siê na œmieræ!

	self.flags = 0;
	
	Createinvitems (self, ItNa_Key_Lens, 1);
	self.guild = GIL_BDT;
	Npc_SetTrueGuild (self, GIL_BDT);
	
	KNOW_THIEF = TRUE;
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);
	
};

var int SkrzyniaLensaOneTime;
FUNC VOID CHEST_LENS_S1() {

	if (SkrzyniaLensaOneTime == FALSE) {

		SkrzyniaLensaOneTime = TRUE;
		
		if (Npc_HasItems(other, ItNa_PaczkaGoth) == 0) {
			B_LogEntry (TOPIC_Goth_kradziez, "W skrzyni Lensa znalaz³em wszystkie trofea oprócz paczki mieczy jednorêcznych. Muszê porozgl¹daæ siê jeszcze po obozie ³owców orków.");
		}
		else {
			B_LogEntry (TOPIC_Goth_kradziez, "W skrzyni Lensa znalaz³em wszystkie pozosta³e trofea.");
		};
	};
};

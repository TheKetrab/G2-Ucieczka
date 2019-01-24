//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_112_Peter_EXIT   (C_INFO)
{
	npc         = NASZ_112_Peter;
	nr          = 999;
	condition   = DIA_NASZ_112_Peter_EXIT_Condition;
	information = DIA_NASZ_112_Peter_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_112_Peter_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_112_Peter_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_112_Peter_hello   (C_INFO)
{
	npc         = NASZ_112_Peter;
 	nr          = 1;
 	condition   = DIA_NASZ_112_Peter_hello_Condition;
 	information = DIA_NASZ_112_Peter_hello_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_112_Peter_hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_112_Peter_hello_Info()
{
	AI_Output (self, other,"DIA_NASZ_112_Peter_hello_55_00"); //Hej, nie widzia³em ciê tu wczeœniej. Kim jesteœ?
	AI_Output (other, self,"DIA_NASZ_112_Peter_hello_15_01"); //Jestem, to znaczy by³em, kopaczem. Nazywam siê Will.

};

//*********************************************************************
//	Info What
//*********************************************************************
INSTANCE DIA_NASZ_112_Peter_what   (C_INFO)
{
	npc         = NASZ_112_Peter;
 	nr          = 2;
 	condition   = DIA_NASZ_112_Peter_what_Condition;
 	information = DIA_NASZ_112_Peter_what_Info;
 	permanent   = FALSE;
 	description = "Czym siê tutaj zajmujesz?";
};

FUNC INT DIA_NASZ_112_Peter_what_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_112_Peter_hello))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_112_Peter_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_112_Peter_what_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self, other,"DIA_NASZ_112_Peter_what_55_01"); //Trenujê. Keroloth niedawno mianowa³ mnie wojownikiem, da³ pancerz i miecz.
	AI_Output (self, other,"DIA_NASZ_112_Peter_what_55_02"); //Podobnie jak ty, jeszcze dwa tygodnie temu by³em kopaczem.

};

//*********************************************************************
//	Info Walka
//*********************************************************************
INSTANCE DIA_NASZ_112_Peter_walka   (C_INFO)
{
	npc         = NASZ_112_Peter;
 	nr          = 3;
 	condition   = DIA_NASZ_112_Peter_walka_Condition;
 	information = DIA_NASZ_112_Peter_walka_Info;
 	permanent   = FALSE;
 	description = "Nie wygl¹dasz na dobrego wojownika.";
};

FUNC INT DIA_NASZ_112_Peter_walka_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_109_Rethon_presiema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_112_Peter_walka_Info()
{
	AI_Output (other,self ,"DIA_NASZ_112_Peter_walka_15_00"); //Nie wygl¹dasz na dobrego wojownika.
	AI_Output (self, other,"DIA_NASZ_112_Peter_walka_55_01"); //Tak s¹dzisz, hê? Mo¿emy zweryfikowaæ mój wygl¹d. Co powiesz na ma³y pojedynek?
	AI_Output (other, self,"DIA_NASZ_112_Peter_walka_55_02"); //Dok³adnie o to mi chodzi³o. Broñ siê!

	AI_StopProcessInfos (self);
	B_Attack  (self, other, AR_NONE, 1);
};

//*********************************************************************
//	Info PoWalce
//*********************************************************************
INSTANCE DIA_NASZ_112_Peter_PoWalce   (C_INFO)
{
	npc         = NASZ_112_Peter;
 	nr          = 5;
 	condition   = DIA_NASZ_112_Peter_PoWalce_Condition;
 	information = DIA_NASZ_112_Peter_PoWalce_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_112_Peter_PoWalce_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_112_Peter_walka)
		&& ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) || (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_112_Peter_PoWalce_Info()
{
	PhillPojedynek_Done = TRUE;

	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) {
		AI_Output (self, other,"DIA_NASZ_112_Peter_PoWalce_15_00"); //Dobra, ju¿ dobra, jesteœ lepszy ode mnie.
		AI_Output (self, other,"DIA_NASZ_112_Peter_PoWalce_55_01"); //Wiesz co... IdŸ na arenê. Tam spotkasz równych sobie.

		B_LogEntry (TOPIC_Rethon_szkolenie, "Uda³o siê, wygra³em z Peterem.");
		B_GivePlayerXP (200);
	}
	else {
		AI_Output (self, other,"DIA_NASZ_112_Peter_PoWalce_15_02"); //Nastêpnym razem nie zadzieraj sobie ze mn¹, ch³optasiu.

		B_LogEntry (TOPIC_Rethon_szkolenie, "Cholera, Peter mnie pokona³.");
	};

};

//*********************************************************************
//	Info InTwierdza
//*********************************************************************
INSTANCE DIA_NASZ_112_Peter_InTwierdza   (C_INFO)
{
	npc         = NASZ_112_Peter;
 	nr          = 31;
 	condition   = DIA_NASZ_112_Peter_InTwierdza_Condition;
 	information = DIA_NASZ_112_Peter_InTwierdza_Info;
 	permanent   = TRUE;
	description = "Czy¿by pierwsza powa¿na misja?";
};

FUNC INT DIA_NASZ_112_Peter_InTwierdza_Condition()	
{
	if (KAPITEL == 3) && (Npc_GetDistToWP	(self, "OW_PATH_189") < 750) && !(npc_knowsinfo (other, DIA_NASZ_412_CatSan_UrShackKilled))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_112_Peter_InTwierdza_Info()
{
	AI_Output (other, self,"DIA_NASZ_112_Peter_InTwierdza_55_00"); //Czy¿by pierwsza powa¿na misja?
	AI_Output (self, other,"DIA_NASZ_112_Peter_InTwierdza_55_01"); //Najwy¿sza pora! Du¿o trenowa³em i jestem gotów stawiæ czo³a orkom.

};

//*********************************************************************
//	Info InTwierdzaHurt
//*********************************************************************
INSTANCE DIA_NASZ_112_Peter_InTwierdzaHurt   (C_INFO)
{
	npc         = NASZ_112_Peter;
 	nr          = 32;
 	condition   = DIA_NASZ_112_Peter_InTwierdzaHurt_Condition;
 	information = DIA_NASZ_112_Peter_InTwierdzaHurt_Info;
 	permanent   = TRUE;
	description = "Jak czujesz siê po walce?";
};

FUNC INT DIA_NASZ_112_Peter_InTwierdzaHurt_Condition()	
{
	if (KAPITEL == 3) && (npc_knowsinfo (other, DIA_NASZ_412_CatSan_UrShackKilled))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_112_Peter_InTwierdzaHurt_Info()
{
	AI_Output (other, self,"DIA_NASZ_112_Peter_InTwierdzaHurt_55_00"); //Jak czujesz siê po walce?
	AI_Output (self, other,"DIA_NASZ_112_Peter_InTwierdzaHurt_55_01"); //Nadal ¿yjê. Oberwa³em strza³¹ od kusznika podczas pierwszego ataku.
	AI_Output (self, other,"DIA_NASZ_112_Peter_InTwierdzaHurt_55_02"); //Dziêki opiece Johny'ego powoli dochodzê do siebie.
	

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_112_Peter_PICKPOCKET (C_INFO)
{
	npc			= NASZ_112_Peter;
	nr			= 900;
	condition	= DIA_NASZ_112_Peter_PICKPOCKET_Condition;
	information	= DIA_NASZ_112_Peter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_112_Peter_PICKPOCKET_Condition()
{
	C_Beklauen (38);
};
 
FUNC VOID DIA_NASZ_112_Peter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_112_Peter_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_112_Peter_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_112_Peter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_112_Peter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_112_Peter_PICKPOCKET_DoIt);
};

func void DIA_NASZ_112_Peter_PICKPOCKET_DoIt()
{
	B_BeklauenGold(32);
	Info_ClearChoices (DIA_NASZ_112_Peter_PICKPOCKET);
};
	
func void DIA_NASZ_112_Peter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_112_Peter_PICKPOCKET);
};

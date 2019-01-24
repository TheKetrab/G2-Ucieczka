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
	AI_Output (self, other,"DIA_NASZ_112_Peter_hello_55_00"); //Hej, nie widzia�em ci� tu wcze�niej. Kim jeste�?
	AI_Output (other, self,"DIA_NASZ_112_Peter_hello_15_01"); //Jestem, to znaczy by�em, kopaczem. Nazywam si� Will.

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
 	description = "Czym si� tutaj zajmujesz?";
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
	AI_Output (other,self ,"DIA_NASZ_112_Peter_what_15_00"); //Czym si� tutaj zajmujesz?
	AI_Output (self, other,"DIA_NASZ_112_Peter_what_55_01"); //Trenuj�. Keroloth niedawno mianowa� mnie wojownikiem, da� pancerz i miecz.
	AI_Output (self, other,"DIA_NASZ_112_Peter_what_55_02"); //Podobnie jak ty, jeszcze dwa tygodnie temu by�em kopaczem.

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
 	description = "Nie wygl�dasz na dobrego wojownika.";
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
	AI_Output (other,self ,"DIA_NASZ_112_Peter_walka_15_00"); //Nie wygl�dasz na dobrego wojownika.
	AI_Output (self, other,"DIA_NASZ_112_Peter_walka_55_01"); //Tak s�dzisz, h�? Mo�emy zweryfikowa� m�j wygl�d. Co powiesz na ma�y pojedynek?
	AI_Output (other, self,"DIA_NASZ_112_Peter_walka_55_02"); //Dok�adnie o to mi chodzi�o. Bro� si�!

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
		AI_Output (self, other,"DIA_NASZ_112_Peter_PoWalce_15_00"); //Dobra, ju� dobra, jeste� lepszy ode mnie.
		AI_Output (self, other,"DIA_NASZ_112_Peter_PoWalce_55_01"); //Wiesz co... Id� na aren�. Tam spotkasz r�wnych sobie.

		B_LogEntry (TOPIC_Rethon_szkolenie, "Uda�o si�, wygra�em z Peterem.");
		B_GivePlayerXP (200);
	}
	else {
		AI_Output (self, other,"DIA_NASZ_112_Peter_PoWalce_15_02"); //Nast�pnym razem nie zadzieraj sobie ze mn�, ch�optasiu.

		B_LogEntry (TOPIC_Rethon_szkolenie, "Cholera, Peter mnie pokona�.");
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
	description = "Czy�by pierwsza powa�na misja?";
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
	AI_Output (other, self,"DIA_NASZ_112_Peter_InTwierdza_55_00"); //Czy�by pierwsza powa�na misja?
	AI_Output (self, other,"DIA_NASZ_112_Peter_InTwierdza_55_01"); //Najwy�sza pora! Du�o trenowa�em i jestem got�w stawi� czo�a orkom.

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
	description = "Jak czujesz si� po walce?";
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
	AI_Output (other, self,"DIA_NASZ_112_Peter_InTwierdzaHurt_55_00"); //Jak czujesz si� po walce?
	AI_Output (self, other,"DIA_NASZ_112_Peter_InTwierdzaHurt_55_01"); //Nadal �yj�. Oberwa�em strza�� od kusznika podczas pierwszego ataku.
	AI_Output (self, other,"DIA_NASZ_112_Peter_InTwierdzaHurt_55_02"); //Dzi�ki opiece Johny'ego powoli dochodz� do siebie.
	

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

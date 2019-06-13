//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_204_Vick_EXIT   (C_INFO)
{
	npc         = NASZ_204_Vick;
	nr          = 999;
	condition   = DIA_NASZ_204_Vick_EXIT_Condition;
	information = DIA_NASZ_204_Vick_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_204_Vick_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_204_Vick_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_204_Vick_siema   (C_INFO)
{
	npc         = NASZ_204_Vick;
 	nr          = 1;
 	condition   = DIA_NASZ_204_Vick_siema_Condition;
 	information = DIA_NASZ_204_Vick_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_204_Vick_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_204_Vick_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_204_Vick_siema_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_NASZ_204_Vick_siema_55_01"); //Nawet nie pytaj. Kiedy b�l w ko�ciach dokucza bardziej ni� g��d, zaczynasz rozumie�, co jest najwa�niejsze dla cz�owieka.
	AI_Output (self, other,"DIA_NASZ_204_Vick_siema_55_02"); //Staro�� nie rado��, m�odzie�cze. Ale co tam, pewnie i tak nie do�yjesz s�dziwego wieku. G�rnicza Dolina poch�onie nas wszystkich.		
};

//*********************************************************************
//	Info Stary
//*********************************************************************
INSTANCE DIA_NASZ_204_Vick_stary   (C_INFO)
{
	npc         = NASZ_204_Vick;
 	nr          = 2;
 	condition   = DIA_NASZ_204_Vick_stary_Condition;
 	information = DIA_NASZ_204_Vick_stary_Info;
 	permanent   = FALSE;
 	description = "Mog� ci jako� pom�c?";
};

FUNC INT DIA_NASZ_204_Vick_stary_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_204_Vick_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_204_Vick_stary_Info()
{
	AI_Output (other,self ,"DIA_NASZ_204_Vick_stary_15_00"); //Mog� ci jako� pom�c?
	AI_Output (self, other,"DIA_NASZ_204_Vick_stary_55_01"); //Oj w�tpi�. Jedyne czego potrzebuj�, to powr�t do obozu. To by�a ju� chyba ostatnia wyprawa, do kt�rej si� za�apa�em.
	AI_Output (self, other,"DIA_NASZ_204_Vick_stary_55_02"); //Koniecznie potrzebuj� glebn�� si� na ��ko i solidnie wypocz��. Mo�e Kirgo sporz�dzi dla mnie jaki� zio�owy nap�j, po kt�rym wr�c� mi si�y.		
};

//*********************************************************************
//	         Mieso
//*********************************************************************
INSTANCE DIA_NASZ_204_Vick_mieso   (C_INFO)
{
	npc         = NASZ_204_Vick;
 	nr          = 3;
 	condition   = DIA_NASZ_204_Vick_mieso_Condition;
 	information = DIA_NASZ_204_Vick_mieso_Info;
 	permanent   = FALSE;
 	description = "Masz ochot� na powr�t do obozu?";
};

FUNC INT DIA_NASZ_204_Vick_mieso_Condition()	
{
	if ((npc_knowsinfo (other, DIA_NASZ_204_Vick_stary))
	&& (ERAK_GOOD_LEVEL == TRUE))

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_204_Vick_mieso_Info()
{
	AI_Output (other,self ,"DIA_NASZ_204_Vick_mieso_15_00"); //Masz ochot� na powr�t do obozu?
	AI_Output (self, other,"DIA_NASZ_204_Vick_mieso_55_01"); //Pewnie! Poszed�bym ju� dawno, ale samotna podr� jest zbyt niebezpieczna. Nie chc� umiera� w cierpieniach z odgryzion� nog�.
	AI_Output (other,self ,"DIA_NASZ_204_Vick_mieso_15_02"); //Bierz wi�c mi�so, kt�re mieli�cie dostarczy� do obozu i w drog�.
	AI_Output (self, other,"DIA_NASZ_204_Vick_mieso_55_03"); //Dobrze. Id� i powiedz Erakowi, �e wyruszamy.

	AI_StopProcessInfos(self);
	B_LogEntry (TOPIC_Erak_mieso, "Vick zgodzi� si� zanie�� mi�so do obozu. Musz� powiadomi� o tym Eraka.");

};

//*********************************************************************
//	         Zgoda
//*********************************************************************
INSTANCE DIA_NASZ_204_Vick_zgoda   (C_INFO)
{
	npc         = NASZ_204_Vick;
 	nr          = 4;
 	condition   = DIA_NASZ_204_Vick_zgoda_Condition;
 	information = DIA_NASZ_204_Vick_zgoda_Info;
 	permanent   = FALSE;
 	description = "Erak wyrazi� zgod�.";
};

FUNC INT DIA_NASZ_204_Vick_zgoda_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_201_Erak_how))

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_204_Vick_zgoda_Info()
{
	AI_Output (other,self ,"DIA_NASZ_204_Vick_zgoda_15_00"); //Erak wyrazi� zgod�.
	AI_Output (self, other,"DIA_NASZ_204_Vick_zgoda_55_01"); //Wzi��em dwie�cie sztuk sma�onego mi�sa. Paczka troch� wa�y, a bieg z pewno�ci� okropnie mnie zm�czy.
	AI_Output (self, other,"DIA_NASZ_204_Vick_zgoda_55_02"); //Lepiej b�dzie, jak nie b�dziesz mnie wyprzedza� i utrzymasz moje tempo.

	Npc_ExchangeRoutine (self, "GuideA");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_204_Vick,1);
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_WATERFALL_GOBBO10_01"); 
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_WATERFALL_GOBBO10_02"); 
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_WATERFALL_GOBBO10_03"); 
	Wld_InsertNpc	(Molerat,"FP_ROAM_OW_WATERFALL_GOBBO10_04"); 

	Wld_InsertNpc	(YGiant_Rat,"NASZ_FP_VICK_A");	
	Wld_InsertNpc	(Giant_Rat,"NASZ_FP_VICK_B");	
	Wld_InsertNpc	(YGiant_Rat,"NASZ_FP_VICK_C");	
	Wld_InsertNpc	(YGiant_Rat,"NASZ_FP_VICK_D");	
	
	Wld_InsertNpc	(Molerat,"NASZ_FP_VICK_E");
	Wld_InsertNpc	(Molerat,"NASZ_FP_VICK_F");
	Wld_InsertNpc	(Molerat,"NASZ_FP_VICK_G");
};

//*********************************************************************
//	         FirstStop
//*********************************************************************
INSTANCE DIA_NASZ_204_Vick_FirstStop   (C_INFO)
{
	npc         = NASZ_204_Vick;
 	nr          = 5;
 	condition   = DIA_NASZ_204_Vick_FirstStop_Condition;
 	information = DIA_NASZ_204_Vick_FirstStop_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_204_Vick_FirstStop_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_204_Vick_zgoda)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"SPAWN_OW_BLOODFLY_OC_PSI"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_204_Vick_FirstStop_Info()
{

	AI_Output (self, other,"DIA_NASZ_204_Vick_FirstStop_55_00"); //Du�o bestii na nas czyha�o. Widocznie zapach mi�sa je przyci�ga.
	AI_Output (other,self ,"DIA_NASZ_204_Vick_FirstStop_15_01"); //Zabi�em ju� ich do�� du�o. Dalej mam i�� z wyci�gni�tym mieczem?
	AI_Output (self, other,"DIA_NASZ_204_Vick_FirstStop_55_02"); //Zaraz znajdziemy si� na ziemiach ork�w. Teraz to powinni�my bra� nogi za pas!

	Npc_ExchangeRoutine (self, "GuideB");
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(OrcWarrior_Harad,"NASZ_FP_VICK_H");
	//Wld_InsertNpc	(OrcWarrior_Harad,"NASZ_FP_VICK_I");
};

//*********************************************************************
//	         SecondStop
//*********************************************************************
INSTANCE DIA_NASZ_204_Vick_SecondStop   (C_INFO)
{
	npc         = NASZ_204_Vick;
 	nr          = 6;
 	condition   = DIA_NASZ_204_Vick_SecondStop_Condition;
 	information = DIA_NASZ_204_Vick_SecondStop_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_204_Vick_SecondStop_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_204_Vick_FirstStop)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_02_01"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_204_Vick_SecondStop_Info()
{

	AI_Output (self, other,"DIA_NASZ_204_Vick_SecondStop_55_00"); //Jeste�my. Wielkie dzi�ki za pomoc w dostarczeniu mi�sa.
	AI_Output (other,self ,"DIA_NASZ_204_Vick_SecondStop_15_01"); //Tak, wiem, moja ochrona by�a bezcenna. Mo�e jaka� nagroda?
	AI_Output (self, other,"DIA_NASZ_204_Vick_SecondStop_55_02"); //My�lisz o dobrym kawa�ku pieczeni? O nie, nie, nie! Mia�em dostarczy� dwie�cie kawa�k�w i dok�adnie tyle b�dzie. Je�li chcesz z�ota, to id� do Gestatha.

	Log_SetTopicStatus (TOPIC_Erak_mieso, LOG_SUCCESS);
	B_LogEntry (TOPIC_Erak_mieso, "Mi�so dostarczone. Mog� si� zg�osi� do Gestatha po par� sztuk z�ota.");
	B_GivePlayerXP (300);
	DodajReputacje (2, REP_MYSLIWI);

	Npc_ExchangeRoutine (self, "START");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_204_Vick,0);
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_204_Vick_HowAreYou   (C_INFO)
{
	npc         = NASZ_204_Vick;
 	nr          = 500;
 	condition   = DIA_NASZ_204_Vick_HowAreYou_Condition;
 	information = DIA_NASZ_204_Vick_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak si� czujesz, starcze?";
};

FUNC INT DIA_NASZ_204_Vick_HowAreYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_204_Vick_SecondStop))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_204_Vick_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_204_Vick_HowAreYou_15_00"); //Jak si� czujesz, starcze?
	AI_Output (self, other,"DIA_NASZ_204_Vick_HowAreYou_55_01"); //Kiedy� by�em taki jak ty. M�ody, silny i ch�tny przyg�d. Teraz pozosta�o mi ju� tylko umrze�.
	AI_Output (self, other,"DIA_NASZ_204_Vick_HowAreYou_55_02"); //Szanuj swoje zdrowie, ch�opcze. P�niej nie da si� go ju� odzyska�.

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_204_Vick_PICKPOCKET (C_INFO)
{
	npc			= NASZ_204_Vick;
	nr			= 900;
	condition	= DIA_NASZ_204_Vick_PICKPOCKET_Condition;
	information	= DIA_NASZ_204_Vick_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_204_Vick_PICKPOCKET_Condition()
{
	C_Beklauen (12);
};
 
FUNC VOID DIA_NASZ_204_Vick_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_204_Vick_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_204_Vick_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_204_Vick_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_204_Vick_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_204_Vick_PICKPOCKET_DoIt);
};

func void DIA_NASZ_204_Vick_PICKPOCKET_DoIt()
{
	B_BeklauenGold(33);
	
	Info_ClearChoices (DIA_NASZ_204_Vick_PICKPOCKET);
};
	
func void DIA_NASZ_204_Vick_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_204_Vick_PICKPOCKET);
};
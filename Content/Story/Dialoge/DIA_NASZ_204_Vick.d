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
	AI_Output (other,self ,"DIA_NASZ_204_Vick_siema_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_NASZ_204_Vick_siema_55_01"); //Nawet nie pytaj. Kiedy ból w koœciach dokucza bardziej ni¿ g³ód, zaczynasz rozumieæ, co jest najwa¿niejsze dla cz³owieka.
	AI_Output (self, other,"DIA_NASZ_204_Vick_siema_55_02"); //Staroœæ nie radoœæ, m³odzieñcze. Ale co tam, pewnie i tak nie do¿yjesz sêdziwego wieku. Górnicza Dolina poch³onie nas wszystkich.		
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
 	description = "Mogê ci jakoœ pomóc?";
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
	AI_Output (other,self ,"DIA_NASZ_204_Vick_stary_15_00"); //Mogê ci jakoœ pomóc?
	AI_Output (self, other,"DIA_NASZ_204_Vick_stary_55_01"); //Oj w¹tpiê. Jedyne czego potrzebujê, to powrót do obozu. To by³a ju¿ chyba ostatnia wyprawa, do której siê za³apa³em.
	AI_Output (self, other,"DIA_NASZ_204_Vick_stary_55_02"); //Koniecznie potrzebujê glebn¹æ siê na ³ó¿ko i solidnie wypocz¹æ. Mo¿e Kirgo sporz¹dzi dla mnie jakiœ zio³owy napój, po którym wróc¹ mi si³y.		
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
 	description = "Masz ochotê na powrót do obozu?";
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
	AI_Output (other,self ,"DIA_NASZ_204_Vick_mieso_15_00"); //Masz ochotê na powrót do obozu?
	AI_Output (self, other,"DIA_NASZ_204_Vick_mieso_55_01"); //Pewnie! Poszed³bym ju¿ dawno, ale samotna podró¿ jest zbyt niebezpieczna. Nie chcê umieraæ w cierpieniach z odgryzion¹ nog¹.
	AI_Output (other,self ,"DIA_NASZ_204_Vick_mieso_15_02"); //Bierz wiêc miêso, które mieliœcie dostarczyæ do obozu i w drogê.
	AI_Output (self, other,"DIA_NASZ_204_Vick_mieso_55_03"); //Dobrze. IdŸ i powiedz Erakowi, ¿e wyruszamy.

	AI_StopProcessInfos(self);
	B_LogEntry (TOPIC_Erak_mieso, "Vick zgodzi³ siê zanieœæ miêso do obozu. Muszê powiadomiæ o tym Eraka.");

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
 	description = "Erak wyrazi³ zgodê.";
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
	AI_Output (other,self ,"DIA_NASZ_204_Vick_zgoda_15_00"); //Erak wyrazi³ zgodê.
	AI_Output (self, other,"DIA_NASZ_204_Vick_zgoda_55_01"); //Wzi¹³em dwieœcie sztuk sma¿onego miêsa. Paczka trochê wa¿y, a bieg z pewnoœci¹ okropnie mnie zmêczy.
	AI_Output (self, other,"DIA_NASZ_204_Vick_zgoda_55_02"); //Lepiej bêdzie, jak nie bêdziesz mnie wyprzedza³ i utrzymasz moje tempo.

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

	AI_Output (self, other,"DIA_NASZ_204_Vick_FirstStop_55_00"); //Du¿o bestii na nas czyha³o. Widocznie zapach miêsa je przyci¹ga.
	AI_Output (other,self ,"DIA_NASZ_204_Vick_FirstStop_15_01"); //Zabi³em ju¿ ich doœæ du¿o. Dalej mam iœæ z wyci¹gniêtym mieczem?
	AI_Output (self, other,"DIA_NASZ_204_Vick_FirstStop_55_02"); //Zaraz znajdziemy siê na ziemiach orków. Teraz to powinniœmy braæ nogi za pas!

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

	AI_Output (self, other,"DIA_NASZ_204_Vick_SecondStop_55_00"); //Jesteœmy. Wielkie dziêki za pomoc w dostarczeniu miêsa.
	AI_Output (other,self ,"DIA_NASZ_204_Vick_SecondStop_15_01"); //Tak, wiem, moja ochrona by³a bezcenna. Mo¿e jakaœ nagroda?
	AI_Output (self, other,"DIA_NASZ_204_Vick_SecondStop_55_02"); //Myœlisz o dobrym kawa³ku pieczeni? O nie, nie, nie! Mia³em dostarczyæ dwieœcie kawa³ków i dok³adnie tyle bêdzie. Jeœli chcesz z³ota, to idŸ do Gestatha.

	Log_SetTopicStatus (TOPIC_Erak_mieso, LOG_SUCCESS);
	B_LogEntry (TOPIC_Erak_mieso, "Miêso dostarczone. Mogê siê zg³osiæ do Gestatha po parê sztuk z³ota.");
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
 	description = "Jak siê czujesz, starcze?";
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
	AI_Output (other, self,"DIA_NASZ_204_Vick_HowAreYou_15_00"); //Jak siê czujesz, starcze?
	AI_Output (self, other,"DIA_NASZ_204_Vick_HowAreYou_55_01"); //Kiedyœ by³em taki jak ty. M³ody, silny i chêtny przygód. Teraz pozosta³o mi ju¿ tylko umrzeæ.
	AI_Output (self, other,"DIA_NASZ_204_Vick_HowAreYou_55_02"); //Szanuj swoje zdrowie, ch³opcze. PóŸniej nie da siê go ju¿ odzyskaæ.

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
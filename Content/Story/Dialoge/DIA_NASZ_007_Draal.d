func void ApplyDraalArmor() {

	if (Npc_GetDistToNPC(hero,NASZ_007_Draal) < 1500) {
		AI_EquipBestArmor (NASZ_007_Draal);
		AI_EquipBestRangedWeapon(NASZ_007_Draal);
		AI_EquipBestMeleeWeapon(NASZ_007_Draal);
		ff_remove(ApplyDraalArmor);
	};
};

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_EXIT   (C_INFO)
{
	npc         = NASZ_007_Draal;
	nr          = 999;
	condition   = DIA_NASZ_007_Draal_EXIT_Condition;
	information = DIA_NASZ_007_Draal_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_007_Draal_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_007_Draal_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_siema   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 1;
 	condition   = DIA_NASZ_007_Draal_siema_Condition;
 	information = DIA_NASZ_007_Draal_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_007_Draal_siema_Condition()
{
	return TRUE;

};

FUNC VOID DIA_NASZ_007_Draal_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_55_00"); //Na Innosa! Czy¿bym by³ uratowany?
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_55_01"); //Nie wygl¹dasz na bandytê. A nawet jeœli, to uprzedzam: Nie mam nic, co mog³oby ci siê przydaæ, a zabijaj¹c mnie te¿ niczego nie zyskasz!

	Log_CreateTopic (TOPIC_draal, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_draal, LOG_RUNNING);
	B_LogEntry (TOPIC_draal, "Znalaz³em jakiegoœ skazañca w kopalni.");

	Info_ClearChoices (DIA_NASZ_007_Draal_siema);

		Info_AddChoice	  (DIA_NASZ_007_Draal_siema, "Nie bój siê. Chcê ci pomóc.", DIA_NASZ_007_Draal_siema_yes);
		Info_AddChoice	  (DIA_NASZ_007_Draal_siema, "Ka¿dy ma coœ, co mo¿na mu zabraæ.", DIA_NASZ_007_Draal_siema_no);

};

FUNC VOID DIA_NASZ_007_Draal_siema_yes()
{
	AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_yes_15_00"); //Nie bój siê. Chcê ci pomóc.
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_yes_55_01"); //Uratujesz mnie? Jak mnie znalaz³eœ?
	
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_mine)) {
		AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_yes_15_02"); //Przyszed³em tu z cz³owiekiem imieniem Korth.
	}
	else {
		AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_yes_15_03"); //Krêci³em siê w pobli¿u i postanowi³em przeszukaæ tê kopalniê.
	};

	AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_yes_15_04"); //Ale umówmy siê, ¿e to ty bêdziesz odpowiada³ na moje pytania.
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_yes_55_05"); //Jasne.

	Info_ClearChoices (DIA_NASZ_007_Draal_siema);
};

FUNC VOID DIA_NASZ_007_Draal_siema_no()
{
	AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_no_15_00"); //Ka¿dy ma coœ, co mo¿na mu zabraæ.
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_no_55_01"); //Ju¿ mówi³em, ¿e nie mam niczego! Myœlisz, ¿e co chowam w kieszeniach? Kawa³ek szmatki, do którego mogê wydmuchaæ nos. Pe³no tutaj py³u!
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_no_55_02"); //Jeœli tak bardzo chcesz sobie st¹d coœ zabraæ, to ³ap za kilof i spróbuj wykopaæ resztki magicznej rudy.

	Info_ClearChoices (DIA_NASZ_007_Draal_siema);
};


//*********************************************************************
//	Info Robisz
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_robisz   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 2;
 	condition   = DIA_NASZ_007_Draal_robisz_Condition;
 	information = DIA_NASZ_007_Draal_robisz_Info;
 	permanent   = FALSE;
	description = "Co ty tutaj robisz?";
};

FUNC INT DIA_NASZ_007_Draal_robisz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_007_Draal_robisz_Info()
{
	AI_Output (other, self,"DIA_NASZ_007_Draal_robisz_15_00"); //Co ty tutaj robisz?
	AI_Output (self, other,"DIA_NASZ_007_Draal_robisz_55_01"); //No jak to co? Ukrywam siê! Chwa³a niech bêdzie Innosowi, ¿e to ty znalaz³eœ mnie pierwszy, a nie ci przeklêci orkowie.

};

//*********************************************************************
//	Info Dosta³eœ
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_dostales   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 3;
 	condition   = DIA_NASZ_007_Draal_dostales_Condition;
 	information = DIA_NASZ_007_Draal_dostales_Info;
 	permanent   = FALSE;
	description = "Jak siê tutaj dosta³eœ?";
};

FUNC INT DIA_NASZ_007_Draal_dostales_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_007_Draal_dostales_Info()
{
	AI_Output (other, self,"DIA_NASZ_007_Draal_dostales_15_00"); //Jak siê tutaj dosta³eœ?
	AI_Output (self, other,"DIA_NASZ_007_Draal_dostales_55_01"); //Kiedy orkowie wtargnêli do zamku, wyskoczy³em przez okno wiêzienne.
	AI_Output (self, other,"DIA_NASZ_007_Draal_dostales_55_02"); //Pobieg³em tutaj z nadziej¹, ¿e spotkam kogoœ ¿ywego, a przede wszystkim liczy³em na ochronê ze strony rycerzy.
	AI_Output (other, self,"DIA_NASZ_007_Draal_dostales_15_03"); //Czy gdy tu przyby³eœ, spotka³eœ jakichœ ludzi?
	AI_Output (self, other,"DIA_NASZ_007_Draal_dostales_55_04"); //Nie, same trupy... Zrobi³em tu wiêkszy ba³agan, ¿eby orkowie nie pomyœleli sobie czasem, ¿e ktoœ tu jeszcze jest.
};

//*********************************************************************
//	Info Prison
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_prison   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 4;
 	condition   = DIA_NASZ_007_Draal_prison_Condition;
 	information = DIA_NASZ_007_Draal_prison_Info;
 	permanent   = FALSE;
	description = "Powiedzia³eœ, ¿e uciek³eœ przez okno wiêzienne...";
};

FUNC INT DIA_NASZ_007_Draal_prison_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_dostales))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_007_Draal_prison_Info()
{
	AI_Output (other, self,"DIA_NASZ_007_Draal_prison_15_00"); //Powiedzia³eœ, ¿e uciek³eœ przez okno wiêzienne...
	AI_Output (self, other,"DIA_NASZ_007_Draal_prison_55_01"); //Yy... Tak. Bo tak w³aœnie by³o. By³em wiêŸniem.
	AI_Output (other, self,"DIA_NASZ_007_Draal_prison_15_02"); //Ale czy przypadkiem to okno nie mia³o krat?
	AI_Output (self, other,"DIA_NASZ_007_Draal_prison_55_03"); //Ci¹³em je przez kilka dni kamyczkami. Takimi ma³ymi... Le¿a³y na ziemi.
	AI_Output (self, other,"DIA_NASZ_007_Draal_prison_55_04"); //Mia³em wielkie szczêœcie, ¿e skoñczy³em akurat w dniu szturmu orków. Jeszcze raz: Dziêki niech bêd¹ Innosowi!
};


//*********************************************************************
//	Info Go
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_go   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 6;
 	condition   = DIA_NASZ_007_Draal_go_Condition;
 	information = DIA_NASZ_007_Draal_go_Info;
 	permanent   = FALSE;
	description = "Moim zadaniem jest ciê st¹d zabraæ.";
};

FUNC INT DIA_NASZ_007_Draal_go_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_007_Draal_go_Info()
{
	AI_Output (other, self,"DIA_NASZ_007_Draal_go_15_00"); //Moim zadaniem jest ciê st¹d zabraæ.
	AI_Output (self, other,"DIA_NASZ_007_Draal_go_55_01"); //Dok¹d?
	AI_Output (other, self,"DIA_NASZ_007_Draal_go_15_02"); //To zale¿y od ciebie. Wolisz obóz ³owców orków czy myœliwych?
	AI_Output (self, other,"DIA_NASZ_007_Draal_go_55_03"); //Orków mam serdecznie doœæ. A obóz myœliwych? Byleby by³o tam co jeœæ i ¿ebym mia³ gdzie spaæ.
	AI_Output (self, other,"DIA_NASZ_007_Draal_go_55_04"); //ZaprowadŸ mnie do obozu myœliwych.

	B_LogEntry (TOPIC_draal, "Draal chce, ¿ebym zaprowadzi³ go do obozu myœliwych.");

};

//*********************************************************************
//	Info Lets
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_lets   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 7;
 	condition   = DIA_NASZ_007_Draal_lets_Condition;
 	information = DIA_NASZ_007_Draal_lets_Info;
 	permanent   = FALSE;
	description = "ChodŸ za mn¹.";
};

FUNC INT DIA_NASZ_007_Draal_lets_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_go))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_007_Draal_lets_Info()
{
	AI_Output (other, self,"DIA_NASZ_007_Draal_lets_15_00"); //ChodŸ za mn¹.
	AI_Output (self, other,"DIA_NASZ_007_Draal_lets_55_01"); //Tylko mi nie uciekaj. Jestem zmêczony i wyg³odzony, wiêc nie mam zbyt wiele si³, by szybko biegaæ.

	Npc_ExchangeRoutine (NASZ_214_Goth, "Wait4Draal");
	
	Npc_ExchangeRoutine (self, "Follow");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_007_Draal,1);
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(OrcWarrior_Harad,"FP_ORC_MINE_DRAAL_A"); 
	Wld_InsertNpc	(OrcWarrior_Harad,"FP_ORC_MINE_DRAAL_B"); 
};

//*********************************************************************
//	Info Done
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_done   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 8;
 	condition   = DIA_NASZ_007_Draal_done_Condition;
 	information = DIA_NASZ_007_Draal_done_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_007_Draal_done_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_lets)
		&& npc_knowsinfo (other, DIA_NASZ_214_Goth_draal)
		&& (Npc_GetDistToWP	(self, "LOCATION_02_03") < 1000))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_007_Draal_done_Info()
{
	AI_Output (self, other,"DIA_NASZ_007_Draal_done_55_00"); //Na Innosa... ¯yjê!
	AI_Output (other, self,"DIA_NASZ_007_Draal_done_15_01"); //IdŸ zaraz do Gestatha. Przesiaduje przewa¿nie w jaskini. Chyba znajdzie tu dla ciebie jakieœ zajêcie.
	AI_Output (self, other,"DIA_NASZ_007_Draal_done_55_02"); //Wielkie dziêki. Nie zapomnê ci tego. W ramach podziêkowañ dam ci ma³¹ wskazówkê: Dobry z³odziej musi byæ nie tylko zrêczny, ale i przebieg³y.
	AI_Output (self, other,"DIA_NASZ_007_Draal_done_55_03"); //Kiedy bêdziesz ³apa³ przedmiot, który chcesz ukraœæ, chwyæ go jedn¹ rêk¹, a drug¹ machaj i odwracaj uwagê ofiary. To zawsze pomaga, mo¿esz mi wierzyæ.

	B_RaiseAttribute(other, ATR_DEXTERITY, 2);
	DraalUratowany = TRUE;
	
	Npc_ExchangeRoutine (self, "In");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_007_Draal,0);
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_HowAreYou   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 500;
 	condition   = DIA_NASZ_007_Draal_HowAreYou_Condition;
 	information = DIA_NASZ_007_Draal_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak ci siê tu podoba?";
};

FUNC INT DIA_NASZ_007_Draal_HowAreYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_done))	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_007_Draal_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_007_Draal_HowAreYou_15_00"); //Jak ci siê tu podoba?

	if (KAPITEL < 3)	
	{
		AI_Output (self, other,"DIA_NASZ_007_Draal_HowAreYou_55_01"); //Nie mogê narzekaæ.
		AI_Output (self, other,"DIA_NASZ_007_Draal_HowAreYou_55_02"); //Jestem bezpieczny i orkowie mnie tutaj nie znajd¹.
	}
	else if (KAPITEL == 3)
	{
		AI_Output (self, other,"DIA_NASZ_007_Draal_HowAreYou_55_03"); //Jest coraz mniej bezpiecznie, a stra¿nicy zajmuj¹ siê swoimi sprawami.		
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_007_Draal_HowAreYou_55_04"); //Erak zadecydowa³, ¿eby zamkn¹æ bramê i uwa¿am to za rozs¹dn¹ decyzjê.
	};

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_007_Draal_PICKPOCKET (C_INFO)
{
	npc			= NASZ_007_Draal;
	nr			= 900;
	condition	= DIA_NASZ_007_Draal_PICKPOCKET_Condition;
	information	= DIA_NASZ_007_Draal_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_007_Draal_PICKPOCKET_Condition()
{
	C_Beklauen (73);
};
 
FUNC VOID DIA_NASZ_007_Draal_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_007_Draal_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_007_Draal_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_007_Draal_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_007_Draal_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_007_Draal_PICKPOCKET_DoIt);
};

func void DIA_NASZ_007_Draal_PICKPOCKET_DoIt()
{
	B_BeklauenGold (42);
	Info_ClearChoices (DIA_NASZ_007_Draal_PICKPOCKET);
};
	
func void DIA_NASZ_007_Draal_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_007_Draal_PICKPOCKET);
};

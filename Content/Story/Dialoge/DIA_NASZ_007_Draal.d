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
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_55_00"); //Na Innosa! Czy�bym by� uratowany?
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_55_01"); //Nie wygl�dasz na bandyt�. A nawet je�li, to uprzedzam: Nie mam nic, co mog�oby ci si� przyda�, a zabijaj�c mnie te� niczego nie zyskasz!

	Log_CreateTopic (TOPIC_draal, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_draal, LOG_RUNNING);
	B_LogEntry (TOPIC_draal, "Znalaz�em jakiego� skaza�ca w kopalni.");

	Info_ClearChoices (DIA_NASZ_007_Draal_siema);

		Info_AddChoice	  (DIA_NASZ_007_Draal_siema, "Nie b�j si�. Chc� ci pom�c.", DIA_NASZ_007_Draal_siema_yes);
		Info_AddChoice	  (DIA_NASZ_007_Draal_siema, "Ka�dy ma co�, co mo�na mu zabra�.", DIA_NASZ_007_Draal_siema_no);

};

FUNC VOID DIA_NASZ_007_Draal_siema_yes()
{
	AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_yes_15_00"); //Nie b�j si�. Chc� ci pom�c.
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_yes_55_01"); //Uratujesz mnie? Jak mnie znalaz�e�?
	
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_mine)) {
		AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_yes_15_02"); //Przyszed�em tu z cz�owiekiem imieniem Korth.
	}
	else {
		AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_yes_15_03"); //Kr�ci�em si� w pobli�u i postanowi�em przeszuka� t� kopalni�.
	};

	AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_yes_15_04"); //Ale um�wmy si�, �e to ty b�dziesz odpowiada� na moje pytania.
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_yes_55_05"); //Jasne.

	Info_ClearChoices (DIA_NASZ_007_Draal_siema);
};

FUNC VOID DIA_NASZ_007_Draal_siema_no()
{
	AI_Output (other,self ,"DIA_NASZ_007_Draal_siema_no_15_00"); //Ka�dy ma co�, co mo�na mu zabra�.
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_no_55_01"); //Ju� m�wi�em, �e nie mam niczego! My�lisz, �e co chowam w kieszeniach? Kawa�ek szmatki, do kt�rego mog� wydmucha� nos. Pe�no tutaj py�u!
	AI_Output (self, other,"DIA_NASZ_007_Draal_siema_no_55_02"); //Je�li tak bardzo chcesz sobie st�d co� zabra�, to �ap za kilof i spr�buj wykopa� resztki magicznej rudy.

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
	AI_Output (self, other,"DIA_NASZ_007_Draal_robisz_55_01"); //No jak to co? Ukrywam si�! Chwa�a niech b�dzie Innosowi, �e to ty znalaz�e� mnie pierwszy, a nie ci przekl�ci orkowie.

};

//*********************************************************************
//	Info Dosta�e�
//*********************************************************************
INSTANCE DIA_NASZ_007_Draal_dostales   (C_INFO)
{
	npc         = NASZ_007_Draal;
 	nr          = 3;
 	condition   = DIA_NASZ_007_Draal_dostales_Condition;
 	information = DIA_NASZ_007_Draal_dostales_Info;
 	permanent   = FALSE;
	description = "Jak si� tutaj dosta�e�?";
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
	AI_Output (other, self,"DIA_NASZ_007_Draal_dostales_15_00"); //Jak si� tutaj dosta�e�?
	AI_Output (self, other,"DIA_NASZ_007_Draal_dostales_55_01"); //Kiedy orkowie wtargn�li do zamku, wyskoczy�em przez okno wi�zienne.
	AI_Output (self, other,"DIA_NASZ_007_Draal_dostales_55_02"); //Pobieg�em tutaj z nadziej�, �e spotkam kogo� �ywego, a przede wszystkim liczy�em na ochron� ze strony rycerzy.
	AI_Output (other, self,"DIA_NASZ_007_Draal_dostales_15_03"); //Czy gdy tu przyby�e�, spotka�e� jakich� ludzi?
	AI_Output (self, other,"DIA_NASZ_007_Draal_dostales_55_04"); //Nie, same trupy... Zrobi�em tu wi�kszy ba�agan, �eby orkowie nie pomy�leli sobie czasem, �e kto� tu jeszcze jest.
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
	description = "Powiedzia�e�, �e uciek�e� przez okno wi�zienne...";
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
	AI_Output (other, self,"DIA_NASZ_007_Draal_prison_15_00"); //Powiedzia�e�, �e uciek�e� przez okno wi�zienne...
	AI_Output (self, other,"DIA_NASZ_007_Draal_prison_55_01"); //Yy... Tak. Bo tak w�a�nie by�o. By�em wi�niem.
	AI_Output (other, self,"DIA_NASZ_007_Draal_prison_15_02"); //Ale czy przypadkiem to okno nie mia�o krat?
	AI_Output (self, other,"DIA_NASZ_007_Draal_prison_55_03"); //Ci��em je przez kilka dni kamyczkami. Takimi ma�ymi... Le�a�y na ziemi.
	AI_Output (self, other,"DIA_NASZ_007_Draal_prison_55_04"); //Mia�em wielkie szcz�cie, �e sko�czy�em akurat w dniu szturmu ork�w. Jeszcze raz: Dzi�ki niech b�d� Innosowi!
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
	description = "Moim zadaniem jest ci� st�d zabra�.";
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
	AI_Output (other, self,"DIA_NASZ_007_Draal_go_15_00"); //Moim zadaniem jest ci� st�d zabra�.
	AI_Output (self, other,"DIA_NASZ_007_Draal_go_55_01"); //Dok�d?
	AI_Output (other, self,"DIA_NASZ_007_Draal_go_15_02"); //To zale�y od ciebie. Wolisz ob�z �owc�w ork�w czy my�liwych?
	AI_Output (self, other,"DIA_NASZ_007_Draal_go_55_03"); //Ork�w mam serdecznie do��. A ob�z my�liwych? Byleby by�o tam co je�� i �ebym mia� gdzie spa�.
	AI_Output (self, other,"DIA_NASZ_007_Draal_go_55_04"); //Zaprowad� mnie do obozu my�liwych.

	B_LogEntry (TOPIC_draal, "Draal chce, �ebym zaprowadzi� go do obozu my�liwych.");

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
	description = "Chod� za mn�.";
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
	AI_Output (other, self,"DIA_NASZ_007_Draal_lets_15_00"); //Chod� za mn�.
	AI_Output (self, other,"DIA_NASZ_007_Draal_lets_55_01"); //Tylko mi nie uciekaj. Jestem zm�czony i wyg�odzony, wi�c nie mam zbyt wiele si�, by szybko biega�.

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
	AI_Output (self, other,"DIA_NASZ_007_Draal_done_55_00"); //Na Innosa... �yj�!
	AI_Output (other, self,"DIA_NASZ_007_Draal_done_15_01"); //Id� zaraz do Gestatha. Przesiaduje przewa�nie w jaskini. Chyba znajdzie tu dla ciebie jakie� zaj�cie.
	AI_Output (self, other,"DIA_NASZ_007_Draal_done_55_02"); //Wielkie dzi�ki. Nie zapomn� ci tego. W ramach podzi�kowa� dam ci ma�� wskaz�wk�: Dobry z�odziej musi by� nie tylko zr�czny, ale i przebieg�y.
	AI_Output (self, other,"DIA_NASZ_007_Draal_done_55_03"); //Kiedy b�dziesz �apa� przedmiot, kt�ry chcesz ukra��, chwy� go jedn� r�k�, a drug� machaj i odwracaj uwag� ofiary. To zawsze pomaga, mo�esz mi wierzy�.

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
 	description = "Jak ci si� tu podoba?";
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
	AI_Output (other, self,"DIA_NASZ_007_Draal_HowAreYou_15_00"); //Jak ci si� tu podoba?

	if (KAPITEL < 3)	
	{
		AI_Output (self, other,"DIA_NASZ_007_Draal_HowAreYou_55_01"); //Nie mog� narzeka�.
		AI_Output (self, other,"DIA_NASZ_007_Draal_HowAreYou_55_02"); //Jestem bezpieczny i orkowie mnie tutaj nie znajd�.
	}
	else if (KAPITEL == 3)
	{
		AI_Output (self, other,"DIA_NASZ_007_Draal_HowAreYou_55_03"); //Jest coraz mniej bezpiecznie, a stra�nicy zajmuj� si� swoimi sprawami.		
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_007_Draal_HowAreYou_55_04"); //Erak zadecydowa�, �eby zamkn�� bram� i uwa�am to za rozs�dn� decyzj�.
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

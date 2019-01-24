//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_107_Brutus_EXIT   (C_INFO)
{
	npc         = NASZ_107_Brutus;
	nr          = 999;
	condition   = DIA_NASZ_107_Brutus_EXIT_Condition;
	information = DIA_NASZ_107_Brutus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_107_Brutus_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_107_Brutus_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_107_Brutus_siema   (C_INFO)
{
	npc         = NASZ_107_Brutus;
 	nr          = 1;
 	condition   = DIA_NASZ_107_Brutus_siema_Condition;
 	information = DIA_NASZ_107_Brutus_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_107_Brutus_siema_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_107_Brutus_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_siema_15_00"); //Co robisz?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_siema_55_01"); //Ostrz� miecze wykute przez Jana i dostarczam je Johny'emu.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_siema_55_02"); //Je�li chcesz kupi� co� porz�dnego, zapraszam w�a�nie do niego.
};

//*********************************************************************
//	Info Jak
//*********************************************************************
INSTANCE DIA_NASZ_107_Brutus_jak   (C_INFO)
{
	npc         = NASZ_107_Brutus;
 	nr          = 2;
 	condition   = DIA_NASZ_107_Brutus_jak_Condition;
 	information = DIA_NASZ_107_Brutus_jak_Info;
 	permanent   = FALSE;
 	description = "Jak si� tu znalaz�e�?";
};

FUNC INT DIA_NASZ_107_Brutus_jak_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_107_Brutus_jak_Info()
{
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_00"); //Jak si� tu znalaz�e�?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_01"); //Uciek�em z zamku przed tymi kud�atymi bestiami, pot�nej postury i wzrosu. By�y ich tam ca�e stada, atakowa�y mnie!
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_02"); //O jakich bestiach m�wisz? Co takie gro�nego mog�o si� kry� na zamku?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_03"); //Przed Chrz�szczami, fuj! Nienawidz� tych stworze�, widzia�e�, jakie s� ogromne i w�ochate?
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_04"); //Oj Brutusie, przecie� one s� takie ma�e, a ty taki du�y, nie roz�mieszaj si�! Mo�esz je spokojnie rozgnie�� swoj� stop�.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_05"); //Gdyby� tylko widzia�, jak one na mnie patrzy�y, by�em pewien, �e chcia�y mnie zje��. Nie mia�em innego wyj�cia.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_06"); //Mog�em zosta� z moj� star�, to by� jej przysmak. Nigdy w okresie naszego ma��e�stwa nie znalaz�em chrz�szcza pod ��kiem...
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_07"); //Ale wracaj�c do tego, jak tutaj dotar�em. W p�niejszym okresie ukry�em si� w jakiej jaskini.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_08"); //Ca�e szcz�cie, �e nie by�o w niej tych paskudnych stworze�. Chcia�em jako� dosta� si� na prze��cz i wr�ci� do Khorinis.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_09"); //Kt�rego� dnia rozleg�o si� pot�ne trz�sienie ziemi. Wyszed�em, by to sprawdzi� i zobaczy�em ork�w.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_10"); //Dobrze, �e znalaz� mnie Korth. Gdyby nie on, nie odwa�y�bym si� wyj�� z mojej kryj�wki.
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_11"); //Uwa�aj, chrz�szcz za tob�!
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_12"); //Co? Gdzie?! Spadam st�d!
	
	AI_TurnAway (self,hero);
	
	//Przewraca si� Brutus
	AI_PlayAni(self,"T_FALLB_2_FALLENB");
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_13"); //Dos�ownie, m�j przyjacielu, dos�ownie. A teraz wstawaj, nabra�em ci�! (�miech)
	AI_Wait(self,1);
	if(!AniIsActive(self,"T_FALLB_2_FALLENB"))
	{
		//Wstaje
		AI_PlayAni			(self, "T_VICTIM_SLE_2_STAND");
		
		if(!AniIsActive(self,"T_VICTIM_SLE_2_STAND"))
		{
			AI_TurnToNpc(self,hero);
			AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_14"); //Bardzo �mieszne, bardzo �mieszne!
		}; 
	};
	AI_StopProcessInfos (self);
	
};


//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_107_Brutus_goth   (C_INFO)
{
	npc         = NASZ_107_Brutus;
 	nr          = 3;
 	condition   = DIA_NASZ_107_Brutus_goth_Condition;
 	information = DIA_NASZ_107_Brutus_goth_Info;
 	permanent   = FALSE;
	description = "Czy to prawda, �e kto� okrad� my�liwych?";
};

FUNC INT DIA_NASZ_107_Brutus_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_107_Brutus_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_107_Brutus_goth_15_00"); //Czy to prawda, �e kto� okrad� my�liwych?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_goth_55_01"); //Ja tam nie wiem. Nikt mi o tym nie wspomina�.

	B_LogEntry (TOPIC_Goth_kradziez, "Brutus nie jest zbyt zorientowany w ca�ej sprawie. Nic nie wiedzia�.");

};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_107_Brutus_HowAreYou   (C_INFO)
{
	npc         = NASZ_107_Brutus;
 	nr          = 500;
 	condition   = DIA_NASZ_107_Brutus_HowAreYou_Condition;
 	information = DIA_NASZ_107_Brutus_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak si� masz?";
};

FUNC INT DIA_NASZ_107_Brutus_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_107_Brutus_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_107_Brutus_HowAreYou_15_00"); //Jak si� masz?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_HowAreYou_55_01"); //Po ca�ym dniu pracy jestem wyko�czony.	
	AI_Output (self, other,"DIA_NASZ_107_Brutus_HowAreYou_55_02"); //Brakuje mi si� na wieczorne chla�sko w karczmie.

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_107_Brutus_PICKPOCKET (C_INFO)
{
	npc			= NASZ_107_Brutus;
	nr			= 900;
	condition	= DIA_NASZ_107_Brutus_PICKPOCKET_Condition;
	information	= DIA_NASZ_107_Brutus_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_107_Brutus_PICKPOCKET_Condition()
{
	C_Beklauen (7);
};
 
FUNC VOID DIA_NASZ_107_Brutus_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_107_Brutus_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_107_Brutus_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_107_Brutus_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_107_Brutus_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_107_Brutus_PICKPOCKET_DoIt);
};

func void DIA_NASZ_107_Brutus_PICKPOCKET_DoIt()
{
	B_BeklauenGold(21);
	Info_ClearChoices (DIA_NASZ_107_Brutus_PICKPOCKET);
};
	
func void DIA_NASZ_107_Brutus_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_107_Brutus_PICKPOCKET);
};

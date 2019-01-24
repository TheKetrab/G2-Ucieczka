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
	AI_Output (self, other,"DIA_NASZ_107_Brutus_siema_55_01"); //Ostrzê miecze wykute przez Jana i dostarczam je Johny'emu.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_siema_55_02"); //Jeœli chcesz kupiæ coœ porz¹dnego, zapraszam w³aœnie do niego.
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
 	description = "Jak siê tu znalaz³eœ?";
};

FUNC INT DIA_NASZ_107_Brutus_jak_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_107_Brutus_jak_Info()
{
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_00"); //Jak siê tu znalaz³eœ?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_01"); //Uciek³em z zamku przed tymi kud³atymi bestiami, potê¿nej postury i wzrosu. By³y ich tam ca³e stada, atakowa³y mnie!
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_02"); //O jakich bestiach mówisz? Co takie groŸnego mog³o siê kryæ na zamku?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_03"); //Przed Chrz¹szczami, fuj! Nienawidzê tych stworzeñ, widzia³eœ, jakie s¹ ogromne i w³ochate?
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_04"); //Oj Brutusie, przecie¿ one s¹ takie ma³e, a ty taki du¿y, nie rozœmieszaj siê! Mo¿esz je spokojnie rozgnieœæ swoj¹ stop¹.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_05"); //Gdybyœ tylko widzia³, jak one na mnie patrzy³y, by³em pewien, ¿e chcia³y mnie zjeœæ. Nie mia³em innego wyjœcia.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_06"); //Mog³em zostaæ z moj¹ star¹, to by³ jej przysmak. Nigdy w okresie naszego ma³¿eñstwa nie znalaz³em chrz¹szcza pod ³ó¿kiem...
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_07"); //Ale wracaj¹c do tego, jak tutaj dotar³em. W póŸniejszym okresie ukry³em siê w jakiej jaskini.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_08"); //Ca³e szczêœcie, ¿e nie by³o w niej tych paskudnych stworzeñ. Chcia³em jakoœ dostaæ siê na prze³êcz i wróciæ do Khorinis.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_09"); //Któregoœ dnia rozleg³o siê potê¿ne trzêsienie ziemi. Wyszed³em, by to sprawdziæ i zobaczy³em orków.
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_10"); //Dobrze, ¿e znalaz³ mnie Korth. Gdyby nie on, nie odwa¿y³bym siê wyjœæ z mojej kryjówki.
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_11"); //Uwa¿aj, chrz¹szcz za tob¹!
	AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_12"); //Co? Gdzie?! Spadam st¹d!
	
	AI_TurnAway (self,hero);
	
	//Przewraca siê Brutus
	AI_PlayAni(self,"T_FALLB_2_FALLENB");
	AI_Output (other,self ,"DIA_NASZ_107_Brutus_jak_15_13"); //Dos³ownie, mój przyjacielu, dos³ownie. A teraz wstawaj, nabra³em ciê! (œmiech)
	AI_Wait(self,1);
	if(!AniIsActive(self,"T_FALLB_2_FALLENB"))
	{
		//Wstaje
		AI_PlayAni			(self, "T_VICTIM_SLE_2_STAND");
		
		if(!AniIsActive(self,"T_VICTIM_SLE_2_STAND"))
		{
			AI_TurnToNpc(self,hero);
			AI_Output (self, other,"DIA_NASZ_107_Brutus_jak_55_14"); //Bardzo œmieszne, bardzo œmieszne!
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
	description = "Czy to prawda, ¿e ktoœ okrad³ myœliwych?";
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
	AI_Output (other, self,"DIA_NASZ_107_Brutus_goth_15_00"); //Czy to prawda, ¿e ktoœ okrad³ myœliwych?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_goth_55_01"); //Ja tam nie wiem. Nikt mi o tym nie wspomina³.

	B_LogEntry (TOPIC_Goth_kradziez, "Brutus nie jest zbyt zorientowany w ca³ej sprawie. Nic nie wiedzia³.");

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
 	description = "Jak siê masz?";
};

FUNC INT DIA_NASZ_107_Brutus_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_107_Brutus_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_107_Brutus_HowAreYou_15_00"); //Jak siê masz?
	AI_Output (self, other,"DIA_NASZ_107_Brutus_HowAreYou_55_01"); //Po ca³ym dniu pracy jestem wykoñczony.	
	AI_Output (self, other,"DIA_NASZ_107_Brutus_HowAreYou_55_02"); //Brakuje mi si³ na wieczorne chlañsko w karczmie.

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

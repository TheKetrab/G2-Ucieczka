var int DustyRediToTelepport;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_EXIT   (C_INFO)
{
	npc         = NASZ_030_Dusty;
	nr          = 999;
	condition   = DIA_NASZ_030_Dusty_EXIT_Condition;
	information = DIA_NASZ_030_Dusty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_030_Dusty_EXIT_Condition()
{
	return TRUE;
};

func void DeleteDusty()
{
	if(InfoManager_HasFinished())
	{
		B_StartOtherRoutine (NASZ_030_Dusty,"End");
		DeleteNpc(NASZ_030_Dusty);
		ff_remove(DeleteDusty);
	};
};

FUNC VOID DIA_NASZ_030_Dusty_EXIT_Info()
{
	if (DustyRediToTelepport == TRUE)
	{
		Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");

		AI_StopProcessInfos (self);
		ff_applyonceext(DeleteDusty,1000,-1);
		hero.aivar[AIV_INVINCIBLE] = 0;
	};
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Before
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_Before   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 1;
 	condition   = DIA_NASZ_030_Dusty_Before_Condition;
 	information = DIA_NASZ_030_Dusty_Before_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_030_Dusty_Before_Condition()
{
	if (!Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
	&& (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_Before_Info()
{
	AI_Output (self, other,"DIA_NASZ_030_Dusty_Before_027_00"); //MMMM.
	
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_siema   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 2;
 	condition   = DIA_NASZ_030_Dusty_siema_Condition;
 	information = DIA_NASZ_030_Dusty_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_030_Dusty_siema_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_024_BaalOrun_Lojalnosc))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_030_Dusty_siema_15_00"); //¯ywe cia³o, a niech ciê!
	AI_Output (self, other,"DIA_NASZ_030_Dusty_siema_55_01"); //W koñcu ktoœ, kto mo¿e mi pomóc. PodejdŸ bli¿ej, nie bój siê.
	
};

//*********************************************************************
//	         WhoAreYou
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_WhoAreYou   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 3;
 	condition   = DIA_NASZ_030_Dusty_WhoAreYou_Condition;
 	information = DIA_NASZ_030_Dusty_WhoAreYou_Info;
 	permanent   = FALSE;
 	description = "Kim jesteœ?";
};

FUNC INT DIA_NASZ_030_Dusty_WhoAreYou_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_030_Dusty_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_WhoAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_030_Dusty_WhoAreYou_55_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_WhoAreYou_15_01"); //Nazywam siê Dusty. Do Górniczej Doliny przyby³em jako wiêzieñ. Bêd¹c ca³kiem szczery, to nie pamiêtam ju¿ za co.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_WhoAreYou_55_02"); //Przyby³em do obozu wyznawców Œni¹cego, a baalowie pomogli mi zapomnieæ o moich przewinieniach.
	
};

//*********************************************************************
//	         YourArmor
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_YourArmor   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 4;
 	condition   = DIA_NASZ_030_Dusty_YourArmor_Condition;
 	information = DIA_NASZ_030_Dusty_YourArmor_Info;
 	permanent   = FALSE;
 	description = "Czemu nie nosisz szaty nowicjusza?";
};

FUNC INT DIA_NASZ_030_Dusty_YourArmor_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_030_Dusty_WhoAreYou))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_YourArmor_Info()
{
	AI_Output (other, self,"DIA_NASZ_030_Dusty_YourArmor_55_00"); //Czemu nie nosisz szaty nowicjusza?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_15_01"); //Poniewa¿ nim nie jestem. Do Obozu na Bagnie przyby³em na jakiœ tydzieñ przed odkryciem prawdziwego oblicza Œni¹cego.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_55_02"); //Po tym wydarzeniu Bractwo bardzo siê podzieli³o. Nie chcia³em w to brn¹æ, dlatego zosta³em w obozie tylko jako wolny s³uchacz.
	AI_Output (other, self,"DIA_NASZ_030_Dusty_YourArmor_55_03"); //Wczeœniej by³eœ w Starym Obozie, prawda?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_55_04"); //Tak. I pewnie zosta³bym tam d³u¿ej, gdyby nie pewien facet, który pomóg³ mi uciec. Przekupi³ stra¿nika. Dobry to by³ goœæ!
	AI_Output (other, self,"DIA_NASZ_030_Dusty_YourArmor_55_05"); //W Obozie Bractwa by³o du¿o lepiej?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_55_06"); //Trudno powiedzieæ. Mia³em gorsze warunki mieszkalne, bo spa³em na ziemi, jednak jedzenie by³o lepsze i mia³em ³atwiejszy dostêp do bagiennego ziela.
	AI_Output (other, self,"DIA_NASZ_030_Dusty_YourArmor_55_07"); //Pewnie pali³eœ ca³ymi dniami...
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_55_08"); //Tylko dziêki temu uda³o mi siê zapomnieæ o dawnych zmartwieniach i ¿alach.
	
};

//*********************************************************************
//	         HowHelp
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_HowHelp   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 5;
 	condition   = DIA_NASZ_030_Dusty_HowHelp_Condition;
 	information = DIA_NASZ_030_Dusty_HowHelp_Info;
 	permanent   = FALSE;
 	description = "W jaki sposób mogê ci pomóc?";
};

FUNC INT DIA_NASZ_030_Dusty_HowHelp_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_030_Dusty_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_HowHelp_Info()
{
	AI_Output (other, self,"DIA_NASZ_030_Dusty_HowHelp_55_00"); //W jaki sposób mogê ci pomóc?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HowHelp_15_01"); //W morzu jest pe³no ma³ych muszli. Chcê z nich zrobiæ naszyjnik.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HowHelp_55_02"); //Ca³kiem niedawno to miejsce by³o niedostêpne, bo by³o oddzielone magiczn¹ barier¹. Teraz muszle s¹ niemal na wyci¹gniêcie rêki.
	AI_Output (other, self,"DIA_NASZ_030_Dusty_HowHelp_55_03"); //To dlaczego tutaj stoisz, zamiast wskoczyæ do wody? Nie umiesz p³ywaæ?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HowHelp_55_04"); //Problemem jest to, ¿e jestem duchem. Nie mogê wejœæ do wody! Dlatego ¿aden z pozosta³ych duchów nie mo¿e mi pomóc i w³aœnie ty jesteœ dla mnie nadziej¹.
	
};

//*********************************************************************
//	         WhatToDo
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_WhatToDo   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 6;
 	condition   = DIA_NASZ_030_Dusty_WhatToDo_Condition;
 	information = DIA_NASZ_030_Dusty_WhatToDo_Info;
 	permanent   = FALSE;
 	description = "Co dok³adnie mam dla ciebie wy³owiæ?";
};

FUNC INT DIA_NASZ_030_Dusty_WhatToDo_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_030_Dusty_HowHelp))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_WhatToDo_Info()
{
	AI_Output (other, self,"DIA_NASZ_030_Dusty_WhatToDo_55_00"); //Co dok³adnie mam dla ciebie wy³owiæ?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_WhatToDo_15_01"); //Do zrobienia naszyjnika potrzebujê przynajmniej dziesiêciu muszli. Myœlê, ¿e nie bêdziesz mia³ problemu z ich znalezieniem.
	AI_Output (other, self,"DIA_NASZ_030_Dusty_WhatToDo_55_02"); //W takim razie wskakujê do wody. Zaraz bêdziesz mia³ swoje muszelki.
	
	Log_CreateTopic (TOPIC_Dusty_muszle,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dusty_muszle, LOG_RUNNING);
	B_LogEntry (TOPIC_Dusty_muszle, "Dusty chcia³by, ¿ebym wy³owi³ dla niego muszle, które znajdê w morzu. Mam przynieœæ ich co najmniej 10.");
};

//*********************************************************************
//	         HaveShells
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_HaveShells   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 7;
 	condition   = DIA_NASZ_030_Dusty_HaveShells_Condition;
 	information = DIA_NASZ_030_Dusty_HaveShells_Info;
 	permanent   = FALSE;
 	description = "Przynios³em muszle, o które prosi³eœ.";
};

FUNC INT DIA_NASZ_030_Dusty_HaveShells_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_030_Dusty_WhatToDo))
	&& (npc_hasitems(other,ItMi_Addon_Shell_02) >= 10)
	{
		return TRUE;
	};
};

var int DustyDay;
var int DustyHour;
var int Dusty_HeroWantsNecklace;
FUNC VOID DIA_NASZ_030_Dusty_HaveShells_Info()
{
	AI_Output (other, self,"DIA_NASZ_030_Dusty_HaveShells_55_00"); //Przynios³em muszle, o które prosi³eœ.
		
	B_GiveInvItems(other, self, ItMi_Addon_Shell_02, 10);
	
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_15_01"); //Wspaniale! Dziêkujê ci. Teraz bêdê móg³ wykonaæ naszyjnik.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_15_02"); //Bêdzie to dar dla cz³owieka, dziêki czemu odkupiê winy i opuszczê to bagno.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_15_03"); //Przyjacielu, przyjdŸ do mnie za godzinê. Naszyjnik bêdzie gotowy.

	DustyDay = Wld_GetDay();
	DustyHour = Wld_GetTimeHour();
	
	Dusty_HeroWantsNecklace = TRUE;

	B_LogEntry (TOPIC_Dusty_muszle, "Naszyjnik, o którym mówi³ duch, okaza³ siê byæ przeznaczony dla mnie. Mam go odebraæ od Dusty'ego za godzinê.");
	
};


//*********************************************************************
//	         NecklaceIsReady
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_NecklaceIsReady   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 8;
 	condition   = DIA_NASZ_030_Dusty_NecklaceIsReady_Condition;
 	information = DIA_NASZ_030_Dusty_NecklaceIsReady_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_030_Dusty_NecklaceIsReady_Condition()	
{
	if (Dusty_HeroWantsNecklace == TRUE)
	&& (TimeIsUp(-1,1,DustyDay,DustyHour)) // 1h
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_NecklaceIsReady_Info()
{
	AI_Output (self, other, "DIA_NASZ_030_Dusty_NecklaceIsReady_55_00"); //Naszyjnik jest gotowy. Proszê.

	CreateInvItems(self,ItNa_Amulet_Wojny,1);
	B_GiveInvItems(self, other, ItNa_Amulet_Wojny, 1);

	AI_Output (other, self, "DIA_NASZ_030_Dusty_NecklaceIsReady_55_01"); //Prawdziwe arcydzie³o. Dziêki.
	AI_Output (self, other, "DIA_NASZ_030_Dusty_NecklaceIsReady_55_02"); //Powodzenia, przyjacielu.

	B_LogEntry (TOPIC_Lojalnosc,"Dosta³em od Dusty'ego naszyjnik. Zapewne bêdê musia³ pokazaæ go Baal Orunowi.");

	B_GivePlayerXP(500);
	B_LogEntry (TOPIC_Dusty_muszle, "Odebra³em naszyjnik.");
	Log_SetTopicStatus (TOPIC_Dusty_muszle, LOG_SUCCESS);
	
	DustyRediToTelepport = TRUE;
	
};

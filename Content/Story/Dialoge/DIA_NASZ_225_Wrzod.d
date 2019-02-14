//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_225_Wrzod_EXIT   (C_INFO)
{
	npc         = NASZ_225_Wrzod;
	nr          = 999;
	condition   = DIA_NASZ_225_Wrzod_EXIT_Condition;
	information = DIA_NASZ_225_Wrzod_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_225_Wrzod_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_225_Wrzod_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_225_Wrzod_siema   (C_INFO)
{
	npc         = NASZ_225_Wrzod;
 	nr          = 1;
 	condition   = DIA_NASZ_225_Wrzod_siema_Condition;
 	information = DIA_NASZ_225_Wrzod_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_225_Wrzod_siema_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_212_Drax_siema)) && (KAPITEL < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_225_Wrzod_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_15_00"); //Hej, kolego! Chyba siê jeszcze nie widzieliœmy.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_55_01"); //Przyszed³eœ mnie st¹d zabraæ? To bardzo mi³o z twojej strony.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_55_03"); //Nieczêsto spotykam takich mi³ych ludzi. Wszyscy zawsze patrz¹ na mnie z góry i wytykaj¹ palcami.
	AI_Output (other,self ,"DIA_NASZ_225_Wrzod_siema_15_04"); //Zamknij siê!
	AI_Output (other,self ,"DIA_NASZ_225_Wrzod_siema_15_05"); //Masz iœæ do Arana. Jest w jaskini za obozem.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_55_06"); //Heeej! Dlaczego jesteœ taki niemi³y? Wszyscy jesteœcie jacyœ niepowa¿ni... Ale znam Arana.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_55_07"); //On nie zbywa mnie za ka¿dym razem! Na pewno mnie zrozumie.

	DodajReputacje (1, REP_MYSLIWI);
	B_GivePlayerXP (300);
	B_LogEntry (TOPIC_Aran_quest, "Nie wiem, czy Aran ucieszy siê z takiego towarzysza... No có¿, lepszy rydz ni¿ nic.");
	Log_SetTopicStatus (TOPIC_Aran_quest, LOG_SUCCESS);

	Npc_ExchangeRoutine (self,"Aran");
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Kap4Start 
//*********************************************************************
INSTANCE DIA_NASZ_225_Wrzod_Kap4Start   (C_INFO)
{
	npc         = NASZ_225_Wrzod;
 	nr          = 41;
 	condition   = DIA_NASZ_225_Wrzod_Kap4Start_Condition;
 	information = DIA_NASZ_225_Wrzod_Kap4Start_Info;
 	permanent   = FALSE;
 	description = "Co z tob¹?";
};

FUNC INT DIA_NASZ_225_Wrzod_Kap4Start_Condition()
{
	if (KAPITEL == 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_225_Wrzod_Kap4Start_Info()
{
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_Kap4Start_15_00"); //Co z tob¹?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_01"); //Pragnienie.
	AI_Output (other,self ,"DIA_NASZ_225_Wrzod_Kap4Start_15_02"); //To znaczy?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_15_03"); //Mia³em sen. A w tym œnie skaka³y wokó³ mnie œcierwojady, kretoszczury i krwiopijce.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_04"); //Kiedy by³em jeszcze m³ody, zaliczy³em parê owiec, szczury, a nawet wilki. Dopiero ten sen otworzy³ mi oczy.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_05"); //Ludzie na to krzywo patrzyli, ale mi³oœæ jest œlepa. Za to w³aœnie trafi³em do kolonii.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_06"); //Muszê skosztowaæ nowych przygód. Doznaæ czegoœ dzikiego. Chcê zasmakowaæ jamy œcierwojada, brzuszka kretoszczura, a w koñcu odw³oka krwiopijcy.

	AI_Output (other, self,"DIA_NASZ_225_Wrzod_Kap4Start_15_07"); //Jesteœ szalony!
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_08"); //A ty nieczu³y! Rzuca mn¹ na prawo i lewo. Pragnienie jest takie silne.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_09"); //Nie potrafiê ju¿ ¿yæ bez zwierz¹tek.
	AI_StopProcessInfos (self);
	
	Log_CreateTopic (TOPIC_Wrzod_zwierzeta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Wrzod_zwierzeta, LOG_RUNNING);
	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Wrzód bez przerwy wrzeszczy. Œni³ mu siê stosunek z dzikimi zwierzêtami. Ubzdura³ sobie, ¿e chce ziœciæ swój sen. Muszê coœ zrobiæ z tymi jego wrzaskami... Albo przebijê mu gard³o, albo podam jakieœ antidotum uspokajaj¹ce myœli. Mo¿e Kirgo coœ wymyœli?");
};
//*********************************************************************
//	Info Wypij 
//*********************************************************************
INSTANCE DIA_NASZ_225_Wrzod_wypij   (C_INFO)
{
	npc         = NASZ_225_Wrzod;
 	nr          = 43;
 	condition   = DIA_NASZ_225_Wrzod_wypij_Condition;
 	information = DIA_NASZ_225_Wrzod_wypij_Info;
 	permanent   = FALSE;
 	description = "Wypij to.";
};

FUNC INT DIA_NASZ_225_Wrzod_wypij_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_MamSkladnikiWrzod))
	&& (npc_hasitems (other, ItNa_Wrzod_Lekarstwo) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_225_Wrzod_wypij_Info()
{
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_wypij_15_00"); //Wypij to.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_wypij_55_01"); //A có¿ to takiego?
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_wypij_15_02"); //Wywar, dziêki któremu wrócisz do snów o swoich dzikich zwierzêtach.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_wypij_15_03"); //Ale fajnie, dawaj!
	B_GiveInvItems (other, self, ItNa_Wrzod_Lekarstwo, 1);
	B_UseItem (self, ItNa_Wrzod_Lekarstwo);
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_wypij_15_04"); //I co, pomog³o?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_wypij_15_05"); //To samo! Nie czujê siê ani trochê spokojniejszy.
	
	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Mikstura chyba nic nie da³a. Wrzód ci¹gle wrzeszczy. Jestem chyba zmuszony mu pomóc.");

};

//*********************************************************************
//	Info CanIHelp 
//*********************************************************************
INSTANCE DIA_NASZ_225_Wrzod_CanIHelp   (C_INFO)
{
	npc         = NASZ_225_Wrzod;
 	nr          = 44;
 	condition   = DIA_NASZ_225_Wrzod_CanIHelp_Condition;
 	information = DIA_NASZ_225_Wrzod_CanIHelp_Info;
 	permanent   = FALSE;
 	description = "Mogê ci jakoœ pomóc?";
};

FUNC INT DIA_NASZ_225_Wrzod_CanIHelp_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_225_Wrzod_wypij))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_225_Wrzod_CanIHelp_Info()
{
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_CanIHelp_15_00"); //Mogê ci jakoœ pomóc?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_55_01"); //Tylko zwierzêta mog¹ mi pomóc.
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_CanIHelp_15_02"); //Powiedzmy, ¿e zorganizujê ci zwierzaki. Masz jakieœ konkretne ¿yczenia?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_03"); //Zrobi³byœ to dla mnie?! To wspaniale.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_04"); //Mój przyjaciel, Ghorim, mia³ przed upadkiem bariery niedu¿¹ gorzelniê w jaskini, w lesie, w pobli¿u Obozu na Bagnie.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_05"); //Tamto miejsce wydaje mi siê idealne do spe³nienia moich zabaw.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_06"); //Dodatkowo chcia³bym, by by³ tam jakiœ œcierwojad, kretoszczur i krwiopijca.
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_CanIHelp_15_07"); //Zobaczê, co da siê zrobiæ.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_08"); //Na sam¹ myœl, a¿ œlinka mi cieknie!

	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Ten psychopata wymyœli³ sobie nawet miejsce do swoich zabaw. W lesie obok Obozu na Bagnie jest jaskinia, w której niegdyœ by³a gorzelnia. Muszê oswoiæ œcierwojada, kretoszczura i krwiopijcê, a potem przyprowadziæ je tam. Przynajmniej za jakiœ czas w obozie myœliwych bêdzie cicho.");

	OswajaszDlaWrzoda = TRUE;
	ff_applyonceext(WrzodQuestInserting,1000,-1);
};

//*********************************************************************
//	Info MonstersReady 
//*********************************************************************
INSTANCE DIA_NASZ_225_Wrzod_MonstersReady   (C_INFO)
{
	npc         = NASZ_225_Wrzod;
 	nr          = 45;
 	condition   = DIA_NASZ_225_Wrzod_MonstersReady_Condition;
 	information = DIA_NASZ_225_Wrzod_MonstersReady_Info;
 	permanent   = FALSE;
 	description = "Zwierzêta ju¿ na ciebie czekaj¹.";
};

FUNC INT DIA_NASZ_225_Wrzod_MonstersReady_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_225_Wrzod_CanIHelp))
	&& (QuestWrzodDoprowadzilesScierwojada == TRUE) && (QuestWrzodDoprowadzilesKretoszczura == TRUE) && (QuestWrzodDoprowadzilesKrwiopijce == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_225_Wrzod_MonstersReady_Info()
{
	B_GivePlayerXP(1000);
	DodajReputacje(4,REP_MYSLIWI);

	AI_Output (other, self,"DIA_NASZ_225_Wrzod_MonstersReady_15_00"); //Zwierzêta ju¿ na ciebie czekaj¹.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_01"); //Powa¿nie?!
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_02"); //Zaraz bêdê, moje maleñstwa!

	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_03"); //Dziêkujê ci, przyjacielu. W nagrodê weŸ ten pierœcieñ si³y.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_04"); //Jesteœ moim najlepszym kumplem, zaraz po pewnym cz³owieku, którego Stary Obóz uzna³ za zdrajcê i chcia³ go zabiæ.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_05"); //Ja sam ledwo uszed³em z ¿yciem. Gdyby uda³ siê nasz plan, ¿ylibyœmy d³ugo i szczêœliwie w Starym Obozie, razem ze zwierzêtami.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_06"); //Ten przedmiot nale¿a³ w³aœnie do niego. Prze¿yliœmy wiele wspólnych przygód.
	AI_Output (other,self,"DIA_NASZ_225_Wrzod_MonstersReady_15_07"); //Jaki plan?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_08"); //Mieliœmy przej¹æ w³adzê nad ca³ym Starym Obozem i wypowiedzieæ wojnê tym paskudnym szkodnikom z Nowego Obozu.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_09"); //Wszyscy by mnie szanowali, a te gnojki dosta³yby to, na co zas³uguj¹.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_10"); //By³em zamkniêty na górze z tym oprychem Draxem, to by³ koszmar!
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_11"); //Ci¹gle mnie obra¿a³, nie da³o siê z nim normalnie porozmawiaæ.
	AI_Output (other,self,"DIA_NASZ_225_Wrzod_MonstersReady_15_12"); //Przyjacielu, zwierzêta na ciebie czekaj¹...
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_13"); //Racja, nie mogê im pozwoliæ na to, aby czeka³y.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_14"); //Ju¿ to czujê, jak zag³êbiam siê w ich ciele i tym samym ³¹czymy siê w jedno.
	AI_Output (other,self,"DIA_NASZ_225_Wrzod_MonstersReady_15_15"); //Baw siê dobrze...

	CreateInvItems(self,ItRi_Str_Mud,1);
	B_GiveInvItems (self,other,ItRi_Str_Mud,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"Kap4Done");
	
	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Wrzód pobieg³ do swoich zwierz¹t. Szczerze im wspó³czujê.");
	Log_SetTopicStatus (TOPIC_Wrzod_zwierzeta, LOG_SUCCESS);

	
	OswajaszDlaWrzoda = FALSE;
	ff_remove(WrzodQuestInserting);
};
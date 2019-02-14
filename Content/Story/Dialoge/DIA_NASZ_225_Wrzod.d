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
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_15_00"); //Hej, kolego! Chyba si� jeszcze nie widzieli�my.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_55_01"); //Przyszed�e� mnie st�d zabra�? To bardzo mi�o z twojej strony.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_55_03"); //Niecz�sto spotykam takich mi�ych ludzi. Wszyscy zawsze patrz� na mnie z g�ry i wytykaj� palcami.
	AI_Output (other,self ,"DIA_NASZ_225_Wrzod_siema_15_04"); //Zamknij si�!
	AI_Output (other,self ,"DIA_NASZ_225_Wrzod_siema_15_05"); //Masz i�� do Arana. Jest w jaskini za obozem.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_55_06"); //Heeej! Dlaczego jeste� taki niemi�y? Wszyscy jeste�cie jacy� niepowa�ni... Ale znam Arana.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_siema_55_07"); //On nie zbywa mnie za ka�dym razem! Na pewno mnie zrozumie.

	DodajReputacje (1, REP_MYSLIWI);
	B_GivePlayerXP (300);
	B_LogEntry (TOPIC_Aran_quest, "Nie wiem, czy Aran ucieszy si� z takiego towarzysza... No c�, lepszy rydz ni� nic.");
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
 	description = "Co z tob�?";
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
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_Kap4Start_15_00"); //Co z tob�?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_01"); //Pragnienie.
	AI_Output (other,self ,"DIA_NASZ_225_Wrzod_Kap4Start_15_02"); //To znaczy?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_15_03"); //Mia�em sen. A w tym �nie skaka�y wok� mnie �cierwojady, kretoszczury i krwiopijce.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_04"); //Kiedy by�em jeszcze m�ody, zaliczy�em par� owiec, szczury, a nawet wilki. Dopiero ten sen otworzy� mi oczy.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_05"); //Ludzie na to krzywo patrzyli, ale mi�o�� jest �lepa. Za to w�a�nie trafi�em do kolonii.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_06"); //Musz� skosztowa� nowych przyg�d. Dozna� czego� dzikiego. Chc� zasmakowa� jamy �cierwojada, brzuszka kretoszczura, a w ko�cu odw�oka krwiopijcy.

	AI_Output (other, self,"DIA_NASZ_225_Wrzod_Kap4Start_15_07"); //Jeste� szalony!
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_08"); //A ty nieczu�y! Rzuca mn� na prawo i lewo. Pragnienie jest takie silne.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_Kap4Start_55_09"); //Nie potrafi� ju� �y� bez zwierz�tek.
	AI_StopProcessInfos (self);
	
	Log_CreateTopic (TOPIC_Wrzod_zwierzeta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Wrzod_zwierzeta, LOG_RUNNING);
	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Wrz�d bez przerwy wrzeszczy. �ni� mu si� stosunek z dzikimi zwierz�tami. Ubzdura� sobie, �e chce zi�ci� sw�j sen. Musz� co� zrobi� z tymi jego wrzaskami... Albo przebij� mu gard�o, albo podam jakie� antidotum uspokajaj�ce my�li. Mo�e Kirgo co� wymy�li?");
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
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_wypij_55_01"); //A c� to takiego?
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_wypij_15_02"); //Wywar, dzi�ki kt�remu wr�cisz do sn�w o swoich dzikich zwierz�tach.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_wypij_15_03"); //Ale fajnie, dawaj!
	B_GiveInvItems (other, self, ItNa_Wrzod_Lekarstwo, 1);
	B_UseItem (self, ItNa_Wrzod_Lekarstwo);
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_wypij_15_04"); //I co, pomog�o?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_wypij_15_05"); //To samo! Nie czuj� si� ani troch� spokojniejszy.
	
	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Mikstura chyba nic nie da�a. Wrz�d ci�gle wrzeszczy. Jestem chyba zmuszony mu pom�c.");

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
 	description = "Mog� ci jako� pom�c?";
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
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_CanIHelp_15_00"); //Mog� ci jako� pom�c?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_55_01"); //Tylko zwierz�ta mog� mi pom�c.
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_CanIHelp_15_02"); //Powiedzmy, �e zorganizuj� ci zwierzaki. Masz jakie� konkretne �yczenia?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_03"); //Zrobi�by� to dla mnie?! To wspaniale.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_04"); //M�j przyjaciel, Ghorim, mia� przed upadkiem bariery niedu�� gorzelni� w jaskini, w lesie, w pobli�u Obozu na Bagnie.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_05"); //Tamto miejsce wydaje mi si� idealne do spe�nienia moich zabaw.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_06"); //Dodatkowo chcia�bym, by by� tam jaki� �cierwojad, kretoszczur i krwiopijca.
	AI_Output (other, self,"DIA_NASZ_225_Wrzod_CanIHelp_15_07"); //Zobacz�, co da si� zrobi�.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_CanIHelp_15_08"); //Na sam� my�l, a� �linka mi cieknie!

	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Ten psychopata wymy�li� sobie nawet miejsce do swoich zabaw. W lesie obok Obozu na Bagnie jest jaskinia, w kt�rej niegdy� by�a gorzelnia. Musz� oswoi� �cierwojada, kretoszczura i krwiopijc�, a potem przyprowadzi� je tam. Przynajmniej za jaki� czas w obozie my�liwych b�dzie cicho.");

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
 	description = "Zwierz�ta ju� na ciebie czekaj�.";
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

	AI_Output (other, self,"DIA_NASZ_225_Wrzod_MonstersReady_15_00"); //Zwierz�ta ju� na ciebie czekaj�.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_01"); //Powa�nie?!
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_02"); //Zaraz b�d�, moje male�stwa!

	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_03"); //Dzi�kuj� ci, przyjacielu. W nagrod� we� ten pier�cie� si�y.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_04"); //Jeste� moim najlepszym kumplem, zaraz po pewnym cz�owieku, kt�rego Stary Ob�z uzna� za zdrajc� i chcia� go zabi�.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_05"); //Ja sam ledwo uszed�em z �yciem. Gdyby uda� si� nasz plan, �yliby�my d�ugo i szcz�liwie w Starym Obozie, razem ze zwierz�tami.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_06"); //Ten przedmiot nale�a� w�a�nie do niego. Prze�yli�my wiele wsp�lnych przyg�d.
	AI_Output (other,self,"DIA_NASZ_225_Wrzod_MonstersReady_15_07"); //Jaki plan?
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_08"); //Mieli�my przej�� w�adz� nad ca�ym Starym Obozem i wypowiedzie� wojn� tym paskudnym szkodnikom z Nowego Obozu.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_09"); //Wszyscy by mnie szanowali, a te gnojki dosta�yby to, na co zas�uguj�.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_10"); //By�em zamkni�ty na g�rze z tym oprychem Draxem, to by� koszmar!
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_11"); //Ci�gle mnie obra�a�, nie da�o si� z nim normalnie porozmawia�.
	AI_Output (other,self,"DIA_NASZ_225_Wrzod_MonstersReady_15_12"); //Przyjacielu, zwierz�ta na ciebie czekaj�...
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_13"); //Racja, nie mog� im pozwoli� na to, aby czeka�y.
	AI_Output (self, other,"DIA_NASZ_225_Wrzod_MonstersReady_55_14"); //Ju� to czuj�, jak zag��biam si� w ich ciele i tym samym ��czymy si� w jedno.
	AI_Output (other,self,"DIA_NASZ_225_Wrzod_MonstersReady_15_15"); //Baw si� dobrze...

	CreateInvItems(self,ItRi_Str_Mud,1);
	B_GiveInvItems (self,other,ItRi_Str_Mud,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"Kap4Done");
	
	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Wrz�d pobieg� do swoich zwierz�t. Szczerze im wsp�czuj�.");
	Log_SetTopicStatus (TOPIC_Wrzod_zwierzeta, LOG_SUCCESS);

	
	OswajaszDlaWrzoda = FALSE;
	ff_remove(WrzodQuestInserting);
};
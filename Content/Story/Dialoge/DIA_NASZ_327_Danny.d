///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_327_Danny_EXIT   (C_INFO)
{
	npc         = NASZ_327_Danny;
	nr          = 999;
	condition   = DIA_NASZ_327_Danny_EXIT_Condition;
	information = DIA_NASZ_327_Danny_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_327_Danny_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_327_Danny_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

var int DannyTalkFirstTime;
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_327_Danny_hello		(C_INFO)
{
	npc			 = 	NASZ_327_Danny;
	nr			 = 	1;
	condition	 = 	DIA_NASZ_327_Danny_hello_Condition;
	information	 = 	DIA_NASZ_327_Danny_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_327_Danny_hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_NASZ_327_Danny_hello_Info ()
{
	if (DannyTalkFirstTime == FALSE)
	{
		var c_item armor; armor = Npc_GetEquippedArmor (other);

		if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H)))
		{
			AI_Output			(self, other, "DIA_NASZ_327_Danny_hello_03_00"); //Czy¿by jakiœ tubylec? Proszê, nie atakuj mnie. Jestem zbyt stary i nie wart stêpienia na mnie ostrza.
			DannyTalkFirstTime = TRUE;
			ff_remove(ZbrojaDanny_TickTock1s);
		};

	}
	else
	{
		AI_Output			(self, other, "DIA_NASZ_327_Danny_hello_03_01"); //Witaj.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info What
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_327_Danny_what		(C_INFO)
{
	npc			 = 	NASZ_327_Danny;
	nr			 = 	2;
	condition	 = 	DIA_NASZ_327_Danny_what_Condition;
	information	 = 	DIA_NASZ_327_Danny_what_Info;
	permanent	 = 	FALSE;
	description	 =	"Co tu robisz?";
};

func int DIA_NASZ_327_Danny_what_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_327_Danny_what_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_327_Danny_what_55_00"); //Co tu robisz?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_what_03_01"); //£owiê ryby.
	AI_Output			(other, self, "DIA_NASZ_327_Danny_what_03_02"); //Sam?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_what_03_03"); //Owszem. Ta czêœæ Gorniczej Doliny jest wzglêdnie bezpieczna. Nie mam siê czego obawiaæ.

};

///////////////////////////////////////////////////////////////////////
//	Info Fish
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_327_Danny_fish		(C_INFO)
{
	npc			 = 	NASZ_327_Danny;
	nr			 = 	3;
	condition	 = 	DIA_NASZ_327_Danny_fish_Condition;
	information	 = 	DIA_NASZ_327_Danny_fish_Info;
	permanent	 = 	FALSE;
	description	 =	"Jakie ryby ³owisz?";
};

func int DIA_NASZ_327_Danny_fish_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_327_Danny_what))
	{
		return TRUE;
	};
};

func void DIA_NASZ_327_Danny_fish_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_327_Danny_fish_55_00"); //Jakie ryby ³owisz?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_fish_03_01"); //To jeziorko graniczy z lodow¹ krain¹. Uwierz mi, ¿e nie chcesz w nim p³ywaæ.
	AI_Output			(self, other, "DIA_NASZ_327_Danny_fish_03_02"); //Za to przeró¿ne ryby chc¹! Œledzie to najczêstszy okaz, który mo¿na tu z³owiæ.
};

var int DANNY_KNOW_OBOZ;
///////////////////////////////////////////////////////////////////////
//	Info Surowo
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_327_Danny_surowo		(C_INFO)
{
	npc			 = 	NASZ_327_Danny;
	nr			 = 	4;
	condition	 = 	DIA_NASZ_327_Danny_surowo_Condition;
	information	 = 	DIA_NASZ_327_Danny_surowo_Info;
	permanent	 = 	FALSE;
	description	 =	"Jesz ryby na surowo?";
};

func int DIA_NASZ_327_Danny_surowo_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_327_Danny_fish))
	{
		return TRUE;
	};
};

func void DIA_NASZ_327_Danny_surowo_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_327_Danny_surowo_55_00"); //Jesz ryby na surowo?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_surowo_03_01"); //Sk¹d to pytanie?
	AI_Output			(other, self, "DIA_NASZ_327_Danny_surowo_03_02"); //Nie widzê tu ¿adnego ogniska...
	AI_Output			(self, other, "DIA_NASZ_327_Danny_surowo_03_03"); //Przyrz¹dzam zupê z ryb. Raz na jakiœ czas po³ów jest transportowany do obozu na górze.

	DANNY_KNOW_OBOZ = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Armor
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_327_Danny_armor		(C_INFO)
{
	npc			 = 	NASZ_327_Danny;
	nr			 = 	5;
	condition	 = 	DIA_NASZ_327_Danny_armor_Condition;
	information	 = 	DIA_NASZ_327_Danny_armor_Info;
	permanent	 = 	FALSE;
	description	 =	"Kim jesteœ?";
};

func int DIA_NASZ_327_Danny_armor_Condition ()
{
	if (DannyTalkFirstTime == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NASZ_327_Danny_armor_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_327_Danny_armor_55_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_01"); //Nie jestem st¹d. W zasadzie to przybywam z gór.
	AI_Output			(other, self, "DIA_NASZ_327_Danny_armor_03_02"); //Z gór?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_03"); //Zza gór.
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_04"); //Ja i moi kamraci przybyliœmy do Górniczej Doliny, ¿eby wykopaæ st¹d ca³¹ rudê i sprzedaæ j¹ królowi na kontynencie. Jednak to, co tu spotkaliœmy to seria k³opotów.
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_05"); //Zaczê³o siê od orkowego ataku na nasze statki. Chcieliœmy przybiæ do brzegu, ale jeszcze na morzu oberwaliœmy z orkowych armat.
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_06"); //Op³ynêliœmy po³udniow¹ czêœæ wyspy Khorinis i osiedliliœmy siê na jakiejœ mniejszej pla¿y. Ludzie Samuela zaczêli ³ataæ dziury w statku, a Nod wzi¹³ czêœæ ch³opców i wyruszy³ w góry.	
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_07"); //I tu kolejne rozczarowanie! W Górniczej Dolinie rudy nie zosta³o zbyt wiele, a pieczê nad zamkiem sprawuj¹ orkowie!
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_08"); //Utknêliœmy tu, a Nod kombinuje, jak przepêdziæ z zamku orków.

	B_LogEntry (TOPIC_Gestath_renegaci, "No to ju¿ trochê wiem. Bandyci przybyli tu, ¿eby kopaæ magiczn¹ rudê i sprzedawaæ j¹ królowi. Jednak plany na papierze mia³y siê lepiej ni¿ w rzeczywistoœci. Bandyci zostawili swoje okrêty na pla¿y gdzieœ za górami po po³udniowo-zachodniej stronie wyspy Khorinis. Niektóre z nich mocno ucierpia³y, podczas gdy orkowie powitali armatnimi kulami zbli¿aj¹cych siê bandytów. Samuel nadzoruje naprawê statków, a Nod wyruszy³ strom¹ œcie¿k¹ przez góry. Powrót wydaje siê niemo¿liwy, wiêc szef kombinuje, jak wygoniæ orków z zamku. Z tak¹ wiedz¹ chyba bêdê móg³ wejœæ do Obozu Bandytów nie sprawiaj¹c podejrzeñ.");

};

///////////////////////////////////////////////////////////////////////
//	Info Sciezka
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_327_Danny_sciezka		(C_INFO)
{
	npc		 = 	NASZ_327_Danny;
	nr		 = 	6;
	condition	 = 	DIA_NASZ_327_Danny_sciezka_Condition;
	information	 = 	DIA_NASZ_327_Danny_sciezka_Info;
	permanent	 = 	FALSE;
	description	 =	"Istnieje œcie¿ka przez góry?";
};

func int DIA_NASZ_327_Danny_sciezka_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_327_Danny_armor))
	{
		return TRUE;
	};
};

func void DIA_NASZ_327_Danny_sciezka_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_327_Danny_sciezka_55_00"); //Istnieje œcie¿ka przez góry?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_sciezka_03_01"); //Do Górniczej Doliny da siê zejœæ, ale powrót wydaje siê niemo¿liwy.	
	AI_Output			(self, other, "DIA_NASZ_327_Danny_sciezka_03_02"); //Ach, do czorta! Jeszcze nigdy w ¿yciu nie widzia³em takich gór.
};

//*********************************************************************
//	Info Towary
//*********************************************************************
INSTANCE DIA_NASZ_327_Danny_towary   (C_INFO)
{
	npc         = NASZ_327_Danny;
 	nr          = 100;
 	condition   = DIA_NASZ_327_Danny_towary_Condition;
 	information = DIA_NASZ_327_Danny_towary_Info;
 	permanent   = TRUE;
	trade       = TRUE;
 	description = "Poka¿ mi swoje ryby.";
};

FUNC INT DIA_NASZ_327_Danny_towary_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_327_Danny_fish))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_327_Danny_towary_Info()
{
	AI_Output (other, self,"DIA_NASZ_327_Danny_towary_15_00"); //Poka¿ mi swoje ryby.
	AI_Output (self, other,"DIA_NASZ_327_Danny_towary_55_01"); //Zobacz, co z³owi³em.
	B_GiveTradeInv(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_327_Danny_PICKPOCKET (C_INFO)
{
	npc			= NASZ_327_Danny;
	nr			= 900;
	condition	= DIA_NASZ_327_Danny_PICKPOCKET_Condition;
	information	= DIA_NASZ_327_Danny_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_327_Danny_PICKPOCKET_Condition()
{
	C_Beklauen (9);
};
 
FUNC VOID DIA_NASZ_327_Danny_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_327_Danny_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_327_Danny_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_327_Danny_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_327_Danny_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_327_Danny_PICKPOCKET_DoIt);
};

func void DIA_NASZ_327_Danny_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItNa_Losos,5);
	
	Info_ClearChoices (DIA_NASZ_327_Danny_PICKPOCKET);
};
	
func void DIA_NASZ_327_Danny_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_327_Danny_PICKPOCKET);
};
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
			AI_Output			(self, other, "DIA_NASZ_327_Danny_hello_03_00"); //Czy�by jaki� tubylec? Prosz�, nie atakuj mnie. Jestem zbyt stary i nie wart st�pienia na mnie ostrza.
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
	AI_Output			(self, other, "DIA_NASZ_327_Danny_what_03_01"); //�owi� ryby.
	AI_Output			(other, self, "DIA_NASZ_327_Danny_what_03_02"); //Sam?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_what_03_03"); //Owszem. Ta cz�� Gorniczej Doliny jest wzgl�dnie bezpieczna. Nie mam si� czego obawia�.

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
	description	 =	"Jakie ryby �owisz?";
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
	AI_Output			(other, self, "DIA_NASZ_327_Danny_fish_55_00"); //Jakie ryby �owisz?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_fish_03_01"); //To jeziorko graniczy z lodow� krain�. Uwierz mi, �e nie chcesz w nim p�ywa�.
	AI_Output			(self, other, "DIA_NASZ_327_Danny_fish_03_02"); //Za to przer�ne ryby chc�! �ledzie to najcz�stszy okaz, kt�ry mo�na tu z�owi�.
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
	AI_Output			(self, other, "DIA_NASZ_327_Danny_surowo_03_01"); //Sk�d to pytanie?
	AI_Output			(other, self, "DIA_NASZ_327_Danny_surowo_03_02"); //Nie widz� tu �adnego ogniska...
	AI_Output			(self, other, "DIA_NASZ_327_Danny_surowo_03_03"); //Przyrz�dzam zup� z ryb. Raz na jaki� czas po��w jest transportowany do obozu na g�rze.

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
	description	 =	"Kim jeste�?";
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
	AI_Output			(other, self, "DIA_NASZ_327_Danny_armor_55_00"); //Kim jeste�?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_01"); //Nie jestem st�d. W zasadzie to przybywam z g�r.
	AI_Output			(other, self, "DIA_NASZ_327_Danny_armor_03_02"); //Z g�r?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_03"); //Zza g�r.
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_04"); //Ja i moi kamraci przybyli�my do G�rniczej Doliny, �eby wykopa� st�d ca�� rud� i sprzeda� j� kr�lowi na kontynencie. Jednak to, co tu spotkali�my to seria k�opot�w.
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_05"); //Zacz�o si� od orkowego ataku na nasze statki. Chcieli�my przybi� do brzegu, ale jeszcze na morzu oberwali�my z orkowych armat.
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_06"); //Op�yn�li�my po�udniow� cz�� wyspy Khorinis i osiedlili�my si� na jakiej� mniejszej pla�y. Ludzie Samuela zacz�li �ata� dziury w statku, a Nod wzi�� cz�� ch�opc�w i wyruszy� w g�ry.	
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_07"); //I tu kolejne rozczarowanie! W G�rniczej Dolinie rudy nie zosta�o zbyt wiele, a piecz� nad zamkiem sprawuj� orkowie!
	AI_Output			(self, other, "DIA_NASZ_327_Danny_armor_03_08"); //Utkn�li�my tu, a Nod kombinuje, jak przep�dzi� z zamku ork�w.

	B_LogEntry (TOPIC_Gestath_renegaci, "No to ju� troch� wiem. Bandyci przybyli tu, �eby kopa� magiczn� rud� i sprzedawa� j� kr�lowi. Jednak plany na papierze mia�y si� lepiej ni� w rzeczywisto�ci. Bandyci zostawili swoje okr�ty na pla�y gdzie� za g�rami po po�udniowo-zachodniej stronie wyspy Khorinis. Niekt�re z nich mocno ucierpia�y, podczas gdy orkowie powitali armatnimi kulami zbli�aj�cych si� bandyt�w. Samuel nadzoruje napraw� statk�w, a Nod wyruszy� strom� �cie�k� przez g�ry. Powr�t wydaje si� niemo�liwy, wi�c szef kombinuje, jak wygoni� ork�w z zamku. Z tak� wiedz� chyba b�d� m�g� wej�� do Obozu Bandyt�w nie sprawiaj�c podejrze�.");

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
	description	 =	"Istnieje �cie�ka przez g�ry?";
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
	AI_Output			(other, self, "DIA_NASZ_327_Danny_sciezka_55_00"); //Istnieje �cie�ka przez g�ry?
	AI_Output			(self, other, "DIA_NASZ_327_Danny_sciezka_03_01"); //Do G�rniczej Doliny da si� zej��, ale powr�t wydaje si� niemo�liwy.	
	AI_Output			(self, other, "DIA_NASZ_327_Danny_sciezka_03_02"); //Ach, do czorta! Jeszcze nigdy w �yciu nie widzia�em takich g�r.
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
 	description = "Poka� mi swoje ryby.";
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
	AI_Output (other, self,"DIA_NASZ_327_Danny_towary_15_00"); //Poka� mi swoje ryby.
	AI_Output (self, other,"DIA_NASZ_327_Danny_towary_55_01"); //Zobacz, co z�owi�em.
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
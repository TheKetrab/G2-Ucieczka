
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_023_DuchSekciarza_EXIT   (C_INFO)
{
	npc         = NASZ_023_DuchSekciarza;
	nr          = 999;
	condition   = DIA_NASZ_023_DuchSekciarza_EXIT_Condition;
	information = DIA_NASZ_023_DuchSekciarza_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_023_DuchSekciarza_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_023_DuchSekciarza_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Rekonesans
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_023_DuchSekciarza_Rekonesans		(C_INFO)
{
	npc		 	 = 	NASZ_023_DuchSekciarza;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_023_DuchSekciarza_Rekonesans_Condition;
	information	 = 	DIA_NASZ_023_DuchSekciarza_Rekonesans_Info;
	important	 = 	TRUE;
};

func int DIA_NASZ_023_DuchSekciarza_Rekonesans_Condition ()
{
		return TRUE;
};
func void DIA_NASZ_023_DuchSekciarza_Rekonesans_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_00"); //MMMM.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_01"); //�miertelnik? Nie, to nie mo�liwe... A mo�e jeste� kolejn� zb��kan� dusz�? �ywy w�r�d umar�ych? Co tutaj robisz?
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_02"); //Boli, tak bardzo boli. B�agam ci�, pom�! Daj ukojenie mej um�czonej duszy...
	AI_Output			(other, self, "DIA_NASZ_023_DuchSekciarza_Rekonesans_15_03"); //Kim jeste�?
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_04"); //Moje imi� nie ma ju� znaczenia w tym �wiecie. Jestem jedynie n�dznym cieniem cz�owieka, kt�rym by�em za �ycia. M�j los znajduje si� daleko poza horyzontem moich mo�liwo�ci.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_05"); //To naprawd� zabawne, zwa�ywszy na fakt, i� za �ycia wierzy�em w to, �e nic nie mo�e mi zagrozi�. Lecz los zdecydowa� si� ze mnie zakpi�, kiedy moi pobratymcy uciekli ja wraz z garstk� zdecydowa�em si� zosta�.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_06"); //Wtedy wierzyli�my, i� by� to naprawd� dobry pomys�. Jednak kiedy masz przed sob� wieczno�� by rozmy�la� o swoich decyzjach za �ycia spostrzegasz jak wiele b��d�w pope�ni�e�.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_07"); //Powiedz mi, �miertelniku. Dlaczego przybywasz do tego zapomnianego przez bog�w miejsca?
	AI_Output			(other, self, "DIA_NASZ_023_DuchSekciarza_Rekonesans_15_08"); //Przybywam zza palisady. Tamtejsi ludzie wys�ali mnie w to miejsce, abym rozwi�za� zagadk� demon�w i umar�ych, kt�rzy zalewaj� Dolin�.
	AI_Output			(other, self, "DIA_NASZ_023_DuchSekciarza_Rekonesans_15_09"); //Ponadto musimy dowiedzie� si� czego� o za�mieniu i powstrzyma� ten rytua� za wszelk� cen�.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_10"); //Za�mienie! Nie wymawiaj nigdy tego s�owa w tym miejscu, chyba �e chcesz, aby spad� na ciebie gniew opiekuna tego miejsca!
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_11"); //Nie znam ci� �miertelniku, lecz wyczuwam w twoim duchu du�� ch�� i przywi�zanie do �ycia. Je�eli nie chcesz go straci�, czym pr�dzej zawr��! 
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_12"); //Pomoc naszym duszom mo�e sprowadzi� na ciebie jedynie b�l, nieszcz�cie i cierpienie trwaj�ce przez wieczno��.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_13"); //Znajd� Baala Oruna! Ale do mnie ju� wi�cej si� nie zbli�aj...
	
	// todo : wpis w -> na bagna
	
	AI_StopProcessInfos (self);

};

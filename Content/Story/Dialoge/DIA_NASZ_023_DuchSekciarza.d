
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
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_01"); //Œmiertelnik? Nie, to nie mo¿liwe... A mo¿e jesteœ kolejn¹ zb³¹kan¹ dusz¹? ¯ywy wœród umar³ych? Co tutaj robisz?
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_02"); //Boli, tak bardzo boli. B³agam ciê, pomó¿! Daj ukojenie mej umêczonej duszy...
	AI_Output			(other, self, "DIA_NASZ_023_DuchSekciarza_Rekonesans_15_03"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_04"); //Moje imiê nie ma ju¿ znaczenia w tym œwiecie. Jestem jedynie nêdznym cieniem cz³owieka, którym by³em za ¿ycia. Mój los znajduje siê daleko poza horyzontem moich mo¿liwoœci.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_05"); //To naprawdê zabawne, zwa¿ywszy na fakt, i¿ za ¿ycia wierzy³em w to, ¿e nic nie mo¿e mi zagroziæ. Lecz los zdecydowa³ siê ze mnie zakpiæ, kiedy moi pobratymcy uciekli ja wraz z garstk¹ zdecydowa³em siê zostaæ.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_06"); //Wtedy wierzyliœmy, i¿ by³ to naprawdê dobry pomys³. Jednak kiedy masz przed sob¹ wiecznoœæ by rozmyœlaæ o swoich decyzjach za ¿ycia spostrzegasz jak wiele b³êdów pope³ni³eœ.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_07"); //Powiedz mi, œmiertelniku. Dlaczego przybywasz do tego zapomnianego przez bogów miejsca?
	AI_Output			(other, self, "DIA_NASZ_023_DuchSekciarza_Rekonesans_15_08"); //Przybywam zza palisady. Tamtejsi ludzie wys³ali mnie w to miejsce, abym rozwi¹za³ zagadkê demonów i umar³ych, którzy zalewaj¹ Dolinê.
	AI_Output			(other, self, "DIA_NASZ_023_DuchSekciarza_Rekonesans_15_09"); //Ponadto musimy dowiedzieæ siê czegoœ o zaæmieniu i powstrzymaæ ten rytua³ za wszelk¹ cenê.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_10"); //Zaæmienie! Nie wymawiaj nigdy tego s³owa w tym miejscu, chyba ¿e chcesz, aby spad³ na ciebie gniew opiekuna tego miejsca!
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_11"); //Nie znam ciê œmiertelniku, lecz wyczuwam w twoim duchu du¿¹ chêæ i przywi¹zanie do ¿ycia. Je¿eli nie chcesz go straciæ, czym prêdzej zawróæ! 
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_12"); //Pomoc naszym duszom mo¿e sprowadziæ na ciebie jedynie ból, nieszczêœcie i cierpienie trwaj¹ce przez wiecznoœæ.
	AI_Output			(self, other, "DIA_NASZ_023_DuchSekciarza_Rekonesans_023_13"); //ZnajdŸ Baala Oruna! Ale do mnie ju¿ wiêcej siê nie zbli¿aj...
	
	// todo : wpis w -> na bagna
	
	AI_StopProcessInfos (self);

};

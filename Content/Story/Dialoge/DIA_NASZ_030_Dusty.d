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

FUNC VOID DIA_NASZ_030_Dusty_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_siema   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 1;
 	condition   = DIA_NASZ_030_Dusty_siema_Condition;
 	information = DIA_NASZ_030_Dusty_siema_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_030_Dusty_siema_Condition()
{
	if (!npc_knowsinfo (other, DIA_NASZ_117_Fed_goth))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_030_Dusty_siema_15_00"); //�ywe cia�o, a niech ci�!
	AI_Output (self, other,"DIA_NASZ_030_Dusty_siema_55_01"); //W ko�cu kto�, kto mo�e mi pom�c. Podejd� bli�ej, nie b�j si�.
	
};

//*********************************************************************
//	         WhoAreYou
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_WhoAreYou   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 2;
 	condition   = DIA_NASZ_030_Dusty_WhoAreYou_Condition;
 	information = DIA_NASZ_030_Dusty_WhoAreYou_Info;
 	permanent   = FALSE;
 	description = "Kim jeste�?";
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
	AI_Output (other, self,"DIA_NASZ_030_Dusty_WhoAreYou_55_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_WhoAreYou_15_01"); //Nazywam si� Dusty. Do G�rniczej Doliny przyby�em jako wi�zie�. B�d�c ca�kiem szczery, to nie pami�tam ju� za co.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_WhoAreYou_55_02"); //Przyby�em do obozu wyznawc�w �ni�cego, a baalowie pomogli mi zapomnie� o moich przewinieniach.
	
};

//*********************************************************************
//	         YourArmor
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_YourArmor   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 3;
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
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_15_01"); //Poniewa� nim nie jestem. Do Obozu na Bagnie przyby�em na jaki� tydzie� przed odkryciem prawdziwego oblicza �ni�cego.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_55_02"); //Po tym wydarzeniu Bractwo bardzo si� podzieli�o. Nie chcia�em w to brn��, dlatego zosta�em w obozie tylko jako wolny s�uchacz.
	AI_Output (other, self,"DIA_NASZ_030_Dusty_YourArmor_55_03"); //Wcze�niej by�e� w Starym Obozie, prawda?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_55_04"); //Tak. I pewnie zosta�bym tam d�u�ej, gdyby nie pewien facet, kt�ry pom�g� mi uciec. Przekupi� stra�nika. Dobry to by� go��!
	AI_Output (other, self,"DIA_NASZ_030_Dusty_YourArmor_55_05"); //W Obozie Bractwa by�o du�o lepiej?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_55_06"); //Trudno powiedzie�. Mia�em gorsze warunki mieszkalne, bo spa�em na ziemi, jednak jedzenie by�o lepsze i mia�em �atwiejszy dost�p do bagiennego ziela.
	AI_Output (other, self,"DIA_NASZ_030_Dusty_YourArmor_55_07"); //Pewnie pali�e� ca�ymi dniami...
	AI_Output (self, other,"DIA_NASZ_030_Dusty_YourArmor_55_08"); //Tylko dzi�ki temu uda�o mi si� zapomnie� o dawnych zmartwieniach i �alach.
	
};

//*********************************************************************
//	         HowHelp
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_HowHelp   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 4;
 	condition   = DIA_NASZ_030_Dusty_HowHelp_Condition;
 	information = DIA_NASZ_030_Dusty_HowHelp_Info;
 	permanent   = FALSE;
 	description = "W jaki spos�b mog� ci pom�c?";
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
	AI_Output (other, self,"DIA_NASZ_030_Dusty_HowHelp_55_00"); //W jaki spos�b mog� ci pom�c?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HowHelp_15_01"); //W morzu jest pe�no ma�ych muszli. Chc� z nich zrobi� naszyjnik.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HowHelp_55_02"); //Ca�kiem niedawno to miejsce by�o niedost�pne, bo by�o oddzielone magiczn� barier�. Teraz muszle s� niemal na wyci�gni�cie r�ki.
	AI_Output (other, self,"DIA_NASZ_030_Dusty_HowHelp_55_03"); //To dlaczego tutaj stoisz, zamiast wskoczy� do wody? Nie umiesz p�ywa�?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HowHelp_55_04"); //Problemem jest to, �e jestem duchem. Nie mog� wej�� do wody! Dlatego �aden z pozosta�ych duch�w nie mo�e mi pom�c i w�a�nie ty jeste� dla mnie nadziej�.
	
};

//*********************************************************************
//	         WhatToDo
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_WhatToDo   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 4;
 	condition   = DIA_NASZ_030_Dusty_WhatToDo_Condition;
 	information = DIA_NASZ_030_Dusty_WhatToDo_Info;
 	permanent   = FALSE;
 	description = "Co dok�adnie mam dla ciebie wy�owi�?";
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
	AI_Output (other, self,"DIA_NASZ_030_Dusty_WhatToDo_55_00"); //Co dok�adnie mam dla ciebie wy�owi�?
	AI_Output (self, other,"DIA_NASZ_030_Dusty_WhatToDo_15_01"); //Do zrobienia naszyjnika potrzebuj� przynajmniej 10 muszli. My�l�, �e nie b�dziesz mia� problemu z ich znalezieniem.
	AI_Output (other, self,"DIA_NASZ_030_Dusty_WhatToDo_55_02"); //W takim razie wskakuj� do wody. Zaraz b�dziesz mia� swoje muszelki.
	
	// TODO B_LogEntry
};

//*********************************************************************
//	         HaveShells
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_HaveShells   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 4;
 	condition   = DIA_NASZ_030_Dusty_HaveShells_Condition;
 	information = DIA_NASZ_030_Dusty_HaveShells_Info;
 	permanent   = FALSE;
 	description = "Przynios�em muszle, o kt�re prosi�e�.";
};

FUNC INT DIA_NASZ_030_Dusty_HaveShells_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_030_Dusty_WhatToDo))
	//&& (npc_hasitems(other,ItNa_DustyShell) >= 10)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_030_Dusty_HaveShells_Info()
{
	AI_Output (other, self,"DIA_NASZ_030_Dusty_HaveShells_55_00"); //Przynios�em muszle, o kt�re prosi�e�.
	
	// TODO zrobic 25 muszli w spacerze
	
	// hero daje wszystkie jakie ma
	//B_GiveInvItems(other, self, ItNa_DustyShell, npc_hasitems(other,ItNa_DustyShell));
	
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_15_01"); //Wspaniale! Dzi�kuj� ci, dobry cz�owieku.

	if (true) {//(npc_hasitems(other,ItNa_DustyShell) >= 10) {
		AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_15_02"); //Przynios�e� ich tak du�o, �e b�d� m�g� zrobi� te� jeden dla ciebie. Chcesz?

		Info_ClearChoices (DIA_NASZ_030_Dusty_HaveShells);
			Info_AddChoice	  (DIA_NASZ_030_Dusty_HaveShells, "Pewnie! Ch�tnie taki na siebie za�o��.", DIA_NASZ_030_Dusty_HaveShells_yes);
			Info_AddChoice	  (DIA_NASZ_030_Dusty_HaveShells, "Nie, dzi�ki. Daj go kt�remu� z duch�w.", DIA_NASZ_030_Dusty_HaveShells_no);
		
	}
	else {
		AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_15_03"); //Niestety nie mam niczego, co mog� ci da�. Musz� wystarczy� ci moje modlitwy.
		AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_15_04"); //Wystarcz�. Trzymaj si�, Dusty!
	
	};
	
	// TODO B_LogEntry
};

var int Dusty_HeroWantsNecklace;
var int DustyDay; var int DustyHour;
FUNC VOID DIA_NASZ_030_Dusty_HaveShells_yes()
{
	AI_Output (other,self ,"DIA_NASZ_030_Dusty_HaveShells_yes_15_00"); //Pewnie! Ch�tnie taki na siebie za�o��.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_yes_55_01"); //Zatem przyjd� do mnie za godzin�. Naszyjnik b�dzie gotowy.

	DustyDay = Wld_GetDay();
	DustyHour = Wld_GetTimeHour();
	
	Dusty_HeroWantsNecklace = TRUE;
	
	Info_ClearChoices (DIA_NASZ_030_Dusty_HaveShells);
};

FUNC VOID DIA_NASZ_030_Dusty_HaveShells_no()
{
	AI_Output (other,self ,"DIA_NASZ_030_Dusty_HaveShells_no_15_00"); //Nie, dzi�ki. Daj go kt�remu� z duch�w.
	AI_Output (self, other,"DIA_NASZ_030_Dusty_HaveShells_no_55_01"); //Dobrze, przyjacielu. Dzi�kuj� ci za pomoc. B�d� si� za tob� modli�.

	Info_ClearChoices (DIA_NASZ_030_Dusty_HaveShells);
};


//*********************************************************************
//	         NecklaceIsReady
//*********************************************************************
INSTANCE DIA_NASZ_030_Dusty_NecklaceIsReady   (C_INFO)
{
	npc         = NASZ_030_Dusty;
 	nr          = 4;
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
	AI_Output (self, other, "DIA_NASZ_030_Dusty_NecklaceIsReady_55_00"); //Naszyjnik jest gotowy. Prosz�.

	//CreateInvItems(self,ItNa_DustyNecklace,1);
	//B_GiveInvItems(self, other, ItNa_DustyNecklace, 1);

	AI_Output (other, self, "DIA_NASZ_030_Dusty_NecklaceIsReady_55_01"); //Le�y jak ula�! Dzi�ki.
	AI_Output (self, other, "DIA_NASZ_030_Dusty_NecklaceIsReady_55_02"); //Powodzenia, przyjacielu.

	
};


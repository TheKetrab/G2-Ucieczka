var int WillWantToKillRenegats;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_EXIT   (C_INFO)
{
	npc         = NASZ_101_Korth;
	nr          = 999;
	condition   = DIA_NASZ_101_Korth_EXIT_Condition;
	information = DIA_NASZ_101_Korth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_101_Korth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_101_Korth_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_siema   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 1;
 	condition   = DIA_NASZ_101_Korth_siema_Condition;
 	information = DIA_NASZ_101_Korth_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_101_Korth_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_101_Korth_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_101_Korth_siema_55_00"); //Pssst! Poczekaj.
	AI_Output (other, self,"DIA_NASZ_101_Korth_siema_15_01"); //Co tu si� sta�o?
	AI_Output (self, other,"DIA_NASZ_101_Korth_siema_55_02"); //Jak to co? Orkowie!
	
	if (KAPITEL == 1) {
		Npc_ExchangeRoutine (self, "Start");
	};
	
	KothBiegnie = TRUE;
};

//*********************************************************************
//	Info Wiecej
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_wiecej   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 2;
 	condition   = DIA_NASZ_101_Korth_wiecej_Condition;
 	information = DIA_NASZ_101_Korth_wiecej_Info;
 	permanent   = FALSE;
	description = "Powiedz mi co� wi�cej.";
};

FUNC INT DIA_NASZ_101_Korth_wiecej_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_wiecej_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_wiecej_15_00"); //Powiedz mi co� wi�cej.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_01"); //To ty naprawd� nic nie wiesz?
	AI_Output (other, self,"DIA_NASZ_101_Korth_wiecej_15_02"); //Od kilku miesi�cy nieustannie kopa�em rud� w kopalni. Nie mia�em dost�pu do informacji o tym, co si� dzieje w Dolinie.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_03"); //No dobrze... Kilka tygodni temu kapitan Garond zrezygnowa� ze swojej misji w Kolonii. Stwierdzi�, �e nie ma ona sensu.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_04"); //Wszyscy paladyni, knechci i inni jego ludzie wyruszyli na prze��cz Khorinis. Niestety, mimo �e obok zamku nie by�o du�o ork�w, zw�szyli nas.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_05"); //Wys�ali za nami po�cig. Horda wyszkolonych orkowych wojownik�w kontra trzydziestu g�odnych i zm�czonych ludzi. Nie mieli�my szans w otwartej walce. Ruszyli�my biegiem w stron� prze��czy.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_06"); //Na prze��czy Garond zrozumia�, �e nie ma szans na ucieczk�, wi�c rozkaza� zabi� tylu ork�w, ilu damy rad�.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_15_07"); //Walczyli�my patrz�c, jak orkowie morduj� najbardziej oddanych rycerzy. Nagle us�yszeli�my d�wi�k spadaj�cych ska�...
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_09"); //Jak si� p�niej dowiedzieli�my, orkowie na prze��czy r�wnie� mieli sw�j oddzia�. Magowie Ognia wywo�ali trz�sienia ziemi, by odci�� orkom drog� do Khorinis.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_10"); //Ska�y zawali�y drog� przez prze��cz. Pod dow�dztwem Kerolotha przebili�my si� jako� przez oddzia�y oszo�omionych ork�w.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_11"); //Teraz szukamy sposobu na odbicie zamku z r�k ork�w. Za�o�yli�my ob�z niedaleko st�d i co jaki� czas odpieramy ataki ze strony ork�w.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_12"); //Ale zaraz... powiedzia�e�, �e kopa�e� rud�? Przynajmniej miesi�c temu wydobycie rudy zosta�o wstrzymane przez kapitana Garonda.

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Kilka tygodni temu kapitan Garond podj�� decyzj� o wymarszu z fortu w G�rniczej Dolinie. Paladyni w drodze na prze��cz zostali zatrzymani na w�skiej �cie�ce. Na prze��czy po stronie Khorinis toczy�a si� wielka bitwa, a Magowie Ognia widz�c to, zawalili jedyn� drog� prowadz�c� z G�rniczej Doliny. ");
};

//*********************************************************************
//	Info WillWantToKillRenegats
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_WillWantToKillRenegats   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 3;
 	condition   = DIA_NASZ_101_Korth_WillWantToKillRenegats_Condition;
 	information = DIA_NASZ_101_Korth_WillWantToKillRenegats_Info;
 	permanent   = FALSE;
	description = "By�em kopaczem w Starej Kopalni.";
};

FUNC INT DIA_NASZ_101_Korth_WillWantToKillRenegats_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_wiecej))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_WillWantToKillRenegats_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_WillWantToKillRenegats_15_00"); //By�em kopaczem w Starej Kopalni.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_01"); //Pod dow�dztwem...?
	AI_Output (other, self,"DIA_NASZ_101_Korth_WillWantToKillRenegats_15_02"); //Paladyna Marcosa.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_03"); //To wszystko wyja�nia. Pieprzony renegat. Zbyt d�ugo przebywa� sam na uboczu.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_04"); //Miesi�c temu pojawi� si� na zamku i og�osi�, �e objawi� si� mu demon. Garond chcia� wtr�ci� go do wi�zienia, ale Marcos wyteleportowa� si� z zamku.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_05"); //Nic wi�cej nie wiem. Nie my�la�em jednak, �e wr�ci do sprawowania pieczy nad kopalni�...
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_06"); //No c�... Ten problem nas nie dotyczy. Na g�owie mamy teraz ork�w.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_07"); //A jesli chodzi o ciebie, to b�dziesz musia� zdecydowa�, z kim bedziesz trzyma�.
	
	B_LogEntry (TOPIC_Korth_kopalnia, "Marcos nie tylko jest okrutnym tyranem, ale i upad�ym paladynem, kt�ry zaprzeda� dusz� Beliarowi. Skaza�cy z jego kopalni s� w niebezpiecze�stwie... Trzeba ich uwolni�, a w tym mog� mi pom�c ludzie z powsta�ych oboz�w.");
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "W G�rniczej Dolinie s� dwa skupiska ludzi: ob�z my�liwych i ob�z �owc�w ork�w.");

	WillWantToKillRenegats = TRUE;
};

//*********************************************************************
//	Info WhereShouldIJoin
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_WhereShouldIJoin   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 4;
 	condition   = DIA_NASZ_101_Korth_WhereShouldIJoin_Condition;
 	information = DIA_NASZ_101_Korth_WhereShouldIJoin_Info;
 	permanent   = FALSE;
	description = "Z kim 'b�d� trzyma�'?";
};

FUNC INT DIA_NASZ_101_Korth_WhereShouldIJoin_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_WillWantToKillRenegats))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_WhereShouldIJoin_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_WhereShouldIJoin_15_00"); //Z kim 'b�d� trzyma�'?
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_01"); //Sam w Dolinie nie przetrwasz, zapomnij. Musisz co� je�� i gdzie� spa�.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_02"); //S� dwa skupiska ludzi w tym przekl�tym miejscu.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_03"); //Pierwszy to ob�z �owc�w ork�w. Jeste�my wojownikami, unicestwienie ork�w to nasz cel. 
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_04"); //Drugi to ob�z my�liwych. Ci z kolei dzia�aj� raczej defensywnie. Zamierzaj� chyba za wszelk� cen� do�y� staro�ci.	
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_05"); //U nas, �owc�w, gorzej si� wyspa�, bo ch�opcy ha�asuj� w karczmie do bia�ego rana.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_06"); //Za to w naszym obozie zjesz du�o lepiej. Ten kucharzyna my�liwych, Snaf, gotuje rzeczy, kt�rych lepiej nie wsadza� do gard�a.
	
	if (Mission_Gildia_Ready == FALSE) {
		Log_CreateTopic (TOPIC_gildia, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_gildia, LOG_RUNNING);
		B_LogEntry (TOPIC_gildia, "W G�rniczej Dolinie powsta�y dwa obozy: my�liwych i �owc�w ork�w. Pr�dzej czy p�niej b�d� musia� zdecydowa�, do kogo chc� do��czy�.");
		Mission_Gildia_Ready = TRUE;
	};
};

//*********************************************************************
//	Info Praca
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_praca   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 5;
 	condition   = DIA_NASZ_101_Korth_praca_Condition;
 	information = DIA_NASZ_101_Korth_praca_Info;
 	permanent   = FALSE;
	description = "Co tu robisz?";
};

FUNC INT DIA_NASZ_101_Korth_praca_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_101_Korth_praca_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_praca_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_101_Korth_praca_55_01"); //Zosta�em wys�any na poszukiwanie tych, kt�rzy jeszcze �yj�. Stoj� tu ju� d�ugo, ale nie na pr�no!
	AI_Output (self, other,"DIA_NASZ_101_Korth_praca_55_02"); //Znalaz�em ju� kilku wa��saj�cych si� kopaczy, my�liwych, a nawet pirata! I oczywi�cie ciebie.

};

//*********************************************************************
//	Info Keroloth
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_keroloth   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 6;
 	condition   = DIA_NASZ_101_Korth_keroloth_Condition;
 	information = DIA_NASZ_101_Korth_keroloth_Info;
 	permanent   = FALSE;
	description = "Kim jest Keroloth?";
};

FUNC INT DIA_NASZ_101_Korth_keroloth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_wiecej))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_keroloth_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_keroloth_15_00"); //Kim jest Keroloth?
	AI_Output (self, other,"DIA_NASZ_101_Korth_keroloth_55_01"); //To mistrz walki broni� wr�cz. Przyby� wraz z Garondem do G�rniczej Doliny i uczy� walczy� pocz�tkuj�cych wojownik�w, takich jak ja. Musieli�my potrafi� przetrwa�.
	AI_Output (self, other,"DIA_NASZ_101_Korth_keroloth_55_02"); //Obecnie jest szefem �owc�w ork�w. Ca�y czas planuje odbicie zamku, chocia� nic na to nie zapowiada.
	AI_Output (other, self,"DIA_NASZ_101_Korth_keroloth_15_03"); //Dlaczego?
	AI_Output (self, other,"DIA_NASZ_101_Korth_keroloth_55_04"); //Od dw�ch tygodni stoimy w kropce. Brak nam broni, a przede wszystkim dobrze wyszkolonych ludzi.
	AI_Output (self, other,"DIA_NASZ_101_Korth_keroloth_55_05"); //Szczerze m�wi�c w�tpi�, �e zamek kiedy� zn�w b�dzie nale�a� do ludzi.

};

//*********************************************************************
//	Info Oboz
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_oboz   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 7;
 	condition   = DIA_NASZ_101_Korth_oboz_Condition;
 	information = DIA_NASZ_101_Korth_oboz_Info;
 	permanent   = FALSE;
	description = "Gdzie jest ten ob�z?";
};

FUNC INT DIA_NASZ_101_Korth_oboz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_wiecej)
		&& (WejscieDoObozuLowcow == FALSE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_oboz_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_oboz_15_00"); //Gdzie jest ten ob�z?
	AI_Output (self, other,"DIA_NASZ_101_Korth_oboz_55_01"); //W drodze z zamku do dawnego Nowego Obozu. Chocia� pewnie niewiele ci to m�wi...
	AI_Output (self, other,"DIA_NASZ_101_Korth_oboz_55_02"); //Je�li chcesz, mog� ci� tam zaprowadzi�.

	B_LogEntry (TOPIC_gildia, "Korth zaprowadzi mnie do obozu �owc�w ork�w.");

};

var int KORTH_PROWADZENIE;
//*********************************************************************
//	Info Prowadzenie
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_prowadzenie   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 8;
 	condition   = DIA_NASZ_101_Korth_prowadzenie_Condition;
 	information = DIA_NASZ_101_Korth_prowadzenie_Info;
 	permanent   = FALSE;
	description = "Zaprowad� mnie do obozu.";
};

FUNC INT DIA_NASZ_101_Korth_prowadzenie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_oboz))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_prowadzenie_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_prowadzenie_15_00"); //Zaprowad� mnie do obozu.
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_55_01"); //Dobra, ale trzymaj si� blisko mnie.

	KORTH_PROWADZENIE = TRUE;
	Npc_ExchangeRoutine (self, "Prowadzenie");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna(NASZ_101_Korth,1);
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Prowadzenie-koniec
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_prowadzenie_koniec   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 9;
 	condition   = DIA_NASZ_101_Korth_prowadzenie_koniec_Condition;
 	information = DIA_NASZ_101_Korth_prowadzenie_koniec_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_101_Korth_prowadzenie_koniec_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_prowadzenie)
		 && Npc_GetDistToWP	(self, "PATH_OC_NC_11") < 750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_prowadzenie_koniec_Info()
{
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_00"); //Jeste�my.
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_01"); //Ja wr�c� teraz nad rzek�, by szuka� nast�pnych wa��saj�cych si� po okolicy.	
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_02"); //Id� prosto do Kerolotha i porozmawiaj z nim.
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_03"); //Wr�cz mu te� ten raport. Niech wie, co dzieje si� w okolicy zamku.

	Createinvitems (self, ItNa_KorthRaport, 1);
	B_giveinvitems (self, other, ItNa_KorthRaport, 1);
	
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_04"); //Czo�em.

	B_GivePlayerXP (50);

	KORTH_PROWADZENIE = FALSE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna(NASZ_101_Korth,0);
};

//*********************************************************************
//	Info Help
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_help   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 10;
 	condition   = DIA_NASZ_101_Korth_help_Condition;
 	information = DIA_NASZ_101_Korth_help_Info;
 	permanent   = FALSE;
	description = "Mog� ci w czym� pom�c?";
};

FUNC INT DIA_NASZ_101_Korth_help_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_join))
	&& (Npc_GetDistToWP	(NASZ_101_Korth, "NASZ_TWIERDZA_32") >= 1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_help_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_help_15_00"); //Mog� ci w czym� pom�c?
	AI_Output (self, other,"DIA_NASZ_101_Korth_help_55_01"); //C�, jest takie miejsce, w kt�re trzeba by si� by�o wybra�. Podejrzewam, �e mo�e si� tam znajdowa� jaki� skazaniec.
	AI_Output (self, other,"DIA_NASZ_101_Korth_help_55_02"); //Je�li to prawda, musz� go przecie� znale��. Problem w tym, �e tamtejsza okolica nie wygl�da zbyt zach�caj�co.
	AI_Output (self, other,"DIA_NASZ_101_Korth_help_55_03"); //Mo�e poszed�by� ze mn�? W dw�ch zawsze bezpieczniej.

	Log_CreateTopic (TOPIC_draal, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_draal, LOG_RUNNING);
	B_LogEntry (TOPIC_draal, "Korth wybiera si� na poszukiwania zaginionych. Chce, �ebym mu pom�g�.");

};

var int Korth_Good_Level;
//*********************************************************************
//	Info Ok
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_ok   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 11;
 	condition   = DIA_NASZ_101_Korth_ok_Condition;
 	information = DIA_NASZ_101_Korth_ok_Info;
 	permanent   = TRUE;
	description = "Chod�my.";
};

FUNC INT DIA_NASZ_101_Korth_ok_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_help)) && (Korth_Good_Level == FALSE)
	&& (Npc_GetDistToWP	(NASZ_101_Korth, "NASZ_TWIERDZA_32") >= 1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_ok_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_ok_15_00"); //Chod�my.
	if (hero.level >= 4) {
		AI_Output (self, other,"DIA_NASZ_101_Korth_ok_55_01"); //Wiedzia�em, �e si� zgodzisz! Trzymaj si� blisko mnie. I pod �adnym pozorem nie daj si� zabi�.
		
		Korth_Good_Level = TRUE;

		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self, "Help");
		//self.aivar[AIV_PARTYMEMBER] = TRUE;
		Druzyna (NASZ_101_Korth,1);
	}
	else {
		AI_Output (self, other,"DIA_NASZ_101_Korth_ok_55_02"); //Podszk�l si� najpierw! To mo�e by� niebezpieczne.
		PrintScreen	("Wymagany poziom: 4", -1, 45, FONT_ScreenSmall, 2);
	};

};

var int korth_stop;
//*********************************************************************
//	Info Stop
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_stop   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 12;
 	condition   = DIA_NASZ_101_Korth_stop_Condition;
 	information = DIA_NASZ_101_Korth_stop_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_101_Korth_stop_Condition()	
{
	if (Korth_Good_Level == TRUE)
		 && (Npc_GetDistToWP	(self, "OW_ADD_12") < 700)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_stop_Info()
{
	AI_Output (self, other,"DIA_NASZ_101_Korth_stop_55_00"); //C�, liczy�em na to, �e kogo� spotkamy. Ale skoro ju� tutaj jeste�my, to ch�tnie odwiedz� poblisk� kopalni�.
	AI_Output (self, other,"DIA_NASZ_101_Korth_stop_55_01"); //Idziesz ze mn�, czy wracasz?
	
	B_GivePlayerXP (50);

	Info_ClearChoices (DIA_NASZ_101_Korth_stop);

		Info_AddChoice	  (DIA_NASZ_101_Korth_stop, "Id� z tob�.", DIA_NASZ_101_Korth_stop_yes);
		Info_AddChoice	  (DIA_NASZ_101_Korth_stop, "Wracam.", DIA_NASZ_101_Korth_stop_no);

};

FUNC VOID DIA_NASZ_101_Korth_stop_yes()
{
	AI_Output (other,self ,"DIA_NASZ_101_Korth_stop_yes_15_00"); //Id� z tob�.
	AI_Output (self, other,"DIA_NASZ_101_Korth_stop_yes_55_01"); //Mi�o z twojej strony. Nie czeka nas d�uga droga. Szybko.

	B_LogEntry (TOPIC_draal, "Do tej pory nie znale�li�my nikogo. Idziemy do kopalni. Mo�e znajdziemy kogo� w �rodku?");

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "MineA");
	korth_stop=TRUE;
};

FUNC VOID DIA_NASZ_101_Korth_stop_no()
{
	AI_Output (other,self ,"DIA_NASZ_101_Korth_stop_no_15_00"); //Wracam.
	AI_Output (self, other,"DIA_NASZ_101_Korth_stop_no_55_01"); //Szkoda. Zatem do zobaczenia! I uwa�aj na siebie.

	Log_SetTopicStatus (TOPIC_draal, LOG_SUCCESS);
	B_LogEntry (TOPIC_draal, "Niestety, nie znale�li�my nikogo.");

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "MineB");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_101_Korth,0);
};

//*********************************************************************
//	Info Mine
//*********************************************************************
var int KorthIsInMine;
INSTANCE DIA_NASZ_101_Korth_mine   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 13;
 	condition   = DIA_NASZ_101_Korth_mine_Condition;
 	information = DIA_NASZ_101_Korth_mine_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_101_Korth_mine_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_101_Korth_stop)
		&& Hlp_StrCmp(Npc_GetNearestWP(self),"OW_NEWMINE_09_B")
		&& korth_stop)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_mine_Info()
{
	AI_Output (self, other,"DIA_NASZ_101_Korth_mine_55_00"); //Jeste�my przed kopalni�. Uwierzysz, �e jeszcze dwa miesi�ce temu pracowali tutaj ludzie?
	AI_Output (self, other,"DIA_NASZ_101_Korth_mine_55_01"); //Patrz na te martwe cia�a. To potworne...
	AI_Output (self, other,"DIA_NASZ_101_Korth_mine_55_02"); //Wejd� do �rodka. Mo�e co� lub kogo� znajdziesz. Ja zostan� tutaj i b�d� ubezpiecza� ty�y.

	KorthIsInMine = TRUE;

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "MineB");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_101_Korth,0);
};

//*********************************************************************
//	Info MineEnd
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_MineEnd   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 14;
 	condition   = DIA_NASZ_101_Korth_MineEnd_Condition;
 	information = DIA_NASZ_101_Korth_MineEnd_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_101_Korth_MineEnd_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_007_Draal_lets)
		&& ((KorthIsInMine == TRUE) || ((Npc_GetDistToWP	(self, "OW_NEWMINE_11") < 1500))))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_MineEnd_Info()
{
	AI_Output (self, other,"DIA_NASZ_101_Korth_MineEnd_55_00"); //Ci przekl�ci orkowie! Dobrze, �e by�em w pobli�u. O, widz�, �e nawet kogo� znalaz�e�.
	AI_Output (other, self,"DIA_NASZ_101_Korth_MineEnd_55_01"); //Tak, Draala, by�ego wi�nia.
	AI_Output (self, other,"DIA_NASZ_101_Korth_MineEnd_55_02"); //To bez znaczenia, z pozosta�ych przy �yciu ludzi, przynajmniej po�owa to przest�pcy i skaza�cy. C� za ironia, kr�lewscy rycerze i stra�nicy walcz� po jednej stronie... Musimy ��czy� si�y, aby przetrwa�.
	AI_Output (other, self,"DIA_NASZ_101_Korth_MineEnd_55_03"); //Draal chce, �ebym doprowadzi� go do obozu my�liwych.
	AI_Output (self, other,"DIA_NASZ_101_Korth_MineEnd_55_04"); //Zajmij si� tym. Ja wracam nad rzek� patrolowa�.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Start");

};

//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_goth   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 18;
 	condition   = DIA_NASZ_101_Korth_goth_Condition;
 	information = DIA_NASZ_101_Korth_goth_Info;
 	permanent   = FALSE;
	description = "S�ysza�em, �e �owcy okradli my�liwego Gotha.";
};

FUNC INT DIA_NASZ_101_Korth_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_goth_55_00"); //S�ysza�em, �e �owcy okradli my�liwego Gotha.
	AI_Output (self, other,"DIA_NASZ_101_Korth_goth_55_01"); //Serio? Nie bywam w obozie, tak�e nic o tym nie wiem.

	B_LogEntry (TOPIC_Goth_kradziez, "Korth nie wie nic na temat kradzie�y. Chocia� to dziwne, �eby najbardziej obyty �owca nie s�ysza� o niczym...");

};

//*********************************************************************
//	Info InTwierdza
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_InTwierdza   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 31;
 	condition   = DIA_NASZ_101_Korth_InTwierdza_Condition;
 	information = DIA_NASZ_101_Korth_InTwierdza_Info;
 	permanent   = TRUE;
	description = "Ty te� tutaj?";
};

FUNC INT DIA_NASZ_101_Korth_InTwierdza_Condition()	
{
	if (KAPITEL == 3) && (Npc_GetDistToWP	(self, "NASZ_TWIERDZA_32") < 750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_InTwierdza_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_InTwierdza_55_00"); //Ty te� tutaj?
	AI_Output (self, other,"DIA_NASZ_101_Korth_InTwierdza_55_01"); //Keroloth mnie potrzebowa�, wi�c jestem.
	AI_Output (self, other,"DIA_NASZ_101_Korth_InTwierdza_55_02"); //Ile mo�na si� ugania� za zaginionymi?

};

//*********************************************************************
//	Info InCastle
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_InCastle   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 41;
 	condition   = DIA_NASZ_101_Korth_InCastle_Condition;
 	information = DIA_NASZ_101_Korth_InCastle_Info;
 	permanent   = TRUE;
	description = "Teraz bawisz si� w str�owanie zamku?";
};

FUNC INT DIA_NASZ_101_Korth_InCastle_Condition()	
{
	if (KAPITEL == 4) && (Npc_GetDistToWP	(self, "NASZ_ZAMEK_PASSAGE") < 750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_InCastle_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_InCastle_55_00"); //Teraz bawisz si� w str�owanie zamku?
	AI_Output (self, other,"DIA_NASZ_101_Korth_InCastle_55_01"); //Trzeba mie� bez przerwy wyt�ony wzrok, czy przypadkiem orkowie nie wracaj� z odsiecz�.
	AI_Output (self, other,"DIA_NASZ_101_Korth_InCastle_55_02"); //Jakby nie by�o, wystarczy mi kr�tka drzemka pod murami zamku, wi�c nic mnie nie zaskoczy.
	AI_Output (self, other,"DIA_NASZ_101_Korth_InCastle_55_03"); //A przy tym ca�kiem szybko biegam. W razie czego zamkn� bram� zamku.

};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_101_Korth_HowAreYou   (C_INFO)
{
	npc         = NASZ_101_Korth;
 	nr          = 500;
 	condition   = DIA_NASZ_101_Korth_HowAreYou_Condition;
 	information = DIA_NASZ_101_Korth_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Nie nudzisz si� tutaj samemu?";
};

FUNC INT DIA_NASZ_101_Korth_HowAreYou_Condition()
{
	if (Npc_GetDistToWP	(self, "OW_PATH_1_1_WASH") <=500) || (Npc_GetDistToWP	(self, "NASZ_PIWO_1") <=500) || (Npc_GetDistToWP	(self, "NASZ_ZAMEK_PASSAGE") <=500)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_101_Korth_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_101_Korth_HowAreYou_15_00"); //Nie nudzisz si� tutaj samemu?

	if (Npc_GetDistToWP	(self, "OW_PATH_1_1_WASH") <=500)
	{
		AI_Output (self, other,"DIA_NASZ_101_Korth_HowAreYou_55_01"); //Raczej nie. Od czasu do czasu zdarzy mi si� spotka� z my�liwym Tedem.
	};
	
	if (Npc_GetDistToWP	(self, "NASZ_PIWO_1") <=500)
	{
		AI_Output (self, other,"DIA_NASZ_101_Korth_HowAreYou_55_02"); //My�lisz, �e warzenie piwa to taka b�ahostka? To trudniejsze i ciekawsze ni� my�lisz.
	};

	if (Npc_GetDistToWP	(self, "NASZ_ZAMEK_PASSAGE") <=500)
	{
		AI_Output (self, other,"DIA_NASZ_101_Korth_HowAreYou_55_03"); //Ani troch�. Musz� by� ca�y czas skupiony. A co, jak orkowie planuj� odbicie zamku?
	};	

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_101_Korth_PICKPOCKET (C_INFO)
{
	npc			= NASZ_101_Korth;
	nr			= 900;
	condition	= DIA_NASZ_101_Korth_PICKPOCKET_Condition;
	information	= DIA_NASZ_101_Korth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_101_Korth_PICKPOCKET_Condition()
{
	C_Beklauen (36);
};
 
FUNC VOID DIA_NASZ_101_Korth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_101_Korth_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_101_Korth_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_101_Korth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_101_Korth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_101_Korth_PICKPOCKET_DoIt);
};

func void DIA_NASZ_101_Korth_PICKPOCKET_DoIt()
{
	B_BeklauenGold (23);
	Info_ClearChoices (DIA_NASZ_101_Korth_PICKPOCKET);
};
	
func void DIA_NASZ_101_Korth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_101_Korth_PICKPOCKET);
};

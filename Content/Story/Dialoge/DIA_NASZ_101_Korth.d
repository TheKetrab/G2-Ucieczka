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
	AI_Output (other, self,"DIA_NASZ_101_Korth_siema_15_01"); //Co tu siê sta³o?
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
	description = "Powiedz mi coœ wiêcej.";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_wiecej_15_00"); //Powiedz mi coœ wiêcej.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_01"); //To ty naprawdê nic nie wiesz?
	AI_Output (other, self,"DIA_NASZ_101_Korth_wiecej_15_02"); //Od kilku miesiêcy nieustannie kopa³em rudê w kopalni. Nie mia³em dostêpu do informacji o tym, co siê dzieje w Dolinie.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_03"); //No dobrze... Kilka tygodni temu kapitan Garond zrezygnowa³ ze swojej misji w Kolonii. Stwierdzi³, ¿e nie ma ona sensu.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_04"); //Wszyscy paladyni, knechci i inni jego ludzie wyruszyli na prze³êcz Khorinis. Niestety, mimo ¿e obok zamku nie by³o du¿o orków, zwêszyli nas.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_05"); //Wys³ali za nami poœcig. Horda wyszkolonych orkowych wojowników kontra trzydziestu g³odnych i zmêczonych ludzi. Nie mieliœmy szans w otwartej walce. Ruszyliœmy biegiem w stronê prze³êczy.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_06"); //Na prze³êczy Garond zrozumia³, ¿e nie ma szans na ucieczkê, wiêc rozkaza³ zabiæ tylu orków, ilu damy radê.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_15_07"); //Walczyliœmy patrz¹c, jak orkowie morduj¹ najbardziej oddanych rycerzy. Nagle us³yszeliœmy dŸwiêk spadaj¹cych ska³...
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_09"); //Jak siê póŸniej dowiedzieliœmy, orkowie na prze³êczy równie¿ mieli swój oddzia³. Magowie Ognia wywo³ali trzêsienia ziemi, by odci¹æ orkom drogê do Khorinis.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_10"); //Ska³y zawali³y drogê przez prze³êcz. Pod dowództwem Kerolotha przebiliœmy siê jakoœ przez oddzia³y oszo³omionych orków.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_11"); //Teraz szukamy sposobu na odbicie zamku z r¹k orków. Za³o¿yliœmy obóz niedaleko st¹d i co jakiœ czas odpieramy ataki ze strony orków.
	AI_Output (self, other,"DIA_NASZ_101_Korth_wiecej_55_12"); //Ale zaraz... powiedzia³eœ, ¿e kopa³eœ rudê? Przynajmniej miesi¹c temu wydobycie rudy zosta³o wstrzymane przez kapitana Garonda.

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Kilka tygodni temu kapitan Garond podj¹³ decyzjê o wymarszu z fortu w Górniczej Dolinie. Paladyni w drodze na prze³êcz zostali zatrzymani na w¹skiej œcie¿ce. Na prze³êczy po stronie Khorinis toczy³a siê wielka bitwa, a Magowie Ognia widz¹c to, zawalili jedyn¹ drogê prowadz¹c¹ z Górniczej Doliny. ");
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
	description = "By³em kopaczem w Starej Kopalni.";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_WillWantToKillRenegats_15_00"); //By³em kopaczem w Starej Kopalni.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_01"); //Pod dowództwem...?
	AI_Output (other, self,"DIA_NASZ_101_Korth_WillWantToKillRenegats_15_02"); //Paladyna Marcosa.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_03"); //To wszystko wyjaœnia. Pieprzony renegat. Zbyt d³ugo przebywa³ sam na uboczu.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_04"); //Miesi¹c temu pojawi³ siê na zamku i og³osi³, ¿e objawi³ siê mu demon. Garond chcia³ wtr¹ciæ go do wiêzienia, ale Marcos wyteleportowa³ siê z zamku.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_05"); //Nic wiêcej nie wiem. Nie myœla³em jednak, ¿e wróci do sprawowania pieczy nad kopalni¹...
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_06"); //No có¿... Ten problem nas nie dotyczy. Na g³owie mamy teraz orków.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WillWantToKillRenegats_55_07"); //A jesli chodzi o ciebie, to bêdziesz musia³ zdecydowaæ, z kim bedziesz trzymaæ.
	
	B_LogEntry (TOPIC_Korth_kopalnia, "Marcos nie tylko jest okrutnym tyranem, ale i upad³ym paladynem, który zaprzeda³ duszê Beliarowi. Skazañcy z jego kopalni s¹ w niebezpieczeñstwie... Trzeba ich uwolniæ, a w tym mog¹ mi pomóc ludzie z powsta³ych obozów.");
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "W Górniczej Dolinie s¹ dwa skupiska ludzi: obóz myœliwych i obóz ³owców orków.");

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
	description = "Z kim 'bêdê trzymaæ'?";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_WhereShouldIJoin_15_00"); //Z kim 'bêdê trzymaæ'?
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_01"); //Sam w Dolinie nie przetrwasz, zapomnij. Musisz coœ jeœæ i gdzieœ spaæ.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_02"); //S¹ dwa skupiska ludzi w tym przeklêtym miejscu.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_03"); //Pierwszy to obóz ³owców orków. Jesteœmy wojownikami, unicestwienie orków to nasz cel. 
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_04"); //Drugi to obóz myœliwych. Ci z kolei dzia³aj¹ raczej defensywnie. Zamierzaj¹ chyba za wszelk¹ cenê do¿yæ staroœci.	
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_05"); //U nas, ³owców, gorzej siê wyspaæ, bo ch³opcy ha³asuj¹ w karczmie do bia³ego rana.
	AI_Output (self, other,"DIA_NASZ_101_Korth_WhereShouldIJoin_55_06"); //Za to w naszym obozie zjesz du¿o lepiej. Ten kucharzyna myœliwych, Snaf, gotuje rzeczy, których lepiej nie wsadzaæ do gard³a.
	
	if (Mission_Gildia_Ready == FALSE) {
		Log_CreateTopic (TOPIC_gildia, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_gildia, LOG_RUNNING);
		B_LogEntry (TOPIC_gildia, "W Górniczej Dolinie powsta³y dwa obozy: myœliwych i ³owców orków. Prêdzej czy póŸniej bêdê musia³ zdecydowaæ, do kogo chcê do³¹czyæ.");
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
	AI_Output (self, other,"DIA_NASZ_101_Korth_praca_55_01"); //Zosta³em wys³any na poszukiwanie tych, którzy jeszcze ¿yj¹. Stojê tu ju¿ d³ugo, ale nie na pró¿no!
	AI_Output (self, other,"DIA_NASZ_101_Korth_praca_55_02"); //Znalaz³em ju¿ kilku wa³êsaj¹cych siê kopaczy, myœliwych, a nawet pirata! I oczywiœcie ciebie.

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
	AI_Output (self, other,"DIA_NASZ_101_Korth_keroloth_55_01"); //To mistrz walki broni¹ wrêcz. Przyby³ wraz z Garondem do Górniczej Doliny i uczy³ walczyæ pocz¹tkuj¹cych wojowników, takich jak ja. Musieliœmy potrafiæ przetrwaæ.
	AI_Output (self, other,"DIA_NASZ_101_Korth_keroloth_55_02"); //Obecnie jest szefem ³owców orków. Ca³y czas planuje odbicie zamku, chocia¿ nic na to nie zapowiada.
	AI_Output (other, self,"DIA_NASZ_101_Korth_keroloth_15_03"); //Dlaczego?
	AI_Output (self, other,"DIA_NASZ_101_Korth_keroloth_55_04"); //Od dwóch tygodni stoimy w kropce. Brak nam broni, a przede wszystkim dobrze wyszkolonych ludzi.
	AI_Output (self, other,"DIA_NASZ_101_Korth_keroloth_55_05"); //Szczerze mówi¹c w¹tpiê, ¿e zamek kiedyœ znów bêdzie nale¿a³ do ludzi.

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
	description = "Gdzie jest ten obóz?";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_oboz_15_00"); //Gdzie jest ten obóz?
	AI_Output (self, other,"DIA_NASZ_101_Korth_oboz_55_01"); //W drodze z zamku do dawnego Nowego Obozu. Chocia¿ pewnie niewiele ci to mówi...
	AI_Output (self, other,"DIA_NASZ_101_Korth_oboz_55_02"); //Jeœli chcesz, mogê ciê tam zaprowadziæ.

	B_LogEntry (TOPIC_gildia, "Korth zaprowadzi mnie do obozu ³owców orków.");

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
	description = "ZaprowadŸ mnie do obozu.";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_prowadzenie_15_00"); //ZaprowadŸ mnie do obozu.
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_55_01"); //Dobra, ale trzymaj siê blisko mnie.

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
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_00"); //Jesteœmy.
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_01"); //Ja wrócê teraz nad rzekê, by szukaæ nastêpnych wa³êsaj¹cych siê po okolicy.	
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_02"); //IdŸ prosto do Kerolotha i porozmawiaj z nim.
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_03"); //Wrêcz mu te¿ ten raport. Niech wie, co dzieje siê w okolicy zamku.

	Createinvitems (self, ItNa_KorthRaport, 1);
	B_giveinvitems (self, other, ItNa_KorthRaport, 1);
	
	AI_Output (self, other,"DIA_NASZ_101_Korth_prowadzenie_koniec_55_04"); //Czo³em.

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
	description = "Mogê ci w czymœ pomóc?";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_help_15_00"); //Mogê ci w czymœ pomóc?
	AI_Output (self, other,"DIA_NASZ_101_Korth_help_55_01"); //Có¿, jest takie miejsce, w które trzeba by siê by³o wybraæ. Podejrzewam, ¿e mo¿e siê tam znajdowaæ jakiœ skazaniec.
	AI_Output (self, other,"DIA_NASZ_101_Korth_help_55_02"); //Jeœli to prawda, muszê go przecie¿ znaleŸæ. Problem w tym, ¿e tamtejsza okolica nie wygl¹da zbyt zachêcaj¹co.
	AI_Output (self, other,"DIA_NASZ_101_Korth_help_55_03"); //Mo¿e poszed³byœ ze mn¹? W dwóch zawsze bezpieczniej.

	Log_CreateTopic (TOPIC_draal, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_draal, LOG_RUNNING);
	B_LogEntry (TOPIC_draal, "Korth wybiera siê na poszukiwania zaginionych. Chce, ¿ebym mu pomóg³.");

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
	description = "ChodŸmy.";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_ok_15_00"); //ChodŸmy.
	if (hero.level >= 4) {
		AI_Output (self, other,"DIA_NASZ_101_Korth_ok_55_01"); //Wiedzia³em, ¿e siê zgodzisz! Trzymaj siê blisko mnie. I pod ¿adnym pozorem nie daj siê zabiæ.
		
		Korth_Good_Level = TRUE;

		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self, "Help");
		//self.aivar[AIV_PARTYMEMBER] = TRUE;
		Druzyna (NASZ_101_Korth,1);
	}
	else {
		AI_Output (self, other,"DIA_NASZ_101_Korth_ok_55_02"); //Podszkól siê najpierw! To mo¿e byæ niebezpieczne.
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
	AI_Output (self, other,"DIA_NASZ_101_Korth_stop_55_00"); //Có¿, liczy³em na to, ¿e kogoœ spotkamy. Ale skoro ju¿ tutaj jesteœmy, to chêtnie odwiedzê poblisk¹ kopalniê.
	AI_Output (self, other,"DIA_NASZ_101_Korth_stop_55_01"); //Idziesz ze mn¹, czy wracasz?
	
	B_GivePlayerXP (50);

	Info_ClearChoices (DIA_NASZ_101_Korth_stop);

		Info_AddChoice	  (DIA_NASZ_101_Korth_stop, "Idê z tob¹.", DIA_NASZ_101_Korth_stop_yes);
		Info_AddChoice	  (DIA_NASZ_101_Korth_stop, "Wracam.", DIA_NASZ_101_Korth_stop_no);

};

FUNC VOID DIA_NASZ_101_Korth_stop_yes()
{
	AI_Output (other,self ,"DIA_NASZ_101_Korth_stop_yes_15_00"); //Idê z tob¹.
	AI_Output (self, other,"DIA_NASZ_101_Korth_stop_yes_55_01"); //Mi³o z twojej strony. Nie czeka nas d³uga droga. Szybko.

	B_LogEntry (TOPIC_draal, "Do tej pory nie znaleŸliœmy nikogo. Idziemy do kopalni. Mo¿e znajdziemy kogoœ w œrodku?");

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "MineA");
	korth_stop=TRUE;
};

FUNC VOID DIA_NASZ_101_Korth_stop_no()
{
	AI_Output (other,self ,"DIA_NASZ_101_Korth_stop_no_15_00"); //Wracam.
	AI_Output (self, other,"DIA_NASZ_101_Korth_stop_no_55_01"); //Szkoda. Zatem do zobaczenia! I uwa¿aj na siebie.

	Log_SetTopicStatus (TOPIC_draal, LOG_SUCCESS);
	B_LogEntry (TOPIC_draal, "Niestety, nie znaleŸliœmy nikogo.");

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
	AI_Output (self, other,"DIA_NASZ_101_Korth_mine_55_00"); //Jesteœmy przed kopalni¹. Uwierzysz, ¿e jeszcze dwa miesi¹ce temu pracowali tutaj ludzie?
	AI_Output (self, other,"DIA_NASZ_101_Korth_mine_55_01"); //Patrz na te martwe cia³a. To potworne...
	AI_Output (self, other,"DIA_NASZ_101_Korth_mine_55_02"); //WejdŸ do œrodka. Mo¿e coœ lub kogoœ znajdziesz. Ja zostanê tutaj i bêdê ubezpiecza³ ty³y.

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
	AI_Output (self, other,"DIA_NASZ_101_Korth_MineEnd_55_00"); //Ci przeklêci orkowie! Dobrze, ¿e by³em w pobli¿u. O, widzê, ¿e nawet kogoœ znalaz³eœ.
	AI_Output (other, self,"DIA_NASZ_101_Korth_MineEnd_55_01"); //Tak, Draala, by³ego wiêŸnia.
	AI_Output (self, other,"DIA_NASZ_101_Korth_MineEnd_55_02"); //To bez znaczenia, z pozosta³ych przy ¿yciu ludzi, przynajmniej po³owa to przestêpcy i skazañcy. Có¿ za ironia, królewscy rycerze i stra¿nicy walcz¹ po jednej stronie... Musimy ³¹czyæ si³y, aby przetrwaæ.
	AI_Output (other, self,"DIA_NASZ_101_Korth_MineEnd_55_03"); //Draal chce, ¿ebym doprowadzi³ go do obozu myœliwych.
	AI_Output (self, other,"DIA_NASZ_101_Korth_MineEnd_55_04"); //Zajmij siê tym. Ja wracam nad rzekê patrolowaæ.
	
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
	description = "S³ysza³em, ¿e ³owcy okradli myœliwego Gotha.";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_goth_55_00"); //S³ysza³em, ¿e ³owcy okradli myœliwego Gotha.
	AI_Output (self, other,"DIA_NASZ_101_Korth_goth_55_01"); //Serio? Nie bywam w obozie, tak¿e nic o tym nie wiem.

	B_LogEntry (TOPIC_Goth_kradziez, "Korth nie wie nic na temat kradzie¿y. Chocia¿ to dziwne, ¿eby najbardziej obyty ³owca nie s³ysza³ o niczym...");

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
	description = "Ty te¿ tutaj?";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_InTwierdza_55_00"); //Ty te¿ tutaj?
	AI_Output (self, other,"DIA_NASZ_101_Korth_InTwierdza_55_01"); //Keroloth mnie potrzebowa³, wiêc jestem.
	AI_Output (self, other,"DIA_NASZ_101_Korth_InTwierdza_55_02"); //Ile mo¿na siê uganiaæ za zaginionymi?

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
	description = "Teraz bawisz siê w stró¿owanie zamku?";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_InCastle_55_00"); //Teraz bawisz siê w stró¿owanie zamku?
	AI_Output (self, other,"DIA_NASZ_101_Korth_InCastle_55_01"); //Trzeba mieæ bez przerwy wytê¿ony wzrok, czy przypadkiem orkowie nie wracaj¹ z odsiecz¹.
	AI_Output (self, other,"DIA_NASZ_101_Korth_InCastle_55_02"); //Jakby nie by³o, wystarczy mi krótka drzemka pod murami zamku, wiêc nic mnie nie zaskoczy.
	AI_Output (self, other,"DIA_NASZ_101_Korth_InCastle_55_03"); //A przy tym ca³kiem szybko biegam. W razie czego zamknê bramê zamku.

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
 	description = "Nie nudzisz siê tutaj samemu?";
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
	AI_Output (other, self,"DIA_NASZ_101_Korth_HowAreYou_15_00"); //Nie nudzisz siê tutaj samemu?

	if (Npc_GetDistToWP	(self, "OW_PATH_1_1_WASH") <=500)
	{
		AI_Output (self, other,"DIA_NASZ_101_Korth_HowAreYou_55_01"); //Raczej nie. Od czasu do czasu zdarzy mi siê spotkaæ z myœliwym Tedem.
	};
	
	if (Npc_GetDistToWP	(self, "NASZ_PIWO_1") <=500)
	{
		AI_Output (self, other,"DIA_NASZ_101_Korth_HowAreYou_55_02"); //Myœlisz, ¿e warzenie piwa to taka b³ahostka? To trudniejsze i ciekawsze ni¿ myœlisz.
	};

	if (Npc_GetDistToWP	(self, "NASZ_ZAMEK_PASSAGE") <=500)
	{
		AI_Output (self, other,"DIA_NASZ_101_Korth_HowAreYou_55_03"); //Ani trochê. Muszê byæ ca³y czas skupiony. A co, jak orkowie planuj¹ odbicie zamku?
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

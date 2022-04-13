
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_021_Nieznajomy_EXIT   (C_INFO)
{
	npc         = NASZ_021_Nieznajomy;
	nr          = 999;
	condition   = DIA_NASZ_021_Nieznajomy_EXIT_Condition;
	information = DIA_NASZ_021_Nieznajomy_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_021_Nieznajomy_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_021_Nieznajomy_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
	Snd_Play ("MFX_TELEPORT_CAST");
	AI_Teleport (self, "TOT"); 
	B_StartOtherRoutine (self,"End");

};


//*********************************************************************
//	         StartZacmienieOUT
//*********************************************************************
INSTANCE DIA_NASZ_021_Nieznajomy_StartZacmienieOUT   (C_INFO)
{
	npc         = NASZ_021_Nieznajomy;
 	nr          = 2;
 	condition   = DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_Condition;
 	information = DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_Condition()	
{
	if (hero.guild == GIL_OUT)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_Info()
{
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_15_00"); //Co ty tutaj robisz? I kim jeste�?
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_01"); //Mog� si� ciebie zapyta� o to samo, m�odzie�cze. Sam fakt tego, �e si� tutaj znalaz�e� �wiadczy o tym, �e m�j stra�nik poleg� i nie wykona� swojej misji.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_02"); //Ta bestia to by� tw�j stra�nik? Kiepsko spe�nia� swoj� rol� skoro doprowadzi� mnie do tego miejsca!
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_03"); //Taki by� w�a�nie jego cel, czy� nie zostawi� wam wystarczaj�cych dowod�w, by�cie wpadli na jego trop? 
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_04"); //Niestety, ku mojemu niezadowoleniu wykona� jedynie cz�� swojego planu. Drug� by�a pozbawienie was �ycia, ale to ju� nie wa�ne.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_05"); //Wa�ne jest, �e si� tutaj stawi�e� i mo�esz spojrze� mi w oczy. Czy� nie wydaj� ci si� znajome? Oczywi�cie, �e tak. Przecie� doskonale mnie znasz, chocia� mog�e� chcie� wymaza� te wspomnienia ze swojej pami�ci.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_06"); //Bardzo cz�sto przebywa�e� w gospodzie na jeziorze w Nowym Obozie, gdzie mieli�my zawsze okazj�, by si� napi� i poopowiada� sobie nowiny jakie obiega�y koloni�.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_07"); //Wszystko trwa�o w sielance do momentu, a� do kolonii zacz�li przybywa� orkowie, a my zostali�my zmuszeni do ucieczki.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_08"); //Ja uda�em si� wtedy do mojego mistrza, guru, kt�ry nauczy� mnie produkcji bagiennego ziela. Terminowa� u niego jeszcze jeden nowicjusz.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_09"); //Jego te� znasz, gdy� zamieszkiwa� obok twojej chaty w starym obozie. Tak, to Cain.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_10"); //Jak widzisz, pozosta�em wierny swojemu mistrzowi, mimo i� ten ju� dawno nie �yje. Nadal wykonuj� jego wol� i wype�niam rozkazy, chocia� ten w kt�rego wierzymy ju� tutaj nie przebywa.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_11"); //K�amiesz! Chcesz zm�ci� mi umys�, aby potem mnie zabi�. Nie pozwol� ci na to!
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_12"); //Twoim przeznaczeniem nie jest umrze� ju� teraz. Mia�e� na mnie trafi�, aby dopiero je pozna�. A jest ono bardzo mocno zwi�zane z Za�mieniem, i czy tego chcesz, czy nie, jeste� jego istotnym elementem.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_13"); //Nasza walka nie mia�aby �adnego sensu. Nie w tej chwili i tym czasie. Przyjdzie jeszcze na to odpowiednia pora.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_14"); //Pami�taj, i� Za�mienia nie zdo�a powstrzyma� nikt, ani nic.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_15"); //Czym jest to Za�mienie i dlaczego chcecie do niego doprowadzi�?
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_16"); //Hahaha! Rozczarowa�e� mnie! Jednak czego mog�em spodziewa� si� po zwyk�ym my�liwym? Popytaj swoich paladyn�w w obozie �owc�w. Mo�e oni powiedz� ci o tym co� wi�cej!
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_17"); //Tymczasem pozostawiam ci� w tej niewiedzy. Jeszcze si� spotkamy, �miertelniku.
	
	B_LogEntry (TOPIC_Jehen_poscig, "To spotkanie by�o dziwne... Ciekawe, czy ma to zwi�zek z besti� i co powie na to Jehen.");
	
	Log_CreateTopic (TOPIC_zacmienie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_zacmienie, LOG_RUNNING);
	B_LogEntry (TOPIC_zacmienie, "W jaskini spotka�em tajemniczego maga, kt�ry powiedzia� mi, i� jestem cz�ci� jakiego� za�mienia. Nie wiem czym to jest lecz powinienem czym pr�dzej powiadomi� o tym Gestatha i Keroloha. By� mo�e oni mi co� o tym powiedz�.");
	ff_ApplyOnceExt(ZadanieJehen,2000,-1);
	
	B_StartOtherRoutine(NASZ_232_Jehen,"Part2");
	
};

//*********************************************************************
//	         StartZacmienieDJG
//*********************************************************************
INSTANCE DIA_NASZ_021_Nieznajomy_StartZacmienieDJG   (C_INFO)
{
	npc         = NASZ_021_Nieznajomy;
 	nr          = 2;
 	condition   = DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_Condition;
 	information = DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_Condition()	
{
	if (hero.guild == GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_Info()
{
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_15_00"); //Ty... Kim lub czym ty jeste�?
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_01"); //Widz�, �e moi stra�nicy nie zdo�ali wykona� powierzonego im zadania. Tym nieumar�ym s�ugusom nie mo�na wierzy�. Za� co do ciebie...
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_02"); //Ale� znamy si� bardzo dobrze, Willu. Mo�esz mnie nie kojarzy�, ale nasze drogi ju� si� kiedy� skrzy�owa�y.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_03"); //Pami�tasz Stary Ob�z? Mieszka�em w pobli�u twojej chaty i zajmowa�em si� sprzedawaniem ziela i napar�w, kt�rych wytwarzania nauczy�em si� od mojego mistrza.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_04"); //Jak widzisz, nadal s�u�� swojemu mistrzowi. Wcze�niej odwr�ci�em si� od jego s��w, tak jak wielu innych moich braci, lecz oni zap�acili za to srogo.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_05"); //Pr�bujesz zm�ci� me my�li magu, ale nie uda ci si�. Cokolwiek planujesz, powstrzymam ci�!
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_06"); //To nie czas i miejsce na nasz� walk�. Twoje przeznaczenie musi si� jeszcze dope�ni�, by� m�g� rzuci� mi wyzwanie.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_07"); //Nasza walka i tak nie przyniesie ci �adnej korzy�ci, gdy� pierwsza ofiara zosta�a ju� z�o�ona ku pot�dze mego pana. Nikt ani nic nie powstrzyma Za�mienia.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_08"); //Co to za Za�mienie?
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_09"); //Ha, ha, ha! Rozczarowujesz mnie teraz. Nie masz poj�cia, z czym si� mierzysz, a i tak rzucasz wyzwanie temu czemu�? Jedynie �miertelnicy potrafi� by� tak lekkomy�lni.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_10"); //Mo�e powiniene� porozmawia� o tym ze swoimi paladynami czy magami? W ko�cu tak wiernie im s�u�ysz i wykonujesz ka�de z ich polece�.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_11"); //A teraz wybacz, obowi�zki wzywaj�. Do zobaczenia, Willu.
	
	B_LogEntry (TOPIC_Jenkins_bestia, "Po pokonaniu bestii spotkali�my tajemniczego maga, kt�ry po rozmowie znikn�� nim zd��y�em co� zrobi�. W zaistnia�ej sytuacji nie pozostaje mi nic innego jak wr�ci� do obozu. Lecz nigdzie nie ma Matta, czy�by wr�ci� do obozu? Nim wr�c� do obozu musz� poszuka� Matta, gdzie on m�g� p�j��? Mo�e zszed� na d�? Powinienem przeszuka� okolic� wej�cia do kopalni.");
	
	AI_Teleport(NASZ_129_Matt,"NASZ_MATT_DEAD");
	B_StartOtherRoutine(NASZ_129_Matt,"Dead");
	B_KillNPC(NASZ_129_Matt);
	CreateInvItems(NASZ_129_Matt,ItNa_RytualneOstrze,1);
	CreateInvItems(NASZ_129_Matt,ItNa_Matt_Kartka,1);
	
	Log_CreateTopic (TOPIC_zacmienie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_zacmienie, LOG_RUNNING);
	B_LogEntry (TOPIC_zacmienie, "Na p�askowy�u spotka�em tajemniczego maga, kt�ry podawa� si� za cz�owieka dawno zmar�ego w wyniku zamieszek w starym obozie po przybyciu do doliny paladyn�w. Wspomnia� co� o Za�mieniu. Nie wiem, co to mo�e oznacza�, lecz najbezpieczniej b�dzie obserwowa� sytuacj� i wyczekiwa� w�a�ciwego momentu.");
	
};

//*********************************************************************
//	         Matt
//*********************************************************************
INSTANCE DIA_NASZ_021_Nieznajomy_Matt   (C_INFO)
{
	npc         = NASZ_021_Nieznajomy;
 	nr          = 2;
 	condition   = DIA_NASZ_021_Nieznajomy_Matt_Condition;
 	information = DIA_NASZ_021_Nieznajomy_Matt_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_021_Nieznajomy_Matt_Condition()	
{
	if (npc_knowsinfo(other,DIA_NASZ_021_Nieznajomy_StartZacmienieDJG))
	&& (npc_hasitems(hero,ItNa_RytualneOstrze)>=1)
	&& (npc_hasitems(hero,ItNa_Matt_Kartka)>=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_021_Nieznajomy_Matt_Info()
{
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_Matt_15_00"); //Nikt nie przeszkodzi nam w naszych planach!
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_Matt_55_01"); //O co ci chodzi?
	
	B_LogEntry (TOPIC_Jenkins_bestia, "Przy zawalonym wej�ciu do kopalni znalaz�em poranione cia�o mojego towarzysza. Ten przekl�ty mag musia� rzuci� na mnie jakie� zakl�cie lub zrobi� co� Mattowi. Poza tym czym jest to dziwne ostrze, i co oznaczaj� te s�owa z kartki? '.ezreifo w ano�o�z a�atsoz akzceiwo azswreiP. !aineim�az ag�top saw an einy�ps hceiN' Dziwne rzeczy dziej� si� w tej dolinie, musz� czym pr�dzej ostrzec Jenkinsa i Udara nim sytuacja wymknie si� spod kontroli.");
	
};



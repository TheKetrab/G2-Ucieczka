
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
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_15_00"); //Co ty tutaj robisz? I kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_01"); //Mogê siê ciebie zapytaæ o to samo, m³odzieñcze. Sam fakt tego, ¿e siê tutaj znalaz³eœ œwiadczy o tym, ¿e mój stra¿nik poleg³ i nie wykona³ swojej misji.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_02"); //Ta bestia to by³ twój stra¿nik? Kiepsko spe³nia³ swoj¹ rolê skoro doprowadzi³ mnie do tego miejsca!
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_03"); //Taki by³ w³aœnie jego cel, czy¿ nie zostawi³ wam wystarczaj¹cych dowodów, byœcie wpadli na jego trop? 
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_04"); //Niestety, ku mojemu niezadowoleniu wykona³ jedynie czêœæ swojego planu. Drug¹ by³a pozbawienie was ¿ycia, ale to ju¿ nie wa¿ne.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_05"); //Wa¿ne jest, ¿e siê tutaj stawi³eœ i mo¿esz spojrzeæ mi w oczy. Czy¿ nie wydaj¹ ci siê znajome? Oczywiœcie, ¿e tak. Przecie¿ doskonale mnie znasz, chocia¿ mog³eœ chcieæ wymazaæ te wspomnienia ze swojej pamiêci.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_06"); //Bardzo czêsto przebywa³eœ w gospodzie na jeziorze w Nowym Obozie, gdzie mieliœmy zawsze okazjê, by siê napiæ i poopowiadaæ sobie nowiny jakie obiega³y koloniê.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_07"); //Wszystko trwa³o w sielance do momentu, a¿ do kolonii zaczêli przybywaæ orkowie, a my zostaliœmy zmuszeni do ucieczki.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_08"); //Ja uda³em siê wtedy do mojego mistrza, guru, który nauczy³ mnie produkcji bagiennego ziela. Terminowa³ u niego jeszcze jeden nowicjusz.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_09"); //Jego te¿ znasz, gdy¿ zamieszkiwa³ obok twojej chaty w starym obozie. Tak, to Cain.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_10"); //Jak widzisz, pozosta³em wierny swojemu mistrzowi, mimo i¿ ten ju¿ dawno nie ¿yje. Nadal wykonujê jego wolê i wype³niam rozkazy, chocia¿ ten w którego wierzymy ju¿ tutaj nie przebywa.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_11"); //K³amiesz! Chcesz zm¹ciæ mi umys³, aby potem mnie zabiæ. Nie pozwolê ci na to!
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_12"); //Twoim przeznaczeniem nie jest umrzeæ ju¿ teraz. Mia³eœ na mnie trafiæ, aby dopiero je poznaæ. A jest ono bardzo mocno zwi¹zane z Zaæmieniem, i czy tego chcesz, czy nie, jesteœ jego istotnym elementem.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_13"); //Nasza walka nie mia³aby ¿adnego sensu. Nie w tej chwili i tym czasie. Przyjdzie jeszcze na to odpowiednia pora.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_14"); //Pamiêtaj, i¿ Zaæmienia nie zdo³a powstrzymaæ nikt, ani nic.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_15"); //Czym jest to Zaæmienie i dlaczego chcecie do niego doprowadziæ?
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_16"); //Hahaha! Rozczarowa³eœ mnie! Jednak czego mog³em spodziewaæ siê po zwyk³ym myœliwym? Popytaj swoich paladynów w obozie ³owców. Mo¿e oni powiedz¹ ci o tym coœ wiêcej!
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieOUT_55_17"); //Tymczasem pozostawiam ciê w tej niewiedzy. Jeszcze siê spotkamy, œmiertelniku.
	
	B_LogEntry (TOPIC_Jehen_poscig, "To spotkanie by³o dziwne... Ciekawe, czy ma to zwi¹zek z besti¹ i co powie na to Jehen.");
	
	Log_CreateTopic (TOPIC_zacmienie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_zacmienie, LOG_RUNNING);
	B_LogEntry (TOPIC_zacmienie, "W jaskini spotka³em tajemniczego maga, który powiedzia³ mi, i¿ jestem czêœci¹ jakiegoœ zaæmienia. Nie wiem czym to jest lecz powinienem czym prêdzej powiadomiæ o tym Gestatha i Keroloha. Byæ mo¿e oni mi coœ o tym powiedz¹.");
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
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_15_00"); //Ty... Kim lub czym ty jesteœ?
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_01"); //Widzê, ¿e moi stra¿nicy nie zdo³ali wykonaæ powierzonego im zadania. Tym nieumar³ym s³ugusom nie mo¿na wierzyæ. Zaœ co do ciebie...
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_02"); //Ale¿ znamy siê bardzo dobrze, Willu. Mo¿esz mnie nie kojarzyæ, ale nasze drogi ju¿ siê kiedyœ skrzy¿owa³y.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_03"); //Pamiêtasz Stary Obóz? Mieszka³em w pobli¿u twojej chaty i zajmowa³em siê sprzedawaniem ziela i naparów, których wytwarzania nauczy³em siê od mojego mistrza.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_04"); //Jak widzisz, nadal s³u¿ê swojemu mistrzowi. Wczeœniej odwróci³em siê od jego s³ów, tak jak wielu innych moich braci, lecz oni zap³acili za to srogo.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_05"); //Próbujesz zm¹ciæ me myœli magu, ale nie uda ci siê. Cokolwiek planujesz, powstrzymam ciê!
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_06"); //To nie czas i miejsce na nasz¹ walkê. Twoje przeznaczenie musi siê jeszcze dope³niæ, byœ móg³ rzuciæ mi wyzwanie.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_07"); //Nasza walka i tak nie przyniesie ci ¿adnej korzyœci, gdy¿ pierwsza ofiara zosta³a ju¿ z³o¿ona ku potêdze mego pana. Nikt ani nic nie powstrzyma Zaæmienia.
	AI_Output (other, self,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_08"); //Co to za Zaæmienie?
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_09"); //Ha, ha, ha! Rozczarowujesz mnie teraz. Nie masz pojêcia, z czym siê mierzysz, a i tak rzucasz wyzwanie temu czemuœ? Jedynie œmiertelnicy potrafi¹ byæ tak lekkomyœlni.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_10"); //Mo¿e powinieneœ porozmawiaæ o tym ze swoimi paladynami czy magami? W koñcu tak wiernie im s³u¿ysz i wykonujesz ka¿de z ich poleceñ.
	AI_Output (self, other,"DIA_NASZ_021_Nieznajomy_StartZacmienieDJG_55_11"); //A teraz wybacz, obowi¹zki wzywaj¹. Do zobaczenia, Willu.
	
	B_LogEntry (TOPIC_Jenkins_bestia, "Po pokonaniu bestii spotkaliœmy tajemniczego maga, który po rozmowie znikn¹³ nim zd¹¿y³em coœ zrobiæ. W zaistnia³ej sytuacji nie pozostaje mi nic innego jak wróciæ do obozu. Lecz nigdzie nie ma Matta, czy¿by wróci³ do obozu? Nim wrócê do obozu muszê poszukaæ Matta, gdzie on móg³ pójœæ? Mo¿e zszed³ na dó³? Powinienem przeszukaæ okolicê wejœcia do kopalni.");
	
	AI_Teleport(NASZ_129_Matt,"NASZ_MATT_DEAD");
	B_StartOtherRoutine(NASZ_129_Matt,"Dead");
	B_KillNPC(NASZ_129_Matt);
	CreateInvItems(NASZ_129_Matt,ItNa_RytualneOstrze,1);
	CreateInvItems(NASZ_129_Matt,ItNa_Matt_Kartka,1);
	
	Log_CreateTopic (TOPIC_zacmienie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_zacmienie, LOG_RUNNING);
	B_LogEntry (TOPIC_zacmienie, "Na p³askowy¿u spotka³em tajemniczego maga, który podawa³ siê za cz³owieka dawno zmar³ego w wyniku zamieszek w starym obozie po przybyciu do doliny paladynów. Wspomnia³ coœ o Zaæmieniu. Nie wiem, co to mo¿e oznaczaæ, lecz najbezpieczniej bêdzie obserwowaæ sytuacjê i wyczekiwaæ w³aœciwego momentu.");
	
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
	
	B_LogEntry (TOPIC_Jenkins_bestia, "Przy zawalonym wejœciu do kopalni znalaz³em poranione cia³o mojego towarzysza. Ten przeklêty mag musia³ rzuciæ na mnie jakieœ zaklêcie lub zrobiæ coœ Mattowi. Poza tym czym jest to dziwne ostrze, i co oznaczaj¹ te s³owa z kartki? '.ezreifo w ano¿o³z a³atsoz akzceiwo azswreiP. !aineimæaz agêtop saw an einy³ps hceiN' Dziwne rzeczy dziej¹ siê w tej dolinie, muszê czym prêdzej ostrzec Jenkinsa i Udara nim sytuacja wymknie siê spod kontroli.");
	
};



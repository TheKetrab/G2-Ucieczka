
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_129_Matt_EXIT   (C_INFO)
{
	npc         = NASZ_129_Matt;
	nr          = 999;
	condition   = DIA_NASZ_129_Matt_EXIT_Condition;
	information = DIA_NASZ_129_Matt_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_129_Matt_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_129_Matt_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

var int PoszukiwanieListuMatta;
//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_129_Matt_hello   (C_INFO)
{
	npc         = NASZ_129_Matt;
 	nr          = 1;
 	condition   = DIA_NASZ_129_Matt_hello_Condition;
 	information = DIA_NASZ_129_Matt_hello_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_129_Matt_hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_129_Matt_hello_Info()
{

	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_00"); //Stój! Kim jesteœ i czego tu szukasz?!
	AI_Output (other, self,"DIA_NASZ_129_Matt_hello_15_01"); //Spokojnie. Przybywam do was w imieniu Udara, który chcia³, bym was odszuka³ i dowiedzia³ siê, dlaczego jeszcze nie wróciliœcie do obozu.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_02"); //No i w³aœnie nas znalaz³eœ, a w zasadzie to jednego z nich. Reszta przebywa w zupe³nie nowym obozie, gdy¿ z tego musieliœmy uciekaæ.
	AI_Output (other, self,"DIA_NASZ_129_Matt_hello_15_03"); //Co siê tutaj wydarzy³o?
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_04"); //Zesz³ej nocy mieliœmy zamiar przeprowadziæ ostatni zwiad. Kiedy mieliœmy ju¿ wyruszaæ, nasz przywódca, Jenkins, zwróci³ uwagê na dziwne krzyki obiegaj¹ce okolicê.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_05"); //Szybko zorientowaliœmy siê, i¿ wszystkie one dobiegaj¹ do nas z zamku, gdzie trwa³a bardzo mocna i za¿arta wymiana zdañ. Mimo ¿e znamy siê na ich mowie, to nie byliœmy w stanie dok³adnie wy³owiæ sensu tych krzyków.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_06"); //To co uda³o nam siê zrozumieæ i prze³o¿yæ na nasz jêzyk zapisaliœmy w raporcie.
	AI_Output (other, self,"DIA_NASZ_129_Matt_hello_15_07"); //Co takiego krzyczeli?
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_08"); //Na pocz¹tku nie by³o to nic ciekawego. Dopiero po chwili us³ysza³em o potê¿nym z³ym na bagnie, który zak³óca spokój przodków. Co by to nie znaczy³o, jednego jestem pewien.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_09"); //Orkowie wydawali siê byæ przera¿eni, co i mnie nie napawa optymizmem. Bo skoro te góry miêœni siê czegoœ boj¹, to musi to byæ potê¿nym zagro¿eniem.
	AI_Output (other, self,"DIA_NASZ_129_Matt_hello_15_10"); //Muszê dowiedzieæ siê czegoœ wiêcej, gdzie jest wasze nowe obozowisko?
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_11"); //Mogê ciê tam zabraæ, lecz najpierw muszê siê upewniæ, ¿e nie zosta³y tutaj po nas ¿adne œlady. Mo¿esz mi pomóc?

	Info_ClearChoices (DIA_NASZ_129_Matt_hello);
	Info_AddChoice	  (DIA_NASZ_129_Matt_hello, "Czego mam szukaæ?", DIA_NASZ_129_Matt_hello_yep);
	Info_AddChoice	  (DIA_NASZ_129_Matt_hello, "Nie mamy na to czasu.", DIA_NASZ_129_Matt_hello_no);

};

func void B_InsertScoutsDJG() {
	Wld_InsertNpc(NASZ_130_Jenkins,"NASZ_LOWCY_ZWIADOWCY_02");
	Wld_InsertNpc(NASZ_131_Lowca,"NASZ_LOWCY_ZWIADOWCY_06");
	Wld_InsertNpc(NASZ_132_Lowca,"NASZ_LOWCY_ZWIADOWCY_05");
};

func void MattSay_GoWithMe() {
	AI_Output (self, other,"MattSay_GoWithMe_55_00"); //Mam nadziejê, ¿e bezpiecznie dobiegniemy do celu. Jesteœ gotów do drogi?
	AI_Output (other, self,"MattSay_GoWithMe_55_01"); //Oczywiœcie, prowadŸ do waszego obozu.
	AI_Output (self, other,"MattSay_GoWithMe_55_02"); //Za mn¹!
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ToCamp");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_129_Matt,1);
	
	B_InsertScoutsDJG();

};

FUNC VOID DIA_NASZ_129_Matt_hello_yep()
{
	AI_Output (other,self ,"DIA_NASZ_129_Matt_hello_yep_15_00"); //Czego mam szukaæ?
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_yep_55_01"); //Pozosta³ych dokumentów, jakichœ kartek, no wiesz czegoœ w tym guœcie. Rozejrzyj siê po tej stronie, ja poszukam po tej.
	// TODO: [Zwiadowca chodzi do kilku miejsc i wykonuje animacjê przeszukiwania jak zbieracze w G1]

	B_LogEntry (TOPIC_Udar_patrol,"Znalaz³em jednego ze zwiadowców, który mo¿e zaprowadziæ mnie do obozowiska reszty. Jednak najpierw muszê pomóc mu znaleŸæ jakiœ dokument.");
	
	PoszukiwanieListuMatta = TRUE;
	Wld_InsertItem(ItNa_Matt_List,"FP_MATT_LIST");
	
	AI_StopProcessInfos(self);
};

FUNC VOID DIA_NASZ_129_Matt_hello_no()
{
	AI_Output (other,self ,"DIA_NASZ_129_Matt_hello_no_15_00"); //Nie mamy na to czasu.
	AI_Output (other,self ,"DIA_NASZ_129_Matt_hello_no_15_01"); //Ludzie w obozie musz¹ siê o tym wszystkim dowiedzieæ jak najszybciej.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_no_55_02"); //Niech ciê szlag! Oby te g³upie bestie nic tutaj nie znalaz³y.
	MattSay_GoWithMe();

	
};

//*********************************************************************
//	Info Dokument
//*********************************************************************
INSTANCE DIA_NASZ_129_Matt_Dokument   (C_INFO)
{
	npc         = NASZ_129_Matt;
 	nr          = 2;
 	condition   = DIA_NASZ_129_Matt_Dokument_Condition;
 	information = DIA_NASZ_129_Matt_Dokument_Info;
 	permanent   = FALSE;
	description = "Czy o ten dokument chodzi³o?";
};

FUNC INT DIA_NASZ_129_Matt_Dokument_Condition()
{
	if (npc_hasitems(other,ItNa_Matt_List)>=1)
	&& (PoszukiwanieListuMatta == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_129_Matt_Dokument_Info()
{

	B_GivePlayerXP(200);
	DodajReputacje(1,REP_LOWCY);
	AI_Output (other, self,"DIA_NASZ_129_Matt_Dokument_15_00"); //Czy o ten dokument chodzi³o?
	B_GiveInvItems(other,self,ItNa_Matt_List,1);
	Npc_RemoveInvItems(self,ItNa_Matt_List,1);
	AI_Output (self, other,"DIA_NASZ_129_Matt_Dokument_15_01"); //Niech no rzucê okiem.
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_129_Matt_Dokument_15_02"); //Tak, to ten dokument. Je¿eli nadal chcesz, to zaprowadzê ciê do pozosta³ych zwiadowców.
	MattSay_GoWithMe();
	
};

//*********************************************************************
//	Info InCamp
//*********************************************************************
INSTANCE DIA_NASZ_129_Matt_InCamp   (C_INFO)
{
	npc         = NASZ_129_Matt;
 	nr          = 2;
 	condition   = DIA_NASZ_129_Matt_InCamp_Condition;
 	information = DIA_NASZ_129_Matt_InCamp_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_129_Matt_InCamp_Condition()
{
	if (Npc_GetDistToWP(self,"NASZ_LOWCY_ZWIADOWCY_01") < 1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_129_Matt_InCamp_Info()
{
	Npc_ExchangeRoutine(self,"InCamp");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_129_Matt,0);

	AI_Output (self, other,"DIA_NASZ_129_Matt_InCamp_15_00"); //No i jesteœmy. Mam nadziejê, ¿e nikt nas nie œledzi³.
	AI_Output (self, other,"DIA_NASZ_129_Matt_InCamp_15_01"); //IdŸ pogadaæ z Jenkinsem. Stoi pod drzewem.
	AI_Output (self, other,"DIA_NASZ_129_Matt_InCamp_15_02"); //A teraz wybacz, lecz idê przyjrzeæ siê naszym rannym towarzyszom.

	B_LogEntry (TOPIC_Udar_patrol,"Dotar³em do obozu zwiadowców. Dwójka z ca³ej czwórki jest ranna i widocznie nie mo¿e siê nawet ruszaæ. Czym prêdzej powinienem porozmawiaæ z Jenkinsem o wszystkim, co mia³o tutaj miejsce.");

	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info WhatALuck
//*********************************************************************
INSTANCE DIA_NASZ_129_Matt_WhatALuck   (C_INFO)
{
	npc         = NASZ_129_Matt;
 	nr          = 2;
 	condition   = DIA_NASZ_129_Matt_WhatALuck_Condition;
 	information = DIA_NASZ_129_Matt_WhatALuck_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_129_Matt_WhatALuck_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_130_Jenkins_AreYouOK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_129_Matt_WhatALuck_Info()
{
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_00"); //Ca³e szczêœcie, ¿e nic ci siê nie sta³o. Mamy ju¿ wystarczaj¹co rannych jak na jedn¹ misjê.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_01"); //Mo¿esz mi wyjaœniæ, sk¹d wziê³y siê te szkielety?
	AI_Output (other, self,"DIA_NASZ_129_Matt_WhatALuck_15_02"); //Podczas rozmowy z Jenkinsem, zdecydowaliœmy siê przeczytaæ przet³umaczon¹ na nasz jêzyk inkantacjê orkowego szamana z zamku. Nied³ugo po tym ziemia zatrzês³a siê i wyskoczy³y na nas szkielety.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_03"); //Nie wiem, czy to ma jakiœ zwi¹zek, ale w tym samym momencie za palisad¹ uderzy³ olbrzymi piorun.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_04"); //Nie patrz tak na mnie! To NA PEWNO nie by³ zwyczajny piorun, bo te nie s¹ przecie¿ tak wielkie!
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_05"); //Nie podoba mi siê to wszystko, i jeszcze te dwie bestie. O Innosie, na jakie próby nas jeszcze wystawisz?
	AI_Output (other, self,"DIA_NASZ_129_Matt_WhatALuck_15_06"); //Muszê je znaleŸæ i zabiæ. Nie mo¿emy pozwoliæ, by to coœ przyby³o tutaj za spraw¹ zaklêcia, które, b¹dŸ co b¹dŸ, my rzuciliœmy.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_07"); //Zwariowa³eœ? Nawet nie wiesz, z czym chcesz siê zmierzyæ. Nie myœl, ¿e pozwolê ci iœæ samemu. We dwóch mamy wiêksze szanse, a i mi zale¿y na pozbyciu siê tego pomiotu.

	Info_ClearChoices (DIA_NASZ_129_Matt_WhatALuck);
	Info_AddChoice	  (DIA_NASZ_129_Matt_WhatALuck, "Masz racjê, we dwóch mamy wiêksze szanse.", DIA_NASZ_129_Matt_WhatALuck_yep);
	Info_AddChoice	  (DIA_NASZ_129_Matt_WhatALuck, "Nie ma mowy, nie mogê ryzykowaæ tym, ¿e coœ ci siê stanie.", DIA_NASZ_129_Matt_WhatALuck_no);

};

FUNC VOID DIA_NASZ_129_Matt_WhatALuck_yep()
{
	AI_Output (other,self ,"DIA_NASZ_129_Matt_WhatALuck_yep_15_00"); //Masz racjê, we dwóch mamy wiêksze szanse.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_yep_55_01"); //No widzisz? ChodŸ wiêc za mn¹ i nie traæmy czasu. Mo¿e uda nam siê jeszcze dopaœæ te stworzenia na prze³êczy.

	B_LogEntry (TOPIC_Jenkins_bestia,"Wybiorê siê na prze³êcz razem z Mattem. Razem bêdziemy mieli wiêksze szanse z besti¹.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"UnderMountain");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_129_Matt,1);
	
};

FUNC VOID DIA_NASZ_129_Matt_WhatALuck_no()
{
	AI_Output (other,self ,"DIA_NASZ_129_Matt_WhatALuck_no_15_00"); //Nie ma mowy, nie mogê ryzykowaæ tym, ¿e coœ ci siê stanie.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_no_55_01"); //Mój ty bohaterze! Ktoœ tu widocznie zapomnia³, ¿e jest w Górniczej Dolinie, gdzie granica miêdzy g³upot¹ a odwag¹ jest wyj¹tkowo cienka. Nie wiesz, co na ciebie czycha i mimo to chcesz iœæ samemu?
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_no_55_02"); //Idê z tob¹ czy ci siê to podoba czy nie, jestem ci to zreszt¹ winny, bo pomog³eœ mi dotrzeæ do obozu. Gdyby nie twoje towarzystwo to nie wiem, czy da³bym sobie sam radê.

	B_LogEntry (TOPIC_Jenkins_bestia,"Wybiorê siê na prze³êcz razem z Mattem. Razem bêdziemy mieli wiêksze szanse z besti¹.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"UnderMountain");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_129_Matt,1);
};

//*********************************************************************
//	Info WeAreLate
//*********************************************************************
INSTANCE DIA_NASZ_129_Matt_WeAreLate   (C_INFO)
{
	npc         = NASZ_129_Matt;
 	nr          = 2;
 	condition   = DIA_NASZ_129_Matt_WeAreLate_Condition;
 	information = DIA_NASZ_129_Matt_WeAreLate_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_129_Matt_WeAreLate_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_129_Matt_WhatALuck))
	&& (Npc_GetDistToWP(self,"OW_PATH_1_12") < 1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_129_Matt_WeAreLate_Info()
{
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_00"); //Cholera, zgubiliœmy je!
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_01"); //I co teraz zrobimy?
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_02"); //Najlepiej bêdzie, jak wrócimy do obozu poinformowaæ Jenkinsa o... Czekaj...
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_03"); //Ej, te¿ to s³ysza³eœ?
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_04"); //Co?
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_05"); //Coœ tak jakby warczenie skrzy¿owane z wrzaskiem. Dobiega ze szczytu tej góry.
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_06"); //Na co wiêc czekamy? Ruszajmy!
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_07"); //Musisz iœæ sam, bo ja... Nie umiem siê za bardzo wspinaæ i zapewne spad³bym z tej góry kilkanaœcie razy, zanim uda³oby siê mi na ni¹ wejœæ.
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_08"); //To nie brzmi zbyt optymistycznie, je¿eli mam byæ szczery. Postaram siê z nimi uporaæ, a ty pilnuj pleców. Kto wie, czy coœ nie zechce nas zajœæ od ty³u.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_09"); //Tylko nie zgrywaj bohatera i je¿eli to stworzenie bêdzie zbyt silne, to natychmiast uciekaj! Postaramy siê wtedy zabiæ to coœ tutaj na dole.
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_10"); //Jasne, ¿ycz mi szczêœcia. Przyda siê...
	
	B_LogEntry(TOPIC_Jenkins_bestia, "Matt us³ysza³ jakieœ warczenie dobiegaj¹ce z góry. Muszê siê wspi¹æ na p³askowy¿ na szczycie i dopaœæ bestie!");
	
	Wld_InsertNpc(BestiaSwiatynna,"FP_MATT_BESTIA_1");
	Wld_InsertNpc(BestiaSwiatynna,"FP_MATT_BESTIA_2");

};

//*********************************************************************
//	Info HowDoYou
//*********************************************************************
INSTANCE DIA_NASZ_129_Matt_HowDoYou   (C_INFO)
{
	npc         = NASZ_129_Matt;
 	nr          = 2;
 	condition   = DIA_NASZ_129_Matt_HowDoYou_Condition;
 	information = DIA_NASZ_129_Matt_HowDoYou_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_129_Matt_HowDoYou_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_129_Matt_WeAreLate))
	&& (Npc_GetDistToWP(self,"NASZ_WP_MATT_MOUNT_1") < 2000)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_129_Matt_HowDoYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_129_Matt_HowDoYou_15_00"); //Sk¹d siê tu wzi¹³eœ? Mówi³eœ przecie¿, ¿e nie potrafisz siê wspinaæ!
	AI_Output (self, other,"DIA_NASZ_129_Matt_HowDoYou_15_01"); //Bo nie potrafiê, sta³em na dole, tak jak mi poleci³eœ i przygl¹da³em siê dziwnej mgle, która pojawi³a siê w momencie, gdy zacz¹³eœ walczyæ z tym stworzeniem i nagle znalaz³em siê przy tobie.
	AI_Output (self, other,"DIA_NASZ_129_Matt_HowDoYou_15_02"); //Patrz! Tam chyba stoi jakiœ mag. Myœlisz, ¿e powinniœmy do niego podejœæ?
	AI_Output (self, other,"DIA_NASZ_129_Matt_HowDoYou_15_03"); //Nie ¿ebym siê ba³ magów czy coœ. Po prostu nie chcê skoñczyæ rozsmarowany po ca³ej okolicy.
	AI_Output (other, self,"DIA_NASZ_129_Matt_HowDoYou_15_04"); //Skoro ju¿ tu jesteœmy, to powinniœmy dowiedzieæ siê wszystkiego o tym, co siê tutaj w³aœciwie wyprawia. ChodŸ i trzymaj siê blisko mnie.
	
	B_LogEntry(TOPIC_Jenkins_bestia, "W dolinie zaczynaj¹ dziaæ siê dziwne rzeczy. Najpierw w trakcie walki, za sprawk¹ mg³y, teleportuje siê do mnie Matt, a potem w oddali dostrzegamy sylwetkê jakiegoœ maga. Musimy na siebie uwa¿aæ. Kto wie, jakie ma zamiary?");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMountain");
	
	AI_Teleport(NASZ_021_Nieznajomy,"NASZ_NIEZNAJOMY_2");
	B_StartOtherRoutine(NASZ_021_Nieznajomy,"StartDJG");
};

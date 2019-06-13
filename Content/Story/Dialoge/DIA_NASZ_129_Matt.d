
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

	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_00"); //St�j! Kim jeste� i czego tu szukasz?!
	AI_Output (other, self,"DIA_NASZ_129_Matt_hello_15_01"); //Spokojnie. Przybywam do was w imieniu Udara, kt�ry chcia�, bym was odszuka� i dowiedzia� si�, dlaczego jeszcze nie wr�cili�cie do obozu.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_02"); //No i w�a�nie nas znalaz�e�, a w zasadzie to jednego z nich. Reszta przebywa w zupe�nie nowym obozie, gdy� z tego musieli�my ucieka�.
	AI_Output (other, self,"DIA_NASZ_129_Matt_hello_15_03"); //Co si� tutaj wydarzy�o?
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_04"); //Zesz�ej nocy mieli�my zamiar przeprowadzi� ostatni zwiad. Kiedy mieli�my ju� wyrusza�, nasz przyw�dca, Jenkins, zwr�ci� uwag� na dziwne krzyki obiegaj�ce okolic�.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_05"); //Szybko zorientowali�my si�, i� wszystkie one dobiegaj� do nas z zamku, gdzie trwa�a bardzo mocna i za�arta wymiana zda�. Mimo �e znamy si� na ich mowie, to nie byli�my w stanie dok�adnie wy�owi� sensu tych krzyk�w.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_06"); //To co uda�o nam si� zrozumie� i prze�o�y� na nasz j�zyk zapisali�my w raporcie.
	AI_Output (other, self,"DIA_NASZ_129_Matt_hello_15_07"); //Co takiego krzyczeli?
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_08"); //Na pocz�tku nie by�o to nic ciekawego. Dopiero po chwili us�ysza�em o pot�nym z�ym na bagnie, kt�ry zak��ca spok�j przodk�w. Co by to nie znaczy�o, jednego jestem pewien.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_09"); //Orkowie wydawali si� by� przera�eni, co i mnie nie napawa optymizmem. Bo skoro te g�ry mi�ni si� czego� boj�, to musi to by� pot�nym zagro�eniem.
	AI_Output (other, self,"DIA_NASZ_129_Matt_hello_15_10"); //Musz� dowiedzie� si� czego� wi�cej, gdzie jest wasze nowe obozowisko?
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_15_11"); //Mog� ci� tam zabra�, lecz najpierw musz� si� upewni�, �e nie zosta�y tutaj po nas �adne �lady. Mo�esz mi pom�c?

	Info_ClearChoices (DIA_NASZ_129_Matt_hello);
	Info_AddChoice	  (DIA_NASZ_129_Matt_hello, "Czego mam szuka�?", DIA_NASZ_129_Matt_hello_yep);
	Info_AddChoice	  (DIA_NASZ_129_Matt_hello, "Nie mamy na to czasu.", DIA_NASZ_129_Matt_hello_no);

};

func void B_InsertScoutsDJG() {
	Wld_InsertNpc(NASZ_130_Jenkins,"NASZ_LOWCY_ZWIADOWCY_02");
	Wld_InsertNpc(NASZ_131_Lowca,"NASZ_LOWCY_ZWIADOWCY_06");
	Wld_InsertNpc(NASZ_132_Lowca,"NASZ_LOWCY_ZWIADOWCY_05");
};

func void MattSay_GoWithMe() {
	AI_Output (self, other,"MattSay_GoWithMe_55_00"); //Mam nadziej�, �e bezpiecznie dobiegniemy do celu. Jeste� got�w do drogi?
	AI_Output (other, self,"MattSay_GoWithMe_55_01"); //Oczywi�cie, prowad� do waszego obozu.
	AI_Output (self, other,"MattSay_GoWithMe_55_02"); //Za mn�!
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ToCamp");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_129_Matt,1);
	
	B_InsertScoutsDJG();

};

FUNC VOID DIA_NASZ_129_Matt_hello_yep()
{
	AI_Output (other,self ,"DIA_NASZ_129_Matt_hello_yep_15_00"); //Czego mam szuka�?
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_yep_55_01"); //Pozosta�ych dokument�w, jakich� kartek, no wiesz czego� w tym gu�cie. Rozejrzyj si� po tej stronie, ja poszukam po tej.
	// TODO: [Zwiadowca chodzi do kilku miejsc i wykonuje animacj� przeszukiwania jak zbieracze w G1]

	B_LogEntry (TOPIC_Udar_patrol,"Znalaz�em jednego ze zwiadowc�w, kt�ry mo�e zaprowadzi� mnie do obozowiska reszty. Jednak najpierw musz� pom�c mu znale�� jaki� dokument.");
	
	PoszukiwanieListuMatta = TRUE;
	Wld_InsertItem(ItNa_Matt_List,"FP_MATT_LIST");
	
	AI_StopProcessInfos(self);
};

FUNC VOID DIA_NASZ_129_Matt_hello_no()
{
	AI_Output (other,self ,"DIA_NASZ_129_Matt_hello_no_15_00"); //Nie mamy na to czasu.
	AI_Output (other,self ,"DIA_NASZ_129_Matt_hello_no_15_01"); //Ludzie w obozie musz� si� o tym wszystkim dowiedzie� jak najszybciej.
	AI_Output (self, other,"DIA_NASZ_129_Matt_hello_no_55_02"); //Niech ci� szlag! Oby te g�upie bestie nic tutaj nie znalaz�y.
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
	description = "Czy o ten dokument chodzi�o?";
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
	AI_Output (other, self,"DIA_NASZ_129_Matt_Dokument_15_00"); //Czy o ten dokument chodzi�o?
	B_GiveInvItems(other,self,ItNa_Matt_List,1);
	Npc_RemoveInvItems(self,ItNa_Matt_List,1);
	AI_Output (self, other,"DIA_NASZ_129_Matt_Dokument_15_01"); //Niech no rzuc� okiem.
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_129_Matt_Dokument_15_02"); //Tak, to ten dokument. Je�eli nadal chcesz, to zaprowadz� ci� do pozosta�ych zwiadowc�w.
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

	AI_Output (self, other,"DIA_NASZ_129_Matt_InCamp_15_00"); //No i jeste�my. Mam nadziej�, �e nikt nas nie �ledzi�.
	AI_Output (self, other,"DIA_NASZ_129_Matt_InCamp_15_01"); //Id� pogada� z Jenkinsem. Stoi pod drzewem.
	AI_Output (self, other,"DIA_NASZ_129_Matt_InCamp_15_02"); //A teraz wybacz, lecz id� przyjrze� si� naszym rannym towarzyszom.

	B_LogEntry (TOPIC_Udar_patrol,"Dotar�em do obozu zwiadowc�w. Dw�jka z ca�ej czw�rki jest ranna i widocznie nie mo�e si� nawet rusza�. Czym pr�dzej powinienem porozmawia� z Jenkinsem o wszystkim, co mia�o tutaj miejsce.");

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
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_00"); //Ca�e szcz�cie, �e nic ci si� nie sta�o. Mamy ju� wystarczaj�co rannych jak na jedn� misj�.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_01"); //Mo�esz mi wyja�ni�, sk�d wzi�y si� te szkielety?
	AI_Output (other, self,"DIA_NASZ_129_Matt_WhatALuck_15_02"); //Podczas rozmowy z Jenkinsem, zdecydowali�my si� przeczyta� przet�umaczon� na nasz j�zyk inkantacj� orkowego szamana z zamku. Nied�ugo po tym ziemia zatrz�s�a si� i wyskoczy�y na nas szkielety.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_03"); //Nie wiem, czy to ma jaki� zwi�zek, ale w tym samym momencie za palisad� uderzy� olbrzymi piorun.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_04"); //Nie patrz tak na mnie! To NA PEWNO nie by� zwyczajny piorun, bo te nie s� przecie� tak wielkie!
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_05"); //Nie podoba mi si� to wszystko, i jeszcze te dwie bestie. O Innosie, na jakie pr�by nas jeszcze wystawisz?
	AI_Output (other, self,"DIA_NASZ_129_Matt_WhatALuck_15_06"); //Musz� je znale�� i zabi�. Nie mo�emy pozwoli�, by to co� przyby�o tutaj za spraw� zakl�cia, kt�re, b�d� co b�d�, my rzucili�my.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_15_07"); //Zwariowa�e�? Nawet nie wiesz, z czym chcesz si� zmierzy�. Nie my�l, �e pozwol� ci i�� samemu. We dw�ch mamy wi�ksze szanse, a i mi zale�y na pozbyciu si� tego pomiotu.

	Info_ClearChoices (DIA_NASZ_129_Matt_WhatALuck);
	Info_AddChoice	  (DIA_NASZ_129_Matt_WhatALuck, "Masz racj�, we dw�ch mamy wi�ksze szanse.", DIA_NASZ_129_Matt_WhatALuck_yep);
	Info_AddChoice	  (DIA_NASZ_129_Matt_WhatALuck, "Nie ma mowy, nie mog� ryzykowa� tym, �e co� ci si� stanie.", DIA_NASZ_129_Matt_WhatALuck_no);

};

FUNC VOID DIA_NASZ_129_Matt_WhatALuck_yep()
{
	AI_Output (other,self ,"DIA_NASZ_129_Matt_WhatALuck_yep_15_00"); //Masz racj�, we dw�ch mamy wi�ksze szanse.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_yep_55_01"); //No widzisz? Chod� wi�c za mn� i nie tra�my czasu. Mo�e uda nam si� jeszcze dopa�� te stworzenia na prze��czy.

	B_LogEntry (TOPIC_Jenkins_bestia,"Wybior� si� na prze��cz razem z Mattem. Razem b�dziemy mieli wi�ksze szanse z besti�.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"UnderMountain");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_129_Matt,1);
	
};

FUNC VOID DIA_NASZ_129_Matt_WhatALuck_no()
{
	AI_Output (other,self ,"DIA_NASZ_129_Matt_WhatALuck_no_15_00"); //Nie ma mowy, nie mog� ryzykowa� tym, �e co� ci si� stanie.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_no_55_01"); //M�j ty bohaterze! Kto� tu widocznie zapomnia�, �e jest w G�rniczej Dolinie, gdzie granica mi�dzy g�upot� a odwag� jest wyj�tkowo cienka. Nie wiesz, co na ciebie czycha i mimo to chcesz i�� samemu?
	AI_Output (self, other,"DIA_NASZ_129_Matt_WhatALuck_no_55_02"); //Id� z tob� czy ci si� to podoba czy nie, jestem ci to zreszt� winny, bo pomog�e� mi dotrze� do obozu. Gdyby nie twoje towarzystwo to nie wiem, czy da�bym sobie sam rad�.

	B_LogEntry (TOPIC_Jenkins_bestia,"Wybior� si� na prze��cz razem z Mattem. Razem b�dziemy mieli wi�ksze szanse z besti�.");
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
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_00"); //Cholera, zgubili�my je!
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_01"); //I co teraz zrobimy?
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_02"); //Najlepiej b�dzie, jak wr�cimy do obozu poinformowa� Jenkinsa o... Czekaj...
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_03"); //Ej, te� to s�ysza�e�?
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_04"); //Co?
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_05"); //Co� tak jakby warczenie skrzy�owane z wrzaskiem. Dobiega ze szczytu tej g�ry.
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_06"); //Na co wi�c czekamy? Ruszajmy!
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_07"); //Musisz i�� sam, bo ja... Nie umiem si� za bardzo wspina� i zapewne spad�bym z tej g�ry kilkana�cie razy, zanim uda�oby si� mi na ni� wej��.
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_08"); //To nie brzmi zbyt optymistycznie, je�eli mam by� szczery. Postaram si� z nimi upora�, a ty pilnuj plec�w. Kto wie, czy co� nie zechce nas zaj�� od ty�u.
	AI_Output (self, other,"DIA_NASZ_129_Matt_WeAreLate_15_09"); //Tylko nie zgrywaj bohatera i je�eli to stworzenie b�dzie zbyt silne, to natychmiast uciekaj! Postaramy si� wtedy zabi� to co� tutaj na dole.
	AI_Output (other, self,"DIA_NASZ_129_Matt_WeAreLate_15_10"); //Jasne, �ycz mi szcz�cia. Przyda si�...
	
	B_LogEntry(TOPIC_Jenkins_bestia, "Matt us�ysza� jakie� warczenie dobiegaj�ce z g�ry. Musz� si� wspi�� na p�askowy� na szczycie i dopa�� bestie!");
	
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
	AI_Output (other, self,"DIA_NASZ_129_Matt_HowDoYou_15_00"); //Sk�d si� tu wzi��e�? M�wi�e� przecie�, �e nie potrafisz si� wspina�!
	AI_Output (self, other,"DIA_NASZ_129_Matt_HowDoYou_15_01"); //Bo nie potrafi�, sta�em na dole, tak jak mi poleci�e� i przygl�da�em si� dziwnej mgle, kt�ra pojawi�a si� w momencie, gdy zacz��e� walczy� z tym stworzeniem i nagle znalaz�em si� przy tobie.
	AI_Output (self, other,"DIA_NASZ_129_Matt_HowDoYou_15_02"); //Patrz! Tam chyba stoi jaki� mag. My�lisz, �e powinni�my do niego podej��?
	AI_Output (self, other,"DIA_NASZ_129_Matt_HowDoYou_15_03"); //Nie �ebym si� ba� mag�w czy co�. Po prostu nie chc� sko�czy� rozsmarowany po ca�ej okolicy.
	AI_Output (other, self,"DIA_NASZ_129_Matt_HowDoYou_15_04"); //Skoro ju� tu jeste�my, to powinni�my dowiedzie� si� wszystkiego o tym, co si� tutaj w�a�ciwie wyprawia. Chod� i trzymaj si� blisko mnie.
	
	B_LogEntry(TOPIC_Jenkins_bestia, "W dolinie zaczynaj� dzia� si� dziwne rzeczy. Najpierw w trakcie walki, za sprawk� mg�y, teleportuje si� do mnie Matt, a potem w oddali dostrzegamy sylwetk� jakiego� maga. Musimy na siebie uwa�a�. Kto wie, jakie ma zamiary?");

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMountain");
	
	AI_Teleport(NASZ_021_Nieznajomy,"NASZ_NIEZNAJOMY_2");
	B_StartOtherRoutine(NASZ_021_Nieznajomy,"StartDJG");
};

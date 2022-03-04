
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_130_Jenkins_EXIT   (C_INFO)
{
	npc         = NASZ_130_Jenkins;
	nr          = 999;
	condition   = DIA_NASZ_130_Jenkins_EXIT_Condition;
	information = DIA_NASZ_130_Jenkins_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_130_Jenkins_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_130_Jenkins_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info PreHello
//*********************************************************************
INSTANCE DIA_NASZ_130_Jenkins_PreHello   (C_INFO)
{
	npc         = NASZ_130_Jenkins;
 	nr          = 1;
 	condition   = DIA_NASZ_130_Jenkins_PreHello_Condition;
 	information = DIA_NASZ_130_Jenkins_PreHello_Info;
 	permanent   = FALSE;
	description = "To ty jesteœ Jenkins?";
};

FUNC INT DIA_NASZ_130_Jenkins_PreHello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_130_Jenkins_PreHello_Info()
{
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_prehello_15_00"); //To ty jesteœ Jenkins?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_prehello_15_01"); //Tak i przewodzê tej grupie, chocia¿ patrz¹c na to co sta³o siê zesz³ej nocy, nigdy nie zgodzi³bym siê na to, by wybraæ siê z nimi na zwiad. Nie po tym wszystkim.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_prehello_15_02"); //Dotar³em tutaj z jednym z waszych ludzi. Znalaz³em go w waszym starym obozie na p³askowy¿u, opowiedzia³ mi, co siê sta³o.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_prehello_15_03"); //Przyby³eœ tutaj z Mattem? Chwa³a Innosowi! Ju¿ myœla³em, ¿e go straciliœmy. Przybywasz do nas z konkretnymi rozkazami?
};

var int JenkinsSzkieletyPrzywolane;
func void B_InsertSkeletonsJenkins() {
	B_StartOtherRoutine(NASZ_129_Matt,"GonnaGo");

	JenkinsSzkieletyPrzywolane = TRUE;
	
	Wld_InsertNpc(Skeleton_Jenkins_1,"FP_JENKINS_SKE_1");
	Wld_InsertNpc(Skeleton_Jenkins_2,"FP_JENKINS_SKE_2");
	Wld_InsertNpc(Skeleton_Jenkins_3,"FP_JENKINS_SKE_3");
	Wld_InsertNpc(Skeleton_Jenkins_4,"FP_JENKINS_SKE_4");
	Wld_InsertNpc(Skeleton_Jenkins_5,"FP_JENKINS_SKE_5");

	Wld_PlayEffect("FX_EarthQuake", Skeleton_Jenkins_1, Skeleton_Jenkins_1, 0, 0, 0, FALSE );
	Wld_PlayEffect("SPELLFX_massdeath",  Skeleton_Jenkins_1, Skeleton_Jenkins_1, 0, 0, 0, FALSE );

	
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_130_Jenkins_hello   (C_INFO)
{
	npc         = NASZ_130_Jenkins;
 	nr          = 1;
 	condition   = DIA_NASZ_130_Jenkins_hello_Condition;
 	information = DIA_NASZ_130_Jenkins_hello_Info;
 	permanent   = FALSE;
	description = "Przysy³a mnie Udar. Mam sprawdziæ, co z wami siê sta³o.";
};

FUNC INT DIA_NASZ_130_Jenkins_hello_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_130_Jenkins_PreHello))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_130_Jenkins_hello_Info()
{
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_15_00"); //Przysy³a mnie Udar. Mam sprawdziæ, co z wami siê sta³o.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_15_01"); //Jednak ju¿ sam widok tego wszystkiego nie napawa mnie optymizmem.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_02"); //Aktualnie nie mo¿emy wróciæ do obozu, gdy¿ jak widzisz kilku z nas jest ciê¿ko rannych, a zostawienie ich na pastwê losu nie wchodzi w grê.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_03"); //Co gorsza, nie s¹ to takie zwyk³e rany, jakich mo¿na siê nabawiæ po ciosie od miecza czy topora... To coœ bardziej powa¿nego.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_04"); //Ostatniej nocy s³yszeliœmy krzyki orków wydobywaj¹ce siê z zamku, tak jakby dyskutowali o czymœ wa¿nym i istotnym. Co ciekawe, by³o to o wiele wa¿niejsze ni¿ my i przygotowania do wojny.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_05"); //Zapewne wiesz ju¿ od Matta, o czym rozmawiali, tak wiêc nie bêdê zanudza³ ciê szczegó³ami. Istotne jest to, ¿e kiedy go nie by³o, zdo³a³em rozszyfrowaæ jedn¹ z inkantacji orkowego szamana, która zapad³a mi w pamiêci.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_15_06"); //Szamani orków czêsto wypowiadaj¹ przedziwne frazy. Czemu ta by³a na tyle wyj¹tkowa, ¿e zapad³a ci w pamiêci?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_07"); //To nie by³ taki zwyk³y zlepek orkowych s³ów. Kiedy ka¿dy z nas znalaz³ siê w ich zasiêgu, poczuliœmy olbrzymie bóle g³owy, a nasze oczy poczê³y zachodziæ mrokiem.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_15_08"); //Mo¿esz mi przet³umaczyæ te s³owa?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_09"); //Oczywiœcie, gotów?

	Info_ClearChoices (DIA_NASZ_130_Jenkins_hello);
	Info_AddChoice	  (DIA_NASZ_130_Jenkins_hello, "Tak.", DIA_NASZ_130_Jenkins_hello_yep);
	ff_applyonceext(InsertSkeletonJenkins,1000,-1);
};

func void DIA_NASZ_130_Jenkins_hello_yep() {
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_yep_15_00"); //'Niech spowije ciê sen nieprzespany, albowiem tyœ jest tym, kto s³u¿y dawno przebudzonemu demonowi. Na mocy tych s³ów, JA, zmuszam tw¹ duszê do z³o¿enia mi pok³onu, albowiem wielka jest moc ¿ycia, które sprawuje w³adze nad œmierci¹!'

	Snd_Play ("Mystery_09");
	Wld_PlayEffect("FX_EARTHQUAKE",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_yep_15_01"); //Cholera! Te¿ to poczu³eœ?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_yep_15_02"); //Nienaturalne zimno przeszywaj¹ce twoj¹ duszê tak, jakby ktoœ wykopa³ ci grób?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_yep_15_03"); //Tak, te¿ to poczu³em. I na pewno nie jest to coœ, co chcia³bym powtórzyæ za tego jak i przysz³ego ¿ycia.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_yep_15_04"); //Powinienem czym prêdzej poinformowaæ o tym Udara...
	
	AI_StopProcessInfos(self);
	
};


//*********************************************************************
//	Info AreYouOK
//*********************************************************************
INSTANCE DIA_NASZ_130_Jenkins_AreYouOK   (C_INFO)
{
	npc         = NASZ_130_Jenkins;
 	nr          = 1;
 	condition   = DIA_NASZ_130_Jenkins_AreYouOK_Condition;
 	information = DIA_NASZ_130_Jenkins_AreYouOK_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_130_Jenkins_AreYouOK_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_130_Jenkins_hello))
	&& (npc_isdead(Skeleton_Jenkins_1))
	&& (npc_isdead(Skeleton_Jenkins_2))
	&& (npc_isdead(Skeleton_Jenkins_3))
	&& (npc_isdead(Skeleton_Jenkins_4))
	&& (npc_isdead(Skeleton_Jenkins_5))
	&& (JenkinsSzkieletyPrzywolane == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_130_Jenkins_AreYouOK_Info()
{
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_00"); //Hej! Wszystko w porz¹dku?
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_AreYouOK_15_01"); //Tak, chyba tak... Bardziej martwi mnie jednak, sk¹d wziê³y siê tutaj te szkielety?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_02"); //Te¿ bym chcia³ to wiedzieæ! Byæ mo¿e ma to jakiœ zwi¹zek z formu³¹, któr¹ wypowiedzia³em? Kto wie, co ona dok³adnie oznacza w jêzyku orków i jak¹ ma si³ê?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_03"); //Nie to mnie jednak martwi. Podczas walki zauwa¿y³em w lesie dziwne, czerwone œlepia. Nie mam pojêcia, co to za stworzenie, b¹dŸ stworzenia, bo tych par oczu by³o kilka...
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_04"); //Mniejsza o szczegó³y. To coœ uciek³o w kierunku prze³êczy.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_05"); //Powinieneœ siê temu przyjrzeæ, a ja tymczasem pomogê kolejnym rannym w obozie. Z tego co widzê, to Matt ju¿ siê krêci przy œcie¿ce. Porozmawiaj z nim.

	Log_CreateTopic (TOPIC_Jenkins_bestia,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jenkins_bestia, LOG_RUNNING);
	B_LogEntry(TOPIC_Jenkins_bestia, "Obóz zosta³ zaatakowany przez nieumar³ych. Jenkins twierdzi, ¿e mo¿e mieæ to zwi¹zek z tajemnicz¹ inkantacj¹ orkowego szamana. Teraz jednak trzeba zaj¹æ siê dwoma bestiami, które widocznie zosta³y tutaj zwabione si³¹ sprawcz¹ zaklêcia.");

};


//*********************************************************************
//	Info EndOfMatt
//*********************************************************************
INSTANCE DIA_NASZ_130_Jenkins_EndOfMatt   (C_INFO)
{
	npc         = NASZ_130_Jenkins;
 	nr          = 1;
 	condition   = DIA_NASZ_130_Jenkins_EndOfMatt_Condition;
 	information = DIA_NASZ_130_Jenkins_EndOfMatt_Info;
 	permanent   = FALSE;
	description = "Nie przynoszê ze sob¹ dobrych wieœci.";
};

FUNC INT DIA_NASZ_130_Jenkins_EndOfMatt_Condition()
{
	// UWAGA - ten dialog nastepuje, ale nieznajomy czasem sie nie pojawia
	// i zeby uniknac bugow to nie sprawdzamy tego warunku
	//if (npc_knowsinfo(other,DIA_NASZ_021_Nieznajomy_Matt))
	if (npc_hasitems(hero,ItNa_RytualneOstrze)>=1)
	&& (npc_hasitems(hero,ItNa_Matt_Kartka)>=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_130_Jenkins_EndOfMatt_Info()
{

	AI_Output (other, self,"DIA_NASZ_130_Jenkins_EndOfMatt_15_00"); //Nie przynoszê ze sob¹ dobrych wieœci.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_01"); //Co siê sta³o? Gdzie jest Matt?
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_EndOfMatt_15_02"); //Niestety, ale Matt nie ¿yje. Na p³askowy¿u wdaliœmy siê w walkê z dwoma nieumar³ymi cieniostworami, które strzeg³y tajemniczego maga. Kiedy z nim porozmawia³em, spostrzeg³em, ¿e Matt znikn¹³.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_EndOfMatt_15_03"); //Dopiero kiedy zszed³em z góry, uda³o mi siê go znaleŸæ, lecz by³o ju¿ za póŸno. Matt zosta³ zabity, jego cia³o zosta³o brutalnie poranione, zaœ obok niego znalaz³em ten dziwny nó¿ i kartkê.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_04"); //Poka¿ mi to, szybko!
	B_GiveInvItems(other,self,ItNa_RytualneOstrze,1);
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_05"); //Niepokoj¹ce ostrze, jeszcze nigdy nie widzia³em tego typu orê¿a. Zakrzywione, poszarpane ostrze i delikatny metal...
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_06"); //Broñ godna mistrzowskiego kunsztu kowalskiego.
	B_GiveInvItems(self,other,ItNa_RytualneOstrze,1);
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_07"); //Zanim zapytasz, to na pewno nie jest robota ¿adnego kowala z kolonii. Ch³opaki znaj¹ siê na swoim fachu, lecz to... To wymaga znacznie wiêkszych umiejêtnoœci.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_08"); //Zaœ co do Matta... To by³ dobry ³owca orków. Nale¿¹ ci siê podziêkowania za pomoc.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_09"); //Powinieneœ wróciæ do Udara, przeka¿ mu nasz raport i powiedz, ¿e potrzebujemy kilku ludzi do pomocy, bo inaczej nie wrócimy do obozu.
	CreateInvItems(self,ItNa_JenkinsRaport,1);
	B_GiveInvItems(self,other,ItNa_JenkinsRaport,1);
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_EndOfMatt_15_10"); //Tak zrobiê.
	
	B_GivePlayerXP(700);
	DodajReputacje(2,REP_LOWCY);
	
	Log_CreateTopic (TOPIC_Jenkins_bestia,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jenkins_bestia, LOG_SUCCESS);
	B_LogEntry(TOPIC_Jenkins_bestia, "Niech Matt spoczywa w pokoju i ³asce Innosa.");

	B_LogEntry (TOPIC_Udar_patrol,"Powinienem udaæ siê teraz do Udara i powiadomiæ go o zaistnia³ej sytuacji oraz zawiadomiæ, by przys³a³ zwiadowcom kogoœ do pomocy.");

};
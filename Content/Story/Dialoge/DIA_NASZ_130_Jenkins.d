
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
	description = "To ty jeste� Jenkins?";
};

FUNC INT DIA_NASZ_130_Jenkins_PreHello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_130_Jenkins_PreHello_Info()
{
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_prehello_15_00"); //To ty jeste� Jenkins?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_prehello_15_01"); //Tak i przewodz� tej grupie, chocia� patrz�c na to co sta�o si� zesz�ej nocy, nigdy nie zgodzi�bym si� na to, by wybra� si� z nimi na zwiad. Nie po tym wszystkim.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_prehello_15_02"); //Dotar�em tutaj z jednym z waszych ludzi. Znalaz�em go w waszym starym obozie na p�askowy�u, opowiedzia� mi, co si� sta�o.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_prehello_15_03"); //Przyby�e� tutaj z Mattem? Chwa�a Innosowi! Ju� my�la�em, �e go stracili�my. Przybywasz do nas z konkretnymi rozkazami?
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
	description = "Przysy�a mnie Udar. Mam sprawdzi�, co z wami si� sta�o.";
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
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_15_00"); //Przysy�a mnie Udar. Mam sprawdzi�, co z wami si� sta�o.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_15_01"); //Jednak ju� sam widok tego wszystkiego nie napawa mnie optymizmem.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_02"); //Aktualnie nie mo�emy wr�ci� do obozu, gdy� jak widzisz kilku z nas jest ci�ko rannych, a zostawienie ich na pastw� losu nie wchodzi w gr�.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_03"); //Co gorsza, nie s� to takie zwyk�e rany, jakich mo�na si� nabawi� po ciosie od miecza czy topora... To co� bardziej powa�nego.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_04"); //Ostatniej nocy s�yszeli�my krzyki ork�w wydobywaj�ce si� z zamku, tak jakby dyskutowali o czym� wa�nym i istotnym. Co ciekawe, by�o to o wiele wa�niejsze ni� my i przygotowania do wojny.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_05"); //Zapewne wiesz ju� od Matta, o czym rozmawiali, tak wi�c nie b�d� zanudza� ci� szczeg�ami. Istotne jest to, �e kiedy go nie by�o, zdo�a�em rozszyfrowa� jedn� z inkantacji orkowego szamana, kt�ra zapad�a mi w pami�ci.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_15_06"); //Szamani ork�w cz�sto wypowiadaj� przedziwne frazy. Czemu ta by�a na tyle wyj�tkowa, �e zapad�a ci w pami�ci?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_07"); //To nie by� taki zwyk�y zlepek orkowych s��w. Kiedy ka�dy z nas znalaz� si� w ich zasi�gu, poczuli�my olbrzymie b�le g�owy, a nasze oczy pocz�y zachodzi� mrokiem.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_15_08"); //Mo�esz mi przet�umaczy� te s�owa?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_15_09"); //Oczywi�cie, got�w?

	Info_ClearChoices (DIA_NASZ_130_Jenkins_hello);
	Info_AddChoice	  (DIA_NASZ_130_Jenkins_hello, "Tak.", DIA_NASZ_130_Jenkins_hello_yep);
	ff_applyonceext(InsertSkeletonJenkins,1000,-1);
};

func void DIA_NASZ_130_Jenkins_hello_yep() {
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_yep_15_00"); //'Niech spowije ci� sen nieprzespany, albowiem ty� jest tym, kto s�u�y dawno przebudzonemu demonowi. Na mocy tych s��w, JA, zmuszam tw� dusz� do z�o�enia mi pok�onu, albowiem wielka jest moc �ycia, kt�re sprawuje w�adze nad �mierci�!'

	Snd_Play ("Mystery_09");
	Wld_PlayEffect("FX_EARTHQUAKE",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_hello_yep_15_01"); //Cholera! Te� to poczu�e�?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_yep_15_02"); //Nienaturalne zimno przeszywaj�ce twoj� dusz� tak, jakby kto� wykopa� ci gr�b?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_yep_15_03"); //Tak, te� to poczu�em. I na pewno nie jest to co�, co chcia�bym powt�rzy� za tego jak i przysz�ego �ycia.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_hello_yep_15_04"); //Powinienem czym pr�dzej poinformowa� o tym Udara...
	
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
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_00"); //Hej! Wszystko w porz�dku?
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_AreYouOK_15_01"); //Tak, chyba tak... Bardziej martwi mnie jednak, sk�d wzi�y si� tutaj te szkielety?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_02"); //Te� bym chcia� to wiedzie�! By� mo�e ma to jaki� zwi�zek z formu��, kt�r� wypowiedzia�em? Kto wie, co ona dok�adnie oznacza w j�zyku ork�w i jak� ma si��?
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_03"); //Nie to mnie jednak martwi. Podczas walki zauwa�y�em w lesie dziwne, czerwone �lepia. Nie mam poj�cia, co to za stworzenie, b�d� stworzenia, bo tych par oczu by�o kilka...
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_04"); //Mniejsza o szczeg�y. To co� uciek�o w kierunku prze��czy.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_AreYouOK_15_05"); //Powiniene� si� temu przyjrze�, a ja tymczasem pomog� kolejnym rannym w obozie. Z tego co widz�, to Matt ju� si� kr�ci przy �cie�ce. Porozmawiaj z nim.

	Log_CreateTopic (TOPIC_Jenkins_bestia,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jenkins_bestia, LOG_RUNNING);
	B_LogEntry(TOPIC_Jenkins_bestia, "Ob�z zosta� zaatakowany przez nieumar�ych. Jenkins twierdzi, �e mo�e mie� to zwi�zek z tajemnicz� inkantacj� orkowego szamana. Teraz jednak trzeba zaj�� si� dwoma bestiami, kt�re widocznie zosta�y tutaj zwabione si�� sprawcz� zakl�cia.");

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
	description = "Nie przynosz� ze sob� dobrych wie�ci.";
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

	AI_Output (other, self,"DIA_NASZ_130_Jenkins_EndOfMatt_15_00"); //Nie przynosz� ze sob� dobrych wie�ci.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_01"); //Co si� sta�o? Gdzie jest Matt?
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_EndOfMatt_15_02"); //Niestety, ale Matt nie �yje. Na p�askowy�u wdali�my si� w walk� z dwoma nieumar�ymi cieniostworami, kt�re strzeg�y tajemniczego maga. Kiedy z nim porozmawia�em, spostrzeg�em, �e Matt znikn��.
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_EndOfMatt_15_03"); //Dopiero kiedy zszed�em z g�ry, uda�o mi si� go znale��, lecz by�o ju� za p�no. Matt zosta� zabity, jego cia�o zosta�o brutalnie poranione, za� obok niego znalaz�em ten dziwny n� i kartk�.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_04"); //Poka� mi to, szybko!
	B_GiveInvItems(other,self,ItNa_RytualneOstrze,1);
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_05"); //Niepokoj�ce ostrze, jeszcze nigdy nie widzia�em tego typu or�a. Zakrzywione, poszarpane ostrze i delikatny metal...
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_06"); //Bro� godna mistrzowskiego kunsztu kowalskiego.
	B_GiveInvItems(self,other,ItNa_RytualneOstrze,1);
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_07"); //Zanim zapytasz, to na pewno nie jest robota �adnego kowala z kolonii. Ch�opaki znaj� si� na swoim fachu, lecz to... To wymaga znacznie wi�kszych umiej�tno�ci.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_08"); //Za� co do Matta... To by� dobry �owca ork�w. Nale�� ci si� podzi�kowania za pomoc.
	AI_Output (self, other,"DIA_NASZ_130_Jenkins_EndOfMatt_15_09"); //Powiniene� wr�ci� do Udara, przeka� mu nasz raport i powiedz, �e potrzebujemy kilku ludzi do pomocy, bo inaczej nie wr�cimy do obozu.
	CreateInvItems(self,ItNa_JenkinsRaport,1);
	B_GiveInvItems(self,other,ItNa_JenkinsRaport,1);
	AI_Output (other, self,"DIA_NASZ_130_Jenkins_EndOfMatt_15_10"); //Tak zrobi�.
	
	B_GivePlayerXP(700);
	DodajReputacje(2,REP_LOWCY);
	
	Log_CreateTopic (TOPIC_Jenkins_bestia,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jenkins_bestia, LOG_SUCCESS);
	B_LogEntry(TOPIC_Jenkins_bestia, "Niech Matt spoczywa w pokoju i �asce Innosa.");

	B_LogEntry (TOPIC_Udar_patrol,"Powinienem uda� si� teraz do Udara i powiadomi� go o zaistnia�ej sytuacji oraz zawiadomi�, by przys�a� zwiadowcom kogo� do pomocy.");

};
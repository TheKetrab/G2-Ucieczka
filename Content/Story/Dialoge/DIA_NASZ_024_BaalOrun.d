var int OrunRediToTelepport;

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_024_BaalOrun_EXIT   (C_INFO)
{
	npc         = NASZ_024_BaalOrun;
	nr          = 999;
	condition   = DIA_NASZ_024_BaalOrun_EXIT_Condition;
	information = DIA_NASZ_024_BaalOrun_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_024_BaalOrun_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_024_BaalOrun_EXIT_Info()
{
	if (OrunRediToTelepport == TRUE)
	{
		AI_StopProcessInfos (self);
		Wld_PlayEffect("spellFX_Teleport_RING",  self  , self	, 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");
		AI_Teleport (self, "TOT"); 
		B_StartOtherRoutine (self,"End");
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Lojalnosc
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_Lojalnosc		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	1;
	condition	 = 	DIA_NASZ_024_BaalOrun_Lojalnosc_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_Lojalnosc_Info;
 	permanent    =  FALSE;
	description	 = 	"Czy mog� wam jako� pom�c?";
};

func int DIA_NASZ_024_BaalOrun_Lojalnosc_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_NASZ_023_DuchSekciarza_Rekonesans))
	{
		return TRUE;
	};
};
func void DIA_NASZ_024_BaalOrun_Lojalnosc_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_00"); //Czy mog� wam jako� pom�c?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_01"); //Musi by� spos�b, aby uwolni� was z jarzma kl�twy.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_02"); //A dlaczego mieliby�my wierzy� w twoje szlachetne pobudki? Mo�e jeste� wys�annikiem naszego ciemi�cy, kt�ry ma sprawdzi�, czy nie spiskujemy przeciwko niemu?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_03"); //Nie, m�j ch�opcze. Musisz najpierw udowodni� nam, i� nie kieruj� tob� z�e pobudki.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_04"); //Eh, znowu b�d� musia� robi� za ch�opca na posy�ki.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_05"); //Jak mog� wam pom�c?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_06"); //Porozmawiaj z Shratem, Joru i Ghorimem. Ka�dy z nich przydzieli ci jedno zadanie, kt�re musisz rozwi�za�.
	
	Log_CreateTopic (TOPIC_Lojalnosc,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lojalnosc, LOG_RUNNING);
	B_LogEntry (TOPIC_Lojalnosc, "Kiedy zapyta�em si� przyw�dcy duch�w, jak mog� im pom�c, ten odrzek�, �e nie zdradz� mi, co mog� uczyni�, dop�ki nie udowodni� im swoich dobrych intencji. Aby zyska� zaufanie, musz� uda� si� do trzech znanych mi nowicjuszy: Joru, Ghorima i Shrata. Tylko, gdzie oni mog� by�?");

};
///////////////////////////////////////////////////////////////////
//	Info done
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_done		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	2;
	condition	 = 	DIA_NASZ_024_BaalOrun_done_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_done_Info;
	permanent    =  FALSE;
	description  =  "Pomog�em twoim braciom.";
};

func int DIA_NASZ_024_BaalOrun_done_Condition ()
{
	if (npc_knowsinfo(other,DIA_NASZ_024_BaalOrun_Lojalnosc))
	&& (Npc_HasItems(hero,ItNa_Pierscien_Glodu) >= 1)
	&& (Npc_HasItems(hero,ItNa_Pierscien_Zarazy) >= 1)
	&& (Npc_HasItems(hero,ItNa_Pas_Smierci) >= 1)
	{
		return TRUE;
	};
};
func void DIA_NASZ_024_BaalOrun_done_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_00"); //Pomog�em twoim braciom.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_01"); //Wszyscy zaznali ukojenia i spokoju. Tak jak prosi�e�.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_024_02"); //Wiem, czu�em to za ka�dym razem, kiedy pomaga�e� jednemu z nich. Masz ze sob� r�wnie� trzy magiczne artefakty, kt�re mog�e� otrzyma� jedynie po wykonaniu zadania.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_03"); //Czym w�a�ciwie s� te przedmioty i jaki maj� cel?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_15_04"); //Ka�dy z nich manifestuje cech�, jak� wykaza�e� si� podczas pomocy moim braciom. By�y to pobo�no��, bezinteresowna pomoc i wierno�� wzgl�dem przyjaciela. Przedmioty te pomog� ci dosta� si� do �wi�tyni.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_024_05"); //Jednak zanim tam wejdziesz, b�dziesz musia� za�atwi� jeszcze jedn� spraw�.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_06"); //Czego innego mog�em si� spodziewa�...
	
	B_GivePlayerXP(500);
	B_LogEntry (TOPIC_Lojalnosc, "Wykaza�em swoj� lojalno��, ale oczywi�cie to jeszcze nie koniec. Przede mn� kolejne wyzwania.");
	Log_SetTopicStatus (TOPIC_Lojalnosc, LOG_SUCCESS);

};

///////////////////////////////////////////////////////////////////////
//	Info Droga
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_Droga		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	3;
	condition	 = 	DIA_NASZ_024_BaalOrun_Droga_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_Droga_Info;
	permanent    =  FALSE;
	description	 =	"Istnieje jaki� spos�b, by was uwolni�?";
};

func int DIA_NASZ_024_BaalOrun_Droga_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_done))
	{
		return TRUE;
	};
};
func void DIA_NASZ_024_BaalOrun_Droga_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_00"); //Istnieje jaki� spos�b, by was uwolni�?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_01"); //Ci���ce na nas z�o mo�e pokona� jedynie �miertelnik o m�nym sercu, kt�ry nie l�ka si� spotkania z uosobieniem samej �mierci i cierpienia.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_02"); //Niestety, wojowniku, nie mo�esz po prostu wej�� do wn�trza naszej �wi�tyni, gdy� ta zosta�a zapiecz�towana i nikt nie ma do niej dost�pu.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_03"); //Jakakolwiek pr�ba sforsowania kamiennych wr�t sko�czy si� dla ciebie �mierci�.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_04"); //Wi�c powiedz mi, jak mog� dosta� si� do jej wn�trza i przegna� znajduj�ce si� wewn�trz z�o. Przecie� musi by� jaki� spos�b!
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_05"); //To by�o tak dawno... M�j umys� jak i wspomnienia s� teraz jedynie strz�pami wszystkiego co wiedzia�em, pogr��one w wiecznej pustce. Jak moje zagubione ja zdaj� si� by� nieuchwytne, niedo�cignione...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_06"); //Ponadto nie mo�emy pom�c ci bezpo�rednio. Jarzmo kl�twy uniemo�liwia nam sprzeciwienie si� naszemu panu. Musia�by� znale�� co� co pomog�oby ci si� do niego dosta�, lecz niewiele ju� pami�tam.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_07"); //�y�e� w okresie kiedy to wszystko si� rozegra�o, skup si� i przypomnij to sobie!
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_08"); //To by�o tak dawno...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_09"); //Skrawki wspomnie� zdaj� si� tworzy� bardzo niesp�jny obraz. Widz� przed sob� siebie i moich braci, zdajemy si� by� pogr��eni w �arliwej dyskusji.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_10"); //Jeden z nich wyci�ga kartk�... Nie, magiczny pergamin... I zaczyna co� na nim spisywa�. Dopiero teraz dostrzegam mrok, jaki ogarnia nasze sylwetki. Co� co zdaje si� nas poch�ania�.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_11"); //Ja, to ja rozrywam pergamin na kawa�ki. Ja daj� je nowicjuszom aby pochowali je w obozie, lecz nie wiem gdzie si� udali.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_12"); //Nie wiedzie� czemu, mam silne wra�enie, i� zapisane na� s�owa s� kluczem do rozwi�zania naszej zagadki. Je�eli chcesz pozna� odpowied� na swoje pytania musisz odszuka� fragmenty stronicy i mi je dostarczy�.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_13"); //Czuj� magiczn� si��, kt�ra bije od spisanych tam s��w. Nie mog� dok�adnie okre�li� sk�d, lecz wszystkie fragmenty znajduj� si� w naszym obozie. Ruszaj i strze� si� umar�ych, kt�rzy nie mog� zazna� spokoju.
	
	Log_CreateTopic (TOPIC_Droga,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Droga, LOG_RUNNING);
	B_LogEntry (TOPIC_Droga, "Niewiele dowiedzia�em si� od Baala za wyj�tkiem tego, �e przed tymi wszystkimi wydarzeniami, on jak i inni pracowali nad jakim� magicznym zwojem. Z nieznanych mi powod�w zdecydowali si� go rozerwa� i schowa� w najr�niejszych miejscach obozu. Czy�by by�y tam spisane informacje odno�nie z�a jakie nawiedzi�o ob�z? Musz� odnale�� je wszystkie i przynie�� Baalowi Orunowi. On sam oczywi�cie albo nie wie, albo zapomnia� o tym, gdzie m�g�bym je znale��...");

};
///////////////////////////////////////////////////////////////////////
//	Info DrogaDone
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_DrogaDone		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	4;
	condition	 = 	DIA_NASZ_024_BaalOrun_DrogaDone_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_DrogaDone_Info;
	permanent    =  FALSE;
	description  =  "Znalaz�em osiem kawa�k�w pergaminu.";

};

func int DIA_NASZ_024_BaalOrun_DrogaDone_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Droga))
	&& (Npc_HasItems(other,ItNa_FragmentZwoju) >=8)
	{
		return TRUE;
	};
};
func void DIA_NASZ_024_BaalOrun_DrogaDone_Info ()
{
	

	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_DrogaDone_15_00"); //Znalaz�em osiem kawa�k�w pergaminu.
	
	B_GiveInvItems(other,self,ItNa_FragmentZwoju,8);
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_DrogaDone_15_01"); //Nieumarli chyba wyczuli fakt tego, �e chcecie mi pom�c. Po odszukaniu ka�dego fragmentu pergaminu musia�em stoczy� pojedynek z przedziwnymi szkieletami, od kt�rych emanowa�a aura zniszczenia.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_02"); //To byli Czempioni, stra�nicy i wys�annicy naszego wsp�lnego wroga. Ich zadaniem jest pilnowa�, aby nikt z nas nie zazna� spokoju, ani nie zdo�a� zbiec z teren�w obozu.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_03"); //Wyczuwam jednak, i� wszystkie kartki pergaminu znalaz�y si� w jednym miejscu. Prosz� po�� je na ziemi i pozw�l, �e odprawi� rytua�, kt�ry po��czy je w ca�o��.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_04"); //(Wzdycha)
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_05"); //To... niewiarygodne. W naj�mielszych pragnieniach nie s�dzi�em, �e uda si� nam to uczyni� bez uszkodzenia magicznej formu�y jaka zosta�a na nim spisana.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_06"); //Zdaje si�, �e wraz z tym powracaj� moje wspomnienia odno�nie ubieg�ych wydarze�.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_07"); //Widz� ciemno�� jaka ogarnia moich braci, niepohamowany ob��d wdzieraj�cy si� do naszych g��w. Niepohamowana nienawi�� wchodzi do wn�trza naszego sanktuarium, nasi bracia zdaj� si� walczy� u boku stra�nik�w, lecz...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_08"); //Teraz to widz�... Ich... Nasze wysi�ki okaza�y si� daremne bowiem przysz�o nam walczy� z istot�, kt�ra nie by�a przypisana do tego �wiata i nie ima� si� jej �aden or�.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_09"); //Lecz teraz os�ab�a, pewna siebie i braku zagro�enia jest nie�wiadoma niebezpiecze�stwa, jakie mo�e jej zagra�a�. 
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_10"); //Aby wymierzy� jej cios, musimy znale�� badania Kaloma, kt�ry zajmowa� si� zg��bianiem tajnik �ni�cego i jego demonicznych s�ug.
	
	B_LogEntry (TOPIC_Droga, "Nabiega�em si� po okolicy, ale ostatecznie skompletowa�em kawa�ki zwoju. Odda�em je Orunowi, kt�ry po��czy� je i stworzy� magiczny zw�j. P�ki co, musimy kontynuowa� przygotowania do rytua�u.");
	Log_SetTopicStatus (TOPIC_Droga, LOG_SUCCESS);

	B_GivePlayerXP(1000);
};
///////////////////////////////////////////////////////////////////////
//	Info BadaniaCorCaloma
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_BadaniaCorCaloma		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	5;
	condition	 = 	DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_Info;
	permanent    =  FALSE;
	description	 = 	"Dlaczego ta ksi��ka jest tak wa�na?";
};

func int DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_Condition ()
{
	if(Npc_KnowsInfo(other, DIA_NASZ_024_BaalOrun_DrogaDone))
	{
		return TRUE;
	};
};
func void DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_Info ()
{
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_00"); //Dlaczego ta ksi��ka jest tak wa�na?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_01"); //O ile pami�tam, Kalom nie przeprowadza� jaki� istotnych bada� w dziedzinie demonologii.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_02"); //Oceniasz go jedynie na podstawie tego, co sam widzia�e�. Niestety jego prawdziwe 'ja' i zap�dy bardzo d�ugo umyka�y naszej uwadze.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_03"); //Tak d�ugo, �e nie byli�my w stanie si� uchroni� przed losem, jaki na nas spad�. Gdyby�my byli tylko miej aroganccy w swoich poczynaniach i nie ufali �lepo �ni�cemu...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_04"); //Wraz z ka�dym wypowiedzianym s�owem czuj�, jak moja dusza materializuje si� w duchowym �wiecie, przywracaj�c mi coraz to nowsze wspomnienia.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_05"); //Widzisz co� konkretnego? Co�, co mog�oby mi pom�c w kolejnym zadaniu?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_06"); //Widz�... Cain, niesie ze sob� jak�� ksi��k� i wychodzi z laboratorium swojego mistrza. To na pewno nie by�a zwyk�a ksi��ka, chocia� wtedy nie zwr�ci�em na niego zbytnio uwagi.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_07"); //Teraz dostrzegam szczeg�y: Oprawiona w sk�rzany futera� musia�a by� dla niego bardzo cenna, bowiem przytula� j� do swej piersi niczym matka dziecko.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_08"); //Niewiele pami�tam z tego, co dzia�o si� dalej. Ostatni widok jaki kr��y mi po g�owie, to jak nowicjusz poszed� w kierunku bagien.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_09"); //My�l�, i� tam powiniene� zacz�� swe poszukiwania.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_10"); //A kiedy odnajd� ju� ksi��k�, co wtedy? Jaki b�dzie nasz nast�pny cel?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_11"); //Wtedy pomo�esz nam odprawi� rytua�, kt�ry przywr�ci nam pami��. B�dzie to wymaga�o niesprzeciwienia si� obecnemu tutaj z�u i skontaktowania si� z silami, z jakimi lepiej nie mie� styczno�ci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_12"); //Twoja pomoc oka�e si� nieoceniona, gdy� si�y ciemno�ci b�d� zapewne chcia�y nas powstrzyma� i uniemo�liwi� nam odzyskanie �wiadomo�ci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_13"); //B�dzie to pierwszy krok, kt�ry umo�liwi nam odzyskanie wolno�ci i spokoju. Lecz nawet wtedy wci�� b�dziemy niewolnikami, kt�rzy jedynie dodadz� ci si� by� w ich imieniu wywalczy� o wolno��.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_14"); //Czy jeste� got�w podj�� si� tego zadania?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_15"); //Oczywi�cie, ruszam w drog� za ksi��k�. �yczcie mi powodzenia.
	
	Log_CreateTopic (TOPIC_BadaniaCaloma,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BadaniaCaloma, LOG_RUNNING);
	B_LogEntry (TOPIC_BadaniaCaloma, "Aby umo�liwi� duchom odzyskanie pe�nej �wiadomo�ci, musz� znale�� ksi��k�, kt�ra zawiera zapiski Kaloma. S� tam odpowiedzi na nasze pytania odno�nie z�a, jakie si� tutaj zal�g�o i tego jak mo�na je pokona�. Czy�by pocz�tkowo nawet sam Kalom nie ufa� w pe�ni �ni�cemu?");
	
	AI_StopProcessInfos (self);

};
var int OrunBadaKsiazke;
var int OrunDay;
///////////////////////////////////////////////////////////////////////
//	Info MamBadaniaCaloma
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_MamBadaniaCaloma		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	6;
	condition	 = 	DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_Info;
	important	 = 	FALSE;
	description	 =	"Znalaz�em ksi��k�.";
	permanent	 =	FALSE;
};

func int DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_NASZ_024_BaalOrun_BadaniaCorCaloma))
	&& (npc_hasitems (other, ItNa_CorKalom_Book) >=1)
	&& (WillKnowKalomBook == TRUE)
	{
		return TRUE;
	};

};
func void DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_Info ()
{
	OrunDay = Wld_GetDay();
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_15_00"); //Znalaz�em ksi��k�. 
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_15_01"); //Musia�em si� troch� natrudzi�, by j� znale�� wi�c licz�, �e oka�e si� po�yteczna w naszych dzia�aniach.
	B_GiveInvItems (other,self,ItNa_CorKalom_Book,1);
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_024_02"); //Doskonale! Miejmy nadziej�, �e dzi�ki temu odkryjemy spos�b na to, jak wygna� z�o. Niestety, b�dziemy potrzebowali troch� czasu, by zg��bi� wiedz� jaka drzemi� w zwoju i ksi��ce, kt�re nam dostarczy�e�.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_024_03"); //Wr�� do nas nast�pnego dnia, a na pewno b�dziemy mieli dla ciebie jakie� informacje.
	OrunBadaKsiazke = 1;
	
	B_LogEntry (TOPIC_BadaniaCaloma, "Mam wr�ci� do Oruna nast�pnego dnia.");


};

///////////////////////////////////////////////////////////////////////
//	Info JakPrzebiegajaPrace
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	7;
	condition	 = 	DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_Info;
	important	 = 	TRUE;
	description	 =	"Jak przebiegaj� prace, odkryli�cie ju� co�?";
	permanent	 =	FALSE;
};

func int DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_Condition ()
{
	if (OrunBadaKsiazke == 1)
	&& (OrunDay < Wld_GetDay())
	{
		return TRUE;
	};
	
};
func void DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_Info ()
{
	AI_Output (other, self, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_15_00"); //Jak przebiegaj� prace, odkryli�cie ju� co�?
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_01"); //Tak! Uda�o nam si� posi��� wiedz�, dzi�ki kt�rej zdo�amy wyswobodzi� si� z wp�ywu demona.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_02"); //Teraz pozostaje jedynie odprawi� rytua�, kt�ry przypiecz�tuje nasze uwolnienie si� z jarzma niewolnictwa.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_03"); //Aby to jednak uczyni�, b�dziemy musieli zebra� si� na placu nauk i przygotowa� si� do obrony, albowiem si�y ciemno�ci nie b�d� si� temu biernie przygl�da�y.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_04"); //Prawdopodobnie zostaniemy zaatakowani przez pot�nych nieprzyjaci�, a to na tobie spadnie obowi�zek ochraniania nas podczas rytua�u.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_05"); //Podczas jego przeprowadzania b�dziemy zupe�nie bezbronni, dlatego te� b�dziesz zmuszony da� z siebie wi�cej ni� podczas ca�ej swojej podr�y.
	AI_Output (other, self, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_15_06"); //Pokona�em ju� tyle trudno�ci, �e nic mnie nie zatrzyma. Zaczynajmy, nie ma na co czeka�.
	
	B_LogEntry (TOPIC_BadaniaCaloma, "Baal rozpracowa� ksi�g� i teraz mo�emy uda� si� na plac �wi�tynny, by odprawi� rytua�.");
	Log_SetTopicStatus (TOPIC_BadaniaCaloma, LOG_SUCCESS);
	OrunBadaKsiazke = 2;
	
	B_GivePlayerXP(500);
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Rytual");
	
};

///////////////////////////////////////////////////////////////////////
//	Info Rytual
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_Rytual		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	8;
	condition	 = 	DIA_NASZ_024_BaalOrun_Rytual_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_Rytual_Info;
	permanent    =  FALSE;
	important	 =	true;
};

func int DIA_NASZ_024_BaalOrun_Rytual_Condition ()
{
	if (OrunBadaKsiazke == 2)
	&& (Npc_GetDistToWP(self,"NASZ_ZAPALISADA_OB_16") <= 500)
	&& (Npc_HasItems(hero,ItNa_Pierscien_Glodu) >= 1)
	&& (Npc_HasItems(hero,ItNa_Pierscien_Zarazy) >= 1)
	&& (Npc_HasItems(hero,ItNa_Pas_Smierci) >= 1)
	{
		return TRUE;
	};
};
func void DIA_NASZ_024_BaalOrun_Rytual_Info ()
{
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Rytual_024_00"); //Zanim zaczniemy, potrzebuj� jeszcze, aby� odda� mi przedmioty, kt�re otrzyma�e� od moich braci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Rytual_024_01"); //Energia, kt�ra w nich drzemie, oka�e si� nieoceniona podczas naszego przedsi�wzi�cia.
	
	B_GiveInvItems(other,self,ItNa_Pierscien_Glodu,1);
	B_GiveInvItems(other,self,ItNa_Pierscien_Zarazy,1);
	B_GiveInvItems(other,self,ItNa_Pas_Smierci,1);
	
	AI_Output			(other,self, "DIA_NASZ_024_BaalOrun_Rytual_15_02"); //Oto one, a teraz zaczynajmy, gdy� wyczuwam nadchodz�ce k�opoty.
		
	BaalOrunIsGoingToStartRitual = TRUE;
	AI_StopProcessInfos (self);
	B_StartOtherRoutine(self,"OrunRitual"); // w srodku rutyny startuje ticktock z rytualem

};
///////////////////////////////////////////////////////////////////////
//	Info Rytual
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_024_BaalOrun_RytualCD		(C_INFO)
{
	npc		 	 = 	NASZ_024_BaalOrun;
	nr		 	 = 	9;
	condition	 = 	DIA_NASZ_024_BaalOrun_RytualCD_Condition;
	information	 = 	DIA_NASZ_024_BaalOrun_RytualCD_Info;
	permanent    =  FALSE;
	important	 =	true;
};

func int DIA_NASZ_024_BaalOrun_RytualCD_Condition ()
{
	if(NPC_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Rytual))
	&& (OrunRitual_Finished == TRUE)
	{
		return TRUE;
	};
};
func void DIA_NASZ_024_BaalOrun_RytualCD_Info ()
{
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_00"); //To... To chyba naprawd� si� uda�o, niewiarygodne! Szczerze nie przypuszcza�em, �e uda nam si� wyswobodzi� i odzyska� �wiadomo��.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_01"); //Magiczna bariera we wrotach �wi�tyni zosta�a z�amana... Czuj�... Czuj�, jak z�o, kt�re w niej spoczywa�o rozlewa si� po obozie doprowadzaj�c do furii wszystkich nieumar�ych, kt�rzy si� tu znajduj�.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_02"); //Nim ruszysz do �wi�tyni musisz u�y� zwoju, kt�ry powsta� przez po��czenie kawa�k�w znalezionych przez ciebie.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_03"); //Dzi�ki temu b�dziesz traktowany jako pe�noprawny cz�onek Bractwa i magiczna bariera przy wej�ciu do �wi�tyni ci� nie powstrzyma.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_04"); //Ale uprzedzam ci�! U�yj zwoju dopiero wtedy, gdy za�o�ysz na siebie wszystkie artefakty. We� kolejny: Ten amulet to znak okazania nam pomocy w odzyskaniu pe�nej �wiadomo�ci.
	CreateInvItems(self,ItNa_Amulet_Wojny,1);
	
	B_GiveInvItems(self,other,ItNa_Amulet_Wojny,1);
	B_GiveInvItems(self,other,ItNa_Pierscien_Glodu,1);
	B_GiveInvItems(self,other,ItNa_Pierscien_Zarazy,1);
	B_GiveInvItems(self,other,ItNa_Pas_Smierci,1);
	
	Createinvitems (self, ItNa_Grow, 1);
	B_GiveInvItems(self,other,ItNa_Grow,1);
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_05"); //A teraz ruszaj, nim b�dzie za p�no.
	
	B_LogEntry (TOPIC_zacmienie, "Bariera, blokuj�ca wej�cie do �wi�tyni, zosta�a z�amana. Baal wr�czy� mi zakl�cie, kt�re powsta�o w wyniku po��czenia wszystkich kawa�k�w pergaminu. Aby sta� si� pe�noprawnym cz�onkiem Bractwa i przej�� przez magiczne pole w wej�ciu do �wi�tyni, mam u�y� zwoju z za�o�onymi wszystkimi czterema artefaktami, kt�re otrzyma�em od duch�w.");

	OrunRediToTelepport = TRUE;
};




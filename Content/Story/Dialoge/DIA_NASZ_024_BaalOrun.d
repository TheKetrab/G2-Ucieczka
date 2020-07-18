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
	description	 = 	"Czy mogê wam jakoœ pomóc?";
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
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_00"); //Czy mogê wam jakoœ pomóc?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_01"); //Musi byæ sposób, aby uwolniæ was z jarzma kl¹twy.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_02"); //A dlaczego mielibyœmy wierzyæ w twoje szlachetne pobudki? Mo¿e jesteœ wys³annikiem naszego ciemiê¿cy, który ma sprawdziæ, czy nie spiskujemy przeciwko niemu?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_03"); //Nie, mój ch³opcze. Musisz najpierw udowodniæ nam, i¿ nie kieruj¹ tob¹ z³e pobudki.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_04"); //Eh, znowu bêdê musia³ robiæ za ch³opca na posy³ki.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_05"); //Jak mogê wam pomóc?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_06"); //Porozmawiaj z Shratem, Joru i Ghorimem. Ka¿dy z nich przydzieli ci jedno zadanie, które musisz rozwi¹zaæ.
	
	Log_CreateTopic (TOPIC_Lojalnosc,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lojalnosc, LOG_RUNNING);
	B_LogEntry (TOPIC_Lojalnosc, "Kiedy zapyta³em siê przywódcy duchów, jak mogê im pomóc, ten odrzek³, ¿e nie zdradz¹ mi, co mogê uczyniæ, dopóki nie udowodniê im swoich dobrych intencji. Aby zyskaæ zaufanie, muszê udaæ siê do trzech znanych mi nowicjuszy: Joru, Ghorima i Shrata. Tylko, gdzie oni mog¹ byæ?");

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
	description  =  "Pomog³em twoim braciom.";
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
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_00"); //Pomog³em twoim braciom.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_01"); //Wszyscy zaznali ukojenia i spokoju. Tak jak prosi³eœ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_024_02"); //Wiem, czu³em to za ka¿dym razem, kiedy pomaga³eœ jednemu z nich. Masz ze sob¹ równie¿ trzy magiczne artefakty, które mog³eœ otrzymaæ jedynie po wykonaniu zadania.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_03"); //Czym w³aœciwie s¹ te przedmioty i jaki maj¹ cel?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_15_04"); //Ka¿dy z nich manifestuje cechê, jak¹ wykaza³eœ siê podczas pomocy moim braciom. By³y to pobo¿noœæ, bezinteresowna pomoc i wiernoœæ wzglêdem przyjaciela. Przedmioty te pomog¹ ci dostaæ siê do œwi¹tyni.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_024_05"); //Jednak zanim tam wejdziesz, bêdziesz musia³ za³atwiæ jeszcze jedn¹ sprawê.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_06"); //Czego innego mog³em siê spodziewaæ...
	
	B_GivePlayerXP(500);
	B_LogEntry (TOPIC_Lojalnosc, "Wykaza³em swoj¹ lojalnoœæ, ale oczywiœcie to jeszcze nie koniec. Przede mn¹ kolejne wyzwania.");
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
	description	 =	"Istnieje jakiœ sposób, by was uwolniæ?";
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
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_00"); //Istnieje jakiœ sposób, by was uwolniæ?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_01"); //Ci¹¿¹ce na nas z³o mo¿e pokonaæ jedynie œmiertelnik o mê¿nym sercu, który nie lêka siê spotkania z uosobieniem samej œmierci i cierpienia.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_02"); //Niestety, wojowniku, nie mo¿esz po prostu wejœæ do wnêtrza naszej œwi¹tyni, gdy¿ ta zosta³a zapieczêtowana i nikt nie ma do niej dostêpu.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_03"); //Jakakolwiek próba sforsowania kamiennych wrót skoñczy siê dla ciebie œmierci¹.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_04"); //Wiêc powiedz mi, jak mogê dostaæ siê do jej wnêtrza i przegnaæ znajduj¹ce siê wewn¹trz z³o. Przecie¿ musi byæ jakiœ sposób!
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_05"); //To by³o tak dawno... Mój umys³ jak i wspomnienia s¹ teraz jedynie strzêpami wszystkiego co wiedzia³em, pogr¹¿one w wiecznej pustce. Jak moje zagubione ja zdaj¹ siê byæ nieuchwytne, niedoœcignione...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_06"); //Ponadto nie mo¿emy pomóc ci bezpoœrednio. Jarzmo kl¹twy uniemo¿liwia nam sprzeciwienie siê naszemu panu. Musia³byœ znaleŸæ coœ co pomog³oby ci siê do niego dostaæ, lecz niewiele ju¿ pamiêtam.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_07"); //¯y³eœ w okresie kiedy to wszystko siê rozegra³o, skup siê i przypomnij to sobie!
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_08"); //To by³o tak dawno...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_09"); //Skrawki wspomnieñ zdaj¹ siê tworzyæ bardzo niespójny obraz. Widzê przed sob¹ siebie i moich braci, zdajemy siê byæ pogr¹¿eni w ¿arliwej dyskusji.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_10"); //Jeden z nich wyci¹ga kartkê... Nie, magiczny pergamin... I zaczyna coœ na nim spisywaæ. Dopiero teraz dostrzegam mrok, jaki ogarnia nasze sylwetki. Coœ co zdaje siê nas poch³aniaæ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_11"); //Ja, to ja rozrywam pergamin na kawa³ki. Ja dajê je nowicjuszom aby pochowali je w obozie, lecz nie wiem gdzie siê udali.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_12"); //Nie wiedzieæ czemu, mam silne wra¿enie, i¿ zapisane nañ s³owa s¹ kluczem do rozwi¹zania naszej zagadki. Je¿eli chcesz poznaæ odpowiedŸ na swoje pytania musisz odszukaæ fragmenty stronicy i mi je dostarczyæ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_13"); //Czujê magiczn¹ si³ê, która bije od spisanych tam s³ów. Nie mogê dok³adnie okreœliæ sk¹d, lecz wszystkie fragmenty znajduj¹ siê w naszym obozie. Ruszaj i strze¿ siê umar³ych, którzy nie mog¹ zaznaæ spokoju.
	
	Log_CreateTopic (TOPIC_Droga,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Droga, LOG_RUNNING);
	B_LogEntry (TOPIC_Droga, "Niewiele dowiedzia³em siê od Baala za wyj¹tkiem tego, ¿e przed tymi wszystkimi wydarzeniami, on jak i inni pracowali nad jakimœ magicznym zwojem. Z nieznanych mi powodów zdecydowali siê go rozerwaæ i schowaæ w najró¿niejszych miejscach obozu. Czy¿by by³y tam spisane informacje odnoœnie z³a jakie nawiedzi³o obóz? Muszê odnaleŸæ je wszystkie i przynieœæ Baalowi Orunowi. On sam oczywiœcie albo nie wie, albo zapomnia³ o tym, gdzie móg³bym je znaleŸæ...");

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
	description  =  "Znalaz³em osiem kawa³ków pergaminu.";

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
	

	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_DrogaDone_15_00"); //Znalaz³em osiem kawa³ków pergaminu.
	
	B_GiveInvItems(other,self,ItNa_FragmentZwoju,8);
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_DrogaDone_15_01"); //Nieumarli chyba wyczuli fakt tego, ¿e chcecie mi pomóc. Po odszukaniu ka¿dego fragmentu pergaminu musia³em stoczyæ pojedynek z przedziwnymi szkieletami, od których emanowa³a aura zniszczenia.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_02"); //To byli Czempioni, stra¿nicy i wys³annicy naszego wspólnego wroga. Ich zadaniem jest pilnowaæ, aby nikt z nas nie zazna³ spokoju, ani nie zdo³a³ zbiec z terenów obozu.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_03"); //Wyczuwam jednak, i¿ wszystkie kartki pergaminu znalaz³y siê w jednym miejscu. Proszê po³ó¿ je na ziemi i pozwól, ¿e odprawiê rytua³, który po³¹czy je w ca³oœæ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_04"); //(Wzdycha)
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_05"); //To... niewiarygodne. W najœmielszych pragnieniach nie s¹dzi³em, ¿e uda siê nam to uczyniæ bez uszkodzenia magicznej formu³y jaka zosta³a na nim spisana.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_06"); //Zdaje siê, ¿e wraz z tym powracaj¹ moje wspomnienia odnoœnie ubieg³ych wydarzeñ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_07"); //Widzê ciemnoœæ jaka ogarnia moich braci, niepohamowany ob³êd wdzieraj¹cy siê do naszych g³ów. Niepohamowana nienawiœæ wchodzi do wnêtrza naszego sanktuarium, nasi bracia zdaj¹ siê walczyæ u boku stra¿ników, lecz...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_08"); //Teraz to widzê... Ich... Nasze wysi³ki okaza³y siê daremne bowiem przysz³o nam walczyæ z istot¹, która nie by³a przypisana do tego œwiata i nie ima³ siê jej ¿aden orê¿.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_09"); //Lecz teraz os³ab³a, pewna siebie i braku zagro¿enia jest nieœwiadoma niebezpieczeñstwa, jakie mo¿e jej zagra¿aæ. 
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_10"); //Aby wymierzyæ jej cios, musimy znaleŸæ badania Kaloma, który zajmowa³ siê zg³êbianiem tajnik Œni¹cego i jego demonicznych s³ug.
	
	B_LogEntry (TOPIC_Droga, "Nabiega³em siê po okolicy, ale ostatecznie skompletowa³em kawa³ki zwoju. Odda³em je Orunowi, który po³¹czy³ je i stworzy³ magiczny zwój. Póki co, musimy kontynuowaæ przygotowania do rytua³u.");
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
	description	 = 	"Dlaczego ta ksi¹¿ka jest tak wa¿na?";
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
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_00"); //Dlaczego ta ksi¹¿ka jest tak wa¿na?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_01"); //O ile pamiêtam, Kalom nie przeprowadza³ jakiœ istotnych badañ w dziedzinie demonologii.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_02"); //Oceniasz go jedynie na podstawie tego, co sam widzia³eœ. Niestety jego prawdziwe 'ja' i zapêdy bardzo d³ugo umyka³y naszej uwadze.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_03"); //Tak d³ugo, ¿e nie byliœmy w stanie siê uchroniæ przed losem, jaki na nas spad³. Gdybyœmy byli tylko miej aroganccy w swoich poczynaniach i nie ufali œlepo Œni¹cemu...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_04"); //Wraz z ka¿dym wypowiedzianym s³owem czujê, jak moja dusza materializuje siê w duchowym œwiecie, przywracaj¹c mi coraz to nowsze wspomnienia.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_05"); //Widzisz coœ konkretnego? Coœ, co mog³oby mi pomóc w kolejnym zadaniu?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_06"); //Widzê... Cain, niesie ze sob¹ jak¹œ ksi¹¿kê i wychodzi z laboratorium swojego mistrza. To na pewno nie by³a zwyk³a ksi¹¿ka, chocia¿ wtedy nie zwróci³em na niego zbytnio uwagi.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_07"); //Teraz dostrzegam szczegó³y: Oprawiona w skórzany futera³ musia³a byæ dla niego bardzo cenna, bowiem przytula³ j¹ do swej piersi niczym matka dziecko.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_08"); //Niewiele pamiêtam z tego, co dzia³o siê dalej. Ostatni widok jaki kr¹¿y mi po g³owie, to jak nowicjusz poszed³ w kierunku bagien.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_09"); //Myœlê, i¿ tam powinieneœ zacz¹æ swe poszukiwania.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_10"); //A kiedy odnajdê ju¿ ksi¹¿kê, co wtedy? Jaki bêdzie nasz nastêpny cel?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_11"); //Wtedy pomo¿esz nam odprawiæ rytua³, który przywróci nam pamiêæ. Bêdzie to wymaga³o niesprzeciwienia siê obecnemu tutaj z³u i skontaktowania siê z silami, z jakimi lepiej nie mieæ stycznoœci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_12"); //Twoja pomoc oka¿e siê nieoceniona, gdy¿ si³y ciemnoœci bêd¹ zapewne chcia³y nas powstrzymaæ i uniemo¿liwiæ nam odzyskanie œwiadomoœci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_13"); //Bêdzie to pierwszy krok, który umo¿liwi nam odzyskanie wolnoœci i spokoju. Lecz nawet wtedy wci¹¿ bêdziemy niewolnikami, którzy jedynie dodadz¹ ci si³ byœ w ich imieniu wywalczy³ o wolnoœæ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_14"); //Czy jesteœ gotów podj¹æ siê tego zadania?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_15"); //Oczywiœcie, ruszam w drogê za ksi¹¿k¹. ¯yczcie mi powodzenia.
	
	Log_CreateTopic (TOPIC_BadaniaCaloma,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BadaniaCaloma, LOG_RUNNING);
	B_LogEntry (TOPIC_BadaniaCaloma, "Aby umo¿liwiæ duchom odzyskanie pe³nej œwiadomoœci, muszê znaleŸæ ksi¹¿kê, która zawiera zapiski Kaloma. S¹ tam odpowiedzi na nasze pytania odnoœnie z³a, jakie siê tutaj zalêg³o i tego jak mo¿na je pokonaæ. Czy¿by pocz¹tkowo nawet sam Kalom nie ufa³ w pe³ni Œni¹cemu?");
	
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
	description	 =	"Znalaz³em ksi¹¿kê.";
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
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_15_00"); //Znalaz³em ksi¹¿kê. 
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_15_01"); //Musia³em siê trochê natrudziæ, by j¹ znaleŸæ wiêc liczê, ¿e oka¿e siê po¿yteczna w naszych dzia³aniach.
	B_GiveInvItems (other,self,ItNa_CorKalom_Book,1);
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_024_02"); //Doskonale! Miejmy nadziejê, ¿e dziêki temu odkryjemy sposób na to, jak wygnaæ z³o. Niestety, bêdziemy potrzebowali trochê czasu, by zg³êbiæ wiedzê jaka drzemi¹ w zwoju i ksi¹¿ce, które nam dostarczy³eœ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_024_03"); //Wróæ do nas nastêpnego dnia, a na pewno bêdziemy mieli dla ciebie jakieœ informacje.
	OrunBadaKsiazke = 1;
	
	B_LogEntry (TOPIC_BadaniaCaloma, "Mam wróciæ do Oruna nastêpnego dnia.");


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
	description	 =	"Jak przebiegaj¹ prace, odkryliœcie ju¿ coœ?";
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
	AI_Output (other, self, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_15_00"); //Jak przebiegaj¹ prace, odkryliœcie ju¿ coœ?
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_01"); //Tak! Uda³o nam siê posi¹œæ wiedzê, dziêki której zdo³amy wyswobodziæ siê z wp³ywu demona.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_02"); //Teraz pozostaje jedynie odprawiæ rytua³, który przypieczêtuje nasze uwolnienie siê z jarzma niewolnictwa.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_03"); //Aby to jednak uczyniæ, bêdziemy musieli zebraæ siê na placu nauk i przygotowaæ siê do obrony, albowiem si³y ciemnoœci nie bêd¹ siê temu biernie przygl¹da³y.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_04"); //Prawdopodobnie zostaniemy zaatakowani przez potê¿nych nieprzyjació³, a to na tobie spadnie obowi¹zek ochraniania nas podczas rytua³u.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_05"); //Podczas jego przeprowadzania bêdziemy zupe³nie bezbronni, dlatego te¿ bêdziesz zmuszony daæ z siebie wiêcej ni¿ podczas ca³ej swojej podró¿y.
	AI_Output (other, self, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_15_06"); //Pokona³em ju¿ tyle trudnoœci, ¿e nic mnie nie zatrzyma. Zaczynajmy, nie ma na co czekaæ.
	
	B_LogEntry (TOPIC_BadaniaCaloma, "Baal rozpracowa³ ksiêgê i teraz mo¿emy udaæ siê na plac œwi¹tynny, by odprawiæ rytua³.");
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
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Rytual_024_00"); //Zanim zaczniemy, potrzebujê jeszcze, abyœ odda³ mi przedmioty, które otrzyma³eœ od moich braci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Rytual_024_01"); //Energia, która w nich drzemie, oka¿e siê nieoceniona podczas naszego przedsiêwziêcia.
	
	B_GiveInvItems(other,self,ItNa_Pierscien_Glodu,1);
	B_GiveInvItems(other,self,ItNa_Pierscien_Zarazy,1);
	B_GiveInvItems(other,self,ItNa_Pas_Smierci,1);
	
	AI_Output			(other,self, "DIA_NASZ_024_BaalOrun_Rytual_15_02"); //Oto one, a teraz zaczynajmy, gdy¿ wyczuwam nadchodz¹ce k³opoty.
		
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
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_00"); //To... To chyba naprawdê siê uda³o, niewiarygodne! Szczerze nie przypuszcza³em, ¿e uda nam siê wyswobodziæ i odzyskaæ œwiadomoœæ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_01"); //Magiczna bariera we wrotach œwi¹tyni zosta³a z³amana... Czujê... Czujê, jak z³o, które w niej spoczywa³o rozlewa siê po obozie doprowadzaj¹c do furii wszystkich nieumar³ych, którzy siê tu znajduj¹.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_02"); //Nim ruszysz do œwi¹tyni musisz u¿yæ zwoju, który powsta³ przez po³¹czenie kawa³ków znalezionych przez ciebie.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_03"); //Dziêki temu bêdziesz traktowany jako pe³noprawny cz³onek Bractwa i magiczna bariera przy wejœciu do œwi¹tyni ciê nie powstrzyma.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_04"); //Ale uprzedzam ciê! U¿yj zwoju dopiero wtedy, gdy za³o¿ysz na siebie wszystkie artefakty. WeŸ kolejny: Ten amulet to znak okazania nam pomocy w odzyskaniu pe³nej œwiadomoœci.
	CreateInvItems(self,ItNa_Amulet_Wojny,1);
	
	B_GiveInvItems(self,other,ItNa_Amulet_Wojny,1);
	B_GiveInvItems(self,other,ItNa_Pierscien_Glodu,1);
	B_GiveInvItems(self,other,ItNa_Pierscien_Zarazy,1);
	B_GiveInvItems(self,other,ItNa_Pas_Smierci,1);
	
	Createinvitems (self, ItNa_Grow, 1);
	B_GiveInvItems(self,other,ItNa_Grow,1);
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_05"); //A teraz ruszaj, nim bêdzie za póŸno.
	
	B_LogEntry (TOPIC_zacmienie, "Bariera, blokuj¹ca wejœcie do œwi¹tyni, zosta³a z³amana. Baal wrêczy³ mi zaklêcie, które powsta³o w wyniku po³¹czenia wszystkich kawa³ków pergaminu. Aby staæ siê pe³noprawnym cz³onkiem Bractwa i przejœæ przez magiczne pole w wejœciu do œwi¹tyni, mam u¿yæ zwoju z za³o¿onymi wszystkimi czterema artefaktami, które otrzyma³em od duchów.");

	OrunRediToTelepport = TRUE;
};




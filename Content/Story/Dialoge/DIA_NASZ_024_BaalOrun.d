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
	description	 = 	"Czy mogê wam jako¶ pomóc?";
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
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_00"); //Czy mogê wam jako¶ pomóc?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_01"); //Musi byæ sposób aby uwolniæ was z jarzma kl±twy.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_02"); //A dlaczego mieliby¶my wierzyæ w twoje szlachetne pobudki? Mo¿e jeste¶ wys³annikiem naszego ciemiê¿cy, który ma sprawdziæ, czy nie spiskujemy przeciwko niemu?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_03"); //Nie, mój ch³opcze. Musisz najpierw udowodniæ nam, i¿ nie kieruj± tob± z³e pobudki.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_04"); //Eh, znowu bêdê musia³ robiæ za ch³opca na posy³ki.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Lojalnosc_15_05"); //Jak mogê wam pomóc?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Lojalnosc_024_06"); //Porozmawiaj z Shratem, Joru i Ghorimem. Ka¿dy z nich przydzieli ci jedno zadanie, które musisz rozwi±zaæ.
	
	Log_CreateTopic (TOPIC_Lojalnosc,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lojalnosc, LOG_RUNNING);
	B_LogEntry (TOPIC_Lojalnosc, "Kiedy zapyta³em siê przywódcy duchów, jak mogê im pomóc, ten odrzek³, i¿ nie zdradz± mi, co mogê uczyniæ, dopóki nie udowodniê im swoich intencji. Aby zyskaæ ich zaufanie, muszê udaæ siê do trzech znanych mi nowicjuszy: Joru, Ghorima i Shrata. Tylko gdzie oni mog± byæ?");

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
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_01"); //Wszyscy zaznali ukojenia i spokoju. Tak jak prosi³e¶.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_024_02"); //Wiem, czu³em to za ka¿dym razem, kiedy pomaga³e¶ jednemu z nich. Masz ze sob± równie¿ trzy magiczne artefakty, które mog³e¶ otrzymaæ jedynie po wykonaniu zadania.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_03"); //Czym w³a¶ciwie s± te przedmioty i jaki maj± cel?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_15_04"); //Ka¿dy z nich manifestuje cechê, jak± wykaza³e¶ siê podczas pomocy moim braciom. By³y to pobo¿no¶æ, bezinteresowna pomoc i wierno¶æ wzglêdem przyjaciela. Przedmioty te pomog± ci dostaæ siê do ¶wi±tyni.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_done_024_05"); //Jednak zanim tam wejdziesz musia³ za³atwiæ jeszcze jedn± sprawê.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_done_15_06"); //Czego innego mog³em siê spodziewaæ...
	
	B_GivePlayerXP(500);
	B_LogEntry (TOPIC_Lojalnosc, "Wykaza³em swoj± lojalno¶æ, ale oczywi¶cie to jeszcze nie koniec. Przede mn± kolejne wyzwania.");
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
	description	 =	"Istnieje jaki¶ sposób, by was uwolniæ?";
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
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_00"); //Istnieje jaki¶ sposób, by was uwolniæ?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_01"); //Ci±¿±ce na nas z³o mo¿e pokonaæ jedynie ¶miertelnik o mê¿nym sercu, który nie lêka siê spotkania z uosobieniem samej ¶mierci i cierpienia.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_02"); //Niestety, wojowniku, nie mo¿esz po prostu wej¶æ do wnêtrza naszej ¶wi±tyni, gdy¿ ta zosta³a zapieczêtowana i nikt nie ma do niej dostêpu. Jakakolwiek próba sforsowania kamiennych wrót skoñczy siê dla ciebie ¶mierci±.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_03"); //Wiêc powiedz mi, jak mogê dostaæ siê do jej wnêtrza i przegnaæ znajduj±ce siê wewn±trz z³o. Przecie¿ musi byæ jaki¶ sposób!
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_04"); //To by³o tak dawno... Mój umys³ jak i wspomnienia s± teraz jedynie strzêpami wszystkiego co wiedzia³em, pogr±¿one w wiecznej pustce jak moje zagubione ja zdaj± siê byæ nieuchwytne, niedo¶cignione...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_05"); //Ponadto nie mo¿emy pomóc ci bezpo¶rednio. Jarzmo kl±twy uniemo¿liwia nam sprzeciwienie siê naszemu panu. Musia³by¶ znale¼æ co¶ co pomog³oby ci siê do niego dostaæ, lecz niewiele ju¿ pamiêtam.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_Droga_15_06"); //¯y³e¶ w okresie kiedy to wszystko siê rozegra³o, skup siê i przypomnij to sobie!
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_07"); //To by³o tak dawno...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_08"); //Skrawki wspomnieñ zdaj± siê tworzyæ bardzo niespójny obraz. Widzê przed sob± siebie i moich braci, zdajemy siê byæ pogr±¿eni w ¿arliwej dyskusji.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_09"); //Jeden z nich wyci±ga kartkê... Nie, magiczny pergamin... I zaczyna co¶ na nim spisywaæ. Dopiero teraz dostrzegam mrok, jaki ogarnia nasze sylwetki. Co¶ co zdaje siê nas poch³aniaæ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_10"); //Ja, to ja rozrywam pergamin na kawa³ki. Ja dajê je nowicjuszom aby pochowali je w obozie, lecz nie wiem gdzie siê udali.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_11"); //Nie wiedzieæ czemu, mam silne wra¿enie, i¿ zapisane nañ s³owa s± kluczem do rozwi±zania naszej zagadki. Je¿eli chcesz poznaæ odpowied¼ na swoje pytania musisz odszukaæ fragmenty stronicy i mi je dostarczyæ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Droga_024_12"); //Czujê magiczn± si³ê, która bije od spisanych tam s³ów. Nie mogê dok³adnie okre¶liæ sk±d, lecz wszystkie fragmenty znajduj± siê w naszym obozie. Ruszaj i strze¿ siê umar³ych, którzy nie mog± zaznaæ spokoju.
	
	Log_CreateTopic (TOPIC_Droga,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Droga, LOG_RUNNING);
	B_LogEntry (TOPIC_Droga, "Niewiele dowiedzia³em siê od Baala za wyj±tkiem tego, ¿e przed tymi wszystkimi wydarzeniami on jak i inni pracowali nad jakim¶ magicznym zwojem. Z nieznanych mi powodów zdecydowali siê go rozerwaæ i schowaæ w najró¿niejszych miejscach obozu. Czy¿by by³y tam spisane informacje odno¶nie z³a jakie nawiedzi³o obóz? Muszê odnale¼æ je wszystkie i przynie¶æ Baalowi Orunowi. On sam oczywi¶cie albo nie wie albo zapomnia³ o tym, gdzie móg³bym je znale¼æ...");

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
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_02"); //To byli Czempioni - stra¿nicy i wys³annicy naszego wspólnego wroga. Ich zadaniem jest pilnowaæ, aby nikt z nas nie zazna³ spokoju, ani nie zdo³a³ zbiec z terenów obozu.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_03"); //Wyczuwam jednak, i¿ wszystkie kartki pergaminu znalaz³y siê w jednym miejscu. Proszê po³ó¿ je na ziemi i pozwól, ¿e odprawiê rytua³, który po³±czy je w ca³o¶æ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_04"); //(Wzdycha)
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_05"); //To... niewiarygodne. W naj¶mielszych pragnieniach nie s±dzi³em, ¿e uda siê nam to uczyniæ bez uszkodzenia magicznej formu³y jaka zosta³a na nim spisana.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_06"); //Zdaje siê, ¿e wraz z tym powracaj± moje wspomnienia odno¶nie ubieg³ych wydarzeñ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_07"); //Widzê ciemno¶æ jaka ogarnia moich braci, niepohamowany ob³êd wdzieraj±cy siê do naszych g³ów. Niepohamowana nienawi¶æ wchodzi do wnêtrza naszego sanktuarium, nasi bracia zdaj± siê walczyæ u boku stra¿ników, lecz...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_08"); //Teraz to widzê... Ich... Nasze wysi³ki okaza³y siê daremne bowiem przysz³o nam walczyæ z istot±, która nie by³a przypisana do tego ¶wiata i nie ima³ siê jej ¿aden orê¿.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_09"); //Lecz teraz os³ab³a, pewna siebie i braku zagro¿enia jest nie¶wiadoma niebezpieczeñstwa, jakie mo¿e jej zagra¿aæ. 
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_DrogaDone_024_10"); //Aby wymierzyæ jej cios, musimy znale¼æ badania Kaloma, który zajmowa³ siê zg³êbianiem tajnik ¦ni±cego i jego demonicznych s³ug.
	
	B_LogEntry (TOPIC_Droga, "Nabiega³em siê po okolicy, ale ostatecznie skompletowa³em kawa³ki zwoju. Odda³em je Orunowi, który po³±czy³ je i stworzy³ magiczny zwój. Póki co musimy kontynuowaæ przygotowania do rytua³u.");
	Log_SetTopicStatus (TOPIC_Droga, LOG_SUCCESS);


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
	description	 = 	"Dlaczego ta ksi±¿ka jest tak wa¿na?";
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
	
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_00"); //Dlaczego ta ksi±¿ka jest tak wa¿na?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_01"); //O ile pamiêtam Kalom nie przeprowadza³ jaki¶ istotnych badañ w dziedzinie demonologii.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_02"); //Oceniasz go jedynie na podstawie tego, co sam widzia³e¶. Niestety jego prawdziwe 'ja' i zapêdy bardzo d³ugo umyka³y naszej uwadze.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_03"); //Tak d³ugo, i¿ nie byli¶my w stanie uchroniæ przed losem, jaki na nas spad³. Gdyby¶my byli tylko miej aroganccy w swoich poczynaniach i nie ufali ¶lepo ¦ni±cemu...
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_04"); //Wraz z ka¿dym wypowiedzianym s³owem czujê, jak moja dusza materializuje siê w duchowym ¶wiecie, przywracaj±c mi coraz to nowsze wspomnienia.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_05"); //Widzisz co¶ konkretnego co¶ co mog³oby mi pomóc w kolejnym zadaniu?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_06"); //Widzê... Cain, niesie ze sob± jak±¶ ksi±¿kê i wychodzi z laboratorium swojego mistrza. To na pewno nie by³a zwyk³a ksi±¿ka, chocia¿ wtedy nie zwróci³em na niego zbytnio uwagi.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_07"); //Teraz dostrzegam szczegó³y: Oprawiona w skórzany futera³ musia³a byæ dla niego bardzo cenna, bowiem przytula³ j± do swej piersi niczym matka dziecko.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_08"); //Niewiele pamiêtam z tego, co dzia³o siê dalej. Ostatni widok jaki kr±¿y mi po g³owie, to jak nowicjusz poszed³ w kierunku bagien.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_09"); //My¶lê, i¿ tam powiniene¶ zacz±æ swe poszukiwania.
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_10"); //A kiedy odnajdê ju¿ ksi±¿kê, co wtedy? Jaki bêdzie nasz nastêpny cel?
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_11"); //Wtedy pomo¿esz nam odprawiæ rytua³, który przywróci nam pamiêæ. Bêdzie to wymaga³o niesprzeciwienia siê obecnemu tutaj z³u i skontaktowania siê z silami, z jakimi lepiej nie mieæ styczno¶ci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_12"); //Twoja pomoc oka¿e siê nieoceniona, gdy¿ si³y ciemno¶ci bêd± zapewne chcia³y nas powstrzymaæ i uniemo¿liwiæ nam odzyskanie ¶wiadomo¶ci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_13"); //Bêdzie to pierwszy krok, który umo¿liwi nam odzyskanie wolno¶ci i spokoju. Lecz nawet wtedy wci±¿ bêdziemy niewolnikami, którzy jedynie dodadz± ci si³ by¶ w ich imieniu wywalczy³ o wolno¶æ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_024_14"); //Czy jeste¶ gotów podj±æ siê tego zadania?
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_BadaniaCorCaloma_15_15"); //Oczywi¶cie, ruszam w drogê za ksi±¿k±. ¯yczcie mi powodzenia.
	
	Log_CreateTopic (TOPIC_BadaniaCaloma,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BadaniaCaloma, LOG_RUNNING);
	B_LogEntry (TOPIC_BadaniaCaloma, "Aby umo¿liwiæ duchom odzyskanie pe³nej ¶wiadomo¶ci muszê znale¼æ ksi±¿kê, która zawiera zapiski Kaloma. S± tam odpowiedzi na nasze pytania odno¶nie z³a jakie siê tutaj zalêg³o i tego jak mo¿na je pokonaæ. Czy¿by pocz±tkowo nawet sam Kalom nie ufa³ w pe³ni ¦ni±cemu?");
	
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
	description	 =	"Znalaz³em ksi±¿kê.";
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
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_15_00"); //Znalaz³em ksi±¿kê. 
	AI_Output			(other, self, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_15_01"); //Musia³em siê trochê natrudziæ, by j± znale¼æ wiêc liczê, ¿e oka¿e siê po¿yteczna w naszych dzia³aniach.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_024_02"); //Doskonale! Miejmy nadziejê, ¿e dziêki temu odkryjemy sposób na to, jak wygnaæ z³o. Niestety, bêdziemy potrzebowali trochê czasu, by zg³êbiæ wiedzê jaka drzemi± w zwoju i ksi±¿ce, które nam dostarczy³e¶.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_MamBadaniaCaloma_024_03"); //Wróæ do nas nastêpnego dnia, a na pewno bêdziemy mieli dla ciebie jakie¶ informacje.
	OrunBadaKsiazke = 1;

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
	description	 =	"Znalaz³em ksi±¿kê.";
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
	AI_Output (other, self, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_15_00"); //Jak przebiegaj± prace, odkryli¶cie ju¿ co¶?
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_01"); //Tak! Uda³o nam siê posi±¶æ wiedzê dziêki, której zdo³amy wyswobodziæ siê z wp³ywu demona.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_02"); //Teraz pozostaje jedynie odprawiæ rytua³, który przypieczêtuje nasze uwolnienie siê z jarzma niewolnictwa.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_03"); //Aby to jednak uczyniæ, bêdziemy musieli zebraæ siê na placu nauk i przygotowaæ siê do obrony, albowiem si³y ciemno¶ci nie bêd± siê temu biernie przygl±da³y.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_04"); //Prawdopodobnie zostaniemy zaatakowani przez potê¿nych nieprzyjació³, a to na tobie spadnie obowi±zek ochraniania nas podczas rytua³u.
	AI_Output (self, other, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_024_05"); //Podczas jego przeprowadzania bêdziemy zupe³nie bezbronni, dlatego te¿ bêdziesz zmuszony daæ z siebie wiêcej podczas ca³ej swojej podró¿y.
	AI_Output (other, self, "DIA_NASZ_024_BaalOrun_JakPrzebiegajaPrace_15_06"); //Pokona³em ju¿ tyle trudno¶ci, ¿e nic mnie nie zatrzyma. Zaczynajmy, nie ma na co czekaæ.
	
	Log_SetTopicStatus (TOPIC_BadaniaCaloma, LOG_SUCCESS);
	OrunBadaKsiazke = 2;
	
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
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Rytual_024_00"); //Zanim zaczniemy, potrzebujê jeszcze, aby¶ odda³ mi przedmioty, które otrzyma³e¶ od moich braci.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_Rytual_024_01"); //Energia, która w nich drzemie, oka¿e siê nieoceniona podczas naszego przedsiêwziêcia.
	
	B_GiveInvItems(other,self,ItNa_Pierscien_Glodu,1);
	B_GiveInvItems(other,self,ItNa_Pierscien_Zarazy,1);
	B_GiveInvItems(other,self,ItNa_Pas_Smierci,1);
	
	AI_Output			(other,self, "DIA_NASZ_024_BaalOrun_Rytual_15_02"); //Oto one, a teraz zaczynajmy, gdy¿ wyczuwam nadchodz±ce k³opoty.
		
	AI_StopProcessInfos (self);

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
	//TODO:
	if(NPC_KnowsInfo(other,DIA_NASZ_024_BaalOrun_Rytual) /*&& cos z tym rytualem*/)
	{
		return TRUE;
	};
};
func void DIA_NASZ_024_BaalOrun_RytualCD_Info ()
{
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_00"); //To... To chyba naprawdê siê uda³o, niewiarygodne! Szczerze nie przypuszcza³em, i¿ uda nam siê wyswobodziæ i odzyskaæ ¶wiadomo¶æ.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_01"); //Magiczna bariera we wrotach ¶wi±tyni zosta³a z³amana... Czujê, czujê jak z³o, które w niej spoczywa³o rozlewa siê po obozie doprowadzaj±c do furii wszystkich nieumar³ych, którzy siê tu znajduj±.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_02"); //Nim ruszysz do ¶wi±tyni musisz u¿yæ zwoju, który powsta³ przez po³±czenie kawa³ków znalezionych przez ciebie. Dziêki temu bêdziesz traktowany jako pe³noprawny cz³onek Bractwa i magiczna bariera przy wej¶ciu do ¶wi±tyni ciê nie powstrzyma.
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_03"); //Ale uprzedzam ciê! U¿yj zwoju dopiero wtedy, gdy za³o¿ysz na siebie wszystkie artefakty. We¼ kolejny: Ten amulet to znak okazania nam pomocy w odzyskaniu pe³nej ¶wiadomo¶ci.
	CreateInvItems(self,ItNa_Amulet_Wojny,1);
	
	B_GiveInvItems(self,other,ItNa_Amulet_Wojny,1);
	B_GiveInvItems(self,other,ItNa_Pierscien_Glodu,1);
	B_GiveInvItems(self,other,ItNa_Pierscien_Zarazy,1);
	B_GiveInvItems(self,other,ItNa_Pas_Smierci,1);
	
	Createinvitems (self, ItNa_Grow, 1);
	B_GiveInvItems(self,other,ItNa_Grow,1);
	
	AI_Output			(self, other, "DIA_NASZ_024_BaalOrun_RytualCD_024_04"); //A teraz ruszaj, nim bêdzie za pó¼no.
	
	Log_CreateTopic (TOPIC_Zlo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Zlo, LOG_RUNNING);
	B_LogEntry (TOPIC_Zlo, "Moc bariery do ¦wi±tyni zosta³a z³amana. Baal wrêczy³ mi zaklêcie, które powsta³o w wyniku po³±czenia wszystkich kawa³ków pergaminu. Aby staæ siê pe³noprawnym cz³onkiem Bractwa i przej¶æ przez magiczne pole w wej¶ciu do ¶wi±tyni, mam u¿yæ zwoju z za³o¿onymi wszystkimi czterema artefaktami, które otrzyma³em od duchów.");

	OrunRediToTelepport = TRUE;
};




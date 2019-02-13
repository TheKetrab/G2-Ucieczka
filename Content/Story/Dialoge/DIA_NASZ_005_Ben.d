//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_EXIT   (C_INFO)
{
	npc         = NASZ_005_Ben;
	nr          = 999;
	condition   = DIA_NASZ_005_Ben_EXIT_Condition;
	information = DIA_NASZ_005_Ben_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_005_Ben_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_005_Ben_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info hi 
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_hi   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 1;
 	condition   = DIA_NASZ_005_Ben_hi_Condition;
 	information = DIA_NASZ_005_Ben_hi_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_005_Ben_hi_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_006_Renegat_siema)) && (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_hi_Info()
{
	AI_Output (other, self,"DIA_NASZ_005_Ben_hi_15_00"); //Wygl�dasz na strasznie zmartwionego, czy co� si� sta�o?
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_55_01"); //Mnie na szcz�cie nic, ale nie mog� tego samego powiedzie� o innych ch�opakach.
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_55_02"); //Na pewno dzi� ich ju� mija�e�, czy nic nie rzuci�o ci si� w oczy?

	Info_ClearChoices (DIA_NASZ_005_Ben_hi);
		Info_AddChoice	  (DIA_NASZ_005_Ben_hi, "Owszem, jednak nie wiem, czy konkretnie to masz na my�li.", DIA_NASZ_005_Ben_hi_yes);
		Info_AddChoice	  (DIA_NASZ_005_Ben_hi, "Nic szczeg�lnego... A dlaczego pytasz?", DIA_NASZ_005_Ben_hi_no);
			
};

FUNC VOID DIA_NASZ_005_Ben_hi_yes()
{

	AI_Output (other,self ,"DIA_NASZ_005_Ben_hi_yes_15_00"); //Owszem, jednak nie wiem, czy konkretnie to masz na my�li.
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_01"); //M�w.
	AI_Output (other, self,"DIA_NASZ_005_Ben_hi_yes_55_02"); //Kiedy chodzi�em po kopalni spostrzeg�em, �e wi�kszo�� z nich ledwie trzyma w d�oniach kilof.
	AI_Output (other, self,"DIA_NASZ_005_Ben_hi_yes_55_03"); //Nie m�wi�c ju� o uderzaniu nim w rud�... Ponadto s� strasznie wychudzeni i opadaj� z si�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_04"); //Dok�adnie! Ci nad�ci paladyni nie interesuj� si� niczym innym, ni� t� swoj� cholern� rud� i jej wydobyciem!
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_05"); //Jak my�lisz, czy ktokolwiek z nich przejmuje si� naszym losem? Sk�d! Ka�dego dnia zmuszaj� nas do nieludzkiej pracy ponad nasze si�y, a co otrzymujemy w zamian?
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_06"); //Kawa�ek suchego i twardego jak mi�so z�bacza chleba oraz butelk� brudnej wody z rzeki...
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_07"); //Willu, je�eli czego� nie zrobimy, to nied�ugo ta kopalnia b�dzie pusta, gdy� wszyscy pomrzemy z g�odu... Nawet ja zaczynam odczuwa� skutki tej kiepskiej diety...
	AI_Output (other,self ,"DIA_NASZ_005_Ben_hi_yes_15_08"); //Nie tylko ty...

	AI_PlayAni(other,"T_FORGETIT"); 

	Info_ClearChoices (DIA_NASZ_005_Ben_hi);
};

FUNC VOID DIA_NASZ_005_Ben_hi_no()
{

	AI_Output (other,self ,"DIA_NASZ_005_Ben_hi_no_15_00"); //Nic szczeg�lnego... A dlaczego pytasz?
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_no_55_01"); //Przyjacielu, jak zawsze jeste� rozkojarzony. Sp�jrz tylko na tych biedak�w. �yj� i pracuj� resztkami swoich si�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_no_55_02"); //Jak my�lisz, jak d�ugo dadz� rad� tak ci�gn��, je�eli za swoj� niewolnicz� i wr�cz nieludzk� prac� otrzymuj� marne och�apy jedzenia w postaci suchego, twardego chleba i butelki wody?
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_no_55_03"); //Musimy co� zdzia�a� w tej kwestii, bo nawet i ja zaczynam odczuwa� skutki g�od�wek...
	AI_Output (other,self ,"DIA_NASZ_005_Ben_hi_no_15_04"); //Ja r�wnie�.

	AI_PlayAni(other,"T_FORGETIT"); 

	Info_ClearChoices (DIA_NASZ_005_Ben_hi);
};

//*********************************************************************
//	         HaveYouGotAnIdea
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_HaveYouGotAnIdea   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 2;
 	condition   = DIA_NASZ_005_Ben_HaveYouGotAnIdea_Condition;
 	information = DIA_NASZ_005_Ben_HaveYouGotAnIdea_Info;
 	permanent   = FALSE;
 	description = "Masz jaki� pomys�?";
};

FUNC INT DIA_NASZ_005_Ben_HaveYouGotAnIdea_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_hi))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_HaveYouGotAnIdea_Info()
{
	AI_Output (other,self ,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_15_00"); //Masz jaki� pomys�?
	AI_PlayAni (self,"R_SCRATCHHEAD");
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_01"); //Mam pewien plan, jednak musisz sam wyrazi� zgod�, albowiem jeste� jego najwa�niejszym elementem.
	AI_Output (other, self,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_02"); //Je�eli dzi�ki temu planowi b�d� m�g� porz�dnie zje��, to uwierz mi, �e to zrobi�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_03"); //Determinacja, to w tobie lubi�. S�uchaj, jak dobrze pami�tam, to ty wraz z Grimesem pokaza�e� Marcosowi drog� do tej kopalni, zgadza si�?
	AI_Output (other, self,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_04"); //Tak, aczkolwiek teraz �a�uj�, i� nie da�em nogi przy pierwszej lepszej okazji.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_05"); //Ka�dy pope�nia b��dy przyjacielu, ale do rzeczy. Ty, jako jedyny z nas wszystkich, mo�esz przem�wi� tym rycerzykom do g�owy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_06"); //W ko�cu im pomog�e�, a nawet najwi�kszy dupek z ich zakonu czuje w sobie potrzeb� sp�acania d�ug�w.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_07"); //P�jd� do stra�nika i spr�buj przekona� go, aby przem�wi� Marcosowi do rozs�dku w kwestii naszych racji �ywno�ciowych, zgoda?
	AI_Output (other, self,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_08"); //Zobacz� co da si� zrobi�, ale niczego nie obiecuj�. W�tpi� aby mnie pos�uchali.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_09"); //Zawsze warto pr�bowa�, pami�taj o tym przyjacielu.

	BenPomysl_Fail=1;

	Log_CreateTopic (TOPIC_Ben_pomysl, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ben_pomysl, LOG_RUNNING);
	B_LogEntry (TOPIC_Ben_pomysl, "Sytuacja w kopalni staje si� coraz gorsza. Paladyni od pewnego czasu daj� nam coraz mniejsze racje �ywno�ciowe, jednocze�nie wymagaj�c od nas, aby�my pracowali z wi�ksz� intensywno�ci�. Ben wpad� na pomys�: Chce, abym uda� si� do stra�nika i spr�bowa� go przekona�, by ten da� zna� Marcosowi, �e nied�ugo wszyscy pomrzemy z g�odu. W�tpi�, �e to co� da, jednak warto pr�bowa�. Zastanawiam si� tylko, dlaczego ta ruda jest dla nich, a� tak bardzo wa�na.");

};

//*********************************************************************
//	         Ben1_Finish
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_Ben1_Finish   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 3;
 	condition   = DIA_NASZ_005_Ben_Ben1_Finish_Condition;
 	information = DIA_NASZ_005_Ben_Ben1_Finish_Info;
 	permanent   = FALSE;
 	description = "Rozmawia�em ze stra�nikiem.";
};

FUNC INT DIA_NASZ_005_Ben_Ben1_Finish_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_hi)) && (npc_knowsinfo(other,DIA_NASZ_006_Renegat_siema3)) && (BenPomysl_Fail>=2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_Ben1_Finish_Info()
{
	AI_Output (other,self ,"DIA_NASZ_005_Ben_Ben1_Finish_15_00"); //Rozmawia�em ze stra�nikiem.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben1_Finish_55_01"); //I co, jak ci posz�o?
	
	if(BenPomysl_Fail==2) {
		AI_Output (other, self,"DIA_NASZ_005_Ben_Ben1_Finish_55_02"); //Ten dra� nawet nie chcia� mnie wys�ucha�. Tak jak si� spodziewa�em.
		AI_Output (self, other,"DIA_NASZ_005_Ben_Ben1_Finish_55_03"); //Cholera, to niedobrze. Przynajmniej pr�bowa�e�. Ch�opcy i tak s� ci wdzi�czni za starania.

		B_GivePlayerXP(10);
	}
	else {
		AI_Output (other, self,"DIA_NASZ_005_Ben_Ben1_Finish_55_04"); //Pocz�tkowo my�la�em, i� mi si� nie uda. Jednak pod naporem moich argument�w, ten baran a� zaniem�wi� i zgodzi� si� porozmawia� z Marcosem.
		AI_Output (self, other,"DIA_NASZ_005_Ben_Ben1_Finish_55_05"); //To wspania�e wie�ci! Ch�opcy i ja jeste�my ci wdzi�czni za pomoc! Mo�e w ko�cu zjemy co� wi�cej ni� chleb i wod�...

		B_GivePlayerXP(50);
	};

	Log_SetTopicStatus (TOPIC_Ben_pomysl, LOG_SUCCESS);

};

//*********************************************************************
//	         BenIfYouNotSuccessed1
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_BenIfYouNotSuccessed1   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 4;
 	condition   = DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_Condition;
 	information = DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_Info;
 	permanent   = FALSE;
 	description = "Co teraz zrobimy?";
};

FUNC INT DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_Ben1_Finish)) && (BenPomysl_Fail==2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_Info()
{
	AI_Output (other,self ,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_15_00"); //Co teraz zrobimy?
	AI_Output (other,self ,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_15_01"); //Nie mo�emy przecie� sta� z za�o�onymi r�koma, bo wkr�tce wszyscy tu pomrzemy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_55_02"); //W zaistnia�ej sytuacji musimy przyspieszy� realizacj� naszego planu, zdobycie dodatkowych racji �ywno�ciowych mia�o nam da� wystarczaj�c� du�o czasy do przygotowa�, lecz...
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_55_03"); //Teraz musimy zmieni� swoj� strategi�, b�dzie ci�ej ni� przypuszcza�em.
	AI_Output (other, self,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_55_04"); //Jakiego planu?
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_55_05"); //Chcemy uciec, przyjacielu.

};

//*********************************************************************
//	         BenIfYouSuccessed1
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_BenIfYouSuccessed1   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 5;
 	condition   = DIA_NASZ_005_Ben_BenIfYouSuccessed1_Condition;
 	information = DIA_NASZ_005_Ben_BenIfYouSuccessed1_Info;
 	permanent   = FALSE;
 	description = "Mog� zrobi� co� jeszcze?";
};

FUNC INT DIA_NASZ_005_Ben_BenIfYouSuccessed1_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_Ben1_Finish)) && (BenPomysl_Fail!=2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_BenIfYouSuccessed1_Info()
{
	AI_Output (other,self ,"DIA_NASZ_005_Ben_BenIfYouSuccessed1_15_00"); //Mog� zrobi� co� jeszcze?
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouSuccessed1_15_01"); //Dobrze, �e pytasz, gdy� nasta� chyba najwy�szy czas, aby wprowadzi� ci� w szczeg�y naszego planu.
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouSuccessed1_55_02"); //Dzi�ki temu, �e wywalczy�e� u paladyn�w wi�ksze racje �ywno�ciowe, mamy do�� czasu, aby przygotowa� plany do ucieczki z kopalni.
};


//*********************************************************************
//	         Ben2Escape
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_Ben2Escape   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 6;
 	condition   = DIA_NASZ_005_Ben_Ben2Escape_Condition;
 	information = DIA_NASZ_005_Ben_Ben2Escape_Info;
 	permanent   = FALSE;
 	description = "Chcecie uciec?";
};

FUNC INT DIA_NASZ_005_Ben_Ben2Escape_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_BenIfYouSuccessed1)) || (npc_knowsinfo (other, DIA_NASZ_005_Ben_BenIfYouNotSuccessed1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_Ben2Escape_Info()
{
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben2Escape_15_00"); //Chcecie uciec?
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2Escape_15_01"); //Na Innosa, przyjacielu, b�d��e ciszej! Chyba, �e chcesz, aby zaraz przyby� tutaj stra�nik, wywl�k� nas z kopalni i powiesi� przed tunelami w ramach przestrogi dla reszty.
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben2Escape_55_02"); //Czemu nie powiedzia�e� mi o waszych planach? My�la�em, �e jeste�my przyjaci�mi.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2Escape_15_03"); //Nie miej mi tego za z�e. Chcia�em ci o tym opowiedzie�, jednak Sattar zaproponowa�, aby�my zaczekali do chwili, kiedy b�dziemy mieli ju� pewno�� powodzenia naszych zamiar�w.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2Escape_15_04"); //Willu, jeste� najm�odszy ze wszystkich obecnych tutaj g�rnik�w. Nikt z nas nie chcia� ryzykowa� twoim �yciem u pocz�tku spiskowania, gdy� w ka�dej chwili mogli�my zosta� zdemaskowani.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2Escape_15_05"); //A wiesz, co za to grozi, prawda? �mier� by�aby wtedy twoim wybawieniem. Od��my jednak te b�ahostki na bok. Skoro ju� wiesz o naszych zamiarach, to mo�esz nam pom�c.
	
	B_LogEntry (TOPIC_Kopalnia, "Nie przypuszcza�em, �e kto� poza mn� my�li o tym, jak si� st�d wyrwa�. Ben przewodzi grupie kopaczy, kt�ra ma zamiar podj�� si� ucieczki z kopalni. Zaproponowa� mi udzia� w ca�ym przedsi�wzi�ciu. By� mo�e nied�ugo zaznam �wie�ego powietrza.");
		
};



//*********************************************************************
//	         Ben3Szkodnik
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_Ben3Szkodnik   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 7;
 	condition   = DIA_NASZ_005_Ben_Ben3Szkodnik_Condition;
 	information = DIA_NASZ_005_Ben_Ben3Szkodnik_Info;
 	permanent   = FALSE;
 	description = "W czym mog� wam pom�c?";
};

FUNC INT DIA_NASZ_005_Ben_Ben3Szkodnik_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_Ben2Escape))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_Ben3Szkodnik_Info()
{
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_00"); //W czym mog� wam pom�c?
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_01"); //Zanim si� zgodzisz, to najpierw mnie wys�uchaj: Nim zaczniemy przygotowywa� si� do dalszych dzia�a�, musimy oczy�ci� kopalni� ze szkodnika, kt�ry mo�e nam zaszkodzi�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_02"); //Do tej pory nie robili�my nic co zwr�ci�oby jego uwag�, lecz jak tylko zaczniemy, to na pewno to zauwa�y.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_03"); //Chodzi o Brysona, obserwowali�my go od d�u�szego czasu i niestety okaza� si� by� fa�szywym, dwulicowym cz�owiekiem.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_04"); //Za dodatkowe porcje jedzenia donosi stra�nikom o wszystkich efektach naszej pracy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_05"); //Musimy si� go pozby�.
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_06"); //Nie mo�emy go przecie� otwarcie zabi�, stra�nicy nam tego nie daruj�. Masz jaki� pomys�, jak to zrobi�?
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_07"); //Upozorujemy jego �mier� tak, aby wygl�da�a jak wypadek podczas pracy. Id� do Daryla, on wprowadzi ci� w szczeg�y.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_08"); //Tymczasem wracam do pracy, bo nasz donosiciel jeszcze nabierze podejrze� i b�dziemy mieli k�opoty.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_09"); //Aby Daryl wyjawi� ci plan, musisz poda� mu has�o: 'Sikorka �piewa o poranku, a skowronek s�ucha jej melodii.'
	
	Log_CreateTopic (TOPIC_Ben_szkodnik, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ben_szkodnik, LOG_RUNNING);
	B_LogEntry (TOPIC_Ben_szkodnik, "�wietnie, musimy pozby� si� Brysona i to w taki spos�b, aby jego �mier� wygl�da�a jak wypadek przy pracy. Ben powiedzia� mi, abym uda� si� do Daryla, kt�ry ma plan, jak to zrobi�. Ciekawe, co wymy�li�?");

};


//*********************************************************************
//	         Ben3Finish
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_Ben3Finish   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 8;
 	condition   = DIA_NASZ_005_Ben_Ben3Finish_Condition;
 	information = DIA_NASZ_005_Ben_Ben3Finish_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_005_Ben_Ben3Finish_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_002_Daryl_BrysonAfterGoAway))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_Ben3Finish_Info()
{

	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Finish_55_00"); //Brawurowa akcja, Marcos by� wr�cz purpurowy ze z�o�ci, kiedy znalaz� w tunelu przygniecione zw�oki Brysona!
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Finish_55_01"); //Gdyby� tylko widzia� twarz tego cz�owieka, na d�ugo zapami�tam ten widok.
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben3Finish_55_02"); //Przez chwil� my�la�em, �e st�pam po swoim grobie. Jedna pomy�ka i wszyscy mogli�my w�cha� kwiatki od spodu.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Finish_55_03"); //Najwa�niejsze, �e wszystko si� uda�o. Teraz czas przyst�pi� do w�a�ciwych dzia�a�.

	Log_SetTopicStatus (TOPIC_Ben_szkodnik, LOG_SUCCESS);
	B_GivePlayerXP(100);
};


var int Ben_MIS_Choice_Metody;
var int Ben_MIS_Choice_Taktyki;
//*********************************************************************
//	         WhatAreUTalkingAbout
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_WhatAreUTalkingAbout   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 9;
 	condition   = DIA_NASZ_005_Ben_WhatAreUTalkingAbout_Condition;
 	information = DIA_NASZ_005_Ben_WhatAreUTalkingAbout_Info;
 	permanent   = FALSE;
 	description = "Masz ju� jaki� pomys� na zorganizowanie ucieczki?";
};

FUNC INT DIA_NASZ_005_Ben_WhatAreUTalkingAbout_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_Ben3Finish))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_WhatAreUTalkingAbout_Info()
{

	AI_Output (other, self,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_00"); //Masz ju� jaki� pomys� na zorganizowanie ucieczki?
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_01"); //Owszem. Nie my�l, �e przez ten ca�y czas pr�nowali�my i nic nie robili�my.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_02"); //Nie b�d� ci� ju� d�u�ej trzyma� w niepewno�ci. Wraz z ch�opakami obmy�lili�my dwa plany ucieczki. Teraz pozostaje nam wybra� jeden z nich. 
	AI_Output (other, self,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_03"); //Przedstawisz mi pokr�tce ka�d� z opcji?
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_04"); //Oczywi�cie. Pierwszy � i moim zdaniem najlepszy wariant � zak�ada stworzenie zwoju z zakl�ciem sen, u�pienie wartownika i opuszczenie szyb�w w trakcie nocy, gdy reszta paladyn�w b�dzie ju� spa�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_05"); //Drugi � bardziej ryzykowny � opiera si� na uwarzeniu trucizny i podaniu jej stra�nikowi, kt�ry pilnuje naszego tunelu. Od razu uprzedz� twe pytanie: Mieszanka ta nie ma na celu jego zabicia.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_06"); //Jak my�lisz, kt�ry plan powinni�my zrealizowa�? 

	Info_ClearChoices (DIA_NASZ_005_Ben_WhatAreUTalkingAbout);
		Info_AddChoice	  (DIA_NASZ_005_Ben_WhatAreUTalkingAbout, "Otrucie stra�nika da nam wi�cej czasu. Musimy zaryzykowa�!", DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna);
		Info_AddChoice	  (DIA_NASZ_005_Ben_WhatAreUTalkingAbout, "Stworzenie zwoju z zakl�ciem wydaje si� rozs�dniejsz� i bezpieczniejsz� opcj�.", DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj);
			
};

FUNC VOID DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna()
{

	AI_Output (other,self ,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna_15_00"); //Otrucie stra�nika da nam wi�cej czasu. Musimy zaryzykowa�!
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna_55_01"); //Oby to ryzyko si� nam op�aci�o, bo w przeciwnym wypadku nie b�dziemy mieli szans na napraw� naszej pomy�ki.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna_55_02"); //Bezsprzecznie stworzenie trucizny b�dzie dla nas najtrudniejszym punktem tego planu. Udaj si� do Daryla, a on wprowadzi ci� w szczeg�y. 
	
	Ben_MIS_Choice_Taktyki = TRUE;
	
	Log_CreateTopic (TOPIC_Ben_taktyki, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ben_taktyki, LOG_RUNNING);
	B_LogEntry (TOPIC_Ben_taktyki, "Po d�u�szym namy�le zasugerowa�em, aby�my stworzyli trucizn�. Wprawdzie jest to niebezpieczny ruch, jednak nie mamy ju� czasu na zwlekanie i u�ywanie p� �rodk�w. Pytanie od kiedy Daryl potrafi tworzy� trucizny?");


	Info_ClearChoices (DIA_NASZ_005_Ben_WhatAreUTalkingAbout);
};

FUNC VOID DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj()
{

	AI_Output (other,self ,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_15_00"); //Stworzenie zwoju z zakl�ciem wydaje si� rozs�dniejsz� i bezpieczniejsz� opcj�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_01"); //Przyjacielu, w zaistnia�ej sytuacji nie ma mniej lub bardziej bezpiecznych wybor�w.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_02"); //W ka�dej sekundzie igramy ze �mierci�, a nasz najmniejszy ruch jest niczym rzut ko�ci� na planszy zwan� �yciem.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_03"); //S� jedynie wybory, kt�re maj� wi�ksze b�d� mniejsze prawdopodobie�stwo powodzenia. 
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_04"); //Przechodz�c do sedna sprawy: Pomys� jak i sama idea stworzenia zwoju wysz�a od Sattara.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_05"); //Tak wi�c powiniene� si� do niego czym pr�dzej uda�. Czas to nasz najwi�kszy wr�g.
	
	Ben_MIS_Choice_Metody = TRUE;
	
	Log_CreateTopic (TOPIC_Ben_metody, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ben_metody, LOG_RUNNING);
	B_LogEntry (TOPIC_Ben_metody, "Pomys� ze zwojem wyda� mi si� zdecydowanie lepszym planem, ani�eli stworzenie trucizny i podanie jej stra�nikowi. Jednak, jest pewna rzecz, jaka nie daje mi spokoju. Mianowicie: Sk�d my we�miemy zakl�cie? W ko�cu jeste�my w kopalni, a wszystkie przedmioty, jakie mieli�my przy sobie, zosta�y nam zarekwirowane jeszcze w zamku kilka tygodni temu... Mo�e Sattar ju� co� wymy�li�?");

	Info_ClearChoices (DIA_NASZ_005_Ben_WhatAreUTalkingAbout);
};



func void LogEntryThrowAway() {
	Log_CreateTopic (TOPIC_Korth_kopalnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Korth_kopalnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Korth_kopalnia, "Dzi�ki pomocy kopaczy mam szans� uciec z kopalni. Nie mog� ich jednak zostawi�. Obieca�em Benowi, �e wr�c� i uwolni� r�wnie� ich.");
};

//*********************************************************************
//	         TaktykiEnd
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_TaktykiEnd   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 9;
 	condition   = DIA_NASZ_005_Ben_TaktykiEnd_Condition;
 	information = DIA_NASZ_005_Ben_TaktykiEnd_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_005_Ben_TaktykiEnd_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_002_Daryl_Taktyki3))
		&& (Npc_IsInState(self, ZS_TALK))
		&& (Npc_GetDistToWP	(NASZ_002_Daryl, "OW_MINE2_04") <=750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_TaktykiEnd_Info()
{
	var C_NPC Ben; Ben = Hlp_GetNpc (NASZ_005_Ben);
	var C_NPC Sattar; Sattar = Hlp_GetNpc (NASZ_020_Sattar);
	TRIA_Invite(Ben);
	TRIA_Invite(Sattar);
    TRIA_Start();
 
	TRIA_Next(Ben);
	AI_Output (other, self,"DIA_NASZ_005_Ben_TaktykiEnd_55_00"); //Przygotowania sko�czone. Mog�e� mnie jednak uprzedzi� o tym, co zamierzacie zrobi�! 
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_01"); //Gdybym powiedzia� ci od razu, prawdopodobnie nie chcia�by� w og�le o tym s�ysze�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_02"); //To jednak ju� nieistotne, wa�ne jest to, i� plan si� zmieni�.
	
	TRIA_Next(Sattar);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_03"); //Wsp�lnie stwierdzili�my, �e ucieczka nas wszystkich jest nierealnym planem i nim si� obejrzymy, stra�nicy nafaszeruj� nas be�tami. 

	TRIA_Next(Ben);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_04"); //Dlatego uznali�my, �e ty, jako najm�odszy z nas wszystkich, b�dziesz mia� najwi�ksze szanse powodzenia w tej misji.
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_05"); //Jeste� zwinny, silny i bystry. Wierz�, �e dasz sobie rad� i uciekniesz z obozu. 

	TRIA_Next(Sattar);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_06"); //Jednak nie zmusimy ci� do tego, sam musisz si� zgodzi� Willu. 
	AI_Output (other, self,"DIA_NASZ_005_Ben_TaktykiEnd_55_07"); //Oczywi�cie, �e si� zgadzam. W ko�cu jeste�my przyjaci�mi! Jednak wiecie, �e nie mam poj�cia, kiedy dam rad� wam pom�c?
	
	TRIA_Next(Ben);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_08"); //To jest nieistotne, wytrzymali�my tyle czasu to i wytrwamy nawet kilka kolejnych tygodni.
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_09"); //Po prostu nie zapomnij o swoich przyjacio�ach i towarzyszach niedoli.  
	AI_Output (other, self,"DIA_NASZ_005_Ben_TaktykiEnd_55_10"); //Obiecuj�, �e wr�c� tutaj z pomoc� i wsparciem. Teraz jednak nie powinni�my traci� czasu, zaczynajmy. 
	
	TRIA_Next(Sattar);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_11"); //Masz racj�, nim jednak wyruszysz zabierz nasze wyposa�enie. Znajdziesz je w dziurze w tunelu, tobie przyda si� zdecydowanie bardziej.
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_12"); //No i jeszcze mikstura. Trzymaj.
	Createinvitems (self, ItNa_TruciznaDaryl, 1);
	B_giveinvitems (self, other, ItNa_TruciznaDaryl, 1);
	AI_Output (other, self,"DIA_NASZ_005_Ben_TaktykiEnd_55_13"); //Dzi�kuj�. Niech Innos nad wami czuwa!
	
	TRIA_Next(Ben);
	TRIA_Finish();
	
	
	WillMaRzucicZaklecieNaStraznika = TRUE;
	LogEntryThrowAway();
	WillWieOSkrytceKopaczy = TRUE;
	AI_StopProcessInfos(self);
	
};

//*********************************************************************
//	         MetodyEnd
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_MetodyEnd   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 9;
 	condition   = DIA_NASZ_005_Ben_MetodyEnd_Condition;
 	information = DIA_NASZ_005_Ben_MetodyEnd_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_005_Ben_MetodyEnd_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_020_Sattar_Metody4))
		&& (Npc_IsInState(self, ZS_TALK))
		&& (Npc_GetDistToWP	(NASZ_020_Sattar, "OW_MINE2_04") <=750)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_MetodyEnd_Info()
{
	var C_NPC Ben; Ben = Hlp_GetNpc (NASZ_005_Ben);
	var C_NPC Daryl; Daryl = Hlp_GetNpc (NASZ_002_Daryl);
	TRIA_Invite(Ben);
	TRIA_Invite(Daryl);
    TRIA_Start();
 
	TRIA_Next(Ben);
	AI_Output (other, self,"DIA_NASZ_005_Ben_MetodyEnd_55_00"); //Przygotowania zosta�y sko�czone. Kiedy podejmujemy ucieczk� z kopalni?
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_01"); //To dobra wiadomo��, lecz sytuacja uleg�a pewnej diametralnej zmianie.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_02"); //Kiedy Sattar pracowa� nad zwojem, a ty spa�e� odby�em d�ug� rozmow� z Darylem. 
	
	TRIA_Next(Daryl);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_03"); //Doszli�my wsp�lnie do wniosku, i� ucieczka nas wszystkich jest abstrakcyjn� wizj�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_04"); //Stra�nicy natychmiast si� obudz�, a my nie b�dziemy mieli nawet cienia szans na wyrwania si� spod ich w�adzy. 

	TRIA_Next(Ben);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_05"); //My wszyscy jeste�my ju� w sile wieku i nie mamy takiej krzepy, jak ty przyjacielu.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_06"); //Dlatego zdecydowali�my aby� to, ty jako najm�odszy z nas, uciek� z kopalni i poszuka� pomocy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_07"); //W odr�nieniu od nas, masz najwi�ksze szanse w wykonaniu tego niebezpiecznego zadania.
	
	TRIA_Next(Daryl);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_08"); //Ponadto by�e� my�liwym za czas�w kolonii karnej, potrafisz si� zwinnie porusza�.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_09"); //Ben wspomina� mi tak�e, �e ca�kiem nie�le radzisz sobie we wspinaczce po g�rach, a to wa�ny atut. 
	AI_Output (other, self,"DIA_NASZ_005_Ben_MetodyEnd_55_10"); //Jeste�cie tego pewni? Nie mog� wam nawet przybli�y� czasu, jaki jest mi potrzebny, aby pom�c si� wam st�d wydosta�! 
	
	TRIA_Next(Ben);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_11"); //To jest nieistotne. Wytrzymali�my tyle czasu to i wytrwamy nawet kilka kolejnych tygodni.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_12"); //Po prostu nie zapomnij o swoich przyjacio�ach i towarzyszach niedoli. 
	AI_Output (other, self,"DIA_NASZ_005_Ben_MetodyEnd_55_13"); //Nie zawiod� was, obiecuj�. Nie tra�my czasu, powinni�my ju� zaczyna�. 
	
	TRIA_Next(Daryl);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_14"); //Zgadzam si�. Zanim jednak wyruszysz w podr�, udaj si� do tunelu i wykop z dziury nasze zaopatrzenie. Tobie przyda si� bardziej.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_15"); //We� zw�j, u�pij stra�nika i zmykaj st�d.
	Createinvitems (self, ItSc_Sleep, 1);
	B_giveinvitems (self, other, ItSc_Sleep, 1);
	AI_Output (other, self,"DIA_NASZ_005_Ben_MetodyEnd_55_16"); //Dzi�kuj�. Niech Innos nad wami czuwa!
	
	TRIA_Next(Ben);
	TRIA_Finish();
	
	LogEntryThrowAway();
	WillWieOSkrytceKopaczy = TRUE;
	AI_StopProcessInfos(self);
	
};








//*********************************************************************
//	         Ben2WhenStart
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_Ben2WhenStart   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 10;
 	condition   = DIA_NASZ_005_Ben_Ben2WhenStart_Condition;
 	information = DIA_NASZ_005_Ben_Ben2WhenStart_Info;
 	permanent   = TRUE;
 	description = "Kiedy zaczynamy?";
};

FUNC INT DIA_NASZ_005_Ben_Ben2WhenStart_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_Ben2Escape))
	&& !(npc_knowsinfo (other, DIA_NASZ_005_Ben_Ben3Finish))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_Ben2WhenStart_Info()
{
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben2WhenStart_15_00"); //Kiedy zaczynamy?
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2WhenStart_15_01"); //Najpierw musimy zako�czy� przygotowania, dopiero wtedy rozpoczniemy.
		
};




//*********************************************************************
//	         Finish
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_Finish   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 3;
 	condition   = DIA_NASZ_005_Ben_Finish_Condition;
 	information = DIA_NASZ_005_Ben_Finish_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_005_Ben_Finish_Condition()	
{
	if (npc_isdead (NASZ_009_Marcos))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_005_Ben_Finish_Info()
{
	AI_Output (self, other,"DIA_NASZ_005_Ben_Finish_15_00"); //Marcos nie �yje... Willu, wr�ci�e�! Powiedz, co si� to wyrabia w tej Kolonii G�rniczej?
	AI_Output (other, self,"DIA_NASZ_005_Ben_Finish_55_01"); //O wszystkim powie wam Keroloth. Udajcie si� do obozu �owc�w ork�w. Jest tam du�o miejsca dla nowych przybyszy.

	if (other.guild == GIL_DJG) {
		AI_Output (other, self,"DIA_NASZ_005_Ben_Finish_55_02"); //�owcy, z kt�rymi przyby�em, was zaprowadz�.
	} else {
		AI_Output (other, self,"DIA_NASZ_005_Ben_Finish_55_03"); //My�liwi, z kt�rymi przyby�em, was zaprowadz�.
	};
	AI_Output (self, other,"DIA_NASZ_005_Ben_Finish_55_04"); //No dobrze, przyjacielu. Dzi�kuj� za ratunek.
	AI_Output (other, self,"DIA_NASZ_005_Ben_Finish_55_05"); //Ty pomog�e� mnie, ja pomog�em tobie.

	KOPACZE_URATOWANI = TRUE;
	
	Npc_ExchangeRoutine (self, "Lowcy");
	Npc_ExchangeRoutine (NASZ_001_Kopacz, "Lowcy");
	Npc_ExchangeRoutine (NASZ_002_Daryl, "Lowcy");
	Npc_ExchangeRoutine (NASZ_020_Sattar, "Lowcy");

	Log_SetTopicStatus (TOPIC_Korth_kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Korth_kopalnia, "Uratowa�em kopaczy.");

	B_GivePlayerXP (400);
	
	if(hero.guild == GIL_DJG) {
		
		Npc_ExchangeRoutine (NASZ_118_Ferros, "Start");
		//self.aivar[AIV_PARTYMEMBER] = FALSE;
		Druzyna (NASZ_118_Ferros,0);
		
		Npc_ExchangeRoutine (NASZ_117_Fed, "Start");
		//self.aivar[AIV_PARTYMEMBER] = FALSE;
		Druzyna (NASZ_117_Fed,0);
		
		Npc_ExchangeRoutine (NASZ_116_Kjorn, "Start");
		//self.aivar[AIV_PARTYMEMBER] = FALSE;
		Druzyna (NASZ_116_Kjorn,0);
		
	}
	else {
	
		Npc_ExchangeRoutine (NASZ_215_Kivo, "Start");
		//self.aivar[AIV_PARTYMEMBER] = FALSE;
		Druzyna (NASZ_215_Kivo,0);
		
		Npc_ExchangeRoutine (NASZ_217_Louis, "Start");
		//self.aivar[AIV_PARTYMEMBER] = FALSE;
		Druzyna (NASZ_217_Louis,0);
		
		Npc_ExchangeRoutine (NASZ_227_Vachut, "Start");
		//self.aivar[AIV_PARTYMEMBER] = FALSE;
		Druzyna (NASZ_227_Vachut,0);
		
	};
};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_005_Ben_HowAreYou   (C_INFO)
{
	npc         = NASZ_005_Ben;
 	nr          = 500;
 	condition   = DIA_NASZ_005_Ben_HowAreYou_Condition;
 	information = DIA_NASZ_005_Ben_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Zm�czony?";
};

FUNC INT DIA_NASZ_005_Ben_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_005_Ben_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_005_Ben_HowAreYou_15_00"); //Zm�czony?

	if !(npc_knowsinfo (other, DIA_NASZ_005_Ben_Finish))	
	{
		AI_Output (self, other,"DIA_NASZ_005_Ben_HowAreYou_55_01"); //R�ce mi ju� odpadaj�.
		AI_Output (self, other,"DIA_NASZ_005_Ben_HowAreYou_55_02"); //Nie mog� sobie pozwoli� nawet na chwil� oddechu, bo nie chc� dosta� be�tem w g�ow�.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_005_Ben_HowAreYou_55_03"); //Musz� doj�� do siebie.
	};


};

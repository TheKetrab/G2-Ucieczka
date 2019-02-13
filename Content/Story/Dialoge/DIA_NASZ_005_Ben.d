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
	AI_Output (other, self,"DIA_NASZ_005_Ben_hi_15_00"); //Wygl¹dasz na strasznie zmartwionego, czy coœ siê sta³o?
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_55_01"); //Mnie na szczêœcie nic, ale nie mogê tego samego powiedzieæ o innych ch³opakach.
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_55_02"); //Na pewno dziœ ich ju¿ mija³eœ, czy nic nie rzuci³o ci siê w oczy?

	Info_ClearChoices (DIA_NASZ_005_Ben_hi);
		Info_AddChoice	  (DIA_NASZ_005_Ben_hi, "Owszem, jednak nie wiem, czy konkretnie to masz na myœli.", DIA_NASZ_005_Ben_hi_yes);
		Info_AddChoice	  (DIA_NASZ_005_Ben_hi, "Nic szczególnego... A dlaczego pytasz?", DIA_NASZ_005_Ben_hi_no);
			
};

FUNC VOID DIA_NASZ_005_Ben_hi_yes()
{

	AI_Output (other,self ,"DIA_NASZ_005_Ben_hi_yes_15_00"); //Owszem, jednak nie wiem, czy konkretnie to masz na myœli.
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_01"); //Mów.
	AI_Output (other, self,"DIA_NASZ_005_Ben_hi_yes_55_02"); //Kiedy chodzi³em po kopalni spostrzeg³em, ¿e wiêkszoœæ z nich ledwie trzyma w d³oniach kilof.
	AI_Output (other, self,"DIA_NASZ_005_Ben_hi_yes_55_03"); //Nie mówi¹c ju¿ o uderzaniu nim w rudê... Ponadto s¹ strasznie wychudzeni i opadaj¹ z si³.
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_04"); //Dok³adnie! Ci nadêci paladyni nie interesuj¹ siê niczym innym, ni¿ t¹ swoj¹ cholern¹ rud¹ i jej wydobyciem!
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_05"); //Jak myœlisz, czy ktokolwiek z nich przejmuje siê naszym losem? Sk¹d! Ka¿dego dnia zmuszaj¹ nas do nieludzkiej pracy ponad nasze si³y, a co otrzymujemy w zamian?
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_06"); //Kawa³ek suchego i twardego jak miêso zêbacza chleba oraz butelkê brudnej wody z rzeki...
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_yes_55_07"); //Willu, je¿eli czegoœ nie zrobimy, to nied³ugo ta kopalnia bêdzie pusta, gdy¿ wszyscy pomrzemy z g³odu... Nawet ja zaczynam odczuwaæ skutki tej kiepskiej diety...
	AI_Output (other,self ,"DIA_NASZ_005_Ben_hi_yes_15_08"); //Nie tylko ty...

	AI_PlayAni(other,"T_FORGETIT"); 

	Info_ClearChoices (DIA_NASZ_005_Ben_hi);
};

FUNC VOID DIA_NASZ_005_Ben_hi_no()
{

	AI_Output (other,self ,"DIA_NASZ_005_Ben_hi_no_15_00"); //Nic szczególnego... A dlaczego pytasz?
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_no_55_01"); //Przyjacielu, jak zawsze jesteœ rozkojarzony. Spójrz tylko na tych biedaków. ¯yj¹ i pracuj¹ resztkami swoich si³.
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_no_55_02"); //Jak myœlisz, jak d³ugo dadz¹ radê tak ci¹gn¹æ, je¿eli za swoj¹ niewolnicz¹ i wrêcz nieludzk¹ pracê otrzymuj¹ marne och³apy jedzenia w postaci suchego, twardego chleba i butelki wody?
	AI_Output (self, other,"DIA_NASZ_005_Ben_hi_no_55_03"); //Musimy coœ zdzia³aæ w tej kwestii, bo nawet i ja zaczynam odczuwaæ skutki g³odówek...
	AI_Output (other,self ,"DIA_NASZ_005_Ben_hi_no_15_04"); //Ja równie¿.

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
 	description = "Masz jakiœ pomys³?";
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
	AI_Output (other,self ,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_15_00"); //Masz jakiœ pomys³?
	AI_PlayAni (self,"R_SCRATCHHEAD");
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_01"); //Mam pewien plan, jednak musisz sam wyraziæ zgodê, albowiem jesteœ jego najwa¿niejszym elementem.
	AI_Output (other, self,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_02"); //Je¿eli dziêki temu planowi bêdê móg³ porz¹dnie zjeœæ, to uwierz mi, ¿e to zrobiê.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_03"); //Determinacja, to w tobie lubiê. S³uchaj, jak dobrze pamiêtam, to ty wraz z Grimesem pokaza³eœ Marcosowi drogê do tej kopalni, zgadza siê?
	AI_Output (other, self,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_04"); //Tak, aczkolwiek teraz ¿a³ujê, i¿ nie da³em nogi przy pierwszej lepszej okazji.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_05"); //Ka¿dy pope³nia b³êdy przyjacielu, ale do rzeczy. Ty, jako jedyny z nas wszystkich, mo¿esz przemówiæ tym rycerzykom do g³owy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_06"); //W koñcu im pomog³eœ, a nawet najwiêkszy dupek z ich zakonu czuje w sobie potrzebê sp³acania d³ugów.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_07"); //PójdŸ do stra¿nika i spróbuj przekonaæ go, aby przemówi³ Marcosowi do rozs¹dku w kwestii naszych racji ¿ywnoœciowych, zgoda?
	AI_Output (other, self,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_08"); //Zobaczê co da siê zrobiæ, ale niczego nie obiecujê. W¹tpiê aby mnie pos³uchali.
	AI_Output (self, other,"DIA_NASZ_005_Ben_HaveYouGotAnIdea_55_09"); //Zawsze warto próbowaæ, pamiêtaj o tym przyjacielu.

	BenPomysl_Fail=1;

	Log_CreateTopic (TOPIC_Ben_pomysl, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ben_pomysl, LOG_RUNNING);
	B_LogEntry (TOPIC_Ben_pomysl, "Sytuacja w kopalni staje siê coraz gorsza. Paladyni od pewnego czasu daj¹ nam coraz mniejsze racje ¿ywnoœciowe, jednoczeœnie wymagaj¹c od nas, abyœmy pracowali z wiêksz¹ intensywnoœci¹. Ben wpad³ na pomys³: Chce, abym uda³ siê do stra¿nika i spróbowa³ go przekonaæ, by ten da³ znaæ Marcosowi, ¿e nied³ugo wszyscy pomrzemy z g³odu. W¹tpiê, ¿e to coœ da, jednak warto próbowaæ. Zastanawiam siê tylko, dlaczego ta ruda jest dla nich, a¿ tak bardzo wa¿na.");

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
 	description = "Rozmawia³em ze stra¿nikiem.";
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
	AI_Output (other,self ,"DIA_NASZ_005_Ben_Ben1_Finish_15_00"); //Rozmawia³em ze stra¿nikiem.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben1_Finish_55_01"); //I co, jak ci posz³o?
	
	if(BenPomysl_Fail==2) {
		AI_Output (other, self,"DIA_NASZ_005_Ben_Ben1_Finish_55_02"); //Ten drañ nawet nie chcia³ mnie wys³uchaæ. Tak jak siê spodziewa³em.
		AI_Output (self, other,"DIA_NASZ_005_Ben_Ben1_Finish_55_03"); //Cholera, to niedobrze. Przynajmniej próbowa³eœ. Ch³opcy i tak s¹ ci wdziêczni za starania.

		B_GivePlayerXP(10);
	}
	else {
		AI_Output (other, self,"DIA_NASZ_005_Ben_Ben1_Finish_55_04"); //Pocz¹tkowo myœla³em, i¿ mi siê nie uda. Jednak pod naporem moich argumentów, ten baran a¿ zaniemówi³ i zgodzi³ siê porozmawiaæ z Marcosem.
		AI_Output (self, other,"DIA_NASZ_005_Ben_Ben1_Finish_55_05"); //To wspania³e wieœci! Ch³opcy i ja jesteœmy ci wdziêczni za pomoc! Mo¿e w koñcu zjemy coœ wiêcej ni¿ chleb i wodê...

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
	AI_Output (other,self ,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_15_01"); //Nie mo¿emy przecie¿ staæ z za³o¿onymi rêkoma, bo wkrótce wszyscy tu pomrzemy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_55_02"); //W zaistnia³ej sytuacji musimy przyspieszyæ realizacjê naszego planu, zdobycie dodatkowych racji ¿ywnoœciowych mia³o nam daæ wystarczaj¹c¹ du¿o czasy do przygotowañ, lecz...
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouNotSuccessed1_55_03"); //Teraz musimy zmieniæ swoj¹ strategiê, bêdzie ciê¿ej ni¿ przypuszcza³em.
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
 	description = "Mogê zrobiæ coœ jeszcze?";
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
	AI_Output (other,self ,"DIA_NASZ_005_Ben_BenIfYouSuccessed1_15_00"); //Mogê zrobiæ coœ jeszcze?
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouSuccessed1_15_01"); //Dobrze, ¿e pytasz, gdy¿ nasta³ chyba najwy¿szy czas, aby wprowadziæ ciê w szczegó³y naszego planu.
	AI_Output (self, other,"DIA_NASZ_005_Ben_BenIfYouSuccessed1_55_02"); //Dziêki temu, ¿e wywalczy³eœ u paladynów wiêksze racje ¿ywnoœciowe, mamy doœæ czasu, aby przygotowaæ plany do ucieczki z kopalni.
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
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2Escape_15_01"); //Na Innosa, przyjacielu, b¹dŸ¿e ciszej! Chyba, ¿e chcesz, aby zaraz przyby³ tutaj stra¿nik, wywlók³ nas z kopalni i powiesi³ przed tunelami w ramach przestrogi dla reszty.
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben2Escape_55_02"); //Czemu nie powiedzia³eœ mi o waszych planach? Myœla³em, ¿e jesteœmy przyjació³mi.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2Escape_15_03"); //Nie miej mi tego za z³e. Chcia³em ci o tym opowiedzieæ, jednak Sattar zaproponowa³, abyœmy zaczekali do chwili, kiedy bêdziemy mieli ju¿ pewnoœæ powodzenia naszych zamiarów.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2Escape_15_04"); //Willu, jesteœ najm³odszy ze wszystkich obecnych tutaj górników. Nikt z nas nie chcia³ ryzykowaæ twoim ¿yciem u pocz¹tku spiskowania, gdy¿ w ka¿dej chwili mogliœmy zostaæ zdemaskowani.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2Escape_15_05"); //A wiesz, co za to grozi, prawda? Œmieræ by³aby wtedy twoim wybawieniem. Od³ó¿my jednak te b³ahostki na bok. Skoro ju¿ wiesz o naszych zamiarach, to mo¿esz nam pomóc.
	
	B_LogEntry (TOPIC_Kopalnia, "Nie przypuszcza³em, ¿e ktoœ poza mn¹ myœli o tym, jak siê st¹d wyrwaæ. Ben przewodzi grupie kopaczy, która ma zamiar podj¹æ siê ucieczki z kopalni. Zaproponowa³ mi udzia³ w ca³ym przedsiêwziêciu. Byæ mo¿e nied³ugo zaznam œwie¿ego powietrza.");
		
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
 	description = "W czym mogê wam pomóc?";
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
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_00"); //W czym mogê wam pomóc?
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_01"); //Zanim siê zgodzisz, to najpierw mnie wys³uchaj: Nim zaczniemy przygotowywaæ siê do dalszych dzia³añ, musimy oczyœciæ kopalniê ze szkodnika, który mo¿e nam zaszkodziæ.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_02"); //Do tej pory nie robiliœmy nic co zwróci³oby jego uwagê, lecz jak tylko zaczniemy, to na pewno to zauwa¿y.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_03"); //Chodzi o Brysona, obserwowaliœmy go od d³u¿szego czasu i niestety okaza³ siê byæ fa³szywym, dwulicowym cz³owiekiem.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_04"); //Za dodatkowe porcje jedzenia donosi stra¿nikom o wszystkich efektach naszej pracy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_05"); //Musimy siê go pozbyæ.
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_06"); //Nie mo¿emy go przecie¿ otwarcie zabiæ, stra¿nicy nam tego nie daruj¹. Masz jakiœ pomys³, jak to zrobiæ?
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_07"); //Upozorujemy jego œmieræ tak, aby wygl¹da³a jak wypadek podczas pracy. IdŸ do Daryla, on wprowadzi ciê w szczegó³y.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_08"); //Tymczasem wracam do pracy, bo nasz donosiciel jeszcze nabierze podejrzeñ i bêdziemy mieli k³opoty.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Szkodnik_15_09"); //Aby Daryl wyjawi³ ci plan, musisz podaæ mu has³o: 'Sikorka œpiewa o poranku, a skowronek s³ucha jej melodii.'
	
	Log_CreateTopic (TOPIC_Ben_szkodnik, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ben_szkodnik, LOG_RUNNING);
	B_LogEntry (TOPIC_Ben_szkodnik, "Œwietnie, musimy pozbyæ siê Brysona i to w taki sposób, aby jego œmieræ wygl¹da³a jak wypadek przy pracy. Ben powiedzia³ mi, abym uda³ siê do Daryla, który ma plan, jak to zrobiæ. Ciekawe, co wymyœli³?");

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

	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Finish_55_00"); //Brawurowa akcja, Marcos by³ wrêcz purpurowy ze z³oœci, kiedy znalaz³ w tunelu przygniecione zw³oki Brysona!
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Finish_55_01"); //Gdybyœ tylko widzia³ twarz tego cz³owieka, na d³ugo zapamiêtam ten widok.
	AI_Output (other, self,"DIA_NASZ_005_Ben_Ben3Finish_55_02"); //Przez chwilê myœla³em, ¿e st¹pam po swoim grobie. Jedna pomy³ka i wszyscy mogliœmy w¹chaæ kwiatki od spodu.
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben3Finish_55_03"); //Najwa¿niejsze, ¿e wszystko siê uda³o. Teraz czas przyst¹piæ do w³aœciwych dzia³añ.

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
 	description = "Masz ju¿ jakiœ pomys³ na zorganizowanie ucieczki?";
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

	AI_Output (other, self,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_00"); //Masz ju¿ jakiœ pomys³ na zorganizowanie ucieczki?
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_01"); //Owszem. Nie myœl, ¿e przez ten ca³y czas pró¿nowaliœmy i nic nie robiliœmy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_02"); //Nie bêdê ciê ju¿ d³u¿ej trzyma³ w niepewnoœci. Wraz z ch³opakami obmyœliliœmy dwa plany ucieczki. Teraz pozostaje nam wybraæ jeden z nich. 
	AI_Output (other, self,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_03"); //Przedstawisz mi pokrótce ka¿d¹ z opcji?
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_04"); //Oczywiœcie. Pierwszy – i moim zdaniem najlepszy wariant – zak³ada stworzenie zwoju z zaklêciem sen, uœpienie wartownika i opuszczenie szybów w trakcie nocy, gdy reszta paladynów bêdzie ju¿ spaæ.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_05"); //Drugi – bardziej ryzykowny – opiera siê na uwarzeniu trucizny i podaniu jej stra¿nikowi, który pilnuje naszego tunelu. Od razu uprzedzê twe pytanie: Mieszanka ta nie ma na celu jego zabicia.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_55_06"); //Jak myœlisz, który plan powinniœmy zrealizowaæ? 

	Info_ClearChoices (DIA_NASZ_005_Ben_WhatAreUTalkingAbout);
		Info_AddChoice	  (DIA_NASZ_005_Ben_WhatAreUTalkingAbout, "Otrucie stra¿nika da nam wiêcej czasu. Musimy zaryzykowaæ!", DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna);
		Info_AddChoice	  (DIA_NASZ_005_Ben_WhatAreUTalkingAbout, "Stworzenie zwoju z zaklêciem wydaje siê rozs¹dniejsz¹ i bezpieczniejsz¹ opcj¹.", DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj);
			
};

FUNC VOID DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna()
{

	AI_Output (other,self ,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna_15_00"); //Otrucie stra¿nika da nam wiêcej czasu. Musimy zaryzykowaæ!
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna_55_01"); //Oby to ryzyko siê nam op³aci³o, bo w przeciwnym wypadku nie bêdziemy mieli szans na naprawê naszej pomy³ki.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_trucizna_55_02"); //Bezsprzecznie stworzenie trucizny bêdzie dla nas najtrudniejszym punktem tego planu. Udaj siê do Daryla, a on wprowadzi ciê w szczegó³y. 
	
	Ben_MIS_Choice_Taktyki = TRUE;
	
	Log_CreateTopic (TOPIC_Ben_taktyki, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ben_taktyki, LOG_RUNNING);
	B_LogEntry (TOPIC_Ben_taktyki, "Po d³u¿szym namyœle zasugerowa³em, abyœmy stworzyli truciznê. Wprawdzie jest to niebezpieczny ruch, jednak nie mamy ju¿ czasu na zwlekanie i u¿ywanie pó³ œrodków. Pytanie od kiedy Daryl potrafi tworzyæ trucizny?");


	Info_ClearChoices (DIA_NASZ_005_Ben_WhatAreUTalkingAbout);
};

FUNC VOID DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj()
{

	AI_Output (other,self ,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_15_00"); //Stworzenie zwoju z zaklêciem wydaje siê rozs¹dniejsz¹ i bezpieczniejsz¹ opcj¹.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_01"); //Przyjacielu, w zaistnia³ej sytuacji nie ma mniej lub bardziej bezpiecznych wyborów.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_02"); //W ka¿dej sekundzie igramy ze œmierci¹, a nasz najmniejszy ruch jest niczym rzut koœci¹ na planszy zwan¹ ¿yciem.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_03"); //S¹ jedynie wybory, które maj¹ wiêksze b¹dŸ mniejsze prawdopodobieñstwo powodzenia. 
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_04"); //Przechodz¹c do sedna sprawy: Pomys³ jak i sama idea stworzenia zwoju wysz³a od Sattara.
	AI_Output (self, other,"DIA_NASZ_005_Ben_WhatAreUTalkingAbout_zwoj_55_05"); //Tak wiêc powinieneœ siê do niego czym prêdzej udaæ. Czas to nasz najwiêkszy wróg.
	
	Ben_MIS_Choice_Metody = TRUE;
	
	Log_CreateTopic (TOPIC_Ben_metody, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ben_metody, LOG_RUNNING);
	B_LogEntry (TOPIC_Ben_metody, "Pomys³ ze zwojem wyda³ mi siê zdecydowanie lepszym planem, ani¿eli stworzenie trucizny i podanie jej stra¿nikowi. Jednak, jest pewna rzecz, jaka nie daje mi spokoju. Mianowicie: Sk¹d my weŸmiemy zaklêcie? W koñcu jesteœmy w kopalni, a wszystkie przedmioty, jakie mieliœmy przy sobie, zosta³y nam zarekwirowane jeszcze w zamku kilka tygodni temu... Mo¿e Sattar ju¿ coœ wymyœli³?");

	Info_ClearChoices (DIA_NASZ_005_Ben_WhatAreUTalkingAbout);
};



func void LogEntryThrowAway() {
	Log_CreateTopic (TOPIC_Korth_kopalnia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Korth_kopalnia, LOG_RUNNING);
	B_LogEntry (TOPIC_Korth_kopalnia, "Dziêki pomocy kopaczy mam szansê uciec z kopalni. Nie mogê ich jednak zostawiæ. Obieca³em Benowi, ¿e wrócê i uwolniê równie¿ ich.");
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
	AI_Output (other, self,"DIA_NASZ_005_Ben_TaktykiEnd_55_00"); //Przygotowania skoñczone. Mog³eœ mnie jednak uprzedziæ o tym, co zamierzacie zrobiæ! 
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_01"); //Gdybym powiedzia³ ci od razu, prawdopodobnie nie chcia³byœ w ogóle o tym s³yszeæ.
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_02"); //To jednak ju¿ nieistotne, wa¿ne jest to, i¿ plan siê zmieni³.
	
	TRIA_Next(Sattar);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_03"); //Wspólnie stwierdziliœmy, ¿e ucieczka nas wszystkich jest nierealnym planem i nim siê obejrzymy, stra¿nicy nafaszeruj¹ nas be³tami. 

	TRIA_Next(Ben);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_04"); //Dlatego uznaliœmy, ¿e ty, jako najm³odszy z nas wszystkich, bêdziesz mia³ najwiêksze szanse powodzenia w tej misji.
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_05"); //Jesteœ zwinny, silny i bystry. Wierzê, ¿e dasz sobie radê i uciekniesz z obozu. 

	TRIA_Next(Sattar);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_06"); //Jednak nie zmusimy ciê do tego, sam musisz siê zgodziæ Willu. 
	AI_Output (other, self,"DIA_NASZ_005_Ben_TaktykiEnd_55_07"); //Oczywiœcie, ¿e siê zgadzam. W koñcu jesteœmy przyjació³mi! Jednak wiecie, ¿e nie mam pojêcia, kiedy dam radê wam pomóc?
	
	TRIA_Next(Ben);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_08"); //To jest nieistotne, wytrzymaliœmy tyle czasu to i wytrwamy nawet kilka kolejnych tygodni.
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_09"); //Po prostu nie zapomnij o swoich przyjacio³ach i towarzyszach niedoli.  
	AI_Output (other, self,"DIA_NASZ_005_Ben_TaktykiEnd_55_10"); //Obiecujê, ¿e wrócê tutaj z pomoc¹ i wsparciem. Teraz jednak nie powinniœmy traciæ czasu, zaczynajmy. 
	
	TRIA_Next(Sattar);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_11"); //Masz racjê, nim jednak wyruszysz zabierz nasze wyposa¿enie. Znajdziesz je w dziurze w tunelu, tobie przyda siê zdecydowanie bardziej.
	AI_Output (self, other,"DIA_NASZ_005_Ben_TaktykiEnd_55_12"); //No i jeszcze mikstura. Trzymaj.
	Createinvitems (self, ItNa_TruciznaDaryl, 1);
	B_giveinvitems (self, other, ItNa_TruciznaDaryl, 1);
	AI_Output (other, self,"DIA_NASZ_005_Ben_TaktykiEnd_55_13"); //Dziêkujê. Niech Innos nad wami czuwa!
	
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
	AI_Output (other, self,"DIA_NASZ_005_Ben_MetodyEnd_55_00"); //Przygotowania zosta³y skoñczone. Kiedy podejmujemy ucieczkê z kopalni?
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_01"); //To dobra wiadomoœæ, lecz sytuacja uleg³a pewnej diametralnej zmianie.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_02"); //Kiedy Sattar pracowa³ nad zwojem, a ty spa³eœ odby³em d³ug¹ rozmowê z Darylem. 
	
	TRIA_Next(Daryl);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_03"); //Doszliœmy wspólnie do wniosku, i¿ ucieczka nas wszystkich jest abstrakcyjn¹ wizj¹.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_04"); //Stra¿nicy natychmiast siê obudz¹, a my nie bêdziemy mieli nawet cienia szans na wyrwania siê spod ich w³adzy. 

	TRIA_Next(Ben);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_05"); //My wszyscy jesteœmy ju¿ w sile wieku i nie mamy takiej krzepy, jak ty przyjacielu.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_06"); //Dlatego zdecydowaliœmy abyœ to, ty jako najm³odszy z nas, uciek³ z kopalni i poszuka³ pomocy.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_07"); //W odró¿nieniu od nas, masz najwiêksze szanse w wykonaniu tego niebezpiecznego zadania.
	
	TRIA_Next(Daryl);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_08"); //Ponadto by³eœ myœliwym za czasów kolonii karnej, potrafisz siê zwinnie poruszaæ.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_09"); //Ben wspomina³ mi tak¿e, ¿e ca³kiem nieŸle radzisz sobie we wspinaczce po górach, a to wa¿ny atut. 
	AI_Output (other, self,"DIA_NASZ_005_Ben_MetodyEnd_55_10"); //Jesteœcie tego pewni? Nie mogê wam nawet przybli¿yæ czasu, jaki jest mi potrzebny, aby pomóc siê wam st¹d wydostaæ! 
	
	TRIA_Next(Ben);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_11"); //To jest nieistotne. Wytrzymaliœmy tyle czasu to i wytrwamy nawet kilka kolejnych tygodni.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_12"); //Po prostu nie zapomnij o swoich przyjacio³ach i towarzyszach niedoli. 
	AI_Output (other, self,"DIA_NASZ_005_Ben_MetodyEnd_55_13"); //Nie zawiodê was, obiecujê. Nie traæmy czasu, powinniœmy ju¿ zaczynaæ. 
	
	TRIA_Next(Daryl);
	AI_TurnToNpc(other, self);
    AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_14"); //Zgadzam siê. Zanim jednak wyruszysz w podró¿, udaj siê do tunelu i wykop z dziury nasze zaopatrzenie. Tobie przyda siê bardziej.
	AI_Output (self, other,"DIA_NASZ_005_Ben_MetodyEnd_55_15"); //WeŸ zwój, uœpij stra¿nika i zmykaj st¹d.
	Createinvitems (self, ItSc_Sleep, 1);
	B_giveinvitems (self, other, ItSc_Sleep, 1);
	AI_Output (other, self,"DIA_NASZ_005_Ben_MetodyEnd_55_16"); //Dziêkujê. Niech Innos nad wami czuwa!
	
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
	AI_Output (self, other,"DIA_NASZ_005_Ben_Ben2WhenStart_15_01"); //Najpierw musimy zakoñczyæ przygotowania, dopiero wtedy rozpoczniemy.
		
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
	AI_Output (self, other,"DIA_NASZ_005_Ben_Finish_15_00"); //Marcos nie ¿yje... Willu, wróci³eœ! Powiedz, co siê to wyrabia w tej Kolonii Górniczej?
	AI_Output (other, self,"DIA_NASZ_005_Ben_Finish_55_01"); //O wszystkim powie wam Keroloth. Udajcie siê do obozu ³owców orków. Jest tam du¿o miejsca dla nowych przybyszy.

	if (other.guild == GIL_DJG) {
		AI_Output (other, self,"DIA_NASZ_005_Ben_Finish_55_02"); //£owcy, z którymi przyby³em, was zaprowadz¹.
	} else {
		AI_Output (other, self,"DIA_NASZ_005_Ben_Finish_55_03"); //Myœliwi, z którymi przyby³em, was zaprowadz¹.
	};
	AI_Output (self, other,"DIA_NASZ_005_Ben_Finish_55_04"); //No dobrze, przyjacielu. Dziêkujê za ratunek.
	AI_Output (other, self,"DIA_NASZ_005_Ben_Finish_55_05"); //Ty pomog³eœ mnie, ja pomog³em tobie.

	KOPACZE_URATOWANI = TRUE;
	
	Npc_ExchangeRoutine (self, "Lowcy");
	Npc_ExchangeRoutine (NASZ_001_Kopacz, "Lowcy");
	Npc_ExchangeRoutine (NASZ_002_Daryl, "Lowcy");
	Npc_ExchangeRoutine (NASZ_020_Sattar, "Lowcy");

	Log_SetTopicStatus (TOPIC_Korth_kopalnia, LOG_SUCCESS);
	B_LogEntry (TOPIC_Korth_kopalnia, "Uratowa³em kopaczy.");

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
 	description = "Zmêczony?";
};

FUNC INT DIA_NASZ_005_Ben_HowAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_005_Ben_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_005_Ben_HowAreYou_15_00"); //Zmêczony?

	if !(npc_knowsinfo (other, DIA_NASZ_005_Ben_Finish))	
	{
		AI_Output (self, other,"DIA_NASZ_005_Ben_HowAreYou_55_01"); //Rêce mi ju¿ odpadaj¹.
		AI_Output (self, other,"DIA_NASZ_005_Ben_HowAreYou_55_02"); //Nie mogê sobie pozwoliæ nawet na chwilê oddechu, bo nie chcê dostaæ be³tem w g³owê.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_005_Ben_HowAreYou_55_03"); //Muszê dojœæ do siebie.
	};


};


//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_020_Sattar_EXIT   (C_INFO)
{
	npc         = NASZ_020_Sattar;
	nr          = 999;
	condition   = DIA_NASZ_020_Sattar_EXIT_Condition;
	information = DIA_NASZ_020_Sattar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_020_Sattar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_020_Sattar_EXIT_Info()
{
	AI_StopProcessInfos (self);

};


//*********************************************************************
//	         HaveYouFinished
//*********************************************************************
INSTANCE DIA_NASZ_020_Sattar_HaveYouFinished   (C_INFO)
{
	npc         = NASZ_020_Sattar;
 	nr          = 2;
 	condition   = DIA_NASZ_020_Sattar_HaveYouFinished_Condition;
 	information = DIA_NASZ_020_Sattar_HaveYouFinished_Info;
 	permanent   = FALSE;
 	description = "Skoñczy³eœ ju¿ pracê nad bry³k¹ rudy?";
};

FUNC INT DIA_NASZ_020_Sattar_HaveYouFinished_Condition()	
{
	// TODO odkomentowac
	//if (npc_knowsinfo(other,DIA_NASZ_002_Daryl_ZamieniamSie))
	//{
		return TRUE;
	//};
};

FUNC VOID DIA_NASZ_020_Sattar_HaveYouFinished_Info()
{
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_HaveYouFinished_15_00"); //Skoñczy³eœ ju¿ pracê nad bry³k¹ rudy?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_01"); //Wiêc przystêpujemy do dzia³ania? Nareszcie, ju¿ myœla³em, ¿e bêdê musia³ targaæ ten cholerny kawa³ek rudy przez ca³e swoje ¿ycie.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_02"); //Kilka razy mia³em ju¿ zamiar siê poddaæ, gdy¿ ruda jest cholernie twarda i ciê¿ko jest j¹ obrabiaæ w takich warunkach.
//(œmieje siê)
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_03"); //Jednak jestem zadowolony z ostatecznego efektu. Zróbcie z niej u¿ytek, bo ja mam jej chwilowo doœæ.
	AI_Output (other, self,"DIA_NASZ_020_Sattar_HaveYouFinished_55_04"); //Wiedzia³em, ¿e potrafisz pos³ugiwaæ siê magi¹, bo by³eœ kiedyœ nowicjuszem, ale nie podejrzewa³em, ¿e potrafisz obrabiaæ kamienie. Gdzie siê tego nauczy³eœ?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_05"); //W czasach mojej m³odoœci du¿o czasu spêdza³em w towarzystwie ojca, który by³ bardzo cenionym jubilerem.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_06"); //To w³aœnie wtedy nauczy³em siê kilku przydatnych sztuczek, które jak widaæ przyda³y mi siê w najmniej spodziewanym miejscu.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_07"); //Kto by pomyœla³, ¿e bêdê obrabia³ kamienie w kopalni bêd¹c niewolnikiem.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_08"); //Nie traæ czasu i idŸ do Daryla, bo ju¿ siê pewnie niecierpliwi.
	
	Createinvitems (self, ItNa_WyszlifowanaRuda, 1);
	B_giveinvitems (self, other, ItNa_WyszlifowanaRuda, 1);
	
	AI_Output (other, self,"DIA_NASZ_020_Sattar_HaveYouFinished_55_09"); //Trzymaj za nas kciuki, przyda siê nam du¿o szczêœcia i opatrznoœæ bogów.
	
	B_LogEntry (TOPIC_Ben_szkodnik, "Od zawsze wiedzia³em, ¿e Sattar skrywa przed nami wiele swoich umiejêtnoœci. Kawa³ek rudy, jaki od niego otrzyma³em, wygl¹da przepiêknie. A¿ trudno mi uwierzyæ, ¿e sam siê tego podj¹³. Miejmy nadziejê, ¿e lœni¹ca barwa kamienia przekona Brysona do wydobycia rudy w zamkniêtym tunelu.");

};

//*********************************************************************
//	         Metody1
//*********************************************************************
INSTANCE DIA_NASZ_020_Sattar_Metody1   (C_INFO)
{
	npc         = NASZ_020_Sattar;
 	nr          = 3;
 	condition   = DIA_NASZ_020_Sattar_Metody1_Condition;
 	information = DIA_NASZ_020_Sattar_Metody1_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_020_Sattar_Metody1_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_005_Ben_WhatAreUTalkingAbout))
	&& (Ben_MIS_Choice_Metody == TRUE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_020_Sattar_Metody1_Info()
{
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_Metody1_15_00"); //Mam nadziejê, ¿e nie jesteœ zajêty lub zbyt zmêczony, bo przychodzê do ciebie w pilnej sprawie.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_01"); //Domyœlam siê, ¿e przysy³a ciê Ben? Najwy¿szy czas!
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_02"); //Najlepiej bêdzie jak od razu zabierzemy siê do pracy, gdy¿ bêdê potrzebowa³ potem nieco czasu, aby stworzyæ magiczn¹ formu³ê zaklêcia.
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_03"); //Nie zrozum mnie Ÿle, nie w¹tpiê w twe umiejêtnoœci magiczne, ale... Mo¿esz mi wyt³umaczyæ, jak chcesz stworzyæ zwój od podstaw?
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_04"); //Nie wiem zbyt wiele o ca³ym procesie zaklinania formu³ w zwojach. Znam jedynie kilka faktów, jakie zas³ysza³em bêd¹c pos³añcem Magów Ognia jeszcze w czasach kolonii karnej.
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_05"); //Wynika z nich, ¿e aby stworzyæ konkretny zwój trzeba znaæ nie tylko formu³ê, ale równie¿ posiadaæ odpowiednie sk³adniki.
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_06"); //Nie znajdziemy ich raczej w kopalni, a i stra¿nik nam ich raczej nie da...
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_07"); //Aby wykonaæ zaklêcie bêdzie mi potrzebny jedynie pergamin, który mia³em przy sobie w chwili kiedy mnie tu uwiêzili.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_08"); //Na szczêœcie nie s¹ zbyt bystrzy i nie spostrzegli, i¿ mam go ze sob¹. Kto by pomyœla³, ¿e trzymanie pergaminów w sakwie siê op³aci?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_09"); //Je¿eli zaœ chodzi o resztê sk³adników... Dla kogoœ, kto nie ma zbyt du¿o wspólnego z t¹ sztuk¹, mo¿e wydawaæ siê to barier¹ nie do przeskoczenia.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_10"); //Musisz jednak wiedzieæ, ¿e tworzenie magicznych zwojów przypomina w pewnym stopniu sztukê alchemii, a konkretnie wyrób mikstur.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_11"); //Przy odpowiednich umiejêtnoœciach i wiedzy mo¿esz uwarzyæ mikstury przy wykorzystaniu substratów zastêpczych.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_12"); //Wystarczy wtedy znaæ w³aœciwoœci roœlin i to, jak reaguj¹ z danymi sk³adnikami, a nastêpnie zmieszaæ wszystko w odpowiednich proporcjach.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_13"); //To samo mo¿na wykorzystaæ w procesie tworzenia zwojów.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_14"); //W formu³ê jak¹ zapiszesz na pergaminie, mo¿esz tchn¹æ energiê przedmiotów, które do niej nie pasuj¹ licz¹c siê z tym, ¿e taki czar bêdzie o wiele s³abszy. 
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_15"); //To z³o¿ony proces, który w klasztorze, z jakiego pochodzê, nazywany by³ 'manipulacj¹ energi'. 
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_16"); //Brzmi ryzykownie. Kiedy mo¿emy zacz¹æ?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_17"); //W³aœciwie ju¿ teraz. Jednak po raz kolejny bêdê potrzebowa³ twojej pomocy.

};

//*********************************************************************
//	         Metody2
//*********************************************************************
INSTANCE DIA_NASZ_020_Sattar_Metody2   (C_INFO)
{
	npc         = NASZ_020_Sattar;
 	nr          = 4;
 	condition   = DIA_NASZ_020_Sattar_Metody2_Condition;
 	information = DIA_NASZ_020_Sattar_Metody2_Info;
 	permanent   = FALSE;
 	description = "Jasne, powiedz tylko, co mam zrobiæ.";
};

FUNC INT DIA_NASZ_020_Sattar_Metody2_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_020_Sattar_Metody1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_020_Sattar_Metody2_Info()
{
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_Metody2_15_00"); //Jasne, powiedz tylko, co mam zrobiæ.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody2_55_01"); //Do stworzenia zaklêcia potrzebujê dwóch kryszta³ów, które znajduj¹ siê w kopalni.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody2_55_02"); //Wydoby³bym je sam, ale marny ze mnie górnik. Ledwo potrafiê kopaæ rudê, a takie kryszta³y to nawet coœ trudniejszego. Móg³byœ je dla mnie wydobyæ?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody2_55_03"); //Najlepiej wykop tyle, ile zdo³asz. Wybiorê wtedy dwa najwiêksze i przyst¹piê do dzia³ania. 
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody2_55_04"); //Zabieram siê do roboty.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody2_55_05"); //Œwietnie! Bêdê czeka³ w tunelu z ³ó¿kiem, rozpocznê ju¿ przygotowania. 

	B_LogEntry (TOPIC_Ben_Metody, "Ten cz³owiek nigdy nie przestanie mnie zaskakiwaæ. Czasami mam wra¿enie, ¿e w przesz³oœci wcale nie by³ zwyk³ym nowicjuszem. Mo¿e to mag-renegat, który teraz stara siê odkupiæ swoje winy? Kiedy sytuacja siê ju¿ uspokoi i uda siê nam uciec, bêdê musia³ siê go o to wszystko wypytaæ. W tej chwili muszê wydobyæ kilka kryszta³ów. Hmm... To nie powinno byæ trudne zadanie. ");
	Npc_ExchangeRoutine (self, "Metody");
	Npc_ExchangeRoutine (NASZ_002_Daryl, "Metody");
};

//*********************************************************************
//	         Metody3
//*********************************************************************
INSTANCE DIA_NASZ_020_Sattar_Metody3   (C_INFO)
{
	npc         = NASZ_020_Sattar;
 	nr          = 5;
 	condition   = DIA_NASZ_020_Sattar_Metody3_Condition;
 	information = DIA_NASZ_020_Sattar_Metody3_Info;
 	permanent   = FALSE;
 	description = "Przynios³em to, o co prosi³eœ.";
};

FUNC INT DIA_NASZ_020_Sattar_Metody3_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_020_Sattar_Metody2))
	&& (npc_hasitems (other, ItNa_Krysztal) >=2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_020_Sattar_Metody3_Info()
{
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_Metody3_15_00"); //Przynios³em to, o co prosi³eœ.
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_Metody3_15_01"); //Jak myœlisz, któryœ z nich siê nada? 
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody3_15_02"); //Oczywiœcie, te dwa bêd¹ odpowiednie.
	B_giveinvitems (other, self, ItNa_Krysztal, 2);
	Npc_RemoveInvItems (self, ItNa_Krysztal, 2); 
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody3_15_03"); //Mam ju¿ wszystko, aby przyst¹piæ do dzia³ania. Ty natomiast powinieneœ siê nieco przespaæ. 
	
	
	if ((Wld_IsTime(23,30,00,00)) || (Wld_IsTime(00,00,01,00))) {
		AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody3_15_04"); //Myœlê, ¿e uda mi siê to skoñczyæ w godzinê. 
		B_LogEntry (TOPIC_Ben_Metody, "Sattar wydawa³ siê byæ zachwycony kryszta³ami jakie mu dostarczy³em. W chwili kiedy on zajmuje siê tworzeniem zwoju ja powinienem siê przespaæ, wrócê do niego za godzinê.");
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody3_15_05"); //Myœlê, ¿e uda mi siê to skoñczyæ do pó³nocy. 
		B_LogEntry (TOPIC_Ben_Metody, "Sattar wydawa³ siê byæ zachwycony kryszta³ami jakie mu dostarczy³em. W chwili kiedy on zajmuje siê tworzeniem zwoju ja powinienem siê przespaæ, wrócê do niego o pó³nocy.");
	};
	
	KopalniaWillMaSiePrzespac = TRUE;
};

//*********************************************************************
//	         Metody4
//*********************************************************************
INSTANCE DIA_NASZ_020_Sattar_Metody4   (C_INFO)
{
	npc         = NASZ_020_Sattar;
 	nr          = 5;
 	condition   = DIA_NASZ_020_Sattar_Metody4_Condition;
 	information = DIA_NASZ_020_Sattar_Metody4_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_020_Sattar_Metody4_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_020_Sattar_Metody3))
	&& ((Wld_IsTime(23,00,00,00)) || (Wld_IsTime(00,00,02,30)))
	&& (KopalniaWillSiePrzespal == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_020_Sattar_Metody4_Info()
{
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody4_15_00"); //Nie przypuszcza³em, ¿e to bêdzie tak trudne, ale ostatecznie uda³o mi siê. Zwój jest gotowy do u¿ycia.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody4_55_01"); //Powinniœmy wróciæ do reszty i powiedzieæ im, ¿e przygotowania dobieg³y koñca.
	
	B_StartOtherRoutine (NASZ_002_Daryl, "GoToBen");
	Npc_ExchangeRoutine (self, "GoToBen");
	
	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_020_Sattar_PICKPOCKET (C_INFO)
{
	npc			= NASZ_020_Sattar;
	nr			= 900;
	condition	= DIA_NASZ_020_Sattar_PICKPOCKET_Condition;
	information	= DIA_NASZ_020_Sattar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_020_Sattar_PICKPOCKET_Condition()
{
	C_Beklauen (23);
};
 
FUNC VOID DIA_NASZ_020_Sattar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_020_Sattar_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_020_Sattar_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_020_Sattar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_020_Sattar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_020_Sattar_PICKPOCKET_DoIt);
};

func void DIA_NASZ_020_Sattar_PICKPOCKET_DoIt()
{
	B_BeklauenThings (ItPo_Health_01, 1);
	Info_ClearChoices (DIA_NASZ_020_Sattar_PICKPOCKET);
};
	
func void DIA_NASZ_020_Sattar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_020_Sattar_PICKPOCKET);
};

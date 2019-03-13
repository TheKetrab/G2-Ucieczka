
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
 	description = "Sko�czy�e� ju� prac� nad bry�k� rudy?";
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
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_HaveYouFinished_15_00"); //Sko�czy�e� ju� prac� nad bry�k� rudy?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_01"); //Wi�c przyst�pujemy do dzia�ania? Nareszcie, ju� my�la�em, �e b�d� musia� targa� ten cholerny kawa�ek rudy przez ca�e swoje �ycie.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_02"); //Kilka razy mia�em ju� zamiar si� podda�, gdy� ruda jest cholernie twarda i ci�ko jest j� obrabia� w takich warunkach.
//(�mieje si�)
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_03"); //Jednak jestem zadowolony z ostatecznego efektu. Zr�bcie z niej u�ytek, bo ja mam jej chwilowo do��.
	AI_Output (other, self,"DIA_NASZ_020_Sattar_HaveYouFinished_55_04"); //Wiedzia�em, �e potrafisz pos�ugiwa� si� magi�, bo by�e� kiedy� nowicjuszem, ale nie podejrzewa�em, �e potrafisz obrabia� kamienie. Gdzie si� tego nauczy�e�?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_05"); //W czasach mojej m�odo�ci du�o czasu sp�dza�em w towarzystwie ojca, kt�ry by� bardzo cenionym jubilerem.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_06"); //To w�a�nie wtedy nauczy�em si� kilku przydatnych sztuczek, kt�re jak wida� przyda�y mi si� w najmniej spodziewanym miejscu.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_07"); //Kto by pomy�la�, �e b�d� obrabia� kamienie w kopalni b�d�c niewolnikiem.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_HaveYouFinished_55_08"); //Nie tra� czasu i id� do Daryla, bo ju� si� pewnie niecierpliwi.
	
	Createinvitems (self, ItNa_WyszlifowanaRuda, 1);
	B_giveinvitems (self, other, ItNa_WyszlifowanaRuda, 1);
	
	AI_Output (other, self,"DIA_NASZ_020_Sattar_HaveYouFinished_55_09"); //Trzymaj za nas kciuki, przyda si� nam du�o szcz�cia i opatrzno�� bog�w.
	
	B_LogEntry (TOPIC_Ben_szkodnik, "Od zawsze wiedzia�em, �e Sattar skrywa przed nami wiele swoich umiej�tno�ci. Kawa�ek rudy, jaki od niego otrzyma�em, wygl�da przepi�knie. A� trudno mi uwierzy�, �e sam si� tego podj��. Miejmy nadziej�, �e l�ni�ca barwa kamienia przekona Brysona do wydobycia rudy w zamkni�tym tunelu.");

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
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_Metody1_15_00"); //Mam nadziej�, �e nie jeste� zaj�ty lub zbyt zm�czony, bo przychodz� do ciebie w pilnej sprawie.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_01"); //Domy�lam si�, �e przysy�a ci� Ben? Najwy�szy czas!
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_02"); //Najlepiej b�dzie jak od razu zabierzemy si� do pracy, gdy� b�d� potrzebowa� potem nieco czasu, aby stworzy� magiczn� formu�� zakl�cia.
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_03"); //Nie zrozum mnie �le, nie w�tpi� w twe umiej�tno�ci magiczne, ale... Mo�esz mi wyt�umaczy�, jak chcesz stworzy� zw�j od podstaw?
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_04"); //Nie wiem zbyt wiele o ca�ym procesie zaklinania formu� w zwojach. Znam jedynie kilka fakt�w, jakie zas�ysza�em b�d�c pos�a�cem Mag�w Ognia jeszcze w czasach kolonii karnej.
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_05"); //Wynika z nich, �e aby stworzy� konkretny zw�j trzeba zna� nie tylko formu��, ale r�wnie� posiada� odpowiednie sk�adniki.
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_06"); //Nie znajdziemy ich raczej w kopalni, a i stra�nik nam ich raczej nie da...
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_07"); //Aby wykona� zakl�cie b�dzie mi potrzebny jedynie pergamin, kt�ry mia�em przy sobie w chwili kiedy mnie tu uwi�zili.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_08"); //Na szcz�cie nie s� zbyt bystrzy i nie spostrzegli, i� mam go ze sob�. Kto by pomy�la�, �e trzymanie pergamin�w w sakwie si� op�aci?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_09"); //Je�eli za� chodzi o reszt� sk�adnik�w... Dla kogo�, kto nie ma zbyt du�o wsp�lnego z t� sztuk�, mo�e wydawa� si� to barier� nie do przeskoczenia.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_10"); //Musisz jednak wiedzie�, �e tworzenie magicznych zwoj�w przypomina w pewnym stopniu sztuk� alchemii, a konkretnie wyr�b mikstur.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_11"); //Przy odpowiednich umiej�tno�ciach i wiedzy mo�esz uwarzy� mikstury przy wykorzystaniu substrat�w zast�pczych.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_12"); //Wystarczy wtedy zna� w�a�ciwo�ci ro�lin i to, jak reaguj� z danymi sk�adnikami, a nast�pnie zmiesza� wszystko w odpowiednich proporcjach.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_13"); //To samo mo�na wykorzysta� w procesie tworzenia zwoj�w.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_14"); //W formu�� jak� zapiszesz na pergaminie, mo�esz tchn�� energi� przedmiot�w, kt�re do niej nie pasuj� licz�c si� z tym, �e taki czar b�dzie o wiele s�abszy. 
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_15"); //To z�o�ony proces, kt�ry w klasztorze, z jakiego pochodz�, nazywany by� 'manipulacj� energi'. 
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody1_55_16"); //Brzmi ryzykownie. Kiedy mo�emy zacz��?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody1_55_17"); //W�a�ciwie ju� teraz. Jednak po raz kolejny b�d� potrzebowa� twojej pomocy.

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
 	description = "Jasne, powiedz tylko, co mam zrobi�.";
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
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_Metody2_15_00"); //Jasne, powiedz tylko, co mam zrobi�.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody2_55_01"); //Do stworzenia zakl�cia potrzebuj� dw�ch kryszta��w, kt�re znajduj� si� w kopalni.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody2_55_02"); //Wydoby�bym je sam, ale marny ze mnie g�rnik. Ledwo potrafi� kopa� rud�, a takie kryszta�y to nawet co� trudniejszego. M�g�by� je dla mnie wydoby�?
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody2_55_03"); //Najlepiej wykop tyle, ile zdo�asz. Wybior� wtedy dwa najwi�ksze i przyst�pi� do dzia�ania. 
	AI_Output (other, self,"DIA_NASZ_020_Sattar_Metody2_55_04"); //Zabieram si� do roboty.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody2_55_05"); //�wietnie! B�d� czeka� w tunelu z ��kiem, rozpoczn� ju� przygotowania. 

	B_LogEntry (TOPIC_Ben_Metody, "Ten cz�owiek nigdy nie przestanie mnie zaskakiwa�. Czasami mam wra�enie, �e w przesz�o�ci wcale nie by� zwyk�ym nowicjuszem. Mo�e to mag-renegat, kt�ry teraz stara si� odkupi� swoje winy? Kiedy sytuacja si� ju� uspokoi i uda si� nam uciec, b�d� musia� si� go o to wszystko wypyta�. W tej chwili musz� wydoby� kilka kryszta��w. Hmm... To nie powinno by� trudne zadanie. ");
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
 	description = "Przynios�em to, o co prosi�e�.";
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
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_Metody3_15_00"); //Przynios�em to, o co prosi�e�.
	AI_Output (other,self ,"DIA_NASZ_020_Sattar_Metody3_15_01"); //Jak my�lisz, kt�ry� z nich si� nada? 
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody3_15_02"); //Oczywi�cie, te dwa b�d� odpowiednie.
	B_giveinvitems (other, self, ItNa_Krysztal, 2);
	Npc_RemoveInvItems (self, ItNa_Krysztal, 2); 
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody3_15_03"); //Mam ju� wszystko, aby przyst�pi� do dzia�ania. Ty natomiast powiniene� si� nieco przespa�. 
	
	
	if ((Wld_IsTime(23,30,00,00)) || (Wld_IsTime(00,00,01,00))) {
		AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody3_15_04"); //My�l�, �e uda mi si� to sko�czy� w godzin�. 
		B_LogEntry (TOPIC_Ben_Metody, "Sattar wydawa� si� by� zachwycony kryszta�ami jakie mu dostarczy�em. W chwili kiedy on zajmuje si� tworzeniem zwoju ja powinienem si� przespa�, wr�c� do niego za godzin�.");
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody3_15_05"); //My�l�, �e uda mi si� to sko�czy� do p�nocy. 
		B_LogEntry (TOPIC_Ben_Metody, "Sattar wydawa� si� by� zachwycony kryszta�ami jakie mu dostarczy�em. W chwili kiedy on zajmuje si� tworzeniem zwoju ja powinienem si� przespa�, wr�c� do niego o p�nocy.");
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
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody4_15_00"); //Nie przypuszcza�em, �e to b�dzie tak trudne, ale ostatecznie uda�o mi si�. Zw�j jest gotowy do u�ycia.
	AI_Output (self, other,"DIA_NASZ_020_Sattar_Metody4_55_01"); //Powinni�my wr�ci� do reszty i powiedzie� im, �e przygotowania dobieg�y ko�ca.
	
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

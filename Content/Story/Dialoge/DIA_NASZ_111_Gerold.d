//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_EXIT   (C_INFO)
{
	npc         = NASZ_111_Gerold;
	nr          = 999;
	condition   = DIA_NASZ_111_Gerold_EXIT_Condition;
	information = DIA_NASZ_111_Gerold_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_111_Gerold_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_111_Gerold_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_siema   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 1;
 	condition   = DIA_NASZ_111_Gerold_siema_Condition;
 	information = DIA_NASZ_111_Gerold_siema_Info;
 	permanent   = FALSE;
 	description = "Czemu tutaj tak siedzisz?";
};

FUNC INT DIA_NASZ_111_Gerold_siema_Condition()
{
	if (KAPITEL == 1) && (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_siema_15_00"); //Czemu tutaj tak siedzisz?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_siema_55_01"); //Mo�na by powiedzie�, �e... nudz� si�.
		
};

//*********************************************************************
//	Info Nuda
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_nuda   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 2;
 	condition   = DIA_NASZ_111_Gerold_nuda_Condition;
 	information = DIA_NASZ_111_Gerold_nuda_Info;
 	permanent   = FALSE;
 	description = "Nudzisz si�? W obozie jest przecie� du�o pracy.";
};

FUNC INT DIA_NASZ_111_Gerold_nuda_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_nuda_Info()
{
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_nuda_15_00"); //Nudzisz si�? W obozie jest przecie� du�o pracy.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_01"); //Mo�e to dziwnie zabrzmi, ale jestem przyzwyczajony do pilnowania drzwi, bram i innych.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_02"); //To dopiero nudne, prawda?
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_nuda_15_03"); //Wi�c czemu nie strze�esz kt�rej� z bram?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_04"); //C�, Keroloth jest naszym przyw�dc�, a tak si� jako� z�o�y�o, �e ten cz�owiek nigdy mnie nie lubi�.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_05"); //Teraz nie chce, bym ja pilnowa� bram. W sumie mu si� troch� nie dziwi�. Jeszcze w zamku dosz�o do 'incydentu': Um�wi�em si� z pewnym go�ciem, by przekaza� mi troch� �arcia w kaplicy.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_06"); //Opu�ci�em w nocy swoje stanowisko i w�a�nie w tamtym momencie do wi�zienia wgramoli�y si� olbrzymie szczury. Wi�niowie wrzeszczeli, a Keroloth pobieg� tam, by zrobi� porz�dek z gryzoniami.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_07"); //Srogo mnie ochrzani�, ale przyrzek�em, �e ju� nigdy nie odejd� od miejsca, kt�rego pilnuj�.
};

//*********************************************************************
//	Info Ktora
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_ktora   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 3;
 	condition   = DIA_NASZ_111_Gerold_ktora_Condition;
 	information = DIA_NASZ_111_Gerold_ktora_Info;
 	permanent   = FALSE;
 	description = "Czemu nie staniesz na warcie bez wiedzy Kerolotha?";
};

FUNC INT DIA_NASZ_111_Gerold_ktora_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_nuda))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_ktora_Info()
{
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_ktora_15_00"); //Czemu nie staniesz na warcie bez wiedzy Kerolotha?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_ktora_55_01"); //Bo nie mia�bym poczucia obowi�zku i nie wysta�bym tylu godzin na nogach.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_ktora_55_02"); //Nie�atwo jest si� zmusi� do pracy, je�li nie ma si� poparcia ze strony dow�dcy.
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_ktora_15_03"); //No dobrze, kt�r� bram� chcia�by� pilnowa�?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_ktora_55_04"); //Oboj�tne. Chocia� najlepiej t�, z kt�rej mo�emy spodziewa� si� najwi�kszego zagro�enia.

};

//*********************************************************************
//	         Keroloth
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_keroloth   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 4;
 	condition   = DIA_NASZ_111_Gerold_keroloth_Condition;
 	information = DIA_NASZ_111_Gerold_keroloth_Info;
 	permanent   = FALSE;
 	description = "Porozmawiam o tym z Kerolothem.";
};

FUNC INT DIA_NASZ_111_Gerold_keroloth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_nuda))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_keroloth_Info()
{
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_keroloth_15_00"); //Porozmawiam o tym z Kerolothem.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_keroloth_55_01"); //Jeste� pierwsz� osob�, kt�ra uda si� do niego w moim imieniu.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_keroloth_55_02"); //Ciesz� si�, �e chcesz mi pom�c. Jednak w�tpi�, �e co� z tego b�dzie. Keroloth naprawd� �ywi do mnie uraz.

	MIS_GEROLD_READY = TRUE;

	Log_CreateTopic (TOPIC_Gerold_Keroloth, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gerold_Keroloth, LOG_RUNNING);
	B_LogEntry (TOPIC_Gerold_Keroloth, "Gerold pr�nuje, chocia� chce pilnowa� kt�rej� z bram. Problemem jest Keroloth, kt�ry nie zgadza si� na to.");

};

var int GeroldPytalesOZloto;
//*********************************************************************
//	         500szt
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_500szt   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 4;
 	condition   = DIA_NASZ_111_Gerold_500szt_Condition;
 	information = DIA_NASZ_111_Gerold_500szt_Info;
 	permanent   = FALSE;
 	description = "Keroloth ��da 500 sztuk z�ota.";
};

FUNC INT DIA_NASZ_111_Gerold_500szt_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_nuda)) && (gerold_wybor == 1) && (MIS_GEROLD_READY == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_500szt_Info()
{
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_00"); //Keroloth ��da 500 sztuk z�ota.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_01"); //Ca�kiem sporo sobie liczy. Dam ci wszystko, co mam. Mam nadziej�, �e si� przyda.
	Createinvitems (self, itmi_gold, 170);
	B_giveinvitems (self, other, itmi_gold, 170);
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_02"); //Przyda, ale co z tego? To nie jest nawet po�owa potrzebnej sumy. Sk�d mam wzi�� reszt� z�ota?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_03"); //Nie mam wi�cej przy sobie. Musz� sobie zostawi� troch� na czarn� godzin�.
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_04"); //A wi�c przyznajesz, �e masz jeszcze jakie� oszcz�dno�ci. S�uchaj: Wolisz si� nudzi�, czy robi� co� po�ytecznego?
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_05"); //Mimo moich szczerych ch�ci, nie jestem w stanie ci pom�c, bo nie jestem obrzydliwie bogaty jak kr�l. Je�li masz gdzie� jeszcze pieni�dze, to powiniene� si�gn�� do kieszeni i je wykorzysta�.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_06"); //Nie mam ich przy sobie, ju� m�wi�em. Ukry�em troch� z�ota w dw�ch miejscach w okolicy obozu. Mam nadziej�, �e nikt tam jeszcze nie zagl�da�...
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_07"); //Jedna sakiewka jest zakopana za aren� mi�dzy drzewami. Z drug� te� nie powiniene� mie� problemu.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_08"); //Wejd� na cmentarz przez karczm� i szukaj skrzy�owanych patyk�w po prawej stronie od grobu Garonda.
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_09"); //Czemu sam si� nie pofatygujesz i nie p�jdziesz tego wykopa�?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_10"); //Eee... Powiedzmy, �e mam pewne sprawy do za�atwienia.	
	
	B_LogEntry (TOPIC_Gerold_Keroloth, "Gerold da� mi troch� z�ota i powiedzia�, gdzie mog� znale�� wi�cej. Musz� poszuka� skrzy�owanych patyk�w za aren� mi�dzy dwoma drzewami i na cmentarzu, na prawo od grobu Garonda. Stra�nik zapewne wys�a� mnie, �eby samemu uda� si� do swoich innych skrytek i zabra� stamt�d z�oto... No c�, mam nadziej�, �e z�ota wystarczy.");
	WillWieOSkrytceGerolda = TRUE;
	
	GeroldPytalesOZloto = TRUE;
};

//*********************************************************************
//	         Done
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_done   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 5;
 	condition   = DIA_NASZ_111_Gerold_done_Condition;
 	information = DIA_NASZ_111_Gerold_done_Info;
 	permanent   = FALSE;
 	description = "Za�atwione.";
};

FUNC INT DIA_NASZ_111_Gerold_done_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_gerold)
		&& gerold_wybor==2) && (MIS_GEROLD_READY == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_done_Info()
{
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_done_15_00"); //Za�atwione.
	
	if (GeroldPytalesOZloto == FALSE)
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_01"); //Naprawd�? Niemo�liwe! Jak tego dokona�e�?
		AI_Output (other,self ,"DIA_NASZ_111_Gerold_done_15_02"); //Musia�em poszpera� w torbie i wyj�� troch� z�otych monet.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_03"); //Ehh... Nie mam zbyt wiele. Mog� ci da� tylko 200 sztuk z�ota.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_04"); //Trzymaj.

		Createinvitems (self, itmi_gold, 200);
		B_giveinvitems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_05"); //A wi�c zebra�e� t� poka�n� sum�.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_06"); //Sprzeda�em Johny'emu jakie� rupiecie, wi�c do�o�� ci jeszcze par� sztuk z�ota.

		Createinvitems (self, itmi_gold, 30);
		B_giveinvitems (self, other, itmi_gold, 30);
	};

	AI_Output (other,self ,"DIA_NASZ_111_Gerold_done_15_07"); //Dzi�ki. Masz pilnowa� wej�cia od strony cmentarza.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_08"); //No, no! Po nocach b�dzie straszy�.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_09"); //W takim razie ruszam na wart�!

	
	Npc_ExchangeRoutine (self, "Cmentarz");
	MIS_GEROLD_READY = FALSE;
	DodajReputacje (3, REP_LOWCY);
	B_LogEntry (TOPIC_Gerold_Keroloth, "Gerold ucieszy� si�, gdy powiedzia�em mu, �e ma pilnowa� wej�cia od strony cmentarza.");
	Log_SetTopicStatus (TOPIC_Gerold_Keroloth, LOG_SUCCESS);
	B_GivePlayerXP (300);

};

//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_goth   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 6;
 	condition   = DIA_NASZ_111_Gerold_goth_Condition;
 	information = DIA_NASZ_111_Gerold_goth_Info;
 	permanent   = FALSE;
	description = "Czy wiesz co� o sporach pomi�dzy my�liwymi i �owcami?";
};

FUNC INT DIA_NASZ_111_Gerold_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_111_Gerold_goth_15_00"); //Czy wiesz co� o sporach pomi�dzy my�liwymi i �owcami?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_goth_55_01"); //Kilka dni temu kto� okrad� my�liwych.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_goth_55_02"); //Niby wina spad�a na nas, �owc�w, ale ja my�l�, �e to sprawka kogo� z my�liwych, komu zale�y na zwadzie pomi�dzy naszymi obozami.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_goth_15_03"); //Tylko czemu mia�oby to s�u�y�?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_goth_55_04"); //Nie mam poj�cia. Jestem tutaj bezpieczny i nie obchodz� mnie potyczki mi�dzy naszymi obozami.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_goth_55_05"); //To nie m�j problem.

	B_LogEntry (TOPIC_Goth_kradziez, "Gerold zwr�ci� uwag� na fakt, �e sprawc� niekoniecznie musi by� �owca ork�w. Ma racj�. Nie warto ogranicza� horyzont�w poszukiwa�.");

};

//*********************************************************************
//	         Cmentarz
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_cmentarz   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 11;
 	condition   = DIA_NASZ_111_Gerold_cmentarz_Condition;
 	information = DIA_NASZ_111_Gerold_cmentarz_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_111_Gerold_cmentarz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_duchy))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_cmentarz_Info()
{

	if (npc_knowsinfo(other,DIA_NASZ_111_Gerold_500szt)) // wziales zloto
	&& (!npc_knowsinfo(other,DIA_NASZ_111_Gerold_done)) // ale nie skonczyles zadania
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_00"); //Jeste�, cholerna �winio! Zabra�e� ode mnie z�oto i zwia�e� z nim, nie za�atwiwszy sprawy z Kerolothem.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_01"); //I pewnie nawet nie zamierza�e� z nim pogada�, co? Za�atwi�em to sam i pilnuj� cmentarza. Nie b�d� t�pi� miecza na tak� szumowin� jak ty.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_02"); //Przeklinam ci� i �ycz� ci, aby� niebawem zosta� tu pochowany. Poza tym nie widzisz tych szkielet�w?
	}
	else {
		AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_03"); //St�j! Nie widzisz tych szkielet�w?
	};
	
	AI_Output (other, self,"DIA_NASZ_111_Gerold_cmentarz_55_04"); //W�a�nie id� im na spotkanie.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_05"); //Taa... Mam nadziej�, �e w ko�cu za�egnamy ten problem.

};

//*********************************************************************
//	         Go
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_go   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 12;
 	condition   = DIA_NASZ_111_Gerold_go_Condition;
 	information = DIA_NASZ_111_Gerold_go_Info;
 	permanent   = FALSE;
 	description = "Za�atwmy razem o�ywie�c�w!";
};

FUNC INT DIA_NASZ_111_Gerold_go_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_cmentarz))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_go_Info()
{
	AI_Output (other, self,"DIA_NASZ_111_Gerold_go_15_00"); //Za�atwmy razem o�ywie�c�w!
	AI_Output (self, other,"DIA_NASZ_111_Gerold_go_55_01"); //Mia�em nadziej�, �e to powiesz. P�jd� za tob�!

	Npc_ExchangeRoutine (NASZ_111_Gerold, "Guide");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_111_Gerold,1);
	AI_StopProcessInfos (self);

	B_LogEntry (TOPIC_Keroloth_duchy, "Gerold ch�tnie zgodzi� si� mi pom�c w odes�aniu trup�w do grob�w.");

};

//*********************************************************************
//	         Death
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_death   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 13;
 	condition   = DIA_NASZ_111_Gerold_death_Condition;
 	information = DIA_NASZ_111_Gerold_death_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_111_Gerold_death_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_go)
		&& (Npc_GetDistToWP(self,"NASZ_LOWCY_CMENTARZ_03") < 2500)
		&& npc_isdead (Skeleton_Lowcy_SkeA)
		&& npc_isdead (Skeleton_Lowcy_SkeB)
		&& npc_isdead (Skeleton_Lowcy_SkeC)
		&& npc_isdead (Skeleton_Lowcy_SkeD)
		&& npc_isdead (Skeleton_Lowcy_SkeE)
		&& npc_isdead (Skeleton_Lowcy_SkeF)
		&& npc_isdead (Skeleton_Lowcy_SkeG)
		&& npc_isdead (Skeleton_Lowcy_SkeH))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_death_Info()
{
	AI_Output (self, other,"DIA_NASZ_111_Gerold_death_15_00"); //To ju� wszystkie?
	AI_Output (other, self,"DIA_NASZ_111_Gerold_death_55_01"); //Tak, chyba tak. 
	AI_Output (self, other,"DIA_NASZ_111_Gerold_death_15_02"); //Ciekawe, sk�d wzi�y si� tu te szkielety...
	AI_Output (other, self,"DIA_NASZ_111_Gerold_death_55_03"); //Mo�e paladyni powychodzili z grob�w?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_death_15_04"); //Nie, na pewno nie.	 

	B_GivePlayerXP (300);
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_111_Gerold,0);
};

//*********************************************************************
//	        Sure
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_sure   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 14;
 	condition   = DIA_NASZ_111_Gerold_sure_Condition;
 	information = DIA_NASZ_111_Gerold_sure_Info;
 	permanent   = FALSE;
 	description = "Sk�d ta pewno��?";
};

FUNC INT DIA_NASZ_111_Gerold_sure_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_death))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_sure_Info()
{
	AI_Output (other, self,"DIA_NASZ_111_Gerold_sure_15_00"); //Sk�d ta pewno��?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_sure_55_01"); //Sta�em tu przecie�, kiedy te cholery si� pojawi�y. Wysz�y z do�u, wspina�y si� po ska�ach.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_sure_15_02"); //Chcesz si� dosta� do jakiego� ich gniazda? C�, ja na twoim miejscu po prostu zszed�bym po ska�ach. Przecie� poni�ej i tak jest �cie�ka.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_sure_55_03"); //Dzi�ki za pomoc.
	
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_done)) {
		AI_Output (self, other,"DIA_NASZ_111_Gerold_sure_15_04"); //Hej, ty pomog�e� mi, ja pomog�em tobie.	 
	};
	
	B_LogEntry (TOPIC_Keroloth_duchy, "Szkielet�w ju� nie ma. Teraz pora znale�� ich gniazdo. Gerold powiedzia�, �ebym zszed� po ska�ach na �cie�k� poni�ej. C�, innego pomys�u nie mam, wi�c mo�e warto spr�bowa�.");
	Npc_ExchangeRoutine (self, "Cmentarz");
	B_StartOtherRoutine (NASZ_008_Miecz,"Duchy");
};


//*********************************************************************
//	        GlodQuest
//*********************************************************************
var int Mis_GeroldGlod_Running;
// ----- ----- ----- ----- -----
INSTANCE DIA_NASZ_111_Gerold_GlodQuest   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 14;
 	condition   = DIA_NASZ_111_Gerold_GlodQuest_Condition;
 	information = DIA_NASZ_111_Gerold_GlodQuest_Info;
 	permanent   = FALSE;
 	description = "Wygl�da na to, �e spodoba�a ci si� twoja nowa praca.";
};

FUNC INT DIA_NASZ_111_Gerold_GlodQuest_Condition()	
{
	if (Npc_GetDistToWP	(self, "NASZ_LOWCY_CMENTARZ_02") <=500)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_GlodQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_111_Gerold_GlodQuest_15_00"); //Wygl�da na to, �e spodoba�a ci si� twoja nowa praca.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_GlodQuest_55_01"); //Ca�ymi dniami bez zmru�enia oka stoisz na posterunku. Jak ty to robisz?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_15_02"); //Przypominasz mi jednego go�cia z zamku, kt�ry te� si� o to pyta�, kiedy chcia� odwiedzi� swojego kumpla w lochach. Nazywa� si� bodaj�e Gorn i sprawia� nam same k�opoty.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_03"); //M�wi� ci, dopiero kiedy dobra�o si� do niego czterech paladyn�w zdo�ali�my zaci�gn�� go do celi. Jeszcze nigdy nie widzia�em tak silnego faceta.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_04"); //Odpowiadaj�c jednak na twoje pytanie: Dzi�ki �asce naszego pana Innosa nie gro�ny mi sen, ani tym bardziej zm�czenie.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_05"); //To dar jaki otrzyma�em za wiern� s�u�b�. Jednak jest pewien mankament...
	AI_Output (other, self,"DIA_NASZ_111_Gerold_GlodQuest_55_06"); //Domy�lam si�, do czego to zmierza. Chcesz, abym ci pom�g�, tak?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_07"); //Ten dar to zarazem wielkie wyr�nienie jak i przekle�stwo.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_08"); //Nie b�d� zanudza� ci� szczeg�ami, musisz wiedzie� jedynie, i� nie wolno mi opu�ci� posterunku bez wa�nej przyczyny, gdy� inaczej popadn� w nie�ask� u naszego boga.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_09"); //Zazwyczaj nie by�o to problemem, a� do teraz. Jestem strasznie g�odny, a nikt w tym obozie nie ma czasu, aby przynie�� mi nieco jedzenia.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_10"); //Od kilku godzin czuj�, jak kiszki graj� mi marsza i nied�ugo zaczn� chyba gry�� kor�, �eby zaspokoi� potrzeby.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_GlodQuest_55_11"); //Nawet o tym nie my�l, jeszcze ucierpi przy tym jakie� drzewo, albo p� okolicznego lasu. Postaram si� zorganizowa� ci co� do jedzenia.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_12"); //Tylko si� pospiesz, nie chc� tutaj czeka� kolejnych kilku dni!
	
	Log_CreateTopic (TOPIC_Gerold_glod, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gerold_glod, LOG_RUNNING);
	B_LogEntry (TOPIC_Gerold_glod, "Gerold to straszny �ar�ok, nie mam ku temu �adnych w�tpliwo�ci. Pierwszy raz widz� cz�owieka, kt�ry z takim apetytem spogl�da� na kor� drzew. Powinienem si� pospieszy�, nie chc� zasta� przed obozem poobgryzanych drzew. Tylko sk�d ja wezm� tyle jedzenia? Mog� mu, co prawda, da� co� z moich zapas�w albo p�j�� do znanego mi kucharza.");
	Mis_GeroldGlod_Running = TRUE;
};

func void Gerold_SayMagicRing() {

	AI_Output (self, other,"DIA_NASZ_111_Gerold_SayMagicRing_55_00"); //Dzi�kuj� za twoj� bezinteresown� pomoc, prosz� we� to w nagrod�.
	CreateInvItems(self,ItNa_Przepis_UdziecZDzikaPoLowiecku,1);
	B_GiveInvItems(self,other,ItNa_Przepis_UdziecZDzikaPoLowiecku,1);
	AI_Output (other, self,"DIA_NASZ_111_Gerold_SayMagicRing_55_01"); //Co to jest?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_SayMagicRing_55_02"); //To przepis mojej starej matuli na najlepsz� w �wiecie dziczyzn�. Niestety, ja nigdy nie mia�em talentu do gotowania, wi�c nigdy z niego nie skorzysta�em.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_SayMagicRing_55_03"); //My�l�, �e ta kartka to odpowiednia nagroda za twoj� przys�ug�.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_SayMagicRing_55_04"); //Tak, to bardzo adekwatna nagroda. Mam nadziej�, �e b�dzie mi dane skosztowa� tej wspania�ej potrawy.
	
	Mis_GeroldGlod_Running = FALSE;
		
	B_GivePlayerXP(500);
	DodajReputacje(2,REP_LOWCY);
	
	Log_SetTopicStatus (TOPIC_Gerold_glod, LOG_SUCCESS);
	B_LogEntry (TOPIC_Gerold_glod, "Nakarmi�em g�odomora!");
};

//*********************************************************************
//	        YourAssets
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_YourAssets   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 14;
 	condition   = DIA_NASZ_111_Gerold_YourAssets_Condition;
 	information = DIA_NASZ_111_Gerold_YourAssets_Info;
 	permanent   = FALSE;
 	description = "Mam nadziej�, �e to ci wystarczy na jaki� czas.";
};

FUNC INT DIA_NASZ_111_Gerold_YourAssets_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_GlodQuest))
	&& (GeroldPotrawka_CheckSnaf == FALSE)
	&& (npc_hasitems (other, ItFo_Milk) >= 3)
	&& (npc_hasitems (other, ItFo_Bread) >= 4)
	&& (npc_hasitems (other, ItFo_Bacon) >= 2)
	&& (npc_hasitems (other, ItFo_Cheese) >= 2)
	&& (npc_hasitems (other, ItFoMutton) >= 6)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_YourAssets_Info()
{
	AI_Output (other, self,"DIA_NASZ_111_Gerold_YourAssets_15_00"); //Mam nadziej�, �e to ci wystarczy na jaki� czas.

	// trzy butelki mleka, cztery bochenki, dwie szynki, dwa sery i sze�� kawa�k�w sma�onego mi�sa
	B_GiveInvItems (other, self, ItFo_Milk, 3);
	B_GiveInvItems (other, self, ItFo_Bread, 4);
	B_GiveInvItems (other, self, ItFo_Bacon, 2);
	B_GiveInvItems (other, self, ItFo_Cheese, 2);
	B_GiveInvItems (other, self, ItFoMutton, 6);

	AI_Output (self, other,"DIA_NASZ_111_Gerold_YourAssets_55_01"); //Na jaki� czas? To posi�ek na co najwy�ej jedn� noc przyjacielu.

	Gerold_SayMagicRing();
	
};

//*********************************************************************
//	        PotrawkaSnafa
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_PotrawkaSnafa   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 14;
 	condition   = DIA_NASZ_111_Gerold_PotrawkaSnafa_Condition;
 	information = DIA_NASZ_111_Gerold_PotrawkaSnafa_Info;
 	permanent   = FALSE;
 	description = "Mam dla ciebie specjalne danie, smacznego!";
};

FUNC INT DIA_NASZ_111_Gerold_PotrawkaSnafa_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_GlodQuest))
	&& (GeroldPotrawka_CheckSnaf == TRUE)
	&& (npc_hasitems (other, ItNa_PotrawkaDlaGerolda) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_PotrawkaSnafa_Info()
{
	AI_Output (other, self,"DIA_NASZ_111_Gerold_PotrawkaSnafa_15_00"); //Mam dla ciebie specjalne danie, smacznego!
	B_GiveInvItems (other, self, ItNa_PotrawkaDlaGerolda, 1);
	AI_Output (self, other,"DIA_NASZ_111_Gerold_PotrawkaSnafa_55_01"); //Nie spieszy�e� si�, ju� prawie zszed�em tutaj z g�odu. Co tam masz?
	AI_Output (other, self,"DIA_NASZ_111_Gerold_PotrawkaSnafa_55_02"); //Sam spr�buj, to powinno pom�c ci tak�e w kwestii twoich dolegliwo�ci wzgl�dem bycia cz�sto g�odnym.
	AI_UseItem(self,ItNa_PotrawkaDlaGerolda);
	
	Gerold_SayMagicRing();
	
};





//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_111_Gerold_HowAreYou   (C_INFO)
{
	npc         = NASZ_111_Gerold;
 	nr          = 500;
 	condition   = DIA_NASZ_111_Gerold_HowAreYou_Condition;
 	information = DIA_NASZ_111_Gerold_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak tam na stra�y?";
};

FUNC INT DIA_NASZ_111_Gerold_HowAreYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)) || (KAPITEL >= 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_111_Gerold_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_111_Gerold_HowAreYou_15_00"); //Jak tam na stra�y?
	
	if ((npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)) || (KAPITEL == 2)) && !(npc_knowsinfo (other, DIA_NASZ_110_Keroloth_duchy))
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_HowAreYou_55_01"); //Ca�kiem ciekawie. W nocy robi si� tu naprawd� ponuro. By�e� ju� na cmentarzu?
		AI_Output (self, other,"DIA_NASZ_111_Gerold_HowAreYou_55_02"); //W tym kamiennym grobie na szczycie pochowali�my kapitana Garonda.

	}
	else if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_duchy)) && !(npc_knowsinfo (other, DIA_NASZ_110_Keroloth_done))
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_HowAreYou_55_03"); //Cholerne szkielety. Nie my�la�em, �e przyjdzie mi kiedykolwiek chroni� ob�z przed o�ywie�cami.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_HowAreYou_55_04"); //Odk�d za�atwi�e� spraw� z trupami, jest wzgl�dnie spokojnie.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_111_Gerold_PICKPOCKET (C_INFO)
{
	npc			= NASZ_111_Gerold;
	nr			= 900;
	condition	= DIA_NASZ_111_Gerold_PICKPOCKET_Condition;
	information	= DIA_NASZ_111_Gerold_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_111_Gerold_PICKPOCKET_Condition()
{
	C_Beklauen (33);
};
 
FUNC VOID DIA_NASZ_111_Gerold_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_111_Gerold_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_111_Gerold_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_111_Gerold_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_111_Gerold_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_111_Gerold_PICKPOCKET_DoIt);
};

func void DIA_NASZ_111_Gerold_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItSc_Light,2);
	Info_ClearChoices (DIA_NASZ_111_Gerold_PICKPOCKET);
};
	
func void DIA_NASZ_111_Gerold_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_111_Gerold_PICKPOCKET);
};

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
	AI_Output (self, other,"DIA_NASZ_111_Gerold_siema_55_01"); //Mo¿na by powiedzieæ, ¿e... nudzê siê.
		
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
 	description = "Nudzisz siê? W obozie jest przecie¿ du¿o pracy.";
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
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_nuda_15_00"); //Nudzisz siê? W obozie jest przecie¿ du¿o pracy.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_01"); //Mo¿e to dziwnie zabrzmi, ale jestem przyzwyczajony do pilnowania drzwi, bram i innych.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_02"); //To dopiero nudne, prawda?
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_nuda_15_03"); //Wiêc czemu nie strze¿esz którejœ z bram?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_04"); //Có¿, Keroloth jest naszym przywódc¹, a tak siê jakoœ z³o¿y³o, ¿e ten cz³owiek nigdy mnie nie lubi³.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_05"); //Teraz nie chce, bym ja pilnowa³ bram. W sumie mu siê trochê nie dziwiê. Jeszcze w zamku dosz³o do 'incydentu': Umówi³em siê z pewnym goœciem, by przekaza³ mi trochê ¿arcia w kaplicy.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_06"); //Opuœci³em w nocy swoje stanowisko i w³aœnie w tamtym momencie do wiêzienia wgramoli³y siê olbrzymie szczury. WiêŸniowie wrzeszczeli, a Keroloth pobieg³ tam, by zrobiæ porz¹dek z gryzoniami.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_nuda_55_07"); //Srogo mnie ochrzani³, ale przyrzek³em, ¿e ju¿ nigdy nie odejdê od miejsca, którego pilnujê.
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
	AI_Output (self, other,"DIA_NASZ_111_Gerold_ktora_55_01"); //Bo nie mia³bym poczucia obowi¹zku i nie wysta³bym tylu godzin na nogach.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_ktora_55_02"); //Nie³atwo jest siê zmusiæ do pracy, jeœli nie ma siê poparcia ze strony dowódcy.
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_ktora_15_03"); //No dobrze, któr¹ bramê chcia³byœ pilnowaæ?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_ktora_55_04"); //Obojêtne. Chocia¿ najlepiej t¹, z której mo¿emy spodziewaæ siê najwiêkszego zagro¿enia.

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
	AI_Output (self, other,"DIA_NASZ_111_Gerold_keroloth_55_01"); //Jesteœ pierwsz¹ osob¹, która uda siê do niego w moim imieniu.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_keroloth_55_02"); //Cieszê siê, ¿e chcesz mi pomóc. Jednak w¹tpiê, ¿e coœ z tego bêdzie. Keroloth naprawdê ¿ywi do mnie uraz.

	MIS_GEROLD_READY = TRUE;

	Log_CreateTopic (TOPIC_Gerold_Keroloth, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gerold_Keroloth, LOG_RUNNING);
	B_LogEntry (TOPIC_Gerold_Keroloth, "Gerold pró¿nuje, chocia¿ chce pilnowaæ którejœ z bram. Problemem jest Keroloth, który nie zgadza siê na to.");

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
 	description = "Keroloth ¿¹da 500 sztuk z³ota.";
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
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_00"); //Keroloth ¿¹da 500 sztuk z³ota.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_01"); //Ca³kiem sporo sobie liczy. Dam ci wszystko, co mam. Mam nadziejê, ¿e siê przyda.
	Createinvitems (self, itmi_gold, 170);
	B_giveinvitems (self, other, itmi_gold, 170);
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_02"); //Przyda, ale co z tego? To nie jest nawet po³owa potrzebnej sumy. Sk¹d mam wzi¹æ resztê z³ota?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_03"); //Nie mam wiêcej przy sobie. Muszê sobie zostawiæ trochê na czarn¹ godzinê.
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_04"); //A wiêc przyznajesz, ¿e masz jeszcze jakieœ oszczêdnoœci. S³uchaj: Wolisz siê nudziæ, czy robiæ coœ po¿ytecznego?
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_05"); //Mimo moich szczerych chêci, nie jestem w stanie ci pomóc, bo nie jestem obrzydliwie bogaty jak król. Jeœli masz gdzieœ jeszcze pieni¹dze, to powinieneœ siêgn¹æ do kieszeni i je wykorzystaæ.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_06"); //Nie mam ich przy sobie, ju¿ mówi³em. Ukry³em trochê z³ota w dwóch miejscach w okolicy obozu. Mam nadziejê, ¿e nikt tam jeszcze nie zagl¹da³...
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_07"); //Jedna sakiewka jest zakopana za aren¹ miêdzy drzewami. Z drug¹ te¿ nie powinieneœ mieæ problemu.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_08"); //WejdŸ na cmentarz przez karczmê i szukaj skrzy¿owanych patyków po prawej stronie od grobu Garonda.
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_500szt_15_09"); //Czemu sam siê nie pofatygujesz i nie pójdziesz tego wykopaæ?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_500szt_55_10"); //Eee... Powiedzmy, ¿e mam pewne sprawy do za³atwienia.	
	
	B_LogEntry (TOPIC_Gerold_Keroloth, "Gerold da³ mi trochê z³ota i powiedzia³, gdzie mogê znaleŸæ wiêcej. Muszê poszukaæ skrzy¿owanych patyków za aren¹ miêdzy dwoma drzewami i na cmentarzu, na prawo od grobu Garonda. Stra¿nik zapewne wys³a³ mnie, ¿eby samemu udaæ siê do swoich innych skrytek i zabraæ stamt¹d z³oto... No có¿, mam nadziejê, ¿e z³ota wystarczy.");
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
 	description = "Za³atwione.";
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
	AI_Output (other,self ,"DIA_NASZ_111_Gerold_done_15_00"); //Za³atwione.
	
	if (GeroldPytalesOZloto == FALSE)
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_01"); //Naprawdê? Niemo¿liwe! Jak tego dokona³eœ?
		AI_Output (other,self ,"DIA_NASZ_111_Gerold_done_15_02"); //Musia³em poszperaæ w torbie i wyj¹æ trochê z³otych monet.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_03"); //Ehh... Nie mam zbyt wiele. Mogê ci daæ tylko 200 sztuk z³ota.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_04"); //Trzymaj.

		Createinvitems (self, itmi_gold, 200);
		B_giveinvitems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_05"); //A wiêc zebra³eœ tê pokaŸn¹ sumê.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_06"); //Sprzeda³em Johny'emu jakieœ rupiecie, wiêc do³o¿ê ci jeszcze parê sztuk z³ota.

		Createinvitems (self, itmi_gold, 30);
		B_giveinvitems (self, other, itmi_gold, 30);
	};

	AI_Output (other,self ,"DIA_NASZ_111_Gerold_done_15_07"); //Dziêki. Masz pilnowaæ wejœcia od strony cmentarza.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_08"); //No, no! Po nocach bêdzie straszyæ.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_done_55_09"); //W takim razie ruszam na wartê!

	
	Npc_ExchangeRoutine (self, "Cmentarz");
	MIS_GEROLD_READY = FALSE;
	DodajReputacje (3, REP_LOWCY);
	B_LogEntry (TOPIC_Gerold_Keroloth, "Gerold ucieszy³ siê, gdy powiedzia³em mu, ¿e ma pilnowaæ wejœcia od strony cmentarza.");
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
	description = "Czy wiesz coœ o sporach pomiêdzy myœliwymi i ³owcami?";
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
	AI_Output (other, self,"DIA_NASZ_111_Gerold_goth_15_00"); //Czy wiesz coœ o sporach pomiêdzy myœliwymi i ³owcami?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_goth_55_01"); //Kilka dni temu ktoœ okrad³ myœliwych.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_goth_55_02"); //Niby wina spad³a na nas, ³owców, ale ja myœlê, ¿e to sprawka kogoœ z myœliwych, komu zale¿y na zwadzie pomiêdzy naszymi obozami.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_goth_15_03"); //Tylko czemu mia³oby to s³u¿yæ?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_goth_55_04"); //Nie mam pojêcia. Jestem tutaj bezpieczny i nie obchodz¹ mnie potyczki miêdzy naszymi obozami.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_goth_55_05"); //To nie mój problem.

	B_LogEntry (TOPIC_Goth_kradziez, "Gerold zwróci³ uwagê na fakt, ¿e sprawc¹ niekoniecznie musi byæ ³owca orków. Ma racjê. Nie warto ograniczaæ horyzontów poszukiwañ.");

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
		AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_00"); //Jesteœ, cholerna œwinio! Zabra³eœ ode mnie z³oto i zwia³eœ z nim, nie za³atwiwszy sprawy z Kerolothem.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_01"); //I pewnie nawet nie zamierza³eœ z nim pogadaæ, co? Za³atwi³em to sam i pilnujê cmentarza. Nie bêdê têpi³ miecza na tak¹ szumowinê jak ty.
		AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_02"); //Przeklinam ciê i ¿yczê ci, abyœ niebawem zosta³ tu pochowany. Poza tym nie widzisz tych szkieletów?
	}
	else {
		AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_03"); //Stój! Nie widzisz tych szkieletów?
	};
	
	AI_Output (other, self,"DIA_NASZ_111_Gerold_cmentarz_55_04"); //W³aœnie idê im na spotkanie.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_cmentarz_15_05"); //Taa... Mam nadziejê, ¿e w koñcu za¿egnamy ten problem.

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
 	description = "Za³atwmy razem o¿ywieñców!";
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
	AI_Output (other, self,"DIA_NASZ_111_Gerold_go_15_00"); //Za³atwmy razem o¿ywieñców!
	AI_Output (self, other,"DIA_NASZ_111_Gerold_go_55_01"); //Mia³em nadziejê, ¿e to powiesz. Pójdê za tob¹!

	Npc_ExchangeRoutine (NASZ_111_Gerold, "Guide");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_111_Gerold,1);
	AI_StopProcessInfos (self);

	B_LogEntry (TOPIC_Keroloth_duchy, "Gerold chêtnie zgodzi³ siê mi pomóc w odes³aniu trupów do grobów.");

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
	AI_Output (self, other,"DIA_NASZ_111_Gerold_death_15_00"); //To ju¿ wszystkie?
	AI_Output (other, self,"DIA_NASZ_111_Gerold_death_55_01"); //Tak, chyba tak. 
	AI_Output (self, other,"DIA_NASZ_111_Gerold_death_15_02"); //Ciekawe, sk¹d wziê³y siê tu te szkielety...
	AI_Output (other, self,"DIA_NASZ_111_Gerold_death_55_03"); //Mo¿e paladyni powychodzili z grobów?
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
 	description = "Sk¹d ta pewnoœæ?";
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
	AI_Output (other, self,"DIA_NASZ_111_Gerold_sure_15_00"); //Sk¹d ta pewnoœæ?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_sure_55_01"); //Sta³em tu przecie¿, kiedy te cholery siê pojawi³y. Wysz³y z do³u, wspina³y siê po ska³ach.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_sure_15_02"); //Chcesz siê dostaæ do jakiegoœ ich gniazda? Có¿, ja na twoim miejscu po prostu zszed³bym po ska³ach. Przecie¿ poni¿ej i tak jest œcie¿ka.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_sure_55_03"); //Dziêki za pomoc.
	
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_done)) {
		AI_Output (self, other,"DIA_NASZ_111_Gerold_sure_15_04"); //Hej, ty pomog³eœ mi, ja pomog³em tobie.	 
	};
	
	B_LogEntry (TOPIC_Keroloth_duchy, "Szkieletów ju¿ nie ma. Teraz pora znaleŸæ ich gniazdo. Gerold powiedzia³, ¿ebym zszed³ po ska³ach na œcie¿kê poni¿ej. Có¿, innego pomys³u nie mam, wiêc mo¿e warto spróbowaæ.");
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
 	description = "Wygl¹da na to, ¿e spodoba³a ci siê twoja nowa praca.";
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
	AI_Output (other, self,"DIA_NASZ_111_Gerold_GlodQuest_15_00"); //Wygl¹da na to, ¿e spodoba³a ci siê twoja nowa praca.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_GlodQuest_55_01"); //Ca³ymi dniami bez zmru¿enia oka stoisz na posterunku. Jak ty to robisz?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_15_02"); //Przypominasz mi jednego goœcia z zamku, który te¿ siê o to pyta³, kiedy chcia³ odwiedziæ swojego kumpla w lochach. Nazywa³ siê bodaj¿e Gorn i sprawia³ nam same k³opoty.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_03"); //Mówiê ci, dopiero kiedy dobra³o siê do niego czterech paladynów zdo³aliœmy zaci¹gn¹æ go do celi. Jeszcze nigdy nie widzia³em tak silnego faceta.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_04"); //Odpowiadaj¹c jednak na twoje pytanie: Dziêki ³asce naszego pana Innosa nie groŸny mi sen, ani tym bardziej zmêczenie.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_05"); //To dar jaki otrzyma³em za wiern¹ s³u¿bê. Jednak jest pewien mankament...
	AI_Output (other, self,"DIA_NASZ_111_Gerold_GlodQuest_55_06"); //Domyœlam siê, do czego to zmierza. Chcesz, abym ci pomóg³, tak?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_07"); //Ten dar to zarazem wielkie wyró¿nienie jak i przekleñstwo.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_08"); //Nie bêdê zanudza³ ciê szczegó³ami, musisz wiedzieæ jedynie, i¿ nie wolno mi opuœciæ posterunku bez wa¿nej przyczyny, gdy¿ inaczej popadnê w nie³askê u naszego boga.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_09"); //Zazwyczaj nie by³o to problemem, a¿ do teraz. Jestem strasznie g³odny, a nikt w tym obozie nie ma czasu, aby przynieœæ mi nieco jedzenia.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_10"); //Od kilku godzin czujê, jak kiszki graj¹ mi marsza i nied³ugo zacznê chyba gryŸæ korê, ¿eby zaspokoiæ potrzeby.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_GlodQuest_55_11"); //Nawet o tym nie myœl, jeszcze ucierpi przy tym jakieœ drzewo, albo pó³ okolicznego lasu. Postaram siê zorganizowaæ ci coœ do jedzenia.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_GlodQuest_55_12"); //Tylko siê pospiesz, nie chcê tutaj czekaæ kolejnych kilku dni!
	
	Log_CreateTopic (TOPIC_Gerold_glod, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gerold_glod, LOG_RUNNING);
	B_LogEntry (TOPIC_Gerold_glod, "Gerold to straszny ¿ar³ok, nie mam ku temu ¿adnych w¹tpliwoœci. Pierwszy raz widzê cz³owieka, który z takim apetytem spogl¹da³ na korê drzew. Powinienem siê pospieszyæ, nie chcê zastaæ przed obozem poobgryzanych drzew. Tylko sk¹d ja wezmê tyle jedzenia? Mogê mu, co prawda, daæ coœ z moich zapasów albo pójœæ do znanego mi kucharza.");
	Mis_GeroldGlod_Running = TRUE;
};

func void Gerold_SayMagicRing() {

	AI_Output (self, other,"DIA_NASZ_111_Gerold_SayMagicRing_55_00"); //Dziêkujê za twoj¹ bezinteresown¹ pomoc, proszê weŸ to w nagrodê.
	CreateInvItems(self,ItNa_Przepis_UdziecZDzikaPoLowiecku,1);
	B_GiveInvItems(self,other,ItNa_Przepis_UdziecZDzikaPoLowiecku,1);
	AI_Output (other, self,"DIA_NASZ_111_Gerold_SayMagicRing_55_01"); //Co to jest?
	AI_Output (self, other,"DIA_NASZ_111_Gerold_SayMagicRing_55_02"); //To przepis mojej starej matuli na najlepsz¹ w œwiecie dziczyznê. Niestety, ja nigdy nie mia³em talentu do gotowania, wiêc nigdy z niego nie skorzysta³em.
	AI_Output (self, other,"DIA_NASZ_111_Gerold_SayMagicRing_55_03"); //Myœlê, ¿e ta kartka to odpowiednia nagroda za twoj¹ przys³ugê.
	AI_Output (other, self,"DIA_NASZ_111_Gerold_SayMagicRing_55_04"); //Tak, to bardzo adekwatna nagroda. Mam nadziejê, ¿e bêdzie mi dane skosztowaæ tej wspania³ej potrawy.
	
	Mis_GeroldGlod_Running = FALSE;
		
	B_GivePlayerXP(500);
	DodajReputacje(2,REP_LOWCY);
	
	Log_SetTopicStatus (TOPIC_Gerold_glod, LOG_SUCCESS);
	B_LogEntry (TOPIC_Gerold_glod, "Nakarmi³em g³odomora!");
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
 	description = "Mam nadziejê, ¿e to ci wystarczy na jakiœ czas.";
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
	AI_Output (other, self,"DIA_NASZ_111_Gerold_YourAssets_15_00"); //Mam nadziejê, ¿e to ci wystarczy na jakiœ czas.

	// trzy butelki mleka, cztery bochenki, dwie szynki, dwa sery i szeœæ kawa³ków sma¿onego miêsa
	B_GiveInvItems (other, self, ItFo_Milk, 3);
	B_GiveInvItems (other, self, ItFo_Bread, 4);
	B_GiveInvItems (other, self, ItFo_Bacon, 2);
	B_GiveInvItems (other, self, ItFo_Cheese, 2);
	B_GiveInvItems (other, self, ItFoMutton, 6);

	AI_Output (self, other,"DIA_NASZ_111_Gerold_YourAssets_55_01"); //Na jakiœ czas? To posi³ek na co najwy¿ej jedn¹ noc przyjacielu.

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
	AI_Output (self, other,"DIA_NASZ_111_Gerold_PotrawkaSnafa_55_01"); //Nie spieszy³eœ siê, ju¿ prawie zszed³em tutaj z g³odu. Co tam masz?
	AI_Output (other, self,"DIA_NASZ_111_Gerold_PotrawkaSnafa_55_02"); //Sam spróbuj, to powinno pomóc ci tak¿e w kwestii twoich dolegliwoœci wzglêdem bycia czêsto g³odnym.
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
 	description = "Jak tam na stra¿y?";
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
	AI_Output (other, self,"DIA_NASZ_111_Gerold_HowAreYou_15_00"); //Jak tam na stra¿y?
	
	if ((npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)) || (KAPITEL == 2)) && !(npc_knowsinfo (other, DIA_NASZ_110_Keroloth_duchy))
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_HowAreYou_55_01"); //Ca³kiem ciekawie. W nocy robi siê tu naprawdê ponuro. By³eœ ju¿ na cmentarzu?
		AI_Output (self, other,"DIA_NASZ_111_Gerold_HowAreYou_55_02"); //W tym kamiennym grobie na szczycie pochowaliœmy kapitana Garonda.

	}
	else if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_duchy)) && !(npc_knowsinfo (other, DIA_NASZ_110_Keroloth_done))
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_HowAreYou_55_03"); //Cholerne szkielety. Nie myœla³em, ¿e przyjdzie mi kiedykolwiek chroniæ obóz przed o¿ywieñcami.
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_111_Gerold_HowAreYou_55_04"); //Odk¹d za³atwi³eœ sprawê z trupami, jest wzglêdnie spokojnie.
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

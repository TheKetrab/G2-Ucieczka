//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_EXIT   (C_INFO)
{
	npc         = NASZ_215_Kivo;
	nr          = 999;
	condition   = DIA_NASZ_215_Kivo_EXIT_Condition;
	information = DIA_NASZ_215_Kivo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_215_Kivo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_215_Kivo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_siema   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 1;
 	condition   = DIA_NASZ_215_Kivo_siema_Condition;
 	information = DIA_NASZ_215_Kivo_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_215_Kivo_siema_Condition()
{
	if (KAPITEL == 1) && (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_siema_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_siema_55_01"); //Zw� mnie Kivo. Jestem najlepszy w swoim fachu.
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_siema_15_02"); //To znaczy?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_siema_55_03"); //Widzisz zapewne moj� zbroj�. My�liwi maj� grup� ludzi do zada� specjalnych.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_siema_55_04"); //Nie polujemy. Jeste�my raczej stra�nikami obozu i czasem patrolujemy okolic�, oceniamy zagro�enie ze strony ork�w.
};

//*********************************************************************
//	Info Grupa
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_grupa   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 2;
 	condition   = DIA_NASZ_215_Kivo_grupa_Condition;
 	information = DIA_NASZ_215_Kivo_grupa_Info;
 	permanent   = FALSE;
 	description = "Opowiedz mi o tym wi�cej.";
};

FUNC INT DIA_NASZ_215_Kivo_grupa_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_siema)) && (KAPITEL == 1)
	{
	return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_grupa_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_grupa_15_00"); //Opowiedz mi o tym wi�cej.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_01"); //Te� chcia�by� zosta� stra�nikiem? To bardzo odpowiedzialne zaj�cie.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_02"); //Niecelnie trafiony �cierwojad ucieknie i kolacja b�dzie troch� mniej obfita. Za to je�li spud�ujesz w z�bacza, rozw�cieczone zwierz� mo�e przedrze� si� do obozu i narobi� wiele szk�d.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_03"); //Kilku z nas strze�e obozu. Gdy w pobli�u zobaczymy stado k�saczy, biegniemy do bramy, by j� zamkn�� i strzelamy do nich z g�ry.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_04"); //Je�li chodzi o nasz� dzia�alno�� poza obozem... Pilnujemy, by orkowie nie wchodzili na nasze tereny �owieckie.
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_grupa_15_05"); //Orkowie cz�sto to robi�?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_06"); //Raczej nie zdarza si� to codziennie. I je�li ju�, to jest to pojedynczy zwiadowca. Ca�a filozofia polega na tym, by uciszy� go jedn�, maksymalnie dwoma strza�ami.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_grupa_55_07"); //Zielonosk�rzy g�o�no krzycz�, gdy s� zranieni, a to mo�e przyci�gn�� ich wi�cej.
};

//*********************************************************************
//	         Place
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_place   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 3;
 	condition   = DIA_NASZ_215_Kivo_place_Condition;
 	information = DIA_NASZ_215_Kivo_place_Info;
 	permanent   = FALSE;
 	description = "Co to za miejsce?";
};

FUNC INT DIA_NASZ_215_Kivo_place_Condition()	
{
	if (KAPITEL == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_place_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_place_15_00"); //Co to za miejsce?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_place_55_01"); //To cmentarz my�liwych.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_place_55_02"); //Tutaj grzebiemy swoich zmar�ych. Ludzie niestety nie s� nie�miertelni.
};


//*********************************************************************
//	         What
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_what   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 4;
 	condition   = DIA_NASZ_215_Kivo_what_Condition;
 	information = DIA_NASZ_215_Kivo_what_Info;
 	permanent   = FALSE;
 	description = "Czemu tutaj jeste�?";
};

FUNC INT DIA_NASZ_215_Kivo_what_Condition()	
{
	if (KAPITEL == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_what_15_00"); //Czemu tutaj jeste�?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_what_55_01"); //Op�akuj� mojego niedawno zmar�ego brata. Razem ze mn� by� stra�nikiem obozu.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_what_15_02"); //Orkowie zabili go tydzie� temu.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_what_55_03"); //Zemszcz� si�!
};

//*********************************************************************
//	Info GoToRenegaci
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_GoToRenegaci   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 4;
 	condition   = DIA_NASZ_215_Kivo_GoToRenegaci_Condition;
 	information = DIA_NASZ_215_Kivo_GoToRenegaci_Info;
 	permanent   = FALSE;
	description = "Potrzebuj� twojej pomocy w walce z Marcosem.";
};

FUNC INT DIA_NASZ_215_Kivo_GoToRenegaci_Condition()	
{
	if (GestathRenegatOK == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_GoToRenegaci_Info()
{
	AI_Output (other, self,"DIA_NASZ_215_Kivo_GoToRenegaci_15_00"); //Potrzebuj� twojej pomocy w walce z Marcosem.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_GoToRenegaci_55_01"); //Wola�bym przelewa� krew ork�w ni� ludzi. To rozkaz Gestatha?
	AI_Output (other, self,"DIA_NASZ_215_Kivo_GoToRenegaci_55_02"); //Tak. Powiedzia�, �e masz mi pom�c. Na krew ork�w r�wnie� przyjdzie pora. Chod�!

	Npc_ExchangeRoutine (self, "FollowRenegaci");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_215_Kivo,1);
};


//*********************************************************************
//	Info RenegaciOnPlace
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_RenegaciOnPlace   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 4;
 	condition   = DIA_NASZ_215_Kivo_RenegaciOnPlace_Condition;
 	information = DIA_NASZ_215_Kivo_RenegaciOnPlace_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_215_Kivo_RenegaciOnPlace_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_GoToRenegaci)) //
	&& (npc_knowsinfo (other, DIA_NASZ_217_Louis_GoToRenegaci))    // jesli pogadales z nimi trzema
	&& (npc_knowsinfo (other, DIA_NASZ_227_Vachut_GoToRenegaci))  // i sa z toba pod brama
	&& ((Npc_GetDistToWP(hero,"OW_PATH_148_A") < 1000)
	 || (Npc_GetDistToWP(hero,"OW_PATH_264") < 1000))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_RenegaciOnPlace_Info()
{
	// FIX Ucieczka 1.1 - niestety dubbing nagrany jako wszystko Kivo, wiec to juz nie moze byc trialog :(
	//var C_NPC Kivo; Kivo = Hlp_GetNpc (NASZ_215_Kivo);
	//var C_NPC Louis; Louis = Hlp_GetNpc (NASZ_217_Louis);
	//var C_NPC Vachut; Vachut = Hlp_GetNpc (NASZ_227_Vachut);
	
	//TRIA_Invite(Kivo);
	//TRIA_Invite(Louis);
	//TRIA_Invite(Vachut);
	
    //TRIA_Start();
 
	//TRIA_Next(Kivo);
	
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_15_00"); //I jeste�my. Widzisz ju� dziur�, kt�r� chcesz si� przedosta�?
	AI_Output (other, self,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_01"); //Jeszcze nie, musz� przyjrze� si� lepiej tym barykadom.
	
	if (Npc_GetDistToWP(hero,"OW_PATH_264") < (Npc_GetDistToWP(hero,"OW_PATH_148_A"))) {
		AI_Output (other, self,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_02"); //Wy oczekujcie przy tej bramie. O ile dobrze pami�tam, ko�owr�t otwiera� w�a�nie t�.
	} else {
		AI_Output (other, self,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_03"); //Wy udajcie si� pod drug� bram�. Stamt�d zaatakujecie.
	};
	
	//TRIA_Next(Louis);
	//AI_TurnToNpc(other, self);
    //AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_04"); //Szczerze m�wi�c, czuj� wi�kszy entuzjazm, gdy mam zabija� ludzi a nie zwierzyn�.

	//TRIA_Next(Vachut);
	//AI_TurnToNpc(other, self);
    //AI_TurnToNpc(self, other);
	
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_05"); //Po drodze zebra�em troch� t�uszczu z bestii i napcha�em do pojemniczka.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_06"); //My�l�, �e mo�e ci si� przyda�, w razie gdyby ko�owr�t nie chcia� si� poruszy�.

	Createinvitems (self, ItMi_Moleratlubric_MIS, 1);
	B_giveinvitems (self, other, ItMi_Moleratlubric_MIS, 1);
	
	AI_Output (other, self,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_07"); //Dzi�ki.

	//TRIA_Next(Kivo);
	//AI_TurnToNpc(other, self);
    //AI_TurnToNpc(self, other);
		
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_08"); //Zaatakujemy pod os�on� nocy. Do tego czasu odpocznijmy troch�.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_RenegaciOnPlace_55_09"); //Ty, Willu, id� poszukaj szpary mi�dzy deskami. A, i najwa�niejsze: Nie daj si� zdepta�, gdy b�dziesz przemieniony w ma�ego owada.
	
	//TRIA_Finish();
	
	B_LogEntry(TOPIC_Korth_kopalnia,"Dotarli�my pod kopalni�. Kivo powiedzia�, �e zaatakujemy pod os�on� nocy. Musz� znale�� jak�� szpar�, by wej�� do �rodka. Vachut da� mi te� ��j kretoszczura, �ebym m�g� przekr�ci� ko�owr�t i otworzy� bram� my�liwym.");

	
	Info_ClearChoices (DIA_NASZ_215_Kivo_RenegaciOnPlace);
		Info_AddChoice	  (DIA_NASZ_215_Kivo_RenegaciOnPlace, "KONIEC", DIA_NASZ_215_Kivo_RenegaciOnPlace_end);
};

FUNC VOID DIA_NASZ_215_Kivo_RenegaciOnPlace_end()
{
	AI_StopProcessInfos(self);
	
	RenegaciSetTime_Go = TRUE;
	Fade_Status = 1;
	ff_applyonce(RenegaciSetTime);
	
	Npc_ExchangeRoutine (NASZ_215_Kivo, "StandRenegaci");
	Npc_ExchangeRoutine (NASZ_217_Louis, "StandRenegaci");
	Npc_ExchangeRoutine (NASZ_227_Vachut, "StandRenegaci");
	
};



//*********************************************************************
//	         YouToo
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_youtoo   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 30;
 	condition   = DIA_NASZ_215_Kivo_youtoo_Condition;
 	information = DIA_NASZ_215_Kivo_youtoo_Info;
 	permanent   = FALSE;
 	description = "Ciebie te� tutaj przys�ali?";
};

FUNC INT DIA_NASZ_215_Kivo_youtoo_Condition()	
{
	if (Hlp_StrCmp(Npc_GetNearestWP(self),"NASZ_BANDYCI_OBOZ_21"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_youtoo_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_youtoo_15_00"); //Ciebie te� tutaj przys�ali?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_youtoo_55_01"); //Tak. Do�� ju� si� nalamentowa�em. Okres �a�oby dobieg� ko�ca.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_youtoo_15_02"); //Teraz pora si� zem�ci�.

};

//*********************************************************************
//	         Help
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_help   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 31;
 	condition   = DIA_NASZ_215_Kivo_help_Condition;
 	information = DIA_NASZ_215_Kivo_help_Info;
 	permanent   = FALSE;
 	description = "Mog� ci si� na co� przyda�?";
};

FUNC INT DIA_NASZ_215_Kivo_help_Condition()	
{
	if (KAPITEL>=3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_help_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_help_15_00"); //Mog� ci si� na co� przyda�?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_55_01"); //Hmm... Zanim p�jd� walczy� z orkami, przyda�by mi si� pewien miecz. Walka na dystans jest dobra, gdy ork�w jest dw�ch albo trzech.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_55_02"); //Spodziewam si� walki nawet z dziesi�cioma przeciwnikami, a wi�c potrzebuj� ostrza do walki wr�cz, kt�re sieje postrach w szeregach ork�w.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_15_03"); //Pomi�dzy Star� Kopalni� a zamkiem, gdzie� w lesie jest cude�ko, kt�re mnie interesuje.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_15_04"); //Konkretniej to Orkowa Zguba. Gdybym pojawi� si� z takim ostrzem, zielonosk�rzy straciliby pewno�� siebie! Przynie� mi ten miecz.
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_help_15_05"); //Sk�d wiesz, �e znajd� ten miecz w�a�nie w tym lesie?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_help_15_06"); //Jeszcze za czas�w Gomeza m�j przyjaciel w�ada� tak� broni�. Kt�rego� dnia poszed� tam polowa� i nigdy nie wr�ci�. Miecz musi by� gdzie� tam.

	//Wld_InsertNpc	(NASZ_413_Umarlak,"NASZ_UMARLAK"); 
	//B_KillNPC (NASZ_413_Umarlak);
	Wld_InsertNpc	(Gobbo_Warrior_Kivo,"NASZ_UMARLAK"); 

	Log_CreateTopic (TOPIC_Kivo_zemsta, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kivo_zemsta, LOG_RUNNING);
	B_LogEntry (TOPIC_Kivo_zemsta, "Kivo chce, bym odnalaz� bro� o nazwie 'Orkowa Zguba', dzi�ki kt�rej mo�na os�abi� morale ork�w. Jego przyjaciel by� niegdy� posiadaczem tej broni, ale ostatnio widziano go bardzo dawno temu w lesie mi�dzy Star� Kopalni� a zamkiem. W�tpi�, �ebym tam co� znalaz�, ale p�ki co nie ma lepszego tropu.");

};

var int KIVO_HELP;
//*********************************************************************
//	         OrkowaZguba
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_OrkowaZguba   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 32;
 	condition   = DIA_NASZ_215_Kivo_OrkowaZguba_Condition;
 	information = DIA_NASZ_215_Kivo_OrkowaZguba_Info;
	permanent   = FALSE;
 	description = "O ten miecz ci chodzi?";
};

FUNC INT DIA_NASZ_215_Kivo_OrkowaZguba_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_help)
		&& npc_hasitems (other, ItMw_Orkschlaechter) >= 1)
	{
		return TRUE;
	};
};


FUNC VOID DIA_NASZ_215_Kivo_OrkowaZguba_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_OrkowaZguba_15_00"); //O ten miecz ci chodzi?
	AI_Output (self, other,"DIA_NASZ_215_Kivo_OrkowaZguba_55_01"); //Poka�.
	B_giveinvitems (other, self, ItMw_Orkschlaechter, 1);
	
	
	var c_npc slf; slf = Hlp_GetNpc(self);
	Npc_InspectWeapon(slf,ItMw_Orkschlaechter,true);
	
	AI_Output (self, other,"DIA_NASZ_215_Kivo_OrkowaZguba_15_02"); //O tak... idealny!
	AI_Output (self, other,"DIA_NASZ_215_Kivo_OrkowaZguba_15_03"); //Dzi�ki, przyjacielu! We� troch� z�ota w nagrod�.
	Createinvitems (self, ItMi_Gold, 100);
	B_giveinvitems (self, other, ItMi_Gold, 100);

	KIVO_HELP = TRUE;
	
	B_GivePlayerXP(700);
	DodajReputacje(2,REP_MYSLIWI);
	Log_SetTopicStatus (TOPIC_Kivo_zemsta, LOG_SUCCESS);
	B_LogEntry (TOPIC_Kivo_zemsta, "Odda�em miecz Kivo.");

};

//*********************************************************************
//	         ComeOn
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_comeon   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 35;
 	condition   = DIA_NASZ_215_Kivo_comeon_Condition;
 	information = DIA_NASZ_215_Kivo_comeon_Info;
 	permanent   = TRUE;
 	description = "Chod� ze mn�.";
};

FUNC INT DIA_NASZ_215_Kivo_comeon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (WODZOWIE_KILLED == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_comeon_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_comeon_15_00"); //Chod� ze mn�.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_comeon_55_01"); //Po co?
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_comeon_15_02"); //Jaszczuroludzie s� dla nas zagro�eniem, pom� mi ich unicestwi�.

		if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_OrkowaZguba)){
			AI_Output (self, other,"DIA_NASZ_215_Kivo_comeon_15_03"); //Dobra, p�jd� za tob�.

			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self, "Follow");
			//self.aivar[AIV_PARTYMEMBER] = TRUE;
			Druzyna (NASZ_215_Kivo,1);
		}
		else {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_comeon_55_04"); //Najpierw ty pom� mnie, potem ja pomog� tobie.
		};
};

//*********************************************************************
//	         Back
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_back   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 36;
 	condition   = DIA_NASZ_215_Kivo_back_Condition;
 	information = DIA_NASZ_215_Kivo_back_Info;
 	permanent   = TRUE;
 	description = "Wracaj.";
};

FUNC INT DIA_NASZ_215_Kivo_back_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (WODZOWIE_KILLED == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_back_Info()
{
	AI_Output (other,self ,"DIA_NASZ_215_Kivo_back_15_00"); //Wracaj.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_back_55_01"); //Je�li b�d� ci potrzebny, to daj zna�.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Bandyci");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_215_Kivo,0);
};

//*********************************************************************
//	         ImportantBack
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_ImportantBack   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 37;
 	condition   = DIA_NASZ_215_Kivo_ImportantBack_Condition;
 	information = DIA_NASZ_215_Kivo_ImportantBack_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_215_Kivo_ImportantBack_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_221_Benito_kill)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (WODZOWIE_KILLED == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_ImportantBack_Info()
{
	AI_Output (self, other,"DIA_NASZ_215_Kivo_ImportantBack_15_00"); //Ten Kamashi... To by�o potworne monstrum.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "Bandyci");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_215_Kivo,0);
};

var int KIVO_GO;
//*********************************************************************
//	         TrollCanyon
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_TrollCanyon   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 38;
 	condition   = DIA_NASZ_215_Kivo_TrollCanyon_Condition;
 	information = DIA_NASZ_215_Kivo_TrollCanyon_Info;
 	permanent   = TRUE;
 	description = "Musisz uda� si� do Kanionu Trolli.";
};

FUNC INT DIA_NASZ_215_Kivo_TrollCanyon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)
		&& (!KIVO_GO))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_TrollCanyon_Info()
{
	AI_Output (other, self,"DIA_NASZ_215_Kivo_TrollCanyon_15_00"); //Musisz uda� si� do Kanionu Trolli.
		if (KIVO_HELP == TRUE) && (WODZOWIE_KILLED == TRUE) {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_01"); //Robi si�! Orkowie mog� ju� kopa� sobie groby.			
			Npc_ExchangeRoutine (self, "Twierdza");
			B_GivePlayerXP (100);
			KIVO_GO = TRUE;
			B_LogEntry (TOPIC_Keroloth_pomoc, "Kivo uda� si� do twierdzy.");
			KerolothMysliwi = KerolothMysliwi + 1;
		};
		if (KIVO_HELP == TRUE) && (WODZOWIE_KILLED == FALSE) {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_02"); //My�l�, �e mog� si� przyda� jeszcze Benito.
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_03"); //Nie rusz� si� st�d, dop�ki on nie za�atwi swoich spraw.
		};
		if (KIVO_HELP == FALSE) && (WODZOWIE_KILLED == FALSE) {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_04"); //Bez porz�dnego miecza si� nie ruszam!
		};
		if (KIVO_HELP == FALSE) && (WODZOWIE_KILLED == TRUE) {
			AI_Output (self, other,"DIA_NASZ_215_Kivo_TrollCanyon_55_05"); //Bez porz�dnego miecza si� nie ruszam!
		};
};

// ************************************************************
// 			  				CanYouTeach
// ************************************************************
instance DIA_NASZ_215_Kivo_CanYouTeach (C_INFO)
{
	npc		 	= NASZ_215_Kivo;
	nr		 	= 100;
	condition	= DIA_NASZ_215_Kivo_CanYouTeach_Condition;
	information	= DIA_NASZ_215_Kivo_CanYouTeach_Info;
	permanent 	= FALSE;
	description	= "Mo�esz mnie czego� nauczy�?";
};

func int DIA_NASZ_215_Kivo_CanYouTeach_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_215_Kivo_CanYouTeach_Info ()
{
	AI_Output (other, self, "DIA_NASZ_215_Kivo_CanYouTeach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_NASZ_215_Kivo_CanYouTeach_08_01"); //Ch�tnie poka�� ci, jak strzela� z �uku.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Stra�nik Kivo podszkoli mnie w �ucznictwie.");	

};

//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_215_Kivo_AmmannQuest   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 39;
 	condition   = DIA_NASZ_215_Kivo_AmmannQuest_Condition;
 	information = DIA_NASZ_215_Kivo_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "We� ten pier�cie�.";
};

FUNC INT DIA_NASZ_215_Kivo_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_215_Kivo_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_215_Kivo_AmmannQuest_15_00"); //We� ten pier�cie�.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_215_Kivo_AmmannQuest_15_01"); //Co to?
	AI_Output (other, self,"DIA_NASZ_215_Kivo_AmmannQuest_15_02"); //Staniesz si� silniejszy walcz�c u boku swoich towarzyszy.
	AI_Output (self, other,"DIA_NASZ_215_Kivo_AmmannQuest_15_03"); //Niewiarygodne... Czas to przetestowa�!

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		PierscienieWiernosciFinish();
	};

};

// ************************************************************
// 			  				TEACH
// ************************************************************

const int Kivo_BOW_MAX = 100;
var int Kivo_Merke_Bow;

func void KivoAddChoicesBOW() {

	if (AlignRequestedAmountToTeacherMax(LEARN_BOW, 1, Kivo_BOW_MAX) > 0) {
		Info_AddChoice		(DIA_Kivo_Teach, BuildLearnString(LEARN_BOW, 1, Kivo_BOW_MAX), DIA_Kivo_Teach_BOW_1); 
	};
	if (AlignRequestedAmountToTeacherMax(LEARN_BOW, 5, Kivo_BOW_MAX) > 1) {
		Info_AddChoice		(DIA_Kivo_Teach, BuildLearnString(LEARN_BOW, 5, Kivo_BOW_MAX), DIA_Kivo_Teach_BOW_5); 
	};

};

func void KivoSay_CantTeachYou() {
	AI_Output(self,other,"KivoSay_CantTeachYou_01_00"); //Niczego wi�cej ci� ju� nie naucz�. Strzelaj, �eby twoja celno�� nie mala�a.
};

func void KivoSay_NoMoney() {
	AI_Output (self, other,"KivoSay_NoMoney_01_00"); //Nie masz do�� z�ota.
};

func void KivoSay_NoExp() {
	AI_Output (self, other,"KivoSay_NoExp_01_00"); //Brak ci do�wiadczenia.
};

INSTANCE DIA_Kivo_Teach   (C_INFO)
{
	npc         = NASZ_215_Kivo;
 	nr          = 100;
 	condition   = DIA_Kivo_Teach_Condition;
 	information = DIA_Kivo_Teach_Info;
 	permanent   = TRUE;
	description = "Chc� si� nauczy� czego� o �ucznictwie.";
};

FUNC INT DIA_Kivo_Teach_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_215_Kivo_CanYouTeach))
	&& (other.HitChance[NPC_TALENT_BOW] < 100)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Kivo_Teach_Info()
{
	AI_Output (other, self, "DIA_NASZ_215_Kivo_TeachBow_15_00"); //Chc� si� nauczy� czego� o �ucznictwie.
	AI_Output (self, other, "DIA_NASZ_215_Kivo_TeachBow_08_01"); //Czego mog� ci� nauczy�?
	
	Kivo_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	
	Info_ClearChoices 	(DIA_Kivo_Teach);
	Info_AddChoice 		(DIA_Kivo_Teach,	DIALOG_BACK		,DIA_Kivo_Teach_Back);
	KivoAddChoicesBOW();
};

FUNC VOID DIA_Kivo_Teach_Back ()
{
	if (Kivo_Merke_Bow < other.HitChance[NPC_TALENT_BOW] && other.HitChance[NPC_TALENT_BOW] < 100)
	{
		AI_Output (self ,other,"DIA_NASZ_215_Kivo_TeachBow_BACK_08_00"); //No i prosz�. Od razu poprawi�a si� twoja celno��.
	};

	Info_ClearChoices (DIA_Kivo_Teach);
};

FUNC VOID DIA_Kivo_Teach_BOW_1 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_BOW,1,Kivo_BOW_MAX)) {
		KivoSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_BOW,1,Kivo_BOW_MAX)) {
		KivoSay_NoExp();
	}
	else {
	
		B_GiveInvItems(other,self,ItMi_Gold,CalculateLearnGoldCost(LEARN_BOW,1,Kivo_BOW_MAX));
		B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, Kivo_BOW_MAX);
	
		if (GetTalentNow(LEARN_BOW) >= Kivo_BOW_MAX)
		{
			KivoSay_CantTeachYou();
			Info_ClearChoices 	(DIA_Kivo_Teach);
			return;
		};
	
		Info_ClearChoices 	(DIA_Kivo_Teach);
		Info_AddChoice 		(DIA_Kivo_Teach,	DIALOG_BACK		,DIA_Kivo_Teach_Back);
		KivoAddChoicesBOW();
	};

};

FUNC VOID DIA_Kivo_Teach_BOW_5 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_BOW,5,Kivo_BOW_MAX)) {
		KivoSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_BOW,5,Kivo_BOW_MAX)) {
		KivoSay_NoExp();
	}
	else {
	
		var int amount; amount = AlignRequestedAmountToTeacherMax(LEARN_BOW,5,Kivo_BOW_MAX);
		B_GiveInvItems(other,self,ItMi_Gold,CalculateLearnGoldCost(LEARN_BOW,amount,Kivo_BOW_MAX));
		B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, amount, Kivo_BOW_MAX);
	
		if (GetTalentNow(LEARN_BOW) >= Kivo_BOW_MAX)
		{
			KivoSay_CantTeachYou();
			Info_ClearChoices 	(DIA_Kivo_Teach);
			return;
		};

		Info_ClearChoices 	(DIA_Kivo_Teach);
		Info_AddChoice 		(DIA_Kivo_Teach,	DIALOG_BACK		,DIA_Kivo_Teach_Back);
		KivoAddChoicesBOW();
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_215_Kivo_PICKPOCKET (C_INFO)
{
	npc			= NASZ_215_Kivo;
	nr			= 900;
	condition	= DIA_NASZ_215_Kivo_PICKPOCKET_Condition;
	information	= DIA_NASZ_215_Kivo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_215_Kivo_PICKPOCKET_Condition()
{
	C_Beklauen (61);
};
 
FUNC VOID DIA_NASZ_215_Kivo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_215_Kivo_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_215_Kivo_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_215_Kivo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_215_Kivo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_215_Kivo_PICKPOCKET_DoIt);
};

func void DIA_NASZ_215_Kivo_PICKPOCKET_DoIt()
{
	B_BeklauenGold(28);
	
	Info_ClearChoices (DIA_NASZ_215_Kivo_PICKPOCKET);
};
	
func void DIA_NASZ_215_Kivo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_215_Kivo_PICKPOCKET);
};
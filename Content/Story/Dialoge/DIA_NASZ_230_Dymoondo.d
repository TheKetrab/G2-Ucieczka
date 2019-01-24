//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_EXIT   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
	nr          = 999;
	condition   = DIA_NASZ_230_Dymoondo_EXIT_Condition;
	information = DIA_NASZ_230_Dymoondo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_230_Dymoondo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_230_Dymoondo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

var int WhereIsErak;
//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_siema   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 1;
 	condition   = DIA_NASZ_230_Dymoondo_siema_Condition;
 	information = DIA_NASZ_230_Dymoondo_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_230_Dymoondo_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_siema_Info()
{
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_siema_15_00"); //Kolejny my�liwy?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_01"); //My�la�em raczej, �e pierwszy.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_02"); //Przewa�nie mo�na spotka� gdzie nie gdzie stra�nik�w, ale wszyscy my�liwi przebywaj� w obozie.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_03"); //No... poza grup� Eraka. Ale to ju� inna bajka. Spotka�e� ich ju� mo�e?

	if (npc_knowsinfo (other, DIA_NASZ_205_Mysliwy_siema)){
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_siema_55_04"); //Tak. Przechadza�em si� ju� troch� po Dolinie...
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_05"); //I bardzo dobrze. Ka�dy powinien zna� to przekl�te miejsce jak w�asn� kiesze�...
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_06"); //Chocia� tak swoj� drog�, taka znajomo�� to absurd.
		}
	else {
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_siema_55_07"); //Nie.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_08"); //Polecam ci si� do nich uda�.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_09"); //Tam na pewno znajdzie si� co nieco do roboty. No i oczywi�cie Erak z pustymi r�koma ci� nie wypu�ci...
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_10"); //No dobra, ze zbyt pe�nymi te�!

		WhereIsErak = TRUE;
	};
	
};

//*********************************************************************
//	Info Where
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_where   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 2;
 	condition   = DIA_NASZ_230_Dymoondo_where_Condition;
 	information = DIA_NASZ_230_Dymoondo_where_Info;
 	permanent   = FALSE;
 	description = "Gdzie znajd� tego Eraka?";
};

FUNC INT DIA_NASZ_230_Dymoondo_where_Condition()
{
	if (WhereIsErak == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_where_Info()
{
	AI_Output (other,self ,"DIA_NASZ_230_Dymoondo_where_15_00"); //Gdzie znajd� tego Eraka?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_01"); //Musisz uda� si� daleko na wsch�d.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_02"); //Najlepszym punktem orientacyjnym jest orkowa palisada.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_03"); //Id� wzd�u� niej, a gdy na swojej drodze napotkasz w�w�z nie do sforsowania, udaj si� w g�r�.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_04"); //Wtedy nawet �lepy zobaczy�by to obozowisko.
	AI_Output (other,self ,"DIA_NASZ_230_Dymoondo_where_15_05"); //Dzi�ki, b�d� o tym pami�ta�, gdy jaki� wilk wy�re mi oczy.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_06"); //Wilki to naj�agodniejsze stworzenia, kt�re mo�esz spotka� w tym przekl�tym miejscu... 
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_07"); //No dobra, chrz�szcze!

};

//*********************************************************************
//	         Place
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_place   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 3;
 	condition   = DIA_NASZ_230_Dymoondo_place_Condition;
 	information = DIA_NASZ_230_Dymoondo_place_Info;
 	permanent   = FALSE;
 	description = "Co tu robisz?";
};

FUNC INT DIA_NASZ_230_Dymoondo_place_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_230_Dymoondo_siema))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_place_Info()
{
	AI_Output (other,self ,"DIA_NASZ_230_Dymoondo_place_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_01"); //W�a�ciwie to my�liwym zosta�em niedawno. Wys�ano mnie na polowanie, �ebym si� czego� nauczy�.
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_place_55_02"); //Wi�c dlaczego nie jeste� razem z Erakiem?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_03"); //Erak ma swoich ludzi. Bardzo lubi pomoc, ale wsp�pracownikowi, szczeg�lnie my�liwemu, trzeba bezgranicznie ufa�.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_04"); //Zdarza si�, �e jeden podchodzi do zwierz�cia od przodu, a w tym czasie drugi strzela do bestii z przeciwnej strony.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_05"); //Gdyby ten pierwszy skupia� si� na tym, �eby nie sko�czy� ze strza�� w g�owie, sko�czy�by z k�ami w g�owie.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_06"); //Zreszt� to by� pomys� Gestatha. Mam si� uczy� i zdobywa� do�wiadczenie sam.
};


//*********************************************************************
//	         What
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_what   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 4;
 	condition   = DIA_NASZ_230_Dymoondo_what_Condition;
 	information = DIA_NASZ_230_Dymoondo_what_Info;
 	permanent   = FALSE;
 	description = "Samemu nie jest niebezpiecznie?";
};

FUNC INT DIA_NASZ_230_Dymoondo_what_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_230_Dymoondo_place))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_230_Dymoondo_what_15_00"); //Samemu nie jest niebezpiecznie?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_what_55_01"); //Wiesz... Najgorzej jest w nocy. Wtedy zwierz�ta zyskuj� nad nami przewag�, bo gorzej widzimy.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_what_55_02"); //Dlatego trzeba si� dobrze zabezpieczy�: Odpowiednie barykady i pu�apki to podstawa.

};

//*********************************************************************
//	         Help
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_help   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 5;
 	condition   = DIA_NASZ_230_Dymoondo_help_Condition;
 	information = DIA_NASZ_230_Dymoondo_help_Info;
 	permanent   = FALSE;
 	description = "Mog� ci jako� pom�c?";
};

FUNC INT DIA_NASZ_230_Dymoondo_help_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_230_Dymoondo_siema))

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_help_Info()
{
	AI_Output (other,self ,"DIA_NASZ_230_Dymoondo_help_15_00"); //Mog� ci jako� pom�c?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_01"); //W sumie...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_02"); //Czekaj, czekaj my�l�...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_03"); //My�l�, my�l�...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_04"); //Mam!
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_05"); //S�uchaj. Jak ju� wspomnia�em, jestem pocz�tkuj�cym my�liwym.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_06"); //Nie wiem zbyt wiele o zbieraniu trofe�w. Umiem zdejmowa� futra i wyrywa� k�y, chocia� bardzo tego nie lubi�, bo musz� grzeba� w paszczy ofiary...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_07"); //Chcia�bym nauczy� si� wyci�gania pazur�w. Hunt uwielbia pazury!
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_08"); //Powiedz mi jak to zrobi�.

	Log_CreateTopic (TOPIC_Dymoondo_nauka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dymoondo_nauka, LOG_RUNNING);
	B_LogEntry (TOPIC_Dymoondo_nauka, "Dymoondo chcia�by nauczy� si� wyci�ga� pazury. Kto� powinien przekaza� mu t� wiedz�...");

};

var int DYMOONDO_PAZURY;
//*********************************************************************
//	         Teach
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_teach   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 6;
 	condition   = DIA_NASZ_230_Dymoondo_teach_Condition;
 	information = DIA_NASZ_230_Dymoondo_teach_Info;
 	permanent   = TRUE;
 	description = "Powiem ci, co wiem o pazurach.";
};

FUNC INT DIA_NASZ_230_Dymoondo_teach_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_230_Dymoondo_help)
		&& (!DYMOONDO_PAZURY))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_teach_Info()
{
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_teach_55_00"); //Powiem ci, co wiem o pazurach.

	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == TRUE){
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_teach_15_01"); //�eby oderwa� pazury zwierz�cia, musisz wykona� bardzo precyzyjne ci�cie.
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_teach_15_02"); //Skrzy�uj lekko r�ce, a potem silnie pchnij.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_teach_55_03"); //To wszystko?
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_teach_15_04"); //Tak.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_teach_55_05"); //Innosie! Przecie� to wcale nie jest takie trudne.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_teach_55_06"); //Dzi�ki przyjacielu.

		DYMOONDO_PAZURY = TRUE;
		DodajReputacje (1, REP_MYSLIWI);
		B_GivePlayerXP (300);
		B_LogEntry (TOPIC_Dymoondo_nauka, "Teraz ch�opak potrafi wyci�ga� pazury.");
		Log_SetTopicStatus (TOPIC_Dymoondo_nauka, LOG_SUCCESS);		
		}
	else { 	
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_teach_15_07"); //�eby przekaza� mi wiedz�, najpierw musisz sam si� tego nauczy�. Nie s�dzisz?
	};
};


//*********************************************************************
//	         polowanie
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_polowanie   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 6;
 	condition   = DIA_NASZ_230_Dymoondo_polowanie_Condition;
 	information = DIA_NASZ_230_Dymoondo_polowanie_Info;
 	permanent   = FALSE;
 	description = "Chcesz do��czy� do mnie i Chrisa?";
};

FUNC INT DIA_NASZ_230_Dymoondo_polowanie_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_228_Chris_MightDymoondo))
	&& !(npc_knowsinfo (other, DIA_NASZ_228_Chris_bye))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_polowanie_Info()
{
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_polowanie_55_00"); //Chcesz do��czy� do mnie i Chrisa?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_polowanie_55_01"); //Idziecie do lasu? Ttrzeba bardzo uwa�a�. Przed chwil� s�ysza�em wycie, ale to nie by�o wycie wilka.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_polowanie_55_02"); //We trzech b�dziemy mieli wi�ksze szanse. P�jd� z wami!
	
	Npc_ExchangeRoutine(self,"Follow");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_230_Dymoondo);
	AI_StopProcessInfos(self);
	
};

//*********************************************************************
//	         Kap4
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_Kap4   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 7;
 	condition   = DIA_NASZ_230_Dymoondo_Kap4_Condition;
 	information = DIA_NASZ_230_Dymoondo_Kap4_Info;
 	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_NASZ_230_Dymoondo_Kap4_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_whatnow)
		&& (Npc_GetDistToWP	(self, "OW_PATH_3_06") < 1000))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_Kap4_Info()
{
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_55_00"); //Hej! Nie mia�by� ochoty sprawdzi� tej �cie�ki?
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_Kap4_15_01"); //Jakiej niby �cie�ki?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_15_02"); //No tej do g�ry. Wyskocz po ska�ach. Nie jestem do ko�ca pewien, ale chyba da si� t�dy przej�� do miasta ork�w.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_55_03"); //Ostatnio widywa�em dziwne �wiat�a po drugiej stronie bajorka obok mojego obozowiska i w zasadzie mia�em to sprawdzi�...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_15_04"); //Ale skoro przyszed� tu taki osi�ek jak ty...
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_Kap4_55_05"); //Dobra, sprawdz� to przej�cie.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_55_06"); //Fantastycznie! Ja wracam do siebie.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_55_07"); //Powodzenia!

	Npc_ExchangeRoutine (self, "Start");
	B_LogEntry (TOPIC_Monastir_pomoc, "Dymoondo twierdzi, �e znalaz� drog� do miasta ork�w. Musz� si� wspi�� po ska�ach na �cie�ce mi�dzy obozem bandyt�w a obozem my�liwych.");

};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_230_Dymoondo_HowAreYou   (C_INFO)
{
	npc         = NASZ_230_Dymoondo;
 	nr          = 500;
 	condition   = DIA_NASZ_230_Dymoondo_HowAreYou_Condition;
 	information = DIA_NASZ_230_Dymoondo_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak idzie polowanie?";
};

FUNC INT DIA_NASZ_230_Dymoondo_HowAreYou_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_230_Dymoondo_place))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_230_Dymoondo_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_HowAreYou_15_00"); //Jak idzie polowanie?
	
	if (KAPITEL < 3)
	{
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_HowAreYou_55_01"); //�ycie w dziczy wiele mnie nauczy�o.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_HowAreYou_55_02"); //Ale przede mn� jeszcze d�uga droga, �eby zosta� mistrzem.		
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_HowAreYou_55_03"); //Na tereny �owieckie przybywaj� coraz gro�niejsze istoy.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_HowAreYou_55_04"); //Mo�liwe, �e b�d� musia� wkr�tce opu�ci� to miejsce.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_230_Dymoondo_PICKPOCKET (C_INFO)
{
	npc			= NASZ_230_Dymoondo;
	nr			= 900;
	condition	= DIA_NASZ_230_Dymoondo_PICKPOCKET_Condition;
	information	= DIA_NASZ_230_Dymoondo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_230_Dymoondo_PICKPOCKET_Condition()
{
	C_Beklauen (27);
};
 
FUNC VOID DIA_NASZ_230_Dymoondo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_230_Dymoondo_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_230_Dymoondo_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_230_Dymoondo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_230_Dymoondo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_230_Dymoondo_PICKPOCKET_DoIt);
};

func void DIA_NASZ_230_Dymoondo_PICKPOCKET_DoIt()
{
	B_BeklauenGold(33);
	
	Info_ClearChoices (DIA_NASZ_230_Dymoondo_PICKPOCKET);
};
	
func void DIA_NASZ_230_Dymoondo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_230_Dymoondo_PICKPOCKET);
};
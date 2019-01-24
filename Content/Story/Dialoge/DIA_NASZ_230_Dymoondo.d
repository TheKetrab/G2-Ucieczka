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
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_siema_15_00"); //Kolejny myœliwy?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_01"); //Myœla³em raczej, ¿e pierwszy.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_02"); //Przewa¿nie mo¿na spotkaæ gdzie nie gdzie stra¿ników, ale wszyscy myœliwi przebywaj¹ w obozie.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_03"); //No... poza grup¹ Eraka. Ale to ju¿ inna bajka. Spotka³eœ ich ju¿ mo¿e?

	if (npc_knowsinfo (other, DIA_NASZ_205_Mysliwy_siema)){
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_siema_55_04"); //Tak. Przechadza³em siê ju¿ trochê po Dolinie...
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_05"); //I bardzo dobrze. Ka¿dy powinien znaæ to przeklête miejsce jak w³asn¹ kieszeñ...
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_06"); //Chocia¿ tak swoj¹ drog¹, taka znajomoœæ to absurd.
		}
	else {
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_siema_55_07"); //Nie.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_08"); //Polecam ci siê do nich udaæ.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_09"); //Tam na pewno znajdzie siê co nieco do roboty. No i oczywiœcie Erak z pustymi rêkoma ciê nie wypuœci...
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_siema_55_10"); //No dobra, ze zbyt pe³nymi te¿!

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
 	description = "Gdzie znajdê tego Eraka?";
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
	AI_Output (other,self ,"DIA_NASZ_230_Dymoondo_where_15_00"); //Gdzie znajdê tego Eraka?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_01"); //Musisz udaæ siê daleko na wschód.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_02"); //Najlepszym punktem orientacyjnym jest orkowa palisada.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_03"); //IdŸ wzd³u¿ niej, a gdy na swojej drodze napotkasz w¹wóz nie do sforsowania, udaj siê w górê.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_04"); //Wtedy nawet œlepy zobaczy³by to obozowisko.
	AI_Output (other,self ,"DIA_NASZ_230_Dymoondo_where_15_05"); //Dziêki, bêdê o tym pamiêta³, gdy jakiœ wilk wy¿re mi oczy.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_06"); //Wilki to naj³agodniejsze stworzenia, które mo¿esz spotkaæ w tym przeklêtym miejscu... 
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_where_55_07"); //No dobra, chrz¹szcze!

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
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_01"); //W³aœciwie to myœliwym zosta³em niedawno. Wys³ano mnie na polowanie, ¿ebym siê czegoœ nauczy³.
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_place_55_02"); //Wiêc dlaczego nie jesteœ razem z Erakiem?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_03"); //Erak ma swoich ludzi. Bardzo lubi pomoc, ale wspó³pracownikowi, szczególnie myœliwemu, trzeba bezgranicznie ufaæ.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_04"); //Zdarza siê, ¿e jeden podchodzi do zwierzêcia od przodu, a w tym czasie drugi strzela do bestii z przeciwnej strony.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_05"); //Gdyby ten pierwszy skupia³ siê na tym, ¿eby nie skoñczyæ ze strza³¹ w g³owie, skoñczy³by z k³ami w g³owie.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_place_55_06"); //Zreszt¹ to by³ pomys³ Gestatha. Mam siê uczyæ i zdobywaæ doœwiadczenie sam.
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
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_what_55_01"); //Wiesz... Najgorzej jest w nocy. Wtedy zwierzêta zyskuj¹ nad nami przewagê, bo gorzej widzimy.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_what_55_02"); //Dlatego trzeba siê dobrze zabezpieczyæ: Odpowiednie barykady i pu³apki to podstawa.

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
 	description = "Mogê ci jakoœ pomóc?";
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
	AI_Output (other,self ,"DIA_NASZ_230_Dymoondo_help_15_00"); //Mogê ci jakoœ pomóc?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_01"); //W sumie...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_02"); //Czekaj, czekaj myœlê...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_03"); //Myœlê, myœlê...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_04"); //Mam!
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_05"); //S³uchaj. Jak ju¿ wspomnia³em, jestem pocz¹tkuj¹cym myœliwym.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_06"); //Nie wiem zbyt wiele o zbieraniu trofeów. Umiem zdejmowaæ futra i wyrywaæ k³y, chocia¿ bardzo tego nie lubiê, bo muszê grzebaæ w paszczy ofiary...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_07"); //Chcia³bym nauczyæ siê wyci¹gania pazurów. Hunt uwielbia pazury!
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_help_55_08"); //Powiedz mi jak to zrobiæ.

	Log_CreateTopic (TOPIC_Dymoondo_nauka, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Dymoondo_nauka, LOG_RUNNING);
	B_LogEntry (TOPIC_Dymoondo_nauka, "Dymoondo chcia³by nauczyæ siê wyci¹gaæ pazury. Ktoœ powinien przekazaæ mu tê wiedzê...");

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
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_teach_15_01"); //¯eby oderwaæ pazury zwierzêcia, musisz wykonaæ bardzo precyzyjne ciêcie.
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_teach_15_02"); //Skrzy¿uj lekko rêce, a potem silnie pchnij.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_teach_55_03"); //To wszystko?
		AI_Output (other, self,"DIA_NASZ_230_Dymoondo_teach_15_04"); //Tak.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_teach_55_05"); //Innosie! Przecie¿ to wcale nie jest takie trudne.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_teach_55_06"); //Dziêki przyjacielu.

		DYMOONDO_PAZURY = TRUE;
		DodajReputacje (1, REP_MYSLIWI);
		B_GivePlayerXP (300);
		B_LogEntry (TOPIC_Dymoondo_nauka, "Teraz ch³opak potrafi wyci¹gaæ pazury.");
		Log_SetTopicStatus (TOPIC_Dymoondo_nauka, LOG_SUCCESS);		
		}
	else { 	
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_teach_15_07"); //¯eby przekazaæ mi wiedzê, najpierw musisz sam siê tego nauczyæ. Nie s¹dzisz?
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
 	description = "Chcesz do³¹czyæ do mnie i Chrisa?";
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
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_polowanie_55_00"); //Chcesz do³¹czyæ do mnie i Chrisa?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_polowanie_55_01"); //Idziecie do lasu? Ttrzeba bardzo uwa¿aæ. Przed chwil¹ s³ysza³em wycie, ale to nie by³o wycie wilka.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_polowanie_55_02"); //We trzech bêdziemy mieli wiêksze szanse. Pójdê z wami!
	
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
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_55_00"); //Hej! Nie mia³byœ ochoty sprawdziæ tej œcie¿ki?
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_Kap4_15_01"); //Jakiej niby œcie¿ki?
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_15_02"); //No tej do góry. Wyskocz po ska³ach. Nie jestem do koñca pewien, ale chyba da siê têdy przejœæ do miasta orków.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_55_03"); //Ostatnio widywa³em dziwne œwiat³a po drugiej stronie bajorka obok mojego obozowiska i w zasadzie mia³em to sprawdziæ...
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_15_04"); //Ale skoro przyszed³ tu taki osi³ek jak ty...
	AI_Output (other, self,"DIA_NASZ_230_Dymoondo_Kap4_55_05"); //Dobra, sprawdzê to przejœcie.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_55_06"); //Fantastycznie! Ja wracam do siebie.
	AI_Output (self, other,"DIA_NASZ_230_Dymoondo_Kap4_55_07"); //Powodzenia!

	Npc_ExchangeRoutine (self, "Start");
	B_LogEntry (TOPIC_Monastir_pomoc, "Dymoondo twierdzi, ¿e znalaz³ drogê do miasta orków. Muszê siê wspi¹æ po ska³ach na œcie¿ce miêdzy obozem bandytów a obozem myœliwych.");

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
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_HowAreYou_55_01"); //¯ycie w dziczy wiele mnie nauczy³o.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_HowAreYou_55_02"); //Ale przede mn¹ jeszcze d³uga droga, ¿eby zostaæ mistrzem.		
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_HowAreYou_55_03"); //Na tereny ³owieckie przybywaj¹ coraz groŸniejsze istoy.
		AI_Output (self, other,"DIA_NASZ_230_Dymoondo_HowAreYou_55_04"); //Mo¿liwe, ¿e bêdê musia³ wkrótce opuœciæ to miejsce.
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
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_EXIT   (C_INFO)
{
	npc         = NASZ_227_Vachut;
	nr          = 999;
	condition   = DIA_NASZ_227_Vachut_EXIT_Condition;
	information = DIA_NASZ_227_Vachut_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_227_Vachut_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_227_Vachut_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_siema   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 1;
 	condition   = DIA_NASZ_227_Vachut_siema_Condition;
 	information = DIA_NASZ_227_Vachut_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_227_Vachut_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_227_Vachut_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_227_Vachut_siema_15_00"); //Hej, ty!
	AI_Output (self, other,"DIA_NASZ_227_Vachut_siema_55_01"); //Nie widzia³em ciê jeszcze. Wygl¹dasz bardzo kiepsko. Pracowa³eœ w kopalni, prawda?
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_siema_15_02"); //Tak, nazywam siê Will.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_siema_55_03"); //Witaj zatem. Dobrze, ¿e twój koszmar ju¿ siê skoñczy³, ale przed tob¹ kolejny: Górnicza Dolina.

};

//*********************************************************************
//	Info Where
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_where   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 2;
 	condition   = DIA_NASZ_227_Vachut_where_Condition;
 	information = DIA_NASZ_227_Vachut_where_Info;
 	permanent   = FALSE;
 	description = "Sk¹d pochodzisz?";
};

FUNC INT DIA_NASZ_227_Vachut_where_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_227_Vachut_where_Info()
{
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_where_15_00"); //Sk¹d pochodzisz?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_where_55_01"); //Moja ciemna karnacja ciê ciekawi?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_where_55_02"); //Jestem, a raczej by³em, ³owc¹ nagród na pustyni Varant.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_where_55_04"); //Los tak chcia³, ¿e kiedy przyby³em do Khorinis, by polowaæ na smoki, okaza³o siê, ¿e ktoœ mnie ju¿ uprzedzi³.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_where_55_05"); //Taki kawa³ drogi na nic. Wyobra¿asz to sobie?
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_where_15_06"); //Czy s¹ tu jeszcze jacyœ inni ³owcy smoków?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_where_55_07"); //Tak, bawi¹ siê w gladiatorów, mimo ¿e zw¹ siê teraz ³owcami orków. To jakieœ nieporozumienie. 

};

//*********************************************************************
//	         Place
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_place   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 3;
 	condition   = DIA_NASZ_227_Vachut_place_Condition;
 	information = DIA_NASZ_227_Vachut_place_Info;
 	permanent   = FALSE;
 	description = "Ale ty nie jesteœ ³owc¹ orków...";
};

FUNC INT DIA_NASZ_227_Vachut_place_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_227_Vachut_where))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_place_Info()
{
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_place_15_00"); //Ale ty nie jesteœ ³owc¹ orków...
	AI_Output (self, other,"DIA_NASZ_227_Vachut_place_55_01"); //Tak, to prawda. Do³¹czy³em do myœliwych i razem próbujemy przetrwaæ w tym miejscu.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_place_55_02"); //Swoj¹ drog¹ zapewne nie wiesz, gdzie jest nasz obóz. Mogê ciê tam zaprowadziæ, jeœli chcesz.

	B_LogEntry (TOPIC_gildia, "Vachut zaprowadzi mnie do obozu myœliwych.");

};


//*********************************************************************
//	         What
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_what   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 4;
 	condition   = DIA_NASZ_227_Vachut_what_Condition;
 	information = DIA_NASZ_227_Vachut_what_Info;
 	permanent   = FALSE;
 	description = "Co tu robisz?";
};

FUNC INT DIA_NASZ_227_Vachut_what_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_227_Vachut_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_what_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_what_55_01"); //Polujê. To znaczy nie w tej chwili, oczywiœcie.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_what_55_02"); //Przez ca³e swoje ¿ycie mieszka³em na pustyni, wiêc znam wiele ca³kiem nietypowych metod przetrwania.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_what_55_03"); //Te rejony s¹ zamieszkane przez topielców i to w³aœnie one s¹ moim celem.

};

//*********************************************************************
//	         Smell
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_smell   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 5;
 	condition   = DIA_NASZ_227_Vachut_smell_Condition;
 	information = DIA_NASZ_227_Vachut_smell_Info;
 	permanent   = FALSE;
 	description = "Sk¹d ten smród?";
};

FUNC INT DIA_NASZ_227_Vachut_smell_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_227_Vachut_smell_Info()
{
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_smell_15_00"); //Sk¹d ten smród?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_smell_55_01"); //Rozejrzyj siê dooko³a. Wszêdzie porozwiesza³em skóry, jêzyki i pazury topielców.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_smell_55_02"); //Nie domyœli³eœ siê, ¿e to one s¹ Ÿród³em?
	AI_Output (other, self,"DIA_NASZ_227_Vachut_smell_55_03"); //Mia³em bardziej na myœli to, czemu ma s³u¿yæ ogo³acanie topielców z ich cz³onków.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_smell_55_04"); //A, o to ci chodzi... Widzisz, z ró¿nych czêœci topielców mo¿na wyrabiaæ trucizny.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_smell_55_05"); //Zajmowa³em siê tym, mieszkaj¹c na pustyni. Zatrute strza³y i miecze to podstawowy asortyment w dzikich zak¹tkach Varantu.
	AI_Output (other, self,"DIA_NASZ_227_Vachut_smell_55_06"); //Móg³byœ nauczyæ mnie sporz¹dzania trucizn?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_smell_55_07"); //Nie zrobiê tego, przyjacielu. To rzemios³o nie jest wiedz¹, któr¹ chêtnie siê dzielê.
	
};

//*********************************************************************
//	         Can
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_can   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 6;
 	condition   = DIA_NASZ_227_Vachut_can_Condition;
 	information = DIA_NASZ_227_Vachut_can_Info;
 	permanent   = FALSE;
 	description = "Mo¿esz mnie nauczyæ czegoœ specjalnego?";
};

FUNC INT DIA_NASZ_227_Vachut_can_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_227_Vachut_what))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_can_Info()
{
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_can_15_00"); //Mo¿esz mnie nauczyæ czegoœ specjalnego?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_can_55_01"); //Oczywiœcie. Mogê nauczyæ ciê regeneracji. Im lepiej opanujesz tê sztukê, tym lepiej dla ciebie.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_can_55_02"); //Ale bêdzie ciê to doœæ sporo kosztowa³o...

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Vachut w Varancie pozna³ sztukê regeneracji. Mo¿e przekazaæ mi wiedzê na ten temat.");
};

var int VACHUT_PROWADZENIE;
var int VachutZaprowadzil;
//*********************************************************************
//	         Follow
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_follow   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 7;
 	condition   = DIA_NASZ_227_Vachut_follow_Condition;
 	information = DIA_NASZ_227_Vachut_follow_Info;
 	permanent   = TRUE;
 	description = "ZaprowadŸ mnie do obozu myœliwych.";
};

FUNC INT DIA_NASZ_227_Vachut_follow_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_227_Vachut_place) && (VACHUT_PROWADZENIE == FALSE)) && (VachutZaprowadzil == FALSE)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_follow_Info()
{
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_follow_15_00"); //ZaprowadŸ mnie do obozu myœliwych.

	if (KORTH_PROWADZENIE == TRUE) {
		AI_Output (self, other,"DIA_NASZ_227_Vachut_follow_55_01"); //Teraz idziesz z Korthem. Wróæ do mnie, gdy ju¿ za³atwicie swoje sprawy.
	}
	else {
		AI_Output (self, other,"DIA_NASZ_227_Vachut_follow_55_02"); //W drogê!

		VACHUT_PROWADZENIE = TRUE;
		Npc_ExchangeRoutine (NASZ_227_Vachut, "Guide");
		//self.aivar[AIV_PARTYMEMBER] = TRUE;
		Druzyna (NASZ_227_Vachut,1);
		AI_StopProcessInfos(self);
	};

};

//*********************************************************************
//	         Bye
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_bye   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 8;
 	condition   = DIA_NASZ_227_Vachut_bye_Condition;
 	information = DIA_NASZ_227_Vachut_bye_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_227_Vachut_bye_Condition()	
{
	if (VACHUT_PROWADZENIE == TRUE)
		&& (Npc_GetDistToWP	(NASZ_227_Vachut, "SPAWN_PATH_GUARD1") <=500)
		//&& (Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_NC_7_1"))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_bye_Info()
{
	AI_Output (self, other,"DIA_NASZ_227_Vachut_bye_55_00"); //IdŸ jeszcze kawa³ek do góry i skrêæ w lewo, we wnêkê. Ja ju¿ muszê wracaæ, bo jeszcze jakieœ topielce zrobi¹ ba³agan w moim obozowisku.
	AI_Output (other,self ,"DIA_NASZ_227_Vachut_bye_15_01"); //Dziêki za pomoc.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_bye_55_02"); //Zajrzyj jeszcze kiedyœ do mnie. Mi³o siê z tob¹ gawêdzi.

	VachutZaprowadzil = TRUE;
	VACHUT_PROWADZENIE = FALSE;
	DodajReputacje (1, REP_MYSLIWI);
	Npc_ExchangeRoutine (NASZ_227_Vachut, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_227_Vachut,0);
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info GoToRenegaci
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_GoToRenegaci   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 4;
 	condition   = DIA_NASZ_227_Vachut_GoToRenegaci_Condition;
 	information = DIA_NASZ_227_Vachut_GoToRenegaci_Info;
 	permanent   = FALSE;
	description = "Przy³¹czysz siê do ataku na Star¹ Kopalniê?";
};

FUNC INT DIA_NASZ_227_Vachut_GoToRenegaci_Condition()	
{
	if (GestathRenegatOK == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_GoToRenegaci_Info()
{
	AI_Output (other, self,"DIA_NASZ_227_Vachut_GoToRenegaci_15_00"); //Przy³¹czysz siê do ataku na Star¹ Kopalniê?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_GoToRenegaci_55_01"); //Myœliwym potrzeba rudy, czy o co chodzi?
	AI_Output (other, self,"DIA_NASZ_227_Vachut_GoToRenegaci_55_02"); //Kopalniê okupuje opêtany przez Beliara paladyn renegat. Na jego ³asce wci¹¿ s¹ moi przyjaciele.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_GoToRenegaci_55_03"); //Rozumiem, chcesz ich uratowaæ. W takim razie s³u¿ê pomoc¹!
	
	Npc_ExchangeRoutine (self, "FollowRenegaci");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_227_Vachut,1);
};




//*********************************************************************
//	         QuestKapThree
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_QuestKapThree   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 30;
 	condition   = DIA_NASZ_227_Vachut_QuestKapThree_Condition;
 	information = DIA_NASZ_227_Vachut_QuestKapThree_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_227_Vachut_QuestKapThree_Condition()	
{
	if (KAPITEL>=3)
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_QuestKapThree_Info()
{
	AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestKapThree_15_00"); //W koñcu widzê kogoœ, kto mo¿e mi pomóc!
	AI_Output (other, self,"DIA_NASZ_227_Vachut_QuestKapThree_55_01"); //Do czego zmierzasz?
	AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestKapThree_55_02"); //Niedaleko st¹d widzia³em dziwne topielce. Wydawa³y siê trochê wiêksze i bardziej agresywne... Widzia³em, jak urywa³y g³owê jednemu wilkowi.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestKapThree_55_03"); //Niby zawodowo ubijam topielce, ale wola³bym przy nich mieæ kogoœ przy sobie.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestKapThree_55_04"); //Wybierzesz siê ze mn¹?

	Log_CreateTopic (TOPIC_Vachut_topielce, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Vachut_topielce, LOG_RUNNING);
	B_LogEntry (TOPIC_Vachut_topielce, "Vachut zauwa¿y³, ¿e w jego okolicy pojawi³y siê dziwne topielce. Nie chce do nich podchodziæ sam i poprosi³ mnie o towarzystwo.");

};

var int WyruszylesZVachutem;
//*********************************************************************
//	         QuestOK
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_QuestOK   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 31;
 	condition   = DIA_NASZ_227_Vachut_QuestOK_Condition;
 	information = DIA_NASZ_227_Vachut_QuestOK_Info;
 	permanent   = TRUE;
 	description = "Dobra, chodŸmy zapolowaæ.";
};

FUNC INT DIA_NASZ_227_Vachut_QuestOK_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_227_Vachut_QuestKapThree)) && (WyruszylesZVachutem == FALSE)
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_QuestOK_Info()
{
	AI_Output (other, self,"DIA_NASZ_227_Vachut_QuestOK_15_00"); //Dobra, chodŸmy zapolowaæ.
	
	if (ProwadziszKerolothaDoTwierdzy == FALSE)
	{
		AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestOK_55_01"); //Za mn¹!

		WyruszylesZVachutem = TRUE;
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self, "Topielce");
		//self.aivar[AIV_PARTYMEMBER] = TRUE;
		Druzyna (NASZ_227_Vachut,1);
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestOK_55_02"); //Idziesz teraz z Kerolothem. Zróbcie swoje, potem mi pomo¿esz.
	};
};

//*********************************************************************
//	         QuestPlace
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_QuestPlace   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 32;
 	condition   = DIA_NASZ_227_Vachut_QuestPlace_Condition;
 	information = DIA_NASZ_227_Vachut_QuestPlace_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_227_Vachut_QuestPlace_Condition()	
{
	if (Npc_GetDistToWP(self,"NASZ_BANDYCI_WODOSPAD_04") < 500
	 && npc_isdead(Topielec_Wsciekly_A)
	 && npc_isdead(Topielec_Wsciekly_B)
	 && npc_isdead(Topielec_Wsciekly_C)
	 && npc_isdead(Topielec_Wsciekly_D)
	 && npc_isdead(Topielec_Wsciekly_E)
	 && npc_isdead(Topielec_Wsciekly_F)
	 && (KAPITEL == 3))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_QuestPlace_Info()
{
	AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestPlace_15_00"); //Sam z pewnoœci¹ nie da³bym rady.
	AI_Output (other, self,"DIA_NASZ_227_Vachut_QuestPlace_55_01"); //Cieszê siê, ¿e mog³em pomóc.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestPlace_55_02"); //Te topielce maj¹ wyj¹tkowo twarde pazury... Gdybyœ spotka³ jeszcze jakieœ to przynieœ mi je.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestPlace_55_03"); //Za ka¿d¹ sztukê dostaniesz dziesiêæ z³otych monet.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_QuestPlace_55_04"); //A co do zap³aty... Proszê, weŸ te skóry. Hunt na pewno ci za nie zap³aci.

	Createinvitems (self, ItNa_BlackWolfFur, 6);
	B_Giveinvitems (self, other, ItNa_BlackWolfFur, 6);

	Log_SetTopicStatus (TOPIC_Vachut_topielce, LOG_SUCCESS);
	B_LogEntry (TOPIC_Vachut_topielce, "Cholera jasna! Te topielce prawie nas dopad³y! Ciekawe, sk¹d mog³y siê tutaj w ogóle wzi¹æ? Có¿, przynajmniej kilkoro z nich ju¿ nie ma, a za pazury z tych bestii Vachut p³aci 10 sztuk z³ota za sztukê.");

	B_GivePlayerXP (700);
	DodajReputacje(4,REP_MYSLIWI);
	Npc_ExchangeRoutine (self, "Start");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_227_Vachut,0);
};

var int VACHUT_HELP;
//*********************************************************************
//	         TrollCanyon
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_TrollCanyon   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 33;
 	condition   = DIA_NASZ_227_Vachut_TrollCanyon_Condition;
 	information = DIA_NASZ_227_Vachut_TrollCanyon_Info;
 	permanent   = TRUE;
 	description = "Musisz udaæ siê do Kanionu Trolli.";
};

FUNC INT DIA_NASZ_227_Vachut_TrollCanyon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth)
		&& (!VACHUT_HELP))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_TrollCanyon_Info()
{
	AI_Output (other, self,"DIA_NASZ_227_Vachut_TrollCanyon_15_00"); //Musisz udaæ siê do Kanionu Trolli.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_TrollCanyon_55_01"); //Co? Dlaczego?
	AI_Output (other, self,"DIA_NASZ_227_Vachut_TrollCanyon_15_02"); //Keroloth szykuje siê do bitwy z orkami. Potrzebuje strzelców.
		if (npc_knowsinfo (other, DIA_NASZ_227_Vachut_QuestPlace)) {

			AI_Output (self, other,"DIA_NASZ_227_Vachut_TrollCanyon_55_03"); //Hmm... Dobra! W sumie i tak nie mam tu ju¿ nic do roboty.
			B_GivePlayerXP (100);
			Npc_ExchangeRoutine (self, "Twierdza");
			VACHUT_HELP = TRUE;
			B_LogEntry (TOPIC_Keroloth_pomoc, "Vachut uda³ siê do twierdzy.");
			KerolothMysliwi = KerolothMysliwi + 1;
		}
		else {
			AI_Output (self, other,"DIA_NASZ_227_Vachut_TrollCanyon_55_04"); //Oj, nie nie! Najpierw muszê siê pozbyæ topielców.
		};
};

//*********************************************************************
//	         AmmannQuest
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_AmmannQuest   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 34;
 	condition   = DIA_NASZ_227_Vachut_AmmannQuest_Condition;
 	information = DIA_NASZ_227_Vachut_AmmannQuest_Info;
 	permanent   = FALSE;
 	description = "WeŸ ten pierœcieñ.";
};

FUNC INT DIA_NASZ_227_Vachut_AmmannQuest_Condition()	
{
	if (AmmannQuestKontynuacja == TRUE) && (npc_hasitems (other, ItNa_Wiernosc) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_AmmannQuest_Info()
{
	AI_Output (other, self,"DIA_NASZ_227_Vachut_AmmannQuest_15_00"); //WeŸ ten pierœcieñ.
	B_giveinvitems (other, self, ItNa_Wiernosc, 1);
	AI_Output (self, other,"DIA_NASZ_227_Vachut_AmmannQuest_15_01"); //Myœlisz, ¿e bez niego nie damy sobie rady?
	AI_Output (other, self,"DIA_NASZ_227_Vachut_AmmannQuest_15_02"); //Mam nadziejê, ¿e w ogóle DAMY SOBIE RADÊ.

	AmmannQuestLiczba = AmmannQuestLiczba + 1;
	if (AmmannQuestLiczba >= 7)
	{
		PierscienieWiernosciFinish();
	};

};

//*********************************************************************
//	         SellLurkerClaw
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_SellLurkerClaw   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 99;
 	condition   = DIA_NASZ_227_Vachut_SellLurkerClaw_Condition;
 	information = DIA_NASZ_227_Vachut_SellLurkerClaw_Info;
 	permanent   = TRUE;
 	description = "Mam dla ciebie pazury topielców.";
};

FUNC INT DIA_NASZ_227_Vachut_SellLurkerClaw_Condition()	
{
	if (npc_hasitems (other, ItNa_PazurWscieklegoTopielca) >= 1)
		&& (npc_knowsinfo (other, DIA_NASZ_227_Vachut_QuestPlace))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_SellLurkerClaw_Info()
{
	AI_Output (other, self,"DIA_NASZ_227_Vachut_SellLurkerClaw_15_00"); //Mam dla ciebie pazury topielców.
	AI_Output (self, other,"DIA_NASZ_227_Vachut_SellLurkerClaw_55_01"); //Œwietnie. Masz tu zap³atê. Zgodnie z umow¹.

	B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItNa_PazurWscieklegoTopielca) * 10) );
	B_GiveInvItems(other, self, ItNa_PazurWscieklegoTopielca, Npc_HasItems(other, ItNa_PazurWscieklegoTopielca));
};


func void HeroSay_TeachMeRegeneration() {
	AI_Output (other, self,"HeroSay_TeachMeRegeneration_15_00"); //Naucz mnie regeneracji.
};

func void VachutSay_NoMoney() {
	AI_Output (self, other,"VachutSay_NoMoney_15_00"); //Nie masz doœæ z³ota.
};

func void VachutSay_NoExp() {
	AI_Output (self, other,"VachutSay_NoExp_55_04"); //Brak ci doœwiadczenia.
};

//*********************************************************************
//	         Regeneracja1
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_Regeneracja1   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 100;
 	condition   = DIA_NASZ_227_Vachut_Regeneracja1_Condition;
 	information = DIA_NASZ_227_Vachut_Regeneracja1_Info;
 	permanent   = TRUE;
 	description = "Naucz mnie regeneracji. (500 szt. z³ota) (Poziom 1: 10 PN)";
};

FUNC INT DIA_NASZ_227_Vachut_Regeneracja1_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_227_Vachut_can)
		&& (level_regeneracji < 1))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_Regeneracja1_Info()
{
	HeroSay_TeachMeRegeneration();
	
	if (npc_hasitems (other, ItMi_Gold) < 500) {
		VachutSay_NoMoney();
		}
	else {

		if (hero.lp >= 10) {
			AI_Output (self, other,"DIA_NASZ_227_Vachut_Regeneracja1_55_02"); //Rozmawiaj ze swoim bogiem. On oczyœci twoje myœli i cia³o.
			AI_Output (self, other,"DIA_NASZ_227_Vachut_Regeneracja1_15_03"); //To nie takie trudne! Wystarczy siê wyciszyæ.

			B_GiveInvItems (other, self, ItMi_Gold, 500);			
			level_regeneracji = 1;
			FF_ApplyOnceExt (Regeneracja, 3000, -1);
			hero.lp = hero.lp - 10;

			PrintScreen ("Nauka: regeneracja", -1, -1, FONT_Screen, 2);

			Npc_SetTalentSkill 	(hero, NPC_TALENT_REGENERATE, 1);
		}

		else {
			VachutSay_NoExp();
		};
	};
};

//*********************************************************************
//	         Regeneracja2
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_Regeneracja2   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 101;
 	condition   = DIA_NASZ_227_Vachut_Regeneracja2_Condition;
 	information = DIA_NASZ_227_Vachut_Regeneracja2_Info;
 	permanent   = TRUE;
 	description = "Naucz mnie regeneracji. (1000 szt. z³ota) (Poziom 2: 10 PN)";
};

FUNC INT DIA_NASZ_227_Vachut_Regeneracja2_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_227_Vachut_can)
		&& (level_regeneracji == 1))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_Regeneracja2_Info()
{
	HeroSay_TeachMeRegeneration();
	if (npc_hasitems (other, ItMi_Gold) < 1000) {
		VachutSay_NoMoney();
		}
	else {
		if (hero.lp >= 10) {
			AI_Output (self, other,"DIA_NASZ_227_Vachut_Regeneracja2_55_02"); //Kolejny krok to wyciszenie. Skoncentruj siê na biciu serca.
			AI_Output (self, other,"DIA_NASZ_227_Vachut_Regeneracja2_15_03"); //S³yszysz je? Pamiêtaj, by nie bi³o zbyt szybko.

			B_GiveInvItems (other, self, ItMi_Gold, 1000);		
			level_regeneracji = 2;
			hero.lp = hero.lp - 10;
			
			PrintScreen ("Nauka: regeneracja", -1, -1, FONT_Screen, 2);
			
			Npc_SetTalentSkill 	(hero, NPC_TALENT_REGENERATE, 2);
		}

		else {
			VachutSay_NoExp();
		};
	};
};

//*********************************************************************
//	         Regeneracja3
//*********************************************************************
INSTANCE DIA_NASZ_227_Vachut_Regeneracja3   (C_INFO)
{
	npc         = NASZ_227_Vachut;
 	nr          = 102;
 	condition   = DIA_NASZ_227_Vachut_Regeneracja3_Condition;
 	information = DIA_NASZ_227_Vachut_Regeneracja3_Info;
 	permanent   = TRUE;
 	description = "Naucz mnie regeneracji. (2000 szt. z³ota) (Poziom 3: 10 PN)";
};

FUNC INT DIA_NASZ_227_Vachut_Regeneracja3_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_227_Vachut_can)
		&& (level_regeneracji == 2))
	{
			return TRUE;
	};
};

FUNC VOID DIA_NASZ_227_Vachut_Regeneracja3_Info()
{
	HeroSay_TeachMeRegeneration();
	if (npc_hasitems (other, ItMi_Gold) < 2000) {
		VachutSay_NoMoney();
		}
	else {
		if (hero.lp >= 10){
			AI_Output (self, other,"DIA_NASZ_227_Vachut_Regeneracja3_55_02"); //Teraz staniesz siê jednoœci¹ ze swoj¹ dusz¹.
			AI_Output (self, other,"DIA_NASZ_227_Vachut_Regeneracja3_15_03"); //Utrzymuj wyprostowan¹ pozycjê podczas biegu. Lepiej napêdzisz kwriobieg.
			AI_Output (self, other,"DIA_NASZ_227_Vachut_Regeneracja3_15_04"); //Wypij te¿ ten wywar. Wzmocni ciê.

			Createinvitems(self,ItNa_WywarVachuta,1);
			B_GiveInvItems(self,other,ItNa_WywarVachuta,1);
			AI_UseItem(other,ItNa_WywarVachuta);
			
			B_GiveInvItems (other, self, ItMi_Gold, 2000);	
			level_regeneracji = 3;
			hero.lp = hero.lp - 10;
			
			PrintScreen ("Nauka: regeneracja", -1, -1, FONT_Screen, 2);
			
			Npc_SetTalentSkill 	(hero, NPC_TALENT_REGENERATE, 3);
		}

		else {
			VachutSay_NoExp();
		};
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_227_Vachut_PICKPOCKET (C_INFO)
{
	npc			= NASZ_227_Vachut;
	nr			= 900;
	condition	= DIA_NASZ_227_Vachut_PICKPOCKET_Condition;
	information	= DIA_NASZ_227_Vachut_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_227_Vachut_PICKPOCKET_Condition()
{
	C_Beklauen (63);
};
 
FUNC VOID DIA_NASZ_227_Vachut_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_227_Vachut_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_227_Vachut_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_227_Vachut_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_227_Vachut_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_227_Vachut_PICKPOCKET_DoIt);
};

func void DIA_NASZ_227_Vachut_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItRw_Arrow,84);
	
	Info_ClearChoices (DIA_NASZ_227_Vachut_PICKPOCKET);
};
	
func void DIA_NASZ_227_Vachut_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_227_Vachut_PICKPOCKET);
};
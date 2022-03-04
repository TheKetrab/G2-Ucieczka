
var int perrot_place;
var int perrot_meat;
var int perrot_time;

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_306_Perrot_EXIT   (C_INFO)
{
	npc         = NASZ_306_Perrot;
	nr          = 999;
	condition   = DIA_NASZ_306_Perrot_EXIT_Condition;
	information = DIA_NASZ_306_Perrot_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_306_Perrot_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_306_Perrot_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_306_Perrot_Obcy		(C_INFO)
{
	npc		 = 	NASZ_306_Perrot;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_306_Perrot_Obcy_Condition;
	information	 = 	DIA_NASZ_306_Perrot_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_306_Perrot_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_306_Perrot_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_306_Perrot_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_306_Perrot_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_306_Perrot_siema   (C_INFO)
{
	npc         = NASZ_306_Perrot;
 	nr          = 1;
 	condition   = DIA_NASZ_306_Perrot_siema_Condition;
 	information = DIA_NASZ_306_Perrot_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_306_Perrot_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_306_Perrot_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_306_Perrot_siema_15_00"); //Ej, nowy.
	AI_Output (other, self,"DIA_NASZ_306_Perrot_siema_55_01"); //Tak?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_siema_15_02"); //Mam do ciebie sprawê.
};

//*********************************************************************
//	Info What
//*********************************************************************
INSTANCE DIA_NASZ_306_Perrot_what   (C_INFO)
{
	npc         = NASZ_306_Perrot;
 	nr          = 2;
 	condition   = DIA_NASZ_306_Perrot_what_Condition;
 	information = DIA_NASZ_306_Perrot_what_Info;
 	permanent   = FALSE;
	description = "O co chodzi?";
};

FUNC INT DIA_NASZ_306_Perrot_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_306_Perrot_what_Info()
{
	AI_Output (other, self,"DIA_NASZ_306_Perrot_what_55_00"); //O co chodzi?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_what_15_01"); //Nie wygl¹dasz na bandziora z piek³a rodem. W ogóle nie wiem, jak ci siê uda³o tu dostaæ.
	AI_Output (other, self,"DIA_NASZ_306_Perrot_what_55_02"); //To d³uga historia.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_what_15_03"); //A ja nie mam czasu. S³uchaj, twoja pomoc to dla mnie najwiêksza szansa.
};

//*********************************************************************
//	Info Not
//*********************************************************************
INSTANCE DIA_NASZ_306_Perrot_not   (C_INFO)
{
	npc         = NASZ_306_Perrot;
 	nr          = 3;
 	condition   = DIA_NASZ_306_Perrot_not_Condition;
 	information = DIA_NASZ_306_Perrot_not_Info;
 	permanent   = FALSE;
	description = "Nie rozumiem...";
};

FUNC INT DIA_NASZ_306_Perrot_not_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_306_Perrot_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_306_Perrot_not_Info()
{
	AI_Output (other, self,"DIA_NASZ_306_Perrot_not_55_00"); //Nie rozumiem...
	AI_Output (self, other,"DIA_NASZ_306_Perrot_not_15_01"); //Nod kaza³ zabiæ wszystkie owce. Potrzeba nam miêsa.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_not_15_02"); //A ja... Spêdzam tyle czasu z owcami... ZaprzyjaŸni³em siê z jedn¹.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_not_15_03"); //Chcesz chyba dostaæ siê do szefa? Je¿eli mi pomo¿esz, powiem ci, jak zagadaæ do orka.
};

//*********************************************************************
//	Info OK
//*********************************************************************
INSTANCE DIA_NASZ_306_Perrot_ok   (C_INFO)
{
	npc         = NASZ_306_Perrot;
 	nr          = 4;
 	condition   = DIA_NASZ_306_Perrot_ok_Condition;
 	information = DIA_NASZ_306_Perrot_ok_Info;
 	permanent   = FALSE;
	description = "Dobra, co mam zrobiæ?";
};

FUNC INT DIA_NASZ_306_Perrot_ok_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_306_Perrot_not))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_306_Perrot_ok_Info()
{
	AI_Output (other, self,"DIA_NASZ_306_Perrot_ok_55_00"); //Dobra, co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_15_01"); //Jak powiedzia³em: Szef kaza³ zabiæ owce, byœmy mieli co jeœæ.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_15_02"); //Jedna z nich, Moly, jest moj¹ ulubienic¹. WeŸ j¹ i zaprowadŸ gdzieœ w bezpieczne miejsce.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_15_03"); //Potem przyjdŸ do mnie i za³atw piêæ baranich kie³bas, które normalnie uzyska³bym z owcy.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_15_04"); //Wszystko jasne?

	Log_CreateTopic (TOPIC_Perrot_owca, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Perrot_owca, LOG_RUNNING);
	B_LogEntry (TOPIC_Perrot_owca, "Bandyci szykuj¹ siê do uboju owiec. Problem polega na tym, ¿e Perrot zaprzyjaŸni³ siê z jedn¹ owieczk¹ i teraz muszê mu pomóc j¹ chroniæ. Poza tym, trzeba za³atwiæ 5 baranich kie³bas, by nie wzbudzaæ podejrzeñ.");
	
	Info_ClearChoices (DIA_NASZ_306_Perrot_ok);
		Info_AddChoice	  (DIA_NASZ_306_Perrot_ok, "Gdzie mam j¹ zaprowadziæ?", DIA_NASZ_306_Perrot_ok_place);
		Info_AddChoice	  (DIA_NASZ_306_Perrot_ok, "Sk¹d mam wzi¹æ baraninê?", DIA_NASZ_306_Perrot_ok_meat);
		Info_AddChoice	  (DIA_NASZ_306_Perrot_ok, "Ile mam czasu?", DIA_NASZ_306_Perrot_ok_time);

};

FUNC VOID DIA_NASZ_306_Perrot_ok_place()
{

	AI_Output (other,self ,"DIA_NASZ_306_Perrot_ok_place_15_00"); //Gdzie mam j¹ zaprowadziæ?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_place_55_01"); //Hmm... Wychodz¹c z obozu skrêæ w lewo. IdŸ œcie¿k¹ wzd³u¿ sklepienia a¿ dojdziesz do jaskini.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_place_55_02"); //To moje laboratorium. Tam przygotowujê mikstury dla reszty i czasami eksperymentujê. W³aœnie dlatego Nod zakaza³ mi robiæ to w obozie.
	AI_Output (other,self ,"DIA_NASZ_306_Perrot_ok_place_15_03"); //Bawisz siê w alchemika?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_place_55_04"); //Czasami, ale nie pora na opowiastki. Masz tu klucz. Otworzysz nim drzwi do jaskini.

	B_LogEntry (TOPIC_Perrot_owca, "Muszê zaprowadziæ j¹ do laboratorium Perrota. Za obozem mam skrêciæ w lewo i iœæ œcie¿k¹ wzd³u¿ sklepienia, a¿ dojdê do jaskini. Baraninê znajdê w kufrach bandytów i trochê w jaskini Perrota.");
	PERROTOWCA = TRUE;
	Createinvitems (self, ItNa_Key_Perrot, 1);
	B_giveinvitems (self, other, ItNa_Key_Perrot, 1);

	perrot_place=1;
	
	if (perrot_meat == 1 && perrot_time ==1){
		Info_ClearChoices (DIA_NASZ_306_Perrot_ok);
		Info_AddChoice	  (DIA_NASZ_306_Perrot_ok, "Dobra, wiem ju¿ wszystko.", DIA_NASZ_306_Perrot_ok_end);
	};
};

FUNC VOID DIA_NASZ_306_Perrot_ok_meat()
{

	AI_Output (other,self ,"DIA_NASZ_306_Perrot_ok_meat_15_00"); //Sk¹d mam wzi¹æ baraninê?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_meat_55_01"); //Kufry mój drogi, kufry.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_meat_55_02"); //Wielu z nas traktuje baraninê jako smako³yk. Jestem pewien, ¿e któryœ z bandytów w swoich rzeczach trzymie miêso na czarn¹ godzinê.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_meat_55_03"); //W mojej jaskini te¿ znajdziesz trochê owczego miêsa.

	perrot_meat=1;
	
	if (perrot_place == 1 && perrot_time ==1){
		Info_ClearChoices (DIA_NASZ_306_Perrot_ok);
		Info_AddChoice	  (DIA_NASZ_306_Perrot_ok, "Dobra, wiem ju¿ wszystko.", DIA_NASZ_306_Perrot_ok_end);
	};
};

FUNC VOID DIA_NASZ_306_Perrot_ok_time()
{

	AI_Output (other,self ,"DIA_NASZ_306_Perrot_ok_time_15_00"); //Ile mam czasu?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_time_55_01"); //Nie wiem... Postaram siê przeci¹gn¹æ ubój owiec jak najd³u¿ej.

	perrot_time=1;
	
	if (perrot_place == 1 && perrot_time ==1){
		Info_ClearChoices (DIA_NASZ_306_Perrot_ok);
		Info_AddChoice	  (DIA_NASZ_306_Perrot_ok, "Dobra, wiem ju¿ wszystko.", DIA_NASZ_306_Perrot_ok_end);
	};
};

FUNC VOID DIA_NASZ_306_Perrot_ok_end()
{

	AI_Output (other,self ,"DIA_NASZ_306_Perrot_ok_lowca_15_00"); //Dobra, wiem ju¿ wszystko.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_ok_lowca_55_01"); //Pamiêtaj, bêdê ci bardzo wdziêczny.

	Info_ClearChoices (DIA_NASZ_306_Perrot_ok);
};

//*********************************************************************
//	Info Done
//*********************************************************************
INSTANCE DIA_NASZ_306_Perrot_done   (C_INFO)
{
	npc         = NASZ_306_Perrot;
 	nr          = 5;
 	condition   = DIA_NASZ_306_Perrot_done_Condition;
 	information = DIA_NASZ_306_Perrot_done_Info;
 	permanent   = FALSE;
	description = "Za³atwione.";
};

FUNC INT DIA_NASZ_306_Perrot_done_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_306_Perrot_ok)
	&& npc_knowsinfo (other, DIA_Follow_Sheep_second)
	&& npc_hasitems (other, ItFo_Schafswurst) >=5)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_306_Perrot_done_Info()
{
	AI_Output (other, self,"DIA_NASZ_306_Perrot_done_55_00"); //Za³atwione.
	B_giveinvitems (other, self, ItFo_Schafswurst, 5);
	Npc_RemoveInvItems (self, ItFo_Schafswurst, 5);
	AI_Output (self, other,"DIA_NASZ_306_Perrot_done_15_01"); //Serio? O ¿esz ty, œwietna robota!
	AI_Output (other, self,"DIA_NASZ_306_Perrot_done_55_02"); //Obieca³eœ, ¿e powiesz mi, co mam zrobiæ, by Van-Gan zechcia³ ze mn¹ porozmawiaæ...
	AI_Output (self, other,"DIA_NASZ_306_Perrot_done_15_03"); //Zgadza siê. S³uchaj: Przed obozem stoi dwóch bandytów. Carry i Donks. Tak siê sk³ada, ¿e Van-Gan szczególnie nie lubi tego drugiego.
	AI_Output (other, self,"DIA_NASZ_306_Perrot_done_55_04"); //Mam go zabiæ?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_done_15_05"); //Có¿, taki rozwój spraw z pewnoœci¹ zainteresowa³by orka... Ale co zrobisz, to ju¿ twoja sprawa.
	AI_Output (self, other,"DIA_NASZ_306_Perrot_done_15_06"); //Ja teraz zmykam z obozu. Muszê zaj¹æ siê moj¹ owieczk¹... W razie czego, wiesz gdzie mnie znaleŸæ.

	SetName(NASZ_315_Bandzior, "Donks");
	ShowName(NASZ_315_Bandzior);
	
	Log_SetTopicStatus (TOPIC_Perrot_owca, LOG_SUCCESS);
	B_LogEntry (TOPIC_Perrot_owca, "Owca bezpieczna. W zamian Perrot, powiedzia³ mi, ¿e jeœli chcê zagadaæ do orka, to muszê skasowaæ Donksa. To ten bandyta wygnany razem z Carrym.");
	DodajReputacje (10, REP_BANDYCI);
	B_GivePlayerXP (400);
	Npc_ExchangeRoutine (NASZ_306_Perrot, "Owca");
};

//*********************************************************************
//	Info HowDidYou
//*********************************************************************
INSTANCE DIA_NASZ_306_Perrot_HowDidYou   (C_INFO)
{
	npc         = NASZ_306_Perrot;
 	nr          = 6;
 	condition   = DIA_NASZ_306_Perrot_HowDidYou_Condition;
 	information = DIA_NASZ_306_Perrot_HowDidYou_Info;
 	permanent   = FALSE;
	description = "Jak d³ugo tu jesteœ?";
};

FUNC INT DIA_NASZ_306_Perrot_HowDidYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_306_Perrot_HowDidYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_306_Perrot_HowDidYou_55_00"); //Jak d³ugo tu jesteœ?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_HowDidYou_15_01"); //Dwa tygodnie? Cholera wie.
	AI_Output (other, self,"DIA_NASZ_306_Perrot_HowDidYou_55_02"); //Przyszliœcie tu przez góry?
	AI_Output (self, other,"DIA_NASZ_306_Perrot_HowDidYou_15_03"); //Tak, domyœlam siê, ¿e nawet t¹ sam¹ œcie¿k¹ co ty.

};

func int Open_Chest_Bandyci()
{
	if ((Wld_IsTime (22,00,00,00) || Wld_IsTime (00,00,04,00)) && (KAPITEL < 3))
		|| (KAPITEL >= 3)
	{
		return TRUE;
	}
	else {
	AI_Output (hero, hero,"DIA_NASZ_hero_BandyciSkrzynia_55_00"); //Jest zbyt jasno, by zaryzykowaæ kradzie¿.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_306_Perrot_PICKPOCKET (C_INFO)
{
	npc			= NASZ_306_Perrot;
	nr			= 900;
	condition	= DIA_NASZ_306_Perrot_PICKPOCKET_Condition;
	information	= DIA_NASZ_306_Perrot_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_306_Perrot_PICKPOCKET_Condition()
{
	C_Beklauen (32);
};
 
FUNC VOID DIA_NASZ_306_Perrot_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_306_Perrot_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_306_Perrot_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_306_Perrot_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_306_Perrot_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_306_Perrot_PICKPOCKET_DoIt);
};

func void DIA_NASZ_306_Perrot_PICKPOCKET_DoIt()
{
	B_BeklauenGold(31);
	
	Info_ClearChoices (DIA_NASZ_306_Perrot_PICKPOCKET);
};
	
func void DIA_NASZ_306_Perrot_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_306_Perrot_PICKPOCKET);
};
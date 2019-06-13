///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_NASZ_316_Carry_EXIT   (C_INFO)
{
	npc         = NASZ_316_Carry;
	nr          = 999;
	condition   = DIA_NASZ_316_Carry_EXIT_Condition;
	information = DIA_NASZ_316_Carry_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_316_Carry_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_316_Carry_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_Obcy		(C_INFO)
{
	npc		 = 	NASZ_316_Carry;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_316_Carry_Obcy_Condition;
	information	 = 	DIA_NASZ_316_Carry_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_316_Carry_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_316_Carry_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_hello		(C_INFO)
{
	npc		 	 = 	NASZ_316_Carry;
	nr		 	 = 	2;
	condition	 = 	DIA_NASZ_316_Carry_hello_Condition;
	information	 = 	DIA_NASZ_316_Carry_hello_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_316_Carry_hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_NASZ_316_Carry_hello_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_316_Carry_hello_03_00"); //W czym problem?

};

///////////////////////////////////////////////////////////////////////
//	Info Place
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_place		(C_INFO)
{
	npc			 = 	NASZ_316_Carry;
	nr			 = 	2;
	condition	 = 	DIA_NASZ_316_Carry_place_Condition;
	information	 = 	DIA_NASZ_316_Carry_place_Info;
	permanent	 = 	FALSE;
	description	 =	"Co to za miejsce?";
};

func int DIA_NASZ_316_Carry_place_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_316_Carry_place_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_316_Carry_place_55_00"); //Co to za miejsce?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_place_03_01"); //Jakbyœ sam nie zauwa¿y³! Jakiœ stary grobowiec. A przy tym nasza nowa baza.

};

func void CarrySay_Intruz() {
	AI_Output (self,other,"CarrySay_Intruz_08_00"); //Intruz!
};

///////////////////////////////////////////////////////////////////////
//	Info Palisada
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_palisada		(C_INFO)
{
	npc			 = 	NASZ_316_Carry;
	nr			 = 	3;
	condition	 = 	DIA_NASZ_316_Carry_palisada_Condition;
	information	 = 	DIA_NASZ_316_Carry_palisada_Info;
	permanent	 = 	FALSE;
	description	 =	"Sk¹d wziê³a siê tu ta palisada?";
};

func int DIA_NASZ_316_Carry_palisada_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_316_Carry_palisada_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_316_Carry_palisada_55_00"); //Sk¹d wziê³a siê tu ta palisada?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_palisada_03_01"); //Pamiêtasz, jak miesi¹c temu nasze okrêty zmasakrowa³a orkowa flota?

	Info_ClearChoices 	(DIA_NASZ_316_Carry_palisada);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Có¿... Chyba uderzy³em siê w g³owê.",DIA_NASZ_316_Carry_palisada_head);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Oczywiœcie, ¿e pamiêtam.",DIA_NASZ_316_Carry_palisada_yes);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Nie mam pojêcia, o czym mówisz.",DIA_NASZ_316_Carry_palisada_no);
};

FUNC VOID DIA_NASZ_316_Carry_palisada_head ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_head_08_00"); //Có¿... Chyba uderzy³em siê w g³owê.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_head_08_01"); //Zakrêci³o ci siê w g³owie i przywali³eœ w rejê?
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_head_15_02"); //Pewnie to ty jesteœ tym facetem, którego rzygi rozlewa³y siê po jednej z ³ajb podczas sztormu.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_head_15_03"); //No wiêc po tym, jak w koñcu dotarliœmy z Nodem do Górniczej Doliny osiedliliœmy siê tutaj i próbujemy wykopaæ trochê magicznej rudy.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_head_15_04"); //No dobra, ale co tu robisz?

	Info_ClearChoices 	(DIA_NASZ_316_Carry_palisada);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"W sumie, to nie wiem.",DIA_NASZ_316_Carry_palisada_IDK);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Przyszed³em siê na coœ przydaæ.",DIA_NASZ_316_Carry_palisada_Przydac);

};

FUNC VOID DIA_NASZ_316_Carry_palisada_yes ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_yes_08_00"); //Oczywiœcie, ¿e pamiêtam.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_yes_08_01"); //No wiêc po tym, jak w koñcu dotarliœmy z Nodem do Górniczej Doliny osiedliliœmy siê tutaj i próbujemy wykopaæ trochê magicznej rudy.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_yes_08_02"); //No dobra, ale co tu robisz?
	
	Info_ClearChoices 	(DIA_NASZ_316_Carry_palisada);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"W sumie, to nie wiem.",DIA_NASZ_316_Carry_palisada_IDK);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Przyszed³em siê na coœ przydaæ.",DIA_NASZ_316_Carry_palisada_Przydac);

};

FUNC VOID DIA_NASZ_316_Carry_palisada_no ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_no_08_00"); //Nie mam pojêcia, o czym mówisz.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_no_08_01"); //No to mamy do czynienia z jak¹œ kanali¹.
	CarrySay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};


FUNC VOID DIA_NASZ_316_Carry_palisada_IDK ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_IDK_08_00"); //W sumie, to nie wiem.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_IDK_08_01"); //Za to ja ju¿ na pewno wiem, ¿e nie jesteœ jednym z naszej bandy.
	CarrySay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_316_Carry_palisada_Przydac ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_Przydac_08_00"); //Przyszed³em siê na coœ przydaæ.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_Przydac_08_01"); //Samuel wys³a³ ciê tu, bo fatalnie przybijasz deski? Ha, ha!
	
	B_LogEntry (TOPIC_Gestath_renegaci, "Uda³o mi siê nawi¹zaæ kontakt z jednym z bandytów. Uda³o im siê tu przedostaæ przez góry. O ile dobrze zrozumia³em, tutaj szefem jest Nod, a niejaki Samuel dowodzi naprawianiem okrêtów. Chyba warto zapamiêtaæ te dwa imiona.");
	Info_ClearChoices 	(DIA_NASZ_316_Carry_palisada);
};

///////////////////////////////////////////////////////////////////////
//	Info Help
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_help		(C_INFO)
{
	npc			 = 	NASZ_316_Carry;
	nr			 = 	5;
	condition	 = 	DIA_NASZ_316_Carry_help_Condition;
	information	 = 	DIA_NASZ_316_Carry_help_Info;
	permanent	 = 	FALSE;
	description	 =	"Mogê ci w czymœ pomóc?";
};

func int DIA_NASZ_316_Carry_help_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_316_Carry_palisada))
	{
		return TRUE;
	};
};

func void DIA_NASZ_316_Carry_help_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_316_Carry_help_55_00"); //Mogê ci w czymœ pomóc?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_help_03_01"); //Dla takich s³abeuszy, jak ty, mam tylko jedno zadanie.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_help_03_02"); //Przynieœ mi dwa œwie¿e ³ososie od Danny'ego.
	AI_Output			(other, self, "DIA_NASZ_316_Carry_help_55_03"); //Gdzie go znajdê?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_help_03_04"); //Na dole jest jeziorko. Po drugiej stronie sta³y stare rybackie chaty. To tam go wys³aliœmy.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_help_03_05"); //Danny to starzec. Nie wiem, pamiêtasz go? Z pewnoœci¹ on nie pamiêta ciebie. I nie ³udŸ siê, ¿e zapamiêta po twojej wizycie.

	// od tej pory hero nie podejdzie tam w zbroi bandyty
	ff_applyonceext(ZbrojaDanny_TickTock1s,1000,-1);
	
	B_LogEntry (TOPIC_Gestath_renegaci, "Carry wys³a³ mnie do Danny'ego po dwa ³ososie. Starzec ma podobno bardzo s³ab¹ pamiêæ, wiêc to chyba doskona³a okazja do wydobycia z niego trochê wiêcej informacji. Spróbujê pokazaæ siê mu bez pancerza. Wtedy nie bêdê musia³ udawaæ, ¿e wszystko wiem, a on i tak zapomni o naszej rozmowie.");
	Wld_InsertNpc	(NASZ_327_Danny,"NASZ_BANDYCI_RYBY_L");
};

///////////////////////////////////////////////////////////////////////
//	Info WhyNot
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_WhyNot		(C_INFO)
{
	npc			 = 	NASZ_316_Carry;
	nr			 = 	6;
	condition	 = 	DIA_NASZ_316_Carry_WhyNot_Condition;
	information	 = 	DIA_NASZ_316_Carry_WhyNot_Info;
	permanent	 = 	FALSE;
	description	 =	"Dlaczego nie jesteœ w obozie?";
};

func int DIA_NASZ_316_Carry_WhyNot_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_316_Carry_palisada))
	{
		return TRUE;
	};
};

func void DIA_NASZ_316_Carry_WhyNot_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_316_Carry_WhyNot_55_00"); //Dlaczego nie jesteœ w obozie?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_01"); //Razem z moim kumplem zostaliœmy skazani na miesiêczn¹ banicjê.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_02"); //Chcieliœmy... Ahhh. Bo widzisz, w obozie jest ork. I to nie niewolnik. Nasi traktuj¹ go jak sojusznika!
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_03"); //Pewnej nocy chcieliœmy go skopaæ... I gdy ju¿ byliœmy sam na sam z nim, pojawi³ siê Perrot i wszcz¹³ alarm.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_04"); //Nod siê wœciek³ i wyrzuci³ nas z obozu. I to na ca³y miesi¹c!
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_05"); //Od kiedy to jakaœ bestia jest cenniejsza od dwóch wieloletnich kompanów? No od kiedy, do cholery, pytam!
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_06"); //Cieszê siê jednak, ¿e jakoœ sobie radzimy. Miêso mamy, a Monk czasem podrzuci nam kilka flaszek.
	AI_Output			(other, self, "DIA_NASZ_316_Carry_WhyNot_55_07"); //To wyjaœnia dobry humor.

};

///////////////////////////////////////////////////////////////////////
//	Info Lososie
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_Lososie		(C_INFO)
{
	npc			 = 	NASZ_316_Carry;
	nr			 = 	7;
	condition	 = 	DIA_NASZ_316_Carry_Lososie_Condition;
	information	 = 	DIA_NASZ_316_Carry_Lososie_Info;
	permanent	 = 	FALSE;
	description	 =	"Mam dla ciebie dwie ryby.";
};

func int DIA_NASZ_316_Carry_Lososie_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_316_Carry_help))	&& (npc_hasitems (other, ItNa_Losos) >= 2)
	{
		return TRUE;
	};
};

func void DIA_NASZ_316_Carry_Lososie_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_316_Carry_Lososie_55_00"); //Mam dla ciebie dwie ryby.
	B_GiveInvItems (other, self, ItNa_Losos, 2);
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Lososie_03_01"); //Œwie¿e chocia¿?
	AI_Output			(other, self, "DIA_NASZ_316_Carry_Lososie_03_02"); //Danny wy³owi³ je dla mnie prosto z jeziora.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Lososie_03_03"); //To dlaczego tak zaje¿d¿aj¹ stêchlizn¹? Nawet najmniejszej drobnostki nie umiesz za³atwiæ.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Lososie_03_04"); //Zabieraj te ryby! I lepiej idŸ broiæ w obozie.
	B_GiveInvItems (self, other, ItNa_Losos, 2);

};

///////////////////////////////////////////////////////////////////////
//	Info Muchy
///////////////////////////////////////////////////////////////////////
var int Carry_Day;

instance DIA_NASZ_316_Carry_Muchy		(C_INFO)
{
	npc			 = 	NASZ_316_Carry;
	nr			 = 	8;
	condition	 = 	DIA_NASZ_316_Carry_Muchy_Condition;
	information	 = 	DIA_NASZ_316_Carry_Muchy_Info;
	permanent	 = 	FALSE;
	important	 =	TRUE;
};

func int DIA_NASZ_316_Carry_Muchy_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_307_Monk_koniec))
	&& (KAPITEL < 3)
	{
		return TRUE;
	};
};

func void DIA_NASZ_316_Carry_Muchy_Info ()
{
	// zeby konczyl za toba biegac
	B_StartOtherRoutine (NASZ_316_Carry,"Start");
	CarryBiegnie = FALSE;
	
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Muchy_55_00"); //W koñcu ciê widzê. Potrzebujê twojej pomocy.
	AI_Output			(other, self, "DIA_NASZ_316_Carry_Muchy_03_01"); //O co chodzi tym razem?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Muchy_03_02"); //O owady. Muchy, komary i inne brzêcz¹ce bestie.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Muchy_03_03"); //Skoñczy³ mi siê mój p³yn do nacierania i teraz wszystkie paskudztwa mnie atakuj¹.
	AI_Output			(other, self, "DIA_NASZ_316_Carry_Muchy_03_04"); //W koñcu wiem, sk¹d bierze siê ten zapach...
	AI_ReadyMeleeWeapon(self);
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Muchy_03_05"); //Hej! Nie pozwalaj sobie. Zaraz za³atwisz mi potrzebne sk³adniki albo nagadam na ciebie Nodowi.
	
	Carry_Day = Wld_GetDay();

	Log_CreateTopic (TOPIC_Carry_plyn, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Carry_plyn, LOG_RUNNING);
	B_LogEntry (TOPIC_Carry_plyn, "Carry wys³a³ mnie po sk³adniki do swojego p³ynu przeciw owadom. Muszê przynieœæ mu 3 sztuki bagiennego ziela, siarkê i ³ososia. Mam na to dwa dni.");
	
	Info_ClearChoices 	(DIA_NASZ_316_Carry_Muchy);
		Info_AddChoice		(DIA_NASZ_316_Carry_Muchy,"Przecie¿ nie masz wstêpu do obozu.",DIA_NASZ_316_Carry_Muchy_wstep);
		Info_AddChoice		(DIA_NASZ_316_Carry_Muchy,"Szukasz sobie koz³a ofiarnego?",DIA_NASZ_316_Carry_Muchy_koziol);
};

func void Carry_Say_Skladniki() {

	AI_Output (self,other,"DIA_NASZ_316_Carry_Say_Skladniki_03_00"); //S³uchaj, przyniesiesz mi trzy sztuki bagiennego ziela, siarkê i ³ososia.
	AI_Output (self,other,"DIA_NASZ_316_Carry_Say_Skladniki_03_01"); //I masz na to dwa dni. Ju¿ d³u¿ej nie wytrzymam!

};

FUNC VOID DIA_NASZ_316_Carry_Muchy_wstep ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_Muchy_wstep_08_00"); //Przecie¿ nie masz wstêpu do obozu.
	AI_Output (self,other,"DIA_NASZ_316_Carry_Muchy_wstep_08_01"); //Ju¿ ja tam sobie poradzê. To ty jesteœ tu nowy, nie ja.
	AI_RemoveWeapon(self);
	Carry_Say_Skladniki();
	Info_ClearChoices 	(DIA_NASZ_316_Carry_Muchy);
};

FUNC VOID DIA_NASZ_316_Carry_Muchy_koziol ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_Muchy_koziol_08_00"); //Szukasz sobie koz³a ofiarnego?
	AI_Output (self,other,"DIA_NASZ_316_Carry_Muchy_koziol_08_01"); //W³aœnie go znalaz³em.
	AI_RemoveWeapon(self);
	Carry_Say_Skladniki();
	Info_ClearChoices 	(DIA_NASZ_316_Carry_Muchy);
};

///////////////////////////////////////////////////////////////////////
//	Info MuchyFinish
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_MuchyFinish		(C_INFO)
{
	npc			 = 	NASZ_316_Carry;
	nr			 = 	8;
	condition	 = 	DIA_NASZ_316_Carry_MuchyFinish_Condition;
	information	 = 	DIA_NASZ_316_Carry_MuchyFinish_Info;
	permanent	 = 	FALSE;
	description  =	"Mam te twoje sk³adniki.";
};

func int DIA_NASZ_316_Carry_MuchyFinish_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_316_Carry_Muchy))
	&& !(npc_knowsinfo (other, DIA_NASZ_316_Carry_MuchyFail))
	&& (npc_hasitems (other, ItPl_SwampHerb) >= 3)
	&& (npc_hasitems (other, ItMi_Sulfur) >= 1)
	&& (npc_hasitems (other, ItNa_Losos) >= 1)
	{
		return TRUE;
	};
};

func void DIA_NASZ_316_Carry_MuchyFinish_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_316_Carry_MuchyFinish_55_00"); //Mam te twoje sk³adniki.
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFinish_03_01"); //Teraz bêdê móg³ przygotowaæ p³yn i wszystkie muchy st¹d odlec¹!
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFinish_03_02"); //Chyba nie bêdê mia³ sobie za z³e, je¿eli nagrodzê ciê t¹ ma³¹ sumk¹...
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFinish_03_03"); //Zas³u¿y³eœ.

	Log_SetTopicStatus (TOPIC_Carry_plyn, LOG_SUCCESS);
	B_LogEntry (TOPIC_Carry_plyn, "Sk³adniki dostarczone. Ale¿ ta mieszanka musi byæ obrzydliwa!");
	
	B_GivePlayerXP(400);
	DodajReputacje(5,REP_BANDYCI);
	
	CreateInvItems (self,ItMi_Gold,40);
	B_giveinvitems (self, other, ItMi_Gold, 40);
	
};

///////////////////////////////////////////////////////////////////////
//	Info MuchyFail
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_316_Carry_MuchyFail		(C_INFO)
{
	npc			 = 	NASZ_316_Carry;
	nr			 = 	8;
	condition	 = 	DIA_NASZ_316_Carry_MuchyFail_Condition;
	information	 = 	DIA_NASZ_316_Carry_MuchyFail_Info;
	permanent	 = 	FALSE;
	important    =	TRUE;
};

func int DIA_NASZ_316_Carry_MuchyFail_Condition ()
{
	if (npc_knowsinfo (other, DIA_NASZ_316_Carry_Muchy))
	&& !(npc_knowsinfo (other, DIA_NASZ_316_Carry_MuchyFinish))
	&& (TimeIsUp(2,-1,Carry_Day,-1))
	&& (KAPITEL < 3)
	{
		return TRUE;
	};
};

func void DIA_NASZ_316_Carry_MuchyFail_Info ()
{
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFail_55_00"); //Myœla³em, ¿e ju¿ siê nie poka¿esz.
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFail_03_01"); //Zreszt¹... To bez znaczenia. Za³atwi³em sobie ju¿ p³yn przeciw owadom i nie potrzebujê niczego od ciebie.

	Log_SetTopicStatus (TOPIC_Carry_plyn, LOG_FAILED);
	B_LogEntry (TOPIC_Carry_plyn, "SpóŸni³em siê i Carry sam sobie poradzi³.");


};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_316_Carry_PICKPOCKET (C_INFO)
{
	npc			= NASZ_316_Carry;
	nr			= 900;
	condition	= DIA_NASZ_316_Carry_PICKPOCKET_Condition;
	information	= DIA_NASZ_316_Carry_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_316_Carry_PICKPOCKET_Condition()
{
	C_Beklauen (33);
};
 
FUNC VOID DIA_NASZ_316_Carry_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_316_Carry_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_316_Carry_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_316_Carry_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_316_Carry_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_316_Carry_PICKPOCKET_DoIt);
};

func void DIA_NASZ_316_Carry_PICKPOCKET_DoIt()
{
	B_BeklauenGold(42);
	
	Info_ClearChoices (DIA_NASZ_316_Carry_PICKPOCKET);
};
	
func void DIA_NASZ_316_Carry_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_316_Carry_PICKPOCKET);
};
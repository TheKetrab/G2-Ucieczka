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
	AI_Output			(self, other, "DIA_NASZ_316_Carry_place_03_01"); //Jakby� sam nie zauwa�y�! Jaki� stary grobowiec. A przy tym nasza nowa baza.

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
	description	 =	"Sk�d wzi�a si� tu ta palisada?";
};

func int DIA_NASZ_316_Carry_palisada_Condition ()
{
	return TRUE;
};

func void DIA_NASZ_316_Carry_palisada_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_316_Carry_palisada_55_00"); //Sk�d wzi�a si� tu ta palisada?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_palisada_03_01"); //Pami�tasz, jak miesi�c temu nasze okr�ty zmasakrowa�a orkowa flota?

	Info_ClearChoices 	(DIA_NASZ_316_Carry_palisada);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"C�... Chyba uderzy�em si� w g�ow�.",DIA_NASZ_316_Carry_palisada_head);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Oczywi�cie, �e pami�tam.",DIA_NASZ_316_Carry_palisada_yes);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Nie mam poj�cia, o czym m�wisz.",DIA_NASZ_316_Carry_palisada_no);
};

FUNC VOID DIA_NASZ_316_Carry_palisada_head ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_head_08_00"); //C�... Chyba uderzy�em si� w g�ow�.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_head_08_01"); //Zakr�ci�o ci si� w g�owie i przywali�e� w rej�?
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_head_15_02"); //Pewnie to ty jeste� tym facetem, kt�rego rzygi rozlewa�y si� po jednej z �ajb podczas sztormu.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_head_15_03"); //No wi�c po tym, jak w ko�cu dotarli�my z Nodem do G�rniczej Doliny osiedlili�my si� tutaj i pr�bujemy wykopa� troch� magicznej rudy.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_head_15_04"); //No dobra, ale co tu robisz?

	Info_ClearChoices 	(DIA_NASZ_316_Carry_palisada);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"W sumie, to nie wiem.",DIA_NASZ_316_Carry_palisada_IDK);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Przyszed�em si� na co� przyda�.",DIA_NASZ_316_Carry_palisada_Przydac);

};

FUNC VOID DIA_NASZ_316_Carry_palisada_yes ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_yes_08_00"); //Oczywi�cie, �e pami�tam.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_yes_08_01"); //No wi�c po tym, jak w ko�cu dotarli�my z Nodem do G�rniczej Doliny osiedlili�my si� tutaj i pr�bujemy wykopa� troch� magicznej rudy.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_yes_08_02"); //No dobra, ale co tu robisz?
	
	Info_ClearChoices 	(DIA_NASZ_316_Carry_palisada);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"W sumie, to nie wiem.",DIA_NASZ_316_Carry_palisada_IDK);
		Info_AddChoice		(DIA_NASZ_316_Carry_palisada,"Przyszed�em si� na co� przyda�.",DIA_NASZ_316_Carry_palisada_Przydac);

};

FUNC VOID DIA_NASZ_316_Carry_palisada_no ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_no_08_00"); //Nie mam poj�cia, o czym m�wisz.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_no_08_01"); //No to mamy do czynienia z jak�� kanali�.
	CarrySay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};


FUNC VOID DIA_NASZ_316_Carry_palisada_IDK ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_IDK_08_00"); //W sumie, to nie wiem.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_IDK_08_01"); //Za to ja ju� na pewno wiem, �e nie jeste� jednym z naszej bandy.
	CarrySay_Intruz();
	
	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);

};

FUNC VOID DIA_NASZ_316_Carry_palisada_Przydac ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_palisada_Przydac_08_00"); //Przyszed�em si� na co� przyda�.
	AI_Output (self,other,"DIA_NASZ_316_Carry_palisada_Przydac_08_01"); //Samuel wys�a� ci� tu, bo fatalnie przybijasz deski? Ha, ha!
	
	B_LogEntry (TOPIC_Gestath_renegaci, "Uda�o mi si� nawi�za� kontakt z jednym z bandyt�w. Uda�o im si� tu przedosta� przez g�ry. O ile dobrze zrozumia�em, tutaj szefem jest Nod, a niejaki Samuel dowodzi naprawianiem okr�t�w. Chyba warto zapami�ta� te dwa imiona.");
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
	description	 =	"Mog� ci w czym� pom�c?";
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
	AI_Output			(other, self, "DIA_NASZ_316_Carry_help_55_00"); //Mog� ci w czym� pom�c?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_help_03_01"); //Dla takich s�abeuszy, jak ty, mam tylko jedno zadanie.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_help_03_02"); //Przynie� mi dwa �wie�e �ososie od Danny'ego.
	AI_Output			(other, self, "DIA_NASZ_316_Carry_help_55_03"); //Gdzie go znajd�?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_help_03_04"); //Na dole jest jeziorko. Po drugiej stronie sta�y stare rybackie chaty. To tam go wys�ali�my.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_help_03_05"); //Danny to starzec. Nie wiem, pami�tasz go? Z pewno�ci� on nie pami�ta ciebie. I nie �ud� si�, �e zapami�ta po twojej wizycie.

	// od tej pory hero nie podejdzie tam w zbroi bandyty
	ff_applyonceext(ZbrojaDanny_TickTock1s,1000,-1);
	
	B_LogEntry (TOPIC_Gestath_renegaci, "Carry wys�a� mnie do Danny'ego po dwa �ososie. Starzec ma podobno bardzo s�ab� pami��, wi�c to chyba doskona�a okazja do wydobycia z niego troch� wi�cej informacji. Spr�buj� pokaza� si� mu bez pancerza. Wtedy nie b�d� musia� udawa�, �e wszystko wiem, a on i tak zapomni o naszej rozmowie.");
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
	description	 =	"Dlaczego nie jeste� w obozie?";
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
	AI_Output			(other, self, "DIA_NASZ_316_Carry_WhyNot_55_00"); //Dlaczego nie jeste� w obozie?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_01"); //Razem z moim kumplem zostali�my skazani na miesi�czn� banicj�.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_02"); //Chcieli�my... Ahhh. Bo widzisz, w obozie jest ork. I to nie niewolnik. Nasi traktuj� go jak sojusznika!
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_03"); //Pewnej nocy chcieli�my go skopa�... I gdy ju� byli�my sam na sam z nim, pojawi� si� Perrot i wszcz�� alarm.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_04"); //Nod si� w�ciek� i wyrzuci� nas z obozu. I to na ca�y miesi�c!
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_05"); //Od kiedy to jaka� bestia jest cenniejsza od dw�ch wieloletnich kompan�w? No od kiedy, do cholery, pytam!
	AI_Output			(self, other, "DIA_NASZ_316_Carry_WhyNot_03_06"); //Ciesz� si� jednak, �e jako� sobie radzimy. Mi�so mamy, a Monk czasem podrzuci nam kilka flaszek.
	AI_Output			(other, self, "DIA_NASZ_316_Carry_WhyNot_55_07"); //To wyja�nia dobry humor.

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
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Lososie_03_01"); //�wie�e chocia�?
	AI_Output			(other, self, "DIA_NASZ_316_Carry_Lososie_03_02"); //Danny wy�owi� je dla mnie prosto z jeziora.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Lososie_03_03"); //To dlaczego tak zaje�d�aj� st�chlizn�? Nawet najmniejszej drobnostki nie umiesz za�atwi�.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Lososie_03_04"); //Zabieraj te ryby! I lepiej id� broi� w obozie.
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
	
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Muchy_55_00"); //W ko�cu ci� widz�. Potrzebuj� twojej pomocy.
	AI_Output			(other, self, "DIA_NASZ_316_Carry_Muchy_03_01"); //O co chodzi tym razem?
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Muchy_03_02"); //O owady. Muchy, komary i inne brz�cz�ce bestie.
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Muchy_03_03"); //Sko�czy� mi si� m�j p�yn do nacierania i teraz wszystkie paskudztwa mnie atakuj�.
	AI_Output			(other, self, "DIA_NASZ_316_Carry_Muchy_03_04"); //W ko�cu wiem, sk�d bierze si� ten zapach...
	AI_ReadyMeleeWeapon(self);
	AI_Output			(self, other, "DIA_NASZ_316_Carry_Muchy_03_05"); //Hej! Nie pozwalaj sobie. Zaraz za�atwisz mi potrzebne sk�adniki albo nagadam na ciebie Nodowi.
	
	Carry_Day = Wld_GetDay();

	Log_CreateTopic (TOPIC_Carry_plyn, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Carry_plyn, LOG_RUNNING);
	B_LogEntry (TOPIC_Carry_plyn, "Carry wys�a� mnie po sk�adniki do swojego p�ynu przeciw owadom. Musz� przynie�� mu 3 sztuki bagiennego ziela, siark� i �ososia. Mam na to dwa dni.");
	
	Info_ClearChoices 	(DIA_NASZ_316_Carry_Muchy);
		Info_AddChoice		(DIA_NASZ_316_Carry_Muchy,"Przecie� nie masz wst�pu do obozu.",DIA_NASZ_316_Carry_Muchy_wstep);
		Info_AddChoice		(DIA_NASZ_316_Carry_Muchy,"Szukasz sobie koz�a ofiarnego?",DIA_NASZ_316_Carry_Muchy_koziol);
};

func void Carry_Say_Skladniki() {

	AI_Output (self,other,"DIA_NASZ_316_Carry_Say_Skladniki_03_00"); //S�uchaj, przyniesiesz mi trzy sztuki bagiennego ziela, siark� i �ososia.
	AI_Output (self,other,"DIA_NASZ_316_Carry_Say_Skladniki_03_01"); //I masz na to dwa dni. Ju� d�u�ej nie wytrzymam!

};

FUNC VOID DIA_NASZ_316_Carry_Muchy_wstep ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_Muchy_wstep_08_00"); //Przecie� nie masz wst�pu do obozu.
	AI_Output (self,other,"DIA_NASZ_316_Carry_Muchy_wstep_08_01"); //Ju� ja tam sobie poradz�. To ty jeste� tu nowy, nie ja.
	AI_RemoveWeapon(self);
	Carry_Say_Skladniki();
	Info_ClearChoices 	(DIA_NASZ_316_Carry_Muchy);
};

FUNC VOID DIA_NASZ_316_Carry_Muchy_koziol ()
{
	AI_Output (other,self,"DIA_NASZ_316_Carry_Muchy_koziol_08_00"); //Szukasz sobie koz�a ofiarnego?
	AI_Output (self,other,"DIA_NASZ_316_Carry_Muchy_koziol_08_01"); //W�a�nie go znalaz�em.
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
	description  =	"Mam te twoje sk�adniki.";
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
	AI_Output	(other, self, "DIA_NASZ_316_Carry_MuchyFinish_55_00"); //Mam te twoje sk�adniki.
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFinish_03_01"); //Teraz b�d� m�g� przygotowa� p�yn i wszystkie muchy st�d odlec�!
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFinish_03_02"); //Chyba nie b�d� mia� sobie za z�e, je�eli nagrodz� ci� t� ma�� sumk�...
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFinish_03_03"); //Zas�u�y�e�.

	Log_SetTopicStatus (TOPIC_Carry_plyn, LOG_SUCCESS);
	B_LogEntry (TOPIC_Carry_plyn, "Sk�adniki dostarczone. Ale� ta mieszanka musi by� obrzydliwa!");
	
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
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFail_55_00"); //My�la�em, �e ju� si� nie poka�esz.
	AI_Output	(self, other, "DIA_NASZ_316_Carry_MuchyFail_03_01"); //Zreszt�... To bez znaczenia. Za�atwi�em sobie ju� p�yn przeciw owadom i nie potrzebuj� niczego od ciebie.

	Log_SetTopicStatus (TOPIC_Carry_plyn, LOG_FAILED);
	B_LogEntry (TOPIC_Carry_plyn, "Sp�ni�em si� i Carry sam sobie poradzi�.");


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
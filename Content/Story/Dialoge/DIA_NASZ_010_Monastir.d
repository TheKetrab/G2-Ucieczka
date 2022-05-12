
var int MonastirIsGoingToOpenGate;
var int Monastir_ShowHammersInfo;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_EXIT   (C_INFO)
{
	npc         = NASZ_010_Monastir;
	nr          = 999;
	condition   = DIA_NASZ_010_Monastir_EXIT_Condition;
	information = DIA_NASZ_010_Monastir_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_010_Monastir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_010_Monastir_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_siema   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 1;
 	condition   = DIA_NASZ_010_Monastir_siema_Condition;
 	information = DIA_NASZ_010_Monastir_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_010_Monastir_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_010_Monastir_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_010_Monastir_siema_55_00"); //Wiêc to tak wygl¹da tutejszy bohater, o którym wszyscy mówi¹.

	
};

//*********************************************************************
//	Info Who
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_who   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 2;
 	condition   = DIA_NASZ_010_Monastir_who_Condition;
 	information = DIA_NASZ_010_Monastir_who_Info;
 	permanent   = FALSE;
	description = "Kim jesteœ?";
};

FUNC INT DIA_NASZ_010_Monastir_who_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_who_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_who_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_who_55_01"); //Nazywam siê Monastir. Jestem Magiem Ognia i pochodzê z Myrtany.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_who_55_02"); //Jak widzisz, ludzie nie zapomnieli o was. Przybywam tu, by pomóc siê wam wydostaæ.
};


//*********************************************************************
//	Info Doing
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_doing   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 3;
 	condition   = DIA_NASZ_010_Monastir_doing_Condition;
 	information = DIA_NASZ_010_Monastir_doing_Info;
 	permanent   = FALSE;
	description = "Jak siê tu dosta³eœ?";
};

FUNC INT DIA_NASZ_010_Monastir_doing_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_doing_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_doing_15_00"); //Jak siê tu dosta³eœ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_01"); //Paladyni z Khorinis wys³ali wiadomoœæ do króla o tym, co sta³o siê w dawnej Kolonii.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_02"); //Rhobar, bêd¹cy zajêty walk¹ z orkami na kontynencie, nie móg³ pozwoliæ sobie na utratê wyszkolonych paladynów i ¿o³nierzy.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_03"); //Wys³a³ wiêc mnie, bym pomóg³ wam wydostaæ siê z doliny, a przy okazji by zgromadziæ i zabraæ trochê rudy.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_doing_15_04"); //Wydaje mi siê, ¿e królowi chodzi tylko o rudê...
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_05"); //Razem z Magami Ognia z klasztoru w Nordmarze opracowaliœmy bardzo silne zaklêcie, które przenios³o mnie a¿ tutaj.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_doing_15_06"); //Wiesz ju¿, jak wróciæ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_07"); //Tak. Jeden ze skrybów przepisuj¹cych stare i zakurzone ksiêgi natrafi³ na wzmiankê o rycerzu z wyspy Khorinis, który przyzwa³ bogów...
	
};
	
//*********************************************************************
//	Info Idea
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_idea   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 5;
 	condition   = DIA_NASZ_010_Monastir_idea_Condition;
 	information = DIA_NASZ_010_Monastir_idea_Info;
 	permanent   = FALSE;
	description = "Przyzwa³ bogów? Czy to mo¿liwe?";
};

FUNC INT DIA_NASZ_010_Monastir_idea_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_doing))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_idea_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_idea_15_00"); //Przyzwa³ bogów? Czy to mo¿liwe?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_55_01"); //Wydaje mi siê, ¿e by³y to tylko ich awatary, ale jeœli legenda nie k³amie, to mamy szansê to powtórzyæ.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_55_02"); //Nie znam szczegó³ów tej historii, ale wiem, ¿e jej koniec jest doœæ smutny. Ten, który u¿y³ zwoju, zmieni³ siê w o¿ywieñca i po dziœ dzieñ b³¹ka siê gdzieœ po Górniczej Dolinie.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_55_03"); //Domyœlam siê, ¿e ma w posiadaniu jeszcze taki zwój.
	
	Log_CreateTopic (TOPIC_Monastir_bogowie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Monastir_bogowie, LOG_RUNNING);
	B_LogEntry (TOPIC_Monastir_bogowie, "Do Górniczej Doliny przyby³ mag. Ponoæ zosta³ tu wys³any, by pomóc nam uciec z tego miejsca. Jego zdaniem nasz¹ jedyn¹ szans¹ jest PRZYWO£ANIE BOGÓW.");

	B_LogEntry (TOPIC_Monastir_bogowie, "Wedle starej legendy za pomoc¹ zwoju ju¿ kiedyœ PRZYZWANO BOGÓW. Niestety ten, który go u¿y³, zmieni³ siê w o¿ywieñca i b³¹ka siê gdzieœ w Górniczej Dolinie.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Monastir to mag z klasztoru na kontynencie. Niby przyby³, by nas uwolniæ, ale jak dla mnie to bzdura! Rhobarowi zale¿y z pewnoœci¹ na magicznej rudzie. Jednak skoro pojawi³a siê okazja na ucieczkê, to zamierzam j¹ wykorzystaæ. Monastir opowiedzia³ mi o sposobie na PRZYZWANIE BOGÓW. Brzmi niebezpiecznie. Podobno gdzieœ na skrajach Górniczej Doliny znajduje siê zwój... Chyba zajrzê do Ayana. Przed wojn¹ o zamek bada³ obrze¿a Kolonii w okolicy obozu wypadowego myœliwych.");

	Info_ClearChoices (DIA_NASZ_010_Monastir_idea);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_idea, "Mo¿e jakieœ wskazówki, gdzie go szukaæ?", DIA_NASZ_010_Monastir_idea_seek);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_idea, "Mam znaleŸæ zwój, tak?", DIA_NASZ_010_Monastir_idea_and);
};

FUNC VOID DIA_NASZ_010_Monastir_idea_seek()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_idea_seek_15_00"); //Mo¿e jakieœ wskazówki, gdzie go szukaæ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_seek_55_01"); //Wydaje mi siê, ¿e powinieneœ poszukaæ gdzieœ na skrajach Górniczej Doliny. Gdyby by³ w jej centrum, ju¿ dawno ktoœ by go odnalaz³.

	B_LogEntry (TOPIC_Monastir_bogowie, "Monastir uwa¿a, ¿e o¿ywieniec mo¿e chowaæ siê gdzieœ na skrajach Górniczej Doliny. Przede mn¹ wielkie poszukiwania... Szukaæ ig³y w stogu siana... Myœlê, ¿e na razie od³o¿ê to na póŸniej. Mamy wa¿niejsze sprawy na g³owie, jak chocia¿by ekspedycja za orkow¹ palisadê. Znaj¹c ¿ycie problem sam siê rozwi¹¿e.");
};

FUNC VOID DIA_NASZ_010_Monastir_idea_and()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_idea_and_15_00"); //Mam znaleŸæ zwój, tak?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_and_55_01"); //Dok³adnie. IdŸ, znajdŸ i zabij o¿ywieñca oraz przynieœ mi ten zwój.

};


//*********************************************************************
//	Info Summoned
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_summoned   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 7;
 	condition   = DIA_NASZ_010_Monastir_summoned_Condition;
 	information = DIA_NASZ_010_Monastir_summoned_Info;
 	permanent   = FALSE;
	description = "Bogowie zostali przyzwani.";
};

FUNC INT DIA_NASZ_010_Monastir_summoned_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_idea)) && (OZYWIENIEC_OneTime == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_summoned_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_summoned_15_00"); //Bogowie zostali przyzwani.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_summoned_55_01"); //Przyzwani?! Ale jak to?
	AI_Output (other, self,"DIA_NASZ_010_Monastir_summoned_15_02"); //Razem z pewnym myœliwym znaleŸliœmy komnatê, w której zabiliœmy o¿ywieñca. Wtedy poleci³ mi rozejrzeæ siê na górze.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_summoned_15_03"); //Kiedy szuka³em zwoju, us³ysza³em jakiœ okropny odg³os. Wnioskujê, ¿e znalaz³ go pierwszy i u¿y³, poniewa¿ zamieni³ siê w o¿ywieñca.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_summoned_55_04"); //Tak, z pewnoœci¹ to zrobi³...
	B_GivePlayerXP (1000);
	
	Log_SetTopicStatus (TOPIC_Monastir_bogowie, LOG_SUCCESS);
	ff_remove(summon);

};

//*********************************************************************
//	Info WhatNow
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_whatnow   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 8;
 	condition   = DIA_NASZ_010_Monastir_whatnow_Condition;
 	information = DIA_NASZ_010_Monastir_whatnow_Info;
 	permanent   = FALSE;
	description = "Co teraz?";
};

FUNC INT DIA_NASZ_010_Monastir_whatnow_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_summoned))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_whatnow_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_whatnow_15_00"); //Co teraz?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_01"); //Twoje zadanie jest oczywiste.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_02"); //Musisz znaleŸæ bogów i przekonaæ ich, by otworzyli portal na drug¹ stronê prze³êczy.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_whatnow_15_03"); //Gdzie ich szukaæ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_04"); //S¹ niczym b³yskawica... Ona szuka najkrótszej drogi do ziemi.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_05"); //Analogicznie, Innos powinien byæ w najgorêtszym miejscu, Adanos w wodnym... mo¿e lodowym, a Beliar w miejscu najbardziej przesi¹kniêtym czarn¹ magi¹.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_whatnow_15_06"); //W takim razie w drogê...
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_07"); //Poczekaj, to nie wszystko!
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_08"); //Przyzwaliœmy bogów, ¿eby otwarli portal. Musimy znaleŸæ odpowiednie miejsce, gdzie mo¿na odprawiæ rytua³. Musi byæ przepe³nione magi¹...
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_09"); //Zawalona œwi¹tynia Œni¹cego i miasto orków powinno siê nadaæ na taki rytua³.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_whatnow_55_10"); //Mam znaleŸæ sposób na to, by siê tam dostaæ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_11"); //Zgadza siê. Pamiêtaj, ¿e gdybyœ tylko czegoœ potrzebowa³, s³u¿ê pomoc¹.

	Log_CreateTopic (TOPIC_Monastir_pomoc, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Monastir_pomoc, LOG_RUNNING);
	B_LogEntry (TOPIC_Monastir_pomoc, "Jako ¿e bogowie s¹ ju¿ gdzieœ w Dolinie, muszê ich znaleŸæ i przekonaæ, by nam pomogli. Ka¿dy z nich powinien byæ w miejscu najbardziej zwi¹zanym z samym sob¹: Innos - ogieñ, Adanos - woda lub lód, Beliar - czarna magia.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Bogowie przyzwani. Teraz muszê znaleŸæ miejsce do przeprowadzenia rytua³u i oczywiœcie przekonaæ trzech braci, by zgodzili siê nam pomóc.");

	B_LogEntry (TOPIC_Monastir_pomoc, "Szans¹ na ucieczkê z tej przeklêtej doliny jest otworzenie portalu. Monastir twierdzi, ¿e dobrym miejscem bêdzie orkowe miasto przed œwi¹tyni¹ Œni¹cego. No to w drogê!");

	if (WillKnowAboutWayToOrc == FALSE) {
		B_StartOtherRoutine (NASZ_230_Dymoondo,"Kap4");
	};
};

var int MONASTIR_POTION;
var int MONASTIR_B_DONE;
var int MONASTIR_MAGIC;
var int MONASTIR_MONEY;
var int MONASTIR_WEAPON;
//*********************************************************************
//	Info HelpMe
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_HelpMe   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 9;
 	condition   = DIA_NASZ_010_Monastir_HelpMe_Condition;
 	information = DIA_NASZ_010_Monastir_HelpMe_Info;
 	permanent   = TRUE;
	description = "Potrzebujê twojej pomocy.";
};

FUNC INT DIA_NASZ_010_Monastir_HelpMe_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_whatnow))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_HelpMe_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_HelpMe_15_00"); //Potrzebujê twojej pomocy.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_55_01"); //Co teraz?

	Info_ClearChoices (DIA_NASZ_010_Monastir_HelpMe);
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, DIALOG_BACK, DIA_NASZ_010_Monastir_HelpMe_END);

	if (!MONASTIR_POTION) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Potrzebujê mikstur.", DIA_NASZ_010_Monastir_HelpMe_potions);
	};
	if (ZabilesDlaBeliara == TRUE && (!MONASTIR_B_DONE)) {	
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Zabi³em niewinn¹ istotê.", DIA_NASZ_010_Monastir_HelpMe_beliar);
	};
	if (!MONASTIR_MAGIC) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³yby mi siê jakieœ magiczne zwoje.", DIA_NASZ_010_Monastir_HelpMe_magic);
	};	
	if (!MONASTIR_MONEY) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³oby mi siê trochê z³ota.", DIA_NASZ_010_Monastir_HelpMe_money);
	};		
	
	if (!MONASTIR_WEAPON) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³aby mi siê lepsza broñ...", DIA_NASZ_010_Monastir_HelpMe_weapon);
	};		
	
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Pob³ogos³aw mnie!", DIA_NASZ_010_Monastir_HelpMe_blessme);
	

};

FUNC VOID DIA_NASZ_010_Monastir_HelpMe_potions()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_potions_15_02"); //Potrzebujê mikstur.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_potions_55_03"); //Mogê wspomóc ciê eliksirami leczniczymi. Te 10 eliksirów powinno ci siê przydaæ.
	
	Createinvitems (self, ItPo_Health_03, 10);
	B_giveinvitems (self, other, ItPo_Health_03, 10);
	
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_potions_55_04"); //WeŸ te¿ kilka esencji many. Niech przypominaj¹ ci o tym, ¿e w razie czego mo¿esz zawsze pomóc sobie magicznymi zaklêciami.
	
	Createinvitems (self, ItPo_Mana_01, 4);
	B_giveinvitems (self, other, ItPo_Mana_01, 4);
	
	MONASTIR_POTION = TRUE;
	
	
};
FUNC VOID DIA_NASZ_010_Monastir_HelpMe_weapon()
{
	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_weapon_15_00"); //Przyda³aby mi siê lepsza broñ...

	if(!MONASTIR_MONEY)
	{
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_weapon_55_01"); //Niestety nie dysponujê orê¿em, lecz mogê wspomóc ciê z³otem na zakup, jeœli zechcesz.
		
		MONASTIR_WEAPON = TRUE;
		Info_ClearChoices(DIA_NASZ_010_Monastir_HelpMe);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³oby mi siê trochê z³ota.", DIA_NASZ_010_Monastir_HelpMe_weaponmoney);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Nie, dziêki.", DIA_NASZ_010_Monastir_HelpMe_money_END);
	}
	else 
	{
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_weapon_55_02"); //Niestety nie mogê spe³niæ twojej proœby, poniewa¿ nie mam na stanie orê¿u.
		MONASTIR_WEAPON = TRUE;
	};
	
};

FUNC void DIA_NASZ_010_Monastir_HelpMe_money_END()
{
	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_money_END_15_00"); //Nie, dziêki. Mo¿e innym razem.

	// ponowiony clearchoice, bo wczesniej jest inny, a nie g³ówny
	Info_ClearChoices (DIA_NASZ_010_Monastir_HelpMe);
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, DIALOG_BACK, DIA_NASZ_010_Monastir_HelpMe_END);

	if (!MONASTIR_POTION) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Potrzebujê mikstur.", DIA_NASZ_010_Monastir_HelpMe_potions);
	};
	if (ZabilesDlaBeliara == TRUE && (!MONASTIR_B_DONE)) {	
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Zabi³em niewinn¹ istotê.", DIA_NASZ_010_Monastir_HelpMe_beliar);
	};
	if (!MONASTIR_MAGIC) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³yby mi siê jakieœ magiczne zwoje.", DIA_NASZ_010_Monastir_HelpMe_magic);
	};	
	if (!MONASTIR_MONEY) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³oby mi siê trochê z³ota.", DIA_NASZ_010_Monastir_HelpMe_money);
	};		
	
	if (!MONASTIR_WEAPON) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³aby mi siê lepsza broñ...", DIA_NASZ_010_Monastir_HelpMe_weapon);
	};		
	
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Pob³ogos³aw mnie!", DIA_NASZ_010_Monastir_HelpMe_blessme);
	
	
};

FUNC VOID DIA_NASZ_010_Monastir_HelpMe_beliar()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_beliar_15_00"); //Odda³em czeœæ Beliarowi.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_beliar_55_01"); //Dopuœci³eœ siê nie lada wystêpku. Ale wierzê, ¿e zrobi³eœ to z koniecznoœci.

	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );

	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_beliar_55_02"); //B³ogos³awiê ciê w imieniu Innosa. Niech oczyœci twoj¹ ciemn¹ duszê.

	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");

	B_GivePlayerXP (300);
	MONASTIR_B_DONE = TRUE;

};

FUNC VOID DIA_NASZ_010_Monastir_HelpMe_magic()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_magic_15_00"); //Przyda³yby mi siê jakieœ magiczne zwoje.
	if (hero.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_magic_55_01"); //Myœlê, ¿e myœliwy powinien otrzymaæ zaklêcie, które uniemo¿liwi ruch przeciwnikowi. Dziêki temu nie zbli¿y siê do ciebie, a ty bêdziesz móg³ go ostrzelaæ z ³uku.
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_magic_55_02"); //WeŸ te zaklêcia lodowej fali i bry³y lodu. Nie daj siê zabiæ!
		Createinvitems (self, ItSc_IceWave, 2);
		B_giveinvitems (self, other, ItSc_IceWave, 2);
		
	};
	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_magic_55_03"); //Mam tu coœ nieprzeciêtnego, ale uwa¿aj, by nie wyrz¹dziæ krzywdy innym ludziom!
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_magic_55_04"); //Z deszczem ognia pokonasz wszystkich swoich wrogów w kilka sekund.
		Createinvitems (self, ItSc_FireRain, 2);
		B_giveinvitems (self, other, ItSc_FireRain, 2);
	};

	MONASTIR_MAGIC = TRUE;
};


func void HeroMonastir_INeedGold_DIA() {
	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_money_15_00"); //Przyda³oby mi siê trochê z³ota.
	AI_Output (self,other ,"DIA_NASZ_010_Monastir_HelpMe_money_55_01"); //Proszê, weŸ te monety. To wszystko, co mam.
};

func void DIA_NASZ_010_Monastir_HelpMe_weaponmoney() {

	HeroMonastir_INeedGold_DIA();
	Createinvitems (self, ITMI_GOLD, 100);
	B_giveinvitems (self, other, ITMI_GOLD, 100);
	MONASTIR_MONEY = TRUE;
	
	// ponowiony clearchoice, bo wczesniej jest inny, a nie g³ówny
	Info_ClearChoices (DIA_NASZ_010_Monastir_HelpMe);
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, DIALOG_BACK, DIA_NASZ_010_Monastir_HelpMe_END);

	if (!MONASTIR_POTION) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Potrzebujê mikstur.", DIA_NASZ_010_Monastir_HelpMe_potions);
	};
	if (ZabilesDlaBeliara == TRUE && (!MONASTIR_B_DONE)) {	
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Zabi³em niewinn¹ istotê.", DIA_NASZ_010_Monastir_HelpMe_beliar);
	};
	if (!MONASTIR_MAGIC) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³yby mi siê jakieœ magiczne zwoje.", DIA_NASZ_010_Monastir_HelpMe_magic);
	};	
	if (!MONASTIR_MONEY) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³oby mi siê trochê z³ota.", DIA_NASZ_010_Monastir_HelpMe_money);
	};		
	
	if (!MONASTIR_WEAPON) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda³aby mi siê lepsza broñ...", DIA_NASZ_010_Monastir_HelpMe_weapon);
	};		
	
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Pob³ogos³aw mnie!", DIA_NASZ_010_Monastir_HelpMe_blessme);
	

};

FUNC VOID DIA_NASZ_010_Monastir_HelpMe_money()
{
	HeroMonastir_INeedGold_DIA();
	
	Createinvitems (self, ITMI_GOLD, 100);
	B_giveinvitems (self, other, ITMI_GOLD, 100);
		

	MONASTIR_MONEY = TRUE;
};
var int MonasirExpBlessMeOnce;

FUNC void DIA_NASZ_010_Monastir_HelpMe_BLESSME()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_blessme_15_00"); //Pob³ogos³aw mnie!
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_blessme_55_01"); //B³ogos³awiê ciê w imieniu Innosa. Niechaj ogieñ naszego Pana zawsze p³onie w twym sercu, aby dawaæ ci si³ê do postêpowania zgodnie z jego naukami.
	
	Snd_Play("LevelUp");
	if (!MonasirExpBlessMeOnce)
	{
		B_GivePlayerXP(50);
		MonasirExpBlessMeOnce = true;
	};
};
FUNC void DIA_NASZ_010_Monastir_HelpMe_END()
{
	Info_ClearChoices(DIA_NASZ_010_Monastir_HelpMe);
};

//*********************************************************************
//	Info IKnowPlace
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_IKnowPlace   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 10;
 	condition   = DIA_NASZ_010_Monastir_IKnowPlace_Condition;
 	information = DIA_NASZ_010_Monastir_IKnowPlace_Info;
 	permanent   = FALSE;
	description = "Znalaz³em drogê do miasta orków.";
};

FUNC INT DIA_NASZ_010_Monastir_IKnowPlace_Condition()	
{
	if (WillKnowAboutWayToOrc == TRUE)
	&& (npc_knowsinfo(other,DIA_NASZ_010_Monastir_whatnow))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_IKnowPlace_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowPlace_15_00"); //Znalaz³em drogê do miasta orków.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowPlace_55_01"); //Istnieje œcie¿ka przez góry. Niestety, brama do miasta jest zapieczêtowana. Jakaœ magiczna aura nie pozwala wejœæ do œrodka.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowPlace_55_02"); //Hmm... Spróbujê coœ temu zaradziæ.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowPlace_55_03"); //Mam ciê tam zaprowadziæ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowPlace_55_04"); //Nie marnuj czasu, dam sobie radê. Gdzie jest to miejsce?
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowPlace_55_05"); //Miêdzy obozem bandytów a obozem myœliwych œcie¿ka robi siê wê¿sza. Tam musisz skoczyæ na ska³y i po prostu iœæ w górê.

	Npc_ExchangeRoutine (self, "Gate");
	
	B_LogEntry (TOPIC_Monastir_pomoc, "Powiedzia³em magowi, jak dostaæ siê do orkowego miasta. Mo¿e uda mu siê prze³amaæ magiczn¹ pieczêæ.");
};

//*********************************************************************
//	Info NearGate
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_NearGate   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 12;
 	condition   = DIA_NASZ_010_Monastir_NearGate_Condition;
 	information = DIA_NASZ_010_Monastir_NearGate_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_010_Monastir_NearGate_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_IKnowPlace))
		&& (Npc_GetDistToWP	(self, "NASZ_DYMOONDO_G") < 1500)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_NearGate_Info()
{
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_15_00"); //Ta brama... Z daleka czuæ pulsuj¹c¹ energiê magiczn¹.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_01"); //Prawdopodobnie podczas zniszczenia bariery tutaj, u jej Ÿróde³, energia skumulowa³a siê maksymalnie i powsta³a ma³a bariera nie do sforsowania.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_02"); //Chyba bêdê w stanie siê tym zaj¹æ. Potrzebujê jednak do tego soków z pewnej roœliny.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_NearGate_55_03"); //Niech zgadnê, ta roœlina jest bardzo rzadka i nie sposób j¹ zdobyæ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_04"); //Ta roœlina to s³oneczny aloes. Roœnie na odchodach trolla.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_05"); //Jednak¿e jeden troll nie wystarczy, ¿eby roœlina zakie³kowa³a. Potrzeba ca³ej rodzinki tych bestii.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_NearGate_55_06"); //Gdzie w Górniczej Dolinie w jednym miejscu przebywa tyle trolli?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_07"); //Nie wiem... mo¿e zapytaj Silasa? Spêdzi³em jedn¹ noc w karczmie i z rozmowy wyniknê³o, ¿e w Kolonii Górniczej przebywa ju¿ od wielu lat.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_08"); //Gdy ju¿ znajdziesz te roœliny, nazbieraj ich przynajmniej piêæ. Myœlê, ¿e z tak¹ iloœci¹ soku z ich liœci zdo³am prze³amaæ barierê.

	B_LogEntry (TOPIC_Monastir_pomoc, "Monastir potrzebuje 5 s³onecznych aloesów, które rosn¹ w odchodach trolli. Nie wystarczy jednak jeden troll, by roœlina uros³a. Ktoœ, kto d³ugo przebywa³ za barier¹, mo¿e wiedzieæ, gdzie mogê znaleŸæ tyle tych bestii. Monastir poradzi³ mi, ¿ebym zajrza³ do Silasa.");
};

//*********************************************************************
//	Info MamSkladniki
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_MamSkladniki   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 13;
 	condition   = DIA_NASZ_010_Monastir_MamSkladniki_Condition;
 	information = DIA_NASZ_010_Monastir_MamSkladniki_Info;
 	permanent   = FALSE;
	description = "Mam piêæ roœlin.";
};

FUNC INT DIA_NASZ_010_Monastir_MamSkladniki_Condition()	
{

	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_NearGate))
		&& (npc_hasitems (other, ItPl_Sagitta_Herb_MIS) >=5)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_MamSkladniki_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_MamSkladniki_15_00"); //Mam piêæ roœlin.
	B_giveinvitems (other, self, ItPl_Sagitta_Herb_MIS, 5);
	AI_Output (self, other,"DIA_NASZ_010_Monastir_MamSkladniki_55_01"); //Doskonale, a teraz odsuñ siê.

	B_GivePlayerXP(500);
	
	Npc_ExchangeRoutine (self, "OpeningGate");
	Npc_ExchangeRoutine (NASZ_010_Monastir, "OpeningGate");

	Info_ClearChoices (DIA_NASZ_010_Monastir_MamSkladniki);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_MamSkladniki, DIALOG_ENDE, DIA_NASZ_010_Monastir_MamSkladniki_end);
};

func void DIA_NASZ_010_Monastir_MamSkladniki_end() {
	RitualMonastir_IsGoingToStart = TRUE;
	AI_StopProcessInfos(self);
};


//*********************************************************************
//	Info AfterOpen
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_AfterOpen   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 14;
 	condition   = DIA_NASZ_010_Monastir_AfterOpen_Condition;
 	information = DIA_NASZ_010_Monastir_AfterOpen_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_010_Monastir_AfterOpen_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_MamSkladniki)) && (MonastirOpenGateOneTime == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_AfterOpen_Info()
{
	AI_Output (self, other,"DIA_NASZ_010_Monastir_AfterOpen_15_00"); //Uda³o mi siê.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_AfterOpen_55_01"); //ChodŸ, zobaczymy co kryje to miejsce.

	B_StartOtherRoutine(self, "GoToFinal");

	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_010_Monastir,1);
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info StandInFinal
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_StandInFinal   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 15;
 	condition   = DIA_NASZ_010_Monastir_StandInFinal_Condition;
 	information = DIA_NASZ_010_Monastir_StandInFinal_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_010_Monastir_StandInFinal_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_AfterOpen)) && (Npc_GetDistToWP	(self, "NASZ_MONASTIR_FINAL") < 1000)
	{
		return TRUE;
	};
};

func int HowManyGods() {

	var int counter; counter = 0;
	
	if (Npc_GetDistToWP(NASZ_402_Innos,"NASZ_DYMOONDO_L") < 1000) { counter += 1; };
	if (Npc_GetDistToWP(NASZ_403_Adanos,"NASZ_DYMOONDO_L") < 1000) { counter += 1; };
	if (Npc_GetDistToWP(NASZ_404_Beliar,"NASZ_DYMOONDO_L") < 1000) { counter += 1; };

	return counter;
};

func void LetGodsStartWithTheirRitual() {

	Log_SetTopicStatus (TOPIC_bogowie_work, LOG_SUCCESS);

	LastRitual = TRUE;
	FF_ApplyOnceExt (LastRitualFunc, 30000, -1);
	
	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Wszystko, co mia³em zrobiæ, zrobi³em. Teraz muszê poczekaæ, a¿ Innos, Adanos oraz Beliar odprawi¹ rytua³ i przejœæ z innymi przez portal.");

	B_StartOtherRoutine (NASZ_402_Innos, "Ritual");
	B_StartOtherRoutine (NASZ_403_Adanos, "Ritual");
	B_StartOtherRoutine (NASZ_404_Beliar, "Ritual");
};

var int WillMusiSprowadzicPozostalychBogow;
FUNC VOID DIA_NASZ_010_Monastir_StandInFinal_Info()
{
	AI_Output (self, other,"DIA_NASZ_010_Monastir_StandInFinal_15_00"); //Patrz. Tam na górze jest kamienny o³tarz.

	if (HowManyGods() == 0) {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_StandInFinal_55_01"); //Musisz teraz przywo³aæ tu bogów, ¿eby odprawili rytua³.
		WillMusiSprowadzicPozostalychBogow = TRUE;
	}
	
	else if (HowManyGods() == 1 || HowManyGods() == 2) {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_StandInFinal_55_02"); //Nawet ktoœ ju¿ tam jest! SprowadŸ wszystkich, ¿eby wspólnie odprawili rytua³.
		WillMusiSprowadzicPozostalychBogow = TRUE;
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_StandInFinal_55_03"); //S¹ równie¿ wszyscy bogowie. Niech zaczynaj¹.
		LetGodsStartWithTheirRitual();
	};
	

	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_010_Monastir,0);
	Npc_ExchangeRoutine (self, "Final");

};

//*********************************************************************
//	Info GodReady
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_GodReady   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 16;
 	condition   = DIA_NASZ_010_Monastir_GodReady_Condition;
 	information = DIA_NASZ_010_Monastir_GodReady_Info;
 	permanent   = FALSE;
	description = "Wszyscy bogowie s¹ gotowi.";
};

FUNC INT DIA_NASZ_010_Monastir_GodReady_Condition()	
{
	if (Npc_GetDistToWP	(NASZ_402_Innos, "M") < 500)
	&& (Npc_GetDistToWP	(NASZ_403_Adanos, "NASZ_DYMOONDO_K") < 500)
	&& (Npc_GetDistToWP	(NASZ_404_Beliar, "NASZ_DYMOONDO_L") < 500)
	&& (Npc_GetDistToWP	(self, "NASZ_MONASTIR_FINAL") < 500)
	&& ((WillMusiSprowadzicPozostalychBogow == TRUE)
	 || (Cheat_Final == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_GodReady_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_GodReady_15_00"); //Wszyscy bogowie s¹ gotowi.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_GodReady_55_01"); //A wiêc niech zaczynaj¹!
	LetGodsStartWithTheirRitual();

};

//*********************************************************************
//	Info ErakHelp
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_ErakHelp   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 21;
 	condition   = DIA_NASZ_010_Monastir_ErakHelp_Condition;
 	information = DIA_NASZ_010_Monastir_ErakHelp_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_010_Monastir_ErakHelp_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_ErakAndUdarDone))
	&& (Npc_IsInState(self, ZS_TALK))
	{
	
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_ErakHelp_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_ErakHelp_15_00"); //Potrzebujemy twojej pomocy w sprawie...
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_01"); //Nieumar³ych, którzy wbrew zasadom panuj¹cym na tym œwiecie przemierzaj¹ œwiat œmiertelnych niepokoj¹c ich ¿ywot?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_02"); //Doprawdy, straszne rzeczy dziej¹ siê w tym miejscu. Po raz pierwszy w swoim ¿yciu jestem œwiadkiem tak du¿ego gniewu niespokojnych dusz.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_ErakHelp_55_03"); //Jak myœlisz, co ich tutaj sprowadza? Jakiœ czar, a mo¿e chêæ zniszczenia?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_04"); //Nie, to na pewno nic z tego. Od chwili kiedy siê tutaj zjawi³em, pocz¹³em wyczuwaæ potê¿ne zak³ócenia w strukturze magii. Kolonia zosta³a otoczona niewidzialn¹ dla oka œmiertelnika aur¹.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_05"); //Aura ta emanuje na tyle du¿¹ energi¹, ¿e mo¿e zmuszaæ nieumar³ych, aby ci przybywali do tego œwiata.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_06"); //Nie wiem dok³adnie, jak ona dzia³a, ale najprawdopodobniej sprowadza ona tak¿e dusze, które zostaj¹ uwiêzione w tych martwych skorupach.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_07"); //Zaklêcie otaczaj¹ce dolinê, poprzez katusze zmusza dusze, by pozosta³y w tym miejscu.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_ErakHelp_55_08"); //Czy mo¿emy coœ z tym zrobiæ? Je¿eli mówisz prawdê, w naszym obowi¹zku le¿y pomóc tym wszystkim umêczonym duszom.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_09"); //Do g³owy przychodzi mi jedno rozwi¹zanie, jednak bêdzie siê ono wi¹za³o z pewnym niebezpieczeñstwem.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_10"); //Gdzieœ w Górniczej Dolinie znajduje siê Ÿród³o mocy. Nie wiem dok³adnie, czym ono jest, ale prawdopodobnie bêdzie to kapliczka lub pos¹¿ek.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_11"); //To w³aœnie z tego miejsca emanuje niezrozumia³a dla mnie energia, która wyró¿nia siê na tle aury, jaka nas otacza.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_12"); //Powinieneœ j¹ odszukaæ. To pierwszy i najwa¿niejszy krok. Musimy znaleŸæ Ÿród³o.

	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Monastir sam przyzna³, ¿e w Górniczej Dolinie da siê odczuæ spore stê¿enie energii magicznej. Gdzieœ w okolicy znajduje siê jej potê¿ne Ÿród³o.");
	
};



//*********************************************************************
//	Info IKnowDemon
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_IKnowDemon   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 22;
 	condition   = DIA_NASZ_010_Monastir_IKnowDemon_Condition;
 	information = DIA_NASZ_010_Monastir_IKnowDemon_Info;
 	permanent   = FALSE;
	description = "Za zamkiem widzia³em pos¹g demona.";
};

FUNC INT DIA_NASZ_010_Monastir_IKnowDemon_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_ErakHelp)) && (WillKnowAboutDemonPosag == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_IKnowDemon_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowDemon_15_00"); //Za zamkiem widzia³em pos¹g demona.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowDemon_55_01"); //Bardzo mo¿liwe, ¿e to jest w³aœnie Ÿród³o ciemnej energii. Powinieneœ go zniszczyæ za wszelk¹ cenê, inaczej nied³ugo nie bêdziemy mieli szans, aby zatrzymaæ ten istny szturm nieumar³ych.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowDemon_55_02"); //Jednak strze¿ siê! Je¿eli zosta³ on poœwiêcony mrocznym si³om, te mog¹ wys³aæ swe s³ugi, by ciê powstrzymaæ.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowDemon_55_03"); //Nie takim niebezpieczeñstwom stawia³em czo³a, nawet demony nie powstrzymaj¹ mnie przed zniszczeniem tego miejsca kultu.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowDemon_55_04"); //Jak go zniszczyæ?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowDemon_55_05"); //Potrzebny bêdzie jakiœ m³ot i woda œwiêcona. PóŸniej dokonamy rytua³u b³ogos³awi¹cego broñ.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowDemon_55_06"); //Uderz po prostu takim m³otem w pos¹g i powinien siê zniszczyæ.

	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Muszê zniszczyæ miejsce orkowego kultu, które mo¿e byæ przyczyn¹ pojawiania siê w tym miejscu tylu nieumar³ych. Mag ostrzeg³ mnie jednak przed mrocznymi si³ami i ich s³ugami, które mog¹ spróbowaæ mnie powstrzymaæ. Aby zniszczyæ pos¹g, muszê stan¹æ przy nim i uderzyæ z ca³ej si³y jakimœ m³otem. Najpierw jednak musimy pob³ogos³awiæ broñ.");

};

//*********************************************************************
//	Info IHaveMlot
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_IHaveMlot   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 23;
 	condition   = DIA_NASZ_010_Monastir_IHaveMlot_Condition;
 	information = DIA_NASZ_010_Monastir_IHaveMlot_Info;
 	permanent   = FALSE;
	description = "Mam m³ot i wodê œwiêcon¹.";
};

FUNC INT DIA_NASZ_010_Monastir_IHaveMlot_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_IKnowDemon))
	&& (npc_hasitems (other, ItMi_HolyWater) >= 1)
	&& (bNpcHasHammer(other))
	{
		return TRUE;
	};
};

func void MonastirEffect()
{
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,2,0,0,TRUE); 
};

FUNC VOID DIA_NASZ_010_Monastir_IHaveMlot_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IHaveMlot_15_00"); //Mam m³ot i wodê œwiêcon¹.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveMlot_55_01"); //Daj mi wodê.

	B_GiveInvItems(other,self,ItMi_HolyWater,1);
	
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Function(other,MonastirEffect); 
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveMlot_55_02"); //Innosie, pob³ogos³aw tê broñ. Spraw, by sta³a siê mocna i zwyciê¿y³a potêgê ciemnoœci!
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveMlot_55_03"); //To wszystko. Teraz zniszcz pos¹g uderzaj¹c w ni¹ tym m³otem.

	Monastir_ShowHammersInfo = true;


	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Ma³y rytua³ siê uda³. Pora zniszczyæ pos¹g!");
	WillIsGoingToKillDemonPosag = 1;
	FF_ApplyOnceExt(KillDemonPosag,2000,-1);
	
};

func void InsertUndeadsInCastle() {

	Wld_InsertNpc(Demon,"FP_REST_ZAMEK_01");
	Wld_InsertNpc(Demon,"FP_REST_ZAMEK_02");
	Wld_InsertNpc(SkeletonPro,"FP_REST_ZAMEK_03");
	Wld_InsertNpc(Zombie01,"FP_REST_ZAMEK_03");
	Wld_InsertNpc(SkeletonPro,"FP_REST_ZAMEK_04");
	Wld_InsertNpc(Zombie01,"FP_REST_ZAMEK_04");
	Wld_InsertNpc(SkeletonPro,"FP_REST_ZAMEK_05");
	Wld_InsertNpc(Zombie01,"FP_REST_ZAMEK_05");
	Wld_InsertNpc(SkeletonPro,"FP_REST_ZAMEK_06");
	Wld_InsertNpc(Zombie01,"FP_REST_ZAMEK_06");
	Wld_InsertNpc(SkeletonShield,"FP_ROAM_ZAMEK_01");
	Wld_InsertNpc(SkeletonShield,"FP_ROAM_ZAMEK_02");
	Wld_InsertNpc(SkeletonShield,"FP_ROAM_ZAMEK_03");
	Wld_InsertNpc(SkeletonShield,"FP_ROAM_ZAMEK_04");
	
};

var int MonastirTeleportOneTime;
func void MonastirTeleportTickTock() {

	if (Npc_GetDistToWP(hero,"OC_CENTER_04") < 3000) 
	&& (Npc_KnowsInfo(hero,DIA_NASZ_010_Monastir_IHaveKilled))
	&& (MonastirTeleportOneTime == FALSE) {
		
		MonastirTeleportOneTime = TRUE;
		ff_remove(MonastirTeleportTickTock);
		
		AI_Teleport(NASZ_010_Monastir,"OC_CENTER_04");
		Wld_PlayEffect("spellFX_Teleport_RING",NASZ_010_Monastir,NASZ_010_Monastir,0,0,0,FALSE);
		Snd_Play ("MFX_TELEPORT_CAST");
		
		B_StartOtherRoutine(NASZ_010_Monastir,"FollowInZamek");
		Npc_ClearAIQueue(NASZ_010_Monastir);
	
		Npc_ExchangeRoutine(NASZ_010_Monastir,"FollowInZamek");
		Npc_ExchangeRoutine(NASZ_110_Keroloth,"FollowInZamek");
		
	};
};

//*********************************************************************
//	Info IHaveKilled
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_IHaveKilled   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 24;
 	condition   = DIA_NASZ_010_Monastir_IHaveKilled_Condition;
 	information = DIA_NASZ_010_Monastir_IHaveKilled_Info;
 	permanent   = FALSE;
	description = "Zniszczy³em pos¹g.";
};

FUNC INT DIA_NASZ_010_Monastir_IHaveKilled_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_IKnowDemon)) && (WillIsGoingToKillDemonPosag == 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_IHaveKilled_Info()
{
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IHaveKilled_15_00"); //Zniszczy³em pos¹g.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveKilled_55_01"); //Wyczu³em to, tak potê¿ny zanik magii jest odczuwalny nawet dla maga-adepta. Miejmy nadziejê, i¿ to pomo¿e nam rozwi¹zaæ ten problem.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveKilled_55_02"); //Opracowa³em mapê, na której zaznaczy³em miejsca przepe³nione magiczn¹ energi¹. Wydaje mi siê, ¿e w³aœnie tam pojawi¹ siê demony i zombie.
	Createinvitems (self, ItNa_Mapa_Demonow, 1);
	B_giveinvitems (self, other, ItNa_Mapa_Demonow, 1);
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveKilled_55_03"); //Dajê ci j¹, ¿ebyœ wiedzia³, gdzie jeszcze spodziewaæ siê zagro¿enia.
	
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Mag da³ mi mapê, na której zaznaczy³ miejsca przepe³nione magiczn¹ energi¹. Powinienem na nie uwa¿aæ, gdy¿ w³aœnie tam mog¹ pojawiæ siê demony i zombie. Powinienem poinformowaæ Kerolotha o ca³ej akcji z kapliczk¹.");
	
	FF_ApplyOnceExt (MonastirTeleportTickTock, 3000, -1); //raz na 3s
	InsertUndeadsInCastle();
};

//*********************************************************************
//	Kap5Start
//*********************************************************************
INSTANCE DIA_NASZ_010_Monastir_Kap5Start   (C_INFO)
{
	npc         = NASZ_010_Monastir;
 	nr          = 51;
 	condition   = DIA_NASZ_010_Monastir_Kap5Start_Condition;
 	information = DIA_NASZ_010_Monastir_Kap5Start_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_010_Monastir_Kap5Start_Condition()	
{
	if (PoRytualeMonastirBiegnie == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_010_Monastir_Kap5Start_Info()
{
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_15_00"); //Bogowie wyparowali...!
	AI_Output (other, self,"DIA_NASZ_010_Monastir_Kap5Start_55_01"); //A portalu brak.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_55_02"); //Jeœli bogowie tak zakoñczyli rytua³, to na pewno jest w tym jakiœ sens.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_55_03"); //Otworzy³y siê wrota do jakiejœ pieczary. Mo¿liwe, ¿e bogowie tak to sobie wymyœlili.

	Log_SetTopicStatus (TOPIC_Monastir_pomoc, LOG_SUCCESS);
	B_LogEntry (TOPIC_Monastir_pomoc, "Nie wiem co to ma znaczyæ... Bogowie odprawili rytua³, ale portalu nigdzie nie widaæ.");
	
	Log_CreateTopic (TOPIC_OrcCity_In, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OrcCity_In, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcCity_In, "Szlag by to trafi³. Myœla³em, ¿e to ju¿ koniec i wydostaniemy siê z tej doliny, której ja sam mam ju¿ powoli doœæ. Bogowie odprawili rytua³ i zniknêli. £adna mi pomoc! Ale Monastir uwa¿a, ¿e nie zrobili tego bez powodu. ¯e 'panuj¹cy nad tym œwiatem' maj¹ w tym jakiœ cel. Monastir dostrzeg³, ¿e odsun¹³ siê jakiœ g³az... Szykuje siê kolejna niebezpieczna podró¿...");

	B_Kapitelwechsel (5, NEWWORLD_ZEN );

	Info_ClearChoices (DIA_NASZ_010_Monastir_Kap5Start);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_Kap5Start, "Mam wejœæ do œrodka?", DIA_NASZ_010_Monastir_Kap5Start_yes);

};

FUNC VOID DIA_NASZ_010_Monastir_Kap5Start_yes()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_00"); //Mam wejœæ do œrodka?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_01"); //A czy masz lepszy pomys³? Zrobiliœmy ju¿ tak du¿o, ¿e nie mo¿emy siê teraz poddaæ.
	AI_Output (other,self ,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_02"); //Oczywiœcie... Ciekawe, czy i tym razem stanê twarz¹ w twarz ze œmierci¹.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_03"); //Tego nie wie nikt. IdŸ z b³ogos³awieñstwem.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_04"); //Niech œwiat³o Innosa odsuwa ciê od otch³ani.

	Npc_ExchangeRoutine (self, "Final");
	AI_StopProcessInfos (self);
};
	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_010_Monastir_PICKPOCKET (C_INFO)
{
	npc			= NASZ_010_Monastir;
	nr			= 900;
	condition	= DIA_NASZ_010_Monastir_PICKPOCKET_Condition;
	information	= DIA_NASZ_010_Monastir_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_010_Monastir_PICKPOCKET_Condition()
{
	C_Beklauen (102);
};
 
FUNC VOID DIA_NASZ_010_Monastir_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_010_Monastir_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_010_Monastir_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_010_Monastir_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_010_Monastir_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_010_Monastir_PICKPOCKET_DoIt);
};

func void DIA_NASZ_010_Monastir_PICKPOCKET_DoIt()
{
	B_BeklauenThings (ItSc_MassDeath, 1);
	Info_ClearChoices (DIA_NASZ_010_Monastir_PICKPOCKET);
};
	
func void DIA_NASZ_010_Monastir_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_010_Monastir_PICKPOCKET);
};

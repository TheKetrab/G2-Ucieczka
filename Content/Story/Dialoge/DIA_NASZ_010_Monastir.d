
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
	AI_Output (self, other,"DIA_NASZ_010_Monastir_siema_55_00"); //Wi�c to tak wygl�da tutejszy bohater, o kt�rym wszyscy m�wi�.

	
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
	description = "Kim jeste�?";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_who_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_who_55_01"); //Nazywam si� Monastir. Jestem Magiem Ognia i pochodz� z Myrtany.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_who_55_02"); //Jak widzisz, ludzie nie zapomnieli o was. Przybywam tu, by pom�c si� wam wydosta�.
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
	description = "Jak si� tu dosta�e�?";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_doing_15_00"); //Jak si� tu dosta�e�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_01"); //Paladyni z Khorinis wys�ali wiadomo�� do kr�la o tym, co sta�o si� w dawnej Kolonii.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_02"); //Rhobar, b�d�cy zaj�ty walk� z orkami na kontynencie, nie m�g� pozwoli� sobie na utrat� wyszkolonych paladyn�w i �o�nierzy.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_03"); //Wys�a� wi�c mnie, bym pom�g� wam wydosta� si� z doliny, a przy okazji by zgromadzi� i zabra� troch� rudy.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_doing_15_04"); //Wydaje mi si�, �e kr�lowi chodzi tylko o rud�...
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_05"); //Razem z Magami Ognia z klasztoru w Nordmarze opracowali�my bardzo silne zakl�cie, kt�re przenios�o mnie a� tutaj.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_doing_15_06"); //Wiesz ju�, jak wr�ci�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_doing_55_07"); //Tak. Jeden ze skryb�w przepisuj�cych stare i zakurzone ksi�gi natrafi� na wzmiank� o rycerzu z wyspy Khorinis, kt�ry przyzwa� bog�w...
	
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
	description = "Przyzwa� bog�w? Czy to mo�liwe?";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_idea_15_00"); //Przyzwa� bog�w? Czy to mo�liwe?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_55_01"); //Wydaje mi si�, �e by�y to tylko ich awatary, ale je�li legenda nie k�amie, to mamy szans� to powt�rzy�.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_55_02"); //Nie znam szczeg��w tej historii, ale wiem, �e jej koniec jest do�� smutny. Ten, kt�ry u�y� zwoju, zmieni� si� w o�ywie�ca i po dzi� dzie� b��ka si� gdzie� po G�rniczej Dolinie.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_55_03"); //Domy�lam si�, �e ma w posiadaniu jeszcze taki zw�j.
	
	Log_CreateTopic (TOPIC_Monastir_bogowie, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Monastir_bogowie, LOG_RUNNING);
	B_LogEntry (TOPIC_Monastir_bogowie, "Do G�rniczej Doliny przyby� mag. Pono� zosta� tu wys�any, by pom�c nam uciec z tego miejsca. Jego zdaniem nasz� jedyn� szans� jest PRZYWO�ANIE BOG�W.");

	B_LogEntry (TOPIC_Monastir_bogowie, "Wedle starej legendy za pomoc� zwoju ju� kiedy� PRZYZWANO BOG�W. Niestety ten, kt�ry go u�y�, zmieni� si� w o�ywie�ca i b��ka si� gdzie� w G�rniczej Dolinie.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Monastir to mag z klasztoru na kontynencie. Niby przyby�, by nas uwolni�, ale jak dla mnie to bzdura! Rhobarowi zale�y z pewno�ci� na magicznej rudzie. Jednak skoro pojawi�a si� okazja na ucieczk�, to zamierzam j� wykorzysta�. Monastir opowiedzia� mi o sposobie na PRZYZWANIE BOG�W. Brzmi niebezpiecznie. Podobno gdzie� na skrajach G�rniczej Doliny znajduje si� zw�j... Chyba zajrz� do Ayana. Przed wojn� o zamek bada� obrze�a Kolonii w okolicy obozu wypadowego my�liwych.");

	Info_ClearChoices (DIA_NASZ_010_Monastir_idea);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_idea, "Mo�e jakie� wskaz�wki, gdzie go szuka�?", DIA_NASZ_010_Monastir_idea_seek);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_idea, "Mam znale�� zw�j, tak?", DIA_NASZ_010_Monastir_idea_and);
};

FUNC VOID DIA_NASZ_010_Monastir_idea_seek()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_idea_seek_15_00"); //Mo�e jakie� wskaz�wki, gdzie go szuka�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_seek_55_01"); //Wydaje mi si�, �e powiniene� poszuka� gdzie� na skrajach G�rniczej Doliny. Gdyby by� w jej centrum, ju� dawno kto� by go odnalaz�.

	B_LogEntry (TOPIC_Monastir_bogowie, "Monastir uwa�a, �e o�ywieniec mo�e chowa� si� gdzie� na skrajach G�rniczej Doliny. Przede mn� wielkie poszukiwania... Szuka� ig�y w stogu siana... My�l�, �e na razie od�o�� to na p�niej. Mamy wa�niejsze sprawy na g�owie, jak chocia�by ekspedycja za orkow� palisad�. Znaj�c �ycie problem sam si� rozwi��e.");
};

FUNC VOID DIA_NASZ_010_Monastir_idea_and()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_idea_and_15_00"); //Mam znale�� zw�j, tak?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_idea_and_55_01"); //Dok�adnie. Id�, znajd� i zabij o�ywie�ca oraz przynie� mi ten zw�j.

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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_summoned_15_02"); //Razem z pewnym my�liwym znale�li�my komnat�, w kt�rej zabili�my o�ywie�ca. Wtedy poleci� mi rozejrze� si� na g�rze.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_summoned_15_03"); //Kiedy szuka�em zwoju, us�ysza�em jaki� okropny odg�os. Wnioskuj�, �e znalaz� go pierwszy i u�y�, poniewa� zamieni� si� w o�ywie�ca.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_summoned_55_04"); //Tak, z pewno�ci� to zrobi�...
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
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_02"); //Musisz znale�� bog�w i przekona� ich, by otworzyli portal na drug� stron� prze��czy.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_whatnow_15_03"); //Gdzie ich szuka�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_04"); //S� niczym b�yskawica... Ona szuka najkr�tszej drogi do ziemi.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_05"); //Analogicznie, Innos powinien by� w najgor�tszym miejscu, Adanos w wodnym... mo�e lodowym, a Beliar w miejscu najbardziej przesi�kni�tym czarn� magi�.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_whatnow_15_06"); //W takim razie w drog�...
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_07"); //Poczekaj, to nie wszystko!
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_08"); //Przyzwali�my bog�w, �eby otwarli portal. Musimy znale�� odpowiednie miejsce, gdzie mo�na odprawi� rytua�. Musi by� przepe�nione magi�...
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_09"); //Zawalona �wi�tynia �ni�cego i miasto ork�w powinno si� nada� na taki rytua�.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_whatnow_55_10"); //Mam znale�� spos�b na to, by si� tam dosta�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_whatnow_55_11"); //Zgadza si�. Pami�taj, �e gdyby� tylko czego� potrzebowa�, s�u�� pomoc�.

	Log_CreateTopic (TOPIC_Monastir_pomoc, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Monastir_pomoc, LOG_RUNNING);
	B_LogEntry (TOPIC_Monastir_pomoc, "Jako �e bogowie s� ju� gdzie� w Dolinie, musz� ich znale�� i przekona�, by nam pomogli. Ka�dy z nich powinien by� w miejscu najbardziej zwi�zanym z samym sob�: Innos - ogie�, Adanos - woda lub l�d, Beliar - czarna magia.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Bogowie przyzwani. Teraz musz� znale�� miejsce do przeprowadzenia rytua�u i oczywi�cie przekona� trzech braci, by zgodzili si� nam pom�c.");

	B_LogEntry (TOPIC_Monastir_pomoc, "Szans� na ucieczk� z tej przekl�tej doliny jest otworzenie portalu. Monastir twierdzi, �e dobrym miejscem b�dzie orkowe miasto przed �wi�tyni� �ni�cego. No to w drog�!");

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
	description = "Potrzebuj� twojej pomocy.";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_HelpMe_15_00"); //Potrzebuj� twojej pomocy.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_55_01"); //Co teraz?

	Info_ClearChoices (DIA_NASZ_010_Monastir_HelpMe);
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, DIALOG_BACK, DIA_NASZ_010_Monastir_HelpMe_END);

	if (!MONASTIR_POTION) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Potrzebuj� mikstur.", DIA_NASZ_010_Monastir_HelpMe_potions);
	};
	if (ZabilesDlaBeliara == TRUE && (!MONASTIR_B_DONE)) {	
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Zabi�em niewinn� istot�.", DIA_NASZ_010_Monastir_HelpMe_beliar);
	};
	if (!MONASTIR_MAGIC) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�yby mi si� jakie� magiczne zwoje.", DIA_NASZ_010_Monastir_HelpMe_magic);
	};	
	if (!MONASTIR_MONEY) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�oby mi si� troch� z�ota.", DIA_NASZ_010_Monastir_HelpMe_money);
	};		
	
	if (!MONASTIR_WEAPON) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�aby mi si� lepsza bro�...", DIA_NASZ_010_Monastir_HelpMe_weapon);
	};		
	
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Pob�ogos�aw mnie!", DIA_NASZ_010_Monastir_HelpMe_blessme);
	

};

FUNC VOID DIA_NASZ_010_Monastir_HelpMe_potions()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_potions_15_02"); //Potrzebuj� mikstur.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_potions_55_03"); //Mog� wspom�c ci� eliksirami leczniczymi. Te 10 eliksir�w powinno ci si� przyda�.
	
	Createinvitems (self, ItPo_Health_03, 10);
	B_giveinvitems (self, other, ItPo_Health_03, 10);
	
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_potions_55_04"); //We� te� kilka esencji many. Niech przypominaj� ci o tym, �e w razie czego mo�esz zawsze pom�c sobie magicznymi zakl�ciami.
	
	Createinvitems (self, ItPo_Mana_01, 4);
	B_giveinvitems (self, other, ItPo_Mana_01, 4);
	
	MONASTIR_POTION = TRUE;
	
	
};
FUNC VOID DIA_NASZ_010_Monastir_HelpMe_weapon()
{
	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_weapon_15_00"); //Przyda�aby mi si� lepsza bro�...

	if(!MONASTIR_MONEY)
	{
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_weapon_55_01"); //Niestety nie dysponuj� or�em, lecz mog� wspom�c ci� z�otem na zakup, je�li zechcesz.
		
		MONASTIR_WEAPON = TRUE;
		Info_ClearChoices(DIA_NASZ_010_Monastir_HelpMe);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�oby mi si� troch� z�ota.", DIA_NASZ_010_Monastir_HelpMe_weaponmoney);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Nie, dzi�ki.", DIA_NASZ_010_Monastir_HelpMe_money_END);
	}
	else 
	{
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_weapon_55_02"); //Niestety nie mog� spe�ni� twojej pro�by, poniewa� nie mam na stanie or�u.
		MONASTIR_WEAPON = TRUE;
	};
	
};

FUNC void DIA_NASZ_010_Monastir_HelpMe_money_END()
{
	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_money_END_15_00"); //Nie, dzi�ki. Mo�e innym razem.

	// ponowiony clearchoice, bo wczesniej jest inny, a nie g��wny
	Info_ClearChoices (DIA_NASZ_010_Monastir_HelpMe);
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, DIALOG_BACK, DIA_NASZ_010_Monastir_HelpMe_END);

	if (!MONASTIR_POTION) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Potrzebuj� mikstur.", DIA_NASZ_010_Monastir_HelpMe_potions);
	};
	if (ZabilesDlaBeliara == TRUE && (!MONASTIR_B_DONE)) {	
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Zabi�em niewinn� istot�.", DIA_NASZ_010_Monastir_HelpMe_beliar);
	};
	if (!MONASTIR_MAGIC) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�yby mi si� jakie� magiczne zwoje.", DIA_NASZ_010_Monastir_HelpMe_magic);
	};	
	if (!MONASTIR_MONEY) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�oby mi si� troch� z�ota.", DIA_NASZ_010_Monastir_HelpMe_money);
	};		
	
	if (!MONASTIR_WEAPON) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�aby mi si� lepsza bro�...", DIA_NASZ_010_Monastir_HelpMe_weapon);
	};		
	
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Pob�ogos�aw mnie!", DIA_NASZ_010_Monastir_HelpMe_blessme);
	
	
};

FUNC VOID DIA_NASZ_010_Monastir_HelpMe_beliar()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_beliar_15_00"); //Odda�em cze�� Beliarowi.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_beliar_55_01"); //Dopu�ci�e� si� nie lada wyst�pku. Ale wierz�, �e zrobi�e� to z konieczno�ci.

	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );

	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_beliar_55_02"); //B�ogos�awi� ci� w imieniu Innosa. Niech oczy�ci twoj� ciemn� dusz�.

	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");

	B_GivePlayerXP (300);
	MONASTIR_B_DONE = TRUE;

};

FUNC VOID DIA_NASZ_010_Monastir_HelpMe_magic()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_magic_15_00"); //Przyda�yby mi si� jakie� magiczne zwoje.
	if (hero.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_magic_55_01"); //My�l�, �e my�liwy powinien otrzyma� zakl�cie, kt�re uniemo�liwi ruch przeciwnikowi. Dzi�ki temu nie zbli�y si� do ciebie, a ty b�dziesz m�g� go ostrzela� z �uku.
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_magic_55_02"); //We� te zakl�cia lodowej fali i bry�y lodu. Nie daj si� zabi�!
		Createinvitems (self, ItSc_IceWave, 2);
		B_giveinvitems (self, other, ItSc_IceWave, 2);
		
	};
	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_magic_55_03"); //Mam tu co� nieprzeci�tnego, ale uwa�aj, by nie wyrz�dzi� krzywdy innym ludziom!
		AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_magic_55_04"); //Z deszczem ognia pokonasz wszystkich swoich wrog�w w kilka sekund.
		Createinvitems (self, ItSc_FireRain, 2);
		B_giveinvitems (self, other, ItSc_FireRain, 2);
	};

	MONASTIR_MAGIC = TRUE;
};


func void HeroMonastir_INeedGold_DIA() {
	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_money_15_00"); //Przyda�oby mi si� troch� z�ota.
	AI_Output (self,other ,"DIA_NASZ_010_Monastir_HelpMe_money_55_01"); //Prosz�, we� te monety. To wszystko, co mam.
};

func void DIA_NASZ_010_Monastir_HelpMe_weaponmoney() {

	HeroMonastir_INeedGold_DIA();
	Createinvitems (self, ITMI_GOLD, 100);
	B_giveinvitems (self, other, ITMI_GOLD, 100);
	MONASTIR_MONEY = TRUE;
	
	// ponowiony clearchoice, bo wczesniej jest inny, a nie g��wny
	Info_ClearChoices (DIA_NASZ_010_Monastir_HelpMe);
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, DIALOG_BACK, DIA_NASZ_010_Monastir_HelpMe_END);

	if (!MONASTIR_POTION) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Potrzebuj� mikstur.", DIA_NASZ_010_Monastir_HelpMe_potions);
	};
	if (ZabilesDlaBeliara == TRUE && (!MONASTIR_B_DONE)) {	
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Zabi�em niewinn� istot�.", DIA_NASZ_010_Monastir_HelpMe_beliar);
	};
	if (!MONASTIR_MAGIC) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�yby mi si� jakie� magiczne zwoje.", DIA_NASZ_010_Monastir_HelpMe_magic);
	};	
	if (!MONASTIR_MONEY) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�oby mi si� troch� z�ota.", DIA_NASZ_010_Monastir_HelpMe_money);
	};		
	
	if (!MONASTIR_WEAPON) {
		Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Przyda�aby mi si� lepsza bro�...", DIA_NASZ_010_Monastir_HelpMe_weapon);
	};		
	
	Info_AddChoice	  (DIA_NASZ_010_Monastir_HelpMe, "Pob�ogos�aw mnie!", DIA_NASZ_010_Monastir_HelpMe_blessme);
	

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

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_HelpMe_blessme_15_00"); //Pob�ogos�aw mnie!
	AI_Output (self, other,"DIA_NASZ_010_Monastir_HelpMe_blessme_55_01"); //B�ogos�awi� ci� w imieniu Innosa. Niechaj ogie� naszego Pana zawsze p�onie w twym sercu, aby dawa� ci si�� do post�powania zgodnie z jego naukami.
	
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
	description = "Znalaz�em drog� do miasta ork�w.";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowPlace_15_00"); //Znalaz�em drog� do miasta ork�w.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowPlace_55_01"); //Istnieje �cie�ka przez g�ry. Niestety, brama do miasta jest zapiecz�towana. Jaka� magiczna aura nie pozwala wej�� do �rodka.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowPlace_55_02"); //Hmm... Spr�buj� co� temu zaradzi�.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowPlace_55_03"); //Mam ci� tam zaprowadzi�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowPlace_55_04"); //Nie marnuj czasu, dam sobie rad�. Gdzie jest to miejsce?
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowPlace_55_05"); //Mi�dzy obozem bandyt�w a obozem my�liwych �cie�ka robi si� w�sza. Tam musisz skoczy� na ska�y i po prostu i�� w g�r�.

	Npc_ExchangeRoutine (self, "Gate");
	
	B_LogEntry (TOPIC_Monastir_pomoc, "Powiedzia�em magowi, jak dosta� si� do orkowego miasta. Mo�e uda mu si� prze�ama� magiczn� piecz��.");
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
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_15_00"); //Ta brama... Z daleka czu� pulsuj�c� energi� magiczn�.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_01"); //Prawdopodobnie podczas zniszczenia bariery tutaj, u jej �r�de�, energia skumulowa�a si� maksymalnie i powsta�a ma�a bariera nie do sforsowania.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_02"); //Chyba b�d� w stanie si� tym zaj��. Potrzebuj� jednak do tego sok�w z pewnej ro�liny.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_NearGate_55_03"); //Niech zgadn�, ta ro�lina jest bardzo rzadka i nie spos�b j� zdoby�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_04"); //Ta ro�lina to s�oneczny aloes. Ro�nie na odchodach trolla.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_05"); //Jednak�e jeden troll nie wystarczy, �eby ro�lina zakie�kowa�a. Potrzeba ca�ej rodzinki tych bestii.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_NearGate_55_06"); //Gdzie w G�rniczej Dolinie w jednym miejscu przebywa tyle trolli?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_07"); //Nie wiem... mo�e zapytaj Silasa? Sp�dzi�em jedn� noc w karczmie i z rozmowy wynikn�o, �e w Kolonii G�rniczej przebywa ju� od wielu lat.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_NearGate_55_08"); //Gdy ju� znajdziesz te ro�liny, nazbieraj ich przynajmniej pi��. My�l�, �e z tak� ilo�ci� soku z ich li�ci zdo�am prze�ama� barier�.

	B_LogEntry (TOPIC_Monastir_pomoc, "Monastir potrzebuje 5 s�onecznych aloes�w, kt�re rosn� w odchodach trolli. Nie wystarczy jednak jeden troll, by ro�lina uros�a. Kto�, kto d�ugo przebywa� za barier�, mo�e wiedzie�, gdzie mog� znale�� tyle tych bestii. Monastir poradzi� mi, �ebym zajrza� do Silasa.");
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
	description = "Mam pi�� ro�lin.";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_MamSkladniki_15_00"); //Mam pi�� ro�lin.
	B_giveinvitems (other, self, ItPl_Sagitta_Herb_MIS, 5);
	AI_Output (self, other,"DIA_NASZ_010_Monastir_MamSkladniki_55_01"); //Doskonale, a teraz odsu� si�.

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
	AI_Output (self, other,"DIA_NASZ_010_Monastir_AfterOpen_15_00"); //Uda�o mi si�.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_AfterOpen_55_01"); //Chod�, zobaczymy co kryje to miejsce.

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
	B_LogEntry (TOPIC_Fabula, "Wszystko, co mia�em zrobi�, zrobi�em. Teraz musz� poczeka�, a� Innos, Adanos oraz Beliar odprawi� rytua� i przej�� z innymi przez portal.");

	B_StartOtherRoutine (NASZ_402_Innos, "Ritual");
	B_StartOtherRoutine (NASZ_403_Adanos, "Ritual");
	B_StartOtherRoutine (NASZ_404_Beliar, "Ritual");
};

var int WillMusiSprowadzicPozostalychBogow;
FUNC VOID DIA_NASZ_010_Monastir_StandInFinal_Info()
{
	AI_Output (self, other,"DIA_NASZ_010_Monastir_StandInFinal_15_00"); //Patrz. Tam na g�rze jest kamienny o�tarz.

	if (HowManyGods() == 0) {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_StandInFinal_55_01"); //Musisz teraz przywo�a� tu bog�w, �eby odprawili rytua�.
		WillMusiSprowadzicPozostalychBogow = TRUE;
	}
	
	else if (HowManyGods() == 1 || HowManyGods() == 2) {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_StandInFinal_55_02"); //Nawet kto� ju� tam jest! Sprowad� wszystkich, �eby wsp�lnie odprawili rytua�.
		WillMusiSprowadzicPozostalychBogow = TRUE;
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_010_Monastir_StandInFinal_55_03"); //S� r�wnie� wszyscy bogowie. Niech zaczynaj�.
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
	description = "Wszyscy bogowie s� gotowi.";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_GodReady_15_00"); //Wszyscy bogowie s� gotowi.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_GodReady_55_01"); //A wi�c niech zaczynaj�!
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
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_01"); //Nieumar�ych, kt�rzy wbrew zasadom panuj�cym na tym �wiecie przemierzaj� �wiat �miertelnych niepokoj�c ich �ywot?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_02"); //Doprawdy, straszne rzeczy dziej� si� w tym miejscu. Po raz pierwszy w swoim �yciu jestem �wiadkiem tak du�ego gniewu niespokojnych dusz.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_ErakHelp_55_03"); //Jak my�lisz, co ich tutaj sprowadza? Jaki� czar, a mo�e ch�� zniszczenia?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_04"); //Nie, to na pewno nic z tego. Od chwili kiedy si� tutaj zjawi�em, pocz��em wyczuwa� pot�ne zak��cenia w strukturze magii. Kolonia zosta�a otoczona niewidzialn� dla oka �miertelnika aur�.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_05"); //Aura ta emanuje na tyle du�� energi�, �e mo�e zmusza� nieumar�ych, aby ci przybywali do tego �wiata.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_06"); //Nie wiem dok�adnie, jak ona dzia�a, ale najprawdopodobniej sprowadza ona tak�e dusze, kt�re zostaj� uwi�zione w tych martwych skorupach.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_07"); //Zakl�cie otaczaj�ce dolin�, poprzez katusze zmusza dusze, by pozosta�y w tym miejscu.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_ErakHelp_55_08"); //Czy mo�emy co� z tym zrobi�? Je�eli m�wisz prawd�, w naszym obowi�zku le�y pom�c tym wszystkim um�czonym duszom.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_09"); //Do g�owy przychodzi mi jedno rozwi�zanie, jednak b�dzie si� ono wi�za�o z pewnym niebezpiecze�stwem.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_10"); //Gdzie� w G�rniczej Dolinie znajduje si� �r�d�o mocy. Nie wiem dok�adnie, czym ono jest, ale prawdopodobnie b�dzie to kapliczka lub pos��ek.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_11"); //To w�a�nie z tego miejsca emanuje niezrozumia�a dla mnie energia, kt�ra wyr�nia si� na tle aury, jaka nas otacza.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_ErakHelp_55_12"); //Powiniene� j� odszuka�. To pierwszy i najwa�niejszy krok. Musimy znale�� �r�d�o.

	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Monastir sam przyzna�, �e w G�rniczej Dolinie da si� odczu� spore st�enie energii magicznej. Gdzie� w okolicy znajduje si� jej pot�ne �r�d�o.");
	
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
	description = "Za zamkiem widzia�em pos�g demona.";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowDemon_15_00"); //Za zamkiem widzia�em pos�g demona.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowDemon_55_01"); //Bardzo mo�liwe, �e to jest w�a�nie �r�d�o ciemnej energii. Powiniene� go zniszczy� za wszelk� cen�, inaczej nied�ugo nie b�dziemy mieli szans, aby zatrzyma� ten istny szturm nieumar�ych.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowDemon_55_02"); //Jednak strze� si�! Je�eli zosta� on po�wi�cony mrocznym si�om, te mog� wys�a� swe s�ugi, by ci� powstrzyma�.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowDemon_55_03"); //Nie takim niebezpiecze�stwom stawia�em czo�a, nawet demony nie powstrzymaj� mnie przed zniszczeniem tego miejsca kultu.
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IKnowDemon_55_04"); //Jak go zniszczy�?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowDemon_55_05"); //Potrzebny b�dzie jaki� m�ot i woda �wi�cona. P�niej dokonamy rytua�u b�ogos�awi�cego bro�.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IKnowDemon_55_06"); //Uderz po prostu takim m�otem w pos�g i powinien si� zniszczy�.

	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Musz� zniszczy� miejsce orkowego kultu, kt�re mo�e by� przyczyn� pojawiania si� w tym miejscu tylu nieumar�ych. Mag ostrzeg� mnie jednak przed mrocznymi si�ami i ich s�ugami, kt�re mog� spr�bowa� mnie powstrzyma�. Aby zniszczy� pos�g, musz� stan�� przy nim i uderzy� z ca�ej si�y jakim� m�otem. Najpierw jednak musimy pob�ogos�awi� bro�.");

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
	description = "Mam m�ot i wod� �wi�con�.";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IHaveMlot_15_00"); //Mam m�ot i wod� �wi�con�.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveMlot_55_01"); //Daj mi wod�.

	B_GiveInvItems(other,self,ItMi_HolyWater,1);
	
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Function(other,MonastirEffect); 
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveMlot_55_02"); //Innosie, pob�ogos�aw t� bro�. Spraw, by sta�a si� mocna i zwyci�y�a pot�g� ciemno�ci!
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveMlot_55_03"); //To wszystko. Teraz zniszcz pos�g uderzaj�c w ni� tym m�otem.

	Monastir_ShowHammersInfo = true;


	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Ma�y rytua� si� uda�. Pora zniszczy� pos�g!");
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
	description = "Zniszczy�em pos�g.";
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
	AI_Output (other, self,"DIA_NASZ_010_Monastir_IHaveKilled_15_00"); //Zniszczy�em pos�g.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveKilled_55_01"); //Wyczu�em to, tak pot�ny zanik magii jest odczuwalny nawet dla maga-adepta. Miejmy nadziej�, i� to pomo�e nam rozwi�za� ten problem.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveKilled_55_02"); //Opracowa�em map�, na kt�rej zaznaczy�em miejsca przepe�nione magiczn� energi�. Wydaje mi si�, �e w�a�nie tam pojawi� si� demony i zombie.
	Createinvitems (self, ItNa_Mapa_Demonow, 1);
	B_giveinvitems (self, other, ItNa_Mapa_Demonow, 1);
	AI_Output (self, other,"DIA_NASZ_010_Monastir_IHaveKilled_55_03"); //Daj� ci j�, �eby� wiedzia�, gdzie jeszcze spodziewa� si� zagro�enia.
	
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Mag da� mi map�, na kt�rej zaznaczy� miejsca przepe�nione magiczn� energi�. Powinienem na nie uwa�a�, gdy� w�a�nie tam mog� pojawi� si� demony i zombie. Powinienem poinformowa� Kerolotha o ca�ej akcji z kapliczk�.");
	
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
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_55_02"); //Je�li bogowie tak zako�czyli rytua�, to na pewno jest w tym jaki� sens.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_55_03"); //Otworzy�y si� wrota do jakiej� pieczary. Mo�liwe, �e bogowie tak to sobie wymy�lili.

	Log_SetTopicStatus (TOPIC_Monastir_pomoc, LOG_SUCCESS);
	B_LogEntry (TOPIC_Monastir_pomoc, "Nie wiem co to ma znaczy�... Bogowie odprawili rytua�, ale portalu nigdzie nie wida�.");
	
	Log_CreateTopic (TOPIC_OrcCity_In, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OrcCity_In, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcCity_In, "Szlag by to trafi�. My�la�em, �e to ju� koniec i wydostaniemy si� z tej doliny, kt�rej ja sam mam ju� powoli do��. Bogowie odprawili rytua� i znikn�li. �adna mi pomoc! Ale Monastir uwa�a, �e nie zrobili tego bez powodu. �e 'panuj�cy nad tym �wiatem' maj� w tym jaki� cel. Monastir dostrzeg�, �e odsun�� si� jaki� g�az... Szykuje si� kolejna niebezpieczna podr�...");

	B_Kapitelwechsel (5, NEWWORLD_ZEN );

	Info_ClearChoices (DIA_NASZ_010_Monastir_Kap5Start);
		Info_AddChoice	  (DIA_NASZ_010_Monastir_Kap5Start, "Mam wej�� do �rodka?", DIA_NASZ_010_Monastir_Kap5Start_yes);

};

FUNC VOID DIA_NASZ_010_Monastir_Kap5Start_yes()
{

	AI_Output (other,self ,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_00"); //Mam wej�� do �rodka?
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_01"); //A czy masz lepszy pomys�? Zrobili�my ju� tak du�o, �e nie mo�emy si� teraz podda�.
	AI_Output (other,self ,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_02"); //Oczywi�cie... Ciekawe, czy i tym razem stan� twarz� w twarz ze �mierci�.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_03"); //Tego nie wie nikt. Id� z b�ogos�awie�stwem.
	AI_Output (self, other,"DIA_NASZ_010_Monastir_Kap5Start_yes_15_04"); //Niech �wiat�o Innosa odsuwa ci� od otch�ani.

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

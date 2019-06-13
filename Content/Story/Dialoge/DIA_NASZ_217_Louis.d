//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_EXIT   (C_INFO)
{
	npc         = NASZ_217_Louis;
	nr          = 999;
	condition   = DIA_NASZ_217_Louis_EXIT_Condition;
	information = DIA_NASZ_217_Louis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_217_Louis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_217_Louis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_siema   (C_INFO)
{
	npc         = NASZ_217_Louis;
 	nr          = 1;
 	condition   = DIA_NASZ_217_Louis_siema_Condition;
 	information = DIA_NASZ_217_Louis_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_217_Louis_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_217_Louis_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_217_Louis_siema_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_NASZ_217_Louis_siema_55_01"); //Zw� mnie Louis, szczurze l�dowy.
};

//*********************************************************************
//	         Lad
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_lad   (C_INFO)
{
	npc         = NASZ_217_Louis;
 	nr          = 2;
 	condition   = DIA_NASZ_217_Louis_lad_Condition;
 	information = DIA_NASZ_217_Louis_lad_Info;
 	permanent   = FALSE;
 	description = "Jeste� wilkiem morskim?";
};

FUNC INT DIA_NASZ_217_Louis_lad_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_217_Louis_lad_Info()
{
	AI_Output (other,self ,"DIA_NASZ_217_Louis_lad_15_00"); //Jeste� wilkiem morskim?
	AI_Output (self, other,"DIA_NASZ_217_Louis_lad_55_01"); //Ano. Niegdy� by�em kapitanem. Ale to stare dzieje.
	AI_Output (self, other,"DIA_NASZ_217_Louis_lad_55_02"); //Nieszcz�sne wiatry sprawi�y, �e m�j statek rozbi� si� u wybrze�y Khorinis, a wtedy ci n�dzarze ze stra�y stwierdzili, �e celowo uderzy�em w ska�y, by zabi� za�og�.
	AI_Output (self, other,"DIA_NASZ_217_Louis_lad_55_03"); //Idioci! Wyobra�asz sobie cz�owieka, kt�ry ledwo �ywy dop�ywa do brzegu, a zamiast pomocy zostaje pojmany przez stra�? Zosta�em zes�any do kolonii i do teraz tu gnij�.
	AI_Output (self, other,"DIA_NASZ_217_Louis_lad_55_04"); //Ale co mi tam. Przywyk�em do �ycia tutaj, jest dobra zabawa! A ja jestem m�ody i tego od �ycia wymagam.
};

//*********************************************************************
//	         Waz
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_waz   (C_INFO)
{
	npc         = NASZ_217_Louis;
 	nr          = 10;
 	condition   = DIA_NASZ_217_Louis_waz_Condition;
 	information = DIA_NASZ_217_Louis_waz_Info;
 	permanent   = FALSE;
 	important	= TRUE;
};

FUNC INT DIA_NASZ_217_Louis_waz_Condition()	
{
	if (KAPITEL >= 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_217_Louis_waz_Info()
{
	AI_Output (self, other,"DIA_NASZ_217_Louis_waz_15_00"); //Jeste� bardzo ochoczy do pracy. W twoim wieku te� taki by�em.
	AI_Output (other, self,"DIA_NASZ_217_Louis_waz_55_01"); //Do czego zmierzasz?
	AI_Output (self, other,"DIA_NASZ_217_Louis_waz_15_02"); //Obserwuj� ci� troszk�. Nie brak ci odwagi. Takich w�a�nie ludzi spotyka�em na morzu. Pirat�w i rabusi�w.
	AI_Output (self, other,"DIA_NASZ_217_Louis_waz_15_03"); //Wielu z nich by�o nadzwyczaj silnych. Mo�e to przez warunki fizyczne, a mo�e czerpali si�� z czego innego...
	AI_Output (other, self,"DIA_NASZ_217_Louis_waz_55_04"); //To znaczy?
	AI_Output (self, other,"DIA_NASZ_217_Louis_waz_15_05"); //Kilka legend m�wi�o o sk�rze w�a, kt�ra rzekomo ma dawa� si��. Wiele lat zabija�em b�otne w�e i zdziera�em z nich sk�ry, ale nic to nie dawa�o.
	AI_Output (other, self,"DIA_NASZ_217_Louis_waz_55_06"); //Mo�e mi si� kiedy� poszcz�ci...

	Log_CreateTopic (TOPIC_Louis_weze, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Louis_weze, LOG_RUNNING);
	B_LogEntry (TOPIC_Louis_weze, "Louis powiedzia� mi, �e sk�ra z b�otnego w�a dawa�a pono� piratom niezwyk�� si��, cho� sam nie potrafi� ustali�, jak to si� dzieje. C�, najlepiej by�oby zapyta� si� o to prawdziwego pirata...");

};

//*********************************************************************
//	         WazFinish
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_wazFinish   (C_INFO)
{
	npc         = NASZ_217_Louis;
 	nr          = 10;
 	condition   = DIA_NASZ_217_Louis_wazFinish_Condition;
 	information = DIA_NASZ_217_Louis_wazFinish_Info;
 	permanent   = FALSE;
 	description	= "Wypi�em mikstur� ze sk�r w�y.";
};

FUNC INT DIA_NASZ_217_Louis_wazFinish_Condition()	
{
	if (npc_knowsinfo(other,DIA_NASZ_008_Miecz_dziala))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_217_Louis_wazFinish_Info()
{
	AI_Output (other, self,"DIA_NASZ_217_Louis_wazFinish_15_00"); //Wypi�em mikstur� ze sk�r w�y.
	AI_Output (self, other,"DIA_NASZ_217_Louis_wazFinish_15_01"); //M�wisz powa�nie? Jakim cudem? Kto przyrz�dzi� dla ciebie wywar?
	AI_Output (other, self,"DIA_NASZ_217_Louis_wazFinish_15_02"); //Prawdziwy pirat. Zrobi� j� dla mnie Miecz. Mo�esz sam si� do niego uda�. Znajdziesz go przy zawalonej wie�y w drodze do obozu �owc�w ork�w.
	AI_Output (other, self,"DIA_NASZ_217_Louis_wazFinish_15_03"); //Jednak odradzam. Ten nap�j jest tak obrzydliwy, �e nie zdecydowa�bym si� skosztowa� go po raz drugi.
	AI_Output (self, other,"DIA_NASZ_217_Louis_wazFinish_15_04"); //Dzi�ki za informacj�. Za jaki� czas udam si� do tego pirata. Marynarskie czasy ju� za mn�, wi�c chyba nie skrzy�ujemy szabli, tylko si� dogadamy.

	B_GivePlayerXP(100);
};




//*********************************************************************
//	Info GoToRenegaci
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_GoToRenegaci   (C_INFO)
{
	npc         = NASZ_217_Louis;
 	nr          = 4;
 	condition   = DIA_NASZ_217_Louis_GoToRenegaci_Condition;
 	information = DIA_NASZ_217_Louis_GoToRenegaci_Info;
 	permanent   = FALSE;
	description = "Chod�, udamy si� zaatakowa� paladyn�w renegat�w.";
};

FUNC INT DIA_NASZ_217_Louis_GoToRenegaci_Condition()	
{
	if (GestathRenegatOK == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_217_Louis_GoToRenegaci_Info()
{
	AI_Output (other, self,"DIA_NASZ_217_Louis_GoToRenegaci_15_00"); //Chod�, udamy si� zaatakowa� paladyn�w renegat�w.
	AI_Output (self, other,"DIA_NASZ_217_Louis_GoToRenegaci_55_01"); //M�j miecz dawno nie kosztowa� ludzkiej krwi. Dawno temu, gdy jeszcze p�ywa�em na statkach kupieckich, cz�sto musieli�my odpiera� pirackie grabie�e.
	AI_Output (self, other,"DIA_NASZ_217_Louis_GoToRenegaci_55_02"); //Chocia� my�l�, �e i tak za�atwimy to �ukami. Prowad�.

	Npc_ExchangeRoutine (self, "FollowRenegaci");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_217_Louis,1);
};



//*********************************************************************
//	         CanUTeach
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_CanUTeach   (C_INFO)
{
	npc         = NASZ_217_Louis;
 	nr          = 98;
 	condition   = DIA_NASZ_217_Louis_CanUTeach_Condition;
 	information = DIA_NASZ_217_Louis_CanUTeach_Info;
 	permanent   = FALSE;
 	description = "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_NASZ_217_Louis_CanUTeach_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_217_Louis_CanUTeach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_217_Louis_CanUTeach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"DIA_NASZ_217_Louis_CanUTeach_55_01"); //Pewnie! Od dziecka walcz� szpadami. Ch�tnie naucz� ci� sztuki walki broni� jednor�czn�.
	AI_Output (self, other,"DIA_NASZ_217_Louis_CanUTeach_55_02"); //Do wymachiwania cienk� kling� potrzeba r�wnie� nie lada zr�czno�ci.
	AI_Output (self, other,"DIA_NASZ_217_Louis_CanUTeach_55_03"); //Ale to ci� b�dzie kosztowa�.
	
	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Louis nauczy mnie walki broni� jednor�czn� i pomo�e mi poprawi� zr�czno��.");
};


var int LouisCantTeach;
func void LouisSay_YouArePro() {
	AI_Output(self,other,"LouisSay_YouArePro_04_00"); //Ju� niczego ci� nie naucz�. Opanowa�e� w pe�ni pirackie mistrzostwo walki szablami.
	AI_Output(self,other,"LouisSay_YouArePro_04_01"); //Teraz musisz po prostu walczy�, �eby twoje d�onie nie zapomnia�y jak trzyma si� bro�!
	LouisCantTeach = TRUE;
};


//*********************************************************************
//	         Teach
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_Teach   (C_INFO)
{
	npc         = NASZ_217_Louis;
 	nr          = 100;
 	condition   = DIA_NASZ_217_Louis_Teach_Condition;
 	information = DIA_NASZ_217_Louis_Teach_Info;
 	permanent   = TRUE;
 	description = "Ucz mnie walki mieczem.";
};

FUNC INT DIA_NASZ_217_Louis_Teach_Condition()	
{
	if (Npc_KnowsInfo (other, DIA_NASZ_217_Louis_CanUTeach))
	&& (LouisCantTeach == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_217_Louis_Teach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_217_Louis_Teach_15_00"); //Ucz mnie walki mieczem.
	
	if (other.HitChance[NPC_TALENT_1H] >= 60) {
		LouisSay_YouArePro();
		return;
	};

	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);

	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);

	if (other.HitChance[NPC_TALENT_1H] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5); };
	};
	
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
/*
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1c); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5c); };
	};
*/
};

FUNC VOID DIA_NASZ_217_Louis_Teach_Back ()
{
	Info_ClearChoices (DIA_NASZ_217_Louis_Teach);
};

FUNC VOID DIA_NASZ_217_Louis_Teach_1H_1 ()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
};

FUNC VOID DIA_NASZ_217_Louis_Teach_1H_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
};

FUNC VOID DIA_NASZ_217_Louis_Teach_1H_1b ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
/*	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1C); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5C); };
	};
*/
};

FUNC VOID DIA_NASZ_217_Louis_Teach_1H_5b ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
/*	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1C); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5C); };
	};*/
};

FUNC VOID DIA_NASZ_217_Louis_Teach_1H_1c ()
{
	if (hero.lp >= 3){ B_giveinvitems (other, self, ItMi_Gold, 15); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		// 
	}
	else {
	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1c); };
	if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5c); };
	};
};

FUNC VOID DIA_NASZ_217_Louis_Teach_1H_5c ()
{
	if (hero.lp >= 15){ B_giveinvitems (other, self, ItMi_Gold, 75); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		LouisSay_YouArePro();
		Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	}
	else {
	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 1. (3 PN, 15 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_1c); };
	if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Bro� jednor�czna + 5. (15 PN, 75 szt. z�ota)",DIA_NASZ_217_Louis_Teach_1h_5c); };
	};
};










//*********************************************************************
//	Teach Zrecznosc
//*********************************************************************
INSTANCE DIA_NASZ_217_Louis_TeachDex   (C_INFO)
{
	npc         = NASZ_217_Louis;
 	nr          = 101;
 	condition   = DIA_NASZ_217_Louis_TeachDex_Condition;
 	information = DIA_NASZ_217_Louis_TeachDex_Info;
 	permanent   = TRUE;
 	description = "Chc� by� zr�czniejszy.";
};

FUNC INT DIA_NASZ_217_Louis_TeachDex_Condition()
{
	if (Npc_KnowsInfo (other, DIA_NASZ_217_Louis_CanUTeach))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_217_Louis_TeachDex_Info()
{
	AI_Output (other,self ,"DIA_NASZ_217_Louis_TeachDex_15_00"); //Chc� by� zr�czniejszy.

	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);
	
	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
	};
};

func void DIA_NASZ_217_Louis_TeachDex_BACK()
{
	Info_ClearChoices (DIA_NASZ_217_Louis_TeachDex);
};
func void DIA_NASZ_217_Louis_TeachDex_1()
{
	if (hero.lp >= 1 && hero.attribute[ATR_DEXTERITY] < 90) { B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, 90);
	
	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
	};
};
func void DIA_NASZ_217_Louis_TeachDex_5()
{
	if (hero.lp >= 5 && hero.attribute[ATR_DEXTERITY] <= 85) { B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, 90);
	
	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
	};
};

func void DIA_NASZ_217_Louis_TeachDex_1High()
{
	if (hero.lp >= 2 && hero.attribute[ATR_DEXTERITY] < 90) { B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, 90);
	
	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
	};
};
func void DIA_NASZ_217_Louis_TeachDex_5High()
{
	if (hero.lp >= 10 && hero.attribute[ATR_DEXTERITY] <= 85) { B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, 90);
	
	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 1. (2 PN, 10 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zr�czno�� + 5. (10 PN, 50 szt. z�ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
var int LouisPickPocket;
// **********************************
INSTANCE DIA_NASZ_217_Louis_PICKPOCKET (C_INFO)
{
	npc			= NASZ_217_Louis;
	nr			= 900;
	condition	= DIA_NASZ_217_Louis_PICKPOCKET_Condition;
	information	= DIA_NASZ_217_Louis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_NASZ_217_Louis_PICKPOCKET_Condition()
{
	C_Beklauen (7);
};
 
FUNC VOID DIA_NASZ_217_Louis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_217_Louis_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_217_Louis_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_217_Louis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_217_Louis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_217_Louis_PICKPOCKET_DoIt);
};

func void DIA_NASZ_217_Louis_PICKPOCKET_DoIt()
{
	B_BeklauenThings (ItNa_Key_Louis, 1);
	
	if (other.attribute[ATR_DEXTERITY] < 7) {
		B_LogEntry (TOPIC_Keroloth_Louis, "Jasna cholera, nie uda�o mi si� okra�� Louisa... Spr�buj�, gdy b�d� bardziej do�wiadczonym z�odziejem.");
	};
	
	Info_ClearChoices (DIA_NASZ_217_Louis_PICKPOCKET);
};
	
func void DIA_NASZ_217_Louis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_217_Louis_PICKPOCKET);
};
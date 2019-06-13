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
	AI_Output (other,self ,"DIA_NASZ_217_Louis_siema_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_NASZ_217_Louis_siema_55_01"); //Zw¹ mnie Louis, szczurze l¹dowy.
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
 	description = "Jesteœ wilkiem morskim?";
};

FUNC INT DIA_NASZ_217_Louis_lad_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_217_Louis_lad_Info()
{
	AI_Output (other,self ,"DIA_NASZ_217_Louis_lad_15_00"); //Jesteœ wilkiem morskim?
	AI_Output (self, other,"DIA_NASZ_217_Louis_lad_55_01"); //Ano. Niegdyœ by³em kapitanem. Ale to stare dzieje.
	AI_Output (self, other,"DIA_NASZ_217_Louis_lad_55_02"); //Nieszczêsne wiatry sprawi³y, ¿e mój statek rozbi³ siê u wybrze¿y Khorinis, a wtedy ci nêdzarze ze stra¿y stwierdzili, ¿e celowo uderzy³em w ska³y, by zabiæ za³ogê.
	AI_Output (self, other,"DIA_NASZ_217_Louis_lad_55_03"); //Idioci! Wyobra¿asz sobie cz³owieka, który ledwo ¿ywy dop³ywa do brzegu, a zamiast pomocy zostaje pojmany przez stra¿? Zosta³em zes³any do kolonii i do teraz tu gnijê.
	AI_Output (self, other,"DIA_NASZ_217_Louis_lad_55_04"); //Ale co mi tam. Przywyk³em do ¿ycia tutaj, jest dobra zabawa! A ja jestem m³ody i tego od ¿ycia wymagam.
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
	AI_Output (self, other,"DIA_NASZ_217_Louis_waz_15_00"); //Jesteœ bardzo ochoczy do pracy. W twoim wieku te¿ taki by³em.
	AI_Output (other, self,"DIA_NASZ_217_Louis_waz_55_01"); //Do czego zmierzasz?
	AI_Output (self, other,"DIA_NASZ_217_Louis_waz_15_02"); //Obserwujê ciê troszkê. Nie brak ci odwagi. Takich w³aœnie ludzi spotyka³em na morzu. Piratów i rabusiów.
	AI_Output (self, other,"DIA_NASZ_217_Louis_waz_15_03"); //Wielu z nich by³o nadzwyczaj silnych. Mo¿e to przez warunki fizyczne, a mo¿e czerpali si³ê z czego innego...
	AI_Output (other, self,"DIA_NASZ_217_Louis_waz_55_04"); //To znaczy?
	AI_Output (self, other,"DIA_NASZ_217_Louis_waz_15_05"); //Kilka legend mówi³o o skórze wê¿a, która rzekomo ma dawaæ si³ê. Wiele lat zabija³em b³otne wê¿e i zdziera³em z nich skóry, ale nic to nie dawa³o.
	AI_Output (other, self,"DIA_NASZ_217_Louis_waz_55_06"); //Mo¿e mi siê kiedyœ poszczêœci...

	Log_CreateTopic (TOPIC_Louis_weze, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Louis_weze, LOG_RUNNING);
	B_LogEntry (TOPIC_Louis_weze, "Louis powiedzia³ mi, ¿e skóra z b³otnego wê¿a dawa³a ponoæ piratom niezwyk³¹ si³ê, choæ sam nie potrafi³ ustaliæ, jak to siê dzieje. Có¿, najlepiej by³oby zapytaæ siê o to prawdziwego pirata...");

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
 	description	= "Wypi³em miksturê ze skór wê¿y.";
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
	AI_Output (other, self,"DIA_NASZ_217_Louis_wazFinish_15_00"); //Wypi³em miksturê ze skór wê¿y.
	AI_Output (self, other,"DIA_NASZ_217_Louis_wazFinish_15_01"); //Mówisz powa¿nie? Jakim cudem? Kto przyrz¹dzi³ dla ciebie wywar?
	AI_Output (other, self,"DIA_NASZ_217_Louis_wazFinish_15_02"); //Prawdziwy pirat. Zrobi³ j¹ dla mnie Miecz. Mo¿esz sam siê do niego udaæ. Znajdziesz go przy zawalonej wie¿y w drodze do obozu ³owców orków.
	AI_Output (other, self,"DIA_NASZ_217_Louis_wazFinish_15_03"); //Jednak odradzam. Ten napój jest tak obrzydliwy, ¿e nie zdecydowa³bym siê skosztowaæ go po raz drugi.
	AI_Output (self, other,"DIA_NASZ_217_Louis_wazFinish_15_04"); //Dziêki za informacjê. Za jakiœ czas udam siê do tego pirata. Marynarskie czasy ju¿ za mn¹, wiêc chyba nie skrzy¿ujemy szabli, tylko siê dogadamy.

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
	description = "ChodŸ, udamy siê zaatakowaæ paladynów renegatów.";
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
	AI_Output (other, self,"DIA_NASZ_217_Louis_GoToRenegaci_15_00"); //ChodŸ, udamy siê zaatakowaæ paladynów renegatów.
	AI_Output (self, other,"DIA_NASZ_217_Louis_GoToRenegaci_55_01"); //Mój miecz dawno nie kosztowa³ ludzkiej krwi. Dawno temu, gdy jeszcze p³ywa³em na statkach kupieckich, czêsto musieliœmy odpieraæ pirackie grabie¿e.
	AI_Output (self, other,"DIA_NASZ_217_Louis_GoToRenegaci_55_02"); //Chocia¿ myœlê, ¿e i tak za³atwimy to ³ukami. ProwadŸ.

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
 	description = "Mo¿esz mnie czegoœ nauczyæ?";
};

FUNC INT DIA_NASZ_217_Louis_CanUTeach_Condition()	
{
		return TRUE;
};

FUNC VOID DIA_NASZ_217_Louis_CanUTeach_Info()
{
	AI_Output (other,self ,"DIA_NASZ_217_Louis_CanUTeach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"DIA_NASZ_217_Louis_CanUTeach_55_01"); //Pewnie! Od dziecka walczê szpadami. Chêtnie nauczê ciê sztuki walki broni¹ jednorêczn¹.
	AI_Output (self, other,"DIA_NASZ_217_Louis_CanUTeach_55_02"); //Do wymachiwania cienk¹ kling¹ potrzeba równie¿ nie lada zrêcznoœci.
	AI_Output (self, other,"DIA_NASZ_217_Louis_CanUTeach_55_03"); //Ale to ciê bêdzie kosztowaæ.
	
	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Louis nauczy mnie walki broni¹ jednorêczn¹ i pomo¿e mi poprawiæ zrêcznoœæ.");
};


var int LouisCantTeach;
func void LouisSay_YouArePro() {
	AI_Output(self,other,"LouisSay_YouArePro_04_00"); //Ju¿ niczego ciê nie nauczê. Opanowa³eœ w pe³ni pirackie mistrzostwo walki szablami.
	AI_Output(self,other,"LouisSay_YouArePro_04_01"); //Teraz musisz po prostu walczyæ, ¿eby twoje d³onie nie zapomnia³y jak trzyma siê broñ!
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
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5); };
	};
	
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
/*
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1c); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5c); };
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
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
};

FUNC VOID DIA_NASZ_217_Louis_Teach_1H_5 ()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5); };
	};
	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
};

FUNC VOID DIA_NASZ_217_Louis_Teach_1H_1b ()
{
	if (hero.lp >= 2){ B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);

	Info_ClearChoices 	(DIA_NASZ_217_Louis_Teach);
	Info_AddChoice 		(DIA_NASZ_217_Louis_Teach,	DIALOG_BACK		,DIA_NASZ_217_Louis_Teach_Back);
	if (other.HitChance[NPC_TALENT_1H] < 60) {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
/*	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1C); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5C); };
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
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1b); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5b); };
	};
/*	if (other.HitChance[NPC_TALENT_1H] < 60) && (other.HitChance[NPC_TALENT_1H] >= 30) {
		if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1C); };
		if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5C); };
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
	if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1c); };
	if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5c); };
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
	if (npc_hasitems (other, ItMi_Gold) >= 15) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 1. (3 PN, 15 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_1c); };
	if (npc_hasitems (other, ItMi_Gold) >= 75) { Info_AddChoice		(DIA_NASZ_217_Louis_Teach, "Broñ jednorêczna + 5. (15 PN, 75 szt. z³ota)",DIA_NASZ_217_Louis_Teach_1h_5c); };
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
 	description = "Chcê byæ zrêczniejszy.";
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
	AI_Output (other,self ,"DIA_NASZ_217_Louis_TeachDex_15_00"); //Chcê byæ zrêczniejszy.

	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);
	
	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
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
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
	};
};
func void DIA_NASZ_217_Louis_TeachDex_5()
{
	if (hero.lp >= 5 && hero.attribute[ATR_DEXTERITY] <= 85) { B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, 90);
	
	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
	};
};

func void DIA_NASZ_217_Louis_TeachDex_1High()
{
	if (hero.lp >= 2 && hero.attribute[ATR_DEXTERITY] < 90) { B_giveinvitems (other, self, ItMi_Gold, 10); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, 90);
	
	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
	};
};
func void DIA_NASZ_217_Louis_TeachDex_5High()
{
	if (hero.lp >= 10 && hero.attribute[ATR_DEXTERITY] <= 85) { B_giveinvitems (other, self, ItMi_Gold, 50); };
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, 90);
	
	Info_ClearChoices   (DIA_NASZ_217_Louis_TeachDex);
	
	Info_AddChoice 		(DIA_NASZ_217_Louis_TeachDex, DIALOG_BACK, DIA_NASZ_217_Louis_TeachDex_BACK);

	if (other.attribute[ATR_DEXTERITY] < 50) {
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (1 PN, 5 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (5 PN, 25 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5); };
	}
	
	else {
		if (npc_hasitems (other, ItMi_Gold) >= 10) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 1. (2 PN, 10 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_1High); };
		if (npc_hasitems (other, ItMi_Gold) >= 50) { Info_AddChoice		(DIA_NASZ_217_Louis_TeachDex,"Zrêcznoœæ + 5. (10 PN, 50 szt. z³ota)",DIA_NASZ_217_Louis_TeachDex_5High); };
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
		B_LogEntry (TOPIC_Keroloth_Louis, "Jasna cholera, nie uda³o mi siê okraœæ Louisa... Spróbujê, gdy bêdê bardziej doœwiadczonym z³odziejem.");
	};
	
	Info_ClearChoices (DIA_NASZ_217_Louis_PICKPOCKET);
};
	
func void DIA_NASZ_217_Louis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_217_Louis_PICKPOCKET);
};
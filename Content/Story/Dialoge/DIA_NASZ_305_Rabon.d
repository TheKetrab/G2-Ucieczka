var int Rabon_OK;
var int RABON_WAR;
var int Rabon_Wstrzymywanie;

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_EXIT   (C_INFO)
{
	npc         = NASZ_305_Rabon;
	nr          = 999;
	condition   = DIA_NASZ_305_Rabon_EXIT_Condition;
	information = DIA_NASZ_305_Rabon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_305_Rabon_EXIT_Condition()
{
	if (!RABON_WAR)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_305_Rabon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info EXITWAR 
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_EXITWAR   (C_INFO)
{
	npc         = NASZ_305_Rabon;
	nr          = 998;
	condition   = DIA_NASZ_305_Rabon_EXITWAR_Condition;
	information = DIA_NASZ_305_Rabon_EXITWAR_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_305_Rabon_EXITWAR_Condition()
{
	if (RABON_WAR)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_305_Rabon_EXITWAR_Info()
{
	AI_StopProcessInfos (self);
	
	AI_Teleport (NASZ_012_Renegat, "NASZ_TWIERDZA_23");

	NASZ_305_Rabon.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_305_Rabon, GIL_BDT);
	NASZ_006_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_006_Renegat, GIL_BDT);
	NASZ_011_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_011_Renegat, GIL_BDT);
	NASZ_012_Renegat.guild = GIL_BDT;
	Npc_SetTrueGuild (NASZ_012_Renegat, GIL_BDT);
	
	B_Attack (self, other, AR_KILL, 1);
	B_Attack (NASZ_006_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_011_Renegat, other, AR_KILL, 1);
	B_Attack (NASZ_012_Renegat, other, AR_KILL, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Obcy
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_305_Rabon_Obcy		(C_INFO)
{
	npc		 = 	NASZ_305_Rabon;
	nr		 = 	1;
	condition	 = 	DIA_NASZ_305_Rabon_Obcy_Condition;
	information	 = 	DIA_NASZ_305_Rabon_Obcy_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_NASZ_305_Rabon_Obcy_Condition ()
{
	var c_item armor; armor = Npc_GetEquippedArmor (other);

	if !((Hlp_IsItem (armor, ItNa_BAN_M)) || (Hlp_IsItem (armor, ItNa_BAN_H))) && (Npc_GetDistToWP	(self, "NASZ_TWIERDZA_5") > 5000) && (KAPITEL < 3)
	{
		return TRUE;
	};
};
func void DIA_NASZ_305_Rabon_Obcy_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_305_Rabon_Obcy_03_00"); //Intruz!
	AI_Output			(self, other, "DIA_NASZ_305_Rabon_Obcy_03_01"); //ALARM!

	AI_StopProcessInfos (self);
	self.flags = 2;
	B_Attack (self, hero, AR_KILL, 1);
	MakeBanditsAngry();
	MakeBanditsAngry2();

};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_siema   (C_INFO)
{
	npc         = NASZ_305_Rabon;
 	nr          = 1;
 	condition   = DIA_NASZ_305_Rabon_siema_Condition;
 	information = DIA_NASZ_305_Rabon_siema_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_305_Rabon_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
		&& (Npc_GetDistToWP	(self, "NASZ_TWIERDZA_5") > 1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_305_Rabon_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_305_Rabon_siema_15_00"); //O co chodzi?
		
};

//*********************************************************************
//	Info What
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_what   (C_INFO)
{
	npc         = NASZ_305_Rabon;
 	nr          = 2;
 	condition   = DIA_NASZ_305_Rabon_what_Condition;
 	information = DIA_NASZ_305_Rabon_what_Info;
 	permanent   = FALSE;
 	description = "Czym siê tu zajmujesz?";
};

FUNC INT DIA_NASZ_305_Rabon_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_305_Rabon_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_what_15_00"); //Czym siê tu zajmujesz?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_what_55_01"); //Mam mieæ oko na okolicê.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_what_55_02"); //Na wypadek zagro¿enia mam podnieœæ alarm.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_what_55_03"); //A có¿ ciebie sprowadza tutaj, na górê?
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_what_15_04"); //Powiedzmy, ¿e nie doskwiera mi lêk wysokoœci.
};

//*********************************************************************
//	Info Zadanie
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_zadanie   (C_INFO)
{
	npc         = NASZ_305_Rabon;
 	nr          = 3;
 	condition   = DIA_NASZ_305_Rabon_zadanie_Condition;
 	information = DIA_NASZ_305_Rabon_zadanie_Info;
 	permanent   = FALSE;
 	description = "Mogê ci w czymœ pomóc?";
};

FUNC INT DIA_NASZ_305_Rabon_zadanie_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_305_Rabon_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_zadanie_15_00"); //Mogê ci w czymœ pomóc?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_zadanie_55_01"); //Dos³ownie chwilê temu wypad³a mi moja sakiewka.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_zadanie_55_02"); //Chwila nieuwagi... A ja, cholera, nie mogê siê st¹d ruszyæ. Nod srogo karze tych, którzy nie szanuj¹ swoich obowi¹zków.
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_zadanie_15_03"); //Czy twoja sakwa bêdzie wewn¹trz obozu, czy poza nim?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_zadanie_55_04"); //W³aœnie nie wiem... Ale wola³bym, ¿eby by³a poza.
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_zadanie_15_05"); //No tak, z³oto przyci¹ga ka¿dego.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_zadanie_55_06"); //Nikt nie mówi, ¿e trzymam w niej z³oto... Ale nawet nie próbuj do niej zagl¹daæ! Zrozumiano?
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_zadanie_55_07"); //Jasne...

	Wld_InsertItem (ItNA_RabonSakwa_MIS,"NASZ_BANDYCI_ITEM_01");
	Log_CreateTopic (TOPIC_Rabon_sakwa, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rabon_sakwa, LOG_RUNNING);
	B_LogEntry (TOPIC_Rabon_sakwa, "Rabonowi wypad³a sakwa ze stra¿nicy. Chcia³, ¿ebym j¹ znalaz³ i mu j¹ da³. Ciekawe, co jest w œrodku...");
	
};

//*********************************************************************
//	Info KoniecA
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_koniecA   (C_INFO)
{
	npc         = NASZ_305_Rabon;
 	nr          = 4;
 	condition   = DIA_NASZ_305_Rabon_koniecA_Condition;
 	information = DIA_NASZ_305_Rabon_koniecA_Info;
 	permanent   = FALSE;
 	description = "Mam twoj¹ sakwê.";
};

FUNC INT DIA_NASZ_305_Rabon_koniecA_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_305_Rabon_zadanie)
	&& npc_hasitems (other, ItNA_RabonSakwa_MIS) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_305_Rabon_koniecA_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_koniecA_15_00"); //Mam twoj¹ sakwê.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecA_55_01"); //Dawaj!
	B_GiveInvItems (other, self, ItNA_RabonSakwa_MIS, 1);
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecA_55_02"); //Dziêki za poœwiêcony czas.
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_koniecA_15_03"); //Mo¿e jakaœ namacalna nagroda?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecA_55_04"); //Tyle musi ci wystarczyæ. A teraz wybacz, muszê byæ skupiony.

	Createinvitems (self, itmi_gold, 25);
	B_giveinvitems (self, other, itmi_gold, 25);
	B_LogEntry (TOPIC_Rabon_sakwa, "Przynios³em sakwê Rabonowi.");
	Log_SetTopicStatus (TOPIC_Rabon_sakwa, LOG_SUCCESS);
	B_GivePlayerXP (400);
	DodajReputacje (5, REP_BANDYCI);
};

//*********************************************************************
//	Info KoniecB
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_koniecB   (C_INFO)
{
	npc         = NASZ_305_Rabon;
 	nr          = 5;
 	condition   = DIA_NASZ_305_Rabon_koniecB_Condition;
 	information = DIA_NASZ_305_Rabon_koniecB_Info;
 	permanent   = FALSE;
 	description = "W twojej sakwie by³o coœ strasznie dziwnego...";
};

FUNC INT DIA_NASZ_305_Rabon_koniecB_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_305_Rabon_zadanie)
	&& Rabon_Sakwa)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_305_Rabon_koniecB_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_koniecB_15_00"); //W twojej sakwie by³o coœ strasznie dziwnego...
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecB_55_01"); //Mia³eœ w niej nie grzebaæ.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecB_55_02"); //Oj, ju¿ ja ciê nauczê s³uchaæ silniejszych od siebie!

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	B_GivePlayerXP (100);

};

//*********************************************************************
//	Info Win
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_win   (C_INFO)
{
	npc         = NASZ_305_Rabon;
 	nr          = 6;
 	condition   = DIA_NASZ_305_Rabon_win_Condition;
 	information = DIA_NASZ_305_Rabon_win_Info;
 	permanent   = FALSE;
 	description = "No, to mo¿e powiesz mi teraz coœ o tej rudzie?";
};

FUNC INT DIA_NASZ_305_Rabon_win_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_305_Rabon_koniecB)
		&& (NASZ_305_Rabon.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_305_Rabon_win_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_win_15_00"); //No, to mo¿e powiesz mi teraz coœ o tej rudzie?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_55_01"); //A mo¿e najpierw mi j¹ oddasz?

	Info_ClearChoices (DIA_NASZ_305_Rabon_win);
		if (npc_hasitems(other,ItMi_Nugget)>=10) {
			Info_AddChoice	  (DIA_NASZ_305_Rabon_win, "Dobra, masz.", DIA_NASZ_305_Rabon_win_ok);
		};
		Info_AddChoice	  (DIA_NASZ_305_Rabon_win, "Zapomnij.", DIA_NASZ_305_Rabon_win_no);

};

FUNC VOID DIA_NASZ_305_Rabon_win_ok()
{

	AI_Output (other,self ,"DIA_NASZ_305_Rabon_win_ok_15_00"); //Dobra, masz.
	B_giveinvitems (other, self, itmi_nugget, 10);
	Npc_RemoveInvItems(self,itmi_nugget,10);
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_01"); //No. To w takim razie po kolei.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_02"); //W jednej z kopalñ przebywa kilku paladynów renegatów.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_03"); //Ich dowódca nazywa siê... Ee... jakoœ na literê M.
	AI_Output (other, self,"DIA_NASZ_305_Rabon_win_ok_15_04"); //Mo¿e Marcos?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_05"); //Ej, sk¹d wiedzia³eœ? Zreszt¹ niewa¿ne.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_06"); //W ka¿dym razie dogadaliœmy siê z nimi. Jak zapewne powiedzia³ ci Samuel, rudê któr¹ wykopiemy w Górniczej Dolinie, odsprzedamy królowi.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_07"); //Naszym problemem jest niewystarczaj¹ca iloœæ kopaczy, a ich problemem to, ¿e król nie kupi³by rudy od zaprzysiêg³ych sobie rycerzy, tylko pos¹dzi³ o zdradê i skaza³ na banicjê.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_08"); //Tak wiêc oni pomagaj¹ nam w wykopaliskach, a my zajmiemy siê sprzeda¿¹ kruszcu.
	AI_Output (other, self,"DIA_NASZ_305_Rabon_win_ok_15_09"); //Zaraz, zaraz. Jeœli tak, to dlaczego ty mia³eœ tak¹ iloœæ rudy i dlaczego tak bardzo zale¿a³o ci na tym, aby nikt siê o tym nie dowiedzia³?
	AI_Output (other, self,"DIA_NASZ_305_Rabon_win_ok_15_10"); //Ukrad³eœ j¹ Nodowi? Czy mo¿e prowadzisz jakieœ lewe interesy z renegatami na w³asn¹ rêkê?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_11"); //Hej, tylko nie tak g³oœno! Mam z nimi dodatkowy uk³ad. Skoro ju¿ o tym wszystkim wiesz, to mo¿e zechcesz wejœæ ze mn¹ w spó³kê, zamiast paplaæ o tym wszystkim szefostwu?

	B_GivePlayerXP (50);
	DodajReputacje (5, REP_BANDYCI);
	Rabon_OK = TRUE;
	Info_ClearChoices (DIA_NASZ_305_Rabon_win);
};

FUNC VOID DIA_NASZ_305_Rabon_win_no()
{

	AI_Output (other,self ,"DIA_NASZ_305_Rabon_win_no_15_00"); //Zapomnij.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_no_55_01"); //W takim razie ty zapomnij o jakichkolwiek informacjach.
	
	//B_LogEntry (TOPIC_Rabon_sakwa, "Rabon nic wiêcej mi nie powie, tak wiêc zaprzepaœci³em sprawê. To, ¿e mia³ rudê w sakiewce to marny dowód na to, ¿e prowadzi interesy z paladynami. Nikt mi nie uwierzy, a Rabon przecie¿ siê wyprze i jeszcze mi siê za wszystko dostanie.");
	//Log_SetTopicStatus (TOPIC_Rabon_sakwa, LOG_FAILED);
	FailQuest(TOPIC_Rabon_sakwa,"");
	
	Info_ClearChoices (DIA_NASZ_305_Rabon_win);
};

//*********************************************************************
//	Info Hmm
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_hmm   (C_INFO)
{
	npc         = NASZ_305_Rabon;
 	nr          = 7;
 	condition   = DIA_NASZ_305_Rabon_hmm_Condition;
 	information = DIA_NASZ_305_Rabon_hmm_Info;
 	permanent   = FALSE;
 	description = "Do czego zmierzasz?";
};

FUNC INT DIA_NASZ_305_Rabon_hmm_Condition()
{
	if (Rabon_OK)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_305_Rabon_hmm_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_hmm_15_00"); //Do czego zmierzasz?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_hmm_55_01"); //Pójdziesz po bry³ki. Przyniesiesz mi paczkê, a zyskami podzielimy siê po po³owie. 
	AI_Output (self, other,"DIA_NASZ_305_Rabon_hmm_55_02"); //Masz tu nawet 100 sztuk z³ota zaliczki.
	Createinvitems (self, itmi_gold, 100);
	B_giveinvitems (self, other, itmi_gold, 100);
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_hmm_15_03"); //Dok¹d mam siê udaæ?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_hmm_55_04"); //Pomiêdzy kopalni¹ Marcosa a zamkiem znajduje siê las. Trzymaj siê ska³, a po chwili œcie¿ka zacznie skrêcaæ pod górê.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_hmm_55_05"); //Przed bram¹ bêdzie stra¿nik. Jeœli spyta ciê o imiê, powiedz, ¿e nazywasz siê Herendez. To tyle. A, i nie musisz siê œpieszyæ, bo ruda raczej nie ucieknie.

	WillCanTalkWithRenegat = TRUE;
	
	B_StartOtherRoutine (NASZ_011_Renegat,"Rabon");

	B_LogEntry (TOPIC_Rabon_sakwa, "Rabon chce, bym przyniós³ mu magiczn¹ rudê od paladynów. Przyda mi siê ³atwy zysk... Miejsce wymiany to chyba Kanion Trolli. No to w drogê!");
};

//*********************************************************************
//	Info Rabon
//*********************************************************************
INSTANCE DIA_NASZ_305_Rabon_rabon   (C_INFO)
{
	npc         = NASZ_305_Rabon;
 	nr          = 8;
 	condition   = DIA_NASZ_305_Rabon_rabon_Condition;
 	information = DIA_NASZ_305_Rabon_rabon_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_305_Rabon_rabon_Condition()
{
	if (Npc_GetDistToWP	(self, "NASZ_TWIERDZA_5") <=1000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_305_Rabon_rabon_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_rabon_15_00"); //Rabon!
	AI_Output (self, other,"DIA_NASZ_305_Rabon_rabon_55_01"); //We w³asnej osobie. 
	AI_Output (self, other,"DIA_NASZ_305_Rabon_rabon_55_02"); //Mój drogi, nie mogê sobie przecie¿ pozwoliæ, abyœ naskar¿y³ Nodowi o moim interesie.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_rabon_55_03"); //¯egnam zatem, interesy z panem to by³a czysta przyjemnoœæ. 

	B_GivePlayerXP (50);
	B_LogEntry (TOPIC_Rabon_sakwa, "A to œwinia! Wykiwa³ mnie...");
	RABON_WAR = TRUE;

};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_305_Rabon_PICKPOCKET (C_INFO)
{
	npc			= NASZ_305_Rabon;
	nr			= 900;
	condition	= DIA_NASZ_305_Rabon_PICKPOCKET_Condition;
	information	= DIA_NASZ_305_Rabon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_305_Rabon_PICKPOCKET_Condition()
{
	C_Beklauen (48);
};
 
FUNC VOID DIA_NASZ_305_Rabon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_305_Rabon_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_305_Rabon_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_305_Rabon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_305_Rabon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_305_Rabon_PICKPOCKET_DoIt);
};

func void DIA_NASZ_305_Rabon_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItMi_Nugget,2);
	
	Info_ClearChoices (DIA_NASZ_305_Rabon_PICKPOCKET);
};
	
func void DIA_NASZ_305_Rabon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_305_Rabon_PICKPOCKET);
};
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
 	description = "Czym si� tu zajmujesz?";
};

FUNC INT DIA_NASZ_305_Rabon_what_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_305_Rabon_what_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_what_15_00"); //Czym si� tu zajmujesz?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_what_55_01"); //Mam mie� oko na okolic�.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_what_55_02"); //Na wypadek zagro�enia mam podnie�� alarm.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_what_55_03"); //A c� ciebie sprowadza tutaj, na g�r�?
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_what_15_04"); //Powiedzmy, �e nie doskwiera mi l�k wysoko�ci.
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
 	description = "Mog� ci w czym� pom�c?";
};

FUNC INT DIA_NASZ_305_Rabon_zadanie_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_305_Rabon_zadanie_Info()
{
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_zadanie_15_00"); //Mog� ci w czym� pom�c?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_zadanie_55_01"); //Dos�ownie chwil� temu wypad�a mi moja sakiewka.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_zadanie_55_02"); //Chwila nieuwagi... A ja, cholera, nie mog� si� st�d ruszy�. Nod srogo karze tych, kt�rzy nie szanuj� swoich obowi�zk�w.
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_zadanie_15_03"); //Czy twoja sakwa b�dzie wewn�trz obozu, czy poza nim?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_zadanie_55_04"); //W�a�nie nie wiem... Ale wola�bym, �eby by�a poza.
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_zadanie_15_05"); //No tak, z�oto przyci�ga ka�dego.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_zadanie_55_06"); //Nikt nie m�wi, �e trzymam w niej z�oto... Ale nawet nie pr�buj do niej zagl�da�! Zrozumiano?
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_zadanie_55_07"); //Jasne...

	Wld_InsertItem (ItNA_RabonSakwa_MIS,"NASZ_BANDYCI_ITEM_01");
	Log_CreateTopic (TOPIC_Rabon_sakwa, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rabon_sakwa, LOG_RUNNING);
	B_LogEntry (TOPIC_Rabon_sakwa, "Rabonowi wypad�a sakwa ze stra�nicy. Chcia�, �ebym j� znalaz� i mu j� da�. Ciekawe, co jest w �rodku...");
	
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
 	description = "Mam twoj� sakw�.";
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
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_koniecA_15_00"); //Mam twoj� sakw�.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecA_55_01"); //Dawaj!
	B_GiveInvItems (other, self, ItNA_RabonSakwa_MIS, 1);
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecA_55_02"); //Dzi�ki za po�wi�cony czas.
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_koniecA_15_03"); //Mo�e jaka� namacalna nagroda?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecA_55_04"); //Tyle musi ci wystarczy�. A teraz wybacz, musz� by� skupiony.

	Createinvitems (self, itmi_gold, 25);
	B_giveinvitems (self, other, itmi_gold, 25);
	B_LogEntry (TOPIC_Rabon_sakwa, "Przynios�em sakw� Rabonowi.");
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
 	description = "W twojej sakwie by�o co� strasznie dziwnego...";
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
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_koniecB_15_00"); //W twojej sakwie by�o co� strasznie dziwnego...
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecB_55_01"); //Mia�e� w niej nie grzeba�.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_koniecB_55_02"); //Oj, ju� ja ci� naucz� s�ucha� silniejszych od siebie!

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
 	description = "No, to mo�e powiesz mi teraz co� o tej rudzie?";
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
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_win_15_00"); //No, to mo�e powiesz mi teraz co� o tej rudzie?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_55_01"); //A mo�e najpierw mi j� oddasz?

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
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_02"); //W jednej z kopal� przebywa kilku paladyn�w renegat�w.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_03"); //Ich dow�dca nazywa si�... Ee... jako� na liter� M.
	AI_Output (other, self,"DIA_NASZ_305_Rabon_win_ok_15_04"); //Mo�e Marcos?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_05"); //Ej, sk�d wiedzia�e�? Zreszt� niewa�ne.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_06"); //W ka�dym razie dogadali�my si� z nimi. Jak zapewne powiedzia� ci Samuel, rud� kt�r� wykopiemy w G�rniczej Dolinie, odsprzedamy kr�lowi.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_07"); //Naszym problemem jest niewystarczaj�ca ilo�� kopaczy, a ich problemem to, �e kr�l nie kupi�by rudy od zaprzysi�g�ych sobie rycerzy, tylko pos�dzi� o zdrad� i skaza� na banicj�.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_08"); //Tak wi�c oni pomagaj� nam w wykopaliskach, a my zajmiemy si� sprzeda�� kruszcu.
	AI_Output (other, self,"DIA_NASZ_305_Rabon_win_ok_15_09"); //Zaraz, zaraz. Je�li tak, to dlaczego ty mia�e� tak� ilo�� rudy i dlaczego tak bardzo zale�a�o ci na tym, aby nikt si� o tym nie dowiedzia�?
	AI_Output (other, self,"DIA_NASZ_305_Rabon_win_ok_15_10"); //Ukrad�e� j� Nodowi? Czy mo�e prowadzisz jakie� lewe interesy z renegatami na w�asn� r�k�?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_ok_55_11"); //Hej, tylko nie tak g�o�no! Mam z nimi dodatkowy uk�ad. Skoro ju� o tym wszystkim wiesz, to mo�e zechcesz wej�� ze mn� w sp�k�, zamiast papla� o tym wszystkim szefostwu?

	B_GivePlayerXP (50);
	DodajReputacje (5, REP_BANDYCI);
	Rabon_OK = TRUE;
	Info_ClearChoices (DIA_NASZ_305_Rabon_win);
};

FUNC VOID DIA_NASZ_305_Rabon_win_no()
{

	AI_Output (other,self ,"DIA_NASZ_305_Rabon_win_no_15_00"); //Zapomnij.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_win_no_55_01"); //W takim razie ty zapomnij o jakichkolwiek informacjach.
	
	//B_LogEntry (TOPIC_Rabon_sakwa, "Rabon nic wi�cej mi nie powie, tak wi�c zaprzepa�ci�em spraw�. To, �e mia� rud� w sakiewce to marny dow�d na to, �e prowadzi interesy z paladynami. Nikt mi nie uwierzy, a Rabon przecie� si� wyprze i jeszcze mi si� za wszystko dostanie.");
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
	AI_Output (self, other,"DIA_NASZ_305_Rabon_hmm_55_01"); //P�jdziesz po bry�ki. Przyniesiesz mi paczk�, a zyskami podzielimy si� po po�owie. 
	AI_Output (self, other,"DIA_NASZ_305_Rabon_hmm_55_02"); //Masz tu nawet 100 sztuk z�ota zaliczki.
	Createinvitems (self, itmi_gold, 100);
	B_giveinvitems (self, other, itmi_gold, 100);
	AI_Output (other,self ,"DIA_NASZ_305_Rabon_hmm_15_03"); //Dok�d mam si� uda�?
	AI_Output (self, other,"DIA_NASZ_305_Rabon_hmm_55_04"); //Pomi�dzy kopalni� Marcosa a zamkiem znajduje si� las. Trzymaj si� ska�, a po chwili �cie�ka zacznie skr�ca� pod g�r�.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_hmm_55_05"); //Przed bram� b�dzie stra�nik. Je�li spyta ci� o imi�, powiedz, �e nazywasz si� Herendez. To tyle. A, i nie musisz si� �pieszy�, bo ruda raczej nie ucieknie.

	WillCanTalkWithRenegat = TRUE;
	
	B_StartOtherRoutine (NASZ_011_Renegat,"Rabon");

	B_LogEntry (TOPIC_Rabon_sakwa, "Rabon chce, bym przyni�s� mu magiczn� rud� od paladyn�w. Przyda mi si� �atwy zysk... Miejsce wymiany to chyba Kanion Trolli. No to w drog�!");
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
	AI_Output (self, other,"DIA_NASZ_305_Rabon_rabon_55_01"); //We w�asnej osobie. 
	AI_Output (self, other,"DIA_NASZ_305_Rabon_rabon_55_02"); //M�j drogi, nie mog� sobie przecie� pozwoli�, aby� naskar�y� Nodowi o moim interesie.
	AI_Output (self, other,"DIA_NASZ_305_Rabon_rabon_55_03"); //�egnam zatem, interesy z panem to by�a czysta przyjemno��. 

	B_GivePlayerXP (50);
	B_LogEntry (TOPIC_Rabon_sakwa, "A to �winia! Wykiwa� mnie...");
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
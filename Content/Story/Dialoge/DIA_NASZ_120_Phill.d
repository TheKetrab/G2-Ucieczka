//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_EXIT   (C_INFO)
{
	npc         = NASZ_120_Phill;
	nr          = 999;
	condition   = DIA_NASZ_120_Phill_EXIT_Condition;
	information = DIA_NASZ_120_Phill_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_120_Phill_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_120_Phill_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_siema   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 1;
 	condition   = DIA_NASZ_120_Phill_siema_Condition;
 	information = DIA_NASZ_120_Phill_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_120_Phill_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_120_Phill_siema_15_00"); //Co robisz?
	AI_Output (self, other,"DIA_NASZ_120_Phill_siema_55_01"); //Zajmuj� si� obr�bk� drewna. Wytwarzam sto�y, krzes�a, ��ka i tym podobne.
	AI_Output (self, other,"DIA_NASZ_120_Phill_siema_55_02"); //W skr�cie wszystko opr�cz desek u�ytych w budynkach, to moja robota.
};

//*********************************************************************
//	Info Work
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_work   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 2;
 	condition   = DIA_NASZ_120_Phill_work_Condition;
 	information = DIA_NASZ_120_Phill_work_Info;
 	permanent   = FALSE;
 	description = "Mog� co� dla ciebie zrobi�?";
};

FUNC INT DIA_NASZ_120_Phill_work_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_120_Phill_work_Info()
{
	AI_Output (other,self ,"DIA_NASZ_120_Phill_work_15_00"); //Mog� co� dla ciebie zrobi�?
	AI_Output (self, other,"DIA_NASZ_120_Phill_work_55_01"); //Mo�esz dotrzyma� mi towarzystwa.
	AI_Output (other,self ,"DIA_NASZ_120_Phill_work_15_02"); //Mam tu gni� przez ca�y dzie� i patrzy� jak machasz pi�� w prz�d i w ty�?
	AI_Output (self, other,"DIA_NASZ_120_Phill_work_55_03"); //Co� ty taki nerwowy? My�l�, �e powiniene� ciutek si� zrelaksowa�. Mo�e zapalisz ze mn� troch� bagiennego ziela?

	Log_CreateTopic (TOPIC_Phill_lagi, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Phill_lagi, LOG_RUNNING);
	B_LogEntry (TOPIC_Phill_lagi, "Drwal Phill potrzebuje drewna do obr�bki. W tym celu chce zapolowa� na gobliny i odebra� im lagi.");


	Info_ClearChoices (DIA_NASZ_120_Phill_work);
		Info_AddChoice	  (DIA_NASZ_120_Phill_work, "Jasne.", DIA_NASZ_120_Phill_work_yes);
		Info_AddChoice	  (DIA_NASZ_120_Phill_work, "Nie, dzi�ki.", DIA_NASZ_120_Phill_work_no);

};

func void PhillSay_Goblins() {
	AI_Output (self, other,"PhillSay_Goblins_55_00"); //S�uchaj, chodzi o to, �e musz� zaopatrzy� si� w drewno, a konkretniej w kije.
	AI_Output (self, other,"PhillSay_Goblins_55_01"); //Rzecz w tym, �e gobliny maj� potrzebny mi surowiec, a ty m�g�by� wybra� si� ze mn�.
};

FUNC VOID DIA_NASZ_120_Phill_work_yes()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_work_yes_15_00"); //Jasne.
	Createinvitems (self, ItMi_Joint, 2);
	B_giveinvitems (self, other, ItMi_Joint, 1);
	B_UseItem (other, ItMi_Joint);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_NASZ_120_Phill_work_yes_55_01"); //No, teraz mo�emy rozmawia�!
	PhillSay_Goblins();
	
	Info_ClearChoices (DIA_NASZ_120_Phill_work);
};

FUNC VOID DIA_NASZ_120_Phill_work_no()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_work_no_15_00"); //Nie, dzi�ki.
	AI_Output (self, other,"DIA_NASZ_120_Phill_work_no_55_01"); //Twoja strata. Ja jednak sobie zapal�.
	Createinvitems (self, ItMi_Joint, 1);
	B_UseItem (self, ItMi_Joint);
	PhillSay_Goblins();
	
	Info_ClearChoices (DIA_NASZ_120_Phill_work);
};

//*********************************************************************
//	Info Gdzie
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_gdzie   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 3;
 	condition   = DIA_NASZ_120_Phill_gdzie_Condition;
 	information = DIA_NASZ_120_Phill_gdzie_Info;
 	permanent   = FALSE;
 	description = "Gdzie znajdziemy gobliny?";
};

FUNC INT DIA_NASZ_120_Phill_gdzie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_120_Phill_work))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_gdzie_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_gdzie_15_00"); //Gdzie znajdziemy gobliny?
	AI_Output (self, other,"DIA_NASZ_120_Phill_gdzie_55_01"); //Keroloth ostatnio wspomina� co� o jakich� goblinach w jaskini nad rzek�, obok wodospadu.
	AI_Output (self, other,"DIA_NASZ_120_Phill_gdzie_55_02"); //Sprawdzimy, czy dalej tam s�.

	B_LogEntry (TOPIC_Phill_lagi, "Gobliny znajdziemy w jaskini nad rzek� obok wodospadu.");

};

var int PhillGoOneTime;
var int PhillGoOk;
//*********************************************************************
//	Info Go
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_go   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 4;
 	condition   = DIA_NASZ_120_Phill_go_Condition;
 	information = DIA_NASZ_120_Phill_go_Info;
 	permanent   = TRUE;
 	description = "Chod�my skopa� par� gobli�skich ty�k�w.";
};

FUNC INT DIA_NASZ_120_Phill_go_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_120_Phill_gdzie)) && (PhillGoOk == FALSE)
	{
		return TRUE;
	};
};

func void PhillTestYourSkills() {

	AI_ReadyMeleeWeapon(hero);
	AI_PlayAni(hero,"T_1HATTACKL");
	AI_PlayAni(hero,"T_1HATTACKR");
	AI_RemoveWeapon(hero);		

	if (hero.HitChance[NPC_TALENT_1H] >= 10) || (hero.HitChance[NPC_TALENT_2H] >= 10)
	{
		AI_Output (self, other,"PhillTestYourSkills_55_00"); //Dobra, mo�e by�. Damy rad� skurczybykom!
	
		PhillGoOk = TRUE;
		Npc_ExchangeRoutine (NASZ_120_Phill, "Guide");
		//self.aivar[AIV_PARTYMEMBER] = TRUE;
		Druzyna (NASZ_120_Phill,1);
		AI_StopProcessInfos (self);		
	}
		
	else
	{
		AI_Output (self, other,"PhillTestYourSkills_55_01"); //Jeste� zbyt s�aby! Popraw swoje umiej�tno�ci i dopiero wtedy wr�� do mnie.	
		PrintScreen	("Wymagane przynajmniej 10% walki broni�.", -1, 45, FONT_ScreenSmall, 2);
	};

};


FUNC VOID DIA_NASZ_120_Phill_go_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_go_15_00"); //Chod�my skopa� par� gobli�skich ty�k�w.
	
	if (PhillGoOneTime == FALSE)
	{
		AI_Output (self, other,"DIA_NASZ_120_Phill_go_55_01"); //Czekaj, najpierw chcia�bym zobaczy�, jak walczysz.
		AI_Output (self, other,"DIA_NASZ_120_Phill_go_55_02"); //Czarne gobliny to wcale nie taka gratka, jak mo�e si� wydawa�.
		PhillTestYourSkills();
		PhillGoOneTime = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_120_Phill_go_55_03"); //Nauczy�e� si� ju� walczy�? Poka�.
		PhillTestYourSkills();
	};

};

//*********************************************************************
//	Info Stop
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_stop   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 5;
 	condition   = DIA_NASZ_120_Phill_stop_Condition;
 	information = DIA_NASZ_120_Phill_stop_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_120_Phill_stop_Condition()
{
	//if (npc_knowsinfo (other, DIA_NASZ_120_Phill_go))
	if (Npc_GetDistToWP	(NASZ_120_Phill, "OW_NC_ABYSS3") <=500)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_stop_Info()
{

	AI_Output (self, other,"DIA_NASZ_120_Phill_stop_55_00"); //Jeszcze troch� i trafimy na jaskini� z tymi goblinami. Uwa�aj.

	Npc_ExchangeRoutine (NASZ_120_Phill, "Goblins");
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Koniec
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_koniec   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 6;
 	condition   = DIA_NASZ_120_Phill_koniec_Condition;
 	information = DIA_NASZ_120_Phill_koniec_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_120_Phill_koniec_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_120_Phill_stop)
	&& npc_isdead (goblin0)
	&& npc_isdead (goblin1)
	&& npc_isdead (goblin2)
	&& npc_isdead (goblin3)
	&& npc_isdead (goblin4)
	&& npc_isdead (goblin5))

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_koniec_Info()
{

	AI_Output (self, other,"DIA_NASZ_120_Phill_koniec_55_00"); //Jeszcze jaki� czarny kurdupel?
	AI_Output (other,self ,"DIA_NASZ_120_Phill_koniec_15_01"); //To ju� chyba wszystkie.
	AI_Output (self, other,"DIA_NASZ_120_Phill_koniec_55_02"); //R�wnie� mam takie wra�enie. Nie by�o to takie ci�kie, jak si� spodziewa�em.
	AI_Output (self, other,"DIA_NASZ_120_Phill_koniec_55_03"); //Wracam do obozu. Pozbieraj lagi i mi je przynie�. P� tuzina powinno wystarczy�.

	B_LogEntry (TOPIC_Phill_lagi, "Gobiny nie �yj�. Mam pozbiera� wszystkie lagi i odda� Phillowi dwa tuziny.");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_120_Phill,0);
	Npc_ExchangeRoutine (NASZ_120_Phill, "Start");

};

//*********************************************************************
//	Info Lagi
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_lagi   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 7;
 	condition   = DIA_NASZ_120_Phill_lagi_Condition;
 	information = DIA_NASZ_120_Phill_lagi_Info;
 	permanent   = FALSE;
 	description = "Oto twoje lagi.";
};

FUNC INT DIA_NASZ_120_Phill_lagi_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_120_Phill_koniec)
	&& npc_hasitems (other, ItMw_1h_Bau_Mace) >= 6)

	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_lagi_Info()
{


	AI_Output (other,self ,"DIA_NASZ_120_Phill_lagi_15_00"); //Oto twoje lagi.
		B_GiveInvItems (other, self, ItMw_1h_Bau_Mace, 6);
	AI_Output (self, other,"DIA_NASZ_120_Phill_lagi_55_01"); //�wietnie, b�d� z czego mia� zrobi� nogi do krzese�.
	AI_Output (self, other,"DIA_NASZ_120_Phill_lagi_55_02"); //Masz tu troch� z�ota w podzi�ce.

	Createinvitems (self, itmi_gold, 40);
	B_giveinvitems (self, other, itmi_gold, 40);
	
	B_LogEntry (TOPIC_Phill_lagi, "Przynios�em Phillowi lagi.");
	Log_SetTopicStatus (TOPIC_Phill_lagi, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (2, REP_LOWCY);
};

//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_Gwozdzie   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 7;
 	condition   = DIA_NASZ_120_Phill_Gwozdzie_Condition;
 	information = DIA_NASZ_120_Phill_Gwozdzie_Info;
 	permanent   = FALSE;
 	description = "Wiesz co� o paczce z gwo�dziami?";
};

FUNC INT DIA_NASZ_120_Phill_Gwozdzie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_126_Robotnik_Gwozdzie))  && (MIS_ROBOTNIK_READY == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_Gwozdzie_Info()
{


	AI_Output (other,self ,"DIA_NASZ_120_Phill_Gwozdzie_15_00"); //Wiesz co� o paczce z gwo�dziami?
	AI_Output (self, other,"DIA_NASZ_120_Phill_Gwozdzie_55_01"); //Tak, mam tu tak�. Znalaz�em j� kilka dni temu w karczmie.
	AI_Output (other,self ,"DIA_NASZ_120_Phill_Gwozdzie_15_02"); //Daj mi j�.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Gwozdzie_55_03"); //Nie! Znalezisko nale�y do mnie. Poza tym potrzebuj� tych gwo�dzi. Co jaki� czas w heblarce stosuje si� metalowe uchwyty.
	AI_Output (other,self ,"DIA_NASZ_120_Phill_Gwozdzie_15_04"); //Tak si� sk�ada, �e ja r�wnie� ich potrzebuj�. Nale�a�y do robotnika, a teraz musz� nimi naprawi� podpory podtrzymuj�ce budynek.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Gwozdzie_55_05"); //C�... W takim razie potrzebujemy ich obaj. S�uchaj, te gwo�dzie s� jakie� du�e. Przynie� mi paczk� ma�ych gwo�dzi. Zapytaj kowala, czy zrobi je dla ciebie.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Gwozdzie_55_06"); //Wtedy si� wymienimy. Co ty na to?

	WillKnowGwozdzieThief = TRUE;
	
	Info_ClearChoices 	(DIA_NASZ_120_Phill_Gwozdzie);

	if (npc_hasitems (other, ItMi_Gold) >=100) {
		Info_AddChoice		(DIA_NASZ_120_Phill_Gwozdzie,"Wol� zap�aci� ci 100 sztuk z�ota za te gwo�dzie.",DIA_NASZ_120_Phill_Gwozdzie_100);
	};

	Info_AddChoice		(DIA_NASZ_120_Phill_Gwozdzie,"Zapomnij, dawaj mi gwo�dzie!",DIA_NASZ_120_Phill_Gwozdzie_no);
	Info_AddChoice		(DIA_NASZ_120_Phill_Gwozdzie,"Zastanowie si�, je�li mi zap�acisz.",DIA_NASZ_120_Phill_Gwozdzie_ok);

};


func void DIA_NASZ_120_Phill_Gwozdzie_100 ()
{

	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_100_01_00"); //Wol� zap�aci� ci 100 sztuk z�ota za te gwo�dzie.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_100_01_01"); //Sto? W porz�dku. Bierz, paczka jest twoja.

	B_giveinvitems (other, self, ItMi_Gold, 100);
	Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);
	
	B_LogEntry (TOPIC_Robotnik_deski, "Cholerny drwal! Nie chcia� da� mi paczki... Zap�aci�em mu. Gwo�dzie ju� mam, teraz pora zabra� m�otek i przybija�!");

	Info_ClearChoices (DIA_NASZ_120_Phill_Gwozdzie);
};

func void DIA_NASZ_120_Phill_Gwozdzie_no ()
{
	AI_ReadyMeleeWeapon	(other);
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_no_01_00"); //Zapomnij, dawaj mi gwo�dzie!
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_no_01_01"); //O co ci chodzi? To przecie� uczciwy uk�ad!
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_no_01_02"); //Nie b�d� gania� za twoimi zachciankami. Potrzebuj� tych gwo�dzi, �eby naprawi� filary podtrzymuj�ce konstrukcj� domu Kerolotha.
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_no_01_03"); //Je�li w tej chwili nie oddasz mi tej przekl�tej paczki, to b�dziesz mia� do czynienia ze mn� albo, co gorsza, z Kerolothem.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_no_01_04"); //Ahh! Chyba Beliar zes�a� ci�, �eby� mi przeszkodzi�.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_no_01_05"); //Zabieraj t� paczk�.

	AI_RemoveWeapon		(self);
	
	Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);

	B_LogEntry (TOPIC_Robotnik_deski, "Cholerny drwal! Chcia� si� mn� wys�u�y� i za�atwi� sobie ma�e gwo�dzie. Nie dam sob� pomiata�. Gwo�dzie ju� mam, teraz pora zabra� m�otek i przybija�!");

	Info_ClearChoices (DIA_NASZ_120_Phill_Gwozdzie);
};

func void DIA_NASZ_120_Phill_Gwozdzie_ok ()
{
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_00"); //Zastanowie si�, je�li mi zap�acisz.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_01"); //Zap�ac� ci sto trzydzie�ci sztuk z�ota za t� paczk�. W to wlicza si� zap�ata kowalowi.
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_02"); //Niech b�dzie. Za�atwi� ci paczk�, ale daj mi te pieni�dze.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_03"); //Prosz�, to nale�y do ciebie. Drugie tyle dostaniesz, gdy zobacz� gwo�dzie.
	Createinvitems (self, ItMi_Gold, 65);
	B_giveinvitems (self, other, ItMi_Gold, 65);

	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_04"); //Spodziewaj si� mnie niebawem.
	
	B_LogEntry (TOPIC_Robotnik_deski, "Cholerny drwal! Da mi paczk�, tylko je�li przynios� mu ma�e gwo�dzie. Musz� poprosi� jakiego� kowala.");

	WillGwozdzieGoToKowal = 1;
	
	Info_ClearChoices (DIA_NASZ_120_Phill_Gwozdzie);
};

//*********************************************************************
//	Info GwozdzieDone
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_GwozdzieDone   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 9;
 	condition   = DIA_NASZ_120_Phill_GwozdzieDone_Condition;
 	information = DIA_NASZ_120_Phill_GwozdzieDone_Info;
 	permanent   = FALSE;
 	description = "Mam tutaj paczk�.";
};

FUNC INT DIA_NASZ_120_Phill_GwozdzieDone_Condition()
{
	if (npc_hasitems (other, ItNa_PaczkaMalychGwozdzi) >=1)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_GwozdzieDone_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_GwozdzieDone_15_00"); //Mam tutaj paczk�.
	AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_01"); //Poka�.
	B_giveinvitems (other, self, ItNa_PaczkaMalychGwozdzi, 1);

	if (GwozdzieKupione == 50) {	
		AI_Output (self,other ,"DIA_NASZ_120_Phill_GwozdzieDone_15_02"); //Pi��dziesi�t? Po co a� tyle?
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_03"); //Nie zap�ac� ci za zb�dny towar. We� to z�oto. Dok�adnie tyle ci si� nale�y.
		Createinvitems (self, ItMi_Gold, 65);
		B_giveinvitems (self, other, ItMi_Gold, 65);
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_04"); //A te gwo�dzie s� twoje.
		Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
		B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);
		
		B_LogEntry (TOPIC_Robotnik_deski, "Gwo�dzie ju� mam, teraz pora zabra� m�otek i przybija�!");
	};
	
	if (GwozdzieKupione == 20) {	
		AI_Output (self,other ,"DIA_NASZ_120_Phill_GwozdzieDone_15_05"); //W porz�dku, wystarczy.
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_06"); //Z�oto zgodnie z umow�, prosz�.
		Createinvitems (self, ItMi_Gold, 65);
		B_giveinvitems (self, other, ItMi_Gold, 65);
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_07"); //A te gwo�dzie s� twoje.
		Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
		B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);
		
		B_LogEntry (TOPIC_Robotnik_deski, "Gwo�dzie ju� mam, teraz pora zabra� m�otek i przybija�!");
	};
	
	if (GwozdzieKupione == 10) {	
		AI_Output (self,other ,"DIA_NASZ_120_Phill_GwozdzieDone_15_08"); //Nie, nie. Stanowczo za ma�o. To nie wystarczy!
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_09"); //Przynie� mi jeszcze dziesi�� gwo�dzi.
		
		B_LogEntry (TOPIC_Robotnik_deski, "Niech to szlag! Przynios�em Phillowi za ma�o gwo�dzi. Musz� poprosi� Dobara o wi�cej.");

		WillGwozdzieGoToKowal = TRUE;
	};

};

//*********************************************************************
//	Info GwozdzieDone2
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_GwozdzieDone2   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 10;
 	condition   = DIA_NASZ_120_Phill_GwozdzieDone2_Condition;
 	information = DIA_NASZ_120_Phill_GwozdzieDone2_Info;
 	permanent   = FALSE;
 	description = "Przynios�em pozosta�e gwo�dzie.";
};

FUNC INT DIA_NASZ_120_Phill_GwozdzieDone2_Condition()
{
	if (npc_hasitems (other, ItNa_PaczkaMalychGwozdzi) >=1)
	&& (npc_knowsinfo (other, DIA_NASZ_224_Dobar_GwozdzieReady2))
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_GwozdzieDone2_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_GwozdzieDone2_15_00"); //Przynios�em pozosta�e gwo�dzie.
	B_giveinvitems (other, self, ItNa_PaczkaMalychGwozdzi, 1);
	AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone2_55_01"); //�wietnie. Oto obiecane z�oto.
	Createinvitems (self, ItMi_Gold, 65);
	B_giveinvitems (self, other, ItMi_Gold, 65);
	AI_Output (self,other ,"DIA_NASZ_120_Phill_GwozdzieDone2_15_02"); //A, no i paczka.
	Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);

	B_LogEntry (TOPIC_Robotnik_deski, "Gwo�dzie ju� mam, teraz pora zabra� m�otek i przybija�!");

};

var int PHILL_MISSION_READY;
var int PHILL_MISSION_ONETIME;
//*********************************************************************
//	Info Kap4Quest
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_Kap4Quest   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 10;
 	condition   = DIA_NASZ_120_Phill_Kap4Quest_Condition;
 	information = DIA_NASZ_120_Phill_Kap4Quest_Info;
 	permanent   = FALSE;
 	description = "Nad czym tak dumasz?";
};

FUNC INT DIA_NASZ_120_Phill_Kap4Quest_Condition()
{
	if (KAPITEL == 4)
	&& (Npc_GetDistToWP	(self, "NASZ_LOWCY_DOL_22") < 750)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_Kap4Quest_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_Kap4Quest_15_00"); //Nad czym tak dumasz?
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4Quest_55_01"); //Ahh, tak si� zastanawiam, czy da si� wspi�� na to drzewo?
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4Quest_55_02"); //Co o tym myslisz?
	AI_Output (other,self ,"DIA_NASZ_120_Phill_Kap4Quest_15_03"); //Sam nie wiem... Mog� spr�bowa�.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4Quest_55_04"); //�wietnie! Chc� to zobaczy�. Spr�buj wdrapa� si� na sam czubek.

	Log_CreateTopic (TOPIC_Phill_drzewo, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Phill_drzewo, LOG_RUNNING);
	B_LogEntry (TOPIC_Phill_drzewo, "Phill chcia�by, �ebym wdrapa� si� na sam czubek drzewa w obozie �owc�w ork�w.");

	PHILL_MISSION_READY = TRUE;
};

func void PHILL_FUNC ()
{
	if (PHILL_MISSION_READY == TRUE) && (PHILL_MISSION_ONETIME == FALSE) {
		
		if (Npc_GetDistToWP(NASZ_120_Phill,"NASZ_LOWCY_DOL_22") > 1000) {
			Print("Phill nie widzia� twojego wyczynu.");
			return;
		};

		PrintScreen	("WYSZED�E� NA DRZEWO", -1,-1, FONT_ScreenSmall,3);
		Snd_Play ("THRILLJINGLE_01");
		B_GivePlayerXP (100);
		PHILL_MISSION_ONETIME = TRUE;
	};
};

//*********************************************************************
//	Info Kap4QuestDone
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_Kap4QuestDone   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 11;
 	condition   = DIA_NASZ_120_Phill_Kap4QuestDone_Condition;
 	information = DIA_NASZ_120_Phill_Kap4QuestDone_Info;
 	permanent   = FALSE;
 	description = "Wyszed�em na szczyt.";
};

FUNC INT DIA_NASZ_120_Phill_Kap4QuestDone_Condition()
{
	if (KAPITEL == 4)
	&& (PHILL_MISSION_ONETIME == TRUE)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_Kap4QuestDone_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_Kap4QuestDone_15_00"); //Wyszed�em na szczyt.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4QuestDone_55_01"); //Widzia�em! Jeste� bardzo zwinny... Za to widowisko, kt�re mi zgotowa�e�, nale�� ci si� te mikstury.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4QuestDone_55_02"); //Prosz�, we� je.

	Createinvitems (self, ItPo_Health_03, 2);
	B_giveinvitems (self, other, ItPo_Health_03, 2);

	Log_SetTopicStatus (TOPIC_Phill_drzewo, LOG_SUCCESS);
	B_LogEntry (TOPIC_Phill_drzewo, "Da�em rad�... Kto by pomy�la�!");
	B_GivePlayerXP (1000);
	DodajReputacje(4,REP_LOWCY);
};

//*********************************************************************
//	Info Pily
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_Pily   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 12;
 	condition   = DIA_NASZ_120_Phill_Pily_Condition;
 	information = DIA_NASZ_120_Phill_Pily_Info;
 	permanent   = FALSE;
 	description = "Masz mo�e jakie� pi�y na sprzeda�?";
};

FUNC INT DIA_NASZ_120_Phill_Pily_Condition()
{
	if (Snaf_Pily == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_Pily_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_Pily_15_00"); //Masz mo�e jakie� pi�y na sprzeda�?
	AI_Output (self, other,"DIA_NASZ_120_Phill_Pily_55_01"); //Tylko jedn�. Troch� st�piona, ale ci�gle dobrze tnie.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Pily_55_02"); //Mog� sprzeda� ci j� za 10 sztuk z�ota.
};

//*********************************************************************
//	Info BuyPila
//*********************************************************************
INSTANCE DIA_NASZ_120_Phill_BuyPila   (C_INFO)
{
	npc         = NASZ_120_Phill;
 	nr          = 12;
 	condition   = DIA_NASZ_120_Phill_BuyPila_Condition;
 	information = DIA_NASZ_120_Phill_BuyPila_Info;
 	permanent   = FALSE;
 	description = "Sprzedaj mi pi��. (10 szt. z�ota)";
};

FUNC INT DIA_NASZ_120_Phill_BuyPila_Condition()
{
	if (npc_hasitems (other, ItMi_Gold) >= 10)
	&& (npc_knowsinfo (other, DIA_NASZ_120_Phill_Pily))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_120_Phill_BuyPila_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_BuyPila_15_00"); //Sprzedaj mi pi��.
	B_giveinvitems (other, self, ItMi_Gold, 10);
	AI_Output (self, other,"DIA_NASZ_120_Phill_BuyPila_55_01"); //Tylko nie utnij sobie palc�w!

	Createinvitems (self, ItMi_Saw, 1);
	B_giveinvitems (self, other, ItMi_Saw, 1);

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_120_Phill_PICKPOCKET (C_INFO)
{
	npc			= NASZ_120_Phill;
	nr			= 900;
	condition	= DIA_NASZ_120_Phill_PICKPOCKET_Condition;
	information	= DIA_NASZ_120_Phill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_120_Phill_PICKPOCKET_Condition()
{
	C_Beklauen (38);
};
 
FUNC VOID DIA_NASZ_120_Phill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_120_Phill_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_120_Phill_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_120_Phill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_120_Phill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_120_Phill_PICKPOCKET_DoIt);
};

func void DIA_NASZ_120_Phill_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItMi_Saw,2);
	B_BeklauenThings(ItMi_Hammer,1);
	
	Info_ClearChoices (DIA_NASZ_120_Phill_PICKPOCKET);
};
	
func void DIA_NASZ_120_Phill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_120_Phill_PICKPOCKET);
};

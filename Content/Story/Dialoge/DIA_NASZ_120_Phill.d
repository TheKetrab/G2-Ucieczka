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
	AI_Output (self, other,"DIA_NASZ_120_Phill_siema_55_01"); //Zajmujê siê obróbk¹ drewna. Wytwarzam sto³y, krzes³a, ³ó¿ka i tym podobne.
	AI_Output (self, other,"DIA_NASZ_120_Phill_siema_55_02"); //W skrócie wszystko oprócz desek u¿ytych w budynkach, to moja robota.
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
 	description = "Mogê coœ dla ciebie zrobiæ?";
};

FUNC INT DIA_NASZ_120_Phill_work_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_120_Phill_work_Info()
{
	AI_Output (other,self ,"DIA_NASZ_120_Phill_work_15_00"); //Mogê coœ dla ciebie zrobiæ?
	AI_Output (self, other,"DIA_NASZ_120_Phill_work_55_01"); //Mo¿esz dotrzymaæ mi towarzystwa.
	AI_Output (other,self ,"DIA_NASZ_120_Phill_work_15_02"); //Mam tu gniæ przez ca³y dzieñ i patrzyæ jak machasz pi³¹ w przód i w ty³?
	AI_Output (self, other,"DIA_NASZ_120_Phill_work_55_03"); //Coœ ty taki nerwowy? Myœlê, ¿e powinieneœ ciutek siê zrelaksowaæ. Mo¿e zapalisz ze mn¹ trochê bagiennego ziela?

	Log_CreateTopic (TOPIC_Phill_lagi, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Phill_lagi, LOG_RUNNING);
	B_LogEntry (TOPIC_Phill_lagi, "Drwal Phill potrzebuje drewna do obróbki. W tym celu chce zapolowaæ na gobliny i odebraæ im lagi.");


	Info_ClearChoices (DIA_NASZ_120_Phill_work);
		Info_AddChoice	  (DIA_NASZ_120_Phill_work, "Jasne.", DIA_NASZ_120_Phill_work_yes);
		Info_AddChoice	  (DIA_NASZ_120_Phill_work, "Nie, dziêki.", DIA_NASZ_120_Phill_work_no);

};

func void PhillSay_Goblins() {
	AI_Output (self, other,"PhillSay_Goblins_55_00"); //S³uchaj, chodzi o to, ¿e muszê zaopatrzyæ siê w drewno, a konkretniej w kije.
	AI_Output (self, other,"PhillSay_Goblins_55_01"); //Rzecz w tym, ¿e gobliny maj¹ potrzebny mi surowiec, a ty móg³byœ wybraæ siê ze mn¹.
};

FUNC VOID DIA_NASZ_120_Phill_work_yes()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_work_yes_15_00"); //Jasne.
	Createinvitems (self, ItMi_Joint, 2);
	B_giveinvitems (self, other, ItMi_Joint, 1);
	B_UseItem (other, ItMi_Joint);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_NASZ_120_Phill_work_yes_55_01"); //No, teraz mo¿emy rozmawiaæ!
	PhillSay_Goblins();
	
	Info_ClearChoices (DIA_NASZ_120_Phill_work);
};

FUNC VOID DIA_NASZ_120_Phill_work_no()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_work_no_15_00"); //Nie, dziêki.
	AI_Output (self, other,"DIA_NASZ_120_Phill_work_no_55_01"); //Twoja strata. Ja jednak sobie zapalê.
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
	AI_Output (self, other,"DIA_NASZ_120_Phill_gdzie_55_01"); //Keroloth ostatnio wspomina³ coœ o jakichœ goblinach w jaskini nad rzek¹, obok wodospadu.
	AI_Output (self, other,"DIA_NASZ_120_Phill_gdzie_55_02"); //Sprawdzimy, czy dalej tam s¹.

	B_LogEntry (TOPIC_Phill_lagi, "Gobliny znajdziemy w jaskini nad rzek¹ obok wodospadu.");

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
 	description = "ChodŸmy skopaæ parê gobliñskich ty³ków.";
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
		AI_Output (self, other,"PhillTestYourSkills_55_00"); //Dobra, mo¿e byæ. Damy radê skurczybykom!
	
		PhillGoOk = TRUE;
		Npc_ExchangeRoutine (NASZ_120_Phill, "Guide");
		//self.aivar[AIV_PARTYMEMBER] = TRUE;
		Druzyna (NASZ_120_Phill,1);
		AI_StopProcessInfos (self);		
	}
		
	else
	{
		AI_Output (self, other,"PhillTestYourSkills_55_01"); //Jesteœ zbyt s³aby! Popraw swoje umiejêtnoœci i dopiero wtedy wróæ do mnie.	
		PrintScreen	("Wymagane przynajmniej 10% walki broni¹.", -1, 45, FONT_ScreenSmall, 2);
	};

};


FUNC VOID DIA_NASZ_120_Phill_go_Info()
{

	AI_Output (other,self ,"DIA_NASZ_120_Phill_go_15_00"); //ChodŸmy skopaæ parê gobliñskich ty³ków.
	
	if (PhillGoOneTime == FALSE)
	{
		AI_Output (self, other,"DIA_NASZ_120_Phill_go_55_01"); //Czekaj, najpierw chcia³bym zobaczyæ, jak walczysz.
		AI_Output (self, other,"DIA_NASZ_120_Phill_go_55_02"); //Czarne gobliny to wcale nie taka gratka, jak mo¿e siê wydawaæ.
		PhillTestYourSkills();
		PhillGoOneTime = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_120_Phill_go_55_03"); //Nauczy³eœ siê ju¿ walczyæ? Poka¿.
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

	AI_Output (self, other,"DIA_NASZ_120_Phill_stop_55_00"); //Jeszcze trochê i trafimy na jaskiniê z tymi goblinami. Uwa¿aj.

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

	AI_Output (self, other,"DIA_NASZ_120_Phill_koniec_55_00"); //Jeszcze jakiœ czarny kurdupel?
	AI_Output (other,self ,"DIA_NASZ_120_Phill_koniec_15_01"); //To ju¿ chyba wszystkie.
	AI_Output (self, other,"DIA_NASZ_120_Phill_koniec_55_02"); //Równie¿ mam takie wra¿enie. Nie by³o to takie ciê¿kie, jak siê spodziewa³em.
	AI_Output (self, other,"DIA_NASZ_120_Phill_koniec_55_03"); //Wracam do obozu. Pozbieraj lagi i mi je przynieœ. Pó³ tuzina powinno wystarczyæ.

	B_LogEntry (TOPIC_Phill_lagi, "Gobiny nie ¿yj¹. Mam pozbieraæ wszystkie lagi i oddaæ Phillowi dwa tuziny.");
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
	AI_Output (self, other,"DIA_NASZ_120_Phill_lagi_55_01"); //Œwietnie, bêdê z czego mia³ zrobiæ nogi do krzese³.
	AI_Output (self, other,"DIA_NASZ_120_Phill_lagi_55_02"); //Masz tu trochê z³ota w podziêce.

	Createinvitems (self, itmi_gold, 40);
	B_giveinvitems (self, other, itmi_gold, 40);
	
	B_LogEntry (TOPIC_Phill_lagi, "Przynios³em Phillowi lagi.");
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
 	description = "Wiesz coœ o paczce z gwoŸdziami?";
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


	AI_Output (other,self ,"DIA_NASZ_120_Phill_Gwozdzie_15_00"); //Wiesz coœ o paczce z gwoŸdziami?
	AI_Output (self, other,"DIA_NASZ_120_Phill_Gwozdzie_55_01"); //Tak, mam tu tak¹. Znalaz³em j¹ kilka dni temu w karczmie.
	AI_Output (other,self ,"DIA_NASZ_120_Phill_Gwozdzie_15_02"); //Daj mi j¹.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Gwozdzie_55_03"); //Nie! Znalezisko nale¿y do mnie. Poza tym potrzebujê tych gwoŸdzi. Co jakiœ czas w heblarce stosuje siê metalowe uchwyty.
	AI_Output (other,self ,"DIA_NASZ_120_Phill_Gwozdzie_15_04"); //Tak siê sk³ada, ¿e ja równie¿ ich potrzebujê. Nale¿a³y do robotnika, a teraz muszê nimi naprawiæ podpory podtrzymuj¹ce budynek.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Gwozdzie_55_05"); //Có¿... W takim razie potrzebujemy ich obaj. S³uchaj, te gwoŸdzie s¹ jakieœ du¿e. Przynieœ mi paczkê ma³ych gwoŸdzi. Zapytaj kowala, czy zrobi je dla ciebie.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Gwozdzie_55_06"); //Wtedy siê wymienimy. Co ty na to?

	WillKnowGwozdzieThief = TRUE;
	
	Info_ClearChoices 	(DIA_NASZ_120_Phill_Gwozdzie);

	if (npc_hasitems (other, ItMi_Gold) >=100) {
		Info_AddChoice		(DIA_NASZ_120_Phill_Gwozdzie,"Wolê zap³aciæ ci 100 sztuk z³ota za te gwoŸdzie.",DIA_NASZ_120_Phill_Gwozdzie_100);
	};

	Info_AddChoice		(DIA_NASZ_120_Phill_Gwozdzie,"Zapomnij, dawaj mi gwoŸdzie!",DIA_NASZ_120_Phill_Gwozdzie_no);
	Info_AddChoice		(DIA_NASZ_120_Phill_Gwozdzie,"Zastanowie siê, jeœli mi zap³acisz.",DIA_NASZ_120_Phill_Gwozdzie_ok);

};


func void DIA_NASZ_120_Phill_Gwozdzie_100 ()
{

	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_100_01_00"); //Wolê zap³aciæ ci 100 sztuk z³ota za te gwoŸdzie.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_100_01_01"); //Sto? W porz¹dku. Bierz, paczka jest twoja.

	B_giveinvitems (other, self, ItMi_Gold, 100);
	Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);
	
	B_LogEntry (TOPIC_Robotnik_deski, "Cholerny drwal! Nie chcia³ daæ mi paczki... Zap³aci³em mu. GwoŸdzie ju¿ mam, teraz pora zabraæ m³otek i przybijaæ!");

	Info_ClearChoices (DIA_NASZ_120_Phill_Gwozdzie);
};

func void DIA_NASZ_120_Phill_Gwozdzie_no ()
{
	AI_ReadyMeleeWeapon	(other);
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_no_01_00"); //Zapomnij, dawaj mi gwoŸdzie!
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_no_01_01"); //O co ci chodzi? To przecie¿ uczciwy uk³ad!
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_no_01_02"); //Nie bêdê gania³ za twoimi zachciankami. Potrzebujê tych gwoŸdzi, ¿eby naprawiæ filary podtrzymuj¹ce konstrukcjê domu Kerolotha.
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_no_01_03"); //Jeœli w tej chwili nie oddasz mi tej przeklêtej paczki, to bêdziesz mia³ do czynienia ze mn¹ albo, co gorsza, z Kerolothem.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_no_01_04"); //Ahh! Chyba Beliar zes³a³ ciê, ¿ebyœ mi przeszkodzi³.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_no_01_05"); //Zabieraj tê paczkê.

	AI_RemoveWeapon		(self);
	
	Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);

	B_LogEntry (TOPIC_Robotnik_deski, "Cholerny drwal! Chcia³ siê mn¹ wys³u¿yæ i za³atwiæ sobie ma³e gwoŸdzie. Nie dam sob¹ pomiataæ. GwoŸdzie ju¿ mam, teraz pora zabraæ m³otek i przybijaæ!");

	Info_ClearChoices (DIA_NASZ_120_Phill_Gwozdzie);
};

func void DIA_NASZ_120_Phill_Gwozdzie_ok ()
{
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_00"); //Zastanowie siê, jeœli mi zap³acisz.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_01"); //Zap³acê ci sto trzydzieœci sztuk z³ota za tê paczkê. W to wlicza siê zap³ata kowalowi.
	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_02"); //Niech bêdzie. Za³atwiê ci paczkê, ale daj mi te pieni¹dze.
	AI_Output(self,other,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_03"); //Proszê, to nale¿y do ciebie. Drugie tyle dostaniesz, gdy zobaczê gwoŸdzie.
	Createinvitems (self, ItMi_Gold, 65);
	B_giveinvitems (self, other, ItMi_Gold, 65);

	AI_Output(other,self,"DIA_NASZ_120_Phill_Gwozdzie_ok_01_04"); //Spodziewaj siê mnie niebawem.
	
	B_LogEntry (TOPIC_Robotnik_deski, "Cholerny drwal! Da mi paczkê, tylko jeœli przyniosê mu ma³e gwoŸdzie. Muszê poprosiæ jakiegoœ kowala.");

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
 	description = "Mam tutaj paczkê.";
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

	AI_Output (other,self ,"DIA_NASZ_120_Phill_GwozdzieDone_15_00"); //Mam tutaj paczkê.
	AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_01"); //Poka¿.
	B_giveinvitems (other, self, ItNa_PaczkaMalychGwozdzi, 1);

	if (GwozdzieKupione == 50) {	
		AI_Output (self,other ,"DIA_NASZ_120_Phill_GwozdzieDone_15_02"); //Piêædziesi¹t? Po co a¿ tyle?
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_03"); //Nie zap³acê ci za zbêdny towar. WeŸ to z³oto. Dok³adnie tyle ci siê nale¿y.
		Createinvitems (self, ItMi_Gold, 65);
		B_giveinvitems (self, other, ItMi_Gold, 65);
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_04"); //A te gwoŸdzie s¹ twoje.
		Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
		B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);
		
		B_LogEntry (TOPIC_Robotnik_deski, "GwoŸdzie ju¿ mam, teraz pora zabraæ m³otek i przybijaæ!");
	};
	
	if (GwozdzieKupione == 20) {	
		AI_Output (self,other ,"DIA_NASZ_120_Phill_GwozdzieDone_15_05"); //W porz¹dku, wystarczy.
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_06"); //Z³oto zgodnie z umow¹, proszê.
		Createinvitems (self, ItMi_Gold, 65);
		B_giveinvitems (self, other, ItMi_Gold, 65);
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_07"); //A te gwoŸdzie s¹ twoje.
		Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
		B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);
		
		B_LogEntry (TOPIC_Robotnik_deski, "GwoŸdzie ju¿ mam, teraz pora zabraæ m³otek i przybijaæ!");
	};
	
	if (GwozdzieKupione == 10) {	
		AI_Output (self,other ,"DIA_NASZ_120_Phill_GwozdzieDone_15_08"); //Nie, nie. Stanowczo za ma³o. To nie wystarczy!
		AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone_55_09"); //Przynieœ mi jeszcze dziesiêæ gwoŸdzi.
		
		B_LogEntry (TOPIC_Robotnik_deski, "Niech to szlag! Przynios³em Phillowi za ma³o gwoŸdzi. Muszê poprosiæ Dobara o wiêcej.");

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
 	description = "Przynios³em pozosta³e gwoŸdzie.";
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

	AI_Output (other,self ,"DIA_NASZ_120_Phill_GwozdzieDone2_15_00"); //Przynios³em pozosta³e gwoŸdzie.
	B_giveinvitems (other, self, ItNa_PaczkaMalychGwozdzi, 1);
	AI_Output (self, other,"DIA_NASZ_120_Phill_GwozdzieDone2_55_01"); //Œwietnie. Oto obiecane z³oto.
	Createinvitems (self, ItMi_Gold, 65);
	B_giveinvitems (self, other, ItMi_Gold, 65);
	AI_Output (self,other ,"DIA_NASZ_120_Phill_GwozdzieDone2_15_02"); //A, no i paczka.
	Createinvitems (self, ItNa_PaczkaGwozdzi, 1);
	B_giveinvitems (self, other, ItNa_PaczkaGwozdzi, 1);

	B_LogEntry (TOPIC_Robotnik_deski, "GwoŸdzie ju¿ mam, teraz pora zabraæ m³otek i przybijaæ!");

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
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4Quest_55_01"); //Ahh, tak siê zastanawiam, czy da siê wspi¹æ na to drzewo?
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4Quest_55_02"); //Co o tym myslisz?
	AI_Output (other,self ,"DIA_NASZ_120_Phill_Kap4Quest_15_03"); //Sam nie wiem... Mogê spróbowaæ.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4Quest_55_04"); //Œwietnie! Chcê to zobaczyæ. Spróbuj wdrapaæ siê na sam czubek.

	Log_CreateTopic (TOPIC_Phill_drzewo, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Phill_drzewo, LOG_RUNNING);
	B_LogEntry (TOPIC_Phill_drzewo, "Phill chcia³by, ¿ebym wdrapa³ siê na sam czubek drzewa w obozie ³owców orków.");

	PHILL_MISSION_READY = TRUE;
};

func void PHILL_FUNC ()
{
	if (PHILL_MISSION_READY == TRUE) && (PHILL_MISSION_ONETIME == FALSE) {
		
		if (Npc_GetDistToWP(NASZ_120_Phill,"NASZ_LOWCY_DOL_22") > 1000) {
			Print("Phill nie widzia³ twojego wyczynu.");
			return;
		};

		PrintScreen	("WYSZED£EŒ NA DRZEWO", -1,-1, FONT_ScreenSmall,3);
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
 	description = "Wyszed³em na szczyt.";
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

	AI_Output (other,self ,"DIA_NASZ_120_Phill_Kap4QuestDone_15_00"); //Wyszed³em na szczyt.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4QuestDone_55_01"); //Widzia³em! Jesteœ bardzo zwinny... Za to widowisko, które mi zgotowa³eœ, nale¿¹ ci siê te mikstury.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Kap4QuestDone_55_02"); //Proszê, weŸ je.

	Createinvitems (self, ItPo_Health_03, 2);
	B_giveinvitems (self, other, ItPo_Health_03, 2);

	Log_SetTopicStatus (TOPIC_Phill_drzewo, LOG_SUCCESS);
	B_LogEntry (TOPIC_Phill_drzewo, "Da³em radê... Kto by pomyœla³!");
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
 	description = "Masz mo¿e jakieœ pi³y na sprzeda¿?";
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

	AI_Output (other,self ,"DIA_NASZ_120_Phill_Pily_15_00"); //Masz mo¿e jakieœ pi³y na sprzeda¿?
	AI_Output (self, other,"DIA_NASZ_120_Phill_Pily_55_01"); //Tylko jedn¹. Trochê stêpiona, ale ci¹gle dobrze tnie.
	AI_Output (self, other,"DIA_NASZ_120_Phill_Pily_55_02"); //Mogê sprzedaæ ci j¹ za 10 sztuk z³ota.
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
 	description = "Sprzedaj mi pi³ê. (10 szt. z³ota)";
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

	AI_Output (other,self ,"DIA_NASZ_120_Phill_BuyPila_15_00"); //Sprzedaj mi pi³ê.
	B_giveinvitems (other, self, ItMi_Gold, 10);
	AI_Output (self, other,"DIA_NASZ_120_Phill_BuyPila_55_01"); //Tylko nie utnij sobie palców!

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

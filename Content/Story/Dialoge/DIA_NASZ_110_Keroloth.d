var int mieczrunicznykeroloth_onetime;
var int join_wybor;
var int gerold_wybor;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_EXIT   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
	nr          = 999;
	condition   = DIA_NASZ_110_Keroloth_EXIT_Condition;
	information = DIA_NASZ_110_Keroloth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_110_Keroloth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_110_Keroloth_EXIT_Info()
{
	if (mieczrunicznykeroloth_onetime == TRUE)
	{
		Npc_RemoveInvItems (self, ItNa_MieczRunicznyKeroloth, 1);
		Createinvitems (self, ItNa_DJG_Weapon_H, 1);
		AI_EquipBestMeleeWeapon	(self);
		AI_StopProcessInfos (self);
		mieczrunicznykeroloth_onetime = FALSE;
	};
	
	AI_StopProcessInfos (self);
};


//*********************************************************************
//	Info InformAboutCrime 
//*********************************************************************
var int Keroloth_Talk_Crime_First_Time;

INSTANCE DIA_NASZ_110_Keroloth_InformAboutCrime   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 1;
 	condition   = DIA_NASZ_110_Keroloth_InformAboutCrime_Condition;
 	information = DIA_NASZ_110_Keroloth_InformAboutCrime_Info;
 	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_InformAboutCrime_Condition()
{
	if (Thief_Counter_Lowcy > 0)
	&& ((Keroloth_Talk_Crime_First_Time == FALSE) || (Npc_IsInState(self, ZS_TALK)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_InformAboutCrime_Info()
{
	if (Keroloth_Talk_Crime_First_Time == FALSE) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_15_00"); //Ch�opcy spu�cili ci lanie? Wida� siniaki. Nale�a�o ci si�!
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_55_01"); //M�wi�em ci przecie�, �e nie mo�esz grzeba� w nie swoich rzeczach.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_55_02"); //Dop�ki nie zap�acisz, za swoje wybryki, nie za�atwiaj ze mn� swoich spraw.
		Keroloth_Talk_Crime_First_Time = TRUE;
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_15_03"); //Przyszed�e� zap�aci�?
	};
	
	var string want_to_pay; want_to_pay = "Chc� zap�aci� za kradzie�. (";
	want_to_pay = ConcatStrings(want_to_pay,IntToString(Thief_Counter_Lowcy*30));
	want_to_pay = ConcatStrings(want_to_pay," szt. z�ota)");

	Info_ClearChoices (DIA_NASZ_110_Keroloth_InformAboutCrime);
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_InformAboutCrime, "KONIEC", DIA_NASZ_110_Keroloth_InformAboutCrime_end);
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_InformAboutCrime, want_to_pay, DIA_NASZ_110_Keroloth_InformAboutCrime_pay);

};

FUNC VOID DIA_NASZ_110_Keroloth_InformAboutCrime_end()
{
	AI_StopProcessInfos(self);
};

FUNC VOID DIA_NASZ_110_Keroloth_InformAboutCrime_pay()
{
	var int want_to_pay_money;
	want_to_pay_money = Thief_Counter_Lowcy*30;

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_InformAboutCrime_pay_15_00"); //Chc� zap�aci� za kradzie�.
	
	if (npc_hasitems(other,ItMi_Gold) >= want_to_pay_money) {
		B_GiveInvItems(other,self,ItMi_Gold,want_to_pay_money);
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_pay_55_01"); //Rozdam pieni�dze najbardziej pokrzywdzonym. Nie mo�emy skaka� sobie nawzajem do garde�, bo staniemy si� du�o �atwiejszym k�skiem dla ork�w.

		Thief_Counter_Lowcy = 0;
		Keroloth_Talk_Crime_First_Time = FALSE;
		
		Info_ClearChoices (DIA_NASZ_110_Keroloth_InformAboutCrime);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_pay_55_02"); //To dobrze, �e chcesz, ale same ch�ci nie wystarcz�. Musisz zgromadzi� wystarczaj�c� sum� i mi j� przekaza�.
		AI_StopProcessInfos(self);
	};
};	
	
//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_siema   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 1;
 	condition   = DIA_NASZ_110_Keroloth_siema_Condition;
 	information = DIA_NASZ_110_Keroloth_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_siema_Info()
{
	// wczesniej ma PreStart
	if (KAPITEL == 1) {
		Npc_ExchangeRoutine (self, "Start");
	};
	
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_siema_15_00"); //Witaj.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_siema_55_01"); //Czego chcesz? Nie mam czasu, m�w szybko. W�a�nie planowa�em ostrza� katapult� na zamek.	

			if (npc_hasitems (other, ItNa_KorthRaport) >= 1) {
				AI_Output (other, self,"DIA_NASZ_110_Keroloth_siema_55_02"); //Przyszed�em tu razem z Korthem. Kaza� da� ci ten papier.
					B_GiveInvItems (other, self, ItNa_KorthRaport, 1);
					Npc_RemoveInvItems(self,ItNa_KorthRaport,1);
				AI_Output (self, other,"DIA_NASZ_110_Keroloth_siema_55_03"); //Prosz�, prosz�... Korth zazwyczaj osobi�cie przekazuje mi raporty, a nie pisze do mnie listy.
				AI_Output (self, other,"DIA_NASZ_110_Keroloth_siema_55_04"); //Ciekawe, dlaczego nie przyszed� do obozu? Albo bardzo si� �pieszy�, albo nie chcia� na kogo� trafi�.
				AI_Output (self, other,"DIA_NASZ_110_Keroloth_siema_55_05"); //Dobrze, �e przynosisz raport. Ocena aktualnej sytuacji znacznie u�atwi planowanie ataku.
				B_GivePlayerXP (100);
			};

	gerold_wybor=0;
};

//*********************************************************************
//	Info Oboz
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_oboz   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 2;
 	condition   = DIA_NASZ_110_Keroloth_oboz_Condition;
 	information = DIA_NASZ_110_Keroloth_oboz_Info;
 	permanent   = FALSE;
	description = "Opowiedz mi o obozie.";
};

FUNC INT DIA_NASZ_110_Keroloth_oboz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_oboz_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_oboz_15_00"); //Opowiedz mi o obozie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_oboz_55_01"); //A co tu du�o gada�? Pozbijane z desek cha�upy, kt�re nie stanowi�yby �adnej przeszkody dla ork�w, by nas zabi�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_oboz_55_02"); //Bardziej zale�a�o nam na dachu nad g�ow� i ochronie zapas�w, kt�re swoj� drog� si� ko�cz�. Fakt, mi�sa mamy pod dostatkiem, ale wiele bym da� za �wie�e owoce.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_oboz_55_03"); //Czy drewniane budynki nie jest �atwo spali�? Orkowi szamani mog� w ka�dej chwili tutaj przyj�� i u�y� swoich czar�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_oboz_55_04"); //A widzisz, to ju� patent zaczerpni�ty od my�liwych. Jeden cz�owiek z ich obozu, Snaf, odkry�, �e wydzielina z odw�ok�w krwiopijc�w jest ognioodporna.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_oboz_55_05"); //Dlatego ka�da deska w naszym obozie jest pokryta grub� warstw� tego p�ynu. Gdyby� wrzuci� tak� desk� do ogniska, ugasi�a by je w mgnieniu oka.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_oboz_55_06"); //Teraz rozumiem, dlaczego pochodnie w budynkach nie podpalaj� ich.
};

//*********************************************************************
//	Info Boss
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_boss   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 3;
 	condition   = DIA_NASZ_110_Keroloth_boss_Condition;
 	information = DIA_NASZ_110_Keroloth_boss_Info;
 	permanent   = FALSE;
	description = "Ty tu jeste� szefem?";
};

FUNC INT DIA_NASZ_110_Keroloth_boss_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_boss_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_boss_15_00"); //Ty tu jeste� szefem?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_boss_55_01"); //Zgadza si�. Kapitan Garond, paladyn, kt�ry wcze�niej sta� na czele naszej wyprawy, poleg� w walce z orkami.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_boss_55_02"); //Przy �yciu zosta�o bardzo niewielu rycerzy. Jako najbieglejszy wojownik obj��em dowodzenie.
};
//*********************************************************************
//	         Info Join
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_join   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 4;
 	condition   = DIA_NASZ_110_Keroloth_join_Condition;
 	information = DIA_NASZ_110_Keroloth_join_Info;
 	permanent   = FALSE;
 	description = "Chcia�bym do was do��czy�.";
};

FUNC INT DIA_NASZ_110_Keroloth_join_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_boss)) && (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_join_Info()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_join_15_00"); //Chcia�bym do was do��czy�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_55_01"); //Przyda si� ka�dy cz�owiek dobrze w�adaj�cy mieczem. Hmm... Umiesz co�?

	if (Mission_Gildia_Ready == FALSE) {
		Log_CreateTopic (TOPIC_gildia, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_gildia, LOG_RUNNING);
		Mission_Gildia_Ready = TRUE;
	};
	
	B_LogEntry (TOPIC_gildia, "Chc�c do��czy� do �owc�w ork�w, musz� przyda� si� w obozie.");

	Info_ClearChoices (DIA_NASZ_110_Keroloth_join);

		Info_AddChoice	  (DIA_NASZ_110_Keroloth_join, "Jestem raczej kiepski...", DIA_NASZ_110_Keroloth_join_no);
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_join, "�miem twierdzi�, �e tak.", DIA_NASZ_110_Keroloth_join_yes);

};

FUNC VOID DIA_NASZ_110_Keroloth_join_no()
{
	join_wybor=0;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_join_no_15_00"); //Jestem raczej kiepski...
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_no_55_01"); //Racja, nie wygl�dasz mi na do�wiadczonego wojownika.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_no_55_02"); //Ale my�l�, �e jest zadanie, w kt�rym m�g�by� si� sprawdzi�.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_join);

};

FUNC VOID DIA_NASZ_110_Keroloth_join_yes()
{
	join_wybor=1;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_join_yes_15_00"); //�miem twierdzi�, �e tak.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_yes_55_01"); //Doprawdy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_yes_55_02"); //Masz wi�c szans� to udowodni�. Mam dla ciebie pewne zadanie.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_join);
};

//*********************************************************************
//	Info QuestNo
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_questno   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 5;
 	condition   = DIA_NASZ_110_Keroloth_questno_Condition;
 	information = DIA_NASZ_110_Keroloth_questno_Info;
 	permanent   = FALSE;
	description = "Co to za zadanie?";
};

FUNC INT DIA_NASZ_110_Keroloth_questno_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_join) && join_wybor==0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_questno_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questno_15_00"); //Co to za zadanie?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questno_55_01"); //Jeden z my�liwych, Louis, to by�y kapitan okr�towy. Nie tak dawno, ta wstr�tna ryba poni�y�a mnie przy innych.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questno_55_02"); //Wykrad� list od mojej �ony, kt�ry dosta�em przed wyruszeniem na wysp� Khorinis i przeczyta� go przy wszystkich. Nie wiem, jak bardzo musia� by� pijany, �eby zagl�da� w prywatne wiadomo�ci.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questno_55_03"); //Oczywi�cie od razu go spra�em. Ale nie da�o mi to �adnej satysfakcji, bo dra� ledwo trzyma� si� na nogach.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questno_15_04"); //Wi�c jak chcesz si� zem�ci�? Te� chcesz go skompromitowa�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questno_55_05"); //W�tpi�, �eby ten stary pierdziel mia� poczucie wstydu. Chc�, �eby zgin�a mu jedna z jego pami�tek po marynarskim �yciu.

	Log_CreateTopic (TOPIC_Keroloth_Louis, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_Louis, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_Louis, "Keroloth pragnie zemsty na my�liwym Louisie, kt�ry dopu�ci� si� jego poni�enia. Przykaza� mi, bym wykrad� my�liwemu jedn� z jego pami�tek po marynarskim �yciu.");
	
};

//*********************************************************************
//	Info QuestNoDokument
//*********************************************************************
var int KerolothDostalMape;
//****************************************
INSTANCE DIA_NASZ_110_Keroloth_questnodokument   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 6;
 	condition   = DIA_NASZ_110_Keroloth_questnodokument_Condition;
 	information = DIA_NASZ_110_Keroloth_questnodokument_Info;
 	permanent   = FALSE;
	description = "Co twoim zdaniem by�oby najlepsze?";
};

FUNC INT DIA_NASZ_110_Keroloth_questnodokument_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_questno)) && (KerolothDostalMape == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_questnodokument_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questnodokument_15_00"); //Co twoim zdaniem by�oby najlepsze?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questnodokument_55_01"); //Bielizna kochanki w porcie, jaka� mapa, narz�dzia ze statku. Oboj�tne co.
	
};

//*********************************************************************
//	Info QuestYes
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_questyes   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 7;
 	condition   = DIA_NASZ_110_Keroloth_questyes_Condition;
 	information = DIA_NASZ_110_Keroloth_questyes_Info;
 	permanent   = FALSE;
	description = "Co to za zadanie?";
};

FUNC INT DIA_NASZ_110_Keroloth_questyes_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_join) && join_wybor==1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_questyes_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questyes_15_00"); //Co to za zadanie?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyes_55_01"); //Wychodz�c z obozu p�nocn� bram� skr�� w lewo. �cie�ka, kt�ra tam jest, prowadzi na niewielk� g�rk�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyes_55_02"); //Grasuje tam kilka zielonych i czarnych stwork�w, kt�re swoim ha�asowaniem doprowadzaj� mnie do sza�u.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyes_55_03"); //Chyba wiesz, co z nimi zrobi�?

	Log_CreateTopic (TOPIC_Keroloth_gobliny, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_gobliny, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_gobliny, "Keroloth nakaza� mi zabi� gobliny znajduj�ce si� w pobli�u obozu.");
	
};

//*********************************************************************
//	Info QuestYesPrzypomnienie
//*********************************************************************
var int KerolothGoblinyZabite;
//********************************************
INSTANCE DIA_NASZ_110_Keroloth_questyesprzypomnienie   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 8;
 	condition   = DIA_NASZ_110_Keroloth_questyesprzypomnienie_Condition;
 	information = DIA_NASZ_110_Keroloth_questyesprzypomnienie_Info;
 	permanent   = TRUE;
	description = "Przypomnisz mi, gdzie grasuj� te gobliny?";
};

FUNC INT DIA_NASZ_110_Keroloth_questyesprzypomnienie_Condition()	
{
	if ((npc_knowsinfo (other, DIA_NASZ_110_Keroloth_questyes)) && (KerolothGoblinyZabite == FALSE)
		&& !npc_isdead (goblin6)
		&& !npc_isdead (goblin7)
		&& !npc_isdead (goblin8)
		&& !npc_isdead (goblin13))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_questyesprzypomnienie_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questyesprzypomnienie_15_00"); //Przypomnisz mi, gdzie grasuj� te gobliny?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesprzypomnienie_55_01"); //Ehh... Pami�� masz gorsz� ni� moja babcia.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesprzypomnienie_55_02"); //Wychodzisz p�nocn� bram�, skr�casz w lewo i idziesz �cie�k� za ska�y.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesprzypomnienie_55_03"); //Po�piesz si�!

};

var int WILL_LOWCA;
//*********************************************************************
//	Info Ready
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_ready   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 9;
 	condition   = DIA_NASZ_110_Keroloth_ready_condition;
 	information = DIA_NASZ_110_Keroloth_ready_Info;
 	permanent   = TRUE;
	description = "Czy jestem ju� gotowy, by do was do��czy�?";
};

FUNC INT DIA_NASZ_110_Keroloth_ready_condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_join)
		&& (!WILL_LOWCA))
		&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_ready_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ready_55_00"); //Czy jestem ju� got�w, by do was do��czy�?

	if (RepEnough(25,REP_LOWCY)) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_15_01"); //Tak. W obozie s�yszy si� o tobie same dobre rzeczy. Ale to jeszcze nie wszystko!
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_02"); //Co prawda ch�opcy ci� popieraj�, ale musisz si� sprawdzi� jako �owca ork�w.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_03"); //Musz� mie� pewno��, �e mog� na tobie polega�, gdy przyjdzie nam walczy�. �e nie narobisz w gacie ze strachu, gdy zobaczysz orka.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_ready_55_04"); //Orkowie nie robi� na mnie wra�enia.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_05"); //B�dziesz mia� okazj� to udowodni�.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_06"); //W jaskini obok mostu przy zamku przebywa kilku ork�w. Prawdopodobnie zostali wygnani z zamku.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_07"); //Masz si� ich samemu pozby�. Kto wie, mo�e przy kt�rym� z nich znajdziesz co� ciekawego?

		WILL_LOWCA = TRUE;

		Wld_InsertNpc	(Orc_Keroloth_A,"FP_ROAM_OW_MOLERAT_CAVE1_OC2"); 
		Wld_InsertNpc	(Orc_Keroloth_B,"FP_SLEEP_OW_MOLERAT_CAVE1_OC2"); 

		Log_CreateTopic (TOPIC_Keroloth_orkowie, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Keroloth_orkowie, LOG_RUNNING);
		B_LogEntry (TOPIC_Keroloth_orkowie, "�eby Keroloth mnie przyj��, musz� zlikwidowa� ork�w znajduj�cych si� w jaskini obok mostu przy zamku.");
		
	}
	else if (RepEnough(10,REP_LOWCY)) {
		PrintMissingRep(25,REP_LOWCY);
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_15_08"); //Niestety to ci�gle za ma�o. Ch�opcy ju� ci� znaj�, ale nie wszyscy jeszcze ci� chwal�.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_09"); //Pracuj tak dalej, a niebawem mo�e spojrz� na ciebie przychylniejszym okiem.
	}
	else {
		PrintMissingRep(25,REP_LOWCY);
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_15_10"); //�artujesz, tak?
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_11"); //Pr�bujesz w og�le zyska� tu reputacj�? Nie? No to nie zawracaj mi g�owy!
	};
};

//*********************************************************************
//	Info ReadyDone
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_ReadyDone   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 10;
 	condition   = DIA_NASZ_110_Keroloth_ReadyDone_Condition;
 	information = DIA_NASZ_110_Keroloth_ReadyDone_Info;
 	permanent   = FALSE;
	description = "Pozby�em si� tamtych ork�w.";
};

FUNC INT DIA_NASZ_110_Keroloth_ReadyDone_Condition()	
{
	if 	((WILL_LOWCA == TRUE)
		&& npc_isdead (Orc_Keroloth_A)
		&& npc_isdead (Orc_Keroloth_B))
	{
		return TRUE;
	};
};

func void KerolothSay_YouCanStart() {
	AI_Output (self, other,"KerolothSay_YouCanStart_55_00"); //Mo�esz zaczyna�, kiedy tylko zechcesz.
};

FUNC VOID DIA_NASZ_110_Keroloth_ReadyDone_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ReadyDone_15_00"); //Pozby�em si� tamtych ork�w.
	
	if (WillZabilWygnanca >= 1) {
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_01"); //I co, znalaz�e� co� ciekawego?
	
		if (npc_hasitems (other, ItRi_Prot_Total_02) >= 1) {
			AI_Output (other, self,"DIA_NASZ_110_Keroloth_ReadyDone_15_02"); //Tylko jaki� orkowy pier�cie�.
			AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_03"); //Mo�e ci si� przyda! Prawdziwy �owca ork�w! Zatrzymaj go, jest tw�j.
		}
	
		else {
			AI_Output (other, self,"DIA_NASZ_110_Keroloth_ReadyDone_15_04"); //Nie.
			AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_05"); //Nie przejmuj si�! Jeszcze nieraz zdob�dziesz jakie� �upy.		
		};
	
	KerolothSay_YouCanStart();

	B_LogEntry (TOPIC_Keroloth_orkowie, "Orkowie pokonani. Teraz mog� ju� do��czy� do �owc�w ork�w.");
	Log_SetTopicStatus (TOPIC_Keroloth_orkowie, LOG_SUCCESS);
	DodajReputacje (5, REP_LOWCY);
	B_GivePlayerXP (300);

	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_06"); //Ty? Chodz� plotki, �e kto� ci pomaga�.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_07"); //Liczy�em, �e zajmiesz si� tym sam, ale jakby nie by�o, wykona�e� zadanie.
		
		KerolothSay_YouCanStart();
		
		//B_LogEntry (TOPIC_Keroloth_orkowie, "Keroloth jakim� cudem dowiedzia� si�, �e nie pokona�em ork�w sam. No c�, wykona�em zadanie i mog� do��czy� do �owc�w ork�w, ale czuj�, �e Keroloth patrzy na mnie z politowaniem.");
		//Log_SetTopicStatus (TOPIC_Keroloth_orkowie, LOG_FAILED);
		FailQuest(TOPIC_Keroloth_orkowie,"Keroloth jakim� cudem dowiedzia� si�, �e nie pokona�em ork�w sam. No c�, wykona�em zadanie i mog� do��czy� do �owc�w ork�w, ale czuj�, �e Keroloth patrzy na mnie z politowaniem.");

	};
};

//*********************************************************************
//	Info BeALowca
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_BeALowca   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 11;
 	condition   = DIA_NASZ_110_Keroloth_BeALowca_Condition;
 	information = DIA_NASZ_110_Keroloth_BeALowca_Info;
 	permanent   = FALSE;
	description = "Chc� zosta� �owc� ork�w.";
};

FUNC INT DIA_NASZ_110_Keroloth_BeALowca_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_ReadyDone))
		&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_BeALowca_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_BeALowca_15_00"); //Chc� zosta� �owc� ork�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BeALowca_55_01"); //Wspaniale. Zatem mi�o mi og�osi�, �e przyjmuj� ci� w nasze szeregi. S�u� dzielnie i pami�taj: Nie daj si� zabi�, szczeg�lnie nie orkowi.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BeALowca_55_02"); //Ten pancerz jest tw�j, trzymaj.

	Createinvitems (self, ITNA_DJG_L, 1);
	B_giveinvitems (self, other, ITNA_DJG_L, 1);
	AI_EquipBestArmor (other);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BeALowca_55_03"); //Je�li marzy ci si� lepszy, to Engor taki ci sprzeda.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BeALowca_55_04"); //Nie zapomnij te� zapyta� Johny'ego o miecz. Jan ci�gle pracuje, �eby broni nam nie zabrak�o.

	Npc_SetTrueGuild (other, GIL_DJG);
	other.guild	= GIL_DJG;
	Snd_Play ("LEVELUP");

	B_GivePlayerXP (1000);		
	DodajReputacje(5,REP_LOWCY);
	B_LogEntry (TOPIC_gildia, "Do��czy�em do �owc�w ork�w.");
	Log_SetTopicStatus (TOPIC_gildia, LOG_SUCCESS);
	
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
};


//*********************************************************************
//	Info Gerold
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_gerold   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 12;
 	condition   = DIA_NASZ_110_Keroloth_gerold_Condition;
 	information = DIA_NASZ_110_Keroloth_gerold_Info;
 	permanent   = FALSE;
	description = "Gerold chcia�by popilnowa� kt�rej� z bram.";
};

FUNC INT DIA_NASZ_110_Keroloth_gerold_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_keroloth)) && (MIS_GEROLD_READY == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_gerold_15_00"); //Gerold chcia�by popilnowa� kt�rej� z bram.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_55_01"); //Jak my�lisz, dlaczego mu na to nie pozwalam? Nie przekonasz mnie do tego, �eby ten g�odom�r sta� na stra�y.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_gerold_15_02"); //G�odom�r?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_55_03"); //Tak, na zamku by�a ju� taka sytuacja, �e Gerold poszed� si� na�re�, zaniedbuj�c swoje obowi�zki.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_55_04"); //Chyba, �e we�miesz odpowiedzialno�� za ewentualne zagro�enie? Co oznacza drobn� zaliczk�. Ile z�ota m�g�by� za niego za�o�y�?

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);

		Info_AddChoice	  (DIA_NASZ_110_Keroloth_gerold, "100 sztuk z�ota.", DIA_NASZ_110_Keroloth_gerold_s);
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_gerold, "200 sztuk z�ota.", DIA_NASZ_110_Keroloth_gerold_d);

		if (npc_hasitems (other, ItMi_Gold) >=500) {
			Info_AddChoice	  (DIA_NASZ_110_Keroloth_gerold, "500 sztuk z�ota.", DIA_NASZ_110_Keroloth_gerold_p);
		};
		
		if (npc_hasitems (other, ItMi_Gold) >=1000) {
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_gerold, "1000 sztuk z�ota.", DIA_NASZ_110_Keroloth_gerold_t);
		};
};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_s()
{
	gerold_wybor=1;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_gerold_s_15_00"); //100 sztuk z�ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_s_55_01"); //Taka ma�a suma nie wchodzi w gr�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_s_55_02"); //500 sztuk z�ota i Gerold mo�e pilnowa� bramy.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);

};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_d()
{
	gerold_wybor=1;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_gerold_d_15_00"); //200 sztuk z�ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_d_55_01"); //To za ma�o.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_d_55_02"); //Chc� 500 sztuk z�ota.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);
};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_p()
{
	gerold_wybor=2;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_gerold_p_15_00"); //500 sztuk z�ota.
	B_GiveInvItems (other, self, ItMi_Gold, 500);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_p_55_01"); //Cena rozs�dna.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_p_55_02"); //Id� do niego i powiedz mu, by poszed� pilnowa� wej�cia od strony cmentarza.

	B_LogEntry (TOPIC_Gerold_Keroloth, "Zap�aci�em Kerolothowi 500 sztuk z�ota. Kaza� mi powiedzie� Geroldowi, by poszed� pilnowa� wej�cia od strony cmentarza.");

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);
};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_t()
{
	gerold_wybor=2;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_gerold_t_15_00"); //1000 sztuk z�ota.
	B_GiveInvItems (other, self, ItMi_Gold, 1000);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_t_55_01"); //Hojny z ciebie go��.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_t_55_02"); //Id� do niego i powiedz mu, by poszed� pilnowa� wej�cia od strony cmentarza.

	B_LogEntry (TOPIC_Gerold_Keroloth, "Zap�aci�em Kerolothowi 1000 sztuk z�ota. Kaza� mi powiedzie� Geroldowi, by poszed� pilnowa� wej�cia od strony cmentarza.");

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);
};

//*********************************************************************
//	Info Kasa
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_kasa   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 13;
 	condition   = DIA_NASZ_110_Keroloth_kasa_Condition;
 	information = DIA_NASZ_110_Keroloth_kasa_Info;
 	permanent   = FALSE;
	description = "Masz te 500 sztuk z�ota.";
};

FUNC INT DIA_NASZ_110_Keroloth_kasa_Condition()	
{
	if (gerold_wybor==1
	&& npc_hasitems (other, ItMi_Gold) >= 500) && (MIS_GEROLD_READY == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_kasa_Info()
{
	gerold_wybor=2;
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_kasa_15_00"); //Masz te 500 sztuk z�ota.
	B_GiveInvItems (other, self, ItMi_Gold, 500);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_kasa_55_01"); //Dobra. Id� do Gerolda i powiedz mu, by poszed� pilnowa� wej�cia od strony cmentarza.

	B_LogEntry (TOPIC_Gerold_Keroloth, "Zap�aci�em Kerolothowi 500 sztuk z�ota. Kaza� mi powiedzie� Geroldowi, by poszed� pilnowa� wej�cia od strony cmentarza.");
};

//*********************************************************************
//	Info QuestNoEnd
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_questnoend   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 14;
 	condition   = DIA_NASZ_110_Keroloth_questnoend_Condition;
 	information = DIA_NASZ_110_Keroloth_questnoend_Info;
 	permanent   = FALSE;
	description = "Trzymaj, to mapa morska Louisa.";
};

FUNC INT DIA_NASZ_110_Keroloth_questnoend_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_questno)
		&& npc_hasitems (other, ItNa_Mapa_Morska) >=  1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_questnoend_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questnoend_15_00"); //Trzymaj, to mapa morska Louisa.
		B_GiveInvItems (other, self, ItNa_Mapa_Morska, 1);
		Npc_RemoveInvItems(self,ItNa_Mapa_Morska,1);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questnoend_55_01"); //Co my tu mamy?
	B_UseFakeScroll();
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questnoend_55_02"); //My�l�, �e w�cieknie si�, gdy zobaczy, �e znikn�a.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questnoend_55_03"); //Zgadzam si�. Z tej mapy korzysta� zapewne ca�e �ycie. Dobrze si� spisa�e�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questnoend_55_04"); //Masz tu troch� z�ota, mo�esz to sobie wynagrodzi� w karczmie i wypi� par� butelek dobrego wina.
	Createinvitems (self, itmi_gold, 70);
	B_giveinvitems (self, other, itmi_gold, 70);

	KerolothDostalMape = TRUE;

	B_LogEntry (TOPIC_Keroloth_Louis, "Przynios�em map� Kerolothowi. Wydawa� si� by� zadowolony.");
	Log_SetTopicStatus (TOPIC_Keroloth_Louis, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (3, REP_LOWCY);
};


//*********************************************************************
//	Info QuestYesEnd
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_questyesend   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 15;
 	condition   = DIA_NASZ_110_Keroloth_questyesend_Condition;
 	information = DIA_NASZ_110_Keroloth_questyesend_Info;
 	permanent   = FALSE;
	description = "Pozby�em si� goblin�w.";
};

FUNC INT DIA_NASZ_110_Keroloth_questyesend_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_questyes)
		&& npc_isdead (goblin6)
		&& npc_isdead (goblin7)
		&& npc_isdead (goblin8)
		&& npc_isdead (goblin13))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_questyesend_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questyesend_15_00"); //Pozby�em si� goblin�w.
	
	if (WillZabilGoblinaKerolotha >=2) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_01"); //Wreszcie mo�na w spokoju planowa� atak.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_02"); //We� to z�oto i pami�taj, �e za prac� jest si� hojnie wynagradzanym.
		Createinvitems (self, itmi_gold, 70);
		B_giveinvitems (self, other, itmi_gold, 70);
		
		KerolothGoblinyZabite = TRUE;

		B_LogEntry (TOPIC_Keroloth_gobliny, "Keroloth by� pod wra�eniem, �e zdo�a�em wyeliminowa� gobliny.");
		Log_SetTopicStatus (TOPIC_Keroloth_gobliny, LOG_SUCCESS);
		
		B_GivePlayerXP (300);
		DodajReputacje (3, REP_LOWCY);
	}
	
	else {	
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_03"); //Jaja sobie ze mnie robisz?
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_04"); //Ch�opcy odwalili za ciebie robot�. Wstyd.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_05"); //Poszukaj sobie innego zaj�cia. Do wojaczki, p�ki co, si� nie nadajesz.
		//B_LogEntry (TOPIC_Keroloth_gobliny, "Keroloth wy�mia� mnie, bo nie zabi�em tych goblin�w sam.");
		//Log_SetTopicStatus (TOPIC_Keroloth_gobliny, LOG_FAILED);
		FailQuest(TOPIC_Keroloth_gobliny,"Keroloth wy�mia� mnie, bo nie zabi�em tych goblin�w sam.");

	};
};






//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_Goth   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 15;
 	condition   = DIA_NASZ_110_Keroloth_Goth_Condition;
 	information = DIA_NASZ_110_Keroloth_Goth_Info;
 	permanent   = FALSE;
	description = "Wiesz co� o obrabowaniu my�liwego Gotha?";
};

FUNC INT DIA_NASZ_110_Keroloth_Goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie))
	&& (!KNOW_THIEF)
	&& (npc_knowsinfo(other,DIA_NASZ_106_Jan_goth) || npc_knowsinfo(other,DIA_NASZ_109_Rethon_goth))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_Goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Goth_15_00"); //Wiesz co� o obrabowaniu my�liwego Gotha?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Goth_55_01"); //Wiem tyle, �e przez to pogorszy�y si� nasze relacje, a powinni�my sobie pomaga�, a nie walczy� mi�dzy sob�.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Goth_15_02"); //Masz jakie� podejrzenia, kto m�g� to zrobi�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Goth_55_03"); //I tak i nie... Jaki� czas temu z obozu znikn�� Lens, kt�ry wcze�niej walczy� na arenie. Rozmawia�em o tym z Kurganem, ale ten twierdzi, �e biedak zgin�� podczas patrolowania okolicy.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Goth_55_04"); //Jednak zbie�no�� w czasie tych dw�ch wydarze� wydaje mi si� podejrzana.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Goth_15_05"); //Dzi�ki za wskaz�wk�!
	
	B_LogEntry (TOPIC_Goth_kradziez, "Keroloth powiedzia� mi, �e jaki� czas temu z obozu znikn�� gladiator Lens. Skoro ten cz�owiek walczy� na arenie, to mo�e Kurgan wie co� na ten temat?");

};


//*********************************************************************
//	Info LensIsDead
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_LensIsDead   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 16;
 	condition   = DIA_NASZ_110_Keroloth_LensIsDead_Condition;
 	information = DIA_NASZ_110_Keroloth_LensIsDead_Info;
 	permanent   = FALSE;
	description = "Mia�e� racj�, co do Lensa.";
};

FUNC INT DIA_NASZ_110_Keroloth_LensIsDead_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_Goth))
	&& (npc_isdead(NASZ_102_Lens))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_LensIsDead_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_LensIsDead_15_00"); //Mia�e� racj�, co do Lensa.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_LensIsDead_15_01"); //Znalaz�em go w jednej z jaski�. Mia� przy sobie wszystkie towary. Sam nie wiem, po co mu by�y. Przecie� kto by je od niego odkupi�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_LensIsDead_55_02"); //W G�rniczej Dolinie ludzie �wiruj�. To nie pierwszy cz�owiek, z kt�rym tak si� sta�o. Jeszcze na zamku dosz�y mnie s�uchy, �e pewien my�liwy, Engrom, pr�bowa� przebiec mi�dzy orkowymi namiotami na prze��cz.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_LensIsDead_55_03"); //Niekt�rzy m�wili, �e zosta� op�tany, jednak moim zdaniem kole� po prostu nie wytrzyma� i pope�ni� samob�jstwo.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_LensIsDead_55_04"); //Dzi�ki za raport. Zabi�e� go, prawda?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_LensIsDead_15_05"); //Tak.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_LensIsDead_55_06"); //S�usznie post�pi�e�. Na �wiecie nie potrzeba bandzior�w i opryszk�w.

	B_GivePlayerXP(50);
};




//*********************************************************************
//	Info WhatToDoKap2
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_WhatToDoKap2   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 16;
 	condition   = DIA_NASZ_110_Keroloth_WhatToDoKap2_Condition;
 	information = DIA_NASZ_110_Keroloth_WhatToDoKap2_Info;
 	permanent   = FALSE;
	description = "Wyr�wna�em rachunki z Marcosem.";
};

FUNC INT DIA_NASZ_110_Keroloth_WhatToDoKap2_Condition()	
{
	if (hero.guild == GIL_DJG)
	&& (KOPACZE_URATOWANI == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_WhatToDoKap2_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_WhatToDoKap2_15_00"); //Wyr�wna�em rachunki z Marcosem.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatToDoKap2_55_01"); //�wietnie, mo�e skusisz si� na kolejne zadanie? Gestath chcia�, �ebym przys�a� mu kogo� do pomocy. Podobno ma jak�� specjaln� misj�...
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatToDoKap2_55_02"); //My�lisz, �e si� nadasz?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_WhatToDoKap2_15_03"); //Jestem tego pewien.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatToDoKap2_55_04"); //�wietnie! W takim razie id�. Powodzenia.

	Log_CreateTopic (TOPIC_Gestath_Renegaci, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gestath_renegaci, LOG_RUNNING);
	B_LogEntry (TOPIC_Gestath_renegaci, "Keroloth wys�a� mnie do Gestatha. Szykuje si� jakie� zadanie specjalne.");

};



var int KerolothRenegatOneTime;
///////////////////////////////////////////////////////////////////////
//	Info WantToKillRenegat
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_110_Keroloth_WantToKillRenegat		(C_INFO)
{
	npc			 = 	NASZ_110_Keroloth;
	nr		 	 = 	18;
	condition	 = 	DIA_NASZ_110_Keroloth_WantToKillRenegat_Condition;
	information	 = 	DIA_NASZ_110_Keroloth_WantToKillRenegat_Info;
	permanent    =  TRUE;
	description	 = 	"Pomo�esz mi w walce z Marcosem?";
};

func int DIA_NASZ_110_Keroloth_WantToKillRenegat_Condition ()
{
	if (WillWantToKillRenegats == TRUE) && (KerolothRenegatOK == FALSE) && !(npc_isdead (NASZ_009_Marcos)) && !(hero.guild == GIL_OUT)
		{
			return TRUE;
		};
};

func void DIA_NASZ_110_Keroloth_WantToKillRenegat_Info ()
{
	AI_Output	(other, self, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_00"); //Pomo�esz mi w walce z Marcosem?
	if !(hero.guild == GIL_DJG) && (KerolothRenegatOneTime == FALSE) {
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_08_01"); //Marcos, paladyn renegat. Czemu chcesz z nim walczy�?
		AI_Output	(other, self, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_02"); //Przetrzymywa� mnie w kopalni. Musz� po�o�y� kres jego post�powaniu i uwolni� moich przyjaci�.
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_08_03"); //Mo�esz liczy� na moje wsparcie pod warunkiem, �e do nas do��czysz. Nie b�d� ryzykowa� �mierci� moich ch�opc�w w imi� osoby, kt�rej nawet nie znam. 
		
		KerolothRenegatOneTime = TRUE;
		B_LogEntry (TOPIC_Korth_kopalnia, "Keroloth wesprze mnie tylko, je�li stan� si� �owc� ork�w.");
	}
	else if !(hero.guild == GIL_DJG) && (KerolothRenegatOneTime == TRUE) {
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_08_04"); //Nie.
	}
	else {
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_08_05"); //Tak. Jeste� ju� jednym z nas, dotrzymam obietnicy. Powiedz co� wi�cej na ten temat.
		AI_Output	(other, self, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_06"); //Marcos jest schowany w kopalni, za palisad�. Chc� si� tam jako� dosta�.
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_07"); //Zapewne bram� da si� otworzy� tylko od wewn�trz... Mo�e znajdziesz gdzie� szpar� mi�dzy deskami?
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_08"); //We� ten magiczny zw�j. Przemiana w chrz�szcza to bardzo u�yteczne zakl�cie.
		CreateInvItems (self, ItNa_TrfMeatbug, 1);									
		B_GiveInvItems (self, other, ItNa_TrfMeatbug, 1);
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_09"); //Zabierz ze sob� Feda, Ferosa i Kjorna. Przyda im si� trening inny ni� walka na arenie.		
		
		B_LogEntry (TOPIC_Korth_kopalnia, "W ko�cu nadszed� czas powrotu do kopalni. Tym razem jednak ju� nie jako kopacz, a jako �owca ork�w! Keroloth da� mi zw�j przemiany w chrz�szcza. Mo�e gdzie� mi�dzy deskami palisady b�dzie jaka� ma�a dziura, dzi�ki kt�rej przedostan� si� do �rodka. Mam zabra� ze sob� Feda, Kjorna i Ferosa.");

		KerolothRenegatOK = TRUE;

	};
};

//*********************************************************************
//	Info Work1
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_work1   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 20;
 	condition   = DIA_NASZ_110_Keroloth_work1_Condition;
 	information = DIA_NASZ_110_Keroloth_work1_Info;
 	permanent   = FALSE;
	description = "Masz dla mnie jak�� robot�?";
};

FUNC INT DIA_NASZ_110_Keroloth_work1_Condition()	
{
	if (KAPITEL == 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_work1_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_work1_15_00"); //Masz dla mnie jak�� robot�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_01"); //Jest co� do zrobienia. Innym si� nie uda�o, mo�e pora zaanga�owa� w t� spraw� w�a�nie ciebie.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_work1_15_02"); //Warto spr�bowa�. O co chodzi?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_03"); //Chodzi o kamienne golemy. Jako� do tej pory nikt z �owc�w, kt�rzy zajmowali si� t� spraw�, nie trafi� na �adnego kamiennego stwora. Chyba �e gdy ju� trafili, to nie odwa�yli si� przyst�pi� do akcji?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_04"); //Ale po kolei: Gdy kt�rego� wieczoru przechadza�em si� po komnatach zamku, w kt�rym� regale z ksi�gami natrafi�em na zw�j przemiany w golema.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_05"); //Oczywi�cie zabra�em go ze sob�. Jednym z moich pomys��w na szturm na zamek jest rozwalenie zamkowych mur�w i przebicie si� do kt�rej� z piwnic.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_work1_15_06"); //Wiesz, w kt�rym miejscu uderzy�, by przebi� si� do piwnicy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_07"); //Podejrzewam, ale ustaleniem tego zajm� si� p�niej. Najpierw trzeba upewni� si�, �e ma to sens. Pierwszy pr�bowa� Godar. Mia� znale�� kamiennego golema, u�y� zakl�cia przemiany i spr�bowa� go pokona�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_08"); //Gdy przez kilka dni nie m�g� znale�� �adnego golema, zw�j przej�� Hokurn, ale on oczywi�cie te� nic nie zdzia�a�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_09"); //Pora na ciebie. Id� do Hokurna i odbierz zw�j. Gdy na swojej drodze spotkasz jakiego� kamiennego golema, u�yj czaru przemiany i spr�buj go rozwali�. Je�li ci si� uda, wr�� do mnie. Czy zadanie jest jasne?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_work1_15_10"); //Jasne. Ju� biegn� do Hokurna.
	
	Golem_MIS_Running = TRUE;
	
	Log_CreateTopic (TOPIC_Keroloth_golem, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_golem, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_golem, "Keroloth znalaz� zw�j przemiany w golema i chcia�by si� dowiedzie�, czy golem jest w stanie burzy� kamienne mury. Zanim kto� targnie si� na zamek, trzeba sprawdzi�, czy ma to sens. Mam i�� do Hokurna i zabra� od niego zw�j. Gdy spotkam kamiennego golema, mam u�y� czaru przemiany w golema i spr�bowa� powali� przeciwnika.");

};


//*********************************************************************
//	Info Work1Done
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_Work1Done   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 21;
 	condition   = DIA_NASZ_110_Keroloth_Work1Done_Condition;
 	information = DIA_NASZ_110_Keroloth_Work1Done_Info;
 	permanent   = FALSE;
	description = "Pokona�em kamiennego golema.";
};

FUNC INT DIA_NASZ_110_Keroloth_Work1Done_Condition()	
{	
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_work1))
	&& (Golem_MIS_Killed == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1Done_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1Done_15_00"); //Pokona�em kamiennego golema.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_55_01"); //Uda�o ci si�! Zatem moja koncepcja na atak ma szans� si� powie��.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_55_02"); //Powiedz, czy jako kamienny gigant ma si� spore uderzenie? �atwo rozgromi� ska��?

	B_LogEntry (TOPIC_Keroloth_golem, "Szef �owc�w ork�w chcia�by mie� zapewne ca�� armi� kamiennych stwor�w. Mam z�o�y� wizyt� Kirgo i zapyta�, czy m�g�by przepisa� zw�j przemiany.");
	
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1Done);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Work1Done, "Nie mia�em �adnego k�opotu z pokonaniem golema.", DIA_NASZ_110_Keroloth_Work1Done_nohassle);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Work1Done, "�rednio, ale golem jest du�o silniejszy ni� cz�owiek.", DIA_NASZ_110_Keroloth_Work1Done_notrly);
};

func void KerolothSay_GoToKirgo() {
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_00"); //�eby to wszystko mia�o sens, potrzeba przynajmniej kilka takich golem�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_01"); //Mam tu jeszcze jeden taki zw�j. Nie chc�, by si� zmarnowa�. Spr�bujemy go przepisa�.

	CreateInvItems (self, ItNa_TrfGolem, 1);									
	B_GiveInvItems (self, other, ItNa_TrfGolem, 1);

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_02"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_03"); //Udaj si� do alchemika z obozu my�liwych. Znam si� troch� na runach paladyn�w, ale o zwojach nie wiem prawie nic.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_04"); //Kirgo to obecnie jedyny cz�owiek w kolonii, kt�ry ma szans� odtworzy� ten zw�j i zrobi� kilka, czy tam kilkana�cie sztuk.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_05"); //Miejmy nadziej�, �e mu si� uda...
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1Done_nohassle()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Work1Done_nohassle_15_00"); //Nie mia�em �adnego k�opotu z pokonaniem golema.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_nohassle_55_01"); //To bardzo dobra prognoza w perspektywie przebicia si� przez mury, czy cho�by os�abienia umocnie� wroga.
	KerolothSay_GoToKirgo();
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1Done);
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1Done_notrly()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Work1Done_notrly_15_00"); //�rednio, ale golem jest du�o silniejszy ni� cz�owiek.
	KerolothSay_GoToKirgo();
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1Done);
};

//*********************************************************************
//	Info Work1DoneEnd
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_Work1DoneEnd   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 21;
 	condition   = DIA_NASZ_110_Keroloth_Work1DoneEnd_Condition;
 	information = DIA_NASZ_110_Keroloth_Work1DoneEnd_Info;
 	permanent   = FALSE;
	description = "Kirgo nie uda�o si� przepisa� zwoju.";
};

FUNC INT DIA_NASZ_110_Keroloth_Work1DoneEnd_Condition()	
{	
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1DoneEnd_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1DoneEnd_15_00"); //Kirgo nie uda�o si� przepisa� zwoju.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_55_01"); //Ta wiadomo�� popsu�a mi troch� dzisiejszy dzie�.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1DoneEnd_15_02"); //Nie przejmuj si�, z pewno�ci� jest mn�stwo innych sposob�w na odbicie zamk�w. A szczerze m�wi�c, ten wcale nie by� zbyt racjonalny.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_55_03"); //A co si� sta�o z ostatnim egzemplarzem, kt�ry ci da�em? Chcia�bym go odzyska�.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1DoneEnd);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Work1DoneEnd, "Kirgo przypadkiem zniszczy� go w trakcie przepisywania.", DIA_NASZ_110_Keroloth_Work1DoneEnd_mine);
	if(npc_hasitems(other,ItNa_TrfGolem)>=1) {
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_Work1DoneEnd, "Prosz�, zw�j zn�w jest tw�j.", DIA_NASZ_110_Keroloth_Work1DoneEnd_your);
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1DoneEnd_mine()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Work1DoneEnd_mine_15_00"); //Kirgo przypadkiem zniszczy� go w trakcie przepisywania.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_mine_55_01"); //W takim razie ta ca�a akcja to jedna wielka klapa. Mog�em lepiej wykorzysta� te dwa zwoje.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_mine_55_02"); //Tak czy inaczej, dzi�ki za pomoc. Dobra robota, Willu.

	CreateInvItems (self, ItMi_Gold, 120);									
	B_GiveInvItems (self, other, ItMi_Gold, 120);

	DodajReputacje(3,REP_LOWCY);
	B_GivePlayerXP(500);
	
	B_LogEntry (TOPIC_Keroloth_golem, "Ok�ama�em Kerolotha i zatrzyma�em zw�j dla siebie.");
	Log_SetTopicStatus (TOPIC_Keroloth_golem, LOG_SUCCESS);
	
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1DoneEnd);
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1DoneEnd_your()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Work1DoneEnd_your_15_00"); //Prosz�, zw�j zn�w jest tw�j.
	B_GiveInvItems(other,self,ItNa_TrfGolem,1);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_your_15_01"); //Zastanawiam si�, czy mog� go jeszcze jako� wykorzysta�. No nic, pomy�l� nad tym p�niej.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_your_15_02"); //Mimo, �e nic z tego nie wysz�o, nale�y ci si� ma�� nagroda za fatyg�. Prosz�.

	CreateInvItems (self, ItMi_Gold, 120);									
	B_GiveInvItems (self, other, ItMi_Gold, 120);

	DodajReputacje(3,REP_LOWCY);
	B_GivePlayerXP(500);
	
	B_LogEntry (TOPIC_Keroloth_golem, "Odda�em zw�j Kerolothowi.");
	Log_SetTopicStatus (TOPIC_Keroloth_golem, LOG_SUCCESS);
	
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1DoneEnd);
};

//*********************************************************************
//	Info Artefakt
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_artefakt   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 25;
 	condition   = DIA_NASZ_110_Keroloth_artefakt_Condition;
 	information = DIA_NASZ_110_Keroloth_artefakt_Info;
 	permanent   = FALSE;
	description = "Znalaz�e� mo�e ostatnio kawa�ek jakiego� pier�cienia?";
};

FUNC INT DIA_NASZ_110_Keroloth_artefakt_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_408_Straznik_Odpornosc))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_artefakt_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_artefakt_15_00"); //Znalaz�e� mo�e ostatnio kawa�ek jakiego� pier�cienia?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_artefakt_55_01"); //Istotnie. Ciekawe sk�d to wiesz? Zbieg okoliczno�ci? A mo�e masz co� wsp�lnego z t� plugaw� istot�, kt�rej to odebrali�my?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_artefakt_55_02"); //Korth przypadkiem natkn�� si� na zw�j i przyzwa� w�a�ciciela pier�cienia. Dobrze, �e w pobli�u by�o kilku �owc�w i pomogli zwia� stamt�d Korthowi.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_artefakt_15_03"); //Pracuj� dla Gestatha, ta cz�� jest mi niezwykle potrzebna.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_artefakt_55_04"); //Dla Gestatha powiadasz? Oddam ci t� cz��, je�li zrobisz co� dla mnie.
	
	if(hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_artefakt_55_05"); //Nie zapominaj, �e jako �owca ork�w musisz dba� o sprawy obozu.
	};

	B_LogEntry (TOPIC_Niedostepny_Klif, "Rzeczywi�cie �owcy s� w posiadaniu artefaktu. Musz� jednak pom�c szefowi, �eby mi go odst�pi�.");

};

//*********************************************************************
//	Info Duchy
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_duchy   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 26;
 	condition   = DIA_NASZ_110_Keroloth_duchy_Condition;
 	information = DIA_NASZ_110_Keroloth_duchy_Info;
 	permanent   = FALSE;
	description = "Co mam zrobi�?";
};

FUNC INT DIA_NASZ_110_Keroloth_duchy_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_artefakt))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_duchy_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_duchy_15_00"); //Co mam zrobi�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_01"); //Nasz cmentarz gn�bi� szkielety. Zabij je i upewnij si�, �e ju� nie wr�c�. Mo�esz sobie wzi�� Gerolda do pomocy. Ale to nie wszystko.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_02"); //Musisz si� dowiedzie�, sk�d si� tam wzi�y.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_duchy_15_03"); //Zaraz, dlaczego nie zrobi tego kt�ry� z �owc�w?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_04"); //Wbrew pozorom ci, kt�rzy przybyli do G�rniczej Doliny, by polowa� na smoki, panicznie boj� si� o�ywie�c�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_05"); //Kurgan stanowczo odm�wi�, gdy kaza�em gladiatorom si� tym zaj��.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_duchy_15_06"); //To mo�e ja te� odm�wi�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_07"); //Je�li odm�wisz, to nie dostaniesz pier�cienia. Nie masz wyboru, musisz si� tym zaj��.

	Wld_InsertNpc				(Skeleton_Lowcy_SkeA,"NASZ_LOWCY_CMENTARZ_A");
	Wld_InsertNpc				(Skeleton_Lowcy_SkeB,"NASZ_LOWCY_CMENTARZ_B");
	Wld_InsertNpc				(Skeleton_Lowcy_SkeC,"NASZ_LOWCY_CMENTARZ_C");
	Wld_InsertNpc				(Skeleton_Lowcy_SkeD,"NASZ_LOWCY_CMENTARZ_D");
	Wld_InsertNpc				(Skeleton_Lowcy_SkeE,"NASZ_LOWCY_CMENTARZ_E");
	Wld_InsertNpc				(Skeleton_Lowcy_SkeF,"NASZ_LOWCY_CMENTARZ_F");
	Wld_InsertNpc				(Skeleton_Lowcy_SkeG,"NASZ_LOWCY_CMENTARZ_G");
	Wld_InsertNpc				(Skeleton_Lowcy_SkeH,"NASZ_LOWCY_CMENTARZ_H");

	Wld_InsertNpc		(Skeleton_Lord_Garrel,"OW_SWAMPDRAGON_01");

	Log_CreateTopic (TOPIC_Keroloth_duchy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_duchy, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_duchy, "Na cmentarzu �owc�w ork�w pojawi�y si� szkielety. Musz� si� ich pozby� i rozwik�a�, sk�d si� tam wzi�y.");

};

//*********************************************************************
//	Info Cmentarz
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_cmentarz   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 27;
 	condition   = DIA_NASZ_110_Keroloth_cmentarz_Condition;
 	information = DIA_NASZ_110_Keroloth_cmentarz_Info;
 	permanent   = FALSE;
	description = "Gdzie jest ten cmentarz?";
};

FUNC INT DIA_NASZ_110_Keroloth_cmentarz_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_duchy)) && !(npc_knowsinfo (other, DIA_NASZ_110_Keroloth_done))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_cmentarz_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_cmentarz_15_00"); //Gdzie jest ten cmentarz?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_cmentarz_55_01"); //Id� do knajpy. Za lad� Silasa jest drabina. Wyjd� do g�ry, zobaczysz k�adk� z desek. Przejd� po niej, a niewiele dalej znajduje si� cmentarz.
};

//*********************************************************************
//	Info Done
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_done   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 28;
 	condition   = DIA_NASZ_110_Keroloth_done_Condition;
 	information = DIA_NASZ_110_Keroloth_done_Info;
 	permanent   = FALSE;
	description = "Niebezpiecze�stwo zosta�o za�egnane.";
};

FUNC INT DIA_NASZ_110_Keroloth_done_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_duchy)
		&& npc_isdead (Skeleton_Lord_Garrel))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_done_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_done_15_00"); //Niebezpiecze�stwo zosta�o za�egnane.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_done_55_01"); //To �wietnie! Sk�d bra�y si� szkielety?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_done_15_02"); //Na bagnach na p�nocny wsch�d st�d znajdowa�o si� pot�ne le�e o�ywie�c�w. Zabi�em ich przyw�dc�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_done_55_03"); //Bardzo dobrze. My�l�, �e to za�egna nasze obawy. Oto obiecany kawa�ek artefaktu.

	Createinvitems (self, ItNa_Artefakt_Odpornosc, 1);
	B_giveinvitems (self, other, ItNa_Artefakt_Odpornosc, 1);
	B_LogEntry (TOPIC_Keroloth_duchy, "Sprawa za�atwiona. Keroloth da� mi kawa�ek pier�cienia.");
	Log_SetTopicStatus (TOPIC_Keroloth_duchy, LOG_SUCCESS);
	B_LogEntry (TOPIC_Niedostepny_Klif, "W ko�cu mam kawa�ek artefaktu z krypty obok chaty Cavalorna.");
	DodajReputacje (3, REP_LOWCY);
	B_GivePlayerXP (500);
};


//*********************************************************************
//	Info Bam
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_InfoBam   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 29;
 	condition   = DIA_NASZ_110_Keroloth_InfoBam_Condition;
 	information = DIA_NASZ_110_Keroloth_InfoBam_Info;
 	permanent   = FALSE;
	description = "Jeden z bandyt�w chce wiedzie�, co z kopalni�.";
};

FUNC INT DIA_NASZ_110_Keroloth_InfoBam_Condition()	
{
	if (hero.guild == GIL_DJG)
	&& (npc_knowsinfo (other, DIA_NASZ_304_Bam_quest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_InfoBam_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoBam_15_00"); //Jeden z bandyt�w chce wiedzie�, co z kopalni�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoBam_55_01"); //Wiedzia�em, �e w ko�cu pojawi� si� k�opoty. O co dok�adnie chodzi? Skapowali si�, �e odci�li�my dop�yw rudy?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoBam_15_02"); //Ot� to. Szefostwo si� niecierpliwi, a ja nie chc�, by odkryli, �e rozbili�my paladyn�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoBam_55_03"); //Widz� dwa wyj�cia z sytuacji: Albo dostarczysz im ze dwadzie�cia bry�ek rudy jako dostaw�, albo poka�emy, �e kopalnia nadal funkcjonuje.

	B_LogEntry (TOPIC_Bam_kopalnia, "Jednym z pomys��w Kerolotha jest oddanie 20 bry�ek rudy bandytom.");
};

//*********************************************************************
//	Info BamGestath
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_InfoBamGestath   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 29;
 	condition   = DIA_NASZ_110_Keroloth_InfoBamGestath_Condition;
 	information = DIA_NASZ_110_Keroloth_InfoBamGestath_Info;
 	permanent   = FALSE;
	description = "Jak mog� oszuka� bandyt�w w kwestii rudy?";
};

FUNC INT DIA_NASZ_110_Keroloth_InfoBamGestath_Condition()	
{
	if (hero.guild == GIL_OUT)
	&& (npc_knowsinfo (other, DIA_NASZ_213_Gestath_BamInfo))
	&& !(npc_knowsinfo (other, DIA_NASZ_304_Bam_QuestDoneNugget))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_InfoBamGestath_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoBamGestath_15_00"); //Jak mog� oszuka� bandyt�w w kwestii rudy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoBamGestath_55_01"); //Dlaczego chcesz ich oszuka�?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoBamGestath_15_02"); //Powiedzmy, �e musz� dowie��, �e wykopaliska wci�� trwaj�, a nie widz� sensu w dostarczaniu im rudy ze swej kieszeni.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoBamGestath_55_03"); //To mo�e poka�emy im, �e kopalnia nadal funkcjonuje? My�la�e� nad tym?

};

//*********************************************************************
//	Info BamLieHow
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_BamLieHow   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 29;
 	condition   = DIA_NASZ_110_Keroloth_BamLieHow_Condition;
 	information = DIA_NASZ_110_Keroloth_BamLieHow_Info;
 	permanent   = FALSE;
	description = "Jaki masz pomys�?";
};

FUNC INT DIA_NASZ_110_Keroloth_BamLieHow_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_InfoBamGestath)
	 || npc_knowsinfo (other, DIA_NASZ_110_Keroloth_InfoBam))
	&& !(npc_knowsinfo (other, DIA_NASZ_304_Bam_QuestDoneNugget))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_BamLieHow_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_BamLieHow_15_00"); //Jaki masz pomys�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieHow_55_01"); //Jest tu jeszcze par� zbroi rycerskich, wi�c mo�emy wys�a� kilku ludzi do kopalni, kt�rzy b�d� udawa� renegat�w. Razem z nimi p�jd� te� kopacze.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieHow_55_02"); //Ty przyprowadzisz tego niedowiarka do kopalni, a on zobaczy, �e wszystko jest w jak najlepszym porz�dku.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieHow_55_03"); //Jedynym problemem mo�e by� to, �e ten cz�owiek wie, jak wygl�da Marcos... 
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_BamLieHow_15_04"); //Nie powinno by� z tym k�opotu. Bam powiedzia�, �e nie zajmuje si� rud�, bo od tego s� inni bandyci. Wnioskuj�, �e nie zna� Marcosa.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieHow_55_05"); //W takim razie mo�e warto spr�bowa�, co?
};

//*********************************************************************
//	Info BamLieStart
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_BamLieStart   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 29;
 	condition   = DIA_NASZ_110_Keroloth_BamLieStart_Condition;
 	information = DIA_NASZ_110_Keroloth_BamLieStart_Info;
 	permanent   = FALSE;
	description = "Dobra, wi�c to upozorujmy!";
};

FUNC INT DIA_NASZ_110_Keroloth_BamLieStart_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_BamLieHow))
	&& !(npc_knowsinfo (other, DIA_NASZ_304_Bam_QuestDoneNugget))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_BamLieStart_Info()
{
	B_GivePlayerXP(100);

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_BamLieStart_15_00"); //Dobra, wi�c to upozorujmy!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieStart_55_01"); //Przyprowad� bandyt� do kopalni. Gdy tam przyjdzie, wszyscy b�d� na miejscu.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieStart_55_02"); //Tylko nie zwlekaj zbyt d�ugo, bo po co kopacze maj� zn�w siedzie� w tej ciemnej jaskini i udawa�, �e pracuj�?

	B_LogEntry (TOPIC_Bam_kopalnia, "Po d�u�szym namy�le, doszli�my do wniosku, �e lepiej b�dzie upozorowa� prac� w kopalni. Keroloth ma jeszcze par� zbroi rycerskich i da je kilku �owcom, aby udawali renegat�w. Do kopalni udadz� si� te� kopacze. Ja musz� przyprowadzi� do kopalni Bama.");
};


var int MieczRunicznyKerolothOk;
//*********************************************************************
//	Info MieczRuniczny
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_MieczRuniczny   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 29;
 	condition   = DIA_NASZ_110_Keroloth_MieczRuniczny_Condition;
 	information = DIA_NASZ_110_Keroloth_MieczRuniczny_Info;
 	permanent   = FALSE;
	description = "Widzia�e� kiedy� taki miecz?";
};

FUNC INT DIA_NASZ_110_Keroloth_MieczRuniczny_Condition()	
{
	if (npc_hasitems (other, ItNa_MieczRuniczny) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MieczRuniczny_Info()
{
	Createinvitems (self, ItNa_MieczRunicznyKeroloth, 1);
	Npc_RemoveInvItems (self, ItNa_DJG_Weapon_H, 1);
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_00"); //Widzia�e� kiedy� taki miecz?
	//AI_UnequipWeapons         (self);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_55_01"); //Poka�.
	B_giveinvitems (other, self, ItNa_MieczRuniczny, 1);
	
	//AI_EquipBestMeleeWeapon	(self);
	
	//EquipItem (self,ItNa_MieczRunicznyKeroloth);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni		(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	
	//AI_EquipBestMeleeWeapon	(self);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_02"); //Sk�d to masz?
	
	if (npc_knowsinfo(other,DIA_NASZ_110_Keroloth_duchy)) {
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_55_03"); //Znalaz�em na bagnach. Wydaje mi si�, �e nale�a�o do Pana Cienia, kt�rego pokona�em.
	} else {
		// numerek 10, bo dodane p�niej
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_55_10"); //Szw�da�em sie po bagnach i zwin��em grupce o�ywie�c�w.
	};
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_04"); //Ciekawe... Wyczuwam w nim ukryt� energi�. Jest tu ma�y kryszta�, kt�ry powinien pulsowa�...
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_05"); //Mo�esz dowiedzie� si� czego� wi�cej o tym mieczu?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_06"); //Oczywi�cie. Mam gdzie� kilka ksi�g dotycz�cych walki mieczem. Przejrz� swoje zbiory. Kojarzy mi si�, �e jest gdzie� rozdzia� o mieczach magicznych.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_07"); //Du�o mieczy wykutych z magicznej rudy ma specjalne w�a�ciwo�ci, ale to wygl�da na co� o wi�kszej mocy.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_08"); //C�, jak tylko dowiem si� czego� wi�cej, to od razu dam ci zna�.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_09"); //Trzymam ci� za s�owo. Je�li to rzeczywi�cie pot�na bro�, to mo�e przyda� si� do walki z orkami.

	MieczRunicznyKerolothOk = TRUE;
	mieczrunicznykeroloth_onetime = TRUE;
	
	B_LogEntry (TOPIC_MieczRuniczny, "Keroloth przyjrzy si� temu mieczowi.");
};

var int MieczRunicznyRunaPls;
//*********************************************************************
//	Info KapThree
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_KapThree   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 31;
 	condition   = DIA_NASZ_110_Keroloth_KapThree_Condition;
 	information = DIA_NASZ_110_Keroloth_KapThree_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_KapThree_Condition()
{
	if (Kapitel == 3 && npc_hasitems(other,ItNa_OkoSwiata) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_KapThree_Info()
{
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_00"); //Dobrze, �e jeste�. Wybacz za ten ca�y harmider w obozie, ale jak ju� si� zapewne domy�lasz, wiele si� tutaj zmieni�o, odk�d odwiedzi�e� nas po raz ostatni.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_01"); //Zanim przejd� do konkret�w, to chcia�bym ci pogratulowa�: Doskonale poradzi�e� sobie z tymi bandytami.
	
	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_02"); //Nale�y ci si� lepsza zbroja. Skuteczniej ochroni ci� przed orkowym �elastwem. A je�li chcesz jeszcze twardsz�, to udaj si� do Engora.
		Createinvitems (self, ITNA_DJG_H, 1);
		B_Giveinvitems (self, other, ITNA_DJG_H, 1);
		AI_EquipBestArmor (other);
	};
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_03"); //Spoczynek musisz jednak od�o�y� na p�niej, gdy� zn�w czeka ci� du�o roboty.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_04"); //Dowiedzia�e� si� mo�e, czego szukali bandyci w przej�tej przez ork�w G�rniczej Dolinie?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KapThree_15_05"); //G��wnym powodem ich przybycia by�o wydobycie rudy, by sprzedawa� j� kr�lowi. Ich szef natrafi� na trop pot�nego artefaktu, Oka �wiata.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KapThree_15_06"); //Odnalaz�em go i mam przy sobie.
	B_giveinvitems (other, self, ItNa_OkoSwiata, 1);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_07"); //Oddaj mi go. W r�kach paladyna sprawdzi si� lepiej, ni� w twoich. Znam si� lepiej na magicznych przedmiotach i jestem pewien, �e zdo�am w pe�ni wykorzysta� drzemi�c� w nim moc.

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_08"); //Tym bardziej, �e nasta�a ta chwila, na kt�r� wszyscy czekali�my. Chcemy odbi� nasz zamek z r�k ork�w.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KapThree_55_09"); //Jeste�cie tego pewni? W zamku jest ca�a horda, a nas zaledwie garstka. Jak mamy ich pokona�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_10"); //Masz racj�, w otwartej walce nie mamy z nimi szans. Jednak nikt nie powiedzia�, �e chcemy na nich wybiec z obozu. Dlatego obmy�li�em plan z Udarem i Kurganem.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_11"); //Aby da� nam wi�ksz� przewag� w walce, potrzebujemy dobrej kryj�wki, gdzie b�dziemy mogli w ukryciu przygotowa� si� do wypad�w na ork�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_12"); //Niestety nikt z nas nie wie, jakie miejsce mo�e si� do tego nada�. Je�li znajdziesz odpowiednie miejsce, to od razu mnie zawiadom.
	
	if (MieczRunicznyKerolothOk == TRUE) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_13"); //W sprawie miecza, kt�remu mia�em si� przyjrze�...
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_14"); //Znalaz�em wpis o tym ostrzu. To legendarny miecz runiczny.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_15"); //Przynie� mi jedn� z run: ma�a burza ognista, bry�a lodu, pi�� wichru. My�l�, �e zdo�am przywr�ci� mieczowi jego odpowiednie w�a�ciwo�ci.

		MieczRunicznyRunaPls = TRUE;
		B_LogEntry (TOPIC_MieczRuniczny, "Jak si� okaza�o, znalaz�em legendarny miecz runiczny. Keroloth przywr�ci mu jego dawn� moc, je�li przynios� mu jedn� z run: ma�a burza ognista, bry�a lodu, pi�� wichru.");

	};

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Keroloth szykuje si� do wojny z orkami. Wygl�da na to, �e b�d� jego ch�opcem do 'zada� specjalnych'.");

	Log_CreateTopic (TOPIC_Keroloth_Wojna, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_Wojna, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_Wojna, "Keroloth planuje odbi� zamek z r�k ork�w. Zabra� mi Oko �wiata, bo twierdzi, �e lepiej ode mnie je wykorzysta.");
	B_LogEntry (TOPIC_Keroloth_Wojna, "Musz� znale�� miejsce w pobli�u zamku, w kt�rym mogliby stacjonowa� �owcy ork�w.");
};

var int ProwadziszKerolothaDoTwierdzy;
//*********************************************************************
//	Info Znam
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_znam   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 32;
 	condition   = DIA_NASZ_110_Keroloth_znam_Condition;
 	information = DIA_NASZ_110_Keroloth_znam_Info;
 	permanent   = FALSE;
	description = "My�l�, �e znam jedno takie miejsce.";
};

FUNC INT DIA_NASZ_110_Keroloth_znam_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_KapThree)
		&& (WillKnowAboutTwierdza == TRUE))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_znam_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_znam_15_00"); //My�l�, �e znam jedno takie miejsce.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_znam_15_01"); //Bandyci handlowali z paladynami, kt�rzy zajmowali miejsce nazywane przez nich twierdz�. Nie jest to zbyt du�e miejsce, ale znajduje si� w g�rach i ci�ko jest je znale��, je�eli nie wie si�, gdzie go szuka�.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_znam_15_02"); //Za czas�w Kolonii Karnej razem z innymi my�liwymi nazywali�my je 'Kanionem Trolli'.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_znam_55_03"); //Kanion Trolli? Chyba widzia�em na kt�rej� mapie tak� nazw�. Wiem, gdzie to jest, ale nie spodziewa�em si�, �e kto� tam co� zbudowa�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_znam_15_04"); //Chod�, p�jdziemy tam razem i obejrzymy dok�adniej to miejsce.

	B_GivePlayerXP (300);
	
	ProwadziszKerolothaDoTwierdzy = TRUE;

	Npc_ExchangeRoutine (self, "TwierdzaFollow"); // zmienione na GuidePlayer!
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_110_Keroloth,1);
	AI_StopProcessInfos (self);
};



//*********************************************************************
//	Info Before
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_Before   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 34;
 	condition   = DIA_NASZ_110_Keroloth_Before_Condition;
 	information = DIA_NASZ_110_Keroloth_Before_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_Before_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_znam)
		&& (Npc_GetDistToWP	(NASZ_110_Keroloth, "OW_PATH_186") <=1500))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_Before_Info()
{
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Before_55_00"); //Faktycznie, nie jest to zbyt du�e miejsce i nie wygl�da tak�e najlepiej. Trzeba je b�dzie nieco umocni� nim wydamy otwart� wojn� orkom.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Before_55_01"); //Ja zostan� tutaj i zapoznam si� lepiej z tym miejscem. Ty natomiast udaj si� do obozu i zabierz kilka narz�dzi. My�l�, �e pi�� pi�, sze�� m�otk�w i cztery kilofy wystarcz�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Before_15_02"); //Rozejrzyj si� za nimi w magazynie. To ta buda obok wej�cia do obozu. Oto klucz.

	// Udar szefostwo
	B_StartOtherRoutine (NASZ_119_Udar,"Kap4");
	
	Createinvitems (self, ItNa_Key_Keroloth, 1);
	B_giveinvitems (self, other, ItNa_Key_Keroloth, 1);
	
	ProwadziszKerolothaDoTwierdzy = FALSE;
	B_GivePlayerXP(100);
	
	Log_CreateTopic (TOPIC_Keroloth_narzedzia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_narzedzia, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_narzedzia, "Twierdza faktycznie jest w op�akanym stanie i w obecnej postaci nie wytrzyma�aby jednego szturmu ork�w. Mam wi�c uda� si� do obozu �owc�w Ork�w i poza poinformowaniem reszty w obozie o wymarszu, zabra� stamt�d tak�e pi�� pi�, sze�� m�otk�w i cztery kilofy.");

	B_LogEntry (TOPIC_Keroloth_Wojna, "Keroloth dotar� do twierdzy. Ale to dopiero pocz�tek wojny... Musz� koniecznie za�atwi� narz�dzia, aby wzmocni� zabezpieczenia.");

	Npc_ExchangeRoutine (self, "TwierdzaIn");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_110_Keroloth,0);
};

//*********************************************************************
//	Info WhatNow
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_WhatNow   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 35;
 	condition   = DIA_NASZ_110_Keroloth_WhatNow_Condition;
 	information = DIA_NASZ_110_Keroloth_WhatNow_Info;
 	permanent   = FALSE;
	description = "Jaki b�dzie nasz nast�pny ruch?";
};

FUNC INT DIA_NASZ_110_Keroloth_WhatNow_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_Before))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_WhatNow_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_WhatNow_15_00"); //Jaki b�dzie nasz nast�pny ruch?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_55_01"); //Jak wiesz, sami nie damy sobie rady, dlatego nieoceniona by�aby dla nas pomoc my�liwych. M�g�by� zanie�� Gestathowi ten list?

	Createinvitems (self, ItNa_List_Keroloth, 1);
	B_giveinvitems (self, other, ItNa_List_Keroloth, 1);

	if (hero.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_15_03"); //Z racji tego, �e jeste� jednym z nich, powiniene� z nimi zosta� i pom�c im w przygotowaniach.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_15_04"); //My damy sobie tutaj rad�. Jak ju� b�dziecie gotowi, to wr�� do mnie i zdaj mi raport.

		B_LogEntry (TOPIC_Keroloth_Wojna, "Konieczne b�dzie te� przygotowanie do wojny obozu. Musz� pom�c Udarowi.");
	}
	else { 
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_15_05"); //Kiedy ju� z nimi porozmawiasz, wr�� do mnie. Na pewno znajdzie si� dla ciebie co� do roboty.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_15_06"); //Tylko nie tra� du�o czasu, bo ten jest na wag� z�ota!
	};

	Log_CreateTopic (TOPIC_Keroloth_pomoc, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_pomoc, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_pomoc, "Keroloth potrzebuje wsparcia �ucznik�w do walki z orkami. Musz� dostarczy� list z pro�b� o to Gestathowi.");

};

//*********************************************************************
//	Info DuzoLowcow
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_DuzoLowcow   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 36;
 	condition   = DIA_NASZ_110_Keroloth_DuzoLowcow_Condition;
 	information = DIA_NASZ_110_Keroloth_DuzoLowcow_Info;
 	permanent   = FALSE;
	description = "Widz�, �e zebra�e� swoich ch�opc�w.";
};

FUNC INT DIA_NASZ_110_Keroloth_DuzoLowcow_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_DuzoLowcow_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_DuzoLowcow_15_00"); //Widz�, �e zebra�e� swoich ch�opc�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_DuzoLowcow_55_01"); //�ucznicy to jedno, ale do walki wr�cz te� kogo� potrzebuj�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_DuzoLowcow_15_02"); //Wzi��em swoich najlepszych wojownik�w. Zostawi�em kilku stra�nik�w w obozie, �eby kto� go czasem nie stratowa� podczas mojej nieobecno�ci.
};

//*********************************************************************
//	Info HelpIsReady
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_HelpIsReady   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 37;
 	condition   = DIA_NASZ_110_Keroloth_HelpIsReady_Condition;
 	information = DIA_NASZ_110_Keroloth_HelpIsReady_Info;
 	permanent   = FALSE;
	description = "Poinformowa�em my�liwych o ca�ej zaistnia�ej sytuacji.";
};

FUNC INT DIA_NASZ_110_Keroloth_HelpIsReady_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_213_Gestath_keroloth))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_HelpIsReady_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_HelpIsReady_15_00"); //Poinformowa�em my�liwych o ca�ej zaistnia�ej sytuacji.
	
	if (hero.guild == GIL_DJG) {
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_HelpIsReady_15_01"); //Gestath wraz ze swoimi lud�mi ju� rozpocz�� przygotowania do ataku, nie powinno im to d�ugo zaj��.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_02"); //Nie spodziewa�em si� innej odpowiedzi, dobra robota.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_03"); //Teraz kiedy mamy pewno��, i� my�liwi i zwiadowcy stan� u naszego boku, mo�emy przyst�pi� do w�a�ciwych dzia�a�.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_04"); //Willu, chc� aby� uda� si� do naszego obozu i porozmawia� z Udarem. Przydzieli�em mu ju� zadania, lecz zapewne przyda si� pomoc kogo� tak bystrego jak ty.
		
		B_LogEntry(TOPIC_Keroloth_Wojna,"Trzeba za�atwi� kilka spraw w obozie. Musz� uda� si� do Udara i pom�c mu.");
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_05"); //�wietnie. Wr�� do mnie, gdy ju� uporacie si� ze swoimi sprawami.
	};

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_HelpIsReady_55_06"); //Oczywi�cie, ruszam w dalsz� drog�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_07"); //Zaczekaj, we� t� run�. Przeniesie ci� prosto do tej chatki.
	Createinvitems (self, ItNa_TeleportTwierdza, 1);
	B_giveinvitems (self, other, ItNa_TeleportTwierdza, 1);
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_HelpIsReady_15_08"); //Potrafisz sporz�dza� runy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_09"); //Przebywaj�c z paladynami nauczy�em si� tego i owego...

};

//*********************************************************************
//	Info CampWeAreRdy
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_CampWeAreRdy   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 37;
 	condition   = DIA_NASZ_110_Keroloth_CampWeAreRdy_Condition;
 	information = DIA_NASZ_110_Keroloth_CampWeAreRdy_Info;
 	permanent   = FALSE;
	description = "Uporali�my si� ze sprawami w obozie.";
};

FUNC INT DIA_NASZ_110_Keroloth_CampWeAreRdy_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_HelpIsReady))
	&& ((npc_knowsinfo (other, DIA_NASZ_119_Udar_AllIsReady))
	 || (npc_knowsinfo (other, DIA_NASZ_213_Gestath_AllIsReady)))
	 
	&& (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_MlotyPily)) // skonczone zadanie z wyposazeniem do twierdzy
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_CampWeAreRdy_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_CampWeAreRdy_15_00"); //Uporali�my si� ze sprawami w obozie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_CampWeAreRdy_15_01"); //Wojna coraz bli�ej!
	
};




//*********************************************************************
//	Info MainForces
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_MainForces   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 37;
 	condition   = DIA_NASZ_110_Keroloth_MainForces_Condition;
 	information = DIA_NASZ_110_Keroloth_MainForces_Info;
 	permanent   = FALSE;
	description = "G��wne si�y my�liwych s� w twierdzy.";
};

FUNC INT DIA_NASZ_110_Keroloth_MainForces_Condition()	
{
	if ((KerolothMysliwi >= 8)
	 && npc_knowsinfo(other,DIA_NASZ_110_Keroloth_CampWeAreRdy))
	|| (Cheat_Keroloth_MainForces == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MainForces_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MainForces_15_00"); //G��wne si�y my�liwych s� w twierdzy.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_01"); //Dobra robota. Gdyby nie ty, pewnie to wszystko trwa�oby du�o d�u�ej. Przyjmij te dwie sakiewki, jako dow�d mojej wdzi�czno�ci.
	
	Createinvitems (self, ItSe_GoldPocket100, 2);
	B_giveinvitems (self, other, ItSe_GoldPocket100, 2);

	Log_SetTopicStatus (TOPIC_Keroloth_pomoc, LOG_SUCCESS);
	B_LogEntry (TOPIC_Keroloth_pomoc, "Wszyscy my�liwi s� ju� na miejscu. Zabawa dopiero si� zaczyna...");

	B_GivePlayerXP(700);
	DodajReputacje(2,REP_LOWCY);
	
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MainForces_15_02"); //Mam troch� wolnego?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_03"); //W �adnym wypadku. Poprowadzisz pierwszy oddzia� uderzeniowy.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MainForces_15_04"); //�e co?!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_05"); //To, co s�yszysz. Nie panikuj. We� sobie gladiator�w. Im wr�cz pali si� do wybijania ork�w.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MainForces_15_06"); //Nie p�jd� na pewn� �mier�...
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_07"); //To zr�b tak, by� nie zgin��.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_08"); //Id� ju�. Marnujesz czas, a orkowie mog� w ka�dej chwili uderzy�.

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Czas na ofensyw�. Wyruszam na zamek. Mo�e uda si� przy tym nie zgin��?");

	B_LogEntry (TOPIC_Keroloth_Wojna, "Keroloth postrada� zmys�y. Mam wzi�� gladiator�w i uderzy� na zamek.");
	
	
};




//*********************************************************************
//	Info SzturmOrkow
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_SzturmOrkow   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 38;
 	condition   = DIA_NASZ_110_Keroloth_SzturmOrkow_Condition;
 	information = DIA_NASZ_110_Keroloth_SzturmOrkow_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_SzturmOrkow_Condition()	
{
	if (WillGoToUrshackFinal == TRUE)
	|| (Cheat_Keroloth_TwierdzaAtak == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_SzturmOrkow_Info()
{
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_00"); //Jeste� wreszcie!
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_55_01"); //Na Beliara! Co tu si� dzieje?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_02"); //Orkowie kontratakowali. Kurgan doni�s�, �e wyruszy�e� zg�adzi� jakiego� wielkiego orkowego wodza.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_03"); //Tak, pos�a�em Ur-Shaka do piachu.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_04"); //Jak wygl�da sytuacja tutaj?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_05"); //Kiepsko. Nie byli�my w og�le przygotowani na atak. Prawdopodobnie ci orkowie przyszli tutaj z prze��czy. Stracili�my kilku ludzi... W tym Gestatha.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_06"); //CO?! Gestath nie �yje?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_07"); //Podczas pierwszego szturmu na twierdz�, grot orkowego be�tu trafi� prosto w jego szyj�. Zamkn�li�my bram� i pr�bujemy przygotowa� si� do kontrataku.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_08"); //Nie, tak by� nie mo�e. Niebawem mo�e tu nadci�gn�� wi�cej ork�w. Id� otworzy� bram�. Stawmy czo�a tym bestiom.

	B_LogEntry (TOPIC_Keroloth_Wojna, "Podczas mojej nieobecno�ci, orkowie uderzyli na twierdz�. Poleg� Gestath... Musimy stawi� im czo�a. Czas otworzy� bram� i stan�� oko w oko z przeznaczeniem.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Orkowie kontratakowali. Szturmuj� nadal twierdz�. Musz� otworzy� bram�, rozprawi� si� z nimi i uderzy� na zamek, dzier��c w r�ku kostur Ur-Shaka.");

	Info_ClearChoices (DIA_NASZ_110_Keroloth_SzturmOrkow);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_SzturmOrkow, "Do dzie�a!", DIA_NASZ_110_Keroloth_SzturmOrkow_what);

};

FUNC VOID DIA_NASZ_110_Keroloth_SzturmOrkow_what()
{

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_SzturmOrkow_what_15_00"); //Do dzie�a!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_what_55_01"); //P�jd� za tob�.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "TwierdzaWalkaPre");
	TwierdzaAtakReady = TRUE;
};

func int bAllTwierdzaOrcsAreDead() {

	if (npc_isdead (OrcScout_TwierdzaA))
	&& (npc_isdead (OrcScout_TwierdzaB))
	&& (npc_isdead (OrcElite_TwierdzaA))
	&& (npc_isdead (OrcElite_TwierdzaB))
	&& (npc_isdead (OrcElite_TwierdzaC))
	&& (npc_isdead (OrcWarrior_TwierdzaA))
	&& (npc_isdead (OrcWarrior_TwierdzaB))
	&& (npc_isdead (OrcWarrior_TwierdzaC))
	&& (npc_isdead (OrcWarrior_TwierdzaD))
	&& (npc_isdead (OrcWarrior_TwierdzaE))
	&& (npc_isdead (OrcWarrior_TwierdzaF))
	&& (npc_isdead (OrcWarrior_TwierdzaG))
	&& (npc_isdead (OrcWarrior_TwierdzaH))
	&& (npc_isdead (OrcWarrior_TwierdzaI))
	{
		return TRUE;
	};

	return FALSE;

};

//*********************************************************************
//	Info AfterSzturmOrkow
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_AfterSzturmOrkow   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 39;
 	condition   = DIA_NASZ_110_Keroloth_AfterSzturmOrkow_Condition;
 	information = DIA_NASZ_110_Keroloth_AfterSzturmOrkow_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_AfterSzturmOrkow_Condition()	
{
	if (WillUsedWheelTwierdza == TRUE)
	&& (bAllTwierdzaOrcsAreDead())
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_AfterSzturmOrkow_Info()
{
	B_GivePlayerXP(300);
	DodajReputacje(1,REP_LOWCY);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_15_00"); //Pom�cili�my Gestatha.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_55_01"); //Nie by�o ich a� tak du�o. Musimy p�j�� za ciosem i uderzy� na zamek.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_15_02"); //Jak� masz pewno��, �e orkowie nie zamkn� si� za kratami zamku?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_15_03"); //Zabi�em jednego z ich przyw�dc�w, Ur-Shaka. Poka�� im jego kostur. Na pewno si� tym przejm� i b�d� chcieli go pom�ci�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_15_04"); //W takim razie zabieramy wszystkich zdolnych do walki i uderzamy. Oby Innos nad nami czuwa�.

	Migration_FollowZamek();
	
	
	NASZ_319_Niewolnik.guild = GIL_SLD;
	NASZ_320_Niewolnik.guild = GIL_SLD;
	NASZ_321_Niewolnik.guild = GIL_SLD;
	NASZ_325_Grimes.guild = GIL_SLD;		
	NASZ_216_Aran.guild = GIL_OUT;
	NASZ_116_Kjorn.guild = GIL_DJG;
	NASZ_117_Fed.guild = GIL_DJG;
	NASZ_118_Ferros.guild = GIL_DJG;
	NASZ_112_Peter.guild = GIL_DJG;
	NASZ_101_Korth.guild = GIL_DJG;		
	NASZ_103_Johny.guild = GIL_DJG;
			
	Npc_SetTrueGuild (NASZ_319_Niewolnik, GIL_SLD);
	Npc_SetTrueGuild (NASZ_320_Niewolnik, GIL_SLD);
	Npc_SetTrueGuild (NASZ_321_Niewolnik, GIL_SLD);
	Npc_SetTrueGuild (NASZ_325_Grimes, GIL_SLD);
	Npc_SetTrueGuild (NASZ_216_Aran, GIL_OUT);
	Npc_SetTrueGuild (NASZ_116_Kjorn, GIL_DJG);
	Npc_SetTrueGuild (NASZ_117_Fed, GIL_DJG);
	Npc_SetTrueGuild (NASZ_118_Ferros, GIL_DJG);
	Npc_SetTrueGuild (NASZ_112_Peter, GIL_DJG);
	Npc_SetTrueGuild (NASZ_101_Korth, GIL_DJG);
	Npc_SetTrueGuild (NASZ_103_Johny, GIL_DJG);
	
	WillGoToCastle = TRUE;
	//ff_applyonceext(DrugiAtak,1000,-1);
	B_LogEntry (TOPIC_Keroloth_Wojna, "Obronili�my twierdz�. Teraz wyruszamy razem z Kerolothem zdoby� zamek. �eby orkowie nie zamkn�li si� za kratami, za�o�� kostur Ur-Shaka.");
};

//*********************************************************************
//	Info MlotyPily
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_MlotyPily   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 40;
 	condition   = DIA_NASZ_110_Keroloth_MlotyPily_Condition;
 	information = DIA_NASZ_110_Keroloth_MlotyPily_Info;
 	permanent   = FALSE;
	description = "Przynios�em narz�dzia, o kt�re prosi�e�.";
};

FUNC INT DIA_NASZ_110_Keroloth_MlotyPily_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_Before))
		&& (npc_hasitems (other, ItMi_Hammer) >=6)	
		&& (npc_hasitems (other, ItMi_Saw) >=5)
		&& (npc_hasitems (other, ItMw_2H_Axe_L_01) >=4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MlotyPily_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MlotyPily_15_00"); //Przynios�em narz�dzia, o kt�re prosi�e�.
	
	B_giveinvitems (other, self, ItMi_Hammer, 6);
	B_giveinvitems (other, self, ItMi_Saw, 5);
	B_giveinvitems (other, self, ItMw_2H_Axe_L_01, 4);
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MlotyPily_55_01"); //Doskonale! Nasi ch�opcy nie b�d� mogli narzeka� na brak wra�e�. To twoja nagroda, przyda ci si�.

	Createinvitems (self, ItMi_Gold, 80);
	B_giveinvitems (self, other, ItMi_Gold, 80);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MlotyPily_55_02"); //Teraz kiedy mamy ju� wyposa�enie, mo�emy w ko�cu pomy�le� o odpowiednich przygotowaniach do samej walki.

	
	B_LogEntry (TOPIC_Keroloth_narzedzia, "Narz�dzia dostarczone.");
	Log_SetTopicStatus (TOPIC_Keroloth_narzedzia, LOG_SUCCESS);

	B_GivePlayerXP (500);
	DodajReputacje (1, REP_LOWCY);
};

//*********************************************************************
//	Info PreKap4
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_PreKap4   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 41;
 	condition   = DIA_NASZ_110_Keroloth_PreKap4_Condition;
 	information = DIA_NASZ_110_Keroloth_PreKap4_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_PreKap4_Condition()	
{
	if (WillUsedWheelTwierdza == TRUE)
	&& npc_isdead (OrcShamanHerszt)
	&& npc_isdead (OrcScoutHerszt)
	&& npc_isdead (OrcEliteHerszt)	
	{
		return TRUE;
	};
};

func void PreKap()
{
	//print("PREKAP4");
	pre = 1;
	ff_applyonce(BlackScreen);

};

FUNC VOID DIA_NASZ_110_Keroloth_PreKap4_Info()
{
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_PreKap4_15_00"); //Trzech dow�dc�w pokonanych. Zamek jest nasz!
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_PreKap4_55_01"); //Sk�d pewno��, �e orkowie tu nie wr�c�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_PreKap4_15_02"); //Wycofaj� si� na prze��cz...

	Wld_SendTrigger ("MOVER_OGIEN_ZAMEK_1");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_110_Keroloth,0);
	
	B_GivePlayerXP(1000);
	DodajReputacje(2,REP_LOWCY);

	
	//WillGoToCastle = FALSE;
	RemoveHookF(oCNpc__ProcessNpc,6,UratujFunc);

	//AI_StopProcessInfos (self);
	
	// TODO ten if zwraca FALSE !! czemu? kiedy powinna zwrocic true?
	if(InfoManager_HasFinished())
	{
		PreKap();
	};

	Info_ClearChoices (DIA_NASZ_110_Keroloth_PreKap4);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_PreKap4, DIALOG_ENDE, DIA_NASZ_110_Keroloth_PreKap4_end);

	
};

func void PreKapFF()
{
	if(InfoManager_HasFinished())
	{
		PreKap();
		ff_Remove(PreKapFF);
	};
};

func void DIA_NASZ_110_Keroloth_PreKap4_end() {
	AI_StopProcessInfos(self);
	ff_applyonce(PreKapFF);
};

/* ----- ----- -----
	Done, lecz zostawi� ten komentarz na razie:
	zamiast tego zagadywania 'FilmKap4' niech w 'DIA_NASZ_110_Keroloth_PreKap4'
	jest clearchoice: "KONIEC" ktory uruchamia sciemnianie sie takie jak np Kopalnia_Trucizna
	-> jak jest ca�kiem ciemno, to wykonuje sie:

	B_StartOtherRoutine (NASZ_110_Keroloth,"Zamek");
	PlayVideo ("G2UCIECZKAAFTERKAP3.BIK");
	// bez tego, bo to stare: Wld_PlayEffect("SCIEMNIANIE",  hero, hero, 0, 0, 0, FALSE);
	AI_Teleport	(hero, "OC_CENTER_04");
	AI_Teleport	(NASZ_110_Keroloth, "OC_CENTER_04");
	Npc_ClearAIQueue (hero);

	potem rozja�nienie. jak si� rozja�ni to:
	Npc_ClearAIQueue (hero);
	
	i zagaduje nas keroloth dialogiem: DIA_NASZ_110_Keroloth_Kap4

*/
	

//*********************************************************************
//	Info FilmKap4
//*********************************************************************
/*INSTANCE DIA_NASZ_110_Keroloth_FilmKap4   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 42;
 	condition   = DIA_NASZ_110_Keroloth_FilmKap4_Condition;
 	information = DIA_NASZ_110_Keroloth_FilmKap4_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_FilmKap4_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_PreKap4) && pre == 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_FilmKap4_Info()
{
/*	B_StartOtherRoutine (self,"Zamek");
	PlayVideo ("G2UCIECZKAAFTERKAP3.BIK");
	AI_Teleport (NASZ_110_Keroloth, "OC_EBR_ENTRANCE");
	//AI_Teleport (hero, "OC_EBR_ENTRANCE");
	AI_GotoWP(NASZ_110_Keroloth, "OC_CENTER_04");
	AI_GotoWP(hero, "OC_CENTER_04");*/
/*	
	B_StartOtherRoutine (self,"Zamek");
	PlayVideo ("G2UCIECZKAAFTERKAP3.BIK");
	Wld_PlayEffect("SCIEMNIANIE",  hero, hero, 0, 0, 0, FALSE);
	AI_Teleport	(hero, "OC_CENTER_04");
	AI_Teleport	(self, "OC_CENTER_04");
	Npc_ClearAIQueue (hero);
	
	
	AI_StopProcessInfos (self);
};*/

//*********************************************************************
//	Info Kap4
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_Kap4   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 43;
 	condition   = DIA_NASZ_110_Keroloth_Kap4_Condition;
 	information = DIA_NASZ_110_Keroloth_Kap4_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_Kap4_Condition()	
{
	if (pre == 2)
	|| (Cheat_SkipToKap4 == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_Kap4_Info()
{

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_15_00"); //Na Innosa! Widzisz ten ogie�?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Kap4_55_01"); //Zapewne lada moment b�dziemy mieli towarzystwo.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_15_02"); //Teraz, kiedy uda�o nam si� ju� opanowa� zamek, powinni�my zaj�� si� dalszymi przygotowaniami maj�cymi na celu wzmocni� nasz� pozycj� w tym miejscu.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_15_03"); //Szturm ze strony ork�w jest tylko kwesti� czasu i w �adnym wypadku nie powinni�my dawa� im jakichkolwiek szans na osi�gni�cie nad nami przewagi.
	
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Kap4);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Kap4, "Co mam teraz zrobi�?", DIA_NASZ_110_Keroloth_Kap4_what);
	

	
	B_LogEntry (TOPIC_Keroloth_Wojna, "To koniec. Zamek zdobyty! Teraz mam uda� si� z wie�ciami o tym do Udara.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Przej�li�my zamek. Ale orkowie przes�ali sygna� dymny za palisad�. Musz� uda� si� do Udara z wie�ciami o skutkach wojny oraz rozejrze� si� za orkowym murem...");


};

func void InsertUndeadsNearOUTCamp() {

	Wld_InsertNpc(Zombie01_OutCamp1,"FP_KAP4_UNDEAD_01");
	Wld_InsertNpc(Zombie01_OutCamp2,"FP_KAP4_UNDEAD_02");
	Wld_InsertNpc(Zombie01_OutCamp3,"FP_KAP4_UNDEAD_03");
	Wld_InsertNpc(SkeletonShield,"FP_KAP4_UNDEAD_04");
	Wld_InsertNpc(SkeletonPro,"FP_KAP4_UNDEAD_05");
	Wld_InsertNpc(SkeletonPro,"FP_KAP4_UNDEAD_06");
	Wld_InsertNpc(SkeletonShield,"FP_KAP4_UNDEAD_07");
	Wld_InsertNpc(SkeletonPro,"FP_KAP4_UNDEAD_08");

};

func void DIA_NASZ_110_Keroloth_Kap4_end() {
	
	AI_StopProcessInfos(self);

};

func void DIA_NASZ_110_Keroloth_Kap4_end2() {
	
	B_StartOtherRoutine (NASZ_110_Keroloth,"Zamek");    // zamek -> siedzi przy krzesle z ammannem
	AI_StopProcessInfos(self);

};

FUNC VOID DIA_NASZ_110_Keroloth_Kap4_what()
{

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Kap4_what_15_00"); //Co mam teraz zrobi�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_01"); //Chc�, by� uda� si� do Udara i nakaza� mu w moim imieniu, �eby wys�a� do zamku kilku ludzi.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_02"); //Wol� by� przygotowany zawczasu na odparcie ataku, ni� potem martwi� si� o losy swoich ludzi. 
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_03"); //Powinni�my te� zobaczy�, co dzieje si� w obozie my�liwych. Dowodzi tam Erak, kt�ry zobowi�za� si� do udzielenia pomocy wszystkim s�abszym i rannym.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_04"); //Udaj si� tam i sprawd�, jak ma si� u nich sytuacja. Mam dziwne wra�enie, i� przyda im si� pomoc.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_05"); //W kolonii od d�u�szego czasu pojawiaj� si� demony i nikt z nas nie wie, co jest powodem tych wydarze�.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Kap4_what_55_06"); //My�lisz, �e to mo�e mie� jaki� zwi�zek z orkowymi szamanami?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_07"); //Nie mam poj�cia, ale lepiej nie czeka� na ich kolejny ruch, je�eli stoj� i za tym.
	
	
	Log_CreateTopic (TOPIC_Sprawy,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Sprawy, LOG_RUNNING);
	B_LogEntry (TOPIC_Sprawy,"Szturm zako�czy� si� sukcesem, jednak to wcale nie oznacza, �e ju� wygrali�my. Keroloth podejrzewa, i� orkowie b�d� chcieli przeprowadzi� kontruderzenie i odbi� zamek si��. Dlatego te� wys�a� mnie do obozu �owc�w, bym sprowadzi� do zamku kilku wojownik�w. Poza tym, mam odwiedzi� my�liwych i sprawdzi�, czy czego� potrzebuj� i czy s� bezpieczni.");
	
	AI_StopProcessInfos(self);
	B_Kapitelwechsel (4, NEWWORLD_ZEN );
	InsertUndeadsNearOUTCamp();
	
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Kap4);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Kap4, DIALOG_ENDE, DIA_NASZ_110_Keroloth_Kap4_end2);

	
};



//*********************************************************************
//	Info ErakAndUdarDone
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_ErakAndUdarDone   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 44;
 	condition   = DIA_NASZ_110_Keroloth_ErakAndUdarDone_Condition;
 	information = DIA_NASZ_110_Keroloth_ErakAndUdarDone_Info;
 	permanent   = FALSE;
	description = "Rozmawia�em z Udarem i Erakiem.";
};

FUNC INT DIA_NASZ_110_Keroloth_ErakAndUdarDone_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_Kap4Start))
	&& (npc_knowsinfo (other, DIA_NASZ_201_Erak_Kapitel4))
	&& (npc_hasitems (other, ItNa_RaportEraka) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_ErakAndUdarDone_Info()
{

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_00"); //Rozmawia�em z Udarem i Erakiem.
	
	Log_SetTopicStatus (TOPIC_Sprawy, LOG_SUCCESS);
	B_GivePlayerXP(500);
	//B_LogEntry (TOPIC_Sprawy,"");
	
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_01"); //Udar zgodzi� si� wys�a� do zamku kilku dodatkowych ludzi, jutro powinni ju� tutaj by�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_02"); //To naprawd� dobra wiadomo��, zw�aszcza, �e chyba b�dziemy mieli o wiele mniej czasu na przygotowania, ni� s�dzi�em. Kiedy ci� nie by�o, dostrzegli�my kilku zwiadowc�w kr�c�cych si� przy palisadzie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_03"); //Podejrzewam, �e orkowie obserwuj� nasze poczynania, aby zaatakowa� w odpowiednim momencie, kiedy nie b�dziemy na to gotowi. Mocno si� zdziwi�, kiedy przyjdzie co do czego.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_04"); //Co ciekawe w obozie spotka�em tak�e maga, kt�ry przeteleportowa� si� do nas a� z kontynentu. Niby chce nas uratowa�, ale nie ukrywa, �e kr�lowi chodzi szczeg�lnie o rud�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_05"); //Nie przejmujmy si� tym. Nasza sytuacja znacznie si� polepszy�a, wi�c damy sobie rad� sami.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_06"); //Niestety, nie przynosz� dobrych wie�ci z obozu my�liwych. Tutaj jest raport Eraka, kt�ry powinien rozja�ni� ca�� sytuacj� w ich obozie.

	B_GiveInvItems(other,self,ItNa_RaportEraka,1);
	Npc_RemoveInvItems(self,ItNa_RaportEraka,1);
	B_UseFakeScroll();

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_07"); //Kiedy znalaz�em si� na miejscu, by�em �wiadkiem jak nieumarli szturmuj� ob�z.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_08"); //Uda�o wam si� odeprze� atak? Ilu ludzi zosta�o rannych i co wa�niejsze: Czy Erak ma dostatecznie du�o ludzi, by si� obroni�, nim podejmiemy dzia�ania, aby to wyja�ni�?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_09"); //Tak, uda�o nam si� odeprze� szturm przy jak najmniejszych stratach w�asnych. Kilku my�liwych jest lekko rannych, reszta po bitwie nadal ma zapewnion� opiek�.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_10"); //Powinni�my jednak szybko podj�� w�a�ciwe dzia�ania, gdy� jeden z my�liwych nie tak dawno dostrzeg� kilka demon�w, kt�re przeczesywa�y las przed ich obozem.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_11"); //Demony? Widocznie zbyt szybko ucieszy�em si� z sytuacji w G�rniczej Dolinie. Powiniene� wykorzysta� maga, kt�ry do nas przyby�. Mo�e on wie, jak temu zaradzi�?

	Log_CreateTopic (TOPIC_Erak_plagaciemnosci, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_plagaciemnosci, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Keroloth zasugerowa� mi, abym zapyta� maga, kt�ry przyby� do obozu �owc�w ork�w, czy mo�e zaradzi� co� z plag� nieumar�ych.");
		
};

//*********************************************************************
//	Info InfoAboutAyan
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_InfoAboutAyan   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 44;
 	condition   = DIA_NASZ_110_Keroloth_InfoAboutAyan_Condition;
 	information = DIA_NASZ_110_Keroloth_InfoAboutAyan_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_InfoAboutAyan_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_ErakAndUdarDone))
	&& (npc_knowsinfo (other, DIA_NASZ_010_Monastir_idea)) // pogadal z monastirem
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_InfoAboutAyan_Info()
{
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoAboutAyan_15_00"); //Zaczekaj! Zapomnia�em przekaza� ci li�cik, kt�ry da� mi Ayan, zanim wyruszy� z zamku.
	CreateInvItems(self,ItNa_AyanList,1);
	B_GiveInvItems(self,other,ItNa_AyanList,1);
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoAboutAyan_15_01"); //Dok�d si� uda�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoAboutAyan_15_02"); //Nie wiem. Nie czytam cudzych wiadomo�ci. Sam przeczytaj.
};

//*********************************************************************
//	Info InfoKonsekwencje
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_InfoKonsekwencje   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 44;
 	condition   = DIA_NASZ_110_Keroloth_InfoKonsekwencje_Condition;
 	information = DIA_NASZ_110_Keroloth_InfoKonsekwencje_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_InfoKonsekwencje_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_010_Monastir_IHaveKilled))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_InfoKonsekwencje_Info()
{

	var C_NPC Keroloth; Keroloth = Hlp_GetNpc (NASZ_110_Keroloth);
	var C_NPC Monastir; Monastir = Hlp_GetNpc (NASZ_010_Monastir);
	TRIA_Invite(Keroloth);
	TRIA_Invite(Monastir);
    TRIA_Start();
 
	AI_RunToNPC(NASZ_010_Monastir,hero);
 
	// Keroloth
	TRIA_Next(Keroloth);
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_00"); //Co si� tutaj sta�o?!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_01"); //To... To wszystko sta�o si� tak nagle... Trenowali�my, kiedy na placu pojawi� si� grupka nieumar�ych. Szybko powalili kilku naszych ludzi...
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_02"); //Powstrzymali�my ich, ale na Innosa, co si� dzieje w tym przekl�tym miejscu?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_03"); //Kapliczka zosta�a zniszczona, nieumarli nie powinni ju� d�u�ej n�ka� tych ziem.

	// Monastir
	TRIA_Next(Monastir);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_04"); //Niestety, wszyscy byli�my w straszliwym b��dzie. Orkowa kapliczka, kt�r� zniszczy�e�, Willu, nie by�a powodem przybywania nieumar�ych do tego �wiata.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_05"); //Wr�cz przeciwnie, ona mia�a ich przed tym powstrzymywa�, lecz zakl�cie jakim zosta�a ob�o�ona s�ab�o coraz bardziej i nie mog�o ju� spe�nia� swej roli.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_06"); //Jedynie przyspieszyli�my to, co i tak spotka�oby nas za kilka dni.

	// Keolorth
	TRIA_Next(Keroloth);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_07"); //Powiedz mi czy mo�emy co� z tym zrobi�? Musi by� przecie� spos�b by zako�czy� to szale�stwo, i to raz na zawsze.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_08"); //By� mo�e to zbyt �mia�e za�o�enie, jednak podejrzewam, i� ju� dawno natkn��em si� na co�, co mo�e mie� zwi�zek z t� spraw�.
	
	if (hero.guild == GIL_OUT) {

		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_09"); //Kiedy pomaga�em my�liwym, ci natkn�li si� na dziwne stworzenie wygl�daj�ce jak nieumar�y cieniostw�r. Oczywi�cie ruszyli�my �ladami tej bestii i ku mojemu zaskoczeniu okaza�o si�, �e przewodzi im tajemniczy mag.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_10"); //Wspomnia� on o cz�owieku imieniem Caine. Tak jak ja, i on kiedy� by� skaza�cem. Jednak on nale�a� do sekty, kt�ra wierzy�a w demona imieniem �ni�cy.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_11"); //S�u�y� on pewnemu Guru, kt�ry cz�sto okre�lany by� mianem zawistnego i chciwego w�a. Nie liczy� si� on ze zdaniem �adnego cz�onka bractwa, a w chwili kiedy porzuci�o ono wiar� w swojego boga ten w furii uciek� z obozu i �lad po nim zagin��.
		
	}
	
	else if (hero.guild == GIL_DJG) {
	
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_12"); //Kiedy dotar�em do obozu naszych zwiadowc�w, ich przyw�dca opowiedzia� mi o orkach, kt�rzy odmawiali w zamku przedziwne inkantacje. Kiedy przeczytali�my jedn� z nich, zaatakowa�y nas szkielety.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_13"); //Po walce dostrzegli�my przedziwne stworzenie. Oczywi�cie czym pr�dzej ruszyli�my za nim w pogo�. Tym samym dotarli�my do tajemniczego maga.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_14"); //Po rozmowie z nim u�wiadomi�em sobie, �e podawa� si� za kogo� kogo zna�em kiedy by�em jeszcze skaza�cem w kolonii.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_15"); //Zna�em go jako cz�onka Bractwa, kt�re wierzy�o, �e w drodze ku wolno�ci poprowadzi ich �ni�cy, kt�ry ostatecznie okaza� si� demonem.
	
	};
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_16"); //Uwa�asz, �e mo�e mie� to zwi�zek z Obozem na Bagnie? Nie by�oby to takie niedorzeczne, gdy� po przybyciu otrzymywa�em raporty o tajemniczych zjawiskach, jakie maj� tam miejsce.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_17"); //Nalega�em by to sprawdzi�, lecz Lord Garond, �wie� panie nad jego dusz�, uwa�a�, �e to nie b�dzie mia�o wp�ywu na nasz� misj�. Teraz jednak przyszed� czas, by to wreszcie sprawdzi� i zako�czy� wszystko, co si� tam dzieje.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_18"); //Ten mag wspomina� tak�e co� o Za�mieniu, kt�re ju� mia�o si� rozpocz��.

	// Monastir
	TRIA_Next(Monastir);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_19"); //O bogowie! Je�eli to co m�wisz jest prawd�, zosta�o nam naprawd� niewiele czasu. Je�eli rytua� dobiegnie ko�ca, to �wiat zostanie spowity w ca�kowitych ciemno�ciach, a w�adz� nad nim przejm� demony.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_20"); //NIE MO�EMY DO TEGO DOPU�CI�!
	
	B_LogEntry (TOPIC_zacmienie, "Monastir wyja�ni� o co chodzi z tym ca�ym za�mieniem. Wygl�da na to, �e cz�onkowie dawnej sekty planuj� rytua�, kt�ry sprawi, �e w�adz� nad �wiatem obejm� demony. Musz� uda� si� do obozu na bagnie i zapobiec temu ich przedsi�wzi�ciu.");
	
	//Keroloth
	TRIA_Next(Keroloth);

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_21"); //Udam si� na bagna i sprawdz�, co tam si� dzieje. I tak mia�em zamiar zbada� tereny za palisad�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_22"); //To dobry pomys�, Willu. Kiedy ty b�dziesz na bagnach, my zajmiemy si� obron� tego miejsca. G�upio by�oby, gdyby� nie mia� do czego wraca�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_23"); //Pami�taj, aby nie da� si� z�apa� orkom. To niezbadane tereny, wi�c przekazuj mi nowe informacje na bie��co.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_24"); //Oczywi�cie, tak zrobi�!

	TRIA_Finish();
	
	WillIdzieZaPalisade = TRUE;
	
	if 		(npc_knowsinfo(other,DIA_NASZ_010_Monastir_StandInFinal)) 	{ 	Npc_ExchangeRoutine(NASZ_010_Monastir,"Final"); }
	else if (npc_knowsinfo(other,DIA_NASZ_010_Monastir_IKnowPlace)) 	{ 	Npc_ExchangeRoutine(NASZ_010_Monastir,"Gate"); }
	else 																{	Npc_ExchangeRoutine(NASZ_010_Monastir,"InCastle"); };
	
	Npc_ExchangeRoutine(NASZ_110_Keroloth,"Zamek");
	
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Nieumarli pojawili si� w zamku! Zniszczenie kapliczki tylko pogorszy�o sytuacj�. Jak si� okaza�o, g��wn� przyczyn� nie by� pos�g demona, tylko Za�mienie. Najwy�sza pora rozwik�a� t� spraw�.");

};

















//*********************************************************************
//	Info OrkowyPrzepis
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_OrkowyPrzepis   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 44;
 	condition   = DIA_NASZ_110_Keroloth_OrkowyPrzepis_Condition;
 	information = DIA_NASZ_110_Keroloth_OrkowyPrzepis_Info;
 	permanent   = FALSE;
	description = "Znalaz�em pewien orkowy przepis.";
};

FUNC INT DIA_NASZ_110_Keroloth_OrkowyPrzepis_Condition()	
{
	if (PrzepisOrkowyRunning == TRUE)
	&& (PrzepisOrkowyZnamTresc == FALSE)
	&& (npc_hasitems(other,ItNa_Przepis_Orkowy1) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_OrkowyPrzepis_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_15_00"); //Znalaz�em pewien orkowy przepis.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_15_01"); //Niestety, nie jestem w stanie go odczyta�. Rozumiesz co� z tego?
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_55_02"); //Znam si� co nieco na tych ich be�kotach, ale raczej ze s�ownictwa wojennego. Tych s��w o tematyce gotowania w og�le nie rozumiem.
	
	if (HeroSaidZaPalisadaSaLudzie == TRUE) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_55_03"); //Na twoim miejscu zapyta�bym Rudolfa. W ko�cu d�ugi okres czasu przebywa� bli�ej tych bestii ni� ktokolwiek z nas.
		B_LogEntry (TOPIC_orkowy_przepis,"Keroloth zasugerowa� mi, abym poprosi� o pomoc paladyna Rudolfa."); 
	} else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_55_04"); //Tak samo zapewne z Udarem czy Geroldem. Musia�by� chyba znale�� orka, kt�ry zna nasz j�zyk i z nim si� dogada�. Chyba, �e p�niej wykorzysta tw�j przepis i staniesz si� jego g��wnym daniem obiadowym!	
		B_LogEntry (TOPIC_orkowy_przepis,"Niestety, Keroloth nie by� w stanie mi pom�c. Musz� znale�� kogo� innego, kto rozumie orkowe zapiski."); 
	};

};












//WillBylZapalisada
//*********************************************************************
//	Info IWasBehindTheWall
//*********************************************************************
var int InformationPalisadaOneTime;
var int HeroSaidZaPalisadaSaLudzie;
var int HeroSaidKerolothInfo;

var int HeroSaidKerolothInfoBeachOneTime;
var int HeroSaidKerolothInfoOrcsDoneOneTime;
var int HeroSaidKerolothInfoPeopleOneTime;
var int HeroSaidKerolothInfoSwampOneTime;


INSTANCE DIA_NASZ_110_Keroloth_IWasBehindTheWall   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 44;
 	condition   = DIA_NASZ_110_Keroloth_IWasBehindTheWall_Condition;
 	information = DIA_NASZ_110_Keroloth_IWasBehindTheWall_Info;
 	permanent   = true;
	description = "Przynosz� dla ciebie informacje zza palisady.";
};

FUNC INT DIA_NASZ_110_Keroloth_IWasBehindTheWall_Condition()	
{
	if (WillBylZapalisada == TRUE)
	&& (KAPITEL >= 4)
	&& (npc_knowsinfo(other,DIA_NASZ_110_Keroloth_InfoKonsekwencje))
	&& (HeroSaidKerolothInfo < 4)
	{
		return TRUE;
	};
};


FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_15_00"); //Przynosz� dla ciebie informacje zza palisady.
	
	if (InformationPalisadaOneTime == FALSE)
	{
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_55_01"); //By�e� tam? Dobrze, �e ci�gle jeste� w jednym kawa�ku.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_55_02"); //Jak tam jest? Ilu ork�w tam przebywa? Co znalaz�e�?
		InformationPalisadaOneTime = TRUE;
		
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_55_03"); //Co nowego?
	};

	Info_ClearChoices (DIA_NASZ_110_Keroloth_IWasBehindTheWall);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_IWasBehindTheWall, DIALOG_BACK, DIA_NASZ_110_Keroloth_IWasBehindTheWall_back);
	
	if (WillBylZapalisada && !HeroSaidKerolothInfoBeachOneTime) {
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_IWasBehindTheWall, "Orkowie rozbili ob�z na pla�y.", DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc);
	};

	if (wszyscy_orkowie_nie_zyja && !HeroSaidKerolothInfoOrcsDoneOneTime) {
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_IWasBehindTheWall, "Zlikwidowa�em orkowe obozowisko.", DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc);
	};
	
	if (npc_knowsinfo(other,DIA_NASZ_015_Rudolf_siema) && !HeroSaidKerolothInfoPeopleOneTime) {
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_IWasBehindTheWall, "Za palisad� s� ludzie.", DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie);
	};
	
	if (npc_isdead(NASZ_028_Kazmin) && !HeroSaidKerolothInfoSwampOneTime) {
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_IWasBehindTheWall, "Sprawy na bagnach zosta�y wyja�nione.", DIA_NASZ_110_Keroloth_IWasBehindTheWall_swamp);
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_back()
{
	Info_ClearChoices (DIA_NASZ_110_Keroloth_IWasBehindTheWall);
};

FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_swamp()
{
	HeroSaidKerolothInfoSwampOneTime = TRUE;
	HeroSaidKerolothInfo += 1;

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_swamp_15_00"); //Sprawy na bagnach zosta�y wyja�nione.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_swamp_55_01"); //�aden demon nie pojawi si� ju� znik�d?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_swamp_55_02"); //My�l�, �e nie. Mo�ecie spa� spokojnie. Wszystkie dusze cz�onk�w Bractwa �ni�cego zazna�y ukojenia, gdy zabi�em Caine'a i demona Kazmina.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_swamp_55_03"); //To dobre wie�ci. Teraz jedyne, czego si� obawiam to kontratak ork�w.
	B_GivePlayerXP(500);
};

FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc()
{
	HeroSaidKerolothInfoBeachOneTime = TRUE;
	HeroSaidKerolothInfo += 1;

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_15_00"); //Orkowie rozbili ob�z na pla�y.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_55_01"); //Ilu ich jest?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_55_02"); //Na l�dzie oko�o pi��dziesi�ciu. Ale na morzu zacumowane s� dwa statki.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_55_03"); //Nie chce mi si� w to wierzy�. Albo wi�kszo�� pop�yn�a na kontynent, albo kr�c� si� gdzie� dalej.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_55_04"); //Poradzisz sobie z t� garstk�, co? Haha!
	B_GivePlayerXP(500);

};

FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc()
{
	HeroSaidKerolothInfoOrcsDoneOneTime = TRUE;
	HeroSaidKerolothInfo += 1;

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_15_00"); //Zlikwidowa�em orkowe obozowisko.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_01"); //Co? Jaja sobie chyba ze mnie robisz.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_02"); //Zach�cam ci� �eby� poszed� tam sam i sprawdzi�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_03"); //Wiesz co... Nie bez powodu wszyscy m�wi�, �e jeste� najlepszy.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_04"); //Masz talent, ch�opcze.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_05"); //Ale nie my�l, �e teraz zbudujemy ��d� i odp�yniemy st�d. Na morzu na pewno pe�no jest orkowych statk�w. Odbicie od l�du to samob�jstwo.
	B_GivePlayerXP(500);

};

FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie()
{
	HeroSaidKerolothInfoPeopleOneTime = TRUE;
	HeroSaidKerolothInfo += 1;
	
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_15_00"); //Za palisad� s� ludzie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_01"); //A sk�d si� tam wzi�li?!
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_02"); //Jeden z nich to dawny wyznawca �ni�cego. Drugi to tw�j znajomy, utkn�� za palisad� po tym, jak Garond go tam wys�a�. M�wi� o paladynie Rudolfie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_03"); //RUDOLF! Niebywa�e...
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_04"); //Nie wydajesz si� zbyt zachwycony t� wiadomo�ci�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_05"); //Ci�gle rywalizowali�my o wzgl�dy Garonda. No ale jak wida� to jego Garond wys�a� na pewn� �mier�, podczas gdy ja szkoli�em wojownik�w na zamku.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_06"); //Niewa�ne. W ka�dym razie Udar z pewno�ci� ucieszy si�, gdy go zobaczy.
	B_GivePlayerXP(500);

	HeroSaidZaPalisadaSaLudzie = TRUE;
	B_LogEntry (TOPIC_Udar_oddzial, "Powiem r�wnie� Udarowi, �e znalaz�em ludzi, o kt�rych mi m�wi�.");

};


//*********************************************************************
//	Info OrcAttack
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_OrcAttack   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 45;
 	condition   = DIA_NASZ_110_Keroloth_OrcAttack_Condition;
 	information = DIA_NASZ_110_Keroloth_OrcAttack_Info;
 	permanent   = FALSE;
	description = "Pod zamkiem zebra� si� pot�ny oddzia� ork�w.";
};

FUNC INT DIA_NASZ_110_Keroloth_OrcAttack_Condition()	
{
	if (OrcAttack == TRUE)
	{
		return TRUE;
	};
};


FUNC VOID DIA_NASZ_110_Keroloth_OrcAttack_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_OrcAttack_15_00"); //Pod zamkiem zebra� si� pot�ny oddzia� ork�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_OrcAttack_55_01"); //Zwr�ci�em na to uwag�. W�a�nie dlatego zdecydowali�my si� zamkn�� bram�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_OrcAttack_55_02"); //Nawet je�li zabijemy ich wszystkich, to i tak wkr�tce pojawi� si� kolejni. Musimy utrzyma� zamek.
};



var int MieczRunicznyRunaDana;
var int MieczRunicznyDay;
//*********************************************************************
//	Info MieczRunicznyOgien
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_MieczRunicznyOgien   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 51;
 	condition   = DIA_NASZ_110_Keroloth_MieczRunicznyOgien_Condition;
 	information = DIA_NASZ_110_Keroloth_MieczRunicznyOgien_Info;
 	permanent   = FALSE;
	description = "Mam ma�� burz� ognist�.";
};

FUNC INT DIA_NASZ_110_Keroloth_MieczRunicznyOgien_Condition()
{
	if (npc_hasitems (other, ItRu_Firestorm)) && (MieczRunicznyRunaPls == TRUE) && (MieczRunicznyRunaDana == FALSE)
	{
		return TRUE;
	};
};

func void KerolothSay_ComeBackTomorow() {
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyOgien_55_01"); //Wr�� do mnie jutro, miecz b�dzie gotowy.
};

FUNC VOID DIA_NASZ_110_Keroloth_MieczRunicznyOgien_Info()
{

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyOgien_15_00"); //Mam ma�� burz� ognist�.
	B_GiveInvItems (other, self, ItRu_Firestorm, 1);
	KerolothSay_ComeBackTomorow();
	MieczRunicznyRunaDana = 1;

	MieczRunicznyDay = Wld_GetDay ();
};

//*********************************************************************
//	Info MieczRunicznyLod
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_MieczRunicznyLod   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 52;
 	condition   = DIA_NASZ_110_Keroloth_MieczRunicznyLod_Condition;
 	information = DIA_NASZ_110_Keroloth_MieczRunicznyLod_Info;
 	permanent   = FALSE;
	description = "Mam bry�� lodu.";
};

FUNC INT DIA_NASZ_110_Keroloth_MieczRunicznyLod_Condition()
{
	if (npc_hasitems (other, ItRu_IceCube)) && (MieczRunicznyRunaPls == TRUE) && (MieczRunicznyRunaDana == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MieczRunicznyLod_Info()
{

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyLod_15_00"); //Mam bry�� lodu.
	B_GiveInvItems (other, self, ItRu_IceCube, 1);
	KerolothSay_ComeBackTomorow();
	MieczRunicznyRunaDana = 2;

	MieczRunicznyDay = Wld_GetDay ();
};

//*********************************************************************
//	Info MieczRunicznyWiatr
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_MieczRunicznyWiatr   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 53;
 	condition   = DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_Condition;
 	information = DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_Info;
 	permanent   = FALSE;
	description = "Mam pi�� wichru.";
};

FUNC INT DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_Condition()
{
	if (npc_hasitems (other, ItRu_Windfist)) && (MieczRunicznyRunaPls == TRUE) && (MieczRunicznyRunaDana == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_Info()
{

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_15_00"); //Mam pi�� wichru.
	B_GiveInvItems (other, self, ItRu_Windfist, 1);
	KerolothSay_ComeBackTomorow();
	MieczRunicznyRunaDana = 3;

	MieczRunicznyDay = Wld_GetDay ();
};

//*********************************************************************
//	Info MieczRunicznyReady
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_MieczRunicznyReady   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 54;
 	condition   = DIA_NASZ_110_Keroloth_MieczRunicznyReady_Condition;
 	information = DIA_NASZ_110_Keroloth_MieczRunicznyReady_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_110_Keroloth_MieczRunicznyReady_Condition()
{
	if (MieczRunicznyDay < Wld_GetDay())
	&& (MieczRunicznyRunaDana >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MieczRunicznyReady_Info()
{

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_00"); //Miecz jest gotowy. Trzymaj.
	
	if (MieczRunicznyRunaDana == 1) {
		Createinvitems (self, ItNa_MieczRunicznyA, 1);
		B_GiveInvItems (self, other, ItNa_MieczRunicznyA, 1);
	};
	if (MieczRunicznyRunaDana == 2) {
		Createinvitems (self, ItNa_MieczRunicznyB, 1);
		B_GiveInvItems (self, other, ItNa_MieczRunicznyB, 1);
	};
	if (MieczRunicznyRunaDana == 3) {
		Createinvitems (self, ItNa_MieczRunicznyC, 1);
		B_GiveInvItems (self, other, ItNa_MieczRunicznyC, 1);
	};
	

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_01"); //Aby wydzieli� jego moc, musisz uzupe�nia� kryszta�y w runie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_02"); //W naszym obozie, na p�askowy�u, na kt�rym hodujemy chmiel, znajduje si� magiczny kamie�. Tam na�adujesz miecz.
	
	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_03"); //Nie jestem tylko przekonany, co do charakteru jego obra�e�... Musisz sam to ogarn��.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_04"); //Jestem twoim d�u�nikiem, Keroloth.
		Log_SetTopicStatus (TOPIC_MieczRuniczny, LOG_SUCCESS);
		B_LogEntry (TOPIC_MieczRuniczny, "Miecz jest gotowy. Teraz musz� wykombinowa�, jak go u�ywa�.");
	}
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_05"); //Przyznam si�, �e ju� go wypr�bowa�em i stwierdzam, �e jest to bardzo niebezpieczna bro�. By� mo�e jako my�liwy nie b�dziesz w stanie si� ni� pos�ugiwa�.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_06"); //A wi�c przynios�em miecz i run�, a ty chcesz ten miecz dla siebie?
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_07"); //Nie, nie, �le mnie zrozumia�e�! Chodzi mi o to, �e mo�esz nie by� w stanie go ud�wign��. Szkoda, �eby takie cudo by�o niewykorzystywane i rdzewia�o.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_08"); //Miecz jest tw�j, ale wiedz, �e ch�tnie go od ciebie odkupi�.
		Log_SetTopicStatus (TOPIC_MieczRuniczny, LOG_SUCCESS);
		B_LogEntry (TOPIC_MieczRuniczny, "Miecz jest gotowy, ale Keroloth zaproponowa�, �e go ode mnie odkupi. Ciekawe, czy mi si� to op�aci?");
	};
	
	Log_CreateTopic (TOPIC_Artefakty,LOG_NOTE);
	B_LogEntry (TOPIC_Artefakty,"Mog� na�adowa� miecz runiczny kryszta�ami przy magicznym kamieniu w obozie �owc�w.");

	B_GivePlayerXP(500);
	
	

};

//*********************************************************************
//	Info MieczRunicznySell
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_MieczRunicznySell   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 54;
 	condition   = DIA_NASZ_110_Keroloth_MieczRunicznySell_Condition;
 	information = DIA_NASZ_110_Keroloth_MieczRunicznySell_Info;
 	permanent   = FALSE;
	description = "Oddaj� ci miecz runiczny, a w zamian chc� tysi�c sztuk z�ota.";
};

FUNC INT DIA_NASZ_110_Keroloth_MieczRunicznySell_Condition()
{
	if (npc_knowsinfo(other,DIA_NASZ_110_Keroloth_MieczRunicznyReady))
	&& (other.guild == GIL_OUT)
	&& (npc_hasitems(other,ItNa_MieczRunicznyA) || npc_hasitems(other,ItNa_MieczRunicznyB) || npc_hasitems(other,ItNa_MieczRunicznyC))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MieczRunicznySell_Info()
{

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznySell_55_00"); //Oddaj� ci miecz runiczny, a w zamian chc� tysi�c sztuk z�ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznySell_55_01"); //To uczciwa cena. Zgoda. Dokonajmy wi�c transakcji.
	
	if (npc_hasitems(other,ItNa_MieczRunicznyA)) { B_GiveInvItems(other,self,ItNa_MieczRunicznyA,1); };
	if (npc_hasitems(other,ItNa_MieczRunicznyB)) { B_GiveInvItems(other,self,ItNa_MieczRunicznyB,1); };
	if (npc_hasitems(other,ItNa_MieczRunicznyC)) { B_GiveInvItems(other,self,ItNa_MieczRunicznyC,1); };
	
	CreateInvItems(self,ItMi_Gold,1000);
	B_GiveInvItems(self,other,ItMi_Gold,1000);

	B_GivePlayerXP(1000);

};


//*********************************************************************
//	Info SpeedRing
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_SpeedRing   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 55;
 	condition   = DIA_NASZ_110_Keroloth_SpeedRing_Condition;
 	information = DIA_NASZ_110_Keroloth_SpeedRing_Info;
 	permanent   = FALSE;
	description = "Znalaz�em pier�cie� szybko�ci.";
};

FUNC INT DIA_NASZ_110_Keroloth_SpeedRing_Condition()
{
	if (Npc_HasItems(other, ItNa_SpeedRing) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_SpeedRing_Info()
{

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SpeedRing_55_00"); //Znalaz�em pier�cie� szybko�ci.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SpeedRing_55_01"); //Wiesz mo�e, jak go u�ywa�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SpeedRing_55_02"); //Magiczne pier�cienie trzeba �adowa�. Wystarczaj�c� dawk� energii znajdziesz w kryszta�ach.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SpeedRing_55_03"); //W naszym obozie, na p�askowy�u, na kt�rym hodujemy chmiel, znajduje si� magiczny kamie�. Tam na�adujesz pier�cie�.

	Log_CreateTopic (TOPIC_Artefakty,LOG_NOTE);
	B_LogEntry (TOPIC_Artefakty,"Pier�cie� szybko�ci mo�na �adowa� kryszta�ami w obozie �owc�w ork�w w kamieniu na p�askowy�u, gdzie hodowany jest chmiel.");

};










var int KurgKanUratowany;

var string rut1;
var string rut2;
const int oCNpc_States__GetRutinename = 7790976;
func string GetRutineName(var c_npc npc){
	var oCNpc _oCNpc; _oCNpc = Hlp_GetNpc(npc);

	var int npcID; npcID = MEM_ReadInt(_@(_oCNpc)+608);
	var zCPar_symbol symb; symb = _^(MEM_GetSymbolByIndex(npcID));

	var string rtnIdentifierName; rtnIdentifierName = symb.name;
	var int underscore; underscore = STR_IndexOf(rtnIdentifierName, "_");
	var int len; len = STR_Len (rtnIdentifierName);

	if (underscore != -1){
		rtnIdentifierName = STR_SubStr(rtnIdentifierName, underscore+1, len-underscore-1);
	};

	underscore = STR_IndexOf(rtnIdentifierName, "_");
	if (underscore != -1){
		rtnIdentifierName = STR_SubStr(rtnIdentifierName, 0, underscore);
	};
	return rtnIdentifierName;
};




//*********************************************************************
//	Info KurgKan
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_KurgKan   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 55;
 	condition   = DIA_NASZ_110_Keroloth_KurgKan_Condition;
 	information = DIA_NASZ_110_Keroloth_KurgKan_Info;
 	permanent   = FALSE;
	description = "Mam do�� nietypow� pro�b�.";
};

FUNC INT DIA_NASZ_110_Keroloth_KurgKan_Condition()
{
	if (SaveKurgKan == true)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_KurgKan_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_15_00"); //Mam do�� nietypow� pro�b�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_55_01"); //Ju� mi si� to nie podoba. Czego ci trzeba?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_15_02"); //Nie chcia�by� przygarn�� orka do swojego obozu?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_55_03"); //Ha, ha, ha! Ty to masz poczucie humoru! I powiedzia�e� to z tak powa�n� min�!
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_15_04"); //Bo nie �artuj�. Gdy by�em jeszcze kopaczem w Starej Kopalni, tej zawalonej, pracowa� tam Kurg-Kan, kt�rego schwytano podczas wojny i wrzucono do pracy z nami.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_15_05"); //Teraz, po upadku bariery, pr�bowa� wr�ci� do swoich braci, ale ci odrzucili go, uznaj�c za istot� bez honoru i niegodn� miana orka.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_15_06"); //Mieszka niedaleko zawalonej wie�y i chcia�by wr�ci� do ludzi, bo by� przez wielu kopaczy dobrze traktowany.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_55_07"); //Urzekaj�ca historia. Ale nie pomy�la�e� o tym, �e to wszystko podst�p i ma kontrolowa� nasze ruchy od �rodka? Wys�ali kogo�, kogo cz�� skaza�c�w b�dzie zna� i wzbudza� zaufanie?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_15_08"); //Nie ma to �adnego sensu. Kurg-Kan nie wiedzia� przecie�, �e mnie spotka, a skaza�c�w go kojarz�cych nie ma a� tylu.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_55_09"); //Mo�e i masz racj�, ale co z tego? Orkowie morduj� moich braci masowo na kontynencie. Na tych, kt�rych schwytaj� �ywcem, przeprowadzaj� publiczne egzekucje w podbitych miastach i poma�u robi� z tego parad�!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_55_10"); //Czy naprawd� uwa�asz, �e dla tego jednego orka mam splami� sw�j honor i zbezcze�ci� pami�� o nich? Jak mo�esz co� takiego sugerowa�?

	Info_ClearChoices 	(DIA_NASZ_110_Keroloth_KurgKan);
	Info_AddChoice 		(DIA_NASZ_110_Keroloth_KurgKan, "Zaufaj mi, prosz�." ,DIA_NASZ_110_Keroloth_KurgKan_TrustMe);
	Info_AddChoice 		(DIA_NASZ_110_Keroloth_KurgKan, "Masz racj�. Nie powinienem ci� o to prosi�." ,DIA_NASZ_110_Keroloth_KurgKan_IShouldnt);
	
};

func void Keroloth_KillKurgKan() {

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KillKurgKan_15_00"); //Masz racj�. Nie powinienem ci� o to prosi�.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KillKurgKan_15_01"); //No nie powiniene�. Ale nie obawiaj si�, problem z tym orkiem zostanie bardzo szybko za�egnany. 
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KillKurgKan_15_02"); //Co?! Nie musisz go przecie� zabija�!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KillKurgKan_15_03"); //Tu trwa wojna i nie pozwol�, by ork zrujnowa� nasze plany odbicia zamku! Ju� tam wysy�am moich ludzi, a ty nawet nie my�l, by mu pom�c. 
	
		
	// podchodzi do wyjscia i krzyczy
	AI_GotoWP(self,"NASZ_LOWCY_DOM_03");
		
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KillKurgKan_15_04"); //Feros, Fed! Przy zawalonej wie�y b��ka si� ork, zlikwidujcie zagro�enie! Natychmiast.
		
	AI_GotoWP(self,"NASZ_LOWCY_DOM_05");
		
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KillKurgKan_15_05"); //Mo�esz si� oddali� i nie wa� si� wraca� do tego tematu. 
	B_LogEntry (Topic_OrcInATrap,"Moje dzia�ania jedynie pogorszy�y sytuacj�. Mam nadziej�, �e orkowi uda�o si� uciec."); 
		
	rut1 = GetRutineName(NASZ_117_Fed);
	rut2 = GetRutineName(NASZ_118_Ferros);
	Npc_ExchangeRoutine(NASZ_117_Fed,"Kurgkan");
	Npc_ExchangeRoutine(NASZ_118_Ferros,"Kurgkan");
	B_KILLNPC(NASZ_452_KurgKan);
		
	FedFerrosKillKurgKan = TRUE;
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_NASZ_110_Keroloth_KurgKan_TrustMe() {

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_00"); //Zaufaj mi, prosz�.

	if(RepEnough(20, REP_LOWCY))
	{
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_01"); //Jestem tu od jakiego� czasu i staram si� jak mog�, by pom�c jak najwi�cej osobom w tym obozie. Chc� zosta� przyj�ty do niego, chc� zosta� �owc� ork�w.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_02"); //I mimo tego, chc� zaryzykowa� wszystko co tutaj zrobi�em, by� przyj�� tego orka. Zaufaj mi, prosz�.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_03"); //Faktycznie, sporo ju� zrobi�e� i wida�, �e ci zale�y. Ale twoje dobre intencje nie oznaczaj� od razu, �e ten ork jest uczciwy...
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_04"); //Je�li jeste� go tak pewny, to mo�e za niego por�czysz?
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_05"); //Tak, por�cz�.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_06"); //Ale chcia�bym, �eby to nie by�y puste s�owa.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_07"); //Chcia�bym, �eby� przysi�g� na sw�j w�asny gr�b, kt�ry moim zdaniem kopiesz w�a�nie pod sob�, �e je�li ten ork w jakikolwiek zaszkodzi temu obozowi, we�miesz na siebie odpowiedzialno��.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_08"); //Oskar�� ci� o zdrad� i w�asnor�cznie powiesz� na tym drzewie, kt�re stoi na tym magazynie. Jeste� gotowy to zrobi�?
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_09"); //Przysi�gam, �e je�li ten ork w jakikolwiek spos�b zdradzi ten ob�z, oddam si� w twoje r�ce i pozwol� ci wykona� egzekucj�.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_10"); //Nie spodziewa�em si�, �e powiesz to tak pewnie i si� nie zawahasz. Dobrze, przyjm� tego orka do obozu, ale b�dzie to na moich warunkach. 
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_11"); //S�ucham?
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_12"); //Przyprowadzisz go do obozu. Poinformuj� o tym wszystkich, wi�c nie musisz si� obawia�, �e kto� go zaatakuje.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_13"); //Zabierzesz mu bro� i potem mi j� dasz. Musisz by� �wiadomy te� tego, �e ork b�dzie nam us�ugiwa�. Sprz�ta�, czy�ci�, gotowa�... 
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_14"); //Nie, mo�e to gotowanie to z�y pomys�, jeszcze nas otruje... W ka�dym razie, znajdziemy mu zaj�cie. 
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_15"); //My�l�, �e nie b�dzie mu to przeszkadza�.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_16"); //NIE MO�E mu to przeszkadza�. No, id� ju� po niego.
	
		B_LogEntry (Topic_OrcInATrap,"Uda�o mi si� przekona� Kerolotha! Teraz mog� przyprowadzi� orka do obozu."); 

		KurgKanUratowany = true;
	}
	else
	{
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_17"); //Zdaj� sobie spraw�, �e nie jestem tu d�ugo i ma�o jeszcze zrobi�em, ale...
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_TrustMe_15_18"); //No w�a�nie! Jeste� tu nowy i nikt ci� tu tak naprawd� nie zna, a przychodzisz do mnie z tak du�� pro�b�? Jak �miesz?
		Keroloth_KillKurgKan();
	};
	
	AI_StopProcessInfos(self);


};

func void DIA_NASZ_110_Keroloth_KurgKan_IShouldnt() {
	Keroloth_KillKurgKan();
	AI_StopProcessInfos(self);
};


var int KerolothKurgKanTrialogState;
INSTANCE DIA_NASZ_110_Keroloth_KurgKan_OtoOn   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
	nr          = 999;
	condition   = DIA_NASZ_110_Keroloth_KurgKan_OtoOn_Condition;
	information = DIA_NASZ_110_Keroloth_KurgKan_OtoOn_Info;
	important 	= true;
};

FUNC INT DIA_NASZ_110_Keroloth_KurgKan_OtoOn_Condition()
{
	if(KurgKanFollowPC && KerolothKurgKanTrialogState == 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_KurgKan_OtoOn_Info()
{	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_01"); //A wi�c to on...
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_02"); //Tak, to Kurg-Kan.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_03"); //Nie rozmawiam z tob�.
	
	AI_TurnToNpc(NASZ_110_Keroloth,NASZ_452_KurgKan);
	AI_TurnToNpc(NASZ_452_KurgKan,NASZ_110_Keroloth);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_04"); //Powiedz mi, orku, czy naprawd� chcesz zamieszka� w obozie �owc�w ork�w, gdzie wszyscy b�dziemy ci zleca� jak najgorsz� robot� i nie b�dziesz zbyt dobrze traktowany?
	
	AI_TurnToNpc(hero,NASZ_452_KurgKan);
	AI_TurnToNpc(NASZ_452_KurgKan,hero);
	KerolothKurgKanTrialogState = 1;
	AI_StopProcessInfos(self);
	
};

// --- 1
INSTANCE DIA_NASZ_110_Keroloth_KurgKan_OtoOn1   (C_INFO)
{
	npc         = NASZ_452_KurgKan;
	nr          = 999;
	condition   = DIA_NASZ_110_Keroloth_KurgKan_OtoOn1_Condition;
	information = DIA_NASZ_110_Keroloth_KurgKan_OtoOn1_Info;
	important 	= true;
};

FUNC INT DIA_NASZ_110_Keroloth_KurgKan_OtoOn1_Condition()
{
	if(KurgKanFollowPC && KerolothKurgKanTrialogState == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_KurgKan_OtoOn1_Info()
{	
	AI_TurnToNpc(NASZ_110_Keroloth,NASZ_452_KurgKan);
	AI_TurnToNpc(NASZ_452_KurgKan,NASZ_110_Keroloth);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_05"); //Tak. Kurg-Kan nie prze�y� sam, a cz�owieki szanowa�. Mieszka� u cz�owiek, pracowa� dla cz�owiek.

	AI_TurnToNpc(hero, NASZ_110_Keroloth);
	AI_TurnToNpc(NASZ_110_Keroloth,hero);
	
	KerolothKurgKanTrialogState = 2;
	AI_StopProcessInfos(self);
};

// --- 2
INSTANCE DIA_NASZ_110_Keroloth_KurgKan_OtoOn2   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
	nr          = 999;
	condition   = DIA_NASZ_110_Keroloth_KurgKan_OtoOn2_Condition;
	information = DIA_NASZ_110_Keroloth_KurgKan_OtoOn2_Info;
	important 	= true;
};

FUNC INT DIA_NASZ_110_Keroloth_KurgKan_OtoOn2_Condition()
{
	if(KurgKanFollowPC && KerolothKurgKanTrialogState == 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_KurgKan_OtoOn2_Info()
{	
	AI_TurnToNpc(NASZ_110_Keroloth, NASZ_452_KurgKan);
	AI_TurnToNpc(NASZ_452_KurgKan, NASZ_110_Keroloth);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_06"); //Hmmm... My�la�em, �e znajd� pow�d, by ci nie pozwoli� tutaj zamieszka�, ale faktycznie jeste� tak zdesperowany.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_07"); //Dobrze, mo�esz si� czu� mieszka�cem tego obozu, ale pami�taj, �e jeste� obserwowany. Id� do Udara, on ci wymy�li jakie� zadanie.
	
	AI_TurnToNpc(hero, NASZ_452_KurgKan);
	AI_TurnToNpc(NASZ_452_KurgKan, hero);

	KerolothKurgKanTrialogState = 3;
	AI_StopProcessInfos(self);
};

// --- 3
INSTANCE DIA_NASZ_110_Keroloth_KurgKan_OtoOn3   (C_INFO)
{
	npc         = NASZ_452_KurgKan;
	nr          = 999;
	condition   = DIA_NASZ_110_Keroloth_KurgKan_OtoOn3_Condition;
	information = DIA_NASZ_110_Keroloth_KurgKan_OtoOn3_Info;
	important 	= true;
};

FUNC INT DIA_NASZ_110_Keroloth_KurgKan_OtoOn3_Condition()
{
	if(KurgKanFollowPC && KerolothKurgKanTrialogState == 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_KurgKan_OtoOn3_Info()
{	
	AI_TurnToNpc(NASZ_110_Keroloth, NASZ_452_KurgKan);
	AI_TurnToNpc(NASZ_452_KurgKan, NASZ_110_Keroloth);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_08"); //Dobrze, dzi�kowa� Keroloth-przyw�dca.
	
	AI_TurnToNpc(hero,NASZ_110_Keroloth);
	AI_TurnToNpc(NASZ_110_Keroloth,hero);
	KerolothKurgKanTrialogState = 4;
	AI_StopProcessInfos(self);
};

// --- 4
INSTANCE DIA_NASZ_110_Keroloth_KurgKan_OtoOn4   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
	nr          = 999;
	condition   = DIA_NASZ_110_Keroloth_KurgKan_OtoOn4_Condition;
	information = DIA_NASZ_110_Keroloth_KurgKan_OtoOn4_Info;
	important 	= true;
};

FUNC INT DIA_NASZ_110_Keroloth_KurgKan_OtoOn4_Condition()
{
	if(KurgKanFollowPC && KerolothKurgKanTrialogState == 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_KurgKan_OtoOn4_Info()
{	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_09"); //Co do ciebie, Willu...
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_10"); //Tak?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KurgKan_OtoOn_55_11"); //Pami�taj, �e je�li nabroi, ty za to odpowiadasz. Miej si� na baczno�ci. Daj mi jedynie jego bro� i zmiataj.
	B_giveinvitems (hero, NASZ_110_Keroloth, ItMw_2H_OrcAxe_02,1);

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(NASZ_452_KurgKan, "Karczma");
	Npc_ExchangeRoutine(self,"Start");
	
	KurgKanTanczyDay = Wld_GetDay();
	ff_applyonceext(KurgKanRoutine_TickTock30s,30000,-1);
	
	KurgKanTanczy = 1; // oznacza, ze ork przyjety do obozu
	KurgKanFollowPC = 0;

};

//*********************************************************************
//	Info Nauka
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_nauka   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 100;
 	condition   = DIA_NASZ_110_Keroloth_nauka_Condition;
 	information = DIA_NASZ_110_Keroloth_nauka_Info;
 	permanent   = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};

FUNC INT DIA_NASZ_110_Keroloth_nauka_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_nauka_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_nauka_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_nauka_55_01"); //Trenuj� tylko mistrz�w.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_nauka_55_02"); //Je�eli chcia�by� po�wiczy�, to odsy�am ci� do Rethona.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_nauka_55_03"); //W ci�gu dnia mo�esz go spotka� obok po�udniowej bramy obozu.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_nauka_55_04"); //Wieczory bydlak sp�dza w karczmie. Rzecz jasna w�wczas nie zechce ci pom�c.
	
	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Keroloth nauczy mnie walczy� jak mistrz.");
};


//*********************************************************************
//	TEACH
//*********************************************************************

const int Keroloth_1H_MAX = 100;
const int Keroloth_2H_MAX = 100;

func void KerolothAddChoices1H() {

	if (AlignRequestedAmountToTeacherMax(LEARN_1H, 1, Keroloth_1H_MAX) > 0) {
		Info_AddChoice		(DIA_Keroloth_Teach, BuildLearnString(LEARN_1H, 1, Keroloth_1H_MAX), DIA_Keroloth_Teach_1h_1); 
	};
	if (AlignRequestedAmountToTeacherMax(LEARN_1H, 5, Keroloth_1H_MAX) > 1) {
		Info_AddChoice		(DIA_Keroloth_Teach, BuildLearnString(LEARN_1H, 5, Keroloth_1H_MAX), DIA_Keroloth_Teach_1h_5); 
	};

};

func void KerolothAddChoices2H() {

	if (AlignRequestedAmountToTeacherMax(LEARN_2H, 1, Keroloth_2H_MAX) > 0) {
		Info_AddChoice		(DIA_Keroloth_Teach, BuildLearnString(LEARN_2H, 1, Keroloth_2H_MAX), DIA_Keroloth_Teach_2h_1); 
	};
	if (AlignRequestedAmountToTeacherMax(LEARN_2H, 5, Keroloth_2H_MAX) > 1) {
		Info_AddChoice		(DIA_Keroloth_Teach, BuildLearnString(LEARN_2H, 5, Keroloth_2H_MAX), DIA_Keroloth_Teach_2h_5);
	};

};

func void HeroSay_LetsTrainKeroloth() {
	AI_Output (other,self ,"HeroSay_LetsTrainKeroloth_15_00"); //Dobra. Bierzmy si� do nauki.
};

func void KerolothSay_YouDontNeedATeacher() {
	AI_Output(self,other,"KerolothSay_YouDontNeedATeacher_04_00"); //Nie potrzebujesz ju� nauczyciela.
};

func void KerolothSay_YouArePro1h() {
	AI_Output(self,other,"KerolothSay_YouArePro1h_04_00"); //Teraz jeste� prawdziwym mistrzem walki jednor�cznym or�em.
};

func void KerolothSay_YouArePro2h() {
	AI_Output(self,other,"KerolothSay_YouArePro2h_04_00"); //Teraz jeste� prawdziwym mistrzem walki broni� dwur�czn�.
};

func void KerolothSay_NoMoney() {
	AI_Output (self, other,"KerolothSay_NoMoney_04_00"); //Nie masz do�� z�ota.
};

func void KerolothSay_NoExp() {
	AI_Output (self, other,"KerolothSay_NoExp_04_00"); //Brak ci do�wiadczenia.
};


INSTANCE DIA_Keroloth_Teach   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 101;
 	condition   = DIA_Keroloth_Teach_Condition;
 	information = DIA_Keroloth_Teach_Info;
 	permanent   = TRUE;
	description = "Bierzmy si� do nauki.";
};

FUNC INT DIA_Keroloth_Teach_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_nauka))
	&& (other.HitChance[NPC_TALENT_1H] >= 60 || other.HitChance[NPC_TALENT_2H] >= 60)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Keroloth_Teach_Info()
{
	HeroSay_LetsTrainKeroloth();

	if (other.HitChance[NPC_TALENT_1H] >= 100 && other.HitChance[NPC_TALENT_2H] >= 100) {
		KerolothSay_YouDontNeedATeacher();
		return;
	};
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
		Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
		if (GetTalentNow(LEARN_2H) >= 60) { KerolothAddChoices2H(); };
		if (GetTalentNow(LEARN_1H) >= 60) { KerolothAddChoices1H(); };
};
FUNC VOID DIA_Keroloth_Teach_Back ()
{
	Info_ClearChoices (DIA_Keroloth_Teach);
};

FUNC VOID DIA_Keroloth_Teach_1h_1 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_1H,1,Keroloth_1H_MAX)) {
		KerolothSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_1H,1,Keroloth_1H_MAX)) {
		KerolothSay_NoExp();
	}
	else {
	
		B_GiveInvItems(other,self,ItMi_Gold,CalculateLearnGoldCost(LEARN_1H,1,Keroloth_1H_MAX));
		B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, Keroloth_1H_MAX);
	
		if (GetTalentNow(LEARN_1H) >= Keroloth_1H_MAX)
		{
			KerolothSay_YouArePro1h();
			KerolothSay_YouDontNeedATeacher();
			Info_ClearChoices 	(DIA_Keroloth_Teach);
			return;
		};
	
		Info_ClearChoices 	(DIA_Keroloth_Teach);
		Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
		KerolothAddChoices1H();
	};

};

FUNC VOID DIA_Keroloth_Teach_1h_5 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_1H,5,Keroloth_1H_MAX)) {
		KerolothSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_1H,5,Keroloth_1H_MAX)) {
		KerolothSay_NoExp();
	}
	else {
	
		var int amount; amount = AlignRequestedAmountToTeacherMax(LEARN_1H,5,Keroloth_1H_MAX);
		B_GiveInvItems(other,self,ItMi_Gold,CalculateLearnGoldCost(LEARN_1H,amount,Keroloth_1H_MAX));
		B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, amount, Keroloth_1H_MAX);
	
		if (GetTalentNow(LEARN_1H) >= Keroloth_1H_MAX)
		{
			KerolothSay_YouArePro1h();
			KerolothSay_YouDontNeedATeacher();
			Info_ClearChoices 	(DIA_Keroloth_Teach);
			return;
		};

		Info_ClearChoices 	(DIA_Keroloth_Teach);
		Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
		KerolothAddChoices1H();
	};
};

FUNC VOID DIA_Keroloth_Teach_2h_1 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_2H,1,Keroloth_2H_MAX)) {
		KerolothSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_2H,1,Keroloth_2H_MAX)) {
		KerolothSay_NoExp();
	}
	else {
	
		B_GiveInvItems(other,self,ItMi_Gold,CalculateLearnGoldCost(LEARN_2H,1,Keroloth_2H_MAX));
		B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, Keroloth_2H_MAX);
	
		if (GetTalentNow(LEARN_2H) >= Keroloth_2H_MAX)
		{
			KerolothSay_YouArePro2h();
			KerolothSay_YouDontNeedATeacher();
			Info_ClearChoices 	(DIA_Keroloth_Teach);
			return;
		};

		Info_ClearChoices 	(DIA_Keroloth_Teach);
		Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
		KerolothAddChoices2H();
	};
};

FUNC VOID DIA_Keroloth_Teach_2h_5 ()
{
	if (npc_hasitems (other, ItMi_Gold) < CalculateLearnGoldCost(LEARN_2H,5,Keroloth_2H_MAX)) {
		KerolothSay_NoMoney();
	}
	else if (hero.lp < CalculateLearnLPCost(LEARN_2H,5,Keroloth_2H_MAX)) {
		KerolothSay_NoExp();
	}
	else {
	
		var int amount; amount = AlignRequestedAmountToTeacherMax(LEARN_2H,5,Keroloth_2H_MAX);
		B_GiveInvItems(other,self,ItMi_Gold,CalculateLearnGoldCost(LEARN_2H,amount,Keroloth_2H_MAX));
		B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, amount, Keroloth_2H_MAX);
	
		if (GetTalentNow(LEARN_2H) >= Keroloth_2H_MAX)
		{
			KerolothSay_YouArePro2h();
			KerolothSay_YouDontNeedATeacher();
			Info_ClearChoices 	(DIA_Keroloth_Teach);
			return;
		};

		Info_ClearChoices 	(DIA_Keroloth_Teach);
		Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
		KerolothAddChoices2H();
	};

};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_110_Keroloth_PICKPOCKET (C_INFO)
{
	npc			= NASZ_110_Keroloth;
	nr			= 900;
	condition	= DIA_NASZ_110_Keroloth_PICKPOCKET_Condition;
	information	= DIA_NASZ_110_Keroloth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_110_Keroloth_PICKPOCKET_Condition()
{
	C_Beklauen (94);
};
 
FUNC VOID DIA_NASZ_110_Keroloth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_110_Keroloth_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_110_Keroloth_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_110_Keroloth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_110_Keroloth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_110_Keroloth_PICKPOCKET_DoIt);
};

func void DIA_NASZ_110_Keroloth_PICKPOCKET_DoIt()
{
	B_BeklauenGold(162);
	Info_ClearChoices (DIA_NASZ_110_Keroloth_PICKPOCKET);
};
	
func void DIA_NASZ_110_Keroloth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_110_Keroloth_PICKPOCKET);
};


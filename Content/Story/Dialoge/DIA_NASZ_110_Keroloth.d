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
		Createinvitems (self, ItNa_DJG_Weapon_H, 1);
		AI_EquipBestMeleeWeapon	(self);
		AI_StopProcessInfos (self);
		mieczrunicznykeroloth_onetime = FALSE;
		Npc_RemoveInvItems (self, ItNa_MieczRunicznyKeroloth, 1);
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
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_15_00"); //Ch³opcy spuœcili ci lanie? Widaæ siniaki. Nale¿a³o ci siê!
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_55_01"); //Mówi³em ci przecie¿, ¿e nie mo¿esz grzebaæ w nie swoich rzeczach.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_55_02"); //Dopóki nie zap³acisz, za swoje wybryki, nie za³atwiaj ze mn¹ swoich spraw.
		Keroloth_Talk_Crime_First_Time = TRUE;
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_15_03"); //Przyszed³eœ zap³aciæ?
	};
	
	var string want_to_pay; want_to_pay = "Chcê zap³aciæ za kradzie¿. (";
	want_to_pay = ConcatStrings(want_to_pay,IntToString(Thief_Counter_Lowcy*30));
	want_to_pay = ConcatStrings(want_to_pay," szt. z³ota)");

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

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_InformAboutCrime_pay_15_00"); //Chcê zap³aciæ za kradzie¿.
	
	if (npc_hasitems(other,ItMi_Gold) >= want_to_pay_money) {
		B_GiveInvItems(other,self,ItMi_Gold,want_to_pay_money);
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_pay_55_01"); //Rozdam pieni¹dze najbardziej pokrzywdzonym. Nie mo¿emy skakaæ sobie nawzajem do garde³, bo staniemy siê du¿o ³atwiejszym k¹skiem dla orków.

		Thief_Counter_Lowcy = 0;
		Keroloth_Talk_Crime_First_Time = FALSE;
		
		Info_ClearChoices (DIA_NASZ_110_Keroloth_InformAboutCrime);
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_InformAboutCrime_pay_55_02"); //To dobrze, ¿e chcesz, ale same chêci nie wystarcz¹. Musisz zgromadziæ wystarczaj¹c¹ sumê i mi j¹ przekazaæ.
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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_siema_55_01"); //Czego chcesz? Nie mam czasu, mów szybko. W³aœnie planowa³em ostrza³ katapult¹ na zamek.	

			if (npc_hasitems (other, ItNa_KorthRaport) >= 1) {
				AI_Output (other, self,"DIA_NASZ_110_Keroloth_siema_55_02"); //Przyszed³em tu razem z Korthem. Kaza³ daæ ci ten papier.
					B_GiveInvItems (other, self, ItNa_KorthRaport, 1);
				AI_Output (self, other,"DIA_NASZ_110_Keroloth_siema_55_03"); //Proszê, proszê... Korth zazwyczaj osobiœcie przekazuje mi raporty, a nie pisze do mnie listy.
				AI_Output (self, other,"DIA_NASZ_110_Keroloth_siema_55_04"); //Ciekawe, dlaczego nie przyszed³ do obozu? Albo bardzo siê œpieszy³, albo nie chcia³ na kogoœ trafiæ.
				AI_Output (self, other,"DIA_NASZ_110_Keroloth_siema_55_05"); //Dobrze, ¿e przynosisz raport. Ocena aktualnej sytuacji znacznie u³atwi planowanie ataku.
				DodajReputacje (1, REP_LOWCY);
				B_GivePlayerXP (50);
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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_oboz_55_01"); //A co tu du¿o gadaæ? Pozbijane z desek cha³upy, które nie stanowi³yby ¿adnej przeszkody dla orków, by nas zabiæ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_oboz_55_02"); //Bardziej zale¿a³o nam na dachu nad g³ow¹ i ochronie zapasów, które swoj¹ drog¹ siê koñcz¹. Fakt, miêsa mamy pod dostatkiem, ale wiele bym da³ za œwie¿e owoce.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_oboz_55_03"); //Czy drewniane budynki nie jest ³atwo spaliæ? Orkowi szamani mog¹ w ka¿dej chwili tutaj przyjœæ i u¿yæ swoich czarów.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_oboz_55_04"); //A widzisz, to ju¿ patent zaczerpniêty od myœliwych. Jeden cz³owiek z ich obozu, Snaf, odkry³, ¿e wydzielina z odw³oków krwiopijców jest ognioodporna.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_oboz_55_05"); //Dlatego ka¿da deska w naszym obozie jest pokryta grub¹ warstw¹ tego p³ynu. Gdybyœ wrzuci³ tak¹ deskê do ogniska, ugasi³a by je w mgnieniu oka.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_oboz_55_06"); //Teraz rozumiem, dlaczego pochodnie w budynkach nie podpalaj¹ ich.
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
	description = "Ty tu jesteœ szefem?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_boss_15_00"); //Ty tu jesteœ szefem?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_boss_55_01"); //Zgadza siê. Kapitan Garond, paladyn, który wczeœniej sta³ na czele naszej wyprawy, poleg³ w walce z orkami.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_boss_55_02"); //Przy ¿yciu zosta³o bardzo niewielu rycerzy. Jako najbieglejszy wojownik obj¹³em dowodzenie.
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
 	description = "Chcia³bym do was do³¹czyæ.";
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
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_join_15_00"); //Chcia³bym do was do³¹czyæ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_55_01"); //Przyda siê ka¿dy cz³owiek dobrze w³adaj¹cy mieczem. Hmm... Umiesz coœ?

	if (Mission_Gildia_Ready == FALSE) {
		Log_CreateTopic (TOPIC_gildia, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_gildia, LOG_RUNNING);
		Mission_Gildia_Ready = TRUE;
	};
	
	B_LogEntry (TOPIC_gildia, "Chc¹c do³¹czyæ do ³owców orków, muszê przydaæ siê w obozie.");

	Info_ClearChoices (DIA_NASZ_110_Keroloth_join);

		Info_AddChoice	  (DIA_NASZ_110_Keroloth_join, "Jestem raczej kiepski...", DIA_NASZ_110_Keroloth_join_no);
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_join, "Œmiem twierdziæ, ¿e tak.", DIA_NASZ_110_Keroloth_join_yes);

};

FUNC VOID DIA_NASZ_110_Keroloth_join_no()
{
	join_wybor=0;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_join_no_15_00"); //Jestem raczej kiepski...
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_no_55_01"); //Racja, nie wygl¹dasz mi raczej na doœwiadczonego wojownika.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_no_55_02"); //Ale myœlê, ¿e jest zadanie, w którym móg³byœ siê sprawdziæ.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_join);

};

FUNC VOID DIA_NASZ_110_Keroloth_join_yes()
{
	join_wybor=1;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_join_yes_15_00"); //Œmiem twierdziæ, ¿e tak.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_yes_55_01"); //Doprawdy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_join_yes_55_02"); //Masz wiêc szansê to udowodniæ. Mam dla ciebie pewne zadanie.

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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questno_55_01"); //Jeden z myœliwych, Louis, to by³y kapitan okrêtu. Nie tak dawno, ta wstrêtna ryba poni¿y³a mnie przy innych.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questno_55_02"); //Wykrad³ list od mojej ¿ony, który dosta³em przed wyruszeniem na wyspê Khorinis i przeczyta³ go przy wszystkich. Nie wiem, jak bardzo musia³ byæ pijany, ¿eby zagl¹daæ w prywatne wiadomoœci.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questno_55_03"); //Oczywiœcie od razu go spra³em. Ale nie da³o mi to ¿adnej satysfakcji, bo drañ ledwo trzyma³ siê na nogach.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questno_15_04"); //Wiêc jak chcesz siê zemœciæ? Te¿ chcesz go skompromitowaæ?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questno_55_05"); //W¹piê, ¿eby ten stary pierdziel mia³ poczucie wstydu. Chcê, ¿eby zginê³a mu jedna z jego pami¹tek po marynarskim ¿yciu.

	Log_CreateTopic (TOPIC_Keroloth_Louis, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_Louis, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_Louis, "Keroloth pragnie zemsty na myœliwym Louisie, który dopuœci³ siê jego poni¿enia. Przykaza³ mi, bym wykrad³ myœliwemu jedn¹ z jego pami¹tek po marynarskim ¿yciu.");
	
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
	description = "Co twoim zdaniem by³oby najlepsze?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questnodokument_15_00"); //Co twoim zdaniem by³oby najlepsze?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questnodokument_55_01"); //Bielizna kochanki w porcie, jakaœ mapa, narzêdzia ze statku. Obojêtne co.
	
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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyes_55_01"); //Wychodz¹c z obozu pó³nocn¹ bram¹ skrêæ w lewo. Œcie¿ka, która tam jest, prowadzi na niewielk¹ górkê.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyes_55_02"); //Grasuje tam kilka zielonych i czarnych stworków, które swoim ha³asowaniem doprowadzaj¹ mnie do sza³u.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyes_55_03"); //Chyba wiesz, co z nimi zrobiæ?

	Log_CreateTopic (TOPIC_Keroloth_gobliny, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_gobliny, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_gobliny, "Keroloth nakaza³ mi zabiæ gobliny znajduj¹ce siê w pobli¿u obozu.");
	
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
	description = "Przypomnisz mi, gdzie grasuj¹ te gobliny?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questyesprzypomnienie_15_00"); //Przypomnisz mi, gdzie grasuj¹ te gobliny?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesprzypomnienie_55_01"); //Ehh... Pamiêæ masz gorsz¹ ni¿ moja babcia.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesprzypomnienie_55_02"); //Wychodzisz pó³nocn¹ bram¹, skrêcasz w lewo i idziesz œcie¿k¹ za ska³y.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesprzypomnienie_55_03"); //Poœpiesz siê!

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
	description = "Czy jestem ju¿ gotowy, by do was do³¹czyæ?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ready_55_00"); //Czy jestem ju¿ gotowy, by do was do³¹czyæ?

	if (RepEnough(25,REP_LOWCY)) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_15_01"); //Tak. W obozie s³yszy siê o tobie same dobre rzeczy. Ale to jeszcze nie wszystko!
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_02"); //Co prawda ch³opcy ciê popieraj¹, ale musisz siê sprawdziæ jako ³owca orków.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_03"); //Muszê mieæ pewnoœæ, ¿e mogê na tobie polegaæ, gdy przyjdzie nam walczyæ. ¯e nie narobisz w gacie ze strachu, gdy zobaczysz orka.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_ready_55_04"); //Orkowie nie robi¹ na mnie wra¿enia.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_05"); //Bêdziesz mia³ okazjê to udowodniæ.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_06"); //W jaskini obok mostu przy zamku przebywa kilku orków. Prawdopodobnie zostali wygnani z zamku.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_07"); //Masz siê ich samemu pozbyæ. Kto wie, mo¿e przy którymœ z nich znajdziesz coœ ciekawego?

		WILL_LOWCA = TRUE;

		Wld_InsertNpc	(Orc_Keroloth_A,"FP_ROAM_OW_MOLERAT_CAVE1_OC2"); 
		Wld_InsertNpc	(Orc_Keroloth_B,"FP_SLEEP_OW_MOLERAT_CAVE1_OC2"); 

		Log_CreateTopic (TOPIC_Keroloth_orkowie, LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Keroloth_orkowie, LOG_RUNNING);
		B_LogEntry (TOPIC_Keroloth_orkowie, "¯eby Keroloth mnie przyj¹³, muszê zlikwidowaæ orków znajduj¹cych siê w jaskini obok mostu przy zamku.");
		
	}
	else if (RepEnough(10,REP_LOWCY)) {
		PrintMissingRep(25,REP_LOWCY);
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_15_08"); //Niestety to ci¹gle za ma³o. Ch³opcy ju¿ ciê znaj¹, ale nie wszyscy jeszcze ciê chwal¹.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_09"); //Pracuj tak dalej, a niebawem mo¿e spojrzê na ciebie przychylniejszym okiem.
	}
	else {
		PrintMissingRep(25,REP_LOWCY);
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_15_10"); //¯artujesz, tak?
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ready_55_11"); //Próbujesz w ogóle zyskaæ tu reputacjê? Nie? No to nie zawracaj mi g³owy!
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
	description = "Pozby³em siê tamtych orków.";
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
	AI_Output (self, other,"KerolothSay_YouCanStart_55_00"); //Mo¿esz zaczynaæ, kiedy tylko zechcesz.
};

FUNC VOID DIA_NASZ_110_Keroloth_ReadyDone_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ReadyDone_15_00"); //Pozby³em siê tamtych orków.
	
	if (WillZabilWygnanca >= 1) {
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_01"); //I co, znalaz³eœ coœ ciekawego?
	
		if (npc_hasitems (other, ItRi_Prot_Total_02) >= 1) {
			AI_Output (other, self,"DIA_NASZ_110_Keroloth_ReadyDone_15_02"); //Tylko jakiœ orkowy pierœcieñ.
			AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_03"); //Mo¿e ci siê przyda! Prawdziwy ³owca orków! Zatrzymaj go, jest twój.
		}
	
		else {
			AI_Output (other, self,"DIA_NASZ_110_Keroloth_ReadyDone_15_04"); //Nie.
			AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_05"); //Nie przejmuj siê! Jeszcze nieraz zdobêdziesz jakieœ ³upy.		
		};
	
	KerolothSay_YouCanStart();

	B_LogEntry (TOPIC_Keroloth_orkowie, "Orkowie pokonani. Teraz mogê ju¿ do³¹czyæ do ³owców orków.");
	Log_SetTopicStatus (TOPIC_Keroloth_orkowie, LOG_SUCCESS);
	DodajReputacje (5, REP_LOWCY);
	B_GivePlayerXP (300);

	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_06"); //Ty? Chodz¹ plotki, ¿e ktoœ ci pomaga³.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_ReadyDone_55_07"); //Liczy³em, ¿e zajmiesz siê tym sam, ale jakby nie by³o, wykona³eœ zadanie.
		
		KerolothSay_YouCanStart();
		
		B_LogEntry (TOPIC_Keroloth_orkowie, "Keroloth jakimœ cudem dowiedzia³ siê, ¿e nie pokona³em orków sam. No có¿, wykona³em zadanie i mogê do³¹czyæ do ³owców orków, ale czujê, ¿e Keroloth patrzy na mnie z politowaniem.");
		Log_SetTopicStatus (TOPIC_Keroloth_orkowie, LOG_FAILED);
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
	description = "Chcê zostaæ ³owc¹ orków.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_BeALowca_15_00"); //Chcê zostaæ ³owc¹ orków.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BeALowca_55_01"); //Wspaniale. Zatem mi³o mi og³osiæ, ¿e przyjmujê ciê w nasze szeregi. S³u¿ dzielnie i pamiêtaj: Nie daj siê zabiæ, szczególnie nie orkowi.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BeALowca_55_02"); //Ten pancerz jest twój, trzymaj.

	Createinvitems (self, ITNA_DJG_L, 1);
	B_giveinvitems (self, other, ITNA_DJG_L, 1);
	AI_EquipBestArmor (other);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BeALowca_55_03"); //Jeœli marzy ci siê lepszy, to Engor taki ci sprzeda.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BeALowca_55_04"); //Nie zapomnij te¿ zapytaæ Johny'ego o miecz. Jan ci¹gle pracuje, ¿eby broni nam nie zabrak³o.

	Npc_SetTrueGuild (other, GIL_DJG);
	other.guild	= GIL_DJG;
	Snd_Play ("LEVELUP");

	B_GivePlayerXP (1000);		
	DodajReputacje(10,REP_LOWCY);
	B_LogEntry (TOPIC_gildia, "Do³¹czy³em do ³owców orków.");
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
	description = "Gerold chcia³by pilnowaæ którejœ z bram.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_gerold_15_00"); //Gerold chcia³by pilnowaæ którejœ z bram.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_55_01"); //Jak myœlisz, dlaczego mu na to nie pozwalam? Nie przekonasz mnie do tego, ¿eby ten g³odomór sta³ na stra¿y.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_gerold_15_02"); //G³odomór?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_55_03"); //Tak, na zamku by³a ju¿ taka sytuacja, ¿e Gerold poszed³ siê na¿reæ, zaniedbuj¹c swoje obowi¹zki.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_55_04"); //Chyba, ¿e weŸmiesz odpowiedzialnoœæ za ewentualne zagro¿enie? Co oznacza drobn¹ zaliczkê. Ile z³ota móg³byœ za niego za³o¿yæ?

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);

		Info_AddChoice	  (DIA_NASZ_110_Keroloth_gerold, "100 sztuk z³ota.", DIA_NASZ_110_Keroloth_gerold_s);
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_gerold, "200 sztuk z³ota.", DIA_NASZ_110_Keroloth_gerold_d);

		if (npc_hasitems (other, ItMi_Gold) >=500) {
			Info_AddChoice	  (DIA_NASZ_110_Keroloth_gerold, "500 sztuk z³ota.", DIA_NASZ_110_Keroloth_gerold_p);
		};
		
		if (npc_hasitems (other, ItMi_Gold) >=1000) {
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_gerold, "1000 sztuk z³ota.", DIA_NASZ_110_Keroloth_gerold_t);
		};
};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_s()
{
	gerold_wybor=1;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_gerold_s_15_00"); //100 sztuk z³ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_s_55_01"); //Taka ma³a suma nie wchodzi w grê.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_s_55_02"); //500 sztuk z³ota i Gerold mo¿e pilnowaæ bramy.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);

};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_d()
{
	gerold_wybor=1;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_gerold_d_15_00"); //200 sztuk z³ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_d_55_01"); //To za ma³o.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_d_55_02"); //Chcê 500 sztuk z³ota.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);
};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_p()
{
	gerold_wybor=2;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_gerold_p_15_00"); //500 sztuk z³ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_p_55_01"); //Cena rozs¹dna.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_p_55_02"); //IdŸ do niego i powiedz mu, by poszed³ pilnowaæ wejœcia od strony cmentarza.

	B_GiveInvItems (other, self, ItMi_Gold, 500);
	B_LogEntry (TOPIC_Gerold_Keroloth, "Zap³aci³em Kerolothowi 500 sztuk z³ota. Kaza³ mi powiedzieæ Geroldowi, by poszed³ pilnowaæ wejœcia od strony cmentarza.");

	Info_ClearChoices (DIA_NASZ_110_Keroloth_gerold);
};

FUNC VOID DIA_NASZ_110_Keroloth_gerold_t()
{
	gerold_wybor=2;
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_gerold_t_15_00"); //1000 sztuk z³ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_t_55_01"); //Hojny z ciebie goœæ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_gerold_t_55_02"); //IdŸ do niego i powiedz mu, by poszed³ pilnowaæ wejœcia od strony cmentarza.

	B_GiveInvItems (other, self, ItMi_Gold, 1000);
	B_LogEntry (TOPIC_Gerold_Keroloth, "Zap³aci³em Kerolothowi 1000 sztuk z³ota. Kaza³ mi powiedzieæ Geroldowi, by poszed³ pilnowaæ wejœcia od strony cmentarza.");

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
	description = "Masz te 500 sztuk z³ota.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_kasa_15_00"); //Masz te 500 sztuk z³ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_kasa_55_01"); //Dobra. IdŸ do Gerolda i powiedz mu, by poszed³ pilnowaæ wejœcia od strony cmentarza.

	B_GiveInvItems (other, self, ItMi_Gold, 500);
	B_LogEntry (TOPIC_Gerold_Keroloth, "Zap³aci³em Kerolothowi 500 sztuk z³ota. Kaza³ mi powiedzieæ Geroldowi, by poszed³ pilnowaæ wejœcia od strony cmentarza.");
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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questnoend_55_01"); //Co my tu mamy?
	B_UseFakeScroll();
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questnoend_55_02"); //Myœlê, ¿e wœcieknie siê, gdy zobaczy, ¿e zniknê³a.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questnoend_55_03"); //Zgadzam siê. Z tej mapy korzysta³ zapewne ca³e ¿ycia. Dobrze siê spisa³eœ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_questnoend_55_04"); //Masz tu trochê z³ota, mo¿esz to sobie wynagrodziæ w karczmie i wypiæ parê butelek dobrego wina.

	KerolothDostalMape = TRUE;

	B_LogEntry (TOPIC_Keroloth_Louis, "Przynios³em mapê Kerolothowi. Wydawa³ siê byæ zadowolony.");
	Log_SetTopicStatus (TOPIC_Keroloth_Louis, LOG_SUCCESS);
	B_GivePlayerXP (300);
	Createinvitems (self, itmi_gold, 70);
	B_giveinvitems (self, other, itmi_gold, 70);
	DodajReputacje (4, REP_LOWCY);
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
	description = "Pozby³em siê goblinów.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_questyesend_15_00"); //Pozby³em siê goblinów.
	
	if (WillZabilGoblinaKerolotha >=2) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_01"); //Wreszcie mo¿na w spokoju planowaæ atak.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_02"); //WeŸ to z³oto i pamiêtaj, ¿e za pracê jest siê hojnie wynagradzanym.
		Createinvitems (self, itmi_gold, 70);
		B_giveinvitems (self, other, itmi_gold, 70);
		
		KerolothGoblinyZabite = TRUE;

		B_LogEntry (TOPIC_Keroloth_gobliny, "Keroloth by³ pod wra¿eniem, ¿e zdo³a³em wyeliminowaæ gobliny.");
		Log_SetTopicStatus (TOPIC_Keroloth_gobliny, LOG_SUCCESS);
		
		B_GivePlayerXP (300);
		DodajReputacje (4, REP_LOWCY);
	}
	
	else {	
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_03"); //Jaja sobie ze mnie robisz?
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_04"); //Ch³opcy odwalili za ciebie robotê. Wstyd.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_questyesend_55_05"); //Poszukaj sobie innego zajêcia. Do wojaczki, póki co, siê nie nadajesz.
		B_LogEntry (TOPIC_Keroloth_gobliny, "Keroloth wyœmia³ mnie, bo nie zabi³em tych goblinów sam.");
		Log_SetTopicStatus (TOPIC_Keroloth_gobliny, LOG_FAILED);
	};
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
	description = "Wyrówna³em rachunki z Marcosem.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_WhatToDoKap2_15_00"); //Wyrówna³em rachunki z Marcosem.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatToDoKap2_55_01"); //Œwietnie, mo¿e skusisz siê na kolejne zadanie? Gestath chcia³, ¿ebym przys³a³ mu kogoœ do pomocy. Podobno ma jak¹œ specjaln¹ misjê...
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatToDoKap2_55_02"); //Myœlisz, ¿e siê nadasz?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_WhatToDoKap2_15_03"); //Jestem tego pewien.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatToDoKap2_55_04"); //Œwietnie! W takim razie idŸ. Powodzenia.

	Log_CreateTopic (TOPIC_Gestath_Renegaci, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Gestath_renegaci, LOG_RUNNING);
	B_LogEntry (TOPIC_Gestath_renegaci, "Keroloth wys³a³ mnie do Gestatha. Szykuje siê jakieœ zadanie specjalne.");

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
	description	 = 	"Pomo¿esz mi w walce z Marcosem?";
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
	AI_Output	(other, self, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_00"); //Pomo¿esz mi w walce z Marcosem?
	if !(hero.guild == GIL_DJG) && (KerolothRenegatOneTime == FALSE) {
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_08_01"); //Marcos, paladyn renegat. Czemu chcesz z nim walczyæ?
		AI_Output	(other, self, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_02"); //Przetrzymywa³ mnie w kopalni. Muszê po³o¿yæ kres jego postêpowaniu i uwolniæ moich przyjació³.
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_08_03"); //Mo¿esz liczyæ na moje wsparcie pod warunkiem, ¿e do nas do³¹czysz. Nie bêdê ryzykowa³ œmierci¹ moich ch³opców w imiê osoby, której nawet nie znam. 
		
		KerolothRenegatOneTime = TRUE;
		B_LogEntry (TOPIC_Korth_kopalnia, "Keroloth wesprze mnie tylko, jeœli stanê siê ³owc¹ orków");
	}
	else if !(hero.guild == GIL_DJG) && (KerolothRenegatOneTime == TRUE) {
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_08_04"); //Nie.
	}
	else {
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_08_05"); //Tak. Jesteœ ju¿ jednym z nas, dotrzymam obietnicy. Powiedz coœ wiêcej na ten temat.
		AI_Output	(other, self, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_06"); //Marcos jest schowany w kopalni, za palisad¹. Chcê siê tam jakoœ dostaæ.
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_07"); //Zapewne bramê da siê otworzyæ tylko od wewn¹trz... Mo¿e znajdziesz gdzieœ szparê miêdzy deskami?
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_08"); //WeŸ ten magiczny zwój. Przemiana w chrz¹szcza to bardzo u¿yteczne zaklêcie.
		AI_Output	(self, other, "DIA_NASZ_110_Keroloth_WantToKillRenegat_15_09"); //Zabierz ze sob¹ Feda, Ferosa i Kjorna. Przyda im siê trening inny ni¿ walka na arenie.
		
		CreateInvItems (self, ItNa_TrfMeatbug, 1);									
		B_GiveInvItems (self, other, ItNa_TrfMeatbug, 1);
		
		B_LogEntry (TOPIC_Korth_kopalnia, "W koñcu nadszed³ czas powrotu do kopalni. Tym razem jednak ju¿ nie jako kopacz, a jako ³owca orków! Keroloth da³ mi zwój przemiany w chrz¹szcza. Mo¿e gdzieœ miêdzy deskami palisady bêdzie jakaœ ma³a dziura, ¿eby przedostaæ siê do œrodka. Mam zabraæ ze sob¹ Feda, Kjorna i Ferosa.");

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
	description = "Masz dla mnie jak¹œ robotê?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_work1_15_00"); //Masz dla mnie jak¹œ robotê?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_01"); //Jest coœ do zrobienia. Innym siê nie uda³o, mo¿e pora zaanga¿owaæ w tê sprawê w³aœnie ciebie.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_work1_15_02"); //Warto spróbowaæ. O co chodzi?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_03"); //Chodzi o kamienne golemy. Jakoœ do tej pory nikt z ³owców, którzy zajmowali siê t¹ spraw¹, nie trafi³ na ¿adnego kamiennego stwora. Chyba ¿e gdy ju¿ trafili, to nie odwa¿yli siê przyst¹piæ do akcji?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_04"); //Ale po kolei: Gdy któregoœ wieczoru przechadza³em siê po komnatach zamku, w którymœ regale z ksiêgami natrafi³em na zwój przemiany w golema.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_05"); //Oczywiœcie zabra³em go ze sob¹. Jednym z moich pomys³ów na szturm na zamek jest rozwalenie zamkowych murów i przebicie siê do którejœ z piwnic.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_work1_15_06"); //Wiesz, w którym miejscu uderzyæ, by przebiæ siê do piwnicy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_07"); //Podejrzewam, ale ustaleniem tego zajmê siê póŸniej. Najpierw trzeba upewniæ siê, ¿e ma to sens. Pierwszy próbowa³ Godar. Mia³ znaleŸæ kamiennego golema, u¿yæ zaklêcia przemiany i spróbowaæ go pokonaæ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_08"); //Gdy przez kilka dni nie móg³ znaleŸæ ¿adnego golema, zwój przej¹³ Hokurn, ale on oczywiœcie te¿ nic nie zdzia³a³.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_work1_55_09"); //Pora na ciebie. IdŸ do Hokurna i odbierz zwój. Gdy na swojej drodze spotkasz jakiegoœ kamiennego golema, u¿yj czaru przemiany i spróbuj go rozwaliæ. Jeœli ci siê uda, wróæ do mnie. Czy zadanie jest jasne?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_work1_15_10"); //Jasne. Ju¿ biegnê do Hokurna.
	
	Golem_MIS_Running = TRUE;
	
	Log_CreateTopic (TOPIC_Keroloth_golem, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_golem, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_golem, "Keroloth znalaz³ zwój przemiany w golema i chcia³by siê dowiedzieæ, czy golem jest w stanie burzyæ kamienne mury. Zanim ktoœ targnie siê na zamek, trzeba sprawdziæ, czy ma to sens. Mam iœæ do Hokurna i zabraæ od niego zwój. Gdy spotkam kamiennego golema, mam u¿yæ czaru przemiany w golema i spróbowaæ powaliæ przeciwnika.");

};

// TODO: przetestowac misje
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
	description = "Pokona³em kamiennego golema.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1Done_15_00"); //Pokona³em kamiennego golema.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_55_01"); //Uda³o ci siê! Zatem moja koncepcja na atak ma szansê siê powieœæ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_55_02"); //Powiedz, czy jako kamienny gigant ma siê spore uderzenie? £atwo rozgromiæ ska³ê?

	B_LogEntry (TOPIC_Keroloth_golem, "Szef ³owców orków chcia³by mieæ zapewne ca³¹ armiê kamiennych stworów. Mam z³o¿yæ wizytê Kirgo i zapytaæ, czy móg³by przepisaæ zwój przemiany.");
	
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1Done);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Work1Done, "Nie mia³em ¿adnego k³opotu z pokonaniem golema.", DIA_NASZ_110_Keroloth_Work1Done_nohassle);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Work1Done, "Œrednio, ale golem jest du¿o silniejszy ni¿ cz³owiek.", DIA_NASZ_110_Keroloth_Work1Done_notrly);
};

func void KerolothSay_GoToKirgo() {
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_00"); //¯eby to wszystko mia³o sens, potrzeba przynajmniej kilka takich golemów.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_01"); //Mam tu jeszcze jeden taki zwój. Nie chcê, by siê zmarnowa³. Spróbujemy go przepisaæ.

	CreateInvItems (self, ItNa_TrfGolem, 1);									
	B_GiveInvItems (self, other, ItNa_TrfGolem, 1);

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_02"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_03"); //Udaj siê do alchemika z obozu myœliwych. Znam siê trochê na runach paladynów, ale o zwojach nie wiem prawie nic.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_04"); //Kirgo to obecnie jedyny cz³owiek w kolonii, który ma szansê odtworzyæ ten zwój i zrobiæ kilka, czy tam kilkanaœcie sztuk.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1Done_KerolothSay_GoToKirgo_55_05"); //Miejmy nadziejê, ¿e mu siê uda...
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1Done_nohassle()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Work1Done_nohassle_15_00"); //Nie mia³em ¿adnego k³opotu z pokonaniem golema.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1Done_nohassle_55_01"); //To bardzo dobra prognoza w perspektywie przebicia siê przez mury, czy choæby os³abienia umocnieñ wroga.
	KerolothSay_GoToKirgo();
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1Done);
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1Done_notrly()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Work1Done_notrly_15_00"); //Œrednio, ale golem jest du¿o silniejszy ni¿ cz³owiek.
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
	description = "Kirgo nie uda³o siê przepisaæ zwoju.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1DoneEnd_15_00"); //Kirgo nie uda³o siê przepisaæ zwoju.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_55_01"); //Ta wiadomoœæ popsu³a mi trochê dzisiejszy dzieñ.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Work1DoneEnd_15_02"); //Nie przejmuj siê, z pewnoœci¹ jest mnóstwo innych sposobów na odbicie zamków. A szczerze mówi¹c, ten wcale nie by³ zbyt racjonalny.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_55_03"); //A co siê sta³o z ostatnim egzemplarzem, który ci da³em? Chcia³bym go odzyskaæ.

	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1DoneEnd);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Work1DoneEnd, "Kirgo przypadkiem zniszczy³ go w trakcie przepisywania.", DIA_NASZ_110_Keroloth_Work1DoneEnd_mine);
	if(npc_hasitems(other,ItNa_TrfGolem)>=1) {
		Info_AddChoice	  (DIA_NASZ_110_Keroloth_Work1DoneEnd, "Proszê, zwój znów jest twój.", DIA_NASZ_110_Keroloth_Work1DoneEnd_your);
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1DoneEnd_mine()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Work1DoneEnd_mine_15_00"); //Kirgo przypadkiem zniszczy³ go w trakcie przepisywania.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_mine_55_01"); //W takim razie ta ca³a akcja to jedna wielka klapa. Mog³em lepiej wykorzystaæ te dwa zwoje.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_mine_55_02"); //Tak czy inaczej, dziêki za pomoc. Dobra robota, Willu.

	CreateInvItems (self, ItMi_Gold, 120);									
	B_GiveInvItems (self, other, ItMi_Gold, 120);

	DodajReputacje(4,REP_LOWCY);
	B_GivePlayerXP(500);
	
	B_LogEntry (TOPIC_Keroloth_golem, "Ok³ama³em Kerolotha i zatrzyma³em zwój dla siebie.");
	Log_SetTopicStatus (TOPIC_Keroloth_golem, LOG_SUCCESS);
	
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Work1DoneEnd);
};

FUNC VOID DIA_NASZ_110_Keroloth_Work1DoneEnd_your()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Work1DoneEnd_your_15_00"); //Proszê, zwój znów jest twój.
	B_GiveInvItems(other,self,ItNa_TrfGolem,1);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_your_15_01"); //Zastanawiam siê, czy mogê go jeszcze jakoœ wykorzystaæ. No nic, pomyœlê nad tym póŸniej.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Work1DoneEnd_your_15_02"); //Mimo, ¿e nic z tego nie wysz³o, nale¿y ci siê ma³¹ nagroda za fatygê. Proszê.

	CreateInvItems (self, ItMi_Gold, 120);									
	B_GiveInvItems (self, other, ItMi_Gold, 120);

	DodajReputacje(4,REP_LOWCY);
	B_GivePlayerXP(500);
	
	B_LogEntry (TOPIC_Keroloth_golem, "Odda³em zwój Kerolothowi.");
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
	description = "Znalaz³eœ mo¿e ostatnio kawa³ek jakiegoœ pierœcienia?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_artefakt_15_00"); //Znalaz³eœ mo¿e ostatnio kawa³ek jakiegoœ pierœcienia?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_artefakt_55_01"); //Istotnie. Ciekawe sk¹d to wiesz? Zbieg okolicznoœci? A mo¿e masz coœ wspólnego z t¹ plugaw¹ istot¹, której to odebraliœmy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_artefakt_55_02"); //Korth przypadkiem natkn¹³ siê na zwój i przyzwa³ w³aœciciela pierœcienia. Dobrze, ¿e w pobli¿u by³o kilku ³owców i pomogli zwiaæ stamt¹d Korthowi.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_artefakt_15_03"); //Pracujê dla Gestatha, ta czêœæ jest mi niezwykle potrzebna.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_artefakt_55_04"); //Dla Gestatha powiadasz? Oddam ci tê czêœæ, jeœli zrobisz coœ dla mnie.
	
	if(hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_artefakt_55_05"); //Nie zapominaj, ¿e jako ³owca orków musisz dbaæ o sprawy obozu.
	};

	B_LogEntry (TOPIC_Niedostepny_Klif, "Rzeczywiœcie ³owcy s¹ w posiadaniu artefaktu. Muszê jednak pomóc szefowi, ¿eby mi go odst¹pi³.");

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
	description = "Co mam zrobiæ?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_duchy_15_00"); //Co mam zrobiæ?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_01"); //Nasz cmentarz gnêbi¹ szkielety. Zabij je i upewnij siê, ¿e ju¿ nie wróc¹. Mo¿esz sobie wzi¹æ Gerolda do pomocy. Ale to nie wszystko.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_02"); //Musisz siê dowiedzieæ, sk¹d siê tam wziê³y.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_duchy_15_03"); //Zaraz, dlaczego nie zrobi tego któryœ z ³owców?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_04"); //Wbrew pozorom ci, którzy przybyli do Górniczej Doliny, by polowaæ na smoki, panicznie boj¹ siê o¿ywieñców.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_05"); //Kurgan stanowczo odmówi³, gdy kaza³em gladiatorom siê tym zaj¹æ.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_duchy_15_06"); //To mo¿e ja te¿ odmówiê?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_duchy_55_07"); //Jeœli odmówisz, to nie dostaniesz pierœcienia. Nie masz wyboru, musisz siê tym zaj¹æ.

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
	B_LogEntry (TOPIC_Keroloth_duchy, "Na cmentarzu ³owców orków pojawi³y siê szkielety. Muszê siê ich pozbyæ i rozwik³aæ sk¹d siê tam wziê³y.");

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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_cmentarz_55_01"); //IdŸ do knajpy. Za lad¹ Silasa jest drabina. WyjdŸ do góry, zobaczysz k³adkê z desek. PrzejdŸ po niej, a niewiele dalej znajduje siê cmentarz.
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
	description = "Niebezpieczeñstwo zosta³o za¿egnane.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_done_15_00"); //Niebezpieczeñstwo zosta³o za¿egnane.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_done_55_01"); //To œwietnie! Sk¹d bra³y siê szkielety?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_done_15_02"); //Na bagnach na pó³nocny wschód st¹d znajdowa³o siê potê¿ne le¿e o¿ywieñców. Zabi³em ich przywódcê.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_done_55_03"); //Bardzo dobrze. Myœlê, ¿e to za¿egna nasze obawy. Oto obiecany kawa³ek artefaktu.

	Createinvitems (self, ItNa_Artefakt_Odpornosc, 1);
	B_giveinvitems (self, other, ItNa_Artefakt_Odpornosc, 1);
	B_LogEntry (TOPIC_Keroloth_duchy, "Sprawa za³atwiona. Keroloth da³ mi kawa³ek pierœcienia.");
	Log_SetTopicStatus (TOPIC_Keroloth_duchy, LOG_SUCCESS);
	B_LogEntry (TOPIC_Niedostepny_Klif, "W koñcu mam kawa³ek artefaktu z krypty obok chaty Cavalorna.");
	DodajReputacje (4, REP_LOWCY);
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
	description = "Jeden z bandytów chce wiedzieæ, co z kopalni¹.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoBam_15_00"); //Jeden z bandytów chce wiedzieæ, co z kopalni¹.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoBam_55_01"); //Wiedzia³em, ¿e w koñcu pojawi¹ siê k³opoty. O co dok³adnie chodzi? Skapowali siê, ¿e odciêliœmy dop³yw rudy?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoBam_15_02"); //Otó¿ to. Szefostwo siê niecierpliwi, a ja nie chcê, by odkryli, ¿e rozbiliœmy paladynów.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoBam_55_03"); //Widzê dwa wyjœcia z sytuacji: Albo dostarczysz im ze dwadzieœcia bry³ek rudy jako dostawê, albo poka¿emy, ¿e kopalnia nadal funkcjonuje.

	B_LogEntry (TOPIC_Bam_kopalnia, "Jednym z pomys³ów Kerolotha jest oddanie 20 bry³ek rudy bandytom.");
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
	description = "Jak mogê oszukaæ bandytów w kwestii rudy?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoBamGestath_15_00"); //Jak mogê oszukaæ bandytów w kwestii rudy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoBamGestath_55_01"); //Dlaczego chcesz ich oszukaæ?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoBamGestath_15_02"); //Powiedzmy, ¿e muszê dowieœæ, ¿e wykopaliska wci¹¿ trwaj¹, a nie widzê sensu w dostarczaniu im rudy ze swej kieszeni.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoBamGestath_55_03"); //To mo¿e poka¿emy im, ¿e kopalnia nadal funkcjonuje? Myœla³eœ nad tym?

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
	description = "Jaki masz pomys³?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_BamLieHow_15_00"); //Jaki masz pomys³?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieHow_55_01"); //Jest tu jeszcze parê zbroi rycerskich, wiêc mo¿emy wys³aæ kilku ludzi do kopalni, którzy bêd¹ udawaæ renegatów. Razem z nimi pójd¹ te¿ kopacze.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieHow_55_02"); //Ty przyprowadzisz tego niedowiarka do kopalni, a on zobaczy, ¿e wszystko jest w jak najlepszym porz¹dku.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieHow_55_03"); //Jedynym problemem mo¿e byæ to, ¿e ten cz³owiek wie, jak wygl¹da Marcos... 
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_BamLieHow_15_04"); //Nie powinno byæ z tym k³opotu. Bam powiedzia³, ¿e nie zajmuje siê rud¹, bo od tego s¹ inni bandyci. Wnioskujê, ¿e nie zna³ Marcosa.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieHow_55_05"); //W takim razie mo¿e warto spróbowaæ, co?
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
	description = "Dobra, wiêc to upozorujmy!";
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

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_BamLieStart_15_00"); //Dobra, wiêc to upozorujmy!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieStart_55_01"); //PrzyprowadŸ bandytê do kopalni. Gdy tam przyjdziecie, wszyscy bêd¹ na miejscu.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_BamLieStart_55_02"); //Tylko nie zwlekaj zbyt d³ugo, bo po co kopacze maj¹ znów siedzieæ w tej ciemnej jaskini i udawaæ, ¿e pracuj¹?

	B_LogEntry (TOPIC_Bam_kopalnia, "Po d³u¿szym namyœle, doszliœmy do wniosku, ¿e lepiej bêdzie upozorowaæ pracê w kopalni. Keroloth ma jeszcze parê zbroi rycerskich i da je kilku ³owcom, aby udawali renegatów. Do kopalni udadz¹ siê te¿ kopacze. Ja muszê przyprowadziæ do kopalni Bama.");
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
	description = "Widzia³eœ kiedyœ taki miecz?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_00"); //Widzia³eœ kiedyœ taki miecz?
	//AI_UnequipWeapons         (self);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_55_01"); //Poka¿.
	B_giveinvitems (other, self, ItNa_MieczRuniczny, 1);
	
	//AI_EquipBestMeleeWeapon	(self);
	
	//EquipItem (self,ItNa_MieczRunicznyKeroloth);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni		(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	
	//AI_EquipBestMeleeWeapon	(self);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_02"); //Sk¹d to masz?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_55_03"); //Znalaz³em na bagnach. Wydaje mi siê, ¿e nale¿a³o do Pana Cienia, którego pokona³em.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_04"); //Ciekawe... Wyczuwam w nim ukryt¹ energiê. Jest tu ma³y kryszta³, który powinien pulsowaæ...
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_05"); //Mo¿esz dowiedzieæ siê czegoœ wiêcej o tym mieczu?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_06"); //Oczywiœcie. Mam gdzieœ kilka ksi¹g dotycz¹cych walki mieczem. Przegl¹dnê swoje zbiory. Kojarzy mi siê, ¿e jest gdzieœ rozdzia³ o mieczach magicznych.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_07"); //Du¿o mieczy wykutych z magicznej rudy ma specjalne w³aœciwoœci, ale to wygl¹da na coœ o wiêkszej mocy.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_08"); //Có¿, jak tylko dowiem siê czegoœ wiêcej, to od razu dam ci znaæ.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRuniczny_15_09"); //Trzymam ciê za s³owo. Jeœli to rzeczywiœcie potê¿na broñ, to mo¿e przydaæ siê do walki z orkami.

	MieczRunicznyKerolothOk = TRUE;
	mieczrunicznykeroloth_onetime = TRUE;
	
	B_LogEntry (TOPIC_MieczRuniczny, "Keroloth przyjrzy siê temu mieczowi.");
};

// TODO: ogarn¹æ ortografiê i interpunkcje kap 3 i 4
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
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_KapThree_Info()
{
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_00"); //Dobrze, ¿e jesteœ. Wybacz za ten ca³y harmider w obozie, ale jak ju¿ siê zapewne domyœlasz, wiele siê tutaj zmieni³o, odk¹d odwiedzi³eœ nas po raz ostatni.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_01"); //Zanim przejdê do konkretów, to chcia³bym ci pogratulowaæ: Doskonale poradzi³eœ sobie z tymi bandytami.
	
	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_02"); //Nale¿y ci siê lepsza zbroja. Skuteczniej ochroni ciê przed orkowym ¿elastwem. A jeœli chcesz jeszcze twardsz¹, to udaj siê do Engora.
		Createinvitems (self, ITNA_DJG_H, 1);
		B_Giveinvitems (self, other, ITNA_DJG_H, 1);
		AI_EquipBestArmor (other);
	};
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_03"); //Spoczynek musisz jednak od³o¿yæ na póŸniej, gdy¿ znów czeka nas du¿o roboty.	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_04"); //Dowiedzia³eœ siê mo¿e, czego szukali bandyci w przejêtej przez orków Górniczej Dolinie?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KapThree_15_05"); //G³ównym powodem ich przybycia by³o wydobycie rudy, by sprzedawaæ j¹ królowi. Ich szef natrafi³ na trop potê¿nego artefaktu, Oka Œwiata.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KapThree_15_06"); //Odnalaz³em go i mam przy sobie.
	B_giveinvitems (other, self, ItNa_OkoSwiata, 1);
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_07"); //Oddaj mi go. W rêkach paladyna sprawdzi siê lepiej, ni¿ w twoich. Znam siê lepiej na magicznych przedmiotach i jestem pewien, ¿e zdo³am w pe³ni wykorzystaæ drzemi¹c¹ w nim moc.

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_08"); //Tym bardziej, ¿e nasta³a ta chwila, na któr¹ wszyscy czekaliœmy. Chcemy odbiæ nasz zamek z r¹k orków.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_KapThree_55_09"); //Jesteœcie tego pewni? W zamku jest ca³a horda, a nas zaledwie garstka. Jak mamy ich pokonaæ?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_10"); //Masz racjê, w otwartej walce nie mamy z nimi szans. Jednak nikt nie powiedzia³, ¿e chcemy na nich wybiec z obozu. Dlatego obmyœli³em plan z Udarem i Kurganem.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_11"); //Aby daæ nam wiêksz¹ przewagê w walce, potrzebujemy dobrej kryjówki, gdzie bêdziemy mogli w ukryciu przygotowaæ siê do wypadów na orków.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_12"); //Niestety nikt z nas nie wie, jakie miejsce mo¿e siê do tego nadaæ. Jeœli znajdziesz odpowiednie miejsce, to od razu mnie zawiadom.
	
	if (MieczRunicznyKerolothOk == TRUE) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_13"); //W sprawie miecza, któremu mia³em siê przyjrzeæ...
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_14"); //Znalaz³em wpis o tym ostrzu. To legendarny miecz runiczny.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_KapThree_55_15"); //Przynieœ mi jedn¹ z run: ma³a burza ognista, bry³a lodu, piêœæ wichru. Myœlê, ¿e zdo³am przywróciæ mieczowi jego odpowiednie w³aœciwoœci.

		MieczRunicznyRunaPls = TRUE;
		B_LogEntry (TOPIC_MieczRuniczny, "Jak siê okaza³o, znalaz³em legendarny miecz runiczny. Keroloth przywróci mu jego dawn¹ moc, jeœli przyniosê mu jedn¹ z run: ma³a burza ognista, bry³a lodu, piêœæ wichru.");

	};

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Keroloth szykuje siê do wojny z orkami. Wygl¹da na to, ¿e bêdê jego ch³opcem do 'zadañ specjalnych'.");

	Log_CreateTopic (TOPIC_Keroloth_Wojna, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_Wojna, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_Wojna, "Keroloth planuje odbiæ zamek z r¹k orków. Zabra³ mi Oko Œwiata, bo twierdzi, ¿e lepiej ode mnie je wykorzysta.");
	B_LogEntry (TOPIC_Keroloth_Wojna, "Muszê znaleŸæ miejsce w pobli¿u zamku, w którym mogliby stacjonowaæ ³owcy orków.");
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
	description = "Myœlê, ¿e znam jedno takie miejsce.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_znam_15_00"); //Myœlê, ¿e znam jedno takie miejsce.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_znam_15_01"); //Bandyci handlowali z paladynami, którzy zajmowali miejsce nazywane przez nich twierdz¹. Nie jest to zbyt du¿e miejsce, ale znajduje siê w górach i ciê¿ko jest je znaleŸæ, je¿eli nie wie siê, gdzie go szukaæ.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_znam_15_02"); //Za czasów Kolonii Karnej razem z innymi myœliwymi nazywaliœmy je 'Kanionem Trolli'.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_znam_55_03"); //Kanion Trolli? Chyba widzia³em na którejœ mapie tak¹ nazwê. Wiem, gdzie to jest, ale nie spodziewa³em siê, ¿e ktoœ tam coœ zbudowa³.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_znam_15_04"); //ChodŸ, pójdziemy tam razem i obejrzymy dok³adniej to miejsce.

	B_GivePlayerXP (300);
	
	ProwadziszKerolothaDoTwierdzy = TRUE;

	Npc_ExchangeRoutine (self, "TwierdzaFollow"); // zmienione na Guide
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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Before_55_00"); //Faktycznie nie jest to zbyt du¿e miejsce, i nie wygl¹da tak¿e najlepiej. Trzeba bêdzie je nieco umocniæ nim wydamy otwart¹ wojnê orkom.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Before_55_01"); //Ja zostanê tutaj i zapoznam siê lepiej z tym miejscem. Ty natomiast udaj siê do obozu i zabierz kilka narzêdzi. Myœlê, ¿e piêæ pi³, szeœæ m³otków i cztery kilofy wystarcz¹.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Before_15_02"); //Rozejrzyj siê za nimi w magazynie. To ta buda obok wejœcia do obozu. Oto klucz.

	// Udar szefostwo
	B_StartOtherRoutine (NASZ_119_Udar,"Kap4");
	
	Createinvitems (self, ItNa_Key_Keroloth, 1);
	B_giveinvitems (self, other, ItNa_Key_Keroloth, 1);
	
	ProwadziszKerolothaDoTwierdzy = FALSE;
	B_GivePlayerXP(100);
	
	Log_CreateTopic (TOPIC_Keroloth_narzedzia, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_narzedzia, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_narzedzia, "Twierdza faktycznie jest w op³akanym stanie i w obecnej postaci nie wytrzyma³aby jednego szturmu orków. Mam wiêc udaæ siê do zamku i poza poinformowaniem reszty w obozie o wymarszu, zabraæ stamt¹d tak¿e piêæ pi³, szeœæ m³otków i cztery kilofy.");

	B_LogEntry (TOPIC_Keroloth_Wojna, "Keroloth dotar³ do twierdzy. Ale to dopiero pocz¹tek wojny... Muszê koniecznie za³atwiæ narzêdzia, aby wzmocniæ zabezpieczenia.");

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
	description = "Jaki bêdzie nasz nastêpny ruch?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_WhatNow_15_00"); //Jaki bêdzie nasz nastêpny ruch?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_55_01"); //Jak wiesz, sami nie damy sobie rady, dlatego nieoceniona by³aby dla nas pomoc myœliwych. Móg³byœ zanieœæ Gestathowi ten list?

	Createinvitems (self, ItNa_List_Keroloth, 1);
	B_giveinvitems (self, other, ItNa_List_Keroloth, 1);

	if (hero.guild == GIL_OUT) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_15_03"); //Z racji tego, ¿e jesteœ jednym z nich, powinieneœ z nimi zostaæ i pomóc im w przygotowaniach.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_15_04"); //My damy sobie tutaj radê. Jak ju¿ bêdziecie gotowi, to wróæ do mnie i zdaj mi raport.

		B_LogEntry (TOPIC_Keroloth_Wojna, "Konieczne bêdzie te¿ przygotowanie do wojny obozu. Muszê pomóc Udarowi.");
	}
	else { 
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_15_05"); //Kiedy ju¿ z nimi porozmawiasz, wróæ do mnie. Na pewno znajdzie siê dla ciebie coœ do roboty.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_WhatNow_15_06"); //Tylko nie traæ du¿o czasu, bo ten jest na wagê z³ota!
	};

	Log_CreateTopic (TOPIC_Keroloth_pomoc, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_pomoc, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_pomoc, "Keroloth potrzebuje wsparcia ³uczników do walki z orkami. Muszê dostarczyæ list z proœb¹ o to Gestathowi.");

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
	description = "Widzê, ¿e zebra³eœ swoich ch³opców.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_DuzoLowcow_15_00"); //Widzê, ¿e zebra³eœ swoich ch³opców.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_DuzoLowcow_55_01"); //£ucznicy to jedno, ale do walki wrêcz te¿ kogoœ potrzebujê.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_DuzoLowcow_15_02"); //Wzi¹³em swoich najlepszych wojowników. Zostawi³em kilku stra¿ników w obozie, ¿eby ktoœ go czasem nie stratowa³ podczas mojej nieobecnoœci.
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
	description = "Poinformowa³em myœliwych o ca³ej zaistnia³ej sytuacji.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_HelpIsReady_15_00"); //Poinformowa³em myœliwych o ca³ej zaistnia³ej sytuacji.
	
	if (hero.guild == GIL_DJG) {
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_HelpIsReady_15_01"); //Gestath wraz ze swoimi ludŸmi ju¿ rozpocz¹³ przygotowania do ataku, nie powinno im to d³ugo zaj¹æ.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_02"); //Nie spodziewa³em siê innej odpowiedzi, dobra robota.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_03"); //Teraz kiedy mamy pewnoœæ, i¿ myœliwi i zwiadowcy stan¹ u naszego boku, mo¿emy przyst¹piæ do w³aœciwych dzia³añ.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_04"); //Willu, chcê abyœ uda³ siê do naszego obozu i porozmawia³ z Udarem. Przydzieli³em mu ju¿ zadania, lecz zapewne przyda siê pomoc kogoœ tak bystrego jak ty.
		
		B_LogEntry(TOPIC_Keroloth_Wojna,"Trzeba za³atwiæ kilka spraw w obozie. Muszê udaæ siê do Udara i pomóc mu.");
		// TODO: StartOtherRoutine Udar i ten ³owca ktorys
	}
	
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_05"); //Œwietnie. Wróæ do mnie, gdy ju¿ uporacie siê ze swoimi sprawami.
	};

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_HelpIsReady_55_06"); //Oczywiœcie, ruszam w dalsz¹ drogê.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_07"); //Zaczekaj, weŸ te¿ tê runê. Przeniesie ciê prosto do tej chatki.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_HelpIsReady_15_08"); //Potrafisz sporz¹dzaæ runy?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_HelpIsReady_55_09"); //Przebywaj¹c z paladynami nauczy³em siê tego i owego...

	Createinvitems (self, ItNa_TeleportTwierdza, 1);
	B_giveinvitems (self, other, ItNa_TeleportTwierdza, 1);

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
	description = "Uporaliœmy siê ze sprawami w obozie.";
};

FUNC INT DIA_NASZ_110_Keroloth_CampWeAreRdy_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_HelpIsReady))
	&& ((npc_knowsinfo (other, DIA_NASZ_119_Udar_AllIsReady))
	 || (npc_knowsinfo (other, DIA_NASZ_213_Gestath_AllIsReady)))
	 
	&& (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_MlotyPily)) // skonczone zadanie z wyposarzeniem do twierdzy
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_CampWeAreRdy_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_CampWeAreRdy_15_00"); //Uporaliœmy siê ze sprawami w obozie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_CampWeAreRdy_15_01"); //Wojna coraz bli¿ej!
	
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
	description = "G³ówne si³y myœliwych s¹ w twierdzy.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MainForces_15_00"); //G³ówne si³y myœliwych s¹ w twierdzy.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_01"); //Dobra robota. Gdyby nie ty, pewnie to wszystko trwa³oby du¿o d³u¿ej. Przyjmij te dwie sakiewki, jako dowód mojej wdziêcznoœci.
	
	Log_SetTopicStatus (TOPIC_Keroloth_pomoc, LOG_SUCCESS);
	B_LogEntry (TOPIC_Keroloth_pomoc, "Wszyscy myœliwi s¹ ju¿ na miejscu. Zabawa dopiero siê zaczyna...");
	Createinvitems (self, ItSe_GoldPocket100, 2);
	B_giveinvitems (self, other, ItSe_GoldPocket100, 2);

	B_GivePlayerXP(700);
	DodajReputacje(4,REP_LOWCY);
	
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MainForces_15_02"); //Mam trochê wolnego?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_03"); //W ¿adnym wypadku. Poprowadzisz pierwszy oddzia³ uderzeniowy.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MainForces_15_04"); //¯e co?!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_05"); //To, co s³yszysz. Nie panikuj. WeŸ sobie gladiatorów. Im wrêcz pali siê do wybijania orków.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MainForces_15_06"); //Nie pójdê na pewn¹ œmieræ...
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_07"); //To zrób tak, byœ nie zgin¹³.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MainForces_15_08"); //IdŸ ju¿. Marnujesz czas, a orkowie mog¹ w ka¿dej chwili uderzyæ.

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Czas na ofensywê. Wyruszam na zamek. Mo¿e uda siê przy tym nie zgin¹æ?");

	B_LogEntry (TOPIC_Keroloth_Wojna, "Keroloth postrada³ zmys³y. Mam wzi¹æ gladiatorów i uderzyæ na zamek.");
	
	
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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_00"); //Jesteœ wreszcie!
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_55_01"); //Na Beliara! Co siê tu dzieje?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_02"); //Orkowie kontratakowali. Kurgan doniós³, ¿e wyruszy³eœ zg³adziæ jakiegoœ wielkiego orkowego wodza.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_03"); //Tak, pos³a³em Ur-Shaka do piachu.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_04"); //Jak wygl¹da sytuacja tutaj?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_05"); //Kiepsko. Nie byliœmy w ogóle przygotowani na atak. Prawdopodobnie ci orkowie przyszli tutaj z prze³êczy. Straciliœmy kilku ludzi... W tym Gestatha.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_06"); //CO?! Gestath nie ¿yje?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_07"); //Podczas pierwszego szturmu na twierdzê, grot orkowego be³tu trafi³ prosto w jego szyjê. Zamknêliœmy bramê i próbujemy przygotowaæ siê do kontrataku.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SzturmOrkow_15_08"); //Nie, tak byæ nie mo¿e. Niebawem mo¿e tu nadci¹gn¹æ wiêcej orków. Idê otworzyæ bramê. Stawmy czo³a tym bestiom.

	B_LogEntry (TOPIC_Keroloth_Wojna, "Podczas mojej nieobecnoœci orkowie uderzyli na twierdzê. Poleg³ Gestath... Musimy stawiæ im czo³a. Czas otworzyæ bramê i stan¹æ oko w oko z przeznaczeniem.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Orkowie kontratakowali. Szturmuj¹ nadal twierdzê. Muszê otworzyæ bramê, rozprawiæ siê z nimi i uderzyæ na zamek, dzier¿¹c w rêku kostur Ur-Shaka.");

	Info_ClearChoices (DIA_NASZ_110_Keroloth_SzturmOrkow);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_SzturmOrkow, "Do dzie³a!", DIA_NASZ_110_Keroloth_SzturmOrkow_what);

};

FUNC VOID DIA_NASZ_110_Keroloth_SzturmOrkow_what()
{

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_SzturmOrkow_what_15_00"); //Do dzie³a!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SzturmOrkow_what_55_01"); //Pójdê za tob¹.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "TwierdzaFollow");
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
	DodajReputacje(4,REP_LOWCY);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_15_00"); //Pomœciliœmy Gestatha.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_55_01"); //Nie by³o ich a¿ tak du¿o. Musimy pójœæ za ciosem i uderzyæ na zamek.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_15_02"); //Jak¹ masz pewnoœæ, ¿e orkowie nie zamkn¹ siê za kratami zamku?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_15_03"); //Zabi³em jednego z ich przywódców, Ur-Shaka. Poka¿ê im jego kostur. Na pewno siê tym przejm¹ i bêd¹ chcieli go pomœciæ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_AfterSzturmOrkow_15_04"); //W takim razie zabieramy wszystkich zdolnych do walki i uderzamy. Oby Innos nad nami czuwa³.

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
	B_LogEntry (TOPIC_Keroloth_Wojna, "Obroniliœmy twierdzê. Teraz wyruszamy razem z Kerolothem zdobyæ zamek. Mam wzi¹æ sobie kogo chcê do pomocy. ¯eby orkowie nie zamknêli siê za kratami, za³o¿ê kostur Ur-Shaka.");
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
	description = "Przynios³em narzêdzia, o które prosi³eœ.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MlotyPily_15_00"); //Przynios³em narzêdzia, o które prosi³eœ.
	
	B_giveinvitems (other, self, ItMi_Hammer, 6);
	B_giveinvitems (other, self, ItMi_Saw, 5);
	B_giveinvitems (other, self, ItMw_2H_Axe_L_01, 4);
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MlotyPily_55_01"); //Doskonale! Nasi ch³opcy nie bêd¹ mogli narzekaæ na brak wra¿eñ. To twoja nagroda, przyda ci siê.

	Createinvitems (self, ItMi_Gold, 80);
	B_giveinvitems (self, other, ItMi_Gold, 80);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MlotyPily_55_02"); //Teraz kiedy mamy ju¿ wyposa¿enie, mo¿emy w koñcu pomyœleæ o odpowiednich przygotowaniach do samej walki.

	
	B_LogEntry (TOPIC_Keroloth_narzedzia, "Narzêdzia dostarczone.");
	Log_SetTopicStatus (TOPIC_Keroloth_narzedzia, LOG_SUCCESS);

	B_GivePlayerXP (500);
	DodajReputacje (2, REP_LOWCY);
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
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_PreKap4_15_00"); //Trzech dowódców pokonanych. Zamek jest nasz!
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_PreKap4_55_01"); //Sk¹d pewnoœæ, ¿e orkowie tu nie wróc¹?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_PreKap4_15_02"); //Wycofaj¹ siê na prze³êcz...

	Wld_SendTrigger ("MOVER_OGIEN_ZAMEK_1");
	//self.aivar[AIV_PARTYMEMBER] = FALSE;
	Druzyna (NASZ_110_Keroloth,0);
	
	B_GivePlayerXP(1000);
	DodajReputacje(4,REP_LOWCY);

	
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

func void DIA_NASZ_110_Keroloth_PreKap4_end() {
	AI_StopProcessInfos(self);
	PreKap();
};

/* ----- ----- -----
	Done, lecz zostawiê ten komentarz na razie:
	zamiast tego zagadywania 'FilmKap4' niech w 'DIA_NASZ_110_Keroloth_PreKap4'
	jest clearchoice: "KONIEC" ktory uruchamia sciemnianie sie takie jak np Kopalnia_Trucizna
	-> jak jest ca³kiem ciemno, to wykonuje sie:

	B_StartOtherRoutine (NASZ_110_Keroloth,"Zamek");
	PlayVideo ("G2UCIECZKAAFTERKAP3.BIK");
	// bez tego, bo to stare: Wld_PlayEffect("SCIEMNIANIE",  hero, hero, 0, 0, 0, FALSE);
	AI_Teleport	(hero, "OC_CENTER_04");
	AI_Teleport	(NASZ_110_Keroloth, "OC_CENTER_04");
	Npc_ClearAIQueue (hero);

	potem rozjaœnienie. jak siê rozjaœni to:
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

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_15_00"); //Na Innosa! Widzisz ten ogieñ?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Kap4_55_01"); //Zapewne lada moment bêdziemy mieli towarzystwo.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_15_02"); //Teraz, kiedy uda³o nam siê ju¿ opanowaæ zamek, powinniœmy zaj¹æ siê dalszymi przygotowaniami maj¹cymi na celu wzmocniæ nasz¹ pozycjê w tym miejscu.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_15_03"); //Szturm ze strony orków jest tylko kwesti¹ czasu i w ¿adnym wypadku nie powinniœmy dawaæ im jakichkolwiek szans na osi¹gniêcie nad nami przewagi.
	
	Info_ClearChoices (DIA_NASZ_110_Keroloth_Kap4);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Kap4, "Co mam teraz zrobiæ?", DIA_NASZ_110_Keroloth_Kap4_what);
	

	
	B_LogEntry (TOPIC_Keroloth_Wojna, "To koniec. Zamek zdobyty! Teraz mam udaæ siê z wieœciami o tym do Udara.");

	Log_CreateTopic (TOPIC_Fabula, LOG_NOTE);
	B_LogEntry (TOPIC_Fabula, "Przejêliœmy zamek. Ale orkowie przes³ali sygna³ dymny za palisadê. Muszê udaæ siê do Udara z wieœciami o skutkach wojny oraz rozejrzeæ siê za orkowym murem...");


};

func void InsertUndeadsNearOUTCamp() {

	Wld_InsertNpc(Zombie01,"FP_KAP4_UNDEAD_01");
	Wld_InsertNpc(Zombie01,"FP_KAP4_UNDEAD_02");
	Wld_InsertNpc(Zombie01,"FP_KAP4_UNDEAD_03");
	Wld_InsertNpc(SkeletonShield,"FP_KAP4_UNDEAD_04");
	Wld_InsertNpc(SkeletonPro,"FP_KAP4_UNDEAD_05");
	Wld_InsertNpc(SkeletonPro,"FP_KAP4_UNDEAD_06");
	Wld_InsertNpc(SkeletonShield,"FP_KAP4_UNDEAD_07");
	Wld_InsertNpc(SkeletonPro,"FP_KAP4_UNDEAD_08");

};

FUNC VOID DIA_NASZ_110_Keroloth_Kap4_what()
{

	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_Kap4_what_15_00"); //Co mam teraz zrobiæ?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_01"); //Chcê, byœ uda³ siê do Udara i nakaza³ mu w moim imieniu, ¿eby wys³a³ do zamku kilku ludzi.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_02"); //Wolê byæ przygotowany zawczasu na odparcie ataku, ni¿ potem martwiæ siê o losy swoich ludzi. 
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_03"); //Powinniœmy te¿ zobaczyæ, co dzieje siê w obozie myœliwych. Dowodzi tam Erak, który zobowi¹za³ siê do udzielenia pomocy wszystkim s³abszym i rannym.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_04"); //Udaj siê tam i sprawdŸ, jak ma siê u nich sytuacja. Mam dziwne wra¿enie, i¿ przyda im siê pomoc.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_05"); //W kolonii od d³u¿szego czasu pojawiaj¹ siê demony i nikt z nas nie wie, co jest powodem tych wydarzeñ.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_Kap4_what_55_06"); //Myœlisz, ¿e to mo¿e mieæ jakiœ zwi¹zek z orkowymi szamanami?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_Kap4_what_55_07"); //Nie mam pojêcia, ale lepiej nie czekaæ na ich kolejny ruch, je¿eli stoj¹ i za tym.
	
	
	
	Log_CreateTopic (TOPIC_Sprawy,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Sprawy, LOG_RUNNING);
	B_LogEntry (TOPIC_Sprawy,"Szturm zakoñczy³ siê sukcesem, jednak to wcale nie oznacza, ¿e ju¿ wygraliœmy. Keroloth podejrzewa, i¿ orkowie bêd¹ chcieli przeprowadziæ kontruderzenie i odbiæ zamek si³¹. Dlatego te¿ wys³a³ mnie do obozu ³owców, bym sprowadzi³ do zamku kilku wojowników. Poza tym, mam odwiedziæ myœliwych i sprawdziæ, czy czegoœ potrzebuj¹ i czy s¹ bezpieczni.");
	//AI_StopProcessInfos (self);
	
	InsertUndeadsNearOUTCamp();

	Info_ClearChoices (DIA_NASZ_110_Keroloth_Kap4);
	Info_AddChoice	  (DIA_NASZ_110_Keroloth_Kap4, DIALOG_ENDE, DIA_NASZ_110_Keroloth_Kap4_end);

	
};

func void DIA_NASZ_110_Keroloth_Kap4_end() {
	B_Kapitelwechsel (4, NEWWORLD_ZEN );
	AI_StopProcessInfos(self);
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
	description = "Rozmawia³em z Udarem i Erakiem.";
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

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_00"); //Rozmawia³em z Udarem i Erakiem.
	
	Log_SetTopicStatus (TOPIC_Sprawy, LOG_SUCCESS);
	B_GivePlayerXP(500);
	//B_LogEntry (TOPIC_Sprawy,"");
	
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_01"); //Udar zgodzi³ siê wys³aæ do zamku kilku dodatkowych ludzi, jutro powinni ju¿ tutaj byæ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_02"); //To naprawdê dobra wiadomoœæ, zw³aszcza, ¿e chyba bêdziemy mieli o wiele mniej czasu na przygotowania, ni¿ s¹dzi³em. Kiedy ciê nie by³o, dostrzegliœmy kilku zwiadowców krêc¹cych siê przy palisadzie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_03"); //Podejrzewam, ¿e orkowie obserwuj¹ nasze poczynania, aby zaatakowaæ w odpowiednim momencie, kiedy nie bêdziemy na to gotowi. Mocno siê zdziwi¹, kiedy przyjdzie co do czego.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_04"); //Co ciekawe w obozie spotka³em tak¿e maga, który przeteleportowa³ siê do nas a¿ z kontynentu. Niby chce nas uratowaæ, ale nie ukrywa, ¿e królowi chodzi szczególnie o rudê.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_05"); //Nie przejmujmy siê tym. Nasza sytuacja znacznie siê polepszy³a, wiêc damy sobie radê sami.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_06"); //Niestety, nie przynoszê dobrych wieœci z obozu myœliwych. Tutaj jest raport Eraka, który powinien rozjaœniæ ca³¹ sytuacjê w ich obozie.

	B_GiveInvItems(other,self,ItNa_RaportEraka,1);
	B_UseFakeScroll();

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_07"); //Kiedy znalaz³em siê na miejscu by³em œwiadkiem jak nieumarli szturmuj¹ obóz.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_08"); //Uda³o wam siê odeprzeæ atak? Ilu ludzi zosta³o rannych i co wa¿niejsze: Czy Erak ma dostatecznie du¿o ludzi, by siê obroniæ, nim podejmiemy dzia³ania aby to wyjaœniæ?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_09"); //Tak, uda³o nam siê odeprzeæ szturm przy jak najmniejszych stratach w³asnych. Kilku myœliwych jest lekko rannych, reszta po bitwie nadal ma zapewnion¹ opiekê.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_10"); //Powinniœmy jednak szybko podj¹æ w³aœciwe dzia³ania, gdy¿ jeden z myœliwych nie tak dawno dostrzeg³ kilka demonów, które przeczesywa³y las przed ich obozem.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_ErakAndUdarDone_15_11"); //Demony? Widocznie zbyt szybko ucieszy³em siê z sytuacji w Górniczej Dolinie. Powinieneœ wykorzystaæ maga, który do nas przyby³. Mo¿e on wie, jak temu zaradziæ?

	Log_CreateTopic (TOPIC_Erak_plagaciemnosci, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Erak_plagaciemnosci, LOG_RUNNING);
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Keroloth zasugerowa³ mi, abym zapyta³ maga, który przyby³ do obozu ³owców orków, czy mo¿e zaradziæ coœ z plag¹ nieumar³ych.");
		
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
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_InfoAboutAyan_Info()
{
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoAboutAyan_15_00"); //Zaczekaj! Zapomnia³em przekazaæ ci liœcik, który da³ mi Ayan, zanim wyruszy³ z zamku.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoAboutAyan_15_01"); //Dok¹d siê uda³?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoAboutAyan_15_02"); //Nie wiem. Nie czytam cudzych wiadomoœci. Sam przeczytaj.
	CreateInvItems(self,ItNa_AyanList,1);
	B_GiveInvItems(self,other,ItNa_AyanList,1);
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_00"); //Co siê tutaj sta³o?!
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_01"); //To... To wszystko sta³o siê tak nagle... Trenowaliœmy, kiedy na placu pojawi³ siê grupka nieumar³ych. Szybko powalili kilku naszych ludzi...
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_02"); //Powstrzymaliœmy ich, ale na Innosa, co siê dzieje w tym przeklêtym miejscu?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_03"); //Kapliczka zosta³a zniszczona, nieumarli nie powinni ju¿ d³u¿ej nêkaæ tych ziem.

	// Monastir
	TRIA_Next(Monastir);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_04"); //Niestety, wszyscy byliœmy w straszliwym b³êdzie. Orkowa kapliczka, któr¹ zniszczy³eœ, Willu, nie by³a powodem przybywania nieumar³ych do tego œwiata.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_05"); //Wrêcz przeciwnie, ona mia³a ich przed tym powstrzymywaæ, lecz zaklêcie jakim zosta³a ob³o¿ona s³ab³o coraz bardziej i nie mog³o ju¿ spe³niaæ swej roli.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_06"); //Jedynie przyspieszyliœmy to, co i tak spotka³oby nas za kilka dni.

	// Keolorth
	TRIA_Next(Keroloth);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_07"); //Powiedz mi czy mo¿emy coœ z tym zrobiæ? Musi byæ przecie¿ sposób by zakoñczyæ to szaleñstwo, i to raz na zawsze.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_08"); //Byæ mo¿e to zbyt œmia³e za³o¿enie, jednak podejrzewam, ¿e ju¿ dawno natkn¹³em siê na coœ, co mo¿e mieæ zwi¹zek z t¹ spraw¹.
	
	if (hero.guild == GIL_OUT) {

		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_09"); //Kiedy pomaga³em myœliwym, ci natknêli siê na dziwne stworzenie wygl¹daj¹ce jak nieumar³y cieniostwór. Oczywiœcie ruszyliœmy œladami tej bestii i ku mojemu zaskoczeniu okaza³o siê, ¿e przewodzi im tajemniczy mag.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_10"); //Wspomnia³ on o cz³owieku imieniem Cain. Tak jak ja, i on kiedyœ by³ skazañcem. Jednak on nale¿a³ do sekty, która wierzy³a w demona imieniem Œni¹cy.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_11"); //S³u¿y³ on pewnemu Guru, który czêsto okreœlany by³ mianem zawistnego i chciwego wê¿a. Nie liczy³ siê on ze zdaniem ¿adnego cz³onka bractwa, a w chwili kiedy porzuci³o ono wiarê w swojego boga ten w furii uciek³ z obozu i œlad po nim zagin¹³.
		
	}
	
	else if (hero.guild == GIL_DJG) {
	
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_12"); //Kiedy dotar³em do obozu naszych zwiadowców, ich przywódca opowiedzia³ mi o orkach, którzy odmawiali w zamku przedziwne inkantacje. Kiedy przeczytaliœmy jedn¹ z nich, zaatakowa³y nas szkielety.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_13"); //Po walce dostrzegliœmy przedziwne stworzenie. Oczywiœcie czym prêdzej ruszyliœmy za nim w pogoñ. Tym samym dotarliœmy do tajemniczego maga.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_14"); //Po rozmowie z nim uœwiadomi³em sobie, ¿e podawa³ siê za kogoœ kogo zna³em kiedy by³em jeszcze skazañcem w kolonii.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_15"); //Zna³em go jako cz³onka Bractwa, które wierzy³o, ¿e w drodze ku wolnoœci poprowadzi ich Œni¹cy, który ostatecznie okaza³ siê demonem.
	
	};
	
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_16"); //Uwa¿asz, ¿e mo¿e mieæ to zwi¹zek z Obozem na Bagnie? Nie by³oby to takie niedorzeczne, gdy¿ po przybyciu otrzymywa³em raporty o tajemniczych zjawiskach, jakie maj¹ tam miejsce.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_17"); //Nalega³em by to sprawdziæ, lecz Lord Garond, œwieæ panie nad jego dusz¹, uwa¿a³, ¿e to nie bêdzie mia³o wyp³ywu na nasz¹ misjê. Teraz jednak przyszed³ czas, by to wreszcie sprawdziæ i zakoñczyæ wszystko, co siê tam dzieje.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_18"); //Ten mag wspomina³ tak¿e coœ o Zaæmieniu, które ju¿ mia³o siê rozpocz¹æ.

	// Monastir
	TRIA_Next(Monastir);

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_19"); //O bogowie! Je¿eli to co mówisz jest prawd¹, zosta³o nam naprawdê niewiele czasu. Je¿eli rytua³ dobiegnie koñca, to œwiat zostanie spowity w ca³kowitych ciemnoœciach, a w³adzê nad nim przejm¹ demony.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_20"); //NIE MO¯EMY DO TEGO DOPUŒCIÆ!
	
	B_LogEntry (TOPIC_zacmienie, "Monastir wyjaœni³ o co chodzi z tym ca³ym zaæmieniem. Wygl¹da na to, ¿e cz³onkowie dawnej sekty planuj¹ rytua³, który sprawi, ¿e w³adzê nad œwiatem obejm¹ demony. Muszê udaæ siê do obozu na bagnie i zapobiec temu ich przedsiêwziêciu.");
	
	//Keroloth
	TRIA_Next(Keroloth);

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_21"); //Udam siê na bagna i sprawdzê, co tam siê dzieje. I tak mia³em zamiar zbadaæ tereny za palisad¹.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_22"); //To dobry pomys³, Willu. Kiedy ty bêdziesz na bagnach, my zajmiemy siê obron¹ tego miejsca. G³upio by³oby, gdybyœ nie mia³ do czego wracaæ.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_23"); //Pamiêtaj, aby nie daæ siê z³apaæ orkom. To niezbadane tereny, wiêc przekazuj mi nowe informacje na bie¿¹co.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_InfoKonsekwencje_15_24"); //Oczywiœcie, tak zrobiê!

	TRIA_Finish();
	
	Log_CreateTopic (TOPIC_Keroloth_zapalisada, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Keroloth_zapalisada, LOG_RUNNING);
	B_LogEntry (TOPIC_Keroloth_zapalisada, "Najwy¿sza pora wybraæ siê za orkow¹ palisadê. Nie mam pojêcia, czego siê spodziewaæ... O wszystkim, co tam znajdê powinienem informowaæ Kerolotha.");
	WillIdzieZaPalisade = TRUE;	
	
	if 		(npc_knowsinfo(other,DIA_NASZ_010_Monastir_StandInFinal)) 	{ 	Npc_ExchangeRoutine(NASZ_010_Monastir,"Final"); }
	else if (npc_knowsinfo(other,DIA_NASZ_010_Monastir_IKnowPlace)) 	{ 	Npc_ExchangeRoutine(NASZ_010_Monastir,"Gate"); }
	else 																{	Npc_ExchangeRoutine(NASZ_010_Monastir,"InCastle"); };
	
	Npc_ExchangeRoutine(NASZ_110_Keroloth,"Zamek");
	
	B_LogEntry (TOPIC_Erak_plagaciemnosci, "Nieumarli pojawili siê w zamku! Zniszczenie kapliczki tylko pogorszy³o sytuacjê. Jak siê okaza³o, g³ówn¹ przyczyn¹ nie by³ pos¹g demona, tylko Zaæmienie. Najwy¿sza pora rozwik³aæ tê sprawê.");

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
	description = "Znalaz³em pewien orkowy przepis.";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_15_00"); //Znalaz³em pewien orkowy przepis.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_15_01"); //Niestety, nie jestem w stanie go odczytaæ. Rozumiesz coœ z tego?
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_55_02"); //Znam siê co nieco na tych ich be³kotach, ale raczej ze s³ownictwa wojennego. Tych s³ów o tematyce gotowania w ogóle nie rozumiem.
	
	if (HeroSaidZaPalisadaSaLudzie == TRUE) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_55_03"); //Na twoim miejscu zapyta³bym Rudolfa. W koñcu d³ugi okres czasu przebywa³ bli¿ej tych bestii ni¿ ktokolwiek z nas.
		B_LogEntry (TOPIC_orkowy_przepis,"Keroloth zasugerowa³ mi, abym poprosi³ o pomoc paladyna Rudolfa."); 
	} else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_OrkowyPrzepis_55_04"); //Tak samo za pewne z Udarem czy Geroldem. Musia³byœ chyba znaleŸæ orka, który zna nasz jêzyk i z nim siê dogadaæ. Chyba ¿e póŸniej wykorzysta twój przepis i staniesz siê jego g³ównym daniem obiadowym!	
		B_LogEntry (TOPIC_orkowy_przepis,"Niestety, Keroloth nie by³ w stanie mi pomóc. Muszê znaleŸæ kogoœ innego, kto rozumie orkowe zapiski."); 
	};

};













//*********************************************************************
//	Info IWasBehindTheWall
//*********************************************************************
var int InformationPalisadaOneTime;
var int HeroSaidZaPalisadaSaLudzie;
INSTANCE DIA_NASZ_110_Keroloth_IWasBehindTheWall   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 44;
 	condition   = DIA_NASZ_110_Keroloth_IWasBehindTheWall_Condition;
 	information = DIA_NASZ_110_Keroloth_IWasBehindTheWall_Info;
 	permanent   = FALSE;
	description = "Przynoszê dla ciebie informacje zza palisady.";
};

FUNC INT DIA_NASZ_110_Keroloth_IWasBehindTheWall_Condition()	
{
	if (WillBylZapalisada == TRUE)
	&& (KAPITEL >= 4)
	&& (npc_knowsinfo(other,DIA_NASZ_110_Keroloth_InfoKonsekwencje))
	{
		return TRUE;
	};
};


FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_Info()
{
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_15_00"); //Przynoszê dla ciebie informacje zza palisady.
	
	if (InformationPalisadaOneTime == FALSE)
	{
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_55_01"); //By³eœ tam? Dobrze, ¿e ci¹gle jesteœ w jednym kawa³ku.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_55_02"); //Jak tam jest? Ilu orków tam przebywa? Co znalaz³eœ?
		InformationPalisadaOneTime = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_55_03"); //Co nowego?
	};

	// TODO
	//Info_ClearChoices (DIA_NASZ_110_Keroloth_IWasBehindTheWall);
	//Info_AddChoice	  (DIA_NASZ_110_Keroloth_IWasBehindTheWall, "Orkowie rozbili obóz na pla¿y.", DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc);
	//jeœli w pobli¿u wp nie ma ¿adnego orka
	//Info_AddChoice	  (DIA_NASZ_110_Keroloth_IWasBehindTheWall, "Zlikwidowa³em orkowe obozowisko.", DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc);
	//Info_AddChoice	  (DIA_NASZ_110_Keroloth_IWasBehindTheWall, "Za palisad¹ s¹ ludzie.", DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie);

};

FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_15_00"); //Orkowie rozbili obóz na pla¿y.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_55_01"); //Ilu ich jest?
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_55_02"); //Na l¹dzie oko³o piêædziesiêciu. Ale na morzu zacumowane s¹ dwa statki.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_55_03"); //Nie chce mi siê w to wierzyæ. Albo wiêkszoœæ pop³ynê³a na kontynent, albo krêc¹ siê gdzieœ dalej.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_orc_55_04"); //Poradzisz sobie z t¹ garstk¹, co? Haha!

};

FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_15_00"); //Zlikwidowa³em orkowe obozowisko.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_01"); //Co? Jaja sobie chyba ze mnie robisz.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_02"); //Zachêcam ciê ¿ebyœ poszed³ tam sam i sprawdzi³.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_03"); //Wiesz co... Nie bez powodu wszyscy mówi¹, ¿e jesteœ najlepszy.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_killorc_55_04"); //Masz talent, ch³opcze.

};

FUNC VOID DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_15_00"); //Za palisad¹ s¹ ludzie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_01"); //A sk¹d siê tam wziêli?!
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_02"); //Jeden z nich to dawny wyznawca Œni¹cego. Drugi to twój znajomy, utkn¹³ za palisad¹ po tym, jak Garond wys³a³ go za palisadê. Mówiê o paladynie Rudolfie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_03"); //RUDOLF! Niebywa³e...
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_04"); //Nie wydajesz siê zbyt zachwycony t¹ wiadomoœci¹.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_05"); //Ci¹gle rywalizowaliœmy o wzglêdy Garonda. Ale jak widaæ to jego Garond wys³a³ na pewn¹ œmieræ, podczas gdy ja szkoli³em wojowników na zamku.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_IWasBehindTheWall_ludzie_55_06"); //Niewa¿ne. W ka¿dym razie Udar z pewnoœci¹ ucieszy siê, gdy go zobaczy.

	HeroSaidZaPalisadaSaLudzie = TRUE;
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
	description = "Mam Ma³¹ burzê ognist¹.";
};

FUNC INT DIA_NASZ_110_Keroloth_MieczRunicznyOgien_Condition()
{
	if (npc_hasitems (other, ItRu_Pyrokinesis)) && (MieczRunicznyRunaPls == TRUE) && (MieczRunicznyRunaDana == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MieczRunicznyOgien_Info()
{

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyOgien_15_00"); //Mam Ma³¹ burzê ognist¹.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyOgien_55_01"); //Wróæ do mnie jutro, miecz bêdzie gotowy.
	B_GiveInvItems (other, self, ItRu_Pyrokinesis, 1);
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
	description = "Mam Bry³ê lodu.";
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

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyLod_15_00"); //Mam Bry³ê lodu.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyLod_55_01"); //Wróæ do mnie jutro, miecz bêdzie gotowy.
	B_GiveInvItems (other, self, ItRu_IceCube, 1);
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
	description = "Mam Piêœæ wichru.";
};

FUNC INT DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_Condition()
{
	if (npc_hasitems (other, ItRu_Whirlwind)) && (MieczRunicznyRunaPls == TRUE) && (MieczRunicznyRunaDana == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_Info()
{

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_15_00"); //Mam Piêœæ wichru.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyWiatr_55_01"); //Wróæ do mnie jutro, miecz bêdzie gotowy.
	B_GiveInvItems (other, self, ItRu_Whirlwind, 1);
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
	

	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_01"); //Aby wydzieliæ jego moc, musisz uzupe³niaæ kryszta³y w runie.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_02"); //W naszym obozie, na p³askowy¿u, na którym hodujemy chmiel, znajduje siê magiczny kamieñ. Tam na³adujesz miecz.
	
	if (hero.guild == GIL_DJG) {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_03"); //Nie jestem tylko przekonany, co do charakteru jego obra¿eñ... Musisz sam to ogarn¹æ.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_04"); //Jestem twoim d³u¿nikiem, Keroloth.
		Log_SetTopicStatus (TOPIC_MieczRuniczny, LOG_SUCCESS);
		B_LogEntry (TOPIC_MieczRuniczny, "Miecz jest gotowy. Teraz muszê wykombinowaæ, jak go u¿ywaæ.");
	}
	else {
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_05"); //Przyznam siê, ¿e ju¿ go wypróbowa³em i stwierdzam, ¿e jest to bardzo niebezpieczna broñ. Byæ mo¿e jako myœliwy nie bêdziesz w stanie siê ni¹ pos³ugiwaæ.
		AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_06"); //A wiêc przynios³em miecz i runê, a ty chcesz ten miecz dla siebie?
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_07"); //Nie, nie, Ÿle mnie zrozumia³eœ! Chodzi mi o to, ¿e mo¿esz nie byæ w stanie go udŸwign¹æ. Szkoda, ¿eby takie cudo by³o niwykorzystywane i rdzewia³o.
		AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznyReady_55_08"); //Miecz jest twój, ale wiedz, ¿e chêtnie go od ciebie odkupiê.
		Log_SetTopicStatus (TOPIC_MieczRuniczny, LOG_SUCCESS);
		B_LogEntry (TOPIC_MieczRuniczny, "Miecz jest gotowy, ale Keroloth zaproponowa³, ¿e go ode mnie odkupi. Ciekawe, czy mi siê to op³aci?");
	};
	
	Log_CreateTopic (TOPIC_Artefakty,LOG_NOTE);
	B_LogEntry (TOPIC_Artefakty,"Mogê na³adowaæ miecz runiczny kryszta³ami przy magicznym kamieniu w obozie ³owców.");

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
	description = "Oddajê ci miecz runiczny, a w zamian chcê tysi¹c sztuk z³ota.";
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

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_MieczRunicznySell_55_00"); //Oddajê ci miecz runiczny, a w zamian chcê tysi¹c sztuk z³ota.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_MieczRunicznySell_55_01"); //To uczciwa cena. Zgoda. Dokonajmy wiêc transakcji.
	
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
	description = "Znalaz³em pierœcieñ szybkoœci.";
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

	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SpeedRing_55_00"); //Znalaz³em pierœcieñ szybkoœci.
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_SpeedRing_55_01"); //Wiesz mo¿e, jak go u¿ywaæ?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SpeedRing_55_02"); //Magiczne pierœcienie trzeba ³adowaæ. Wystarczaj¹c¹ dawkê energii znajdziesz w kryszta³ach.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_SpeedRing_55_03"); //W naszym obozie, na p³askowy¿u, na którym hodujemy chmiel, znajduje siê magiczny kamieñ. Tam na³adujesz pierœcieñ.

	Log_CreateTopic (TOPIC_Artefakty,LOG_NOTE);
	B_LogEntry (TOPIC_Artefakty,"Pierœcieñ szybkoœci mo¿na ³adowaæ kryszta³ami w obozie ³owców orków w kamieniu na p³askowy¿u, gdzie hodowany jest chmiel.");

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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output (other, self,"DIA_NASZ_110_Keroloth_nauka_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_nauka_55_01"); //Trenujê tylko mistrzów.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_nauka_55_02"); //Je¿eli chcia³byœ poæwiczyæ, to odsy³am ciê do Rethona.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_nauka_55_03"); //W ci¹gu dnia mo¿esz go spotkaæ obok po³udniowej bramy obozu.
	AI_Output (self, other,"DIA_NASZ_110_Keroloth_nauka_55_04"); //Wieczory bydlak spêdza w karczmie. Rzecz jasna wówczas nie zechce ci pomóc.
	
	Log_CreateTopic (TOPIC_LowcyTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTeacher,"Keroloth nauczy mnie walczyæ jak mistrz.");
};
//*********************************************************************
//	Info Nauka1
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_nauka1   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 101;
 	condition   = DIA_NASZ_110_Keroloth_nauka1_Condition;
 	information = DIA_NASZ_110_Keroloth_nauka1_Info;
 	permanent   = TRUE;
	description = "Ucz mnie pos³ugiwania siê broni¹ jednorêczn¹.";
};

FUNC INT DIA_NASZ_110_Keroloth_nauka1_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_nauka) && other.HitChance[NPC_TALENT_1H] >= 60)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_nauka1_Info()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_nauka1_15_00"); //Dobra. Bierzmy siê do nauki.
	
	Info_ClearChoices 	(DIA_NASZ_110_Keroloth_nauka1);
	Info_AddChoice 		(DIA_NASZ_110_Keroloth_nauka1,	DIALOG_BACK		,DIA_NASZ_110_Keroloth_nauka1_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 20) { Info_AddChoice		(DIA_NASZ_110_Keroloth_nauka1, "Broñ jednorêczna + 1. (4 PN, 20 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka1_1); };
	if (npc_hasitems (other, ItMi_Gold) >= 100) { Info_AddChoice	(DIA_NASZ_110_Keroloth_nauka1, "Broñ jednorêczna + 5. (20 PN, 100 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka1_5); };

};
FUNC VOID DIA_NASZ_110_Keroloth_nauka1_Back ()
{
	Info_ClearChoices (DIA_NASZ_110_Keroloth_nauka1);
};


FUNC VOID DIA_NASZ_110_Keroloth_nauka1_1 ()
{
	if (hero.lp >= 4){ B_giveinvitems (other, self, ItMi_Gold, 20); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_NASZ_110_Keroloth_nauka1_1_04_00"); //Teraz jesteœ prawdziwym mistrzem walki jednorêcznym orê¿em.
		AI_Output(self,other,"DIA_DIA_NASZ_110_Keroloth_nauka1_1_04_01"); //Nie potrzebujesz ju¿ nauczyciela.
	};
	Info_ClearChoices 	(DIA_NASZ_110_Keroloth_nauka1);
	Info_AddChoice 		(DIA_NASZ_110_Keroloth_nauka1,	DIALOG_BACK		,DIA_NASZ_110_Keroloth_nauka1_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 20) { Info_AddChoice		(DIA_NASZ_110_Keroloth_nauka1, "Broñ jednorêczna + 1. (4 PN, 20 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka1_1); };
	if (npc_hasitems (other, ItMi_Gold) >= 100) { Info_AddChoice	(DIA_NASZ_110_Keroloth_nauka1, "Broñ jednorêczna + 5. (20 PN, 100 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka1_5); };
};

FUNC VOID DIA_NASZ_110_Keroloth_nauka1_5 ()
{
	if (hero.lp >= 20){ B_giveinvitems (other, self, ItMi_Gold, 100); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_1H] >= 100)
	{
		AI_Output(self,other,"DIA_NASZ_110_Keroloth_nauka1_5_04_00"); //Teraz jesteœ prawdziwym mistrzem walki jednorêcznym orê¿em.
		AI_Output(self,other,"DIA_NASZ_110_Keroloth_nauka1_5_04_01"); //Nie potrzebujesz ju¿ nauczyciela.
	};
	Info_ClearChoices 	(DIA_NASZ_110_Keroloth_nauka1);
	Info_AddChoice 		(DIA_NASZ_110_Keroloth_nauka1,	DIALOG_BACK		,DIA_NASZ_110_Keroloth_nauka1_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 20) { Info_AddChoice		(DIA_NASZ_110_Keroloth_nauka1, "Broñ jednorêczna + 1. (4 PN, 20 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka1_1); };
	if (npc_hasitems (other, ItMi_Gold) >= 100) { Info_AddChoice	(DIA_NASZ_110_Keroloth_nauka1, "Broñ jednorêczna + 5. (20 PN, 100 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka1_5); };
};
//*********************************************************************
//	Info Nauka2
//*********************************************************************
INSTANCE DIA_NASZ_110_Keroloth_nauka2   (C_INFO)
{
	npc         = NASZ_110_Keroloth;
 	nr          = 102;
 	condition   = DIA_NASZ_110_Keroloth_nauka2_Condition;
 	information = DIA_NASZ_110_Keroloth_nauka2_Info;
 	permanent   = TRUE;
	description = "Ucz mnie pos³ugiwania siê broni¹ dwurêczn¹.";
};

FUNC INT DIA_NASZ_110_Keroloth_nauka2_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_nauka) && other.HitChance[NPC_TALENT_2H] >= 60)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_110_Keroloth_nauka2_Info()
{
	AI_Output (other,self ,"DIA_NASZ_110_Keroloth_nauka2_15_00"); //Dobra. Bierzmy siê do nauki.
	
	Info_ClearChoices 	(DIA_NASZ_110_Keroloth_nauka2);
	Info_AddChoice 		(DIA_NASZ_110_Keroloth_nauka2,	DIALOG_BACK		,DIA_NASZ_110_Keroloth_nauka2_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 20) { Info_AddChoice		(DIA_NASZ_110_Keroloth_nauka2, "Broñ dwurêczna + 1. (3 PN, 20 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka2_1); };
	if (npc_hasitems (other, ItMi_Gold) >= 100) { Info_AddChoice	(DIA_NASZ_110_Keroloth_nauka2, "Broñ dwurêczna + 5. (15 PN, 100 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka2_5); };

};
FUNC VOID DIA_NASZ_110_Keroloth_nauka2_Back ()
{
	Info_ClearChoices (DIA_NASZ_110_Keroloth_nauka2);
};


FUNC VOID DIA_NASZ_110_Keroloth_nauka2_1 ()
{
	if (hero.lp >= 3){ B_giveinvitems (other, self, ItMi_Gold, 20); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_NASZ_110_Keroloth_nauka2_1_04_00"); //Teraz jesteœ prawdziwym mistrzem walki dwurêcznym orê¿em.
		AI_Output(self,other,"DIA_DIA_NASZ_110_Keroloth_nauka2_1_04_01"); //Nie potrzebujesz ju¿ nauczyciela.
	};
	Info_ClearChoices 	(DIA_NASZ_110_Keroloth_nauka2);
	Info_AddChoice 		(DIA_NASZ_110_Keroloth_nauka2,	DIALOG_BACK		,DIA_NASZ_110_Keroloth_nauka2_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 20) { Info_AddChoice		(DIA_NASZ_110_Keroloth_nauka2, "Broñ dwurêczna + 1. (3 PN, 20 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka2_1); };
	if (npc_hasitems (other, ItMi_Gold) >= 100) { Info_AddChoice	(DIA_NASZ_110_Keroloth_nauka2, "Broñ dwurêczna + 5. (15 PN, 100 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka2_5); };
};

FUNC VOID DIA_NASZ_110_Keroloth_nauka2_5 ()
{
	if (hero.lp >= 15){ B_giveinvitems (other, self, ItMi_Gold, 100); };
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_NASZ_110_Keroloth_nauka2_5_04_00"); //Teraz jesteœ prawdziwym mistrzem walki dwurêcznym orê¿em.
		AI_Output(self,other,"DIA_NASZ_110_Keroloth_nauka2_5_04_01"); //Nie potrzebujesz ju¿ nauczyciela.
	};
	Info_ClearChoices 	(DIA_NASZ_110_Keroloth_nauka2);
	Info_AddChoice 		(DIA_NASZ_110_Keroloth_nauka2,	DIALOG_BACK		,DIA_NASZ_110_Keroloth_nauka2_Back);
	if (npc_hasitems (other, ItMi_Gold) >= 20) { Info_AddChoice		(DIA_NASZ_110_Keroloth_nauka2, "Broñ dwurêczna + 1. (3 PN, 20 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka2_1); };
	if (npc_hasitems (other, ItMi_Gold) >= 100) { Info_AddChoice	(DIA_NASZ_110_Keroloth_nauka2, "Broñ dwurêczna + 5. (15 PN, 100 szt. z³ota)",DIA_NASZ_110_Keroloth_nauka2_5); };
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


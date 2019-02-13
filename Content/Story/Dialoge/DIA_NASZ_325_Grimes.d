
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_325_Grimes_EXIT   (C_INFO)
{
	npc         = NASZ_325_Grimes;
	nr          = 999;
	condition   = DIA_NASZ_325_Grimes_EXIT_Condition;
	information = DIA_NASZ_325_Grimes_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_325_Grimes_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_325_Grimes_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
INSTANCE DIA_NASZ_325_Grimes_siema   (C_INFO)
{
	npc         = NASZ_325_Grimes;
 	nr          = 1;
 	condition   = DIA_NASZ_325_Grimes_siema_Condition;
 	information = DIA_NASZ_325_Grimes_siema_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_325_Grimes_siema_Condition()
{
	if (KAPITEL == 2)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_325_Grimes_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_325_Grimes_siema_15_00"); //Ty?! Willu, co ty tutaj robisz?
	AI_Output (other, self,"DIA_NASZ_325_Grimes_siema_55_01"); //Cicho, bo jeszcze ktoœ nas us³yszy. Opowiem ci wszystko, gdy ju¿ bêdziemy na zewn¹trz.
	AI_Output (other, self,"DIA_NASZ_325_Grimes_siema_55_02"); //Póki co, muszê zabraæ nowego niewolnika do obozu.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_siema_15_03"); //Jakiego obozu? Bandytów?
	AI_Output (other, self,"DIA_NASZ_325_Grimes_siema_55_04"); //Tak. Zabieram ciebie.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_siema_15_05"); //W porz¹dku. Mam nadziejê, ¿e wiesz co robisz.

};

//*********************************************************************
//	Info Join
//*********************************************************************
INSTANCE DIA_NASZ_325_Grimes_join   (C_INFO)
{
	npc         = NASZ_325_Grimes;
 	nr          = 2;
 	condition   = DIA_NASZ_325_Grimes_join_Condition;
 	information = DIA_NASZ_325_Grimes_join_Info;
 	permanent   = FALSE;
 	description = "ZA MN¥, KOPACZU!";
};

FUNC INT DIA_NASZ_325_Grimes_join_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_318_Gobby_daj))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_325_Grimes_join_Info()
{
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_join_15_00"); //ZA MN¥, KOPACZU!
	AI_Output (self, other,"DIA_NASZ_325_Grimes_join_55_01"); //TAK, PANIE. OCZYWIŒCIE!

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow1");
	//self.aivar[AIV_PARTYMEMBER] = TRUE;
	Druzyna (NASZ_325_Grimes,1);
};

//*********************************************************************
//	Info Cave
//*********************************************************************
var int Grimes_Join;
var int Grimes_Ludzie;
var int Grimes_Ucieczka;

INSTANCE DIA_NASZ_325_Grimes_cave   (C_INFO)
{
	npc         = NASZ_325_Grimes;
 	nr          = 3;
 	condition   = DIA_NASZ_325_Grimes_cave_Condition;
 	information = DIA_NASZ_325_Grimes_cave_Info;
 	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_NASZ_325_Grimes_cave_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_325_Grimes_join)
		&& (Npc_GetDistToWP	(NASZ_325_Grimes, "NASZ_BANDYCI_WODOSPAD_04") > 2000))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_325_Grimes_cave_Info()
{
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_15_00"); //No dobra. Mo¿e wreszcie mi o wszystkim powiesz?

	Info_ClearChoices (DIA_NASZ_325_Grimes_cave);

		Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Do³¹czy³em do bandytów, by ich unicestwiæ.", DIA_NASZ_325_Grimes_cave_join);
		Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "W Górniczej Dolinie wci¹¿ s¹ ludzie.", DIA_NASZ_325_Grimes_cave_ludzie);
		Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Uciek³em z kopalni.", DIA_NASZ_325_Grimes_cave_ucieczka);

};

FUNC VOID DIA_NASZ_325_Grimes_cave_join()
{
	Grimes_Join = TRUE;
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_join_15_00"); //Do³¹czy³em do bandytów, by ich unicestwiæ.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_join_55_01"); //W takim razie ¿yczê ci powodzenia... To przebiegli i silni ludzie.
		
	if (Grimes_Ludzie == TRUE) && (Grimes_Ucieczka == TRUE) {
	Info_ClearChoices (DIA_NASZ_325_Grimes_cave);
	Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Dobra, idziemy.", DIA_NASZ_325_Grimes_cave_end);
	};
};

FUNC VOID DIA_NASZ_325_Grimes_cave_ludzie()
{
	Grimes_Ludzie = TRUE;
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_00"); //W Górniczej Dolinie wci¹¿ s¹ ludzie.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ludzie_55_01"); //W to nie trudno mi uwierzyæ. Przecie¿ Paladyni...
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_02"); //Nie ma Paladynów. Wielu z nich zginê³o albo uciek³o za prze³êcz.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ludzie_55_03"); //I zamek stoi teraz pusty?
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_04"); //Niezupe³nie. Zajêli go orkowie.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ludzie_55_05"); //Orkowie! Te bestie wci¹¿ nêkaj¹ nasz¹ rasê... Plugawe istoty.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ludzie_55_06"); //Ale mówi³eœ coœ o jakichœ ludziach?
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_07"); //Owszem. W Dolinie powsta³y trzy obozy: ³owców orków, myœliwych i bandytów.
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_08"); //Ten ostatni odkryliœmy ca³kiem niedawno, ale szczegó³ów dowiesz siê dopiero od Gestatha, przywódcy myœliwych.
	
	

	if (Grimes_Join == TRUE) && (Grimes_Ucieczka == TRUE) {
	Info_ClearChoices (DIA_NASZ_325_Grimes_cave);
	Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Dobra, idziemy.", DIA_NASZ_325_Grimes_cave_end);
	};
};

FUNC VOID DIA_NASZ_325_Grimes_cave_ucieczka()
{
	Grimes_Ucieczka = TRUE;
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ucieczka_15_00"); //Uciek³em z kopalni.
	AI_Output (other, self,"DIA_NASZ_325_Grimes_cave_ucieczka_55_01"); //Poza tym z pomoc¹ innych przyby³em do kopalni i zabi³em Marcosa.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ucieczka_15_02"); //To œwietna wiadomoœæ! Buc dosta³ za swoje.
	
	if (Grimes_Ludzie == TRUE) && (Grimes_Join == TRUE) {
	Info_ClearChoices (DIA_NASZ_325_Grimes_cave);
	Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Dobra, idziemy.", DIA_NASZ_325_Grimes_cave_end);
	};
};

FUNC VOID DIA_NASZ_325_Grimes_cave_end()
{

	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_end_15_00"); //Dobra, idziemy.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_end_55_01"); //Do bandytów?
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_end_15_02"); //Tak. Na razie pobêdziesz chwilê tam. Bêdê mia³ ciê na oku.
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_end_15_03"); //Ale nie martw siê. Ratunek nadchodzi.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Follow2");
};

//*********************************************************************
//	Info AfterAll
//*********************************************************************
INSTANCE DIA_NASZ_325_Grimes_AfterAll   (C_INFO)
{
	npc         = NASZ_325_Grimes;
 	nr          = 4;
 	condition   = DIA_NASZ_325_Grimes_AfterAll_Condition;
 	information = DIA_NASZ_325_Grimes_AfterAll_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_325_Grimes_AfterAll_Condition()
{
	if ((npc_knowsinfo (other, DIA_NASZ_308_Frut_koniec))
	 || (KAPITEL >= 3))
	&& (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

var int GrimesAfterAllOneTime;
FUNC VOID DIA_NASZ_325_Grimes_AfterAll_Info()
{
	if (KAPITEL < 3) {
		AI_Output (self,other ,"DIA_NASZ_325_Grimes_AfterAll_15_00"); //Ledwo ¿yjê...
	} else if (GrimesAfterAllOneTime == TRUE) {
		AI_Output (self,other ,"DIA_NASZ_325_Grimes_AfterAll_15_01"); //Dziêki za ratunek!
	} else {
		AI_Output (self, other,"DIA_NASZ_325_Grimes_AfterAll_15_02"); //A wiêc tak to sobie wszystko u³o¿y³eœ! Wyprowadzi³eœ z obozu najtwardsze sztuki, a myœliwi w tym czasie zaatakowali z zaskoczenia.
		AI_Output (self, other,"DIA_NASZ_325_Grimes_AfterAll_15_03"); //Szczerze mówi¹c przestraszy³em siê, gdy zobaczy³em groty strza³ lec¹ce niemal¿e prosto na mnie.
		AI_Output (other, self,"DIA_NASZ_325_Grimes_AfterAll_15_04"); //To nie by³ do koñca mój plan i mia³em sporo szczêœcia, ¿e uszed³em z tego z ¿yciem.
		AI_Output (self, other,"DIA_NASZ_325_Grimes_AfterAll_15_05"); //Najwa¿neijsze, ¿e wszystko siê uda³o, przyjacielu. Pamiêtaj o tym.
	};
	
	AI_StopProcessInfos (self);

};

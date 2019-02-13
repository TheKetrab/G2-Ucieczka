
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
	AI_Output (other, self,"DIA_NASZ_325_Grimes_siema_55_01"); //Cicho, bo jeszcze kto� nas us�yszy. Opowiem ci wszystko, gdy ju� b�dziemy na zewn�trz.
	AI_Output (other, self,"DIA_NASZ_325_Grimes_siema_55_02"); //P�ki co, musz� zabra� nowego niewolnika do obozu.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_siema_15_03"); //Jakiego obozu? Bandyt�w?
	AI_Output (other, self,"DIA_NASZ_325_Grimes_siema_55_04"); //Tak. Zabieram ciebie.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_siema_15_05"); //W porz�dku. Mam nadziej�, �e wiesz co robisz.

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
 	description = "ZA MN�, KOPACZU!";
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
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_join_15_00"); //ZA MN�, KOPACZU!
	AI_Output (self, other,"DIA_NASZ_325_Grimes_join_55_01"); //TAK, PANIE. OCZYWI�CIE!

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
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_15_00"); //No dobra. Mo�e wreszcie mi o wszystkim powiesz?

	Info_ClearChoices (DIA_NASZ_325_Grimes_cave);

		Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Do��czy�em do bandyt�w, by ich unicestwi�.", DIA_NASZ_325_Grimes_cave_join);
		Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "W G�rniczej Dolinie wci�� s� ludzie.", DIA_NASZ_325_Grimes_cave_ludzie);
		Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Uciek�em z kopalni.", DIA_NASZ_325_Grimes_cave_ucieczka);

};

FUNC VOID DIA_NASZ_325_Grimes_cave_join()
{
	Grimes_Join = TRUE;
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_join_15_00"); //Do��czy�em do bandyt�w, by ich unicestwi�.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_join_55_01"); //W takim razie �ycz� ci powodzenia... To przebiegli i silni ludzie.
		
	if (Grimes_Ludzie == TRUE) && (Grimes_Ucieczka == TRUE) {
	Info_ClearChoices (DIA_NASZ_325_Grimes_cave);
	Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Dobra, idziemy.", DIA_NASZ_325_Grimes_cave_end);
	};
};

FUNC VOID DIA_NASZ_325_Grimes_cave_ludzie()
{
	Grimes_Ludzie = TRUE;
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_00"); //W G�rniczej Dolinie wci�� s� ludzie.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ludzie_55_01"); //W to nie trudno mi uwierzy�. Przecie� Paladyni...
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_02"); //Nie ma Paladyn�w. Wielu z nich zgin�o albo uciek�o za prze��cz.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ludzie_55_03"); //I zamek stoi teraz pusty?
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_04"); //Niezupe�nie. Zaj�li go orkowie.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ludzie_55_05"); //Orkowie! Te bestie wci�� n�kaj� nasz� ras�... Plugawe istoty.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ludzie_55_06"); //Ale m�wi�e� co� o jakich� ludziach?
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_07"); //Owszem. W Dolinie powsta�y trzy obozy: �owc�w ork�w, my�liwych i bandyt�w.
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ludzie_15_08"); //Ten ostatni odkryli�my ca�kiem niedawno, ale szczeg��w dowiesz si� dopiero od Gestatha, przyw�dcy my�liwych.
	
	

	if (Grimes_Join == TRUE) && (Grimes_Ucieczka == TRUE) {
	Info_ClearChoices (DIA_NASZ_325_Grimes_cave);
	Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Dobra, idziemy.", DIA_NASZ_325_Grimes_cave_end);
	};
};

FUNC VOID DIA_NASZ_325_Grimes_cave_ucieczka()
{
	Grimes_Ucieczka = TRUE;
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_ucieczka_15_00"); //Uciek�em z kopalni.
	AI_Output (other, self,"DIA_NASZ_325_Grimes_cave_ucieczka_55_01"); //Poza tym z pomoc� innych przyby�em do kopalni i zabi�em Marcosa.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_ucieczka_15_02"); //To �wietna wiadomo��! Buc dosta� za swoje.
	
	if (Grimes_Ludzie == TRUE) && (Grimes_Join == TRUE) {
	Info_ClearChoices (DIA_NASZ_325_Grimes_cave);
	Info_AddChoice	  (DIA_NASZ_325_Grimes_cave, "Dobra, idziemy.", DIA_NASZ_325_Grimes_cave_end);
	};
};

FUNC VOID DIA_NASZ_325_Grimes_cave_end()
{

	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_end_15_00"); //Dobra, idziemy.
	AI_Output (self, other,"DIA_NASZ_325_Grimes_cave_end_55_01"); //Do bandyt�w?
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_end_15_02"); //Tak. Na razie pob�dziesz chwil� tam. B�d� mia� ci� na oku.
	AI_Output (other,self ,"DIA_NASZ_325_Grimes_cave_end_15_03"); //Ale nie martw si�. Ratunek nadchodzi.

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
		AI_Output (self,other ,"DIA_NASZ_325_Grimes_AfterAll_15_00"); //Ledwo �yj�...
	} else if (GrimesAfterAllOneTime == TRUE) {
		AI_Output (self,other ,"DIA_NASZ_325_Grimes_AfterAll_15_01"); //Dzi�ki za ratunek!
	} else {
		AI_Output (self, other,"DIA_NASZ_325_Grimes_AfterAll_15_02"); //A wi�c tak to sobie wszystko u�o�y�e�! Wyprowadzi�e� z obozu najtwardsze sztuki, a my�liwi w tym czasie zaatakowali z zaskoczenia.
		AI_Output (self, other,"DIA_NASZ_325_Grimes_AfterAll_15_03"); //Szczerze m�wi�c przestraszy�em si�, gdy zobaczy�em groty strza� lec�ce niemal�e prosto na mnie.
		AI_Output (other, self,"DIA_NASZ_325_Grimes_AfterAll_15_04"); //To nie by� do ko�ca m�j plan i mia�em sporo szcz�cia, �e uszed�em z tego z �yciem.
		AI_Output (self, other,"DIA_NASZ_325_Grimes_AfterAll_15_05"); //Najwa�neijsze, �e wszystko si� uda�o, przyjacielu. Pami�taj o tym.
	};
	
	AI_StopProcessInfos (self);

};

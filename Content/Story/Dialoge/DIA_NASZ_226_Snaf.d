var int WRZOD_KLUCZ;
var int HUNT_DRAX;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_EXIT   (C_INFO)
{
	npc         = NASZ_226_Snaf;
	nr          = 999;
	condition   = DIA_NASZ_226_Snaf_EXIT_Condition;
	information = DIA_NASZ_226_Snaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_226_Snaf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_226_Snaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_siema   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 1;
 	condition   = DIA_NASZ_226_Snaf_siema_Condition;
 	information = DIA_NASZ_226_Snaf_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_226_Snaf_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_226_Snaf_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_226_Snaf_siema_55_00"); //Nowy!
	AI_Output (self, other,"DIA_NASZ_226_Snaf_siema_15_01"); //Mog� ci w czym� pom�c?

};

//*********************************************************************
//	Info HelloPieczyste 
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_HelloPieczyste   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 1;
 	condition   = DIA_NASZ_226_Snaf_HelloPieczyste_Condition;
 	information = DIA_NASZ_226_Snaf_HelloPieczyste_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_226_Snaf_HelloPieczyste_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_HelloLutnia)
	&& (Npc_IsInState(self, ZS_TALK)))
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_226_Snaf_HelloPieczyste_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_HelloPieczyste_55_00"); //Cze�� Snaf, potrzebuj� pieczystego dla Gotha. Zosta�o ci co� na zbyciu?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_HelloPieczyste_15_01"); //Gdyby� przyszed� godzin� temu, to by� mo�e co� by si� osta�o, a tak to pozosta� pusty garnek i pe�ne brzuchy wszystkich w obozie.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_HelloPieczyste_15_02"); //Je�eli jednak chcesz, to mog� ci ugotowa� kolejn� porcj�, pod warunkiem, �e dostarczysz mi niezb�dne sk�adniki.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_HelloPieczyste_15_03"); //Potrzebuj� czterech bry�ek w�gla, osiem ciemnych grzyb�w, cztery kawa�ki surowego mi�sa, a tak�e butelk� wody i ginu.
	AI_Output (other, self,"DIA_NASZ_226_Snaf_HelloPieczyste_15_04"); //Nie jeste� pierwsz� osob�, kt�ra dzi� czego� ode mnie oczekuje. Postaram si� dostarczy� co potrzeba.

	Log_CreateTopic (TOPIC_Snaf_pieczen, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Snaf_pieczen, LOG_RUNNING);
	B_LogEntry (TOPIC_Snaf_pieczen, "Cztery bry�ki w�gla, osiem ciemnych grzyb�w, cztery kawa�ki surowego mi�sa, butelka wody i ginu. �atwizna, nie powinienem mie� k�opotu ze zdobyciem wszystkich sk�adnik�w.");

};

var int PieczysteSkladnikiPrzyniesione;
var int SnafPieczysteDay;
var int SnafPieczysteHour;
//*********************************************************************
//	Info PieczysteSkladniki 
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_PieczysteSkladniki   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 2;
 	condition   = DIA_NASZ_226_Snaf_PieczysteSkladniki_Condition;
 	information = DIA_NASZ_226_Snaf_PieczysteSkladniki_Info;
 	permanent   = TRUE;
 	description = "Co do tych sk�adnik�w...";
};

FUNC INT DIA_NASZ_226_Snaf_PieczysteSkladniki_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_HelloPieczyste)
	&& PieczysteSkladnikiPrzyniesione == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_226_Snaf_PieczysteSkladniki_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_PieczysteSkladniki_55_00"); //Co do tych sk�adnik�w...
	AI_Output (self, other,"DIA_NASZ_226_Snaf_PieczysteSkladniki_15_01"); //Tak?
	
	if(npc_hasitems(other,ItMi_Coal)>=4)
	&&(npc_hasitems(other,ItPl_Mushroom_01)>=8)
	&&(npc_hasitems(other,ItFoMuttonRaw)>=4)
	&&(npc_hasitems(other,ItFo_Water)>=1)
	&&(npc_hasitems(other,ItFo_Booze)>=1)
	{
		PieczysteSkladnikiPrzyniesione = TRUE;
		AI_Output (other, self,"DIA_NASZ_226_Snaf_PieczysteSkladniki_15_02"); //Prosz�, oto one.
		B_GiveInvItems(other,self,ItMi_Coal,4);
		B_GiveInvItems(other,self,ItPl_Mushroom_01,8);
		B_GiveInvItems(other,self,ItFoMuttonRaw,4);
		B_GiveInvItems(other,self,ItFo_Water,1);
		B_GiveInvItems(other,self,ItFo_Booze,1);
		
		B_GivePlayerXP(100);
		
		AI_Output (self, other,"DIA_NASZ_226_Snaf_PieczysteSkladniki_15_03"); //Fantastycznie! Ju� zabieram si� do pracy, przyjd� do mnie za dwie godziny, wtedy potrawa powinna by� gotowa.	
		B_LogEntry (TOPIC_Snaf_pieczen, "Przynios�em sk�adniki kucharzowi. Mam przyj�� do Snafa za dwie godziny po gotowe danie.");
		Npc_ExchangeRoutine (self, "CookingAllTheTime");
		
		SnafPieczysteDay  = Wld_GetDay();
		SnafPieczysteHour = Wld_GetTimeHour();
	}	
	
	else {
	
		AI_Output (other, self,"DIA_NASZ_226_Snaf_PieczysteSkladniki_15_04"); //Przypomnisz mi jeszcze raz, czego potrzebujesz?
		AI_Output (self, other,"DIA_NASZ_226_Snaf_PieczysteSkladniki_15_05"); //Jasne! Cztery bry�ki w�gla, osiem ciemnych grzyb�w, cztery kawa�ki surowego mi�sa, butelk� wody i butelk� ginu.	
	};

	
};

//*********************************************************************
//	Info PieczysteDone
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_PieczysteDone   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 2;
 	condition   = DIA_NASZ_226_Snaf_PieczysteDone_Condition;
 	information = DIA_NASZ_226_Snaf_PieczysteDone_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_226_Snaf_PieczysteDone_Condition()
{
	if (PieczysteSkladnikiPrzyniesione == TRUE)
	&& TimeIsUp(-1,2,SnafPieczysteDay,SnafPieczysteHour)
	{
		return TRUE;
	};
};
FUNC VOID DIA_NASZ_226_Snaf_PieczysteDone_Info()
{
	AI_Output (self, other,"DIA_NASZ_226_Snaf_PieczysteDone_55_00"); //Dobrze, �e jeste�. W�a�nie sko�czy�em przygotowywa� twoj� potraw�, prosz� oto dwa soczyste kawa�ki pieczystego.
	B_GiveInvItems(self,other,ItNa_PieczenDlaGotha,1);
	B_GiveInvItems(self,other,ItNa_PieczenSnafa,1);
	AI_Output (other, self,"DIA_NASZ_226_Snaf_PieczysteDone_15_01"); //Dwa kawa�ki? Nie podejrzewa�bym, i� Goth jest a� tak wielkim �ar�okiem.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_PieczysteDone_15_02"); //To prawda, potrafi zje�� najwi�cej ze wszystkich. Jednak tym razem druga porcja nie jest dla niego, a dla ciebie.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_PieczysteDone_15_03"); //Nale�y ci si� nagroda za fatyg�. Ponadto strasznie zmarnia�e� od naszego ostatniego spotkania, wi�c uzna�em, �e zechcia�by� wrzuci� co� dobrego na z�b.
	AI_Output (other, self,"DIA_NASZ_226_Snaf_PieczysteDone_15_04"); //Jak za czas�w Starego Obozu.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_PieczysteDone_15_05"); //Dzi�ki Snaf, milo wspominam twoj� kuchnie. Wybacz, ale teraz musz� ju� i��, bo stra�nik bramy zaraz padnie z g�odu. Do zobaczenia.
		
	Npc_ExchangeRoutine (self, "Start");
	Log_SetTopicStatus (TOPIC_Snaf_pieczen, LOG_SUCCESS);
	B_LogEntry (TOPIC_Snaf_pieczen, "W nagrod� dosta�o mi si� nawet kawa�ek pieczeni Snafa. Tego si� nie spodziewa�em.");

	
};

var int SnafGeroldPotrawkaDay;
var int SnafGeroldPotrawkaHour;
var int GeroldPotrawka_CheckSnaf;
//*********************************************************************
//	GeroldPotrawka
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_GeroldPotrawka   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 2;
 	condition   = DIA_NASZ_226_Snaf_GeroldPotrawka_Condition;
 	information = DIA_NASZ_226_Snaf_GeroldPotrawka_Info;
 	permanent   = FALSE;
 	description = "Potrzebuj� skorzysta� z twoich nieocenionych us�ug, przyjacielu.";
};

FUNC INT DIA_NASZ_226_Snaf_GeroldPotrawka_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_111_Gerold_GlodQuest))
	&& (Mis_GeroldGlod_Running == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_GeroldPotrawka_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_GeroldPotrawka_15_00"); //Potrzebuj� skorzysta� z twoich nieocenionych us�ug, przyjacielu.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_GeroldPotrawka_55_01"); //Czy�by chodzi�o o co� zwi�zanego z moj� profesj�?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_GeroldPotrawka_55_02"); //Ha! Zawsze kiedy chodzi o co� dobrego do jedzenia, przychodzicie do starego dobrego Snafa!
	AI_Output (self, other,"DIA_NASZ_226_Snaf_GeroldPotrawka_55_03"); //Na co masz ochot�?
	AI_Output (other, self,"DIA_NASZ_226_Snaf_GeroldPotrawka_55_04"); //Tym razem nie chodzi o posi�ek dla mnie, lecz dla pewnego paladyna z obozu �owc�w ork�w.
	AI_Output (other, self,"DIA_NASZ_226_Snaf_GeroldPotrawka_55_05"); //Sprawa jest powa�na, gdy� ten stwierdzi�, �e jak nie dostanie szybko czego� do zjedzenia, to zabierze si� za kor� okolicznych drzew.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_GeroldPotrawka_55_06"); //Mam pewien pomys�. Kiedy�, jeszcze przed moim pobytem w kolonii karnej, przygotowywa�em specjaln� potraw� dla pewnego bogatego kupca, kt�ry ci�gle skar�y� si� na g��d.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_GeroldPotrawka_55_07"); //Mog� przygotowa� takie samo danie, kt�re nieco za�agodzi dolegliwo�ci twojego przyjaciela, lecz potrzebuj� na to tak do trzech godzin.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_GeroldPotrawka_55_08"); //Obiecuj�, ze si� nie zawiedziesz!
	
	SnafGeroldPotrawkaDay  = Wld_GetDay();
	SnafGeroldPotrawkaHour = Wld_GetTimeHour();
	
	GeroldPotrawka_CheckSnaf = TRUE;
	
	B_LogEntry (TOPIC_Gerold_glod, "Snaf ugotuje specjaln� potraw�. Twierdzi, �e powinno nieco z�agodzi� dolegliwo�ci Gerolda.");
	Npc_ExchangeRoutine (self, "CookingAllTheTime");
};

//*********************************************************************
//	GeroldPotrawkaDone
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_GeroldPotrawkaDone   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 2;
 	condition   = DIA_NASZ_226_Snaf_GeroldPotrawkaDone_Condition;
 	information = DIA_NASZ_226_Snaf_GeroldPotrawkaDone_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_226_Snaf_GeroldPotrawkaDone_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_GeroldPotrawka))
	&& (Npc_IsInState(self, ZS_TALK))
	&& (TimeIsUp(-1,3,SnafGeroldPotrawkaDay,SnafGeroldPotrawkaHour)) // 3h
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_GeroldPotrawkaDone_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_GeroldPotrawkaDone_15_00"); //I jak? Danie gotowe?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_GeroldPotrawkaDone_55_01"); //Oczywi�cie, �ycz swojemu koledze smacznego ode mnie!
	
	Createinvitems(self, ItNa_PotrawkaDlaGerolda, 1);
	B_GiveInvItems(self, other, ItNa_PotrawkaDlaGerolda, 1);
	
	B_LogEntry (TOPIC_Gerold_glod, "Pora zanie�� posi�ek stra�nikowi!");
	Npc_ExchangeRoutine (self, "Start");
};




//*********************************************************************
//	Who
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_who   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 2;
 	condition   = DIA_NASZ_226_Snaf_who_Condition;
 	information = DIA_NASZ_226_Snaf_who_Info;
 	permanent   = FALSE;
 	description = "Jeste� my�liwym?";
};

FUNC INT DIA_NASZ_226_Snaf_who_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_who_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_who_15_00"); //Jeste� my�liwym?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_who_55_01"); //Je�li chodzi o to, czy przynale�� do obozu my�liwych, to tak. Ale je�li chodzi o wykonywan� profesj�, to sam widzisz, �e jestem kucharzem.

};

//*********************************************************************
//	What
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_what   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 3;
 	condition   = DIA_NASZ_226_Snaf_what_Condition;
 	information = DIA_NASZ_226_Snaf_what_Info;
 	permanent   = FALSE;
 	description = "Wydajesz jedzenie?";
};

FUNC INT DIA_NASZ_226_Snaf_what_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_what_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_what_15_00"); //Wydajesz jedzenie?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_what_55_01"); //Owszem, ale to nie wszystko.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_what_55_02"); //Powiniene� wiedzie�, �e porz�dny obiad rozwi�zuje j�zyk nawet najwi�kszym introwerytkom.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_what_55_03"); //Je�li masz jaki� problem i chcesz si� czegokolwiek dowiedzie�, to biegiem do mnie. Za nieznaczn� sumk� dowiem si� tego i owego.
	
	Log_CreateTopic (TOPIC_MysliwiTrader,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTrader,"Kucharz Snaf ch�tnie wymieni par� nowinek z obozu wzamian za z�oto.");
	

};

//*********************************************************************
//	UgotujeszCosDlaMnie
//*********************************************************************
func void Snaf_Shortage_of_ingredients() {
	AI_Output (self, other,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_brakskladnikow_55_00"); //Brak ci sk�adnik�w.
};

func void SnafSay_Momment() {
	AI_Output (self, other,"SnafSay_Momment_55_01"); //Chwileczk�!
};

func void SnafSay_Keep() {
	AI_Output (self, other,"SnafSay_Keep_55_02"); //Trzymaj. Smacznego.
};

func void Snaf_Make_Dish() {
	AI_StandUp (NASZ_226_Snaf);
	AI_UseMob (NASZ_226_Snaf, "CAULDRON", 1);
	AI_WAIT(NASZ_226_Snaf,4); //4 = sekundy
	AI_UseMob (NASZ_226_Snaf, "CAULDRON", -1);
	AI_TurnToNPC(NASZ_226_Snaf,hero);
	AI_GoToNPC(NASZ_226_Snaf,hero);
};

var int UgotujeszCosDlaMnieFirstTime;
INSTANCE DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 4;
 	condition   = DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_Condition;
 	information = DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_Info;
 	permanent   = TRUE;
 	description = "Ugotujesz co� dla mnie?";
};

FUNC INT DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_15_00"); //Ugotujesz co� dla mnie?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_55_01"); //Je�li masz przepis i sk�adniki, to tak!
	
	if(UgotujeszCosDlaMnieFirstTime == FALSE) {
		Log_CreateTopic (TOPIC_MysliwiTrader,LOG_NOTE);
		B_LogEntry (TOPIC_MysliwiTrader,"Kucharz Snaf ch�tnie wymieni par� nowinek z obozu wzamian za z�oto.");
		UgotujeszCosDlaMnieFirstTime = TRUE;
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
	Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, DIALOG_BACK, DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_Back);
	if(npc_hasitems (other, ItNa_Przepis_SerowyGulasz) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Serowy gulasz.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_SerowyGulasz); };
	if(npc_hasitems (other, ItNa_Przepis_ZupaZGrzybowKopalnianych) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa z grzyb�w kopalnianych.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZGrzybowKopalnianych); };
	if(npc_hasitems (other, ItNa_Przepis_Orkowy2) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa z orkowego przepisu.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZOrkowegoPrzepisu); };
	if(npc_hasitems (other, ItNa_Przepis_UdziecZDzikaPoLowiecku) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Udziec z dzika po �owiecku.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_UdziecZDzikaPoLowiecku); };
	if(npc_hasitems (other, ItNa_Przepis_ZupaMleczna) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa mleczna.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaMleczna); };
	if(npc_hasitems (other, ItNa_Przepis_ZupaGrzybowa) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa grzybowa.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaGrzybowa); };
	if(npc_hasitems (other, ItNa_Przepis_ZupaZDuzychGrzybow) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa z du�ych grzyb�w.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZDuzychGrzybow); };
	if(npc_hasitems (other, ItNa_Przepis_ZupaJarzynowaZJagodami) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa jarzynowa z jagodami.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaJarzynowaZJagodami); };
	if(npc_hasitems (other, ItNa_Przepis_ZupaSerowa) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa serowa.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaSerowa); };
	if(npc_hasitems (other, ItNa_Przepis_PrzysmakMysliwych) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "'Przysmak my�liwych.'",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_PrzysmakMysliwych); };
	if(npc_hasitems (other, ItNa_Przepis_KompotOwocowy) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Kompot owocowy.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_KompotOwocowy); };
	if(npc_hasitems (other, ItNa_Przepis_ZupaRybna) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa rybna.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaRybna); };
	if(npc_hasitems (other, ItNa_Przepis_GulaszMiesny) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Gulasz mi�sny.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_GulaszMiesny); };
	if(npc_hasitems (other, ItNa_Przepis_PotrawkaZeScierwojada) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Potrawka ze �cierwojada.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_PotrawkaZeScierwojada); };
	if(npc_hasitems (other, ItNa_Przepis_ZupaPiwna) >=1) { Info_AddChoice (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie, "Zupa piwna.",DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaPiwna); };

};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_Back ()
{
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_SerowyGulasz ()
{
	if(npc_hasitems(other, ItFo_Cheese) >= 4)
	&&(npc_hasitems(other, ItPl_Planeberry) >= 2)
	&&(npc_hasitems(other, ItFo_Milk) >= 1)
	&&(npc_hasitems(other, ItFo_Water) >= 1)
	&&(npc_hasitems(other, ItFo_Apple) >= 1)
	&&(npc_hasitems(other, ItFo_Wine) >= 1)
	{
		B_GiveInvItems (other, self, ItFo_Cheese, 4);
		B_GiveInvItems (other, self, ItPl_Planeberry, 2);
		B_GiveInvItems (other, self, ItFo_Milk, 1);
		B_GiveInvItems (other, self, ItFo_Water, 1);
		B_GiveInvItems (other, self, ItFo_Apple, 1);
		B_GiveInvItems (other, self, ItFo_Wine, 1);
		
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_SerowyGulasz_55_00"); //Serowy gulasz.
		SnafSay_Momment();
		Snaf_Make_Dish();
		SnafSay_Keep();
		Createinvitems (self, ItNa_SerowyGulasz, 1);
		B_GiveInvItems (self, other, ItNa_SerowyGulasz, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZGrzybowKopalnianych ()
{
	if(npc_hasitems(other, ItNa_KopalnianyGrzyb) >= 6)
	&&(npc_hasitems(other, ItFo_Bread) >= 1)
	&&(npc_hasitems(other, ItPl_Health_Herb_03) >= 4)
	&&(npc_hasitems(other, ItAt_Sting) >= 1)
	{
		B_GiveInvItems (other, self, ItNa_KopalnianyGrzyb, 6);
		B_GiveInvItems (other, self, ItFo_Bread, 1);
		B_GiveInvItems (other, self, ItPl_Health_Herb_03, 4);
		B_GiveInvItems (other, self, ItAt_Sting, 1);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZGrzybowKopalnianych_55_00"); //Zupa z grzyb�w kopalnianych.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_ZupaZGrzybowKopalnianych, 1);
		B_GiveInvItems (self, other, ItNa_ZupaZGrzybowKopalnianych, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

var int SnafZupaZOrkowegoPrzepisuOneTime;
FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZOrkowegoPrzepisu ()
{
	if (npc_hasitems(other, ItFoMutton) >= 3)
	&& (npc_hasitems(other, ItAt_Meatbugflesh) >= 5)
	&& (npc_hasitems(other, ItFo_Apple) >= 2)
	&& (npc_hasitems(other, ItFo_Booze) >= 1)
	&& (npc_hasitems(other, ItNa_Losos) >= 1)
	&& (npc_hasitems(other, ItNa_FriedMushroom_02) >= 1)
	{
		B_GiveInvItems (other, self, ItFoMutton, 3);
		B_GiveInvItems (other, self, ItAt_Meatbugflesh, 5);
		B_GiveInvItems (other, self, ItFo_Apple, 2);
		B_GiveInvItems (other, self, ItFo_Booze, 1);
		B_GiveInvItems (other, self, ItNa_Losos, 1);
		B_GiveInvItems (other, self, ItNa_FriedMushroom_02, 1);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZOrkowegoPrzepisu_55_00"); //Zupa z orkowego przepisu.

		if (SnafZupaZOrkowegoPrzepisuOneTime == FALSE) {
			B_UseFakeScroll();
			AI_Output (self, other,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZOrkowegoPrzepisu_55_01"); //Ale� to b�dzie obrzydliwe. Ju� czuj� ten zapach wydobywaj�cy si� z kot�a.
			AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZOrkowegoPrzepisu_55_02"); //Nie chcesz widzie�, jak to jem... To jak. Podejmiesz si� wyzwania przyrz�dzenia takiej potrawy?
			SnafZupaZOrkowegoPrzepisuOneTime = TRUE;
		};

		SnafSay_Momment();
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_ZupaZOrkowegoPrzepisu, 1);
		B_GiveInvItems (self, other, ItNa_ZupaZOrkowegoPrzepisu, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};


FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_UdziecZDzikaPoLowiecku ()
{
	if(npc_hasitems(other, ItNa_MiesoDzika) >= 6)
	
	{
		B_GiveInvItems (other, self, ItNa_MiesoDzika, 6);
	
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_UdziecZDzikaPoLowiecku_55_00"); //Udziec z dzika po �owiecku.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_UdziecZDzikaPoLowiecku, 1);
		B_GiveInvItems (self, other, ItNa_UdziecZDzikaPoLowiecku, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaMleczna ()
{
	if(npc_hasitems(other, Itfo_milk) >= 1)
	&&(npc_hasitems(other, ItPl_Forestberry) >= 2) // nie wiem kt�ra jagoda (mo�e ta z bg? :Thinking:), wi�c dam le�n� i poln�
	&&(npc_hasitems(other, ItPl_Planeberry) >= 2)
	{

		B_GiveInvItems (other, self, Itfo_milk, 1);
		B_GiveInvItems (other, self, ItPl_Forestberry, 2);
		B_GiveInvItems (other, self, ItPl_Planeberry, 2);
	//	B_GiveInvItems (other, self, ItFo_Bread, 2);
	//	B_GiveInvItems (other, self, ItPl_Health_Herb_03, 1);
	//	B_GiveInvItems (other, self, ItAt_Sting, 1);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaMleczna_55_00"); //Zupa mleczna.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_ZupaMleczna, 1);
		B_GiveInvItems (self, other, ItNa_ZupaMleczna, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaGrzybowa ()
{
	if(npc_hasitems(other, ItPl_Mushroom_01) >= 5)
	&&(npc_hasitems(other, ItPl_Blueplant) >= 2)
	&&(npc_hasitems(other, ItFoMutton) >= 1)
	&&(npc_hasitems(other, ItFo_Bread) >= 1)
	{
		B_GiveInvItems (other, self, ItPl_Mushroom_01, 5);
		B_GiveInvItems (other, self, ItPl_Blueplant, 2);
		B_GiveInvItems (other, self, ItFoMutton, 1);
		B_GiveInvItems (other, self, ItFo_Bread, 1);
		
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaGrzybowa_55_00"); //Zupa grzybowa.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_ZupaGrzybowa, 1);
		B_GiveInvItems (self, other, ItNa_ZupaGrzybowa, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZDuzychGrzybow ()
{
	if(npc_hasitems(other, Itfo_wine) >= 1)
	&&(npc_hasitems(other, ItFo_water) >= 2)
	&&(npc_hasitems(other, ItPl_Mushroom_02) >= 2)

	{

		B_GiveInvItems (other, self, Itfo_wine, 1);
		B_GiveInvItems (other, self, ItFo_water, 2);
		B_GiveInvItems (other, self, ItPl_Mushroom_02, 2);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaZDuzychGrzybow_55_00"); //Zupa z du�ych grzyb�w.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_ZupaZDuzychGrzybow , 1);
		B_GiveInvItems (self, other, ItNa_ZupaZDuzychGrzybow, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaJarzynowaZJagodami ()
{
	if(npc_hasitems(other, ItPl_Health_Herb_02) >= 2)
	&&(npc_hasitems(other, ItPl_Mana_Herb_01) >= 2)
	&&(npc_hasitems(other, ItPl_Beet) >= 1)
	&&(npc_hasitems(other, ItPl_Forestberry) >= 2) // TODO: nie wiem kt�ra jagoda (mo�e ta z bg? :Thinking:), wi�c dam le�n� i poln�
	&&(npc_hasitems(other, ItPl_Planeberry) >= 2)
	{
		B_GiveInvItems (other, self, ItPl_Health_Herb_02, 2);
		B_GiveInvItems (other, self, ItPl_Mana_Herb_01, 2);
		B_GiveInvItems (other, self, ItPl_Beet, 1);
		B_GiveInvItems (other, self, ItPl_Forestberry, 2);
		B_GiveInvItems (other, self, ItPl_Planeberry, 2);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaJarzynowaZJagodami_55_00"); //Zupa jarzynowa z jagodami.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_ZupaJarzynowaZJagodami, 1);
		B_GiveInvItems (self, other, ItNa_ZupaJarzynowaZJagodami, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaSerowa ()
{
	if(npc_hasitems(other, ItFo_Milk) >= 1)
	&&(npc_hasitems(other, ItFo_Bread) >= 1)
	&&(npc_hasitems(other, ItFo_Beer) >= 1)
	&&(npc_hasitems(other, ItFo_cheese) >= 3)
	{
		B_GiveInvItems (other, self, ItFo_Milk, 1);
		B_GiveInvItems (other, self, ItFo_Bread, 1);
		B_GiveInvItems (other, self, ItFo_Beer, 1);
		B_GiveInvItems (other, self, ItFo_cheese, 3);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaSerowa_55_00"); //Zupa serowa.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_ZupaSerowa, 1);
		B_GiveInvItems (self, other, ItNa_ZupaSerowa, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_PrzysmakMysliwych ()
{
	if(npc_hasitems(other, ItFoMuttonRaw) >= 3)
	&&(npc_hasitems(other, ItFo_Wine) >= 1)
	&&(npc_hasitems(other, ItFo_Apple) >= 3)
	&&(npc_hasitems(other, ItFo_Addon_Pfeffer_01) >= 1)
	{
		B_GiveInvItems (other, self, ItFoMuttonRaw, 3);
		B_GiveInvItems (other, self, ItFo_Wine, 1);
		B_GiveInvItems (other, self, ItFo_Apple, 3);
		B_GiveInvItems (other, self, ItFo_Addon_Pfeffer_01, 1);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_PrzysmakMysliwych_55_00"); //Przysmak my�liwych.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_PrzysmakMysliwych, 1);
		B_GiveInvItems (self, other, ItNa_PrzysmakMysliwych, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_KompotOwocowy ()
{
	if(npc_hasitems(other, ItFo_Apple) >= 2)
//	&&(npc_hasitems(other, ItFo_Water) >= 2)
	&&(npc_hasitems(other, ItPl_Forestberry) >= 3)
	&&(npc_hasitems(other, ItPl_Planeberry) >= 3)
	{
		B_GiveInvItems (other, self, ItFo_Apple, 2);
		B_GiveInvItems (other, self, ItPl_Forestberry, 3);
		B_GiveInvItems (other, self, ItPl_Planeberry, 3);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_KompotOwocowy_55_00"); //Kompot owocowy.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_KompotOwocowy, 1);
		B_GiveInvItems (self, other, ItNa_KompotOwocowy, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaRybna ()
{
	if(npc_hasitems(other, ItFo_Fish) >= 2)
	&&(npc_hasitems(other, ItFo_Bread) >= 1)
	&&(npc_hasitems(other, ItFo_Wine) >= 1)
	{
		B_GiveInvItems (other, self, ItFo_Fish, 2);
		B_GiveInvItems (other, self, ItFo_Bread, 1);
		B_GiveInvItems (other, self, ItFo_Wine, 1);
		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaRybna_55_00"); //Zupa rybna.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItFo_FishSoup, 1);
		B_GiveInvItems (self, other, ItFo_FishSoup, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_GulaszMiesny ()
{
	if(npc_hasitems(other, ItFoMuttonRaw) >= 5)
	&&(npc_hasitems(other, ItPl_Mushroom_01) >= 2)
	
	{
		B_GiveInvItems (other, self, ItFoMuttonRaw, 5);
		B_GiveInvItems (other, self, ItPl_Mushroom_01, 2);

		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_GulaszMiesny_55_00"); //Gulasz mi�sny.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_GulaszMiesny, 1);
		B_GiveInvItems (self, other, ItNa_GulaszMiesny, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_PotrawkaZeScierwojada ()
{
	if(npc_hasitems(other, ItFoMuttonRaw) >= 4)
	&&(npc_hasitems(other, ItFo_Beer) >= 2)
	
	{
		B_GiveInvItems (other, self, ItFoMuttonRaw, 4);
		B_GiveInvItems (other, self, ItFo_Beer, 1);

		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_PotrawkaZeScierwojada55_00"); //Potrawka ze �cierwojada.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_PotrawkaZeScierwojada, 1);
		B_GiveInvItems (self, other, ItNa_PotrawkaZeScierwojada, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};

FUNC VOID DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaPiwna ()
{
	if(npc_hasitems(other, ItFoMuttonRaw) >= 3)
	&&(npc_hasitems(other, ItFo_Beer) >= 4)

	{
		B_GiveInvItems (other, self, ItFoMuttonRaw, 3);
		B_GiveInvItems (other, self, ItFo_Beer, 4);

		
		AI_Output (other, self,"DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie_ZupaPiwna_55_00"); //Zupa piwna.
		SnafSay_Momment();	
		Snaf_Make_Dish();
		SnafSay_Keep();
		
		Createinvitems (self, ItNa_ZupaPiwna, 1);
		B_GiveInvItems (self, other, ItNa_ZupaPiwna, 1);
	}
	else {
		Snaf_Shortage_of_ingredients();
	};
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_UgotujeszCosDlaMnie);
};



//*********************************************************************
//	How
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_how   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 4;
 	condition   = DIA_NASZ_226_Snaf_how_Condition;
 	information = DIA_NASZ_226_Snaf_how_Info;
 	permanent   = FALSE;
 	description = "Jak si� tu znalaz�e�?";
};

FUNC INT DIA_NASZ_226_Snaf_how_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_how_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_how_15_00"); //Jak si� tu znalaz�e�?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_how_55_01"); //Dawno temu by�em kucharzem w Starym Obozie.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_how_55_02"); //Gdy Bariera upada�a... Wszystko dzia�o si� tak szybko. Do��czy�em do Bandyt�w i razem zaj�li�my bagna w krainie Jarkendar.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_how_55_03"); //G�upi ja! Mog�em tam pozosta� i mieszka� sobie z dobytkiem, jaki uda�o nam si� wsp�lnie z dawnymi skaza�cami stworzy�.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_how_55_04"); //Ale chcia�em odzyska� wszystkie moje przepisy i raz jeszcze skosztowa� piekielnika rosn�cego tutaj, w G�rniczej Dolinie. Zdecydowa�em, �e powr�c�.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_how_55_05"); //Akurat, gdy si� tutaj dosta�em, sta�o si� to wszystko z paladynami.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_how_55_06"); //Teraz gnij� tu po raz kolejny, z tym �e nie ogranicza mnie Bariera, a orkowie i zawalona g�azami prze��cz.

};

//*********************************************************************
//	Help
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_help   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 5;
 	condition   = DIA_NASZ_226_Snaf_help_Condition;
 	information = DIA_NASZ_226_Snaf_help_Info;
 	permanent   = FALSE;
 	description = "Mog� ci w czym� pom�c?";
};

FUNC INT DIA_NASZ_226_Snaf_help_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_how))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_help_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_help_15_00"); //Mog� ci w czym� pom�c?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_help_55_01"); //A tak!
	AI_Output (self, other,"DIA_NASZ_226_Snaf_help_55_02"); //Jemy tyle mi�sa �cierwojad�w, kretoszczur�w i z�baczy, �e wszyscy mamy ju� tego do��.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_help_55_03"); //Kiedy gotowa�em jeszcze dla kopaczy w Starym Obozie, opracowa�em przepis na potrawk� z chrz�szczy.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_help_55_04"); //Powinien dalej by� gdzie� w pobli�u mojego dawnego domu.
	AI_Output (other, self,"DIA_NASZ_226_Snaf_help_15_05"); //To znaczy gdzie?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_help_55_06"); //Ah, wszystkie nasze drewniane domy s� spalone... Mo�e arena jeszcze si� zachowa�a? Moja chata by�a w jej pobli�u.
	
	// TODO: przeorib�, �e Snaf pami�ta przepis na potrawk� z chrz�szczy... wi�c to musi byc przepis na cos innego super <- niech to jest kt�ry� z przepis�w specjalnych z It_Nasze_Receptures
	
	Log_CreateTopic (TOPIC_Snaf_przepis, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Snaf_przepis, LOG_RUNNING);
	B_LogEntry (TOPIC_Snaf_przepis, "Snaf chce, bym odszuka� jego przepis. Twierdzi, �e le�y gdzie� obok jego dawnej chaty, kt�ra niegdy� znajdowa�a si� w pobli�u areny.");
};

//*********************************************************************
//	Ingrediens
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_ingrediens   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 6;
 	condition   = DIA_NASZ_226_Snaf_ingrediens_Condition;
 	information = DIA_NASZ_226_Snaf_ingrediens_Info;
 	permanent   = FALSE;
 	description = "To chyba tw�j przepis.";
};

FUNC INT DIA_NASZ_226_Snaf_ingrediens_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_help)
		&& npc_hasitems (other, ItNa_Snaf_Przepis) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_ingrediens_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_ingrediens_15_00"); //To chyba tw�j przepis.
	B_GiveInvItems (other, self, ItNa_Snaf_Przepis, 1);
	AI_Output (self, other,"DIA_NASZ_226_Snaf_ingrediens_55_01"); //Nie chyba, tylko na pewno! Poznaj� to pismo.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_ingrediens_55_02"); //Troszk� zabrudzony... Ale szcz�sliwie pami�tam te sk�adniki, kt�rych nie wida�.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_ingrediens_55_03"); //Sk�adniki... no w�a�nie! Przynie� mi je.
	AI_Output (other, self,"DIA_NASZ_226_Snaf_ingrediens_15_04"); //Czego potrzebujesz?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_ingrediens_55_05"); //5 piekielnik�w, 10 mi�s chrz�szczy i jeden niebieski bez dla aromatu.
	AI_Output (other, self,"DIA_NASZ_226_Snaf_ingrediens_15_06"); //Sk�d mam wzi�� tyle chrz�szczy?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_ingrediens_55_07"); //No c�... Kiedy� do�� sporo by�o w Starym Obozie... Na Placu Wymian... Nie nie... Tam ju� ich nie b�dzie. Chrz�szcze nie przepadaj� za orkami.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_ingrediens_55_08"); //O! Ju� wiem, chata Cavalorna.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_ingrediens_55_09"); //Chocia� nie jestem pewien, czy znajdziesz ich tam a� dziesi��. Tak jak wspomnia�em, chrz�szcze nie lubi�, szczeg�lnie orkowych, odchod�w.
	AI_Output (other, self,"DIA_NASZ_226_Snaf_ingrediens_15_10"); //Ja te� nie lubi� i nie zamierzam si� w takich miejscach kr�ci�.

	B_GivePlayerXP (200);
	DodajReputacje (2,REP_MYSLIWI);
	B_LogEntry (TOPIC_Snaf_przepis, "Odda�em Snafowi przepis. Teraz musz� donie�� sk�adniki: 5 piekielnik�w, 10 mi�s z chrz�szczy i niebieski bez. Chrz�szcze przebywaj� na terenach, gdzie nie ma ork�w. Jako takie miejsce Snaf wskaza� chat� Cavalorna.");
};

//*********************************************************************
//	Done
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_done   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 7;
 	condition   = DIA_NASZ_226_Snaf_done_Condition;
 	information = DIA_NASZ_226_Snaf_done_Info;
 	permanent   = FALSE;
 	description = "Oto twoje sk�adniki.";
};

FUNC INT DIA_NASZ_226_Snaf_done_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_ingrediens)
		&& npc_hasitems (other, ItPl_Mushroom_01) >=5
		&& npc_hasitems (other, ItAt_Meatbugflesh) >=10
		&& npc_hasitems (other, ItPl_Blueplant) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_done_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_done_15_00"); //Oto twoje sk�adniki.
	B_GiveInvItems (other, self, ItPl_Mushroom_01, 5);
	B_GiveInvItems (other, self, ItAt_Meatbugflesh, 10);
	B_GiveInvItems (other, self, ItPl_Blueplant, 1);
	AI_Output (self, other,"DIA_NASZ_226_Snaf_done_55_01"); //S� wszystkie. Masz tu troch� z�ota w nagrod�.
	Createinvitems (self, ItMi_Gold, 50);
	B_GiveInvItems (self, other, ItMi_Gold, 50);
	AI_Output (self, other,"DIA_NASZ_226_Snaf_done_55_02"); //�wietnie si� spisa�e�. Przyjd� jutro, a dostaniesz ca�� mis� potrawki!
	AI_Output (other, self,"DIA_NASZ_226_Snaf_done_15_03"); //Z pewno�ci� nie przegapi� szansy skosztowania takiego... smako�yku.

	DodajReputacje (1, REP_MYSLIWI);
	B_GivePlayerXP (200);
	B_LogEntry (TOPIC_Snaf_przepis, "Odda�em Snafowi sk�adniki. Mog� przyj�� jutro po talerz tej potrawy.");
	Log_SetTopicStatus (TOPIC_Snaf_przepis, LOG_SUCCESS);
	// TODO: zrobi� przyj�cie po potrawk� na drugi dzie�
};

var int SnafEatDay;
var int LosowaniePotrawy;
//*********************************************************************
//	Jedzenie
//*********************************************************************
INSTANCE DIA_NASZ_226_Snaf_jedzenie   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 9;
 	condition   = DIA_NASZ_226_Snaf_jedzenie_Condition;
 	information = DIA_NASZ_226_Snaf_jedzenie_Info;
 	permanent   = FALSE;
 	description = "Chcia�bym zje�� co� porz�dnego.";
};

FUNC INT DIA_NASZ_226_Snaf_jedzenie_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_ingrediens)
		&& npc_hasitems (other, ItPl_Mushroom_01) >=5
		&& npc_hasitems (other, ItAt_Meatbugflesh) >=10
		&& npc_hasitems (other, ItPl_Blueplant) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_jedzenie_Info()
{	
	AI_Output (other ,self,"DIA_NASZ_226_Snaf_jedzenie_15_00"); //Chcia�bym zje�� co� porz�dnego.

	if (hero.guild == GIL_OUT) || (Npc_HasItems(other, ItMi_Gold) >= 10)
	{
	
		if (SnafEatDay != Wld_GetDay())
		{
			if (hero.guild != GIL_OUT)
			{
				B_GiveInvItems (other, self, ItMi_Gold,10);
			};

			SnafEatDay = Wld_GetDay ();

			//Losuje potraw�
			LosowaniePotrawy = Hlp_Random (100);

			if (LosowaniePotrawy >= 80) && (npc_knowsinfo (other, DIA_NASZ_226_Snaf_done))
			{
				AI_Output (self ,other,"DIA_NASZ_226_Snaf_jedzenie_17_01"); //Dzi� potrawka z chrz�szcza.
				B_GiveInvItems (self, other, ItNa_PotrawkaZChrzaszcza, 1);
			}
			else if (LosowaniePotrawy >= 70)
			{
				AI_Output (self ,other,"DIA_NASZ_226_Snaf_jedzenie_17_02"); //Gulasz.
				B_GiveInvItems (self, other, ItFo_Stew, 1);
			}
			else if (LosowaniePotrawy >=50)
			{
				AI_Output (self ,other,"DIA_NASZ_226_Snaf_jedzenie_17_03"); //Dzisiaj mistrz Snaf serwuje zup� rybn�!
				B_GiveInvItems (self, other, ItFo_FishSoup, 1);

			}
			else if (LosowaniePotrawy >=30)
			{
				AI_Output (self ,other,"DIA_NASZ_226_Snaf_jedzenie_17_04"); //Zupa grzybowa, smacznego!
				B_GiveInvItems (self, other, ItNa_ZupaGrzybowa, 1);

			}
			else if (LosowaniePotrawy >=15)
			{
				AI_Output (self ,other,"DIA_NASZ_226_Snaf_jedzenie_17_05"); //We� kie�bas�. Tylko nie narzekaj, jak wi�kszo��!
				B_GiveInvItems (self, other, ItFo_Sausage, 1);

			}
			else if (LosowaniePotrawy >=0)
			{
				AI_Output (self ,other,"DIA_NASZ_226_Snaf_jedzenie_17_06"); //2 bohenki chleba, tylko tyle dzisiaj.
				B_GiveInvItems (self, other, ItFo_Bread, 2);

			};
		
		}
		else
		{
			AI_Output (self ,other,"DIA_NASZ_226_Snaf_jedzenie_17_07"); //Dosta�e� ju� swoj� dzisiejsz� porcj�. Wr�� jutro!
		};
		
	}
	else
	{
		AI_Output (self ,other,"DIA_NASZ_226_Snaf_jedzenie_17_08"); //Ne ma z�ota, nie ma �arcia!
	};
};		



//*********************************************************************
//	Infos
//*********************************************************************
var int Snaf_Aran;
var int Snaf_Drax;
var int Snaf_Pily;

INSTANCE DIA_NASZ_226_Snaf_infos   (C_INFO)
{
	npc         = NASZ_226_Snaf;
 	nr          = 10;
 	condition   = DIA_NASZ_226_Snaf_infos_Condition;
 	information = DIA_NASZ_226_Snaf_infos_Info;
 	permanent   = TRUE;
 	description = "Potrzebuj� informacji.";
};

FUNC INT DIA_NASZ_226_Snaf_infos_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_226_Snaf_what))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_226_Snaf_infos_Info()
{
	AI_Output (other, self,"DIA_NASZ_226_Snaf_infos_15_00"); //Potrzebuj� informacji.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_infos_55_01"); //Wi�c otw�rz sakiewk�...

	Info_ClearChoices (DIA_NASZ_226_Snaf_infos);
	Info_AddChoice 		(DIA_NASZ_226_Snaf_infos,	DIALOG_BACK		,DIA_NASZ_226_Snaf_infos_Back);

	if (GESTATH_ARAN == TRUE) && (npc_hasitems (other, ItMi_Gold) >= 30) && (Snaf_Aran == FALSE) {
		Info_AddChoice	  (DIA_NASZ_226_Snaf_infos, "Kto chcia�by pe�ni� wart� z Aranem? (30 szt. z�ota)", DIA_NASZ_226_Snaf_infos_aran);
	};
	if (npc_knowsinfo (other, DIA_NASZ_212_Drax_siema)) && (npc_hasitems (other, ItMi_Gold) >= 20) && (Snaf_Drax == FALSE) {
		Info_AddChoice	  (DIA_NASZ_226_Snaf_infos, "Z wi�zienia zwia� Drax. (20 szt. z�ota)", DIA_NASZ_226_Snaf_infos_drax);
	};
	if (npc_knowsinfo (other, DIA_NASZ_222_Cappel_zadanie)) && (npc_hasitems (other, ItMi_Gold) >= 20) && !(npc_knowsinfo (other, DIA_NASZ_222_Cappel_koniec)) && (Snaf_Pily == FALSE) {
		Info_AddChoice	  (DIA_NASZ_226_Snaf_infos, "Nie wiesz, gdzie mog� znale�� pi�y? (20 szt. z�ota)", DIA_NASZ_226_Snaf_infos_pily);
	};

};

FUNC VOID DIA_NASZ_226_Snaf_infos_Back ()
{
	Info_ClearChoices (DIA_NASZ_226_Snaf_infos);
};

FUNC VOID DIA_NASZ_226_Snaf_infos_aran()
{

	AI_Output (other,self ,"DIA_NASZ_226_Snaf_infos_aran_15_00"); //Kto chcia�by pe�ni� wart� z Aranem?
	B_GiveInvItems (other, self, ItMI_gold, 30);
	AI_Output (self, other,"DIA_NASZ_226_Snaf_infos_aran_55_01"); //Aran? Ten gadu�a?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_infos_aran_55_02"); //Znam tylko jednego kandydata... Jest zamkni�ty na szczycie wielkiego domu.
	AI_Output (other,self ,"DIA_NASZ_226_Snaf_infos_aran_15_03"); //Kto i dlaczego tam jest?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_infos_aran_55_04"); //Przekonasz si� sam, gdy ju� tam wejdziesz.
	AI_Output (self, other,"DIA_NASZ_226_Snaf_infos_aran_55_05"); //Ratford ma klucz. Chocia� na pewno nie odda ci go za darmo... Wypuszczenie tego cz�owieka mo�e okaza� si� wielk� katastrof�!

	Snaf_Aran = TRUE;
	WRZOD_KLUCZ = TRUE;
	B_LogEntry (TOPIC_Aran_quest, "Snaf twierdzi, �e powinienem pogada� z Ratfordem w sprawie klucza do szczytu wielkiego domu.");
	
};

FUNC VOID DIA_NASZ_226_Snaf_infos_drax()
{

	AI_Output (other,self ,"DIA_NASZ_226_Snaf_infos_drax_15_00"); //Z wi�zienia zwia� Drax.
	B_GiveInvItems (other, self, ItMI_gold, 20);
	AI_Output (self, other,"DIA_NASZ_226_Snaf_infos_drax_55_01"); //I co w zwi�zku z tym?
	AI_Output (other, self,"DIA_NASZ_226_Snaf_infos_drax_55_02"); //Gdzie mam go szuka�?
	AI_Output (self, other,"DIA_NASZ_226_Snaf_infos_drax_55_03"); //Hmm... Zapytaj Hunta. Kiedy� polowali razem. Mo�e on b�dzie co� wiedzia�?

	HUNT_DRAX = TRUE;
	Snaf_Drax = TRUE;
	B_LogEntry (TOPIC_Drax_ucieczka, "Snaf poradzi� mi, bym zapyta� Hunta o prawdopodobne miejsce pobytu Draxa.");
};

FUNC VOID DIA_NASZ_226_Snaf_infos_pily()
{

	AI_Output (other,self ,"DIA_NASZ_226_Snaf_infos_pily_15_00"); //Nie wiesz, gdzie mog� znale�� pi�y?
	B_GiveInvItems (other, self, ItMI_gold, 20);
	AI_Output (self, other,"DIA_NASZ_226_Snaf_infos_pily_55_01"); //Zapytaj Philla z obozu �owc�w ork�w. Napewno jak�� ma, skoro jest drwalem.
	Snaf_Pily = TRUE;

	B_LogEntry (TOPIC_Cappel_pily, "Snaf poleci� mi zapyta� o pi�y Philla, drwala �owc�w ork�w.");
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_226_Snaf_PICKPOCKET (C_INFO)
{
	npc			= NASZ_226_Snaf;
	nr			= 900;
	condition	= DIA_NASZ_226_Snaf_PICKPOCKET_Condition;
	information	= DIA_NASZ_226_Snaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_226_Snaf_PICKPOCKET_Condition()
{
	C_Beklauen (39);
};
 
FUNC VOID DIA_NASZ_226_Snaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_226_Snaf_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_226_Snaf_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_226_Snaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_226_Snaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_226_Snaf_PICKPOCKET_DoIt);
};

func void DIA_NASZ_226_Snaf_PICKPOCKET_DoIt()
{
	B_BeklauenGold(31);
	
	Info_ClearChoices (DIA_NASZ_226_Snaf_PICKPOCKET);
};
	
func void DIA_NASZ_226_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_226_Snaf_PICKPOCKET);
};
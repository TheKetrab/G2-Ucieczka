
func void Kirgo_Make_Potion() {
	AI_StandUp (NASZ_220_Kirgo);
	AI_UseMob (NASZ_220_Kirgo, "LAB", 1);
	AI_WAIT(NASZ_220_Kirgo,4); //4 = sekundy
	AI_UseMob (NASZ_220_Kirgo, "LAB", -1);
	AI_TurnToNPC(NASZ_220_Kirgo,hero);
	AI_GoToNPC(NASZ_220_Kirgo,hero);
};

func void Kirgo_Read_BookStand() {
	AI_StandUp (NASZ_220_Kirgo);
	AI_UseMob (NASZ_220_Kirgo, "BOOK", 1);
	AI_WAIT(NASZ_220_Kirgo,4); //4 = sekundy
	AI_UseMob (NASZ_220_Kirgo, "BOOK", -1);
	AI_TurnToNPC(NASZ_220_Kirgo,hero);
	AI_GoToNPC(NASZ_220_Kirgo,hero);
};

//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_EXIT   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
	nr          = 999;
	condition   = DIA_NASZ_220_Kirgo_EXIT_Condition;
	information = DIA_NASZ_220_Kirgo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_220_Kirgo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_220_Kirgo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_siema   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 1;
 	condition   = DIA_NASZ_220_Kirgo_siema_Condition;
 	information = DIA_NASZ_220_Kirgo_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_220_Kirgo_siema_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_siema_Info()
{
	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_siema_15_00"); //Jeste� alchemikiem?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_siema_55_01"); //Trafne spostrze�enie, aczkolwiek jestem samoukiem. Wszystko co wiem, wyczyta�em w ksi�gach Mag�w Ognia. Mia�em do nich dost�p, gdy Stary Ob�z upad� i na zamku pojawili si� paladyni.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_siema_55_02"); //Teraz mam kilka tych ksi��ek przy sobie. Obecnie jestem chyba jedyn� osob� w G�rniczej Dolinie, kt�ra babra si� w eliksirach.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_siema_55_03"); //Studiuj� te� r�ne ksi�gi magiczne, wi�c je�li chcesz, mog� zwi�kszy� twoje magiczne zdolno�ci.

	Log_CreateTopic (TOPIC_MysliwiTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTeacher,"Kirgo mo�e zwi�kszy� moje magiczne zdolno�ci.");	

};

//*********************************************************************
//	Info Kupic
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_kupic   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 2;
 	condition   = DIA_NASZ_220_Kirgo_kupic_Condition;
 	information = DIA_NASZ_220_Kirgo_kupic_Info;
 	permanent   = FALSE;
 	description = "Mog� co� u ciebie kupi�?";
};

FUNC INT DIA_NASZ_220_Kirgo_kupic_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_siema))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_kupic_Info()
{
	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_kupic_15_00"); //Mog� co� u ciebie kupi�?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_kupic_55_01"); //Oczywi�cie. Oferuj� mikstury uzdrawiaj�ce i wspomagaj�ce zdolno�ci magiczne.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_kupic_55_02"); //Je�li chcesz, mog� uwarzy� dla ciebie jakie� mikstury. Ale musisz za�atwi� mi sk�adniki. Policz� ci wtedy troch� taniej, ni� jakby� kupowa�.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_kupic_55_03"); //Ale od razu m�wi�: Nie spodziewaj si�, �e poradz� sobie ze wszystkim. Gdy raz pr�bowa�em sporz�dzi� eliksir si�y, niemal ca�y si� poparzy�em! Cholerny smoczy korze�...
	
	Log_CreateTopic (TOPIC_MysliwiTrader,LOG_NOTE);
	B_LogEntry (TOPIC_MysliwiTrader,"Kirgo sprzedaje mikstury i magiczne zwoje. Mo�e te� dla mnie uwarzy� niekt�re mikstury, ale pod warunkiem przyniesienia mu w�a�ciwych sk�adnik�w.");	
};

//*********************************************************************
//	Info Lista
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_lista   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 3;
 	condition   = DIA_NASZ_220_Kirgo_lista_Condition;
 	information = DIA_NASZ_220_Kirgo_lista_Info;
 	permanent   = FALSE;
 	description = "Przysy�a mnie Udar. Mam odebra� paczk�.";
};

FUNC INT DIA_NASZ_220_Kirgo_lista_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_siema))
	&& (npc_knowsinfo (other, DIA_NASZ_119_Udar_zadanie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_lista_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_lista_15_00"); //Przysy�a mnie Udar. Mam odebra� paczk�.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_lista_55_01"); //Nie spodziewa�em si�, �e przy�le tu kogo�. No c�, trzymaj.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_lista_55_02"); //Tylko niczego nie wypij! Udar nie by�by zadowolony. Ha, ha, ha!

	CreateInvItems (self, ItNa_PaczkaMikstur, 1);
	B_GiveInvItems (self, other, ItNa_PaczkaMikstur, 1);
};

//*********************************************************************
//	Info Oszust
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_oszust   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 4;
 	condition   = DIA_NASZ_220_Kirgo_oszust_Condition;
 	information = DIA_NASZ_220_Kirgo_oszust_Info;
 	permanent   = FALSE;
 	description = "Oszuka�e� mnie!";
};

FUNC INT DIA_NASZ_220_Kirgo_oszust_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_lista)
	&& Kirgo_Oszust)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_oszust_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_oszust_15_00"); //Oszuka�e� mnie!
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_oszust_55_01"); //Co? Niemo�liwe. Wszystko by�o wyliczone i przygotowane wcze�niej.
	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_oszust_15_02"); //Nie udawaj idioty. Udar uprzedzi� mnie, �e jeste� kr�taczem. Mia� racj�.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_oszust_55_03"); //Nie doceni�em ci�... Wiesz co? Postaram ci si� to wynagrodzi�. Masz tu brakuj�ce mikstury i jedn� w bonusie, tak na zgod�.

	CreateInvItems (self,ItPo_Health_01, 6);
	CreateInvItems (self,ItPo_Health_02, 3);
	CreateInvItems (self,ItPo_Mana_01, 4);
	CreateInvItems (self,ItPo_Speed, 1);
	CreateInvItems (self,ItPo_Perm_Health, 1);

	B_GiveInvItems (self, other, ItPo_Health_01, 6);
	B_GiveInvItems (self, other, ItPo_Health_02, 3);
	B_GiveInvItems (self, other, ItPo_Mana_01, 4);
	B_GiveInvItems (self, other, ItPo_Speed, 1);
	B_GiveInvItems (self, other, ItPo_Perm_Health, 1);

	B_LogEntry (TOPIC_Udar_mikstury, "Kirgo da� mi brakuj�ce mikstury i dorzuci� specjaln� dla mnie.");
	B_GivePlayerXP (100);

};

//*********************************************************************
//	Info Quest
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_quest   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 5;
 	condition   = DIA_NASZ_220_Kirgo_quest_Condition;
 	information = DIA_NASZ_220_Kirgo_quest_Info;
 	permanent   = FALSE;
 	description = "Mog� ci w czym� pom�c?";
};

FUNC INT DIA_NASZ_220_Kirgo_quest_Condition()
{
		return TRUE;
};

FUNC VOID DIA_NASZ_220_Kirgo_quest_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_quest_15_00"); //Mog� ci w czym� pom�c?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_quest_55_01"); //Oczywi�cie. Jeste� tu nowy, wi�c przyda ci si� praca, jak� mam dla ciebie.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_quest_55_02"); //Drax ma schizy. Nie bez powodu zreszt� siedzi w zamkni�ciu.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_quest_55_03"); //Zanim go jeszcze zamkn�li�my, pomaga� mi przy pracy. Cholera jasna, to by� b��d!
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_quest_55_04"); //Kt�rego� dnia zabra� z naszego magazynu menzurki i rozrzuci� je po ca�ym obozie. Przynie� mi je.
	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_quest_15_06"); //Ile ich jest?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_quest_55_07"); //Mo�e ich tam by� wi�cej, ale wystarczy okr�g�e dziesi��.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_quest_55_08"); //Tylko uwa�aj i gdzie� nie spadnij! Drax naprawd� zostawi� je w niebezpiecznych miejscach...

	Log_CreateTopic (TOPIC_Kirgo_menzurki, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Kirgo_menzurki, LOG_RUNNING);
	B_LogEntry (TOPIC_Kirgo_menzurki, "Drax, zanim zosta� zamkni�ty, rozrzuci� menzurki po obozie. Mam je odszuka� i przynie�� alchemikowi 10 menzurek.");

};

//*********************************************************************
//	Info Done
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_done   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 6;
 	condition   = DIA_NASZ_220_Kirgo_done_Condition;
 	information = DIA_NASZ_220_Kirgo_done_Info;
 	permanent   = FALSE;
 	description = "Dziesi�� menzurek, prosz�.";
};

FUNC INT DIA_NASZ_220_Kirgo_done_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_quest)
	&& npc_hasitems (other, ItMi_Flask) >=10)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_done_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_done_15_00"); //Dziesi�� menzurek, prosz�.
	B_giveinvitems (other, self, ItMi_Flask, 10);
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_done_55_01"); //Menzurki! Wspaniale. Po co maj� wala� si� po obozie, poniewiera� i brudzi�, skoro mo�na nape�ni� te ma�e buteleczki jakimi� miksturami.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_done_55_02"); //Dzi�ki tobie mog� przygotowa� kolejne mikstury. W nagrod� we� te trzy esencje lecznicze.

	Createinvitems (self, ItPo_Health_01, 3);
	B_giveinvitems (self, other, ItPo_Health_01, 3);

	B_LogEntry (TOPIC_Kirgo_menzurki, "Kirgo cieszy� si� jak dziecko, gdy da�em mu jego menzurki.");
	Log_SetTopicStatus (TOPIC_Kirgo_menzurki, LOG_SUCCESS);
	B_GivePlayerXP (300);
	DodajReputacje (1, REP_MYSLIWI);
};



var int KirgoTrfGolemDay;
//*********************************************************************
//	Info TrfGolem
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_TrfGolem   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 7;
 	condition   = DIA_NASZ_220_Kirgo_TrfGolem_Condition;
 	information = DIA_NASZ_220_Kirgo_TrfGolem_Info;
 	permanent   = FALSE;
 	description = "Czy m�g�by� przepisa� ten zw�j?";
};

FUNC INT DIA_NASZ_220_Kirgo_TrfGolem_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_Work1Done))
	&& (npc_hasitems(other,ItNa_TrfGolem)>=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_TrfGolem_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_TrfGolem_15_00"); //Czy m�g�by� przepisa� ten zw�j?
	B_giveinvitems (other, self, ItNa_TrfGolem, 1);
	Npc_RemoveInvItems(self, ItNa_TrfGolem, 1);
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_TrfGolem_55_01"); //Co to?
	B_UseFakeScroll();
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_TrfGolem_55_02"); //Czy to naprawd� przemiana w golema? Nigdy nie widzia�em czego� podobnego.	
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_TrfGolem_55_03"); //Keroloth chcia�by mie� armi� golem�w. Chce w ten spos�b sforsowa� mury zamku.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_TrfGolem_55_04"); //W porz�dku. Przyjrz� si� temu zwojowi i zobacz�, co da si� zrobi�. Wr�� do mnie za jakie� trzy dni.
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_TrfGolem_55_05"); //Do zobaczenia! I postaraj si� nie zniszczy� tej kartki. Keroloth m�g�by si� wkurzy�.

	KirgoTrfGolemDay = Wld_GetDay();
	B_LogEntry (TOPIC_Keroloth_golem, "Kirgo przyjrzy si� temu zwojowi i spr�buje go przepisa�. Mam si� u niego zjawi� za 3 dni.");
};

//*********************************************************************
//	Info TrfGolemTimeIsUp
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 7;
 	condition   = DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp_Condition;
 	information = DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp_Info;
 	permanent   = FALSE;
 	important	= TRUE;
};

FUNC INT DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_TrfGolem))
	&& TimeIsUp(3,-1,KirgoTrfGolemDay,0) // 3days
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp_Info()
{

	AI_Output (self, other,"DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp_55_01"); //D�ugo walczy�em z tym zwojem i niestety, odnios�em pora�k�.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp_55_02"); //Nie potrafi� przepisa� tego zwoju tak, by da�o si� go bezpiecznie u�y�. Mimo tego, �e zrobi�em idealn� kalk� kartki, co� si� pieprzy.
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp_55_03"); //Nie przejmuj si�. Chyba tylko Keroloth spo�r�d wszystkich �owc�w ork�w wierzy w powodzenie planu ataku na zamek golemami.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_TrfGolemTimeIsUp_55_04"); //Trzeba prawdziwego skryb� a nie amatora, �eby zrobi� zw�j z takim zakl�ciem. We� go. Oddaj� niezniszczony, tak jak prosi�e�.

	Createinvitems (self, ItNa_TrfGolem, 1);
	B_giveinvitems (self, other, ItNa_TrfGolem, 1);

	B_LogEntry (TOPIC_Keroloth_golem, "Niestety, alchemik nie poradzi� sobie ze stworzeniem magicznego zwoju. Pora pojawi� si� u Kerolotha.");
	
};



var int KirgoFerrosSnyDay;
//*********************************************************************
//	Info FerrosSny
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_FerrosSny   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 7;
 	condition   = DIA_NASZ_220_Kirgo_FerrosSny_Condition;
 	information = DIA_NASZ_220_Kirgo_FerrosSny_Info;
 	permanent   = FALSE;
 	description = "Potrzebuj� mikstury, kt�ra zwalczy koszmary.";
};

FUNC INT DIA_NASZ_220_Kirgo_FerrosSny_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_118_Ferros_PodkrazoneOczy))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_FerrosSny_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_FerrosSny_15_00"); //Potrzebuj� mikstury, kt�ra zwalczy koszmary.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_FerrosSny_55_01"); //Spokojnie, nie tak szybko. Jakie koszmary ma ta osoba i o kogo chodzi?
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_FerrosSny_55_02"); //�owca Feros ka�dej nocy podczas snu widzi sylwetki swoich zmar�ych towarzyszy, kt�rzy nie daj� mu spokoju.
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_FerrosSny_55_03"); //Jak tak dalej p�jdzie to w ko�cu zwariuje. Pomo�esz nam?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_FerrosSny_55_04"); //Znam Ferosa, to dobry wojownik. Postaram si� wam pom�c.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_FerrosSny_55_05"); //Widzia�em gdzie� w kt�rej� z moich ksi�g podobny przypadek.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_FerrosSny_55_06"); //Przyjd� jutro, a do tego czasu zbior� odpowiednie sk�adniki i uwarz� lekarstwo.

	KirgoFerrosSnyDay = Wld_GetDay();
	B_LogEntry (TOPIC_Ferros_sny, "Kirgo zgodzi� si� pom�c. Mam przyj�� do niego jutro i odebra� lekarstwo.");
};


//*********************************************************************
//	Info FerrosSnyReady
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_FerrosSnyReady   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 7;
 	condition   = DIA_NASZ_220_Kirgo_FerrosSnyReady_Condition;
 	information = DIA_NASZ_220_Kirgo_FerrosSnyReady_Info;
 	permanent   = FALSE;
 	description = "Gotowe?";
};

FUNC INT DIA_NASZ_220_Kirgo_FerrosSnyReady_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_FerrosSny))
	&& TimeIsUp(1,-1,KirgoFerrosSnyDay,-1) // 1day
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_FerrosSnyReady_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_FerrosSnyReady_15_00"); //Gotowe?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_FerrosSnyReady_55_01"); //Oczywi�cie, ale pami�taj: Nie wi�cej ni� trzy krople na dzie�, bo inaczej efekt b�dzie odwrotny do zamierzanego.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_FerrosSnyReady_55_02"); //Mo�e go od tego bole� g�owa, wi�c niech wtedy wypije troch� sch�odzonego mleka, to rozcie�czy nieco mikstur� w jego �o��dku.
	
	Createinvitems (self, ItNa_KropleFerros, 1);
	B_giveinvitems (self, other, ItNa_KropleFerros, 1);
	
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_FerrosSnyReady_55_03"); //Dzi�kuj� za pomoc. B�d� ci d�u�ny przys�ug�.
	

	B_LogEntry (TOPIC_Ferros_sny, "Dosta�em eliksir, czas wr�ci� do Ferosa.");
	
};

//*********************************************************************
//	Info Aran
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_aran   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 7;
 	condition   = DIA_NASZ_220_Kirgo_aran_Condition;
 	information = DIA_NASZ_220_Kirgo_aran_Info;
 	permanent   = FALSE;
 	description = "Aran potrzebuje lekarstwa na bol�c� nog�.";
};

FUNC INT DIA_NASZ_220_Kirgo_aran_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_216_Aran_QuestKapi3))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_aran_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_aran_15_00"); //Aran potrzebuje lekarstwa na bol�c� nog�.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_aran_55_01"); //B�l? Noga? Niech pomy�l�...
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_aran_55_02"); //Przynie� mi 8 �abich korzeni.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_aran_55_03"); //Te ro�linki rosn� w pobli�u rzeki na pniach drzew. Znajdziesz je bez problemu.

	B_LogEntry (TOPIC_Aran_noga, "Kirgo przygotuje lekarstwo, je�li przynios� mu 8 �abich korzeni. Rosn� w pobli�u rzeki na pniach drzew.");
};

//*********************************************************************
//	Info AranOk
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_aranok   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 8;
 	condition   = DIA_NASZ_220_Kirgo_aranok_Condition;
 	information = DIA_NASZ_220_Kirgo_aranok_Info;
 	permanent   = FALSE;
 	description = "Mam korzenie.";
};

FUNC INT DIA_NASZ_220_Kirgo_aranok_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_aran)
	&& npc_hasitems (other, ItNa_ZabiKorzen) >=8)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_aranok_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_aranok_15_00"); //Mam korzenie.
	B_giveinvitems (other, self, ItNa_ZabiKorzen, 8);
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_aranok_55_01"); //Daj mi sekundk�.
	Kirgo_Make_Potion();
	Createinvitems (self, ItNa_Aran_Lekarstwo, 1);
	B_giveinvitems (self, other, ItNa_Aran_Lekarstwo, 1);
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_aranok_55_02"); //Prosz�.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_aranok_55_03"); //Tylko tego nie pij, �le si� to dla ciebie sko�czy!

	B_GivePlayerXP (50);
	B_LogEntry (TOPIC_Aran_noga, "Alchemik uwarzy� lek. Ciekawe, czy zadzia�a?");
};

//*********************************************************************
//	Info Jeremiasz
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_jeremiasz   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 9;
 	condition   = DIA_NASZ_220_Kirgo_jeremiasz_Condition;
 	information = DIA_NASZ_220_Kirgo_jeremiasz_Info;
 	permanent   = FALSE;
 	description = "Potrafisz przygotowywa� lekarstwa uspokajaj�ce?";
};

FUNC INT DIA_NASZ_220_Kirgo_jeremiasz_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_127_Jeremiasz_Quest))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_jeremiasz_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_jeremiasz_15_00"); //Potrafisz przygotowywa� lekarstwa uspokajaj�ce?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_jeremiasz_55_01"); //Uspokajaj�ce? Bagienne ziele powinno...
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_jeremiasz_55_02"); //Nie, nie. Potrzebuj� naprawd� silnej mikstury.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_jeremiasz_55_03"); //W takim razie nie jestem w stanie ci pom�c, przykro mi.

};

//*********************************************************************
//	Info HelpWrzod
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_HelpWrzod   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 41;
 	condition   = DIA_NASZ_220_Kirgo_HelpWrzod_Condition;
 	information = DIA_NASZ_220_Kirgo_HelpWrzod_Info;
 	permanent   = FALSE;
 	description = "Nie wiesz przypadkiem, jak pom�c Wrzodowi?";
};

FUNC INT DIA_NASZ_220_Kirgo_HelpWrzod_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_225_Wrzod_Kap4Start))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_HelpWrzod_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_HelpWrzod_15_00"); //Nie wiesz przypadkiem, jak pom�c Wrzodowi?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_HelpWrzod_55_01"); //Chcesz, by w ko�cu si� zamkn��? Nie wiem, co mu doskwiera.
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_HelpWrzod_55_02"); //C�...
	AI_PlayAni (other,"R_SCRATCHHEAD");
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_HelpWrzod_55_03"); //Wrz�d mia� sen, w kt�rym... Zabawia� si� ze zwierz�tami.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_HelpWrzod_55_04"); //Aaa! S�ysza�em o pewnej miksturze �agodz�cej pop�d.
	AI_Output (other, self,"DIA_NASZ_220_Kirgo_HelpWrzod_55_05"); //Co ci przynie��?
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_HelpWrzod_55_06"); //Poczekaj, musz� znale�� przepis.
	//idzie szuka� przepisu
	Kirgo_Read_BookStand();
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_HelpWrzod_55_07"); //Dobra, s�uchaj: 5 piekielnik�w, rum, dwa rdesty polne i bry�ka rudy.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_HelpWrzod_55_08"); //Mam nadziej�, �e to pomo�e. Wszystkich wyka�czaj� te wrzaski.

	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Kirgo przygotuje mikstur� �agodz�c� pop�d, je�li przynios� mu sk�adniki: 5 piekielnik�w, rum, dwa rdesty polne i bry�k� rudy.");

};

//*********************************************************************
//	Info MamSkladnikiWrzod
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_MamSkladnikiWrzod   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 42;
 	condition   = DIA_NASZ_220_Kirgo_MamSkladnikiWrzod_Condition;
 	information = DIA_NASZ_220_Kirgo_MamSkladnikiWrzod_Info;
 	permanent   = FALSE;
 	description = "Mam wszystkie sk�adniki.";
};

FUNC INT DIA_NASZ_220_Kirgo_MamSkladnikiWrzod_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_HelpWrzod))
	&& (npc_hasitems (other, ItPl_Mushroom_01) >= 5)
	&& (npc_hasitems (other, ItFo_Addon_Rum) >= 1)
	&& (npc_hasitems (other, ItPl_Temp_Herb) >= 2)
	&& (npc_hasitems (other, ItMi_Nugget) >= 1)
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_MamSkladnikiWrzod_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MamSkladnikiWrzod_15_00"); //Mam wszystkie sk�adniki.
	B_GiveInvItems (self, other, ItPl_Mushroom_01, 5);
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 1);
	B_GiveInvItems (self, other, ItPl_Temp_Herb, 2);
	B_GiveInvItems (self, other, ItMi_Nugget, 1);
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_MamSkladnikiWrzod_55_01"); //Dobra, mikstura zaraz b�dzie gotowa.
	Kirgo_Make_Potion();
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_MamSkladnikiWrzod_55_02"); //Prosz�. Zobaczymy, mo�e si� uda.
	CreateInvItems (self, ItNa_Wrzod_Lekarstwo, 1);
	B_GiveInvItems (self, other, ItNa_Wrzod_Lekarstwo, 1);

	B_LogEntry (TOPIC_Wrzod_zwierzeta, "Mikstura gotowa. Teraz trzeba poda� j� Wrzodowi.");

};

//*********************************************************************
//	Info WrzodNieDziala
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_WrzodNieDziala   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 43;
 	condition   = DIA_NASZ_220_Kirgo_WrzodNieDziala_Condition;
 	information = DIA_NASZ_220_Kirgo_WrzodNieDziala_Info;
 	permanent   = FALSE;
 	description = "Lekarstwo nic nie da�o.";
};

FUNC INT DIA_NASZ_220_Kirgo_WrzodNieDziala_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_225_Wrzod_wypij))
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_WrzodNieDziala_Info()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_WrzodNieDziala_15_00"); //Lekarstwo nic nie da�o.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_WrzodNieDziala_55_01"); //Wygl�da na to, �e Wrz�d jest tak napalony, �e nic ju� mu nie pomo�e.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_WrzodNieDziala_55_02"); //Chyba �e spe�nienie jego marze�... Ale� to obrzydliwe!

};

///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_NASZ_220_Kirgo_TEACH_MANA		(C_INFO)
{
	npc			 = 	NASZ_220_Kirgo;
	nr 			 =  98;
	condition	 = 	DIA_NASZ_220_Kirgo_TEACH_MANA_Condition;
	information	 = 	DIA_NASZ_220_Kirgo_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chc� zwi�kszy� moj� magiczn� moc.";
};
func int DIA_NASZ_220_Kirgo_TEACH_MANA_Condition ()
{	
	if (other.attribute[ATR_MANA_MAX] < 50)
	{
		return TRUE;
	};
};

func void DIA_NASZ_220_Kirgo_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_NASZ_220_Kirgo_TEACH_MANA_15_00"); //Chc� zwi�kszy� moj� magiczn� moc.
		
		Info_ClearChoices   (DIA_NASZ_220_Kirgo_TEACH_MANA);	
		Info_AddChoice 		(DIA_NASZ_220_Kirgo_TEACH_MANA,DIALOG_BACK,DIA_NASZ_220_Kirgo_TEACH_MANA_BACK);		
		if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_220_Kirgo_TEACH_MANA,"Mana + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_220_Kirgo_TEACH_MANA_1); };
		if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_220_Kirgo_TEACH_MANA,"Mana + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_220_Kirgo_TEACH_MANA_5); };
};
FUNC VOID DIA_NASZ_220_Kirgo_TEACH_MANA_BACK()
{	
	Info_ClearChoices   (DIA_NASZ_220_Kirgo_TEACH_MANA);	
};
FUNC VOID DIA_NASZ_220_Kirgo_TEACH_MANA_1()
{
	if (hero.lp >= 1){ B_giveinvitems (other, self, ItMi_Gold, 5); };
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, 50);
	
	Info_ClearChoices   (DIA_NASZ_220_Kirgo_TEACH_MANA);	
	Info_AddChoice 		(DIA_NASZ_220_Kirgo_TEACH_MANA,DIALOG_BACK,DIA_NASZ_220_Kirgo_TEACH_MANA_BACK);		
	if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_220_Kirgo_TEACH_MANA,"Mana + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_220_Kirgo_TEACH_MANA_1); };
	if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_220_Kirgo_TEACH_MANA,"Mana + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_220_Kirgo_TEACH_MANA_5); };
};
FUNC VOID DIA_NASZ_220_Kirgo_TEACH_MANA_5()
{
	if (hero.lp >= 5){ B_giveinvitems (other, self, ItMi_Gold, 25); };
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, 50);
	
	Info_ClearChoices   (DIA_NASZ_220_Kirgo_TEACH_MANA);	
	Info_AddChoice 		(DIA_NASZ_220_Kirgo_TEACH_MANA,DIALOG_BACK,DIA_NASZ_220_Kirgo_TEACH_MANA_BACK);		
	if (npc_hasitems (other, ItMi_Gold) >= 5) { Info_AddChoice		(DIA_NASZ_220_Kirgo_TEACH_MANA,"Mana + 1. (1 PN, 5 szt. z�ota)",DIA_NASZ_220_Kirgo_TEACH_MANA_1); };
	if (npc_hasitems (other, ItMi_Gold) >= 25) { Info_AddChoice		(DIA_NASZ_220_Kirgo_TEACH_MANA,"Mana + 5. (5 PN, 25 szt. z�ota)",DIA_NASZ_220_Kirgo_TEACH_MANA_5); };
};

//*********************************************************************
//	Info MakePotion
//*********************************************************************
func void KirgoSay_ProszeBardzo() {
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_KirgoSay_ProszeBardzo_15_00"); //Prosz� bardzo.
};

INSTANCE DIA_NASZ_220_Kirgo_MakePotion   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 100;
 	condition   = DIA_NASZ_220_Kirgo_MakePotion_Condition;
 	information = DIA_NASZ_220_Kirgo_MakePotion_Info;
 	permanent   = TRUE;
 	description = "Uwarz dla mnie...";
};

FUNC INT DIA_NASZ_220_Kirgo_MakePotion_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_kupic))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Info()
{
	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_15_00"); //Uwarz dla mnie...

	Info_ClearChoices (DIA_NASZ_220_Kirgo_MakePotion);

		Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, DIALOG_BACK, DIA_NASZ_220_Kirgo_MakePotion_Back);

		if (npc_hasitems (other, ItMi_Gold) >=400) && (npc_hasitems (other, ItMi_Addon_WhitePearl) >=1) && (npc_hasitems (other, ItFo_Addon_Rum) >=1) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) && (npc_hasitems (other, ItMi_Nugget) >=1) && (WillKnowUroboros6 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Krople duszy: per�a, rum, rdest polny, bry�ka rudy, 400 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_KropleDuszy);
		};
		if (npc_hasitems (other, ItMi_Gold) >=400) && (npc_hasitems (other, ItPl_Dex_Herb_01) >=1) && (npc_hasitems (other, ItPl_Temp_Herb) >=2) && (npc_hasitems (other, ItMi_GoldNugget_Addon) >=1) && (npc_hasitems (other, ItMi_Pitch) >=1) && (WillKnowUroboros5 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Zmor� gwardzisty: goblinie jagody, 2 rdesty polne, bry�ka z�ota, smo�a, 400 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_ZmoraGwardzisty);
		};
		if (npc_hasitems (other, ItMi_Gold) >=400) && (npc_hasitems (other, ItPl_Mana_Herb_02) >=1) && (npc_hasitems (other, ItPl_Mushroom_02) >=3) && (npc_hasitems (other, ItAt_WaranFiretongue) >=1) && (npc_hasitems (other, ItMi_Coal) >=1) && (WillKnowUroboros4 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Ryk smoka: ogniste ziele, 3 du�e grzyby, j�zyk ognistego jaszczura, w�giel, 400 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_RykSmoka);
		};
		if (npc_hasitems (other, ItMi_Gold) >=50) && (npc_hasitems (other, ItNa_ZabiKorzen) >=2) && (npc_hasitems (other, ItPl_Mushroom_01) >=10) && (npc_hasitems (other, ItPl_Speed_Herb_01) >=1) && (npc_hasitems (other, ItMi_Sulfur) >=1) && (WillKnowUroboros3 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Mikstur� uspokajaj�c�: 2 �abie korzenie, 10 piekielnik�w, z�bate ziele, siarka, 50 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Uspokajajaca);
		};
		if (npc_hasitems (other, ItMi_Gold) >=400) && (npc_hasitems (other, ItPl_Health_Herb_01) >=6) && (npc_hasitems (other, ItPl_Dex_Herb_01) >=1) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) && (npc_hasitems (other, ItAt_ShadowHorn) >=1) && (WillKnowUroboros2 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Cie� cieniostwora: 6 ro�lin leczniczych, goblinie jagody, rdest polny, r�g cieniostwora, 400 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_CienCieniostwora);
		};

		/* -- bez eliksirow permanentnych
		if (npc_hasitems (other, ItMi_Gold) >=750) && (npc_hasitems (other, ItPl_Strength_Herb_01) >=1) && (npc_hasitems (other, ItPl_Perm_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Eliksir si�y: 1 smoczy korze�, 1 szczaw kr�lewski, 750 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Sila);
		};
		if (npc_hasitems (other, ItMi_Gold) >=750) && (npc_hasitems (other, ItPl_Dex_Herb_01) >=1) && (npc_hasitems (other, ItPl_Perm_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Eliksir zr�czno�ci: 1 porcja goblinich jag�d, 1 szczaw kr�lewski, 750 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Zrecznosc);
		};
		*/
		
		if (npc_hasitems (other, ItMi_Gold) >=40) && (npc_hasitems (other, ItPl_Mana_Herb_03) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Eliksir many: 2 ogniste korzenie, 1 rdest polny, 40 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Mana3);
		};
		if (npc_hasitems (other, ItMi_Gold) >=25) && (npc_hasitems (other, ItPl_Mana_Herb_02) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Ekstrakt many: 2 ogniste ziela, 1 rdest polny, 25 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Mana2);
		};
		if (npc_hasitems (other, ItMi_Gold) >=15) && (npc_hasitems (other, ItPl_Mana_Herb_01) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Esencj� many: 2 ogniste pokrzywy	, 1 rdest polny, 15 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Mana1);
		};
		if (npc_hasitems (other, ItMi_Gold) >=40) && (npc_hasitems (other, ItPl_Health_Herb_03) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Eliksir leczniczy: 2 korzenie lecznicze, 1 rdest polny, 40 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Health3);
		};
		if (npc_hasitems (other, ItMi_Gold) >=25) && (npc_hasitems (other, ItPl_Health_Herb_02) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Ekstrakt leczniczy: 2 ziela lecznicze, 1 rdest polny, 25 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Health2);
		};
		if (npc_hasitems (other, ItMi_Gold) >=15) && (npc_hasitems (other, ItPl_Health_Herb_01) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Esencj� lecznicz�: 2 ro�liny lecznicze, 1 rdest polny, 15 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Health1);
		};

};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Back()
{
	Info_ClearChoices (DIA_NASZ_220_Kirgo_MakePotion);
};

var int KropleDuszyFirstTime;
FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_KropleDuszy()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_KropleDuszy_15_00"); //Krople duszy.

	if (KropleDuszyFirstTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_KropleDuszy_15_01"); //Masz bardziej ochot� na rum, czy na bry�k� rudy?
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_KropleDuszy_15_02"); //Mam nadziej�, �e nie uwarz� ci trucizny.
		KropleDuszyFirstTime = TRUE;
	};
	
	B_GiveInvItems (other, self, ItMi_Gold, 400);
	B_GiveInvItems (other, self, ItMi_Addon_WhitePearl, 1);
	B_GiveInvItems (other, self, ItFo_Addon_Rum, 1);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 1);
	B_GiveInvItems (other, self, ItMi_Nugget, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItNa_KropleDuszy, 1);
	B_GiveInvItems (self, other, ItNa_KropleDuszy, 1);

	

		if (npc_hasitems (other, ItMi_Gold) >=400) && (npc_hasitems (other, ItMi_Addon_WhitePearl) >=1) && (npc_hasitems (other, ItFo_Addon_Rum) >=1) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) && (npc_hasitems (other, ItMi_Nugget) >=1) && (WillKnowUroboros6 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Krople duszy: per�a, rum, rdest polny, bry�ka rudy, 400 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_KropleDuszy);
		};

};

var int ZmoraGwardzistyFirstTime;
FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_ZmoraGwardzisty()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_ZmoraGwardzisty_15_00"); //Zmor� gwardzisty.

	if (ZmoraGwardzistyFirstTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_ZmoraGwardzisty_15_01"); //�e co, prosz�?
		AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_ZmoraGwardzisty_15_02"); //Mikstura fachu z�odziejskiego.
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_ZmoraGwardzisty_15_03"); //Nie zatruj si�.
		ZmoraGwardzistyFirstTime = TRUE;
	};
	
	B_GiveInvItems (other, self, ItMi_Gold, 400);
	B_GiveInvItems (other, self, ItPl_Dex_Herb_01, 1);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 2);
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, 1);
	B_GiveInvItems (other, self, ItMi_Pitch, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItNa_ZmoraGwardzisty, 1);
	B_GiveInvItems (self, other, ItNa_ZmoraGwardzisty, 1);

	

		if (npc_hasitems (other, ItMi_Gold) >=400) && (npc_hasitems (other, ItPl_Dex_Herb_01) >=1) && (npc_hasitems (other, ItPl_Temp_Herb) >=2) && (npc_hasitems (other, ItMi_GoldNugget_Addon) >=1) && (npc_hasitems (other, ItMi_Pitch) >=1) && (WillKnowUroboros5 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Zmor� gwardzisty: goblinie jagody, 2 rdesty polne, bry�ka z�ota, smo�a, 400 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_ZmoraGwardzisty);
		};

};

var int RykSmokaFirstTime;
FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_RykSmoka()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_RykSmoka_15_00"); //Ryk smoka.

	if (RykSmokaFirstTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_RykSmoka_15_01"); //Co� ty to znowu wymy�li�? W czym ci pomo�e taka dziwna mikstura?
		AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_RykSmoka_15_02"); //W ksi�dze by�o napisane, �e wzro�nie moja si�a.
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_RykSmoka_15_03"); //Taa... O ile wcze�niej nie przepali ci gard�a.
		RykSmokaFirstTime = TRUE;
	};
	
	B_GiveInvItems (other, self, ItMi_Gold, 400);
	B_GiveInvItems (other, self, ItPl_Mana_Herb_02, 1);
	B_GiveInvItems (other, self, ItPl_Mushroom_02, 3);
	B_GiveInvItems (other, self, ItAt_WaranFiretongue, 1);
	B_GiveInvItems (other, self, ItMi_Coal, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItNa_RykSmoka, 1);
	B_GiveInvItems (self, other, ItNa_RykSmoka, 1);

	

		if (npc_hasitems (other, ItMi_Gold) >=400) && (npc_hasitems (other, ItPl_Mana_Herb_02) >=1) && (npc_hasitems (other, ItPl_Mushroom_02) >=3) && (npc_hasitems (other, ItAt_WaranFiretongue) >=1) && (npc_hasitems (other, ItMi_Coal) >=1) && (WillKnowUroboros4 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Ryk smoka: ogniste ziele, 3 du�e grzyby, j�zyk ognistego jaszczura, w�giel, 400 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_RykSmoka);
		};

};

var int UspokajajacaFirstTime;
FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Uspokajajaca()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Uspokajajaca_15_00"); //Mikstur� uspokajaj�c�.

	if (UspokajajacaFirstTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_Uspokajajaca_15_01"); //C� to za dziwactwo? Przepis wygl�da na silny �rodek odurzaj�cy.
		AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Uspokajajaca_15_02"); //Musz� to wypr�bowa�. P�ac� ci, wi�c sporz�d� dla mnie ten wywar.
		UspokajajacaFirstTime = TRUE;
	};
	
	B_GiveInvItems (other, self, ItMi_Gold, 50);
	B_GiveInvItems (other, self, ItNa_ZabiKorzen, 2);
	B_GiveInvItems (other, self, ItPl_Mushroom_01, 10);
	B_GiveInvItems (other, self, ItPl_Speed_Herb_01, 1);
	B_GiveInvItems (other, self, ItMi_Sulfur, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItNa_MiksturaUspokajajaca, 1);
	B_GiveInvItems (self, other, ItNa_MiksturaUspokajajaca, 1);

	

		if (npc_hasitems (other, ItMi_Gold) >=50) && (npc_hasitems (other, ItNa_ZabiKorzen) >=2) && (npc_hasitems (other, ItPl_Mushroom_01) >=10) && (npc_hasitems (other, ItPl_Speed_Herb_01) >=1) && (npc_hasitems (other, ItMi_Sulfur) >=1) && (WillKnowUroboros3 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Mikstur� uspokajaj�c�: 2 �abie korzenie, 10 piekielnik�w, z�bate ziele, siarka, 50 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Uspokajajaca);
		};

};


var int CienCieniostworaFirstTime;
FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_CienCieniostwora()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_CienCieniostwora_15_00"); //Cie� cieniostwora.

	if (CienCieniostworaFirstTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_CienCieniostwora_15_01"); //Co?
		AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_CienCieniostwora_15_02"); //Znalaz�em przepis w ksi��ce.
		AI_Output (self, other,"DIA_NASZ_220_Kirgo_MakePotion_CienCieniostwora_15_03"); //No dobra. Spr�bujmy!	
		CienCieniostworaFirstTime = TRUE;
	};

	B_GiveInvItems (other, self, ItMi_Gold, 400);
	B_GiveInvItems (other, self, ItPl_Health_Herb_01, 6);
	B_GiveInvItems (other, self, ItPl_Dex_Herb_01, 1);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 1);
	B_GiveInvItems (other, self, ItAt_ShadowHorn, 1);
	
	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItNa_CienCieniostwora, 1);
	B_GiveInvItems (self, other, ItNa_CienCieniostwora, 1);

		if (npc_hasitems (other, ItMi_Gold) >=400) && (npc_hasitems (other, ItPl_Health_Herb_01) >=6) && (npc_hasitems (other, ItPl_Dex_Herb_01) >=1) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) && (npc_hasitems (other, ItAt_ShadowHorn) >=1) && (WillKnowUroboros2 == TRUE) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Cie� cieniostwora: 6 ro�lin leczniczych, goblinie jagody, rdest polny, r�g cieniostwora, 400 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_CienCieniostwora);
		};

};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Sila()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Sila_15_00"); //Eliksir si�y.
	B_GiveInvItems (other, self, ItMi_Gold, 750);
	B_GiveInvItems (other, self, ItPl_Strength_Herb_01, 1);
	B_GiveInvItems (other, self, ItPl_Perm_Herb, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItPo_Perm_STR, 1);
	B_GiveInvItems (self, other, ItPo_Perm_STR, 1);

		if (npc_hasitems (other, ItMi_Gold) >=750) && (npc_hasitems (other, ItPl_Strength_Herb_01) >=1) && (npc_hasitems (other, ItPl_Perm_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Eliksir si�y: 1 smoczy korze�, 1 szczaw kr�lewski, 750 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Sila);
		};

};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Zrecznosc()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Zrecznosc_15_00"); //Eliksir zr�czno�ci.
	B_GiveInvItems (other, self, ItMi_Gold, 750);
	B_GiveInvItems (other, self, ItPl_Dex_Herb_01, 1);
	B_GiveInvItems (other, self, ItPl_Perm_Herb, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItPo_Perm_Dex, 1);
	B_GiveInvItems (self, other, ItPo_Perm_Dex, 1);

		if (npc_hasitems (other, ItMi_Gold) >=750) && (npc_hasitems (other, ItPl_Dex_Herb_01) >=1) && (npc_hasitems (other, ItPl_Perm_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Eliksir zr�czno�ci: 1 porcja goblinich jag�d, 1 szczaw kr�lewski, 750 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Zrecznosc);
		};
};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Mana3()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Mana3_15_00"); //Eliksir many. 
	B_GiveInvItems (other, self, ItMi_Gold, 40);
	B_GiveInvItems (other, self, ItPl_Mana_Herb_03, 2);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItPo_Mana_03, 1);
	B_GiveInvItems (self, other, ItPo_Mana_03, 1);

		if (npc_hasitems (other, ItMi_Gold) >=40) && (npc_hasitems (other, ItPl_Mana_Herb_03) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Eliksir many: 2 ogniste korzenie, 1 rdest polny, 40 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Mana3);
		};

};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Mana2()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Mana2_15_00"); //Ekstrakt many. 
	B_GiveInvItems (other, self, ItMi_Gold, 25);
	B_GiveInvItems (other, self, ItPl_Mana_Herb_02, 2);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItPo_Mana_02, 1);
	B_GiveInvItems (self, other, ItPo_Mana_02, 1);

		if (npc_hasitems (other, ItMi_Gold) >=25) && (npc_hasitems (other, ItPl_Mana_Herb_02) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Ekstrakt many: 2 ogniste ziela, 1 rdest polny, 25 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Mana2);
		};

};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Mana1()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Mana1_15_00"); //Esencj� many. 
	B_GiveInvItems (other, self, ItMi_Gold, 15);
	B_GiveInvItems (other, self, ItPl_Mana_Herb_01, 2);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItPo_Mana_01, 1);
	B_GiveInvItems (self, other, ItPo_Mana_01, 1);

		if (npc_hasitems (other, ItMi_Gold) >=15) && (npc_hasitems (other, ItPl_Mana_Herb_01) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Ekstrakt many: 2 ogniste pokrzywy, 1 rdest polny, 15 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Mana1);
		};

};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Health3()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Health3_15_00"); //Eliksir leczniczy. 
	B_GiveInvItems (other, self, ItMi_Gold, 40);
	B_GiveInvItems (other, self, ItPl_Health_Herb_03, 2);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItPo_Health_03, 1);
	B_GiveInvItems (self, other, ItPo_Health_03, 1);

		if (npc_hasitems (other, ItMi_Gold) >=40) && (npc_hasitems (other, ItPl_Health_Herb_03) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Eliksir leczniczy: 2 korzenie lecznicze, 1 rdest polny, 40 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Health3);
		};

};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Health2()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Health2_15_00"); //Ekstrakt leczniczy. 
	B_GiveInvItems (other, self, ItMi_Gold, 25);
	B_GiveInvItems (other, self, ItPl_Health_Herb_02, 2);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItPo_Health_02, 1);
	B_GiveInvItems (self, other, ItPo_Health_02, 1);

		if (npc_hasitems (other, ItMi_Gold) >=25) && (npc_hasitems (other, ItPl_Health_Herb_02) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Ekstrakt leczniczy: 2 ziela lecznicze, 1 rdest polny, 25 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Health2);
		};

};

FUNC VOID DIA_NASZ_220_Kirgo_MakePotion_Health1()
{

	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_MakePotion_Health1_15_00"); //Esencj� lecznicz�. 
	B_GiveInvItems (other, self, ItMi_Gold, 15);
	B_GiveInvItems (other, self, ItPl_Health_Herb_01, 2);
	B_GiveInvItems (other, self, ItPl_Temp_Herb, 1);

	Kirgo_Make_Potion();
	KirgoSay_ProszeBardzo();
	CreateInvItems (self, ItPo_Health_01, 1);
	B_GiveInvItems (self, other, ItPo_Health_01, 1);

		if (npc_hasitems (other, ItMi_Gold) >=15) && (npc_hasitems (other, ItPl_Health_Herb_01) >=2) && (npc_hasitems (other, ItPl_Temp_Herb) >=1) {
			Info_AddChoice	  (DIA_NASZ_220_Kirgo_MakePotion, "Esencj� lecznicz�: 2 ro�liny lecznicze, 1 rdest polny, 15 szt. z�ota", DIA_NASZ_220_Kirgo_MakePotion_Health1);
		};

};


//*********************************************************************
//	Info Trade
//*********************************************************************
INSTANCE DIA_NASZ_220_Kirgo_Trade   (C_INFO)
{
	npc         = NASZ_220_Kirgo;
 	nr          = 100;
 	condition   = DIA_NASZ_220_Kirgo_Trade_Condition;
 	information = DIA_NASZ_220_Kirgo_Trade_Info;
 	permanent   = TRUE;
	trade       = TRUE;
 	description = "Poka� mi swoje towary.";
};

FUNC INT DIA_NASZ_220_Kirgo_Trade_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_220_Kirgo_kupic))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_220_Kirgo_Trade_Info()
{
	AI_Output (other,self ,"DIA_NASZ_220_Kirgo_Trade_15_00"); //Poka� mi swoje towary.
	AI_Output (self, other,"DIA_NASZ_220_Kirgo_Trade_55_01"); //Na pewno znajdziesz co� dla siebie.
	B_GiveTradeInv (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_220_Kirgo_PICKPOCKET (C_INFO)
{
	npc			= NASZ_220_Kirgo;
	nr			= 900;
	condition	= DIA_NASZ_220_Kirgo_PICKPOCKET_Condition;
	information	= DIA_NASZ_220_Kirgo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_220_Kirgo_PICKPOCKET_Condition()
{
	C_Beklauen (32);
};
 
FUNC VOID DIA_NASZ_220_Kirgo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_220_Kirgo_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_220_Kirgo_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_220_Kirgo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_220_Kirgo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_220_Kirgo_PICKPOCKET_DoIt);
};

func void DIA_NASZ_220_Kirgo_PICKPOCKET_DoIt()
{
	B_BeklauenThings(ItPo_Health_02,3);
	B_BeklauenThings(ItPo_Health_03,3);
	B_BeklauenThings(ItPo_Mana_01,1);
	
	
	Info_ClearChoices (DIA_NASZ_220_Kirgo_PICKPOCKET);
};
	
func void DIA_NASZ_220_Kirgo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_220_Kirgo_PICKPOCKET);
};
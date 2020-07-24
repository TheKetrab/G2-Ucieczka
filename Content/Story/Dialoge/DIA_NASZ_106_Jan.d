var int Jan_RepairDay;
var int JanArtefaktStop;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_EXIT   (C_INFO)
{
	npc         = NASZ_106_Jan;
	nr          = 999;
	condition   = DIA_NASZ_106_Jan_EXIT_Condition;
	information = DIA_NASZ_106_Jan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_106_Jan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_106_Jan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_hello   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 1;
 	condition   = DIA_NASZ_106_Jan_hello_Condition;
 	information = DIA_NASZ_106_Jan_hello_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_106_Jan_hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_hello_Info()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_hello_15_00"); //Jeste� kowalem?
	AI_Output (self, other,"DIA_NASZ_106_Jan_hello_55_01"); //A kim�e jeszcze m�g�bym by�?
	AI_Output (other,self ,"DIA_NASZ_106_Jan_hello_15_02"); //Nie wygl�dasz na kowala.
	AI_Output (self, other,"DIA_NASZ_106_Jan_hello_55_03"); //Faktycznie, do G�rniczej Doliny przyby�em jako �owca smok�w. Na ca�e moje szcz�cie pewien cz�owiek za�atwi� mi prac� w zamkowej ku�ni.
	AI_Output (self, other,"DIA_NASZ_106_Jan_hello_55_04"); //Pogo� za pieni�dzmi zap�dzi�a mnie zbyt daleko. Ciesz� si�, �e nie zgin��em spalony na popi�.
};

//*********************************************************************
//	Info WykujeszDlaMnie
//*********************************************************************
var int JanZaplataZaKowalstwoFail;
var int JanZaplataZaKowalstwo;
// 1 - 10 �elaztw za projekt
// 2 - 10 �elaztw za projekt i 10 szt, z�ota
// 3 - 12 �elaztw za projekt i 30 szt. z�ota
// 4 - 15 �elaztw za projekt

INSTANCE DIA_NASZ_106_Jan_WykujeszDlaMnie(C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 2;
 	condition   = DIA_NASZ_106_Jan_WykujeszDlaMnie_Condition;
 	information = DIA_NASZ_106_Jan_WykujeszDlaMnie_Info;
 	permanent   = FALSE;
 	description = "Wykujesz dla mnie bro�?";
};

FUNC INT DIA_NASZ_106_Jan_WykujeszDlaMnie_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_Info()
{
	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Jan mo�e wyku� dla mnie bro�, je�li przynios� mu troch� zardzewia�ych mieczy i innego �elastwa.");

	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnie_15_00"); //Wykujesz dla mnie bro�?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_55_01"); //Pytaj Johny'ego o dostaw�, a mnie daj spok�j.
	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnie_15_02"); //Mia�em na my�li specjalne projekty.
	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnie_15_03"); //Nie znam si� na kowalstwie, a nauka tego rzemios�a zaj�aby mi szmat czasu.
	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnie_15_04"); //Ale je�li ty jeste� do�wiadczony w tym fachu, to mo�e wyku�by� dla mnie co� specjalnego, gdybym poprosi�?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_55_05"); //A co ja b�d� z tego mia�?

	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Zap�ac� ci z�otem.", DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mog� za�atwia� ci surowce.", DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mo�e troch� magicznej rudy?", DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto_15_00"); //Zap�ac� ci z�otem.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto_15_01"); //Stanowczo odmawiam! Co ja niby zrobi� z tym z�otem?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto_15_02"); //Obr�t pieni�ny w G�rniczej Dolinie nie jest ju� taki, jak par� miesi�cy temu.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto_15_03"); //Co, mamy handlowa� z orkami? Nie, nie, przekonuj mnie dalej.
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce_15_00"); //Mog� za�atwia� ci surowce.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce_15_01"); //Ca�kiem niez�y pomys�. B�dziesz przynosi� mi tu wszelkie �elastwo, jakie znajdziesz.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce_15_02"); //Zardzewia�e miecze, surowa stal, srebro. 10 sztuk w zamian za realizacj� projektu.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce_15_03"); //To co, umowa stoi?

	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Zgoda. �elastwo w zamian za wykuwanie.", DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Tak, je�li dostan� za ka�d� dostaw� 50 sztuk z�ota.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie);	
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda_15_00"); //Zgoda. �elastwo w zamian za wykuwanie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda_15_01"); //W takim razie czekam na materia�y. Przed ka�dym zleceniem masz mi przynie�� 10 sztuk czego�, co mog� przetopi�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda_15_02"); //Dopiero potem mo�esz upomina� si� o miecz.
	
	JanZaplataZaKowalstwo = 1;
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie_15_00"); //Tak, je�li dostan� za ka�d� dostaw� 50 sztuk z�ota.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie_15_01"); //Pi��dziesi�t? Chyba �nisz. Proponuj� 10 sztuk, nie wi�cej.
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Zgoda.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniezgoda);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Chc� 30.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30);	
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Chc� 50.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniezgoda()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniezgoda_15_00"); //Zgoda.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniezgoda_15_01"); //No dobra, a wi�c materia�y w zamian za troch� z�ota i zlecenie projektu.
	
	JanZaplataZaKowalstwo = 2;
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30_15_00"); //Chc� 30.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30_15_01"); //30 sztuk z�ota... Niech b�dzie, ale warunek jest jeden:
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30_15_02"); //B�dziesz mi przynosi� nie dziesi��, a dwana�cie sztuk �elaztwa.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30_15_03"); //Dobijemy w ko�cu targu?
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Dobijemy.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniedobijemy);	
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Nie dobijemy.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanieniedobijemy);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniedobijemy()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targoD_15_00"); //Dobijemy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targoD_15_01"); //No dobra. W takim razie czekam na surowce i projekt miecza.
	
	JanZaplataZaKowalstwo = 3;
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanieniedobijemy()
{

	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targoND_15_00"); //Nie dobijemy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targoND_15_01"); //W takim razie poszukaj sobie innego parobka.
	
	JanZaplataZaKowalstwoFail = TRUE;
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50_15_00"); //Chc� 50.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50_15_01"); //50? Nie. Je�li nie zgadzasz si� na moje warunki, to nie wykuj� dla ciebie miecza.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50_15_02"); //Poszukaj sobie innego parobka.
	
	JanZaplataZaKowalstwoFail = TRUE;
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda_15_00"); //Mo�e troch� magicznej rudy?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda_15_01"); //Magiczna ruda, powiadasz...
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda_15_02"); //Jak my�lisz, ilu jest tutaj facet�w, kt�rzy potrafi� w�ada� broni� wykut� z magicznej rudy?

	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Czy przypadkiem nie wszyscy?", DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy);	
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mo�e jaka� po�owa z nich.", DIA_NASZ_106_Jan_WykujeszDlaMnie_polowa);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Oko�o pi�ciu rycerzy.", DIA_NASZ_106_Jan_WykujeszDlaMnie_pieciu);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy_15_00"); //Czy przypadkiem nie wszyscy?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy_15_01"); //No w�a�nie problem w tym, �e nie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy_15_02"); //Dlatego nic mi po rudzie.
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mog� za�atwia� ci surowce.", DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_polowa()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_polowa_15_00"); //Mo�e jaka� po�owa z nich.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_polowa_15_01"); //No... Mniej. Ale niewa�ne. To i tak za ma�o, �ebym mia� zapotrzebowanie na magiczn� rud�.
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mog� za�atwia� ci surowce.", DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_pieciu()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_pieciu_15_00"); //Oko�o pi�ciu rycerzy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_pieciu_15_01"); //Zgadza si�. I jak my�lisz, potrzeba mi du�o magicznej rudy?
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mog� za�atwia� ci surowce.", DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce);
};

// ***** ***** ***** ***** *****
INSTANCE DIA_NASZ_106_Jan_WykujeszDlaMnieAgain(C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 2;
 	condition   = DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_Condition;
 	information = DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_Info;
 	permanent   = FALSE;
 	description = "Porozmawiajmy jeszcze raz o wykuwaniu mieczy.";
};

FUNC INT DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_Condition()
{	
	if(JanZaplataZaKowalstwoFail == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_Info()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_15_00"); //Porozmawiajmy jeszcze raz o wykuwaniu mieczy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_55_01"); //Naprawd� ci na tym zale�y, co?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_55_02"); //W takim razie pozostaniemy przy moich warunkach.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_55_03"); //15 sztuk �elaztwa, dowolnego. I to moje ostatnie s�owo.
	
	JanZaplataZaKowalstwo = 4;
};

//*********************************************************************
//	Info Wykuj
//*********************************************************************
var int JanZaplacone;
// ----- ----- -----
var int JanZmijaDay;
var int JanCwiekowanaMaczugaDay;
var int JanMieczNienawisciDay;
var int JanMieczSwiatlaDay;
var int JanMieczBojowyDay;
var int JanMieczSedziegoDay;
var int JanMieczWojennyDay;
var int JanChlopskiMieczDay;
var int JanDobryMieczDay;
var int JanDobryDlugiMieczDay;
var int JanRubinoweOstrzeDay;
var int JanElBastardoDay;
var int JanOskardDay;
var int JanInkwizytorDay;
var int JanRunaMocyDay;



func void Jan_Say_Back_Tomorrow()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Say_Back_Tomorrow_15_00"); //Tak.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Back_Tomorrow_15_01"); //W takim razie zabieram si� do roboty.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Back_Tomorrow_15_02"); //Wr�� jutro, bro� b�dzie gotowa.
};

func void Jan_Say_Lack_Items()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Say_Lack_Items_15_00"); //Nie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Lack_Items_15_01"); //A wi�c nic z tego.
};

func void Jan_Say_Twice()
{
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Twice_15_00"); //Znowu to samo?
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Twice_15_01"); //Nie, nie. Daj mi najpierw doko�czy� to, co zacz��em.
};

func void Jan_Say_Have_You()
{
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Have_You_15_00"); //A masz wszystkie potrzebne materia�y?
};


INSTANCE DIA_NASZ_106_Jan_Wykuj   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 2;
 	condition   = DIA_NASZ_106_Jan_Wykuj_Condition;
 	information = DIA_NASZ_106_Jan_Wykuj_Info;
 	permanent   = TRUE;
 	description = "Wykuj dla mnie bro�.";
};

FUNC INT DIA_NASZ_106_Jan_Wykuj_Condition()
{
	if(JanZaplataZaKowalstwo > 0)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_Wykuj_Info()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_15_00"); //Wykuj dla mnie bro�.
	
	if(JanZaplacone == FALSE) {
	
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_55_01"); //Zalegasz z dostaw�. Masz surowce?
		if(Jan_Placenie_Mam(JanZaplataZaKowalstwo) == TRUE) {
			AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_55_02"); //Mam, trzymaj.
			Jan_Placenie_Placenie(JanZaplataZaKowalstwo);
			JanZaplacone = TRUE;
		}
		else {
			AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_55_03"); //Eee... nie mam.
			AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_55_04"); //Pami�taj o naszej umowie: Najpierw surowce.
			return;
		};
	};
	

	AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_15_05"); //Co teraz?

	// tutaj receptury
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
		Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, DIALOG_BACK, DIA_NASZ_106_Jan_Wykuj_Back);
		
		if(npc_hasitems (other, ItNa_Projekt_MieczSedziego) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz s�dziego.", DIA_NASZ_106_Jan_Wykuj_MieczSedziego); };
		if(npc_hasitems (other, ItNa_Projekt_MieczBojowy) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz bojowy.", DIA_NASZ_106_Jan_Wykuj_MieczBojowy); };
		if(npc_hasitems (other, ItNa_Projekt_MieczWojenny) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz wojenny.", DIA_NASZ_106_Jan_Wykuj_MieczWojenny); };
		if(npc_hasitems (other, ItNa_Projekt_MieczSwiatla) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz �wiat�a.", DIA_NASZ_106_Jan_Wykuj_MieczSwiatla); };
		if(npc_hasitems (other, ItNa_Projekt_Zmija) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "�mija.", DIA_NASZ_106_Jan_Wykuj_Zmija); };
		if(npc_hasitems (other, ItNa_Projekt_CwiekowanaMaczuga) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "�wiekowana maczuga.", DIA_NASZ_106_Jan_Wykuj_CwiekowanaMaczuga); };
		if(npc_hasitems (other, ItNa_Projekt_MieczNienawisci) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz nienawi�ci.", DIA_NASZ_106_Jan_Wykuj_MieczNienawisci); };
		if(npc_hasitems (other, ItNa_Projekt_ChlopskiMiecz) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Ch�opski miecz.", DIA_NASZ_106_Jan_Wykuj_ChlopskiMiecz); };
		if(npc_hasitems (other, ItNa_Projekt_DobryMiecz) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Dobry miecz.", DIA_NASZ_106_Jan_Wykuj_DobryMiecz); };
		if(npc_hasitems (other, ItNa_Projekt_DobryDlugiMiecz) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Dobry d�ugi miecz.", DIA_NASZ_106_Jan_Wykuj_DobryDlugiMiecz); };
		if(npc_hasitems (other, ItNa_Projekt_RubinoweOstrze) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Rubinowe ostrze.", DIA_NASZ_106_Jan_Wykuj_RubinoweOstrze); };
		if(npc_hasitems (other, ItNa_Projekt_ElBastardo) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "El Bastardo.", DIA_NASZ_106_Jan_Wykuj_ElBastardo); };
		if(npc_hasitems (other, ItNa_Projekt_Oskard) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Oskard.", DIA_NASZ_106_Jan_Wykuj_Oskard); };
		if(npc_hasitems (other, ItNa_Projekt_Inkwizytor) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Inkwizytor.", DIA_NASZ_106_Jan_Wykuj_Inkwizytor); };
		if(npc_hasitems (other, ItNa_Projekt_RunaMocy) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Runa mocy.", DIA_NASZ_106_Jan_Wykuj_RunaMocy); };

};

FUNC VOID DIA_NASZ_106_Jan_Wykuj_Back ()
{
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};


// ----- ----- ----- ----- -----
var int MieczSwiatla_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_MieczSwiatla ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczSwiatla_15_00"); //Miecz �wiat�a.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanMieczSwiatlaDay != 0) && (JanMieczSwiatlaDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_MieczSwiatla, 1);
	B_UseFakeScroll();
	
	if(MieczSwiatla_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczSwiatla_15_01"); //Co my tu mamy... Mam nadziej�, �e dam rad� upora� si� z tym kryszta�em.
		MieczSwiatla_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	&&(npc_hasitems (other, ItMi_Quartz) >= 1)
	&&(npc_hasitems (other, ItMi_Rockcrystal) >= 1)
	&&(npc_hasitems (other, ItMi_Nugget) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);
		B_GiveInvItems(other,self,ItMi_Quartz,1);
		B_GiveInvItems(other,self,ItMi_Rockcrystal,1);
		B_GiveInvItems(other,self,ItMi_Nugget,1);
			
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanMieczSwiatlaDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_MieczSwiatla, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};


// ----- ----- ----- ----- -----
var int MieczSedziego_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_MieczSedziego ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczSedziego_15_00"); //Miecz s�dziego.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanMieczSedziegoDay != 0) && (JanMieczSedziegoDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_MieczSedziego, 1);
	B_UseFakeScroll();
	
	if(MieczSedziego_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczSedziego_15_01"); //Ku�em kiedy� co� takiego dla pewnego zarozumialca.
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczSedziego_15_02"); //Ale� z niego by�a paskuda! Grubas i do tego mia� strasznie brzydk� g�b�. Troch� si� od niego r�nisz.
		
		MieczSedziego_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 2)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,2);
			
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanMieczSedziegoDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_MieczSedziego, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};


// ----- ----- ----- ----- -----
var int DobryMiecz_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_DobryMiecz ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_DobryMiecz_15_00"); //Dobry miecz.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanDobryMieczDay != 0) && (JanDobryMieczDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_DobryMiecz, 1);
	B_UseFakeScroll();
	
	if(DobryMiecz_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_DobryMiecz_15_01"); //Nie powinienem mie� z tym problemu.
		
		DobryMiecz_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);
			
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanDobryMieczDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_DobryMiecz, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};


// ----- ----- ----- ----- -----
var int Zmija_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_Zmija ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_Zmija_15_00"); //�mija.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanZmijaDay != 0) && (JanZmijaDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_Zmija, 1);
	B_UseFakeScroll();
	
	if(Zmija_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_Zmija_15_01"); //A c� to za dziwactwo?
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_Zmija_15_02"); //Nigdy jeszcze nie ku�em takiego miecza. Mam nadziej�, �e niczego nie zawal�.	
		Zmija_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 2)
	&&(npc_hasitems (other, ItMw_1h_Bau_Mace) >= 1)
	&&(npc_hasitems (other, ItMi_GoldNugget_Addon) >= 2)
	&&(npc_hasitems (other, ItMi_Addon_WhitePearl) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,2);
		B_GiveInvItems(other,self,ItMw_1h_Bau_Mace,1);
		B_GiveInvItems(other,self,ItMi_GoldNugget_Addon,2);
		B_GiveInvItems(other,self,ItMi_Addon_WhitePearl,1);
			
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanZmijaDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_Zmija, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};

// ----- ----- ----- ----- -----
var int RunaMocy_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_RunaMocy ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_RunaMocy_15_00"); //RunaMocy.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanRunaMocyDay != 0) && (JanRunaMocyDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_RunaMocy, 1);
	B_UseFakeScroll();
	
	if(RunaMocy_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_RunaMocy_15_01"); //Bardzo d�ugi miecz dwur�czny. A� cztery kawa�ki stali! Na dwur�czniaki �owc�w zu�ywam tylko trzy.
		RunaMocy_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 4)
	&&(npc_hasitems (other, ItMw_1h_Bau_Mace) >= 1)
	&&(npc_hasitems (other, ItMi_Nugget) >= 8)
	&&(npc_hasitems (other, ItMi_Rockcrystal) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,4);
		B_GiveInvItems(other,self,ItMw_1h_Bau_Mace,1);
		B_GiveInvItems(other,self,ItMi_Nugget,8);
		B_GiveInvItems(other,self,ItMi_Rockcrystal,1);
		
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanRunaMocyDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_RunaMocy, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};


// ----- ----- ----- ----- -----
var int Inkwizytor_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_Inkwizytor ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_Inkwizytor_15_00"); //Inkwizytor.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanInkwizytorDay != 0) && (JanInkwizytorDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_Inkwizytor, 1);
	B_UseFakeScroll();
	
	if(Inkwizytor_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_Inkwizytor_15_01"); //Inkwizytor? Dziwne... Projektant chyba troch� przesadzi� z nazw�. Nie wygl�da to zbyt pot�nie.
		Inkwizytor_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 2)
	&&(npc_hasitems (other, ItMw_1h_Bau_Mace) >= 1)
	&&(npc_hasitems (other, ItAt_ShadowFur) >= 1)
	&&(npc_hasitems (other, ItAt_Claw) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,2);
		B_GiveInvItems(other,self,ItMw_1h_Bau_Mace,1);
		B_GiveInvItems(other,self,ItAt_ShadowFur,1);
		B_GiveInvItems(other,self,ItAt_Claw,1);
		
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanInkwizytorDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_Inkwizytor, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};

// ----- ----- ----- ----- -----
var int Oskard_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_Oskard ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_Oskard_15_00"); //Oskard.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanOskardDay != 0) && (JanOskardDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_Oskard, 1);
	B_UseFakeScroll();
	
	if(Oskard_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_Oskard_15_01"); //Robi�em ju� bronie tego typu. To b�dzie �atwe.
		Oskard_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 2)
	&&(npc_hasitems (other, ItMw_1h_Bau_Mace) >= 1)
	&&(npc_hasitems (other, ItAt_Addon_KeilerFur) >= 1)
	
	{
		B_GiveInvItems(other,self,ItMiSwordraw,2);
		B_GiveInvItems(other,self,ItMw_1h_Bau_Mace,1);
		B_GiveInvItems(other,self,ItAt_Addon_KeilerFur,1);
		
			
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanOskardDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_Oskard, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};

// ----- ----- ----- ----- -----
var int ElBastardo_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_ElBastardo ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_ElBastardo_15_00"); //El Bastardo.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanElBastardoDay != 0) && (JanElBastardoDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_ElBastardo, 1);
	B_UseFakeScroll();
	
	if(ElBastardo_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_ElBastardo_15_01"); //To musi by� pi�kna bro� i nie lada wyczyn dla jej tw�rcy.
		ElBastardo_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 2)
	&&(npc_hasitems (other, ItMi_Aquamarine) >= 1)
	&&(npc_hasitems (other, ItMi_Nugget) >= 10)
	
	{
		B_GiveInvItems(other,self,ItMiSwordraw,2);
		B_GiveInvItems(other,self,ItMi_Aquamarine,1);
		B_GiveInvItems(other,self,ItMi_Nugget,10);
		
			
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanElBastardoDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_ElBastardo, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};


// ----- ----- ----- ----- -----
var int RubinoweOstrze_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_RubinoweOstrze ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_RubinoweOstrze_15_00"); //Rubinowe ostrze.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanRubinoweOstrzeDay != 0) && (JanRubinoweOstrzeDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_RubinoweOstrze, 1);
	B_UseFakeScroll();
	
	if(RubinoweOstrze_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_RubinoweOstrze_15_01"); //Nie�atwo b�dzie stworzy� ten klejnot, ale spr�buj�.
		RubinoweOstrze_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	&&(npc_hasitems (other, ItMi_Coal) >= 2)
	&&(npc_hasitems (other, ItMi_Addon_WhitePearl) >= 1)
	&&(npc_hasitems (other, ItMi_Nugget) >= 2)
	
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);
		B_GiveInvItems(other,self,ItMi_Coal,2);
		B_GiveInvItems(other,self,ItMi_Addon_WhitePearl,1);
		B_GiveInvItems(other,self,ItMi_Nugget,2);
		
			
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanRubinoweOstrzeDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_RubinoweOstrze, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};

// ----- ----- ----- ----- -----
var int DobryDlugiMiecz_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_DobryDlugiMiecz ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_DobryDlugiMiecz_15_00"); //Dobry d�ugi miecz.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanDobryDlugiMieczDay != 0) && (JanDobryDlugiMieczDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_DobryDlugiMiecz, 1);
	B_UseFakeScroll();
	
	if(DobryDlugiMiecz_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_DobryDlugiMiecz_15_01"); //Dobrze to wygl�da. Tylko strasznie nabazgrolony ten projekt.
		DobryDlugiMiecz_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	&&(npc_hasitems (other, ItAt_WolfFur) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);
		B_GiveInvItems(other,self,ItAt_WolfFur,1);
			
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanDobryDlugiMieczDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_DobryDlugiMiecz, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};

// ----- ----- ----- ----- -----
var int MieczBojowy_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_MieczBojowy ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczBojowy_15_00"); //Miecz bojowy.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanMieczBojowyDay != 0) && (JanMieczBojowyDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_MieczBojowy, 1);
	B_UseFakeScroll();
	
	if(MieczBojowy_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczBojowy_15_01"); //Widzia�em ju� miecze tego typu. Faktycznie, bardzo stabilnie siedz� w d�oni.
		MieczBojowy_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	&&(npc_hasitems (other, ItMw_1h_Bau_Mace) >= 5)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);
		B_GiveInvItems(other,self,ItMw_1h_Bau_Mace,5);
		
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanMieczBojowyDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_MieczBojowy, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};


// ----- ----- ----- ----- -----
var int MieczWojenny_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_MieczWojenny ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczWojenny_15_00"); //Miecz wojenny.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanMieczWojennyDay != 0) && (JanMieczWojennyDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};

	B_GiveInvItems (other, self, ItNa_Projekt_MieczWojenny, 1);
	B_UseFakeScroll();
	
	if(MieczWojenny_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczWojenny_15_01"); //Wilcze k�y? Na to bym sam nie wpad�.	
		MieczWojenny_OneTime = TRUE;
	};
		
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	&&(npc_hasitems (other, ItMw_1h_Bau_Mace) >= 1)
	&&(npc_hasitems (other, ItAt_Teeth) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);
		B_GiveInvItems(other,self,ItMw_1h_Bau_Mace,1);
		B_GiveInvItems(other,self,ItAt_Teeth,1);

		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanMieczWojennyDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_MieczWojenny, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};


// ----- ----- ----- ----- -----
var int ChlopskiMiecz_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_ChlopskiMiecz ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_ChlopskiMiecz_15_00"); //Ch�opski miecz.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanChlopskiMieczDay != 0) && (JanChlopskiMieczDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};

	B_GiveInvItems (other, self, ItNa_Projekt_ChlopskiMiecz, 1);
	B_UseFakeScroll();
	
	if(ChlopskiMiecz_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_ChlopskiMiecz_15_01"); //A c� to za badziewie? Ale skoro chcesz...
		ChlopskiMiecz_OneTime = TRUE;
	};
		
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);

		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanChlopskiMieczDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_ChlopskiMiecz, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};

// ----- ----- ----- ----- -----
var int CwiekowanaMaczuga_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_CwiekowanaMaczuga ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_CwiekowanaMaczuga_15_00"); //�wiekowana maczuga.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanCwiekowanaMaczugaDay != 0) && (JanCwiekowanaMaczugaDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};

	B_GiveInvItems (other, self, ItNa_Projekt_CwiekowanaMaczuga, 1);
	B_UseFakeScroll();
	
	if(CwiekowanaMaczuga_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_CwiekowanaMaczuga_15_01"); //Widzia�em ju� gdzie� tak� bro�. Zobaczymy, co z tego wyjdzie.	
		CwiekowanaMaczuga_OneTime = TRUE;
	};
		
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	&&(npc_hasitems (other, ItMw_1h_Bau_Mace) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);
		B_GiveInvItems(other,self,ItMw_1h_Bau_Mace,1);

		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanCwiekowanaMaczugaDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_CwiekowanaMaczuga, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};

// ----- ----- ----- ----- -----
var int MieczNienawisci_OneTime;
FUNC VOID DIA_NASZ_106_Jan_Wykuj_MieczNienawisci ()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_00"); //Miecz nienawi�ci.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanMieczNienawisciDay != 0) && (JanMieczNienawisciDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};

	B_GiveInvItems (other, self, ItNa_Projekt_MieczNienawisci, 1);
	B_UseFakeScroll();
	
	if(MieczNienawisci_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_01"); //Czyta�e� ten projekt?
		if(Projekt_MieczNienawisci_OneTime == TRUE) {
			AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_02"); //Tak.
			AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_03"); //To pewnie si� domy�lasz, �e musisz da� mi piwa, je�li chcesz ten miecz. Haha!
		} else {
			AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_04"); //Nie.
			AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_05"); //W takim razie musisz wiedzie�, �e autor projektu za�yczy� sobie tak�e piwa. Haha!
		};
		
		MieczNienawisci_OneTime = TRUE;
	};
	
	Jan_Say_Have_You();
	
	// czy ma itemy?
	if(npc_hasitems (other, ItMiSwordraw) >= 1)
	&&(npc_hasitems (other, ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItMiSwordraw,1);
		B_GiveInvItems(other,self,ItFo_Beer,1);
		
		Jan_Say_Back_Tomorrow();
		
		JanZaplacone = FALSE;
		JanMieczNienawisciDay = Wld_GetDay();
	}
	
	else
	{
		Jan_Say_Lack_Items();
	};
	

	// oddaje projekt i konczy dialog
	B_GiveInvItems (self, other, ItNa_Projekt_MieczNienawisci, 1);
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
};




//*********************************************************************
//	Oddawanie
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_Oddawanie   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 3;
 	condition   = DIA_NASZ_106_Jan_Oddawanie_Condition;
 	information = DIA_NASZ_106_Jan_Oddawanie_Info;
 	permanent   = TRUE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_106_Jan_Oddawanie_Condition()
{
	if((JanZmijaDay < Wld_GetDay()) && (JanZmijaDay != 0))
	||((JanCwiekowanaMaczugaDay < Wld_GetDay()) && (JanCwiekowanaMaczugaDay != 0))
	||((JanMieczBojowyDay < Wld_GetDay()) && (JanMieczBojowyDay != 0))
	||((JanMieczSedziegoDay < Wld_GetDay()) && (JanMieczSedziegoDay != 0))
	||((JanMieczSwiatlaDay < Wld_GetDay()) && (JanMieczSwiatlaDay != 0))
	||((JanMieczWojennyDay < Wld_GetDay()) && (JanMieczWojennyDay != 0))
	||((JanChlopskiMieczDay < Wld_GetDay()) && (JanChlopskiMieczDay != 0))
	||((JanMieczNienawisciDay < Wld_GetDay()) && (JanMieczNienawisciDay != 0))	
	||((JanDobryMieczDay < Wld_GetDay()) && (JanDobryMieczDay != 0))
	||((JanDobryDlugiMieczDay < Wld_GetDay()) && (JanDobryDlugiMieczDay != 0))
	||((JanRubinoweOstrzeDay < Wld_GetDay()) && (JanRubinoweOstrzeDay != 0))
	||((JanElBastardoDay < Wld_GetDay()) && (JanElBastardoDay != 0))
	||((JanOskardDay < Wld_GetDay()) && (JanOskardDay != 0))
	||((JanInkwizytorDay < Wld_GetDay()) && (JanInkwizytorDay != 0))
	||((JanRunaMocyDay < Wld_GetDay()) && (JanRunaMocyDay != 0))
	
	
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_Oddawanie_Info()
{
	AI_Output (self, other,"DIA_NASZ_106_Jan_Oddawanie_55_00"); //Hej, jeste�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Oddawanie_55_01"); //Twoje zam�wienie gotowe.
		
	if((JanZmijaDay < Wld_GetDay()) && (JanZmijaDay != 0)) {
		Createinvitems (self, ItNa_Zmija, 1);
		B_giveinvitems (self, other, ItNa_Zmija, 1);
		JanZmijaDay = 0;
	};
	
	if((JanMieczSedziegoDay < Wld_GetDay()) && (JanMieczSedziegoDay != 0)) {
		Createinvitems (self, ItMw_1H_Sword_02, 1);
		B_giveinvitems (self, other, ItMw_1H_Sword_02, 1);
		JanMieczSedziegoDay = 0;
	};
	
	if((JanChlopskiMieczDay < Wld_GetDay()) && (JanChlopskiMieczDay != 0)) {
		Createinvitems (self, ItMw_1H_Sword_Short_02, 1);
		B_giveinvitems (self, other, ItMw_1H_Sword_Short_02, 1);
		JanChlopskiMieczDay = 0;
	};
	
	if((JanMieczBojowyDay < Wld_GetDay()) && (JanMieczBojowyDay != 0)) {
		Createinvitems (self, ItMw_1H_Sword_04, 1);
		B_giveinvitems (self, other, ItMw_1H_Sword_04, 1);
		JanMieczBojowyDay = 0;
	};
	
	if((JanMieczWojennyDay < Wld_GetDay()) && (JanMieczWojennyDay != 0)) {
		Createinvitems (self, ItMw_1H_Sword_05, 1);
		B_giveinvitems (self, other, ItMw_1H_Sword_05, 1);
		JanMieczWojennyDay = 0;
	};
	
	if((JanMieczSwiatlaDay < Wld_GetDay()) && (JanMieczSwiatlaDay != 0)) {
		Createinvitems (self, ItNa_MieczSwiatla, 1);
		B_giveinvitems (self, other, ItNa_MieczSwiatla, 1);
		JanMieczSwiatlaDay = 0;
	};
	
	if((JanCwiekowanaMaczugaDay < Wld_GetDay()) && (JanCwiekowanaMaczugaDay != 0)) {
		Createinvitems (self, ItMw_1H_Mace_02, 1);
		B_giveinvitems (self, other, ItMw_1H_Mace_02, 1);
		JanCwiekowanaMaczugaDay = 0;
	};
	
	if((JanMieczNienawisciDay < Wld_GetDay()) && (JanMieczNienawisciDay != 0)) {
		Createinvitems (self, ItMw_1H_Sword_Long_03, 1);
		B_giveinvitems (self, other, ItMw_1H_Sword_Long_03, 1);
		JanMieczNienawisciDay = 0;
	};
	
	
	

	if((JanDobryMieczDay < Wld_GetDay()) && (JanDobryMieczDay != 0)) {
		Createinvitems (self, ItMw_Schwert1, 1);
		B_giveinvitems (self, other, ItMw_Schwert1, 1);
		JanDobryMieczDay = 0;
	};
	if((JanDobryDlugiMieczDay < Wld_GetDay()) && (JanDobryDlugiMieczDay != 0)) {
		Createinvitems (self, ItMw_Schwert4, 1);
		B_giveinvitems (self, other, ItMw_Schwert4, 1);
		JanDobryDlugiMieczDay = 0;
	};
	if((JanRubinoweOstrzeDay < Wld_GetDay()) && (JanRubinoweOstrzeDay != 0)) {
		Createinvitems (self, ItMw_Rubinklinge, 1);
		B_giveinvitems (self, other, ItMw_Rubinklinge, 1);
		JanRubinoweOstrzeDay = 0;
	};
	if((JanElBastardoDay < Wld_GetDay()) && (JanElBastardoDay != 0)) {
		Createinvitems (self, ItMw_ElBastardo, 1);
		B_giveinvitems (self, other, ItMw_ElBastardo, 1);
		JanElBastardoDay = 0;
	};
	if((JanOskardDay < Wld_GetDay()) && (JanOskardDay != 0)) {
		Createinvitems (self, ItMw_Steinbrecher, 1);
		B_giveinvitems (self, other, ItMw_Steinbrecher, 1);
		JanOskardDay = 0;
	};
	if((JanInkwizytorDay < Wld_GetDay()) && (JanInkwizytorDay != 0)) {
		Createinvitems (self, ItMw_Inquisitor, 1);
		B_giveinvitems (self, other, ItMw_Inquisitor, 1);
		JanInkwizytorDay = 0;
	};
	if((JanRunaMocyDay < Wld_GetDay()) && (JanRunaMocyDay != 0)) {
		Createinvitems (self, ItMw_Zweihaender3, 1);
		B_giveinvitems (self, other, ItMw_Zweihaender3, 1);
		JanRunaMocyDay = 0;
	};
	
	
	
	AI_Output (self, other,"DIA_NASZ_106_Jan_Oddawanie_55_02"); //Jakby� jeszcze czego� potrzebowa�, to pami�taj o naszej umowie!
	

};
















//*********************************************************************
//	Arena
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_arena   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 2;
 	condition   = DIA_NASZ_106_Jan_arena_Condition;
 	information = DIA_NASZ_106_Jan_arena_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_106_Jan_arena_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_115_Kurgan_kurganwon))
	&& (Hero_CanGoToJanArena == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_arena_Info()
{
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_00"); //Jeste� wreszcie. Masz tu do odbioru ostrze.

	Createinvitems (self, Itna_OstrzeLowcy, 1);
	B_giveinvitems (self, other, ItNa_OstrzeLowcy, 1);

	AI_Output (other,self ,"DIA_NASZ_106_Jan_arena_15_01"); //Co to za miecz?
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_02"); //Nazwa�em go 'Ostrzem �owcy'. Jest nawet lekkie, jak na jego pot�g�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_03"); //Z takim ostrzem b�dziesz postrachem Doliny.
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_04"); //Ale to nie wszystko...
	AI_Output (other,self ,"DIA_NASZ_106_Jan_arena_15_05"); //To znaczy?
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_06"); //Wpad�em na pomys� stworzenia pe�nego kompletu �owcy.
	AI_Output (other,self ,"DIA_NASZ_106_Jan_arena_15_07"); //Miecz, kusza i tarcza?
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_08"); //Zgadza si�. Jednak b�d� potrzebowa� do tego surowc�w.
};

//*********************************************************************
//	Surowce
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_surowce   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 3;
 	condition   = DIA_NASZ_106_Jan_surowce_Condition;
 	information = DIA_NASZ_106_Jan_surowce_Info;
 	permanent   = FALSE;
 	description = "Czego ci potrzeba?";
};

FUNC INT DIA_NASZ_106_Jan_surowce_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_106_Jan_arena))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_surowce_Info()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_surowce_15_00"); //Czego ci potrzeba?
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_01"); //Po pierwsze to cz�owieka, kt�ry zrobi kusz�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_02"); //Jestem kowalem. Kusze to nie moja specjalno��.
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_03"); //Je�li chodzi o tarcz�, to potrzebuj� z�b�w b�otnego w�a, rogu cieniostwora i dwa k�y trolla.
	AI_Output (other,self ,"DIA_NASZ_106_Jan_surowce_15_04"); //Kto nauczy mnie oprawia� te potwory?
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_05"); //C�, najlepiej by�oby popyta� my�liwych. By� mo�e takie trofea da si� te� znale�� albu kupi�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_06"); //Powodzenia.

	Log_CreateTopic (TOPIC_Jan_lowca, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jan_lowca, LOG_RUNNING);
	B_LogEntry (TOPIC_Jan_lowca, "Kowal Jan wpad� na pomys� zrobienia kompletu �owcy, czyli miecza, kuszy i zbroi. Miecz ju� zrobi�. Musz� znale�� kogo�, kto zrobi�by kusz� i zgromadzi� nast�puj�ce surowce: z�by b�otnego w�a, r�g cieniostwora i dwa k�y trolla.");
};

var int JanKuszaDay1;
var int JanKuszaDay2;
//*********************************************************************
//	HaveSurowce
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_HaveSurowce   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 4;
 	condition   = DIA_NASZ_106_Jan_HaveSurowce_Condition;
 	information = DIA_NASZ_106_Jan_HaveSurowce_Info;
 	permanent   = FALSE;
 	description = "Mam surowce na tarcze.";
};

FUNC INT DIA_NASZ_106_Jan_HaveSurowce_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_106_Jan_arena)
	&& Npc_HasItems(other,ItAt_SharkTeeth)>=1 
	&& Npc_HasItems(other,ItAt_TrollTooth)>=2 
	&& Npc_HasItems(other,ItAt_ShadowHorn)>=1) 
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_HaveSurowce_Info()
{
	B_GivePlayerXP(500);
	DodajReputacje(2,REP_LOWCY);
	
	B_GiveInvItems (other, self, ItAt_SharkTeeth, 1);
	B_GiveInvItems (other, self, ItAt_TrollTooth, 2);
	B_GiveInvItems (other, self, ItAt_ShadowHorn, 1);
	
	AI_Output (other,self ,"DIA_NASZ_106_Jan_HaveSurowce_15_00"); //Mam surowce na tarcze.
	AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_01"); //Doskonale. Zabieram si� do pracy!
	AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_02"); //Za dwa dni powinienem sko�czy�. A co z kusz�? Znalaz�e� ju� kogo�?
	
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_CrossBowReady))
	{
		AI_Output (other,self ,"DIA_NASZ_106_Jan_HaveSurowce_15_03"); //Nawet odebra�em kusz�. Teraz czekam tylko na tarcz�.
		AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_04"); //W takim razie musz� si� pospieszy�. Mo�e jednak uda mi si� sko�czy� do jutra.
		JanKuszaDay1 = Wld_GetDay();
		B_LogEntry (TOPIC_Jan_lowca, "Musz� si� zg�osi� do Jana jutro.");
	}
	
	else if (npc_knowsinfo (other, DIA_NASZ_119_Udar_DoCrossBow))
	{
		AI_Output (other,self ,"DIA_NASZ_106_Jan_HaveSurowce_15_05"); //Tak, Udar wykona j� dla mnie.
		AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_06"); //Ciekawe, jak b�dziesz wygl�da� w pe�nym wyposa�eniu.
		JanKuszaDay2 = Wld_GetDay();
		B_LogEntry (TOPIC_Jan_lowca, "Musz� si� zg�osi� do Jana za dwa dni.");
	}
	
	else
	{
		AI_Output (other,self ,"DIA_NASZ_106_Jan_HaveSurowce_15_07"); //Jeszcze nie.
		AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_08"); //My�la�em, �e sam wpadniesz na to, �e wystarczy poprosi� Udara.
		JanKuszaDay2 = Wld_GetDay();
		B_LogEntry (TOPIC_Jan_lowca, "Musz� si� zg�osi� do Jana za dwa dni. Jan poinstruowa� mnie tak�e, �ebym zapyta� Udara, czy wykona kusz�.");
	};
	
};

//*********************************************************************
//	TarczaReady
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_TarczaReady   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 5;
 	condition   = DIA_NASZ_106_Jan_TarczaReady_Condition;
 	information = DIA_NASZ_106_Jan_TarczaReady_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_106_Jan_TarczaReady_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_106_Jan_HaveSurowce))
	&& (TimeIsUp(1,-1,JanKuszaDay1,-1) || TimeIsUp(2,-1,JanKuszaDay2,-1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_TarczaReady_Info()
{
	CreateInvItems(self,ItNa_TarczaMistrzowska,1);
	B_GiveInvItems(self,other,ItNa_TarczaMistrzowska,1);
	
	AI_Output (self, other,"DIA_NASZ_106_Jan_TarczaReady_15_00"); //Tarcza gotowa. Trzymaj!
	AI_Output (self, other,"DIA_NASZ_106_Jan_TarczaReady_55_01"); //Mam nadziej�, �e ci si� spodoba. No, a teraz poka� mi si� w pe�nym wyposa�eniu �owcy.

	B_LogEntry (TOPIC_Jan_lowca, "Mam ju� kusz�. Jan chce mnie zobaczy� z za�o�onym mieczem, tarcz� i kusz�.");
};



var int JanSaidAboutUltraArmor;
func void JanSay_AboutUltraArmor() {

	AI_Output (self, other,"DIA_NASZ_106_Jan_AboutUltraArmor_55_00"); //Z pancerzy elitarnych wojownik�w uda�o mi si� zrobi� nie lada zbroj�. Jest troch� ci�ka, ale krzepy ci raczej nie brakuje, prawda?
	AI_Output (self, other,"DIA_NASZ_106_Jan_AboutUltraArmor_55_01"); //Mog� ci j� sprzeda�, je�li chcesz.
	JanSaidAboutUltraArmor = TRUE;
};

//*********************************************************************
//	KompletReady
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_KompletReady   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 6;
 	condition   = DIA_NASZ_106_Jan_KompletReady_Condition;
 	information = DIA_NASZ_106_Jan_KompletReady_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_106_Jan_KompletReady_Condition()
{
	if (OstrzeLowcyUbrane == TRUE)
	&& (TarczaLowcyUbrana == TRUE)
	&& (KuszaLowcyUbrana == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_KompletReady_Info()
{
	AI_Output (self, other,"DIA_NASZ_106_Jan_KompletReady_15_00"); //Wygl�dasz fantastycznie! To jest to.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KompletReady_55_01"); //Zabieram si� za tworzenie kolejnych komplet�w.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KompletReady_55_02"); //W nagrod� za pomoc mo�esz zatrzyma� te rzeczy zupe�nie za darmo.

	if (KAPITEL >= 4 && RepEnough(90,REP_LOWCY)) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_KompletReady_55_03"); //Ale to nie wszystko!
		JanSay_AboutUltraArmor();
	};
	
	DodajReputacje(4,REP_LOWCY);
	B_GivePlayerXP (1000);
	Log_SetTopicStatus (TOPIC_Jan_lowca, LOG_SUCCESS);
	B_LogEntry (TOPIC_Jan_lowca, "Jan by� zachwycony moim wygl�dem. Zacznie teraz tworzy� nowe zestawy wyposa�enia dla wojownik�w.");
};


//*********************************************************************
//	AboutArmorKap4
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_AboutArmorKap4   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 6;
 	condition   = DIA_NASZ_106_Jan_AboutArmorKap4_Condition;
 	information = DIA_NASZ_106_Jan_AboutArmorKap4_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_106_Jan_AboutArmorKap4_Condition()
{
	if (KAPITEL >= 4 && JanSaidAboutUltraArmor == FALSE)
	&& (npc_knowsinfo(other,DIA_NASZ_106_Jan_KompletReady))
	&& (RepEnough(90,REP_LOWCY))
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_AboutArmorKap4_Info()
{
	JanSay_AboutUltraArmor();
	
};

var int Jan_UltraDJG_Bought;
//*********************************************************************
//	BuyUltraArmor
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_BuyUltraArmor   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 6;
 	condition   = DIA_NASZ_106_Jan_BuyUltraArmor_Condition;
 	information = DIA_NASZ_106_Jan_BuyUltraArmor_Info;
 	permanent   = TRUE;
 	description = "Sprzedaj mi zbroj� (3000 szt. z�ota)";
};

FUNC INT DIA_NASZ_106_Jan_BuyUltraArmor_Condition()
{
	if (JanSaidAboutUltraArmor == TRUE)
	&& (Jan_UltraDJG_Bought == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_BuyUltraArmor_Info()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_BuyUltraArmor_15_00"); //Sprzedaj mi zbroj�.
	
	if (npc_hasitems(other,ItMi_Gold) < 3000) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_BuyUltraArmor_55_01"); //Nie ma z�ota, nie ma zbroi.
		return;
	};
	
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	AI_Output (self, other,"DIA_NASZ_106_Jan_BuyUltraArmor_55_02"); //Prosz�. Masz tu te� he�m do kompletu.

	Jan_UltraDJG_Bought = TRUE;
	
	CreateInvItems(self,ITNA_DJG_ULTRA,1);
	B_GiveInvItems(self,other,ITNA_DJG_ULTRA,1);

	CreateInvItems(self,ITNA_DJG_ULTRA_HELMET,1);
	B_GiveInvItems(self,other,ITNA_DJG_ULTRA_HELMET,1);
	
};



//*********************************************************************
//	Work1
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_work1   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 4;
 	condition   = DIA_NASZ_106_Jan_work1_Condition;
 	information = DIA_NASZ_106_Jan_work1_Info;
 	permanent   = FALSE;
 	description = "Mog� si� jako� przyda�?";
};

FUNC INT DIA_NASZ_106_Jan_work1_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_110_Keroloth_join))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_work1_Info()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_work1_15_00"); //Mog� si� jako� przyda�?
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_01"); //Hmm... Nie wygl�dasz na kogo�, kto wie jak si� wykuwa bro�, ale chyba mia�bym co� dla ciebie.
	AI_Output (other,self ,"DIA_NASZ_106_Jan_work1_15_02"); //W czym problem?
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_03"); //Brakuje mi z�ota...
	AI_Output (other,self ,"DIA_NASZ_106_Jan_work1_15_04"); //Z�ota? I co, mam ci zap�aci�?
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_05"); //Nie, idioto. Nie o takim z�ocie m�wi�. Chodzi mi o bry�ki z�ota. Przynie� ich, powiedzmy, dziesi��.	
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_06"); //Wykuj� z nich wiele mocnych i pi�knych or�y.
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_07"); //Mo�e tobie te� si� wtedy co� dostanie.

	Log_CreateTopic (TOPIC_Jan_zloto, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jan_zloto, LOG_RUNNING);
	B_LogEntry (TOPIC_Jan_zloto, "Jan chce, bym przyni�s� mu 10 samorodk�w z�ota. W G�rniczej Dolinie znajd� par� �y� z�ota i je�li szcz�cie mi dopisze, dam rad� wykona� to do�� jasne zadanie.");
};

//*********************************************************************
//	Finish1
//*********************************************************************

INSTANCE DIA_NASZ_106_Jan_finish1   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 5;
 	condition   = DIA_NASZ_106_Jan_finish1_Condition;
 	information = DIA_NASZ_106_Jan_finish1_Info;
 	permanent   = FALSE;
 	description = "Mam bry�ki.";
};

FUNC INT DIA_NASZ_106_Jan_finish1_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_106_Jan_work1)
		&& (npc_hasitems (other, ItMi_GoldNugget_Addon) >= 10))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_finish1_Info()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_finish1_15_00"); //Mam bry�ki, o kt�re prosi�e�.
	B_giveinvitems (other, self, ItMi_GoldNugget_Addon, 10);
	AI_Output (self, other,"DIA_NASZ_106_Jan_finish1_55_01"); //�wietna robota. Skoro uda�o ci si� je zdoby�, to zapewne nie b�dziesz mia� problemu z kolejn� dostaw�.
	AI_Output (other, self,"DIA_NASZ_106_Jan_finish1_55_02"); //Mam znowu ugania� si� za grudkami z�ota po jaskiniach?!
	AI_Output (self, other,"DIA_NASZ_106_Jan_finish1_55_03"); //W �adnym wypadku. Kopacz Daniel zalega z dostaw�. Zajrzyj do niego i upomnij si� o dziesi�� bry�ek.

	if (Npc_GetDistToWP	(NASZ_122_Daniel, "NASZ_LOWCY_DOL_09") > 5000)
	{
		AI_Output (other, self,"DIA_NASZ_106_Jan_finish1_55_04"); //Gdzie podziewa si� ten cz�owiek?
		AI_Output (self, other,"DIA_NASZ_106_Jan_finish1_55_05"); //Domy�lam si�, �e jest przy swoim niedu�ym oboziku.
		AI_Output (self, other,"DIA_NASZ_106_Jan_finish1_55_06"); //Id� w stron� obozu my�liwych, a potem w stron� du�ej wie�y na po�udniu. Znajdziesz go obok opuszczonej kopalni.
	
	};
	
	B_GivePlayerXP(100);
	B_LogEntry (TOPIC_Jan_zloto, "Przynios�em i ci�gle ma�o! Mam si� uda� do Daniela i za�atwi� kolejne bry�ki. Kopacz przebywa w pobli�u opuszczonej kopalni obok du�ej wie�y na po�udniu.");
	
};


var int Jan_DaySztylet;
func void Jan_finishSamorodki_DIA() {

	AI_Output (other,self ,"Jan_finishSamorodki_DIA_15_00"); //Oto 10 bry�ek z�ota.
	B_giveinvitems (other, self, ItMi_GoldNugget_Addon, 10);
	AI_Output (self, other,"Jan_finishSamorodki_DIA_55_01"); //�wietnie. Odwied� mnie jutro, to co� ci si� dostanie.
	
	Jan_DaySztylet = Wld_GetDay ();

	DodajReputacje (4, REP_LOWCY);
	B_LogEntry (TOPIC_Jan_zloto, "Przynios�em Janowi z�oto. Mam zg�osi� si� jutro do niego po moj� nagrod�.");
	B_GivePlayerXP (200);
};

//*********************************************************************
//	Finish2
//*********************************************************************

INSTANCE DIA_NASZ_106_Jan_finish2   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 6;
 	condition   = DIA_NASZ_106_Jan_finish2_Condition;
 	information = DIA_NASZ_106_Jan_finish2_Info;
 	permanent   = FALSE;
 	description = "Oto 10 bry�ek z�ota.";
};

FUNC INT DIA_NASZ_106_Jan_finish2_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_122_Daniel_WhatDoYouMean)
		&& npc_hasitems (other, ItMi_GoldNugget_Addon) >= 10) && (MozeszKopacBrudneSamorodki == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_finish2_Info()
{
	Jan_finishSamorodki_DIA();
};

//*********************************************************************
//	Finish3
//*********************************************************************

INSTANCE DIA_NASZ_106_Jan_finish3   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 6;
 	condition   = DIA_NASZ_106_Jan_finish3_Condition;
 	information = DIA_NASZ_106_Jan_finish3_Info;
 	permanent   = FALSE;
 	description = "Oto 10 bry�ek z�ota. (Oddaj brudne bry�ki.)";
};

FUNC INT DIA_NASZ_106_Jan_finish3_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_122_Daniel_WhatDoYouMean))
		&& (npc_hasitems (other, ItMi_GoldNugget_Addon) >= 10) && (MozeszKopacBrudneSamorodki > 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_finish3_Info()
{
	Jan_finishSamorodki_DIA();
};

//*********************************************************************
//	ZlotySztylet
//*********************************************************************
instance DIA_NASZ_106_Jan_ZlotySztylet		(C_INFO)
{
	npc			= 	NASZ_106_Jan;
	nr         	= 	6;
	condition	= 	DIA_NASZ_106_Jan_ZlotySztylet_Condition;
	information	= 	DIA_NASZ_106_Jan_ZlotySztylet_Info;
	permanent	= 	FALSE;
	important	= 	TRUE;
};

func int DIA_NASZ_106_Jan_ZlotySztylet_Condition ()
{
	IF (Jan_DaySztylet < Wld_GetDay())
	&& ((npc_knowsinfo (other, DIA_NASZ_106_Jan_finish2)) || (npc_knowsinfo (other, DIA_NASZ_106_Jan_finish3)))
	{
		return TRUE;
	};	
};

func void DIA_NASZ_106_Jan_ZlotySztylet_Info ()
{
	if (npc_knowsinfo (other, DIA_NASZ_106_Jan_finish2))
	{
	
		AI_Output			(self, other, "DIA_NASZ_106_Jan_ZlotySztylet_15_00"); //Jeste�! Z tego z�ota powsta�a ca�kiem fajna zabawka.

		CreateInvItems (self,ItNa_ZlotySztylet,1);
		B_giveinvitems (self, other, ItNa_ZlotySztylet, 1);

		AI_Output			(self, other, "DIA_NASZ_106_Jan_ZlotySztylet_15_01"); //We� to. Co o tym my�lisz?
		
		AI_ReadyMeleeWeapon	(other);
		AI_PlayAni	(other, "T_1HSINSPECT");

		AI_Output			(other, self, "DIA_NASZ_106_Jan_ZlotySztylet_15_02"); //�adnie zdobiony.
		AI_Output			(self, other, "DIA_NASZ_106_Jan_ZlotySztylet_15_03"); //Zgadza si�. Je�li nie b�dziesz chcia� nim walczy�, to mo�esz zawsze sprzeda� go kt�remu� handlarzowi.

		B_LogEntry (TOPIC_Jan_zloto, "Z tych samorodk�w Jan zrobi� pi�kny z�oty sztylet. Lekki, ale ostry jak brzytwa.");
		Log_SetTopicStatus (TOPIC_Jan_zloto, LOG_SUCCESS);
	}
	else
	{
		AI_Output			(self, other, "DIA_NASZ_106_Jan_ZlotySztylet_15_04"); //To z�oto, kt�re mi da�e�, by�o tak brudne, �e nic z nim nie zrobi�em!
			
		B_LogEntry (TOPIC_Jan_zloto, "Jan troch� si� wkurzy�, ale co z tego? Daniel przynajmniej b�dzie mnie uczy� za darmo.");
		Log_SetTopicStatus (TOPIC_Jan_zloto, LOG_SUCCESS);

		Info_ClearChoices (DIA_NASZ_106_Jan_ZlotySztylet);
			Info_AddChoice	  (DIA_NASZ_106_Jan_ZlotySztylet, "Widocznie Daniel nie przy�o�y� si� do swojej pracy.", DIA_NASZ_106_Jan_ZlotySztylet_yes);
			Info_AddChoice	  (DIA_NASZ_106_Jan_ZlotySztylet, "No to mo�e we�miesz si� za kucie broni z porz�dnych materia��w?", DIA_NASZ_106_Jan_ZlotySztylet_no);

	};
};

FUNC VOID DIA_NASZ_106_Jan_ZlotySztylet_yes()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_ZlotySztylet_yes_15_00"); //Widocznie Daniel nie przy�o�y� si� do swojej pracy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_ZlotySztylet_yes_15_01"); //Nie wiem, z czego wynika jego lekcewa�enie pracy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_ZlotySztylet_yes_15_02"); //Ten cz�owiek kopie chyba przede wszystkim dla samego siebie.

	Info_ClearChoices (DIA_NASZ_106_Jan_ZlotySztylet);
};
		
FUNC VOID DIA_NASZ_106_Jan_ZlotySztylet_no()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_ZlotySztylet_no_55_00"); //No to mo�e we�miesz si� za kucie broni z porz�dnych materia��w?
	AI_Output (self, other,"DIA_NASZ_106_Jan_ZlotySztylet_no_55_01"); //Aaa! Wi�c zrobi�e� to celowo!
	AI_Output (self, other,"DIA_NASZ_106_Jan_ZlotySztylet_no_55_02"); //Nie wiem, czemu ze mn� pogrywasz, ale zaraz poka�� ci gr� po swojemu.

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

//*********************************************************************
//	Kap3Quest
//*********************************************************************
var int Will_Can_Take_Helmets;
instance DIA_NASZ_106_Jan_Kap3Quest		(C_INFO)
{
	npc			= 	NASZ_106_Jan;
	nr         	= 	6;
	condition	= 	DIA_NASZ_106_Jan_Kap3Quest_Condition;
	information	= 	DIA_NASZ_106_Jan_Kap3Quest_Info;
	permanent	= 	FALSE;
	important	= 	TRUE;
};

func int DIA_NASZ_106_Jan_Kap3Quest_Condition ()
{
	if (KAPITEL == 3)
	&& ((hero.guild == GIL_OUT)
	 || (hero.guild == GIL_DJG && HeroKnowAboutJanQuest == TRUE))
	{
		return TRUE;
	};	
};

func void DIA_NASZ_106_Jan_Kap3Quest_Info ()
{
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_00"); //Ha, wreszczie ci� widz�.
	AI_Output			(other, self, "DIA_NASZ_106_Jan_Kap3Quest_15_01"); //Dlaczego czeka�e� w�a�nie na mnie? Czy ju� tylko ja jestem tu czego� wart?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_02"); //Tylko ty zwiedzasz G�rnicz� Dolin�. Reszty albo to nie obchodzi albo s� znurzeni t� krain� i nie rusz� si� st�d bez rozkazu Kerolotha. A ten aktualnie jest nieobecny.
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_03"); //Moja pro�ba mo�e si� wydawa� obrzydliwa, ale chyba nie ma innego rozwi�zania.
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_04"); //Nasi �o�nierze potrzebuj� ochrony g�owy. He�my to bardzo istotna cz�� zbroi. Problem w tym, �e wykonanie ich zajmuje szmat czasu.
	AI_Output			(other, self, "DIA_NASZ_106_Jan_Kap3Quest_15_05"); //Co wi�c wymy�li�e�?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_06"); //Wykorzystamy he�my martwych rycerzy. Przynie� mi ich kilka, a ja je wzmocni� i dostarcz� wojownikom.
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_07"); //Przynie� przynajmniej pi�� he�m�w.

	Will_Can_Take_Helmets = TRUE;
	Log_CreateTopic (TOPIC_Jan_helmy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jan_helmy, LOG_RUNNING);
	B_LogEntry (TOPIC_Jan_helmy, "Jan chce wyposa�y� kilku �owc�w ork�w w he�my, jednak�e zrobienie takiego jest strasznie czasoch�onne. Musz� za�atwi� mu 5 he�m�w martwych rycerzy");

};

//*********************************************************************
//	WhereBodies
//*********************************************************************
instance DIA_NASZ_106_Jan_WhereBodies		(C_INFO)
{
	npc			= 	NASZ_106_Jan;
	nr         	= 	6;
	condition	= 	DIA_NASZ_106_Jan_WhereBodies_Condition;
	information	= 	DIA_NASZ_106_Jan_WhereBodies_Info;
	permanent	= 	FALSE;
	description	= 	"Gdzie znajd� cia�a poleg�ych wojownik�w?";
};

func int DIA_NASZ_106_Jan_WhereBodies_Condition ()
{
	if (npc_knowsinfo(other,DIA_NASZ_106_Jan_Kap3Quest))
	&& !(npc_knowsinfo(other,DIA_NASZ_106_Jan_Kap3QuestFinish))
	{
		return TRUE;
	};	
};

func void DIA_NASZ_106_Jan_WhereBodies_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_106_Jan_WhereBodies_15_00"); //Gdzie znajd� cia�a poleg�ych wojownik�w?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_WhereBodies_15_01"); //Rzecz jasna na prze��czy! My�l�, �e w kopalniach obok starej wie�y na po�udniu r�wnie� znajdziesz rycerzy i he�my.
	AI_Output			(self, other, "DIA_NASZ_106_Jan_WhereBodies_15_02"); //Nie zapomnij o kopalni z pe�zaczami. Gdy zaj�y kopalni�, zabi�y wielu dzielnych ludzi.
	AI_Output			(other, self, "DIA_NASZ_106_Jan_WhereBodies_15_03"); //Mam nadziej�, �e uda mi si� odszuka� do�� du�o he�m�w nadaj�cych si� do u�ycia.
	
	B_LogEntry (TOPIC_Jan_helmy, "Wojownicy mog� le�e� na prze��czy, w kopalni obok wie�y na po�udniu albo w kopalni zaj�tej przez pe�zacze.");

};

//*********************************************************************
//	Kap3QuestFinish
//*********************************************************************
instance DIA_NASZ_106_Jan_Kap3QuestFinish		(C_INFO)
{
	npc			= 	NASZ_106_Jan;
	nr         	= 	6;
	condition	= 	DIA_NASZ_106_Jan_Kap3QuestFinish_Condition;
	information	= 	DIA_NASZ_106_Jan_Kap3QuestFinish_Info;
	permanent	= 	FALSE;
	description	= 	"Przynios�em pi�� he�m�w.";
};

func int DIA_NASZ_106_Jan_Kap3QuestFinish_Condition ()
{
	if (npc_knowsinfo(other,DIA_NASZ_106_Jan_Kap3Quest))
	&& (npc_hasitems(other,ItNa_KolczugaRycerza) >=5)
	{
		return TRUE;
	};	
};

func void DIA_NASZ_106_Jan_Kap3QuestFinish_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_00"); //Przynios�em pi�� he�m�w.
	B_GiveInvItems(other,self,ItNa_KolczugaRycerza,5);
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_01"); //Doskonale, od razu zabieram si� do pracy. Mam nadziej�, �e �ci�ganie he�m�w z pognitych g��w nie by�o zbyt obrzydliwe?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_02"); //Te he�my cuchn� niczym przypalone mleko kretoszczura...
	AI_Output			(other, self, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_03"); //Jako� da�em sobie rad�, chocia� m�g�by� jako� mi to zrekompensowa�. Nie s�dzisz?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_04"); //No tak, oczywi�cie! Przyjmij ten magiczny pier�cie�. Wzmocni ci�.
	
	CreateInvItems(self,ItRi_Hp_02,1);
	B_GiveInvItems(self,other,ItRi_Hp_02,1);
	
	B_GivePlayerXP(700);
	DodajReputacje(4,REP_LOWCY);
	
	Log_SetTopicStatus (TOPIC_Jan_helmy, LOG_SUCCESS);
	B_LogEntry (TOPIC_Jan_helmy, "Przynios�em Janowi he�my.");

};


const int DIST_FOR_TAKING_HELMETS = 100; // 1m
const int DIST_FOR_TAKING_FAJKA   = 200; // 1m

var int Taken_Knight_Helmet_1;
var int Taken_Knight_Helmet_2;
var int Taken_Knight_Helmet_3;
var int Taken_Knight_Helmet_4;
var int Taken_Knight_Helmet_5;
var int Taken_Knight_Helmet_6;
var int Taken_Rethon_Fajka;

func void TryToTakeHelmetFromKnight() {

	// Rethon Fajka
	if (Rethon_Fajka_Quest_Running == TRUE)
	{
	
		if (Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN_1") <= DIST_FOR_TAKING_FAJKA)
		&& (Taken_Rethon_Fajka == FALSE)
		{
			AI_PlayAni (hero, "T_PLUNDER");
			Taken_Rethon_Fajka = TRUE;
			CreateInvItems(hero,ItNa_Fajka,1);
			B_LogEntry (TOPIC_Rethon_fajka, "Uda�o si�! Znalaz�em fajk� w ziemi!");
		};

	
	
	
	};

	
	// Helmy
	if (Will_Can_Take_Helmets)
	{
		if (Npc_GetDistToWP(hero,"NASZ_WP_RYCERZ_DEAD_1") <= DIST_FOR_TAKING_HELMETS)
		&& (Taken_Knight_Helmet_1 == FALSE)
		{
			AI_PlayAni (hero, "T_PLUNDER");
			Wld_SendTrigger("KNIGHT_HELMET_1");
			Taken_Knight_Helmet_1 = TRUE;
			CreateInvItems(hero,ItNa_KolczugaRycerza,1);
		};
		
		if (Npc_GetDistToWP(hero,"NASZ_WP_RYCERZ_DEAD_2") <= DIST_FOR_TAKING_HELMETS)
		&& (Taken_Knight_Helmet_2 == FALSE)
		{
			AI_PlayAni (hero, "T_PLUNDER");
			Wld_SendTrigger("KNIGHT_HELMET_2");
			Taken_Knight_Helmet_2 = TRUE;
			CreateInvItems(hero,ItNa_KolczugaRycerza,1);
		};
		
		if (Npc_GetDistToWP(hero,"NASZ_WP_RYCERZ_DEAD_3") <= DIST_FOR_TAKING_HELMETS)
		&& (Taken_Knight_Helmet_3 == FALSE)
		{
			AI_PlayAni (hero, "T_PLUNDER");
			Wld_SendTrigger("KNIGHT_HELMET_3");
			Taken_Knight_Helmet_3 = TRUE;
			CreateInvItems(hero,ItNa_KolczugaRycerza,1);
		};
		
		if (Npc_GetDistToWP(hero,"NASZ_WP_RYCERZ_DEAD_4") <= DIST_FOR_TAKING_HELMETS)
		&& (Taken_Knight_Helmet_4 == FALSE)
		{
			AI_PlayAni (hero, "T_PLUNDER");
			Wld_SendTrigger("KNIGHT_HELMET_4");
			Taken_Knight_Helmet_4 = TRUE;
			CreateInvItems(hero,ItNa_KolczugaRycerza,1);
		};
		
		if (Npc_GetDistToWP(hero,"NASZ_WP_RYCERZ_DEAD_5") <= DIST_FOR_TAKING_HELMETS)
		&& (Taken_Knight_Helmet_5 == FALSE)
		{
			AI_PlayAni (hero, "T_PLUNDER");
			Wld_SendTrigger("KNIGHT_HELMET_5");
			Taken_Knight_Helmet_5 = TRUE;
			CreateInvItems(hero,ItNa_KolczugaRycerza,1);
		};
		
		if (Npc_GetDistToWP(hero,"NASZ_WP_RYCERZ_DEAD_6") <= DIST_FOR_TAKING_HELMETS)
		&& (Taken_Knight_Helmet_6 == FALSE)
		{
			AI_PlayAni (hero, "T_PLUNDER");
			Wld_SendTrigger("KNIGHT_HELMET_6");
			Taken_Knight_Helmet_6 = TRUE;
			CreateInvItems(hero,ItNa_KolczugaRycerza,1);
		};
	};
};











//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_goth   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 7;
 	condition   = DIA_NASZ_106_Jan_goth_Condition;
 	information = DIA_NASZ_106_Jan_goth_Info;
 	permanent   = FALSE;
	description = "S�ysza�em, �e kto� z �owc�w okrad� my�liwych.";
};

FUNC INT DIA_NASZ_106_Jan_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie)
		&& (!KNOW_THIEF))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_goth_15_00"); //S�ysza�em, �e kto� z �owc�w okrad� my�liwych.
	AI_Output (self, other,"DIA_NASZ_106_Jan_goth_55_01"); //Rzeczywi�cie, by�o co� takiego. Keroloth zebra� wtedy wszystkich ch�opc�w i wydar� si� na nich.
	AI_Output (self, other,"DIA_NASZ_106_Jan_goth_55_02"); //�aden si� jednak nie przyzna�. Sprawa teraz ucich�a.
	AI_Output (other, self,"DIA_NASZ_106_Jan_goth_15_03"); //Keroloth... Dzi�ki.

	B_LogEntry (TOPIC_Goth_kradziez, "Jan powiedzia� mi, �e Keroloth zebra� wszystkich �owc�w i wydar� si� na nich. Nic dziwnego, �e nie chce pogarsza� stosunk�w z my�liwymi. Mo�e powinienem zapyta� Kerolotha, co on o tym wszystkim my�li.");

};

//*********************************************************************
//	Info Gwozdzie
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_Gwozdzie   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 8;
 	condition   = DIA_NASZ_106_Jan_Gwozdzie_Condition;
 	information = DIA_NASZ_106_Jan_Gwozdzie_Info;
 	permanent   = FALSE;
	description = "Potrzebuj� gwo�dzi.";
};

FUNC INT DIA_NASZ_106_Jan_Gwozdzie_Condition()	
{
	if (WillGwozdzieGoToKowal == 1) && (!npc_knowsinfo (other, DIA_NASZ_224_Dobar_Gwozdzie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_Gwozdzie_Info()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Gwozdzie_15_00"); //Potrzebuj� gwo�dzi.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Gwozdzie_55_01"); //Gwo�dzie? Ma�e metalowe pr�ty zako�czone ostr� ko�c�wk�?
	AI_Output (other, self,"DIA_NASZ_106_Jan_Gwozdzie_55_02"); //Tak.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Gwozdzie_15_03"); //W takie badziewie si� nie bawi�. Poszukaj sobie innego durnia, kt�ry zrobi ci gwo�dzie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Gwozdzie_15_04"); //GWO�DZIE! Ludzie, ja tu kuj� bro� do walki z orkami, a on prosi mnie o GWO�DZIE!

};

//*********************************************************************
//	Artefakt
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_artefakt   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 11;
 	condition   = DIA_NASZ_106_Jan_artefakt_Condition;
 	information = DIA_NASZ_106_Jan_artefakt_Info;
 	permanent   = FALSE;
 	description = "Umia�by� po��czy� te cz�ci w ca�o��?";
};

FUNC INT DIA_NASZ_106_Jan_artefakt_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_303_Nod_coteraz))
	&& (npc_knowsinfo (other, DIA_NASZ_213_Gestath_ArtefaktInfo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_artefakt_Info()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_artefakt_15_00"); //Umia�by� po��czy� te cz�ci w ca�o��?
	AI_Output (self, other,"DIA_NASZ_106_Jan_artefakt_55_01"); //Chyba tak. Ju� dawno nie bawi�em si� pier�cieniami.
	AI_Output (self, other,"DIA_NASZ_106_Jan_artefakt_15_02"); //Za 200 sztuk z�ota zrobi�, o co prosisz.

	B_LogEntry (TOPIC_Niedostepny_Klif, "Za dwie�cie sztuk z�ota Jan z��czy kawa�ki artefaktu.");
};

//*********************************************************************
//	ArtefaktZloto
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_artefaktzloto   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 12;
 	condition   = DIA_NASZ_106_Jan_artefaktzloto_Condition;
 	information = DIA_NASZ_106_Jan_artefaktzloto_Info;
 	permanent   = FALSE;
 	description = "Prosz�. (200 szt. z�ota)";
};

FUNC INT DIA_NASZ_106_Jan_artefaktzloto_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_106_Jan_artefakt)
	&& npc_hasitems (other, itmi_gold) >=200
	&& npc_hasitems (other, ItNa_Artefakt_Sila) >=1
	&& npc_hasitems (other, ItNa_Artefakt_Moc) >=1
	&& npc_hasitems (other, ItNa_Artefakt_Odpornosc) >=1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_artefaktzloto_Info()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_artefaktzloto_15_00"); //Prosz�.
	B_giveinvitems (other, self, itmi_gold, 200);
	B_giveinvitems (other, self, ItNa_Artefakt_Sila, 1);
	B_giveinvitems (other, self, ItNa_Artefakt_Moc, 1);
	B_giveinvitems (other, self, ItNa_Artefakt_Odpornosc, 1);
	AI_Output (self, other,"DIA_NASZ_106_Jan_artefaktzloto_55_01"); //Wr�� jutro. Pier�cie� b�dzie gotowy.

	Jan_RepairDay = Wld_GetDay ();
};

//*********************************************************************
//	ArtefaktReady
//*********************************************************************
instance DIA_NASZ_106_Jan_artefaktready		(C_INFO)
{
	npc			= 	NASZ_106_Jan;
	nr          = 	13;
	condition	= 	DIA_NASZ_106_Jan_artefaktready_Condition;
	information	= 	DIA_NASZ_106_Jan_artefaktready_Info;
	permanent	= 	TRUE;
	description	= 	"Czy pier�cie� jest gotowy?";
};

func int DIA_NASZ_106_Jan_artefaktready_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_NASZ_106_Jan_artefaktzloto) 
	&& (! JanArtefaktStop))
	{
		return TRUE;
	};	
};

func void DIA_NASZ_106_Jan_artefaktready_Info ()
{
	AI_Output			(other, self, "DIA_NASZ_106_Jan_artefaktready_15_00"); //Czy pier�cie� jest gotowy?
	
	if (Jan_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_01"); //Tak, prosz�.

		CreateInvItems (self,ItNa_Artefakt_Caly,1);
		B_giveinvitems (self, other, ItNa_Artefakt_Caly, 1);

	
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_02"); //Mam nadziej�, �e ci si� podoba.
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_03"); //Dawno nie pracowa�em z bi�uteri�. Musia�em troch� popr�bowa� na innych pier�cieniach, zanim zabra�em si� za tw�j.
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_04"); //Przypadkiem ukruszy�em go troch� w jednym miejscu, ale za�ata�em to ma�� stalow� cz�ci�. Ostatecznie jestem zadowolony.
		
		
		B_LogEntry (TOPIC_Niedostepny_Klif, "Jan sko�czy� amulet. Wygl�da na to, �e moje zadanie sko�czone.");
		JanArtefaktStop = TRUE;
		B_GivePlayerXP (100);
	}
	else
	{	
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_05"); //Nie, jeszcze nie. Przyjd� p�niej.
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_06"); //Je�li b�dziesz mi przeszkadza�, potrwa to d�u�ej.
		
		AI_StopProcessInfos (self);
	};	 
};

//*********************************************************************
//	Dobar
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_dobar   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 14;
 	condition   = DIA_NASZ_106_Jan_dobar_Condition;
 	information = DIA_NASZ_106_Jan_dobar_Info;
 	permanent   = FALSE;
 	description = "Przychodz� odebra� paczki dla Dobara.";
};

FUNC INT DIA_NASZ_106_Jan_dobar_Condition()
{
	if  (!npc_knowsinfo (other, DIA_NASZ_224_Dobar_koniecpaczka))
		&& (JAN_PACZKI == TRUE)
		&& (npc_hasitems (NASZ_107_Brutus, ItNa_PaczkaJana) == 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_dobar_Info()
{
	Npc_ClearAIQueue(NASZ_107_Brutus);
	
	B_StartOtherRoutine (NASZ_107_Brutus,"Die");
	AI_Teleport(NASZ_107_Brutus,"NASZ_BRUTUS_A");
	B_KillNpc(NASZ_107_Brutus);
	
	AI_Output (other,self ,"DIA_NASZ_106_Jan_dobar_15_00"); //Przychodz� odebra� paczki dla Dobara.
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_01"); //Niecz�sto zdarza si�, by przyszed� kto� od Dobara.
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_02"); //Jak na z�o�� wys�a�em Brutusa dos�ownie kwadrans temu.
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_03"); //Nie min�li�cie si� przypadkiem?
	AI_Output (other,self ,"DIA_NASZ_106_Jan_dobar_15_04"); //Nie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_05"); //Nie? Dziwne. Gdzie� on polaz�...
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_06"); //Je�li chcesz mie� te paczki to musisz go znale��.
	AI_Output (other,self ,"DIA_NASZ_106_Jan_dobar_15_07"); //A gdzie go szuka�?
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_08"); //Zwykle chodzi dooko�a bagna, g�r�. Musisz tam go szuka�.

	Wld_InsertNpc	(Meatbug,"FP_ROAM_BRUTUS_MEATBUG"); // chrz�szcz obok bartwego brutusa :)
				
	B_LogEntry (TOPIC_Dobar_paczka, "Sp�ni�em si�. Jan wys�a� przed chwil� swojego go�ca. Najprawdopodobniej poszed� dooko�a bagna, g�r�. Musz� go do�cign��.");
};

//*********************************************************************
//	BrutusIsDead
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_BrutusIsDead   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 15;
 	condition   = DIA_NASZ_106_Jan_BrutusIsDead_Condition;
 	information = DIA_NASZ_106_Jan_BrutusIsDead_Info;
 	permanent   = FALSE;
 	description = "Brutus nie �yje.";
};

FUNC INT DIA_NASZ_106_Jan_BrutusIsDead_Condition()
{
	if  (npc_isdead (NASZ_107_Brutus))
	&& ((npc_knowsinfo (other, DIA_NASZ_224_Dobar_koniecpaczka))
	|| (npc_hasitems(other, ItNa_PaczkaJana) > 0))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_BrutusIsDead_Info()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_BrutusIsDead_15_00"); //Brutus nie �yje.
	AI_Output (self, other,"DIA_NASZ_106_Jan_BrutusIsDead_55_01"); //Co si� sta�o?
	AI_Output (other, self,"DIA_NASZ_106_Jan_BrutusIsDead_55_02"); //Biedak sta� si� pokarmem dla zwierzyny.
	AI_Output (self, other,"DIA_NASZ_106_Jan_BrutusIsDead_55_03"); //C�... To przykra informacja. Brutus by� dobr� osob� i �wietnym pomocnikiem. Teraz tworzenie mieczy zajmie mi znacznie d�u�ej.
	
	B_GivePlayerXP (100);

};

//*********************************************************************
//	Info HowAreYou
//*********************************************************************
INSTANCE DIA_NASZ_106_Jan_HowAreYou   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 500;
 	condition   = DIA_NASZ_106_Jan_HowAreYou_Condition;
 	information = DIA_NASZ_106_Jan_HowAreYou_Info;
 	permanent   = TRUE;
 	description = "Jak leci?";
};

FUNC INT DIA_NASZ_106_Jan_HowAreYou_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_NASZ_106_Jan_HowAreYou_Info()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_HowAreYou_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_NASZ_106_Jan_HowAreYou_55_01"); //Jak z deszczu pod rynn�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_HowAreYou_55_02"); //Nie mam czasu na g�upie gadki.
};


/*********************************************************************
//	Info KurgKan 
//**********************************************************************/
INSTANCE DIA_NASZ_106_Jan_KurgKan   (C_INFO)
{
	npc         = NASZ_106_Jan;
	nr          = 1;
	condition   = DIA_NASZ_106_Jan_KurgKan_Condition;
	information = DIA_NASZ_106_Jan_KurgKan_Info;
	description = "Sk�d ci przyszed� do g�owy pomys�, by dawa� Krug-Kanowi zbroj� z blach paladyna?";
};

FUNC INT DIA_NASZ_106_Jan_KurgKan_Condition()
{
	if(KAPITEL >=3 && Npc_KnowsInfo(other,DIA_NASZ_452_KurgKan_Zbroja))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_106_Jan_KurgKan_Info()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_00"); //Sk�d ci przyszed� do g�owy pomys�, by dawa� Krug-Kanowi zbroj� z blach paladyna?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_01"); //Mieli�my pozosta�o�ci zbroi po renegatach i chcia�em zrobi� z nich co� ciekawego. My�l�, �e mi si� to uda�o.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_02"); //Z pewno�ci�, wygl�da bardzo interesuj�co. Nie my�la�e� nad tym, co powie Keroloth na to? Nie ba�e� si�?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_03"); //Szczerze? Bardzo i w momencie, kiedy przerabia�em te blachy, co chwil� wraca�a do mnie wyobra�enie Kerolotha, kt�ry mnie publicznie linczuje za pomys�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_04"); //Ale pomy�l: Zbroja paladyna dopasowana do orka. Nikt na to wcze�niej nie wpad�, bo nie mia� jak, a tu nadarzy�a si� taka okazja. Nie spr�bowa�by� na moim miejscu?
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_05"); //Rozumiem. Obudzi�a si� w tobie dusza artysty. Ale broni to mu nie chcia�e� zrobi�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_06"); //Bo nie mia�em pomys�u, ale z t� zbroj�... Jedna my�l i ju� mia�em ca�y projekt gotowy.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_07"); //No dobrze, ale jak zareagowa� Keroloth?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_08"); //Kiedy wr�czy�em zbroj� orkowi, wszyscy si� zebrali wok� niego i podziwiali moje dzie�o. Nie trzeba by�o czeka� d�ugo na reakcj� Kerolotha, kt�ry wyszed�, popatrzy� na niego i poszed�.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_09"); //To wszystko?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_10"); //A gdzie tam! Po parunastu minutach znowu wyszed�, stan�� przed orkiem i... zasalutowa� mu, jak paladyn paladynowi.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_11"); //�artujesz?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_12"); //Nie. Powiedzia� mu wtedy, �e jest bardziej godny noszenia tej zbroi, ni� poprzedni w�a�ciciele i ma nadziej�, �e Krug-Kan udowodni, �e jest prawdziwym obro�c� ludzko�ci i wiary w Innosa.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_13"); //I co na to Krug-Kan?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_14"); //Odpowiedzia�, �e ludzko�� jest najwa�niejsze, ale nie jest jeszcze przekonany, co do wiary w Innosa. My�la�em, �e Keroloth wpadnie w furi�, ale on tylko si� u�miechn�� i odszed�.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_15"); //Nie przyszed� do mnie p�niej z pretensjami, ani nic takiego, wi�c m�j pomys� si� uda� i nie zosta�em za to ukarany.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_16"); //Najwidoczniej.
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_106_Jan_PICKPOCKET (C_INFO)
{
	npc			= NASZ_106_Jan;
	nr			= 900;
	condition	= DIA_NASZ_106_Jan_PICKPOCKET_Condition;
	information	= DIA_NASZ_106_Jan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_106_Jan_PICKPOCKET_Condition()
{
	C_Beklauen (17);
};
 
FUNC VOID DIA_NASZ_106_Jan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_106_Jan_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_106_Jan_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_106_Jan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_106_Jan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_106_Jan_PICKPOCKET_DoIt);
};

func void DIA_NASZ_106_Jan_PICKPOCKET_DoIt()
{
	B_BeklauenThings (ItMiSwordraw, 3);
	Info_ClearChoices (DIA_NASZ_106_Jan_PICKPOCKET);
};
	
func void DIA_NASZ_106_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_106_Jan_PICKPOCKET);
};

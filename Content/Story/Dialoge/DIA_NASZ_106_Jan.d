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
	AI_Output (other,self ,"DIA_NASZ_106_Jan_hello_15_00"); //Jesteœ kowalem?
	AI_Output (self, other,"DIA_NASZ_106_Jan_hello_55_01"); //A kim¿e jeszcze móg³bym byæ?
	AI_Output (other,self ,"DIA_NASZ_106_Jan_hello_15_02"); //Nie wygl¹dasz na kowala.
	AI_Output (self, other,"DIA_NASZ_106_Jan_hello_55_03"); //Faktycznie, do Górniczej Doliny przyby³em jako ³owca smoków. Na ca³e moje szczêœcie pewien cz³owiek za³atwi³ mi pracê w zamkowej kuŸni.
	AI_Output (self, other,"DIA_NASZ_106_Jan_hello_55_04"); //Pogoñ za pieniêdzmi zapêdzi³a mnie zbyt daleko. Cieszê siê, ¿e nie zgin¹³em spalony na popió³.
};

//*********************************************************************
//	Info WykujeszDlaMnie
//*********************************************************************
var int JanZaplataZaKowalstwoFail;
var int JanZaplataZaKowalstwo;
// 1 - 10 ¿elaztw za projekt
// 2 - 10 ¿elaztw za projekt i 10 szt, z³ota
// 3 - 12 ¿elaztw za projekt i 30 szt. z³ota
// 4 - 15 ¿elaztw za projekt

INSTANCE DIA_NASZ_106_Jan_WykujeszDlaMnie(C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 2;
 	condition   = DIA_NASZ_106_Jan_WykujeszDlaMnie_Condition;
 	information = DIA_NASZ_106_Jan_WykujeszDlaMnie_Info;
 	permanent   = FALSE;
 	description = "Wykujesz dla mnie broñ?";
};

FUNC INT DIA_NASZ_106_Jan_WykujeszDlaMnie_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_Info()
{
	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Jan mo¿e wykuæ dla mnie broñ, jeœli przyniosê mu trochê zardzewia³ych mieczy i innego ¿elastwa.");

	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnie_15_00"); //Wykujesz dla mnie broñ?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_55_01"); //Pytaj Johny'ego o dostawê, a mnie daj spokój.
	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnie_15_02"); //Mia³em na myœli specjalne projekty.
	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnie_15_03"); //Nie znam siê na kowalstwie, a nauka tego rzemios³a zajê³aby mi szmat czasu.
	AI_Output (other, self,"DIA_NASZ_106_Jan_WykujeszDlaMnie_15_04"); //Ale jeœli ty jesteœ doœwiadczony w tym fachu, to mo¿e wyku³byœ dla mnie coœ specjalnego, gdybym poprosi³?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_55_05"); //A co ja bêdê z tego mia³?

	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Zap³acê ci z³otem.", DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mogê za³atwiaæ ci surowce.", DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mo¿e trochê magicznej rudy?", DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto_15_00"); //Zap³acê ci z³otem.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto_15_01"); //Stanowczo odmawiam! Co ja niby zrobiê z tym z³otem?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto_15_02"); //Obrót pieniê¿ny w Górniczej Dolinie nie jest ju¿ taki, jak parê miesiêcy temu.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zloto_15_03"); //Co, mamy handlowaæ z orkami? Nie, nie, przekonuj mnie dalej.
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce_15_00"); //Mogê za³atwiaæ ci surowce.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce_15_01"); //Ca³kiem niez³y pomys³. Bêdziesz przynosi³ mi tu wszelkie ¿elastwo, jakie znajdziesz.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce_15_02"); //Zardzewia³e miecze, surowa stal, srebro. 10 sztuk w zamian za realizacjê projektu.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce_15_03"); //To co, umowa stoi?

	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Zgoda. ¯elastwo w zamian za wykuwanie.", DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Tak, jeœli dostanê za ka¿d¹ dostawê 50 sztuk z³ota.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie);	
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda_15_00"); //Zgoda. ¯elastwo w zamian za wykuwanie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda_15_01"); //W takim razie czekam na materia³y. Przed ka¿dym zleceniem masz mi przynieœæ 10 sztuk czegoœ, co mogê przetopiæ.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_zgoda_15_02"); //Dopiero potem mo¿esz upominaæ siê o miecz.
	
	JanZaplataZaKowalstwo = 1;
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie_15_00"); //Tak, jeœli dostanê za ka¿d¹ dostawê 50 sztuk z³ota.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie_15_01"); //Piêædziesi¹t? Chyba œnisz. Proponujê 10 sztuk, nie wiêcej.
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Zgoda.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniezgoda);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Chcê 30.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30);	
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Chcê 50.", DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniezgoda()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniezgoda_15_00"); //Zgoda.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowaniezgoda_15_01"); //No dobra, a wiêc materia³y w zamian za trochê z³ota i zlecenie projektu.
	
	JanZaplataZaKowalstwo = 2;
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30_15_00"); //Chcê 30.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30_15_01"); //30 sztuk z³ota... Niech bêdzie, ale warunek jest jeden:
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30_15_02"); //Bêdziesz mi przynosiæ nie dziesiêæ, a dwanaœcie sztuk ¿elaztwa.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie30_15_03"); //Dobijemy w koñcu targu?
	
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
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50_15_00"); //Chcê 50.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50_15_01"); //50? Nie. Jeœli nie zgadzasz siê na moje warunki, to nie wykujê dla ciebie miecza.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_targowanie50_15_02"); //Poszukaj sobie innego parobka.
	
	JanZaplataZaKowalstwoFail = TRUE;
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda_15_00"); //Mo¿e trochê magicznej rudy?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda_15_01"); //Magiczna ruda, powiadasz...
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_ruda_15_02"); //Jak myœlisz, ilu jest tutaj facetów, którzy potrafi¹ w³adaæ broni¹ wykut¹ z magicznej rudy?

	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Czy przypadkiem nie wszyscy?", DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy);	
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mo¿e jakaœ po³owa z nich.", DIA_NASZ_106_Jan_WykujeszDlaMnie_polowa);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Oko³o piêciu rycerzy.", DIA_NASZ_106_Jan_WykujeszDlaMnie_pieciu);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy_15_00"); //Czy przypadkiem nie wszyscy?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy_15_01"); //No w³aœnie problem w tym, ¿e nie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_wszyscy_15_02"); //Dlatego nic mi po rudzie.
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mogê za³atwiaæ ci surowce.", DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_polowa()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_polowa_15_00"); //Mo¿e jakaœ po³owa z nich.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_polowa_15_01"); //No... Mniej. Ale niewa¿ne. To i tak za ma³o, ¿ebym mia³ zapotrzebowanie na magiczn¹ rudê.
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mogê za³atwiaæ ci surowce.", DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce);
};

FUNC VOID DIA_NASZ_106_Jan_WykujeszDlaMnie_pieciu()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_WykujeszDlaMnie_pieciu_15_00"); //Oko³o piêciu rycerzy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnie_pieciu_15_01"); //Zgadza siê. I jak myœlisz, potrzeba mi du¿o magicznej rudy?
	
	Info_ClearChoices (DIA_NASZ_106_Jan_WykujeszDlaMnie);
		Info_AddChoice	  (DIA_NASZ_106_Jan_WykujeszDlaMnie, "Mogê za³atwiaæ ci surowce.", DIA_NASZ_106_Jan_WykujeszDlaMnie_surowce);
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
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_55_01"); //Naprawdê ci na tym zale¿y, co?
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_55_02"); //W takim razie pozostaniemy przy moich warunkach.
	AI_Output (self, other,"DIA_NASZ_106_Jan_WykujeszDlaMnieAgain_55_03"); //15 sztuk ¿elaztwa, dowolnego. I to moje ostatnie s³owo.
	
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
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Back_Tomorrow_15_01"); //W takim razie zabieram siê do roboty.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Back_Tomorrow_15_02"); //Wróæ jutro, broñ bêdzie gotowa.
};

func void Jan_Say_Lack_Items()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_Say_Lack_Items_15_00"); //Nie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Lack_Items_15_01"); //A wiêc nic z tego.
};

func void Jan_Say_Twice()
{
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Twice_15_00"); //Znowu to samo?
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Twice_15_01"); //Nie, nie. Daj mi najpierw dokoñczyæ to, co zacz¹³em.
};

func void Jan_Say_Have_You()
{
	AI_Output (self, other,"DIA_NASZ_106_Jan_Say_Have_You_15_00"); //A masz wszystkie potrzebne materia³y?
};


INSTANCE DIA_NASZ_106_Jan_Wykuj   (C_INFO)
{
	npc         = NASZ_106_Jan;
 	nr          = 2;
 	condition   = DIA_NASZ_106_Jan_Wykuj_Condition;
 	information = DIA_NASZ_106_Jan_Wykuj_Info;
 	permanent   = TRUE;
 	description = "Wykuj dla mnie broñ.";
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_15_00"); //Wykuj dla mnie broñ.
	
	if(JanZaplacone == FALSE) {
	
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_55_01"); //Zalegasz z dostaw¹. Masz surowce?
		if(Jan_Placenie_Mam(JanZaplataZaKowalstwo) == TRUE) {
			AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_55_02"); //Mam, trzymaj.
			Jan_Placenie_Placenie(JanZaplataZaKowalstwo);
			JanZaplacone = TRUE;
		}
		else {
			AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_55_03"); //Eee... nie mam.
			AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_55_04"); //Pamiêtaj o naszej umowie: Najpierw surowce.
			return;
		};
	};
	

	AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_15_05"); //Co teraz?

	// tutaj receptury
	Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
		Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, DIALOG_BACK, DIA_NASZ_106_Jan_Wykuj_Back);
		
		if(npc_hasitems (other, ItNa_Projekt_MieczSedziego) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz sêdziego.", DIA_NASZ_106_Jan_Wykuj_MieczSedziego); };
		if(npc_hasitems (other, ItNa_Projekt_MieczBojowy) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz bojowy.", DIA_NASZ_106_Jan_Wykuj_MieczBojowy); };
		if(npc_hasitems (other, ItNa_Projekt_MieczWojenny) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz wojenny.", DIA_NASZ_106_Jan_Wykuj_MieczWojenny); };
		if(npc_hasitems (other, ItNa_Projekt_MieczSwiatla) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz œwiat³a.", DIA_NASZ_106_Jan_Wykuj_MieczSwiatla); };
		if(npc_hasitems (other, ItNa_Projekt_Zmija) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "¯mija.", DIA_NASZ_106_Jan_Wykuj_Zmija); };
		if(npc_hasitems (other, ItNa_Projekt_CwiekowanaMaczuga) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Æwiekowana maczuga.", DIA_NASZ_106_Jan_Wykuj_CwiekowanaMaczuga); };
		if(npc_hasitems (other, ItNa_Projekt_MieczNienawisci) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Miecz nienawiœci.", DIA_NASZ_106_Jan_Wykuj_MieczNienawisci); };
		if(npc_hasitems (other, ItNa_Projekt_ChlopskiMiecz) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Ch³opski miecz.", DIA_NASZ_106_Jan_Wykuj_ChlopskiMiecz); };
		if(npc_hasitems (other, ItNa_Projekt_DobryMiecz) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Dobry miecz.", DIA_NASZ_106_Jan_Wykuj_DobryMiecz); };
		if(npc_hasitems (other, ItNa_Projekt_DobryDlugiMiecz) >= 1) {
			Info_AddChoice	(DIA_NASZ_106_Jan_Wykuj, "Dobry d³ugi miecz.", DIA_NASZ_106_Jan_Wykuj_DobryDlugiMiecz); };
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczSwiatla_15_00"); //Miecz œwiat³a.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanMieczSwiatlaDay != 0) && (JanMieczSwiatlaDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_MieczSwiatla, 1);
	B_UseFakeScroll();
	
	if(MieczSwiatla_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczSwiatla_15_01"); //Co my tu mamy... Mam nadziejê, ¿e dam radê uporaæ siê z tym kryszta³em.
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczSedziego_15_00"); //Miecz sêdziego.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanMieczSedziegoDay != 0) && (JanMieczSedziegoDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_MieczSedziego, 1);
	B_UseFakeScroll();
	
	if(MieczSedziego_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczSedziego_15_01"); //Ku³em kiedyœ coœ takiego dla pewnego zarozumialca.
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczSedziego_15_02"); //Ale¿ z niego by³a paskuda! Grubas i do tego mia³ strasznie brzydk¹ gêbê. Trochê siê od niego ró¿nisz.
		
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
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_DobryMiecz_15_01"); //Nie powinienem mieæ z tym problemu.
		
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_Zmija_15_00"); //¯mija.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanZmijaDay != 0) && (JanZmijaDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_Zmija, 1);
	B_UseFakeScroll();
	
	if(Zmija_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_Zmija_15_01"); //A có¿ to za dziwactwo?
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_Zmija_15_02"); //Nigdy jeszcze nie ku³em takiego miecza. Mam nadziejê, ¿e niczego nie zawalê.	
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
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_RunaMocy_15_01"); //Bardzo d³ugi miecz dwurêczny. A¿ cztery kawa³ki stali! Na dwurêczniaki ³owców zu¿ywam tylko trzy.
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
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_Inkwizytor_15_01"); //Inkwizytor? Dziwne... Projektant chyba trochê przesadzi³ z nazw¹. Nie wygl¹da to zbyt potê¿nie.
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
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_Oskard_15_01"); //Robi³em ju¿ bronie tego typu. To bêdzie ³atwe.
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
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_ElBastardo_15_01"); //To musi byæ piêkna broñ i nie lada wyczyn dla jej twórcy.
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
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_RubinoweOstrze_15_01"); //Nie³atwo bêdzie stworzyæ ten klejnot, ale spróbujê.
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_DobryDlugiMiecz_15_00"); //Dobry d³ugi miecz.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanDobryDlugiMieczDay != 0) && (JanDobryDlugiMieczDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};


	B_GiveInvItems (other, self, ItNa_Projekt_DobryDlugiMiecz, 1);
	B_UseFakeScroll();
	
	if(DobryDlugiMiecz_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_DobryDlugiMiecz_15_01"); //Dobrze to wygl¹da. Tylko strasznie nabazgrolony ten projekt.
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
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczBojowy_15_01"); //Widzia³em ju¿ miecze tego typu. Faktycznie, bardzo stabilnie siedz¹ w d³oni.
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
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczWojenny_15_01"); //Wilcze k³y? Na to bym sam nie wpad³.	
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_ChlopskiMiecz_15_00"); //Ch³opski miecz.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanChlopskiMieczDay != 0) && (JanChlopskiMieczDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};

	B_GiveInvItems (other, self, ItNa_Projekt_ChlopskiMiecz, 1);
	B_UseFakeScroll();
	
	if(ChlopskiMiecz_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_ChlopskiMiecz_15_01"); //A có¿ to za badziewie? Ale skoro chcesz...
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_CwiekowanaMaczuga_15_00"); //Æwiekowana maczuga.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanCwiekowanaMaczugaDay != 0) && (JanCwiekowanaMaczugaDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};

	B_GiveInvItems (other, self, ItNa_Projekt_CwiekowanaMaczuga, 1);
	B_UseFakeScroll();
	
	if(CwiekowanaMaczuga_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_CwiekowanaMaczuga_15_01"); //Widzia³em ju¿ gdzieœ tak¹ broñ. Zobaczymy, co z tego wyjdzie.	
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_00"); //Miecz nienawiœci.

	// jesli chcesz dwa razy ten sam miecz, to zablokuj
	if((JanMieczNienawisciDay != 0) && (JanMieczNienawisciDay == Wld_GetDay())) {
		Jan_Say_Twice();
		//konczy dialog
		Info_ClearChoices (DIA_NASZ_106_Jan_Wykuj);
	};

	B_GiveInvItems (other, self, ItNa_Projekt_MieczNienawisci, 1);
	B_UseFakeScroll();
	
	if(MieczNienawisci_OneTime == FALSE) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_01"); //Czyta³eœ ten projekt?
		if(Projekt_MieczNienawisci_OneTime == TRUE) {
			AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_02"); //Tak.
			AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_03"); //To pewnie siê domyœlasz, ¿e musisz daæ mi piwa, jeœli chcesz ten miecz. Haha!
		} else {
			AI_Output (other, self,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_04"); //Nie.
			AI_Output (self, other,"DIA_NASZ_106_Jan_Wykuj_MieczNienawisci_15_05"); //W takim razie musisz wiedzieæ, ¿e autor projektu za¿yczy³ sobie tak¿e piwa. Haha!
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
	AI_Output (self, other,"DIA_NASZ_106_Jan_Oddawanie_55_00"); //Hej, jesteœ.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Oddawanie_55_01"); //Twoje zamówienie gotowe.
		
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
	
	
	
	AI_Output (self, other,"DIA_NASZ_106_Jan_Oddawanie_55_02"); //Jakbyœ jeszcze czegoœ potrzebowa³, to pamiêtaj o naszej umowie!
	

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
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_00"); //Jesteœ wreszcie. Masz tu do odbioru ostrze.

	Createinvitems (self, Itna_OstrzeLowcy, 1);
	B_giveinvitems (self, other, ItNa_OstrzeLowcy, 1);

	AI_Output (other,self ,"DIA_NASZ_106_Jan_arena_15_01"); //Co to za miecz?
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_02"); //Nazwa³em go 'Ostrzem ³owcy'. Jest nawet lekkie, jak na jego potêgê.
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_03"); //Z takim ostrzem bêdziesz postrachem Doliny.
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_04"); //Ale to nie wszystko...
	AI_Output (other,self ,"DIA_NASZ_106_Jan_arena_15_05"); //To znaczy?
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_06"); //Wpad³em na pomys³ stworzenia pe³nego kompletu ³owcy.
	AI_Output (other,self ,"DIA_NASZ_106_Jan_arena_15_07"); //Miecz, kusza i tarcza?
	AI_Output (self, other,"DIA_NASZ_106_Jan_arena_55_08"); //Zgadza siê. Jednak bêdê potrzebowa³ do tego surowców.
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
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_01"); //Po pierwsze to cz³owieka, który zrobi kuszê.
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_02"); //Jestem kowalem. Kusze to nie moja specjalnoœæ.
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_03"); //Jeœli chodzi o tarczê, to potrzebujê zêbów b³otnego wê¿a, rogu cieniostwora i dwa k³y trolla.
	AI_Output (other,self ,"DIA_NASZ_106_Jan_surowce_15_04"); //Kto nauczy mnie oprawiaæ te potwory?
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_05"); //Có¿, najlepiej by³oby popytaæ myœliwych. Byæ mo¿e takie trofea da siê te¿ znaleŸæ albu kupiæ.
	AI_Output (self, other,"DIA_NASZ_106_Jan_surowce_55_06"); //Powodzenia.

	Log_CreateTopic (TOPIC_Jan_lowca, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jan_lowca, LOG_RUNNING);
	B_LogEntry (TOPIC_Jan_lowca, "Kowal Jan wpad³ na pomys³ zrobienia kompletu ³owcy, czyli miecza, kuszy i zbroi. Miecz ju¿ zrobi³. Muszê znaleŸæ kogoœ, kto zrobi³by kuszê i zgromadziæ nastêpuj¹ce surowce: zêby b³otnego wê¿a, róg cieniostwora i dwa k³y trolla.");
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
	AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_01"); //Doskonale. Zabieram siê do pracy!
	AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_02"); //Za dwa dni powinienem skoñczyæ. A co z kusz¹? Znalaz³eœ ju¿ kogoœ?
	
	if (npc_knowsinfo (other, DIA_NASZ_119_Udar_CrossBowReady))
	{
		AI_Output (other,self ,"DIA_NASZ_106_Jan_HaveSurowce_15_03"); //Nawet odebra³em kuszê. Teraz czekam tylko na tarczê.
		AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_04"); //W takim razie muszê siê pospieszyæ. Mo¿e jednak uda mi siê skoñczyæ do jutra.
		JanKuszaDay1 = Wld_GetDay();
		B_LogEntry (TOPIC_Jan_lowca, "Muszê siê zg³osiæ do Jana jutro.");
	}
	
	else if (npc_knowsinfo (other, DIA_NASZ_119_Udar_DoCrossBow))
	{
		AI_Output (other,self ,"DIA_NASZ_106_Jan_HaveSurowce_15_05"); //Tak, Udar wykona j¹ dla mnie.
		AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_06"); //Ciekawe, jak bêdziesz wygl¹da³ w pe³nym wyposa¿eniu.
		JanKuszaDay2 = Wld_GetDay();
		B_LogEntry (TOPIC_Jan_lowca, "Muszê siê zg³osiæ do Jana za dwa dni.");
	}
	
	else
	{
		AI_Output (other,self ,"DIA_NASZ_106_Jan_HaveSurowce_15_07"); //Jeszcze nie.
		AI_Output (self, other,"DIA_NASZ_106_Jan_HaveSurowce_55_08"); //Myœla³em, ¿e sam wpadniesz na to, ¿e wystarczy poprosiæ Udara.
		JanKuszaDay2 = Wld_GetDay();
		B_LogEntry (TOPIC_Jan_lowca, "Muszê siê zg³osiæ do Jana za dwa dni. Jan poinstruowa³ mnie tak¿e, ¿ebym zapyta³ Udara, czy wykona kuszê.");
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
	AI_Output (self, other,"DIA_NASZ_106_Jan_TarczaReady_55_01"); //Mam nadziejê, ¿e ci siê spodoba. No, a teraz poka¿ mi siê w pe³nym wyposa¿eniu ³owcy.

	B_LogEntry (TOPIC_Jan_lowca, "Mam ju¿ kuszê. Jan chce mnie zobaczyæ z za³o¿onym mieczem, tarcz¹ i kusz¹.");
};



var int JanSaidAboutUltraArmor;
func void JanSay_AboutUltraArmor() {

	AI_Output (self, other,"DIA_NASZ_106_Jan_AboutUltraArmor_55_00"); //Z pancerzy elitarnych wojowników uda³o mi siê zrobiæ nie lada zbrojê. Jest trochê ciê¿ka, ale krzepy ci raczej nie brakuje, prawda?
	AI_Output (self, other,"DIA_NASZ_106_Jan_AboutUltraArmor_55_01"); //Mogê ci j¹ sprzedaæ, jeœli chcesz.
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
	AI_Output (self, other,"DIA_NASZ_106_Jan_KompletReady_15_00"); //Wygl¹dasz fantastycznie! To jest to.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KompletReady_55_01"); //Zabieram siê za tworzenie kolejnych kompletów.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KompletReady_55_02"); //W nagrodê za pomoc mo¿esz zatrzymaæ te rzeczy zupe³nie za darmo.

	if (KAPITEL >= 4 && RepEnough(90,REP_LOWCY)) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_KompletReady_55_03"); //Ale to nie wszystko!
		JanSay_AboutUltraArmor();
	};
	
	DodajReputacje(4,REP_LOWCY);
	B_GivePlayerXP (1000);
	Log_SetTopicStatus (TOPIC_Jan_lowca, LOG_SUCCESS);
	B_LogEntry (TOPIC_Jan_lowca, "Jan by³ zachwycony moim wygl¹dem. Zacznie teraz tworzyæ nowe zestawy wyposa¿enia dla wojowników.");
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
 	description = "Sprzedaj mi zbrojê (3000 szt. z³ota)";
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_BuyUltraArmor_15_00"); //Sprzedaj mi zbrojê.
	
	if (npc_hasitems(other,ItMi_Gold) < 3000) {
		AI_Output (self, other,"DIA_NASZ_106_Jan_BuyUltraArmor_55_01"); //Nie ma z³ota, nie ma zbroi.
		return;
	};
	
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	AI_Output (self, other,"DIA_NASZ_106_Jan_BuyUltraArmor_55_02"); //Proszê. Masz tu te¿ he³m do kompletu.

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
 	description = "Mogê siê jakoœ przydaæ?";
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
	AI_Output (other,self ,"DIA_NASZ_106_Jan_work1_15_00"); //Mogê siê jakoœ przydaæ?
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_01"); //Hmm... Nie wygl¹dasz na kogoœ, kto wie jak siê wykuwa broñ, ale chyba mia³bym coœ dla ciebie.
	AI_Output (other,self ,"DIA_NASZ_106_Jan_work1_15_02"); //W czym problem?
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_03"); //Brakuje mi z³ota...
	AI_Output (other,self ,"DIA_NASZ_106_Jan_work1_15_04"); //Z³ota? I co, mam ci zap³aciæ?
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_05"); //Nie, idioto. Nie o takim z³ocie mówiê. Chodzi mi o bry³ki z³ota. Przynieœ ich, powiedzmy, dziesiêæ.	
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_06"); //Wykujê z nich wiele mocnych i piêknych orê¿y.
	AI_Output (self, other,"DIA_NASZ_106_Jan_work1_55_07"); //Mo¿e tobie te¿ siê wtedy coœ dostanie.

	Log_CreateTopic (TOPIC_Jan_zloto, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jan_zloto, LOG_RUNNING);
	B_LogEntry (TOPIC_Jan_zloto, "Jan chce, bym przyniós³ mu 10 samorodków z³ota. W Górniczej Dolinie znajdê parê ¿y³ z³ota i jeœli szczêœcie mi dopisze, dam radê wykonaæ to doœæ jasne zadanie.");
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
 	description = "Mam bry³ki.";
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
	AI_Output (other,self ,"DIA_NASZ_106_Jan_finish1_15_00"); //Mam bry³ki, o które prosi³eœ.
	B_giveinvitems (other, self, ItMi_GoldNugget_Addon, 10);
	AI_Output (self, other,"DIA_NASZ_106_Jan_finish1_55_01"); //Œwietna robota. Skoro uda³o ci siê je zdobyæ, to zapewne nie bêdziesz mia³ problemu z kolejn¹ dostaw¹.
	AI_Output (other, self,"DIA_NASZ_106_Jan_finish1_55_02"); //Mam znowu uganiaæ siê za grudkami z³ota po jaskiniach?!
	AI_Output (self, other,"DIA_NASZ_106_Jan_finish1_55_03"); //W ¿adnym wypadku. Kopacz Daniel zalega z dostaw¹. Zajrzyj do niego i upomnij siê o dziesiêæ bry³ek.

	if (Npc_GetDistToWP	(NASZ_122_Daniel, "NASZ_LOWCY_DOL_09") > 5000)
	{
		AI_Output (other, self,"DIA_NASZ_106_Jan_finish1_55_04"); //Gdzie podziewa siê ten cz³owiek?
		AI_Output (self, other,"DIA_NASZ_106_Jan_finish1_55_05"); //Domyœlam siê, ¿e jest przy swoim niedu¿ym oboziku.
		AI_Output (self, other,"DIA_NASZ_106_Jan_finish1_55_06"); //IdŸ w stronê obozu myœliwych, a potem w stronê du¿ej wie¿y na po³udniu. Znajdziesz go obok opuszczonej kopalni.
	
	};
	
	B_GivePlayerXP(100);
	B_LogEntry (TOPIC_Jan_zloto, "Przynios³em i ci¹gle ma³o! Mam siê udaæ do Daniela i za³atwiæ kolejne bry³ki. Kopacz przebywa w pobli¿u opuszczonej kopalni obok du¿ej wie¿y na po³udniu.");
	
};


var int Jan_DaySztylet;
func void Jan_finishSamorodki_DIA() {

	AI_Output (other,self ,"Jan_finishSamorodki_DIA_15_00"); //Oto 10 bry³ek z³ota.
	B_giveinvitems (other, self, ItMi_GoldNugget_Addon, 10);
	AI_Output (self, other,"Jan_finishSamorodki_DIA_55_01"); //Œwietnie. OdwiedŸ mnie jutro, to coœ ci siê dostanie.
	
	Jan_DaySztylet = Wld_GetDay ();

	DodajReputacje (4, REP_LOWCY);
	B_LogEntry (TOPIC_Jan_zloto, "Przynios³em Janowi z³oto. Mam zg³osiæ siê jutro do niego po moj¹ nagrodê.");
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
 	description = "Oto 10 bry³ek z³ota.";
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
 	description = "Oto 10 bry³ek z³ota. (Oddaj brudne bry³ki.)";
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
	
		AI_Output			(self, other, "DIA_NASZ_106_Jan_ZlotySztylet_15_00"); //Jesteœ! Z tego z³ota powsta³a ca³kiem fajna zabawka.

		CreateInvItems (self,ItNa_ZlotySztylet,1);
		B_giveinvitems (self, other, ItNa_ZlotySztylet, 1);

		AI_Output			(self, other, "DIA_NASZ_106_Jan_ZlotySztylet_15_01"); //WeŸ to. Co o tym myœlisz?
		
		AI_ReadyMeleeWeapon	(other);
		AI_PlayAni	(other, "T_1HSINSPECT");

		AI_Output			(other, self, "DIA_NASZ_106_Jan_ZlotySztylet_15_02"); //£adnie zdobiony.
		AI_Output			(self, other, "DIA_NASZ_106_Jan_ZlotySztylet_15_03"); //Zgadza siê. Jeœli nie bêdziesz chcia³ nim walczyæ, to mo¿esz zawsze sprzedaæ go któremuœ handlarzowi.

		B_LogEntry (TOPIC_Jan_zloto, "Z tych samorodków Jan zrobi³ piêkny z³oty sztylet. Lekki, ale ostry jak brzytwa.");
		Log_SetTopicStatus (TOPIC_Jan_zloto, LOG_SUCCESS);
	}
	else
	{
		AI_Output			(self, other, "DIA_NASZ_106_Jan_ZlotySztylet_15_04"); //To z³oto, które mi da³eœ, by³o tak brudne, ¿e nic z nim nie zrobi³em!
			
		B_LogEntry (TOPIC_Jan_zloto, "Jan trochê siê wkurzy³, ale co z tego? Daniel przynajmniej bêdzie mnie uczy³ za darmo.");
		Log_SetTopicStatus (TOPIC_Jan_zloto, LOG_SUCCESS);

		Info_ClearChoices (DIA_NASZ_106_Jan_ZlotySztylet);
			Info_AddChoice	  (DIA_NASZ_106_Jan_ZlotySztylet, "Widocznie Daniel nie przy³o¿y³ siê do swojej pracy.", DIA_NASZ_106_Jan_ZlotySztylet_yes);
			Info_AddChoice	  (DIA_NASZ_106_Jan_ZlotySztylet, "No to mo¿e weŸmiesz siê za kucie broni z porz¹dnych materia³ów?", DIA_NASZ_106_Jan_ZlotySztylet_no);

	};
};

FUNC VOID DIA_NASZ_106_Jan_ZlotySztylet_yes()
{
	AI_Output (other,self ,"DIA_NASZ_106_Jan_ZlotySztylet_yes_15_00"); //Widocznie Daniel nie przy³o¿y³ siê do swojej pracy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_ZlotySztylet_yes_15_01"); //Nie wiem, z czego wynika jego lekcewa¿enie pracy.
	AI_Output (self, other,"DIA_NASZ_106_Jan_ZlotySztylet_yes_15_02"); //Ten cz³owiek kopie chyba przede wszystkim dla samego siebie.

	Info_ClearChoices (DIA_NASZ_106_Jan_ZlotySztylet);
};
		
FUNC VOID DIA_NASZ_106_Jan_ZlotySztylet_no()
{
	AI_Output (other, self,"DIA_NASZ_106_Jan_ZlotySztylet_no_55_00"); //No to mo¿e weŸmiesz siê za kucie broni z porz¹dnych materia³ów?
	AI_Output (self, other,"DIA_NASZ_106_Jan_ZlotySztylet_no_55_01"); //Aaa! Wiêc zrobi³eœ to celowo!
	AI_Output (self, other,"DIA_NASZ_106_Jan_ZlotySztylet_no_55_02"); //Nie wiem, czemu ze mn¹ pogrywasz, ale zaraz poka¿ê ci grê po swojemu.

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
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_00"); //Ha, wreszczie ciê widzê.
	AI_Output			(other, self, "DIA_NASZ_106_Jan_Kap3Quest_15_01"); //Dlaczego czeka³eœ w³aœnie na mnie? Czy ju¿ tylko ja jestem tu czegoœ wart?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_02"); //Tylko ty zwiedzasz Górnicz¹ Dolinê. Reszty albo to nie obchodzi albo s¹ znurzeni t¹ krain¹ i nie rusz¹ siê st¹d bez rozkazu Kerolotha. A ten aktualnie jest nieobecny.
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_03"); //Moja proœba mo¿e siê wydawaæ obrzydliwa, ale chyba nie ma innego rozwi¹zania.
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_04"); //Nasi ¿o³nierze potrzebuj¹ ochrony g³owy. He³my to bardzo istotna czêœæ zbroi. Problem w tym, ¿e wykonanie ich zajmuje szmat czasu.
	AI_Output			(other, self, "DIA_NASZ_106_Jan_Kap3Quest_15_05"); //Co wiêc wymyœli³eœ?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_06"); //Wykorzystamy he³my martwych rycerzy. Przynieœ mi ich kilka, a ja je wzmocniê i dostarczê wojownikom.
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3Quest_15_07"); //Przynieœ przynajmniej piêæ he³mów.

	Will_Can_Take_Helmets = TRUE;
	Log_CreateTopic (TOPIC_Jan_helmy, LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jan_helmy, LOG_RUNNING);
	B_LogEntry (TOPIC_Jan_helmy, "Jan chce wyposa¿yæ kilku ³owców orków w he³my, jednak¿e zrobienie takiego jest strasznie czasoch³onne. Muszê za³atwiæ mu 5 he³mów martwych rycerzy");

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
	description	= 	"Gdzie znajdê cia³a poleg³ych wojowników?";
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
	AI_Output			(other, self, "DIA_NASZ_106_Jan_WhereBodies_15_00"); //Gdzie znajdê cia³a poleg³ych wojowników?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_WhereBodies_15_01"); //Rzecz jasna na prze³êczy! Myœlê, ¿e w kopalniach obok starej wie¿y na po³udniu równie¿ znajdziesz rycerzy i he³my.
	AI_Output			(self, other, "DIA_NASZ_106_Jan_WhereBodies_15_02"); //Nie zapomnij o kopalni z pe³zaczami. Gdy zajê³y kopalniê, zabi³y wielu dzielnych ludzi.
	AI_Output			(other, self, "DIA_NASZ_106_Jan_WhereBodies_15_03"); //Mam nadziejê, ¿e uda mi siê odszukaæ doœæ du¿o he³mów nadaj¹cych siê do u¿ycia.
	
	B_LogEntry (TOPIC_Jan_helmy, "Wojownicy mog¹ le¿eæ na prze³êczy, w kopalni obok wie¿y na po³udniu albo w kopalni zajêtej przez pe³zacze.");

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
	description	= 	"Przynios³em piêæ he³mów.";
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
	AI_Output			(other, self, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_00"); //Przynios³em piêæ he³mów.
	B_GiveInvItems(other,self,ItNa_KolczugaRycerza,5);
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_01"); //Doskonale, od razu zabieram siê do pracy. Mam nadziejê, ¿e œci¹ganie he³mów z pognitych g³ów nie by³o zbyt obrzydliwe?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_02"); //Te he³my cuchn¹ niczym przypalone mleko kretoszczura...
	AI_Output			(other, self, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_03"); //Jakoœ da³em sobie radê, chocia¿ móg³byœ jakoœ mi to zrekompensowaæ. Nie s¹dzisz?
	AI_Output			(self, other, "DIA_NASZ_106_Jan_Kap3QuestFinish_15_04"); //No tak, oczywiœcie! Przyjmij ten magiczny pierœcieñ. Wzmocni ciê.
	
	CreateInvItems(self,ItRi_Hp_02,1);
	B_GiveInvItems(self,other,ItRi_Hp_02,1);
	
	B_GivePlayerXP(700);
	DodajReputacje(4,REP_LOWCY);
	
	Log_SetTopicStatus (TOPIC_Jan_helmy, LOG_SUCCESS);
	B_LogEntry (TOPIC_Jan_helmy, "Przynios³em Janowi he³my.");

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
			B_LogEntry (TOPIC_Rethon_fajka, "Uda³o siê! Znalaz³em fajkê w ziemi!");
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
	description = "S³ysza³em, ¿e ktoœ z ³owców okrad³ myœliwych.";
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_goth_15_00"); //S³ysza³em, ¿e ktoœ z ³owców okrad³ myœliwych.
	AI_Output (self, other,"DIA_NASZ_106_Jan_goth_55_01"); //Rzeczywiœcie, by³o coœ takiego. Keroloth zebra³ wtedy wszystkich ch³opców i wydar³ siê na nich.
	AI_Output (self, other,"DIA_NASZ_106_Jan_goth_55_02"); //¯aden siê jednak nie przyzna³. Sprawa teraz ucich³a.
	AI_Output (other, self,"DIA_NASZ_106_Jan_goth_15_03"); //Keroloth... Dziêki.

	B_LogEntry (TOPIC_Goth_kradziez, "Jan powiedzia³ mi, ¿e Keroloth zebra³ wszystkich ³owców i wydar³ siê na nich. Nic dziwnego, ¿e nie chce pogarszaæ stosunków z myœliwymi. Mo¿e powinienem zapytaæ Kerolotha, co on o tym wszystkim myœli.");

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
	description = "Potrzebujê gwoŸdzi.";
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_Gwozdzie_15_00"); //Potrzebujê gwoŸdzi.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Gwozdzie_55_01"); //GwoŸdzie? Ma³e metalowe prêty zakoñczone ostr¹ koñcówk¹?
	AI_Output (other, self,"DIA_NASZ_106_Jan_Gwozdzie_55_02"); //Tak.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Gwozdzie_15_03"); //W takie badziewie siê nie bawiê. Poszukaj sobie innego durnia, który zrobi ci gwoŸdzie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_Gwozdzie_15_04"); //GWODZIE! Ludzie, ja tu kujê broñ do walki z orkami, a on prosi mnie o GWODZIE!

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
 	description = "Umia³byœ po³¹czyæ te czêœci w ca³oœæ?";
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
	AI_Output (other,self ,"DIA_NASZ_106_Jan_artefakt_15_00"); //Umia³byœ po³¹czyæ te czêœci w ca³oœæ?
	AI_Output (self, other,"DIA_NASZ_106_Jan_artefakt_55_01"); //Chyba tak. Ju¿ dawno nie bawi³em siê pierœcieniami.
	AI_Output (self, other,"DIA_NASZ_106_Jan_artefakt_15_02"); //Za 200 sztuk z³ota zrobiê, o co prosisz.

	B_LogEntry (TOPIC_Niedostepny_Klif, "Za dwieœcie sztuk z³ota Jan z³¹czy kawa³ki artefaktu.");
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
 	description = "Proszê. (200 szt. z³ota)";
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
	AI_Output (other,self ,"DIA_NASZ_106_Jan_artefaktzloto_15_00"); //Proszê.
	B_giveinvitems (other, self, itmi_gold, 200);
	B_giveinvitems (other, self, ItNa_Artefakt_Sila, 1);
	B_giveinvitems (other, self, ItNa_Artefakt_Moc, 1);
	B_giveinvitems (other, self, ItNa_Artefakt_Odpornosc, 1);
	AI_Output (self, other,"DIA_NASZ_106_Jan_artefaktzloto_55_01"); //Wróæ jutro. Pierœcieñ bêdzie gotowy.

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
	description	= 	"Czy pierœcieñ jest gotowy?";
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
	AI_Output			(other, self, "DIA_NASZ_106_Jan_artefaktready_15_00"); //Czy pierœcieñ jest gotowy?
	
	if (Jan_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_01"); //Tak, proszê.

		CreateInvItems (self,ItNa_Artefakt_Caly,1);
		B_giveinvitems (self, other, ItNa_Artefakt_Caly, 1);

	
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_02"); //Mam nadziejê, ¿e ci siê podoba.
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_03"); //Dawno nie pracowa³em z bi¿uteri¹. Musia³em trochê popróbowaæ na innych pierœcieniach, zanim zabra³em siê za twój.
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_04"); //Przypadkiem ukruszy³em go trochê w jednym miejscu, ale za³ata³em to ma³¹ stalow¹ czêœci¹. Ostatecznie jestem zadowolony.
		
		
		B_LogEntry (TOPIC_Niedostepny_Klif, "Jan skoñczy³ amulet. Wygl¹da na to, ¿e moje zadanie skoñczone.");
		JanArtefaktStop = TRUE;
		B_GivePlayerXP (100);
	}
	else
	{	
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_05"); //Nie, jeszcze nie. PrzyjdŸ póŸniej.
		AI_Output			(self, other, "DIA_NASZ_106_Jan_artefaktready_06_06"); //Jeœli bêdziesz mi przeszkadza³, potrwa to d³u¿ej.
		
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
 	description = "Przychodzê odebraæ paczki dla Dobara.";
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
	
	AI_Output (other,self ,"DIA_NASZ_106_Jan_dobar_15_00"); //Przychodzê odebraæ paczki dla Dobara.
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_01"); //Nieczêsto zdarza siê, by przyszed³ ktoœ od Dobara.
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_02"); //Jak na z³oœæ wys³a³em Brutusa dos³ownie kwadrans temu.
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_03"); //Nie minêliœcie siê przypadkiem?
	AI_Output (other,self ,"DIA_NASZ_106_Jan_dobar_15_04"); //Nie.
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_05"); //Nie? Dziwne. Gdzie¿ on polaz³...
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_06"); //Jeœli chcesz mieæ te paczki to musisz go znaleŸæ.
	AI_Output (other,self ,"DIA_NASZ_106_Jan_dobar_15_07"); //A gdzie go szukaæ?
	AI_Output (self, other,"DIA_NASZ_106_Jan_dobar_55_08"); //Zwykle chodzi dooko³a bagna, gór¹. Musisz tam go szukaæ.

	Wld_InsertNpc	(Meatbug,"FP_ROAM_BRUTUS_MEATBUG"); // chrz¹szcz obok bartwego brutusa :)
				
	B_LogEntry (TOPIC_Dobar_paczka, "SpóŸni³em siê. Jan wys³a³ przed chwil¹ swojego goñca. Najprawdopodobniej poszed³ dooko³a bagna, gór¹. Muszê go doœcign¹æ.");
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
 	description = "Brutus nie ¿yje.";
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
	AI_Output (other,self ,"DIA_NASZ_106_Jan_BrutusIsDead_15_00"); //Brutus nie ¿yje.
	AI_Output (self, other,"DIA_NASZ_106_Jan_BrutusIsDead_55_01"); //Co siê sta³o?
	AI_Output (other, self,"DIA_NASZ_106_Jan_BrutusIsDead_55_02"); //Biedak sta³ siê pokarmem dla zwierzyny.
	AI_Output (self, other,"DIA_NASZ_106_Jan_BrutusIsDead_55_03"); //Có¿... To przykra informacja. Brutus by³ dobr¹ osob¹ i œwietnym pomocnikiem. Teraz tworzenie mieczy zajmie mi znacznie d³u¿ej.
	
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
	AI_Output (self, other,"DIA_NASZ_106_Jan_HowAreYou_55_01"); //Jak z deszczu pod rynnê.
	AI_Output (self, other,"DIA_NASZ_106_Jan_HowAreYou_55_02"); //Nie mam czasu na g³upie gadki.
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
	description = "Sk¹d ci przyszed³ do g³owy pomys³, by dawaæ Krug-Kanowi zbrojê z blach paladyna?";
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
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_00"); //Sk¹d ci przyszed³ do g³owy pomys³, by dawaæ Krug-Kanowi zbrojê z blach paladyna?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_01"); //Mieliœmy pozosta³oœci zbroi po renegatach i chcia³em zrobiæ z nich coœ ciekawego. Myœlê, ¿e mi siê to uda³o.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_02"); //Z pewnoœci¹, wygl¹da bardzo interesuj¹co. Nie myœla³eœ nad tym, co powie Keroloth na to? Nie ba³eœ siê?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_03"); //Szczerze? Bardzo i w momencie, kiedy przerabia³em te blachy, co chwilê wraca³a do mnie wyobra¿enie Kerolotha, który mnie publicznie linczuje za pomys³.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_04"); //Ale pomyœl: Zbroja paladyna dopasowana do orka. Nikt na to wczeœniej nie wpad³, bo nie mia³ jak, a tu nadarzy³a siê taka okazja. Nie spróbowa³byœ na moim miejscu?
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_05"); //Rozumiem. Obudzi³a siê w tobie dusza artysty. Ale broni to mu nie chcia³eœ zrobiæ.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_06"); //Bo nie mia³em pomys³u, ale z t¹ zbroj¹... Jedna myœl i ju¿ mia³em ca³y projekt gotowy.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_07"); //No dobrze, ale jak zareagowa³ Keroloth?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_08"); //Kiedy wrêczy³em zbrojê orkowi, wszyscy siê zebrali wokó³ niego i podziwiali moje dzie³o. Nie trzeba by³o czekaæ d³ugo na reakcjê Kerolotha, który wyszed³, popatrzy³ na niego i poszed³.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_09"); //To wszystko?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_10"); //A gdzie tam! Po parunastu minutach znowu wyszed³, stan¹³ przed orkiem i... zasalutowa³ mu, jak paladyn paladynowi.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_11"); //¯artujesz?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_12"); //Nie. Powiedzia³ mu wtedy, ¿e jest bardziej godny noszenia tej zbroi, ni¿ poprzedni w³aœciciele i ma nadziejê, ¿e Krug-Kan udowodni, ¿e jest prawdziwym obroñc¹ ludzkoœci i wiary w Innosa.
	AI_Output (other, self,"DIA_NASZ_106_Jan_KurgKan_15_13"); //I co na to Krug-Kan?
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_14"); //Odpowiedzia³, ¿e ludzkoœæ jest najwa¿niejsze, ale nie jest jeszcze przekonany, co do wiary w Innosa. Myœla³em, ¿e Keroloth wpadnie w furiê, ale on tylko siê uœmiechn¹³ i odszed³.
	AI_Output (self, other,"DIA_NASZ_106_Jan_KurgKan_55_15"); //Nie przyszed³ do mnie póŸniej z pretensjami, ani nic takiego, wiêc mój pomys³ siê uda³ i nie zosta³em za to ukarany.
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

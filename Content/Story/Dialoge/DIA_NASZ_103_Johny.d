//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_NASZ_103_Johny_EXIT   (C_INFO)
{
	npc         = NASZ_103_Johny;
	nr          = 999;
	condition   = DIA_NASZ_103_Johny_EXIT_Condition;
	information = DIA_NASZ_103_Johny_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_NASZ_103_Johny_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_103_Johny_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_NASZ_103_Johny_siema   (C_INFO)
{
	npc         = NASZ_103_Johny;
 	nr          = 1;
 	condition   = DIA_NASZ_103_Johny_siema_Condition;
 	information = DIA_NASZ_103_Johny_siema_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_103_Johny_siema_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_103_Johny_siema_Info()
{
	AI_Output (self, other,"DIA_NASZ_103_Johny_siema_55_00"); //Hej, nowa twarz!
	AI_Output (self, other,"DIA_NASZ_103_Johny_siema_55_01"); //Gdybyœ by³ kiedyœ zainteresowany kupnem orê¿a, to wpadnij do mnie.
	AI_Output (self, other,"DIA_NASZ_103_Johny_siema_55_02"); //Sprzedajê wyroby naszego kowala Jana. Poza standardowym wyposa¿eniem, dobrze jest walczyæ czymœ lepszym ni¿ przeciêtny miecz.

	Log_CreateTopic (TOPIC_LowcyTrader,LOG_NOTE);
	B_LogEntry (TOPIC_LowcyTrader,"Johny sprzedaje wyroby kowala.");
};

//*********************************************************************
//	Info HelloPiosenka 
//*********************************************************************
INSTANCE DIA_NASZ_103_Johny_HelloPiosenka   (C_INFO)
{
	npc         = NASZ_103_Johny;
 	nr          = 1;
 	condition   = DIA_NASZ_103_Johny_HelloPiosenka_Condition;
 	information = DIA_NASZ_103_Johny_HelloPiosenka_Info;
 	permanent   = FALSE;
 	important   = TRUE;
};

FUNC INT DIA_NASZ_103_Johny_HelloPiosenka_Condition()
{
	if (npc_knowsinfo (other, DIA_NASZ_125_Silas_StaraPiosenka)
	&& (Npc_IsInState(self, ZS_TALK)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_103_Johny_HelloPiosenka_Info()
{
	AI_Output (other, self,"DIA_NASZ_103_Johny_HelloPiosenka_55_00"); //Hej, Johny!
	AI_Output (self, other,"DIA_NASZ_103_Johny_HelloPiosenka_55_01"); //Czo³em. Co ciê do mnie sprowadza?
	AI_Output (other, self,"DIA_NASZ_103_Johny_HelloPiosenka_55_02"); //W³aœciwie to przychodzê do ciebie w imieniu Silasa. To prawda, ¿e potrafisz graæ na lutni?
	AI_Output (self, other,"DIA_NASZ_103_Johny_HelloPiosenka_55_03"); //Czy potrafiê? Owszem, posiadam niezgorsze umiejêtnoœci, jednak stanowczo odmawiam. W nocy oczy same mi siê zamykaj¹, a przecie¿ wtedy najbardziej potrzeba muzyka.
	AI_Output (self, other,"DIA_NASZ_103_Johny_HelloPiosenka_55_04"); //Zapytaj Engora. Kiedyœ mówi³ mi, ¿e te¿ potrafi coœ tam graæ.
	AI_Output (other, self,"DIA_NASZ_103_Johny_HelloPiosenka_55_05"); //Dziêki za informacje.
	
	B_LogEntry (TOPIC_Silas_piosenka, "Johny, co prawda, potrafi graæ na lutni, jednak odes³a³ mnie do innego ³owcy orków, Engora.");
};


//*********************************************************************
//	Info Goth
//*********************************************************************
INSTANCE DIA_NASZ_103_Johny_goth   (C_INFO)
{
	npc         = NASZ_103_Johny;
 	nr          = 2;
 	condition   = DIA_NASZ_103_Johny_goth_Condition;
 	information = DIA_NASZ_103_Johny_goth_Info;
 	permanent   = FALSE;
	description = "Ponoæ któryœ z ³owców orków okrad³ myœliwych.";
};

FUNC INT DIA_NASZ_103_Johny_goth_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_214_Goth_zadanie))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_103_Johny_goth_Info()
{
	AI_Output (other, self,"DIA_NASZ_103_Johny_goth_15_00"); //Ponoæ któryœ z ³owców orków okrad³ myœliwych.
	AI_Output (self, other,"DIA_NASZ_103_Johny_goth_55_01"); //Doprawdy? To by wyjaœnia³o, sk¹d mam t¹ dziwn¹ paczkê z mieczami...
	AI_Output (self, other,"DIA_NASZ_103_Johny_goth_55_02"); //Ktoœ podrzuci³ mi j¹ kilka dni temu.

	B_LogEntry (TOPIC_Goth_kradziez, "Handlarz Johny jest w posiadaniu paczki mieczy jednorêcznych.");

};

//*********************************************************************
//	Info Paczka
//*********************************************************************
var int johny_paczka_gold;
INSTANCE DIA_NASZ_103_Johny_paczka   (C_INFO)
{
	npc         = NASZ_103_Johny;
 	nr          = 4;
 	condition   = DIA_NASZ_103_Johny_paczka_Condition;
 	information = DIA_NASZ_103_Johny_paczka_Info;
 	permanent   = FALSE;
	description = "Dasz mi tê paczkê?";
};

FUNC INT DIA_NASZ_103_Johny_paczka_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_103_Johny_goth))
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_103_Johny_paczka_Info()
{
	AI_Output (other, self,"DIA_NASZ_103_Johny_paczka_15_00"); //Dasz mi tê paczkê?
	AI_Output (self, other,"DIA_NASZ_103_Johny_paczka_55_01"); //Mówi siê: Znalezione, nie kradzione. Nie myœlisz chyba, ¿e oddam ci j¹ za darmo.
	AI_Output (self, other,"DIA_NASZ_103_Johny_paczka_15_02"); //W œrodku znajduje siê kilka wartoœciowych mieczy i móg³bym nieŸle zarobiæ, gdyby któryœ z ³owców zechcia³ wymieniæ broñ.
	AI_Output (other, self,"DIA_NASZ_103_Johny_paczka_55_03"); //W takim razie, ile za ni¹ chcesz?
	AI_Output (self, other,"DIA_NASZ_103_Johny_paczka_15_04"); //Osiemdziesi¹t sztuk z³ota.
	
	Info_ClearChoices (DIA_NASZ_103_Johny_paczka);
		Info_AddChoice	  (DIA_NASZ_103_Johny_paczka, "Myœlê, ¿e nie chcia³byœ, by z twoich zapasów coœ zniknê³o.", DIA_NASZ_103_Johny_paczka_znika);	
		Info_AddChoice	  (DIA_NASZ_103_Johny_paczka, "Zgoda, to uczciwa cena.", DIA_NASZ_103_Johny_paczka_80);
};


FUNC VOID DIA_NASZ_103_Johny_paczka_znika()
{
	AI_Output (other,self ,"DIA_NASZ_103_Johny_paczka_znika_15_00"); //Myœlê, ¿e nie chcia³byœ, by z twoich zapasów coœ zniknê³o.
	AI_Output (self, other,"DIA_NASZ_103_Johny_paczka_znika_55_01"); //Czy ty mi grozisz? Wiesz, ¿e Keroloth nie cierpi z³odziejów.
	AI_Output (other, self,"DIA_NASZ_103_Johny_paczka_znika_55_02"); //W takim razie zastanów siê: Co myœli o zwracaniu ukradzionych rzeczy? Chyba nie chcesz, ¿eby dowiedzia³ siê, ¿e œwiadomie zatrzymujesz rzeczy nienale¿¹ce do ciebie?
	AI_Output (self, other,"DIA_NASZ_103_Johny_paczka_znika_55_03"); //Raczej nie... Niech ci bêdzie, odsprzedam paczkê za trzydzieœci sztuk z³ota. Ale móg³byœ postawiæ mi chocia¿ za to dobre piwo!
	
	Info_ClearChoices (DIA_NASZ_103_Johny_paczka);

		if(npc_hasitems(other,ItFo_Beer)>=1) {
			Info_AddChoice	  (DIA_NASZ_103_Johny_paczka, "Umowa stoi. Zimne piwo dla ciebie! (30 szt. z³ota)", DIA_NASZ_103_Johny_paczka_30);	
		};
		Info_AddChoice	  (DIA_NASZ_103_Johny_paczka, "Chyba siê nie zrozumieliœmy...", DIA_NASZ_103_Johny_paczka_50);	
};

FUNC VOID DIA_NASZ_103_Johny_paczka_80()
{
	AI_Output (other,self ,"DIA_NASZ_103_Johny_paczka_80_15_00"); //Zgoda, to uczciwa cena.

	johny_paczka_gold = 80;
	Info_ClearChoices (DIA_NASZ_103_Johny_paczka);
};

FUNC VOID DIA_NASZ_103_Johny_paczka_30()
{
	AI_Output (other,self ,"DIA_NASZ_103_Johny_paczka_30_15_00"); //Umowa stoi. Zimne piwo dla ciebie!
	
	B_GiveInvItems (other, self, ItFo_Beer, 1);
	B_GiveInvItems (other, self, ItMi_Gold, 30);
	
	AI_Output (self, other,"DIA_NASZ_103_Johny_paczka_30_55_01"); //Za resztê z³ota kupiê sobie jeszcze kilka wieczorem.
	johny_paczka_gold = 30;
	Info_ClearChoices (DIA_NASZ_103_Johny_paczka);
};

FUNC VOID DIA_NASZ_103_Johny_paczka_50()
{
	AI_Output (other,self ,"DIA_NASZ_103_Johny_paczka_50_15_00"); //Chyba siê nie zrozumieliœmy...
	AI_Output (self, other,"DIA_NASZ_103_Johny_paczka_50_55_01"); //Nie zrozumieliœmy? Jeœli nie chcesz dojœæ ze mn¹ do zgody, to twój problem. Keroloth ju¿ nie jest takim honorowym rycerzem, jak niegdyœ.
	AI_Output (self, other,"DIA_NASZ_103_Johny_paczka_50_55_02"); //Mo¿esz mu opowiedzieæ o tej sytuacji, ale zapewniam ciê, ¿e stanie po mojej stronie. Piêædziesi¹t sztuk z³ota to moja ostateczna oferta.

	johny_paczka_gold = 50;
	Info_ClearChoices (DIA_NASZ_103_Johny_paczka);
};

//*********************************************************************
//	Info KupPaczke
//*********************************************************************

var int Johny_KupPaczke_Dane;
INSTANCE DIA_NASZ_103_Johny_KupPaczke   (C_INFO)
{
	npc         = NASZ_103_Johny;
 	nr          = 4;
 	condition   = DIA_NASZ_103_Johny_KupPaczke_Condition;
 	information = DIA_NASZ_103_Johny_KupPaczke_Info;
 	permanent   = TRUE;
	description = "Sprzedaj mi paczkê.";
};

FUNC INT DIA_NASZ_103_Johny_KupPaczke_Condition()	
{
	if (npc_knowsinfo (other, DIA_NASZ_103_Johny_paczka))
	&& (npc_hasitems (other,ItMi_Gold) >= johny_paczka_gold)
	&& (Johny_KupPaczke_Dane == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_103_Johny_KupPaczke_Info()
{
	AI_Output (other, self,"DIA_NASZ_103_Johny_KupPaczke_15_00"); //Sprzedaj mi paczkê.
	B_GiveInvItems (other, self, ItMi_Gold, johny_paczka_gold);
	AI_Output (self, other,"DIA_NASZ_103_Johny_KupPaczke_55_01"); //Proszê bardzo. Oddaj j¹ w³aœcicielowi.

	Johny_KupPaczke_Dane = TRUE;

	Createinvitems (self, ItNa_PaczkaGoth, 1);
	B_GiveInvItems (self, other, ItNa_PaczkaGoth, 1);
	B_LogEntry (TOPIC_Goth_kradziez, "Kupi³em paczkê mieczy. Jeden k³opot ju¿ z g³owy.");
	
};

//*********************************************************************
//	Info DostaneMiecz
//*********************************************************************
INSTANCE DIA_NASZ_103_Johny_DostaneMiecz   (C_INFO)
{
	npc         = NASZ_103_Johny;
 	nr          = 4;
 	condition   = DIA_NASZ_103_Johny_DostaneMiecz_Condition;
 	information = DIA_NASZ_103_Johny_DostaneMiecz_Info;
 	permanent   = FALSE;
	description = "Keroloth powiedzia³, ¿e dostanê miecz.";
};

FUNC INT DIA_NASZ_103_Johny_DostaneMiecz_Condition()	
{
	if (hero.guild == GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_103_Johny_DostaneMiecz_Info()
{
	AI_Output (other, self,"DIA_NASZ_103_Johny_DostaneMiecz_15_00"); //Keroloth powiedzia³, ¿e dostanê miecz.
	AI_Output (self, other,"DIA_NASZ_103_Johny_DostaneMiecz_55_01"); //Tak. Ten jest dla ciebie. Tylko nie stêp go zbyt szybko!

	Createinvitems(self,ItNa_Djg_Weapon_L,1);
	B_GiveInvItems (self, other, ItNa_Djg_Weapon_L, 1);
	
};

//*********************************************************************
//	Info Towary
//*********************************************************************
INSTANCE DIA_NASZ_103_Johny_towary   (C_INFO)
{
	npc         = NASZ_103_Johny;
 	nr          = 5;
 	condition   = DIA_NASZ_103_Johny_towary_Condition;
 	information = DIA_NASZ_103_Johny_towary_Info;
 	permanent   = TRUE;
	trade       = TRUE;
 	description = "Poka¿ mi swoje towary.";
};

FUNC INT DIA_NASZ_103_Johny_towary_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NASZ_103_Johny_towary_Info()
{
	AI_Output (other, self,"DIA_NASZ_103_Johny_towary_15_00"); //Poka¿ mi swoje towary.
	AI_Output (self, other,"DIA_NASZ_103_Johny_towary_55_01"); //Do us³ug.
	B_GiveTradeInv (self);
};

INSTANCE DIA_NASZ_103_Johny_KurgKan   (C_INFO)
{
	npc         = NASZ_103_Johny;
	nr          = 999;
	condition   = DIA_NASZ_103_Johny_KurgKan_Condition;
	information = DIA_NASZ_103_Johny_KurgKan_Info;
	important 	= true;
};

FUNC INT DIA_NASZ_103_Johny_KurgKan_Condition()
{
	if(KurgKanFollowPC)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NASZ_103_Johny_KurgKan_Info()
{
	AI_Output (self, other,"DIA_NASZ_103_Johny_KurgKan_15_00"); //Narzeka³em ostatnio na nudê, ale to jest chyba przesada.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_NASZ_103_Johny_PICKPOCKET (C_INFO)
{
	npc			= NASZ_103_Johny;
	nr			= 900;
	condition	= DIA_NASZ_103_Johny_PICKPOCKET_Condition;
	information	= DIA_NASZ_103_Johny_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20; // 20|40|60|80|100|120
};                       

FUNC INT DIA_NASZ_103_Johny_PICKPOCKET_Condition()
{
	C_Beklauen (16);
};
 
FUNC VOID DIA_NASZ_103_Johny_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_NASZ_103_Johny_PICKPOCKET);
	Info_AddChoice		(DIA_NASZ_103_Johny_PICKPOCKET, DIALOG_BACK 		,DIA_NASZ_103_Johny_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_NASZ_103_Johny_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_NASZ_103_Johny_PICKPOCKET_DoIt);
};

func void DIA_NASZ_103_Johny_PICKPOCKET_DoIt()
{
	// TODO przetestowac czy dziala dobrze
	B_BeklauenThings (ItNa_HuntAmulet, 1);
	
	if (other.attribute[ATR_DEXTERITY] < 16) {
		Log_SetTopicStatus (TOPIC_Hunt_amulet, LOG_FAILED);
		B_LogEntry (TOPIC_Hunt_amulet, "Johny nakry³ mnie na kradzie¿y.");
	};
	
	Info_ClearChoices (DIA_NASZ_103_Johny_PICKPOCKET);
};
	
func void DIA_NASZ_103_Johny_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_NASZ_103_Johny_PICKPOCKET);
};